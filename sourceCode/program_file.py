#-----------------------------------------------------------------
# remove_goto
#
# Removing Break,Continue  and  rewriting AST
#
# September 22 2016, Pritom Rajkhowa
# Project: VIAP
#-----------------------------------------------------------------
import sys

from pycparser import parse_file,c_parser, c_ast, c_generator



new_variable={}


"""

#Member Method Class
#Plain Python object to store Information about Member Method of a Java Class 
"""
class membermethodclass(object):
 	def __init__(self, methodname, returnType , inputvar, localvar, body, usedCounter, serialNo):
        	self.methodname = methodname
        	self.inputvar = inputvar
        	self.returnType = returnType
        	self.localvar = localvar
        	self.body = body
        	self.usedCounter = usedCounter
        	self.serialNo = serialNo
        def getMethodname(self):
        	return self.methodname
        def getreturnType(self):
        	return self.returnType
        def getInputvar(self):
        	return self.inputvar
        def getLocalvar(self):
        	return self.localvar
        def getBody(self):
		return self.body
	def getUsedCounter(self):
		return self.usedCounter
	def getSerialNo(self):
		return self.serialNo
	def setInputvar(self, inputvar):
	        self.inputvar=inputvar
	def setLocalvar(self, localvar):
	        self.localvar=localvar
	def setBody(self, body):
		self.body=body
	def setUsedCounter(self, usedCounter):
		self.usedCounter=usedCounter
	def setSerialNo(self, serialNo):
		self.serialNo=serialNo
	

"""

#Variable Class 

#Plain Python Object to store information about variable

"""
class variableclass(object):
	def __init__(self, variablename, variableType, modifiers, dimensions, initialvalue):
        	self.variablename = variablename
        	self.variableType = variableType
        	self.modifiers = modifiers
        	self.dimensions = dimensions
        	self.initialvalue = initialvalue
	def getVariablename(self):
		return self.variablename
	def getVariableType(self):
		return self.variableType
	def getModifiers(self):
		return self.modifiers
	def getDimensions(self):
		return self.dimensions
	def getInitialvalue(self):
		return self.initialvalue


#Get All Variables


def getVariables(function_body):
    localvarmap={}
    for decl in function_body.block_items:
        if type(decl) is c_ast.Decl:
            var_type=None
            initial_value=None
            for child in decl.children():
                if type(child[1].type) is c_ast.IdentifierType:
                    var_type=child[1].type.names[0]
		else:
                    initial_value=child[1].value
            variable=variableclass(decl.name, var_type,None,None,initial_value)
            localvarmap[decl.name]=variable
    return localvarmap



    

def construct_program(filename):
    content=None
    global new_variable
    with open(filename) as f:
        content = f.read()
    content=content.replace('\r','')
    text = r""" """+content
    parser = c_parser.CParser()
    ast = parser.parse(text) 
    externalvarmap={}
    functionvarmap={}
    counter=0
    for e in ast.ext:
    	if type(e) is c_ast.Decl:
    		if type(e.type) is c_ast.FuncDecl:
    			parametermap={}
			function_decl=e
    			if function_decl.type.args is not None:
				for param_decl in function_decl.type.args.params:
			    		variable=variableclass(param_decl.name, param_decl.type.type.names[0],None,None,None)
			    		parametermap[param_decl.name]=variable
			membermethod=membermethodclass(function_decl.name,function_decl.type.type.type.names[0],parametermap,None,None,0,0)
			functionvarmap[membermethod.getMethodname()]=membermethod
    		elif type(e.type) is c_ast.TypeDecl:
            		var_type=None
            		initial_value=None
            		for child in e.children():
                		if type(child[1].type) is c_ast.IdentifierType:
                    			var_type=child[1].type.names[0]
				else:
                    			initial_value=child[1].value
            		variable=variableclass(e.name, var_type,None,None,initial_value)
            		externalvarmap[e.name]=variable
    	else:
    		if type(e) is c_ast.FuncDef:
    			parametermap={}
    			function_decl=e.decl
    			function_body = e.body
    			localvarmap=getVariables(function_body)
    			counter=counter+1
    			if function_decl.type.args is not None:
				for param_decl in function_decl.type.args.params:
					variable=variableclass(param_decl.name, param_decl.type.type.names[0],None,None,None)
			    		parametermap[param_decl.name]=variable
    			if function_decl.name in functionvarmap.keys():
				membermethod=membermethodclass(function_decl.name,function_decl.type.type.type.names[0],parametermap,localvarmap,function_body,0,counter)
				functionvarmap[function_decl.name]=membermethod
			else:
				if function_decl.type.args is not None:
					for param_decl in function_decl.type.args.params:
						variable=variableclass(param_decl.name, param_decl.type.type.names[0],None,None,None)
						parametermap[param_decl.name]=variable
				membermethod=membermethodclass(function_decl.name,function_decl.type.type.type.names[0],parametermap,localvarmap,function_body,0,counter)
				functionvarmap[membermethod.getMethodname()]=membermethod
    
    print 'Globle Variable'
    var_list="{"
    for x in externalvarmap:
    	if externalvarmap[x].getDimensions()>0:
        	var_list+=' '+x+':array'
    	else:
        	var_list+=' '+x+':'+externalvarmap[x].getVariableType()
    var_list+='}'
    print var_list
    for medthod in functionvarmap.keys():
    	membermethod=functionvarmap[medthod]
    	body=membermethod.getBody()
    	if body is not None:
    		new_variable={}
    		update_statements=[]
    	    	statements=substituteFunBlock(body.block_items,functionvarmap)
    	    	
    	    	for var in new_variable.keys():
		    	temp=c_ast.Decl(name=var, quals=[], storage=[], funcspec=[], type=c_ast.TypeDecl(declname=var, quals=[], type=c_ast.IdentifierType(names=['int'])), init=c_ast.Constant(type='int', value='0'), bitsize=None)
    			update_statements.append(temp)
    	    	for statement in statements:
    			update_statements.append(statement)
	    	body_comp = c_ast.Compound(block_items=update_statements)
    		membermethod.setBody(body_comp)
    		localvarmap=getVariables(body_comp)
    		membermethod.setLocalvar(localvarmap)
                print "Function Name:"
                print membermethod.getMethodname()
                print "Return Type:"
                print membermethod.getreturnType()
                print "Input Variables:"
                var_list="{"
                for x in membermethod.getInputvar():
                        if membermethod.getInputvar()[x].getDimensions()>0:
                                var_list+=' '+x+':array'
                        else:
                                var_list+=' '+x+':'+membermethod.getInputvar()[x].getVariableType()
                var_list+='}'
                print var_list
                print "Local Variables:"
                var_list="{"
                for x in membermethod.getLocalvar():
                        if membermethod.getLocalvar()[x].getDimensions()>0:
                                var_list+=' '+x+':array'
                        else:
                                var_list+=' '+x+':'+membermethod.getLocalvar()[x].getVariableType()
                var_list+='}'
                print var_list
                print 'Function Body'
    		generator = c_generator.CGenerator()   
    		#print(generator.visit(body))
    		membermethod=functionvarmap[medthod]
    		print(generator.visit(membermethod.getBody()))

    				


def substituteFunBlock(statements,functionvarmap):
	update_statements=[]
	global new_variable
	for statement in statements:
		if type(statement) is c_ast.FuncCall:
			membermethod=functionvarmap[statement.name.name]
			in_var_map=membermethod.getInputvar().keys()
			count=membermethod.getUsedCounter()
			count=count+1
			membermethod.setUsedCounter(count)
			for x in range(0, len(statement.args.exprs)):
				arg=statement.args.exprs
				update_statements.append(c_ast.Assignment(op='=',lvalue=c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+in_var_map[x]),rvalue=c_ast.ID(name=arg[x].name)))
			new_blocks=reconstructStmtBlock(membermethod.getBody().block_items,count,membermethod.getLocalvar(),membermethod.getInputvar(),membermethod.getSerialNo())
			for x in membermethod.getInputvar():
				if membermethod.getInputvar()[x].getDimensions()>0:
			        	new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]='array'
			        else:
                                	new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]=membermethod.getInputvar()[x].getVariableType()
				
			for x in membermethod.getLocalvar():
				if membermethod.getLocalvar()[x].getDimensions()>0:
					new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]='array'
				else:
                                	new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]=membermethod.getLocalvar()[x].getVariableType()
			
			for stmt in new_blocks:
				update_statements.append(stmt)
		elif type(statement) is c_ast.Assignment:
			new_statement,new_block=substituteFun(statement.rvalue,functionvarmap)
			if new_block is not None and len(new_block)>0:
				for stmt in new_block:
					update_statements.append(stmt)
			update_statements.append(c_ast.Assignment(op='=',lvalue=statement.lvalue,rvalue=new_statement))
		elif type(statement) is c_ast.While:
			statement.cond,new_block=substituteFun(statement.cond,functionvarmap)
			if new_block is not None and len(new_block)>0:
				for stmt in new_block:
					update_statements.append(stmt)
			temp_new_block=substituteFunBlock(statement.stmt.block_items,functionvarmap)
			for stmt in new_block:
				temp_new_block.append(stmt)
			update_statements.append(c_ast.While(cond=statement.cond,stmt=c_ast.Compound(block_items=temp_new_block)))	
		elif type(statement) is c_ast.If:
			statement,new_block=substituteFunBlockIf(statement,functionvarmap)
			if new_block is not None and len(new_block)>0:
				for stmt in new_block:
					update_statements.append(stmt)
			update_statements.append(statement)
		else:
			update_statements.append(statement)
	return update_statements



def substituteFunBlockIf(statement,functionvarmap):
	new_iftrue=None
	new_iffalse=None
	update_statements=None
	if type(statement) is c_ast.If:
		statement.cond,new_block=substituteFun(statement.cond,functionvarmap)
		if new_block is not None and len(new_block)>0:
			update_statements=[]
			for stmt in new_block:
				update_statements.append(stmt)
		if type(statement.iftrue) is c_ast.Compound:
			new_iftrue=c_ast.Compound(block_items=substituteFunBlock(statement.iftrue.block_items,functionvarmap))
		else:
			new_iftrue=statement.iftrue
		if type(statement.iffalse) is c_ast.Compound:
			new_iffalse=c_ast.Compound(block_items=substituteFunBlock(statement.iffalse.block_items,functionvarmap))
		else:
			if type(statement.iffalse) is c_ast.If:
				statement.iffalse,new_block =substituteFunBlockIf(statement.iffalse,functionvarmap)
				if new_block is not None and len(new_block)>0:
					if update_statements is None:
						update_statements=[]
					for stmt in new_block:
						update_statements.append(stmt)
				new_iffalse=statement.iffalse
	return c_ast.If(cond=statement.cond, iftrue=new_iftrue, iffalse=new_iffalse),update_statements



def substituteFun(statement,functionvarmap):
	new_block=None
	
	global new_variable
	
	if type(statement) is c_ast.ID:
                return c_ast.ID(name=statement.name),new_block
        elif type(statement) is c_ast.Constant:
                return c_ast.Constant(type='int',value=statement.value),new_block
        elif type(statement) is c_ast.FuncCall:
                update_statements=[]
 		membermethod=functionvarmap[statement.name.name]
		in_var_map=membermethod.getInputvar().keys()
		count=membermethod.getUsedCounter()
		count=count+1
		membermethod.setUsedCounter(count)
		for x in range(0, len(statement.args.exprs)):
                        arg=statement.args.exprs
			update_statements.append(c_ast.Assignment(op='=',lvalue=c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+in_var_map[x]),rvalue=c_ast.ID(name=arg[x].name)))
		new_blocks=reconstructStmtBlock(membermethod.getBody().block_items,count,membermethod.getLocalvar(),membermethod.getInputvar())
		
		for x in membermethod.getInputvar():
			if membermethod.getInputvar()[x].getDimensions()>0:
				new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]='array'
			else:
                                new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]=membermethod.getInputvar()[x].getVariableType()
				
		for x in membermethod.getLocalvar():
			if membermethod.getLocalvar()[x].getDimensions()>0:
				new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]='array'
			else:
                                new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]=membermethod.getLocalvar()[x].getVariableType()
		
		
		for stmt in new_blocks:
			update_statements.append(stmt)
 		
 		return c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+'result'),update_statements	
 	elif type(statement) is c_ast.BinaryOp:
 		if type(statement.left) is c_ast.ID and type(statement.right) is c_ast.ID:
 		
 			return c_ast.BinaryOp(op=statement.op,left=statement.left, right=statement.right),new_block
 			
 		elif type(statement.left) is c_ast.ID and type(statement.right) is c_ast.BinaryOp:
                                               
                        stmt_right,new_block=substituteFun(statement.right,functionvarmap)

 			return c_ast.BinaryOp(op=statement.op,left=statement.left, right=stmt_right),new_block
 			
 		elif type(statement.left) is c_ast.BinaryOp and type(statement.right) is c_ast.ID:
 			
                        stmt_left,new_block=substituteFun(statement.left,functionvarmap)
                        
 			return c_ast.BinaryOp(op=statement.op,left=stmt_left, right=statement.right),new_block
 			
 		elif type(statement.left) is c_ast.Constant and type(statement.right) is c_ast.Constant:
 		
 			return c_ast.BinaryOp(op=statement.op,left=statement.left, right=statement.right),new_block
 			
 		elif type(statement.left) is c_ast.Constant and type(statement.right) is c_ast.ID:

 			return c_ast.BinaryOp(op=statement.op,left=statement.left, right=statement.right),new_block
 			
 		elif type(statement.left) is c_ast.ID and type(statement.right) is c_ast.Constant:
 		
 			return c_ast.BinaryOp(op=statement.op,left=statement.left, right=statement.right),new_block
 			
 		elif type(statement.left) is c_ast.Constant and type(statement.right) is c_ast.BinaryOp:

                        stmt_right,new_block=substituteFun(statement.right,functionvarmap)
                        
 			return c_ast.BinaryOp(op=statement.op,left=statement.left, right=stmt_right),new_block
 			
 		elif type(statement.left) is c_ast.BinaryOp and type(statement.right) is c_ast.Constant:

                        stmt_left,new_block=substituteFun(statement.left,functionvarmap)
 		
 			return c_ast.BinaryOp(op=statement.op,left=stmt_left, right=statement.right),new_block
 			
 		elif type(statement.left) is c_ast.BinaryOp and type(statement.right) is c_ast.BinaryOp:

                        stmt_left,new_block1=substituteFun(statement.left,functionvarmap)

                        stmt_right,new_block2=substituteFun(statement.right,functionvarmap)

                        if new_block1 is not None and new_block2 is None:
 		
                                return c_ast.BinaryOp(op=statement.op,left=stmt_left, right=stmt_right),new_block1

                        elif new_block1 is None and new_block2 is not None:

                                return c_ast.BinaryOp(op=statement.op,left=stmt_left, right=stmt_right),new_block2
                        else:
                                new_block=[]
                                for stmt in new_blocks1:
                                        new_block.append(stmt)
                                for stmt in new_blocks2:
                                        new_block.append(stmt)
                                return c_ast.BinaryOp(op=statement.op,left=stmt_left, right=stmt_right),new_block
 		
  		elif type(statement.left) is c_ast.FuncCall and type(statement.right) is c_ast.BinaryOp:
 		 	update_statements=[]
		 	membermethod=functionvarmap[statement.left.name.name]
			in_var_map=membermethod.getInputvar().keys()
			count=membermethod.getUsedCounter()
			count=count+1
			membermethod.setUsedCounter(count)
			for x in range(0, len(statement.left.args.exprs)):
				arg=statement.left.args.exprs
				#update_statements.append(c_ast.Assignment(op='=',lvalue=c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+arg[x].name),rvalue=c_ast.ID(name=in_var_map[x])))
				update_statements.append(c_ast.Assignment(op='=',lvalue=c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+in_var_map[x]),rvalue=c_ast.ID(name=arg[x].name)))
			new_blocks=reconstructStmtBlock(membermethod.getBody().block_items,count,membermethod.getLocalvar(),membermethod.getInputvar(),membermethod.getSerialNo())
			for stmt in new_blocks:
				update_statements.append(stmt)
				
				
				
			for x in membermethod.getInputvar():
				if membermethod.getInputvar()[x].getDimensions()>0:
					new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]='array'
				else:
                                	new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]=membermethod.getInputvar()[x].getVariableType()
				
			for x in membermethod.getLocalvar():
				if membermethod.getLocalvar()[x].getDimensions()>0:
					new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]='array'
				else:
                                	new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]=membermethod.getLocalvar()[x].getVariableType()
					
			
			
			
			
			stmt_right,new_block1=substituteFun(statement.right,functionvarmap)
			if new_block1 is not None:
				for stmt in new_block1:
					update_statements.append(stmt)
				
 			return c_ast.BinaryOp(op=statement.op,left=c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_result'), right=stmt_right),update_statements			
 		
 		
 		elif type(statement.left) is c_ast.BinaryOp and type(statement.right) is c_ast.FuncCall:
 		 	update_statements=[]
		 	stmt_left,new_block1=substituteFun(statement.left,functionvarmap)
		 	if new_block1 is not None:
		 		for stmt in new_block1:
					update_statements.append(stmt)
		 	membermethod=functionvarmap[statement.right.name.name]
			in_var_map=membermethod.getInputvar().keys()
			count=membermethod.getUsedCounter()
			count=count+1
			membermethod.setUsedCounter(count)
			for x in range(0, len(statement.right.args.exprs)):
				arg=statement.right.args.exprs
				#update_statements.append(c_ast.Assignment(op='=',lvalue=c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+arg[x].name),rvalue=c_ast.ID(name=in_var_map[x])))
				update_statements.append(c_ast.Assignment(op='=',lvalue=c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+in_var_map[x]),rvalue=c_ast.ID(name=arg[x].name)))
			new_blocks=reconstructStmtBlock(membermethod.getBody().block_items,count,membermethod.getLocalvar(),membermethod.getInputvar(),membermethod.getSerialNo())
			
			for x in membermethod.getInputvar():
				if membermethod.getInputvar()[x].getDimensions()>0:
					new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]='array'
				else:
                                	new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]=membermethod.getInputvar()[x].getVariableType()
				
			for x in membermethod.getLocalvar():
				if membermethod.getLocalvar()[x].getDimensions()>0:
					new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]='array'
				else:
                                	new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]=membermethod.getLocalvar()[x].getVariableType()
					
			
			for stmt in new_blocks:
				update_statements.append(stmt)
 			return c_ast.BinaryOp(op=statement.op,left=stmt_left, right=c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_result')),update_statements	
 			
 		elif type(statement.left) is c_ast.ID and type(statement.right) is c_ast.FuncCall:
 			update_statements=[]
 			membermethod=functionvarmap[statement.right.name.name]
			in_var_map=membermethod.getInputvar().keys()
			count=membermethod.getUsedCounter()
			count=count+1
			membermethod.setUsedCounter(count)
			for x in range(0, len(statement.right.args.exprs)):
				arg=statement.right.args.exprs
				#update_statements.append(c_ast.Assignment(op='=',lvalue=c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+arg[x].name),rvalue=c_ast.ID(name=in_var_map[x])))
				update_statements.append(c_ast.Assignment(op='=',lvalue=c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+in_var_map[x]),rvalue=c_ast.ID(name=arg[x].name)))
			new_blocks=reconstructStmtBlock(membermethod.getBody().block_items,count,membermethod.getLocalvar(),membermethod.getInputvar(),membermethod.getSerialNo())
			
			for x in membermethod.getInputvar():
				if membermethod.getInputvar()[x].getDimensions()>0:
					new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]='array'
				else:
                                	new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]=membermethod.getInputvar()[x].getVariableType()
				
			for x in membermethod.getLocalvar():
				if membermethod.getLocalvar()[x].getDimensions()>0:
					new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]='array'
				else:
                                	new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]=membermethod.getLocalvar()[x].getVariableType()
								
			
			for stmt in new_blocks:
				update_statements.append(stmt)
 		
 			return c_ast.BinaryOp(op=statement.op,left=statement.left, right=c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_result')),update_statements	
 		
 		elif type(statement.left) is c_ast.FuncCall and type(statement.right) is c_ast.ID :
			update_statements=[]
		 	membermethod=functionvarmap[statement.left.name.name]
			in_var_map=membermethod.getInputvar().keys()
			count=membermethod.getUsedCounter()
			count=count+1
			membermethod.setUsedCounter(count)
			for x in range(0, len(statement.left.args.exprs)):
				arg=statement.left.args.exprs
				#update_statements.append(c_ast.Assignment(op='=',lvalue=c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+arg[x].name),rvalue=c_ast.ID(name=in_var_map[x])))
				update_statements.append(c_ast.Assignment(op='=',lvalue=c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+in_var_map[x]),rvalue=c_ast.ID(name=arg[x].name)))
			new_blocks=reconstructStmtBlock(membermethod.getBody().block_items,count,membermethod.getLocalvar(),membermethod.getInputvar(),membermethod.getSerialNo())
			
			for x in membermethod.getInputvar():
				if membermethod.getInputvar()[x].getDimensions()>0:
					new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]='array'
				else:
                                	new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]=membermethod.getInputvar()[x].getVariableType()
				
			for x in membermethod.getLocalvar():
				if membermethod.getLocalvar()[x].getDimensions()>0:
					new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]='array'
				else:
                                	new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]=membermethod.getLocalvar()[x].getVariableType()
					
			
			for stmt in new_blocks:
				update_statements.append(stmt)
		 		
 			return c_ast.BinaryOp(op=statement.op,left=c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_result'), right=statement.right),update_statements	
 		
 		elif type(statement.left) is c_ast.Constant and type(statement.right) is c_ast.FuncCall:
		 	update_statements=[]
		 	membermethod=functionvarmap[statement.right.name.name]
			in_var_map=membermethod.getInputvar().keys()
			count=membermethod.getUsedCounter()
			count=count+1
			membermethod.setUsedCounter(count)
			for x in range(0, len(statement.right.args.exprs)):
				arg=statement.right.args.exprs
				#update_statements.append(c_ast.Assignment(op='=',lvalue=c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+arg[x].name),rvalue=c_ast.ID(name=in_var_map[x])))
				update_statements.append(c_ast.Assignment(op='=',lvalue=c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+in_var_map[x]),rvalue=c_ast.ID(name=arg[x].name)))
			new_blocks=reconstructStmtBlock(membermethod.getBody().block_items,count,membermethod.getLocalvar(),membermethod.getInputvar(),membermethod.getSerialNo())
			
			for x in membermethod.getInputvar():
				if membermethod.getInputvar()[x].getDimensions()>0:
					new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]='array'
				else:
                                	new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]=membermethod.getInputvar()[x].getVariableType()
				
			for x in membermethod.getLocalvar():
				if membermethod.getLocalvar()[x].getDimensions()>0:
					new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]='array'
				else:
                                	new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]=membermethod.getLocalvar()[x].getVariableType()
					
			
			for stmt in new_blocks:
				update_statements.append(stmt)
		 		
		 	return c_ast.BinaryOp(op=statement.op,left=statement.left, right=c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_result')),update_statements	
		 		
		elif type(statement.left) is c_ast.FuncCall and type(statement.right) is c_ast.Constant :
			update_statements=[]
			membermethod=functionvarmap[statement.left.name.name]
			in_var_map=membermethod.getInputvar().keys()
			count=membermethod.getUsedCounter()
			count=count+1
			membermethod.setUsedCounter(count)
			for x in range(0, len(statement.left.args.exprs)):
				arg=statement.left.args.exprs
				#update_statements.append(c_ast.Assignment(op='=',lvalue=c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+arg[x].name),rvalue=c_ast.ID(name=in_var_map[x])))
				update_statements.append(c_ast.Assignment(op='=',lvalue=c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+in_var_map[x]),rvalue=c_ast.ID(name=arg[x].name)))
			new_blocks=reconstructStmtBlock(membermethod.getBody().block_items,count,membermethod.getLocalvar(),membermethod.getInputvar(),membermethod.getSerialNo())
			
			for x in membermethod.getInputvar():
				if membermethod.getInputvar()[x].getDimensions()>0:
					new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]='array'
				else:
                                	new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]=membermethod.getInputvar()[x].getVariableType()
				
			for x in membermethod.getLocalvar():
				if membermethod.getLocalvar()[x].getDimensions()>0:
					new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]='array'
				else:
                                	new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]=membermethod.getLocalvar()[x].getVariableType()
					
			
			for stmt in new_blocks:
				update_statements.append(stmt)
				 		
 			return c_ast.BinaryOp(op=statement.op,left=c_ast.ID(name='t_'+str(count)+'_result'), right=statement.right),update_statements	
 		
 		elif type(statement.left) is c_ast.FuncCall and type(statement.right) is c_ast.FuncCall:
		 	update_statements=[]
		 	
		 	membermethod=functionvarmap[statement.left.name.name]
			in_var_map=membermethod.getInputvar().keys()
			count=membermethod.getUsedCounter()
			count=count+1
			membermethod.setUsedCounter(count)
			for x in range(0, len(statement.left.args.exprs)):
				arg=statement.left.args.exprs
				#update_statements.append(c_ast.Assignment(op='=',lvalue=c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+arg[x].name),rvalue=c_ast.ID(name=in_var_map[x])))
				update_statements.append(c_ast.Assignment(op='=',lvalue=c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+in_var_map[x]),rvalue=c_ast.ID(name=arg[x].name)))
			new_blocks=reconstructStmtBlock(membermethod.getBody().block_items,count,membermethod.getLocalvar(),membermethod.getInputvar(),membermethod.getSerialNo())
			
			
			for x in membermethod.getInputvar():
				if membermethod.getInputvar()[x].getDimensions()>0:
					new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]='array'
				else:
                                	new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]=membermethod.getInputvar()[x].getVariableType()
				
			for x in membermethod.getLocalvar():
				if membermethod.getLocalvar()[x].getDimensions()>0:
					new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]='array'
				else:
                                	new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]=membermethod.getLocalvar()[x].getVariableType()
					
			
			for stmt in new_blocks:
				update_statements.append(stmt)
		 	
		 	stmt_left=c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_result')
		 	
		 	membermethod=functionvarmap[statement.right.name.name]
			in_var_map=membermethod.getInputvar().keys()
			count=membermethod.getUsedCounter()
			count=count+1
			membermethod.setUsedCounter(count)
			for x in range(0, len(statement.right.args.exprs)):
				arg=statement.right.args.exprs
				#update_statements.append(c_ast.Assignment(op='=',lvalue=c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+arg[x].name),rvalue=c_ast.ID(name=in_var_map[x])))
				update_statements.append(c_ast.Assignment(op='=',lvalue=c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+in_var_map[x]),rvalue=c_ast.ID(name=arg[x].name)))
			new_blocks=reconstructStmtBlock(membermethod.getBody().block_items,count,membermethod.getLocalvar(),membermethod.getInputvar(),membermethod.getSerialNo())
			
			
			for x in membermethod.getInputvar():
				if membermethod.getInputvar()[x].getDimensions()>0:
					new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]='array'
				else:
                                	new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]=membermethod.getInputvar()[x].getVariableType()
				
			for x in membermethod.getLocalvar():
				if membermethod.getLocalvar()[x].getDimensions()>0:
					new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]='array'
				else:
                                	new_variable['f'+str(membermethod.getSerialNo())+'_'+str(count)+'_'+x]=membermethod.getLocalvar()[x].getVariableType()
						
		
		
			for stmt in new_blocks:
				update_statements.append(stmt)
		 	
		 	stmt_right=c_ast.ID(name='f'+str(membermethod.getSerialNo())+'_'+str(count)+'_result')
		 	
		 	return c_ast.BinaryOp(op=statement.op,left=stmt_left, right=stmt_right),update_statements	
	
 		else:
 			return c_ast.BinaryOp(op=statement.op,left=statement.left, right=statement.right),new_block
 	return None




    		

def reconstructStmtBlock(statements,count,var_map,in_var_map,fun_count):
	update_statements=[]
	for statement in statements:
		if type(statement) is c_ast.Assignment:
			if type(statement.lvalue) is c_ast.ID:
				if statement.lvalue.name in var_map.keys() or statement.lvalue.name in in_var_map.keys():
					update_statements.append(c_ast.Assignment(op='=', lvalue=c_ast.ID(name='f'+str(fun_count)+'_'+str(count)+'_'+statement.lvalue.name), rvalue=reconstructStmt(statement.rvalue,count,var_map,in_var_map,fun_count)))
				else:
					update_statements.append(c_ast.Assignment(op='=', lvalue=c_ast.ID(name=statement.lvalue.name), rvalue=reconstructStmt(statement.rvalue,count,var_map,in_var_map,fun_count)))
			else:
				update_statements.append(c_ast.Assignment(op='=', lvalue=statement.lvalue, rvalue=reconstructStmt(statement.rvalue,count,var_map,in_var_map)))
		elif type(statement) is c_ast.While:
			update_statements.append(reconstructStmt(c_ast.While(cond=reconstructStmt(statement.cond,count,var_map,in_var_map,fun_count),stmt=c_ast.Compound(block_items=reconstructStmtBlock(statement.cond.block_items,count,var_map,in_var_map,fun_count)))))
		elif type(statement) is c_ast.If:
			update_statements.append(reconstructStmtIf(statement,count,var_map,in_var_map,fun_count))
		else:
			if type(statement) is c_ast.FuncCall:
				update_statements.append(statement)
			else:
                                if type(statement) is c_ast.Decl:
                                        var_type=None
                                        initial_value=None
                                        for child in statement.children():
                                                if type(child[1].type) is c_ast.IdentifierType:
                                                        var_type=child[1].type.names[0]
                                                else:
                                                        initial_value=child[1]
                                        if initial_value is not None:
                                                update_statements.append(c_ast.Assignment(op='=',lvalue=c_ast.ID(name=statement.name), rvalue=initial_value))
                                else:
                                        update_statements.append(statement)
	return update_statements


def reconstructStmtIf(statement,count,var_map,in_var_map,fun_count):
	new_iftrue=None
	new_iffalse=None
	if type(statement) is c_ast.If:
		if type(statement.iftrue) is c_ast.Compound:
			new_iftrue=c_ast.Compound(block_items=reconstructStmtBlock(statement.iftrue.block_items,count,var_map,in_var_map,fun_count))
		else:
			new_iftrue=statement.iftrue
		if type(statement.iffalse) is c_ast.Compound:
			new_iffalse=c_ast.Compound(block_items=reconstructStmtBlock(statement.iffalse.block_items,count,var_map,in_var_map,fun_count))
		else:
			if type(statement.iffalse) is c_ast.If:
				new_iffalse=reconstructStmtIf(statement.iffalse,count,var_map,in_var_map)
	return c_ast.If(cond==reconstructStmt(statement.cond,count,var_map,in_var_map,fun_count), iftrue=new_iftrue, iffalse=new_iffalse)


def reconstructStmt(statement,count,var_map,in_var_map,fun_count):
 	if type(statement) is c_ast.BinaryOp:
 		if type(statement.left) is c_ast.ID and type(statement.right) is c_ast.ID:
 			stmt_left=None
 			stmt_right=None
 			
 			if statement.left.name in var_map.keys() or statement.left.name in in_var_map.keys():
 				stmt_left='f'+str(fun_count)+'_'+str(count)+'_'+statement.left.name
 			else:
 				stmt_left=statement.left.name
 				
 			if statement.right.name in var_map.keys() or statement.right.name in in_var_map.keys():
				stmt_right='f'+str(fun_count)+'_'+str(count)+'_'+statement.right.name
			else:
 				stmt_right=statement.right.name
 				
 			return c_ast.BinaryOp(op=statement.op,left=c_ast.ID(name=stmt_left), right=c_ast.ID(name=stmt_right))
 		elif type(statement.left) is c_ast.ID and type(statement.right) is c_ast.BinaryOp:
 			stmt_left=None
 			
 			if statement.left.name in var_map.keys() or statement.left.name in in_var_map.keys():
				stmt_left='f'+str(fun_count)+'_'+str(count)+'_'+statement.left.name
			else:
 				stmt_left=statement.left.name
 				
 			return c_ast.BinaryOp(op=statement.op,left=c_ast.ID(name=stmt_left), right=reconstructStmt(statement.right,count,var_map,in_var_map,fun_count))
 			
 		elif type(statement.left) is c_ast.BinaryOp and type(statement.right) is c_ast.ID:
 			stmt_right=None
 			
 			if statement.right.name in var_map.keys() or statement.right.name in in_var_map.keys():
				stmt_right='f'+str(fun_count)+'_'+str(count)+statement.right.name
			else:
 				stmt_right=statement.right.name
 			
 			return c_ast.BinaryOp(op=statement.op,left=reconstructStmt(statement.left,count,var_map,in_var_map,fun_count), right=c_ast.ID(name=stmt_right))
 			
 		elif type(statement.left) is c_ast.Constant and type(statement.right) is c_ast.Constant:
 		
 			return c_ast.BinaryOp(op=statement.op,left=statement.left, right=statement.right)
 			
 		elif type(statement.left) is c_ast.Constant and type(statement.right) is c_ast.ID:
 			stmt_right=None
  			
			if statement.right.name in var_map.keys() or statement.right.name in in_var_map.keys():
				stmt_right='f'+str(fun_count)+'_'+str(count)+'_'+statement.right.name
			else:
 				stmt_right=statement.right.name
 				
 			return c_ast.BinaryOp(op=statement.op,left=statement.left, right=c_ast.ID(name=stmt_right))
 			
 		elif type(statement.left) is c_ast.ID and type(statement.right) is c_ast.Constant:
 			stmt_left=None
 			
 		 	if statement.left.name in var_map.keys() or statement.left.name in in_var_map.keys():
				stmt_left='f'+str(fun_count)+'_'+str(count)+'_'+statement.left.name
			else:
 				stmt_left=statement.left.name
 				
 			return c_ast.BinaryOp(op=statement.op,left=c_ast.ID(name=stmt_left), right=statement.right)
 		elif type(statement.left) is c_ast.Constant and type(statement.right) is c_ast.BinaryOp:
 			return c_ast.BinaryOp(op=statement.op,left=statement.left, right=reconstructStmt(statement.right,count,var_map,in_var_map,fun_count))
 		elif type(statement.left) is c_ast.BinaryOp and type(statement.right) is c_ast.Constant:
 			return c_ast.BinaryOp(op=statement.op,left=reconstructStmt(statement.left,count,var_map,in_var_map,fun_count), right=statement.right)
 		elif type(statement.left) is c_ast.BinaryOp and type(statement.right) is c_ast.BinaryOp:
 			return c_ast.BinaryOp(op=statement.op,left=reconstructStmt(statement.left,count,var_map,in_var_map,fun_count), right=reconstructStmt(statement.right,count,var_map,in_var_map,fun_count))
 		else:
 			return c_ast.BinaryOp(op=statement.op,left=statement.left, right=statement.right)
 	return None
    				
    	

    
        
        
        
        
    	
        

	




