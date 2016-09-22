#-----------------------------------------------------------------
# remove_goto
#
# Removing goto  and  rewriting AST
#
# September 04 2016, Pritom Rajkhowa
# Project: VIAP
#-----------------------------------------------------------------
import sys

from pycparser import parse_file,c_parser, c_ast, c_generator




new_variable={}

def remove_goto(filename):
    content=None
    global new_variable
    new_variable={}
    with open(filename) as f:
        content = f.read()
    content=content.replace('\r','')
    text = r""" """+content
    parser = c_parser.CParser()
    ast = parser.parse(text)     
    function_decl = ast.ext[0].decl
    function_param = function_decl
    function_body = ast.ext[0].body
    statements=function_body.block_items
    statements=gotoremoval(statements)
    update_statements=[]
    for var in new_variable.keys():
    	temp=c_ast.Decl(name=var, quals=[], storage=[], funcspec=[], type=c_ast.TypeDecl(declname=var, quals=[], type=c_ast.IdentifierType(names=['int'])), init=c_ast.Constant(type='int', value='0'), bitsize=None)
    	update_statements.append(temp)
    for statement in statements:
    	update_statements.append(statement)
    update_statements=removeEmptyIfLoop(update_statements)
    function_body.block_items=update_statements
    body_comp = c_ast.Compound(block_items=update_statements)
    generator = c_generator.CGenerator()   
    print(generator.visit(ast))

    
    



def gotoremoval(statements):
	if statements is not None:
		label_map=constructLabelTable(statements,0,0,0)
		updateLabelTable(statements,0,0,0,label_map)
		keys=label_map.keys()
		if len(keys)>0:
			item=keys[0]
			element = label_map[item]
    			lists = element[3]
    			for list in lists:
    				if element[0]>=list[0] and element[1]>=list[1]:
        				statements=goto_finder(statements,item)
    					statements=go_block_finder(statements,item)
    					statements=gotoremoval(statements)
    				else:
    					statements=label_finder(statements,item)
    					statements=go_block_finder(statements,item)
    					statements=gotoremoval(statements)
    	return statements





#Finding Goto in a Block to Call gotomovein
#Parameter pass block of statement 
#Label


def go_block_finder(statements,label):
	if statements is not None:
		flag_block_label=check_label_block(statements,label)  
		flag_block_goto=check_goto_block_Sp(statements,label)
		if flag_block_label==True and flag_block_goto==True:
			return remove_goto_block(statements,label)
		else:
			update_statements=[]
			for statement in statements:
				if type(statement) is c_ast.If:
					update_statements.append(go_block_finder_if(statement,label))
				elif type(statement) is c_ast.While:
					update_statements.append(c_ast.While(cond=statement.cond, stmt=c_ast.Compound(block_items=go_block_finder(statement.stmt.block_items,label))))
				else:
					update_statements.append(statement)
		return update_statements
	return statements
				


#Finding Goto in a If Block to Call gotomovein
#Parameter pass statement 
#Label

def go_block_finder_if(statement,label):
	new_iftrue=None
	new_iffalse=None
	if type(statement) is c_ast.If:
		if type(statement.iftrue) is c_ast.Compound:
			if statement.iftrue.block_items is not None:
				new_iftrue=c_ast.Compound(block_items=go_block_finder(statement.iftrue.block_items,label))
			else:
				new_iftrue=statement.iftrue
		else:
			new_iftrue=statement.iftrue
		if type(statement.iffalse) is c_ast.Compound:
			if statement.iffalse.block_items is not None:
				new_iffalse=c_ast.Compound(block_items=go_block_finder(statement.iffalse.block_items,label))
			else:
				new_iftrue=statement.iffalse
		elif type(statement.iffalse) is c_ast.If:
			new_iffalse=go_block_finder_if(statement.iffalse,label)
		else:
			new_iffalse=statement.iffalse
	return c_ast.If(cond=statement.cond,iftrue=new_iftrue,iffalse=new_iffalse)






#Method to Remove Goto 


def remove_goto_block(statements,label): 
	flag_block_label=check_label_block(statements,label)  
	flag_block_goto=check_goto_block_Sp(statements,label)
	flag_block2,condition=check_goto(statements,label)
	flag_label=False
	flag_goto=False
	new_statements1=[]
	new_statements2=[]
	if flag_block_label==True and flag_block_goto==True:
		for statement in statements:
			if type(statement) is c_ast.Label:
				if label==statement.name:
					if flag_goto==True:
						new_statements1.append(c_ast.If(cond=c_ast.UnaryOp(op='!', expr=condition), iftrue=c_ast.Compound(block_items=new_statements2),iffalse=None))
						if type(statement.stmt) is c_ast.Assignment:
							new_statements1.append(statement.stmt)
						elif type(statement.stmt) is c_ast.Compound:
							if statement.stmt is not None and statement.stmt.block_items is not None:
								for stmt in statement.stmt.block_items:
									new_statements1.append(stmt)
						flag_label=False
						flag_goto=False
					else:
						if type(statement.stmt) is c_ast.Assignment:
							new_statements2.append(statement.stmt)
						elif type(statement.stmt) is c_ast.Compound:
							if statement.stmt is not None and statement.stmt.block_items is not None:
								for stmt in statement.stmt.block_items:
									new_statements2.append(stmt)
						flag_label=True
				else:
					if flag_goto==True or flag_label==True:
						if type(statement.stmt) is c_ast.Assignment:
							new_statements2.append(statement.stmt)
						elif type(statement.stmt) is c_ast.Compound:
							if statement.stmt is not None and statement.stmt.block_items is not None:
								for stmt in statement.stmt.block_items:
									new_statements2.append(stmt)
					else:
						new_statements1.append(statement)
			elif type(statement) is c_ast.If:
				flag_block_goto=check_goto_block_If(statement,label)
				if flag_block_goto:
					if flag_label==True:
						statement=getRidOfGoto(statement,label)
						for stmt in new_statements2:
							new_statements1.append(stmt)
						new_statements1.append(statement)
						
						new_break_map={}
						new_statements2=reOrganizeBreaks(new_statements2,new_break_map)

						new_statements1.append(c_ast.While(cond=condition, stmt=c_ast.Compound(block_items=new_statements2)))
						new_statements1=addingBreakVariables(new_statements1,new_break_map)
						flag_label=False
						flag_goto=False
					else:
						statement=getRidOfGoto(statement,label)
						new_statements1.append(statement)
						flag_goto=True
				else:
					if flag_goto==True or flag_label==True:
						new_statements2.append(statement)
					else:
						new_statements1.append(statement)
			else:
				if flag_goto==True or flag_label==True:
					new_statements2.append(statement)
				else:
					new_statements1.append(statement)
	
	return new_statements1
				
				



    
    
def constructLabelTable(statements,level,block,lineCount):
	label_map={}
	if statements is not None:
		for statement in statements:
			if type(statement) is c_ast.If:
				label_map_temp=constructLabelTable_If(statement,level,block,lineCount)
	            		for item in label_map_temp:
            				label_map[item]=label_map_temp[item]
			elif type(statement) is c_ast.Label:
				lineCount=lineCount+1
			        info=[]
			        info.append(level)
	            		info.append(block)
	            		info.append(lineCount)
	            		info.append([])
				label_map[statement.name]=info
	        	else:
	        		if type(statement) is c_ast.While:
	        			level=level+1
	            			label_map_temp=constructLabelTable(statement.stmt.block_items,level,block,lineCount)
	            			for item in label_map_temp:
            					label_map[item]=label_map_temp[item]
            				level=level-1
            			else:
            				lineCount=lineCount+1
	return label_map




def constructLabelTable_If(statement,level,block,lineCount):
	label_map={}
	if type(statement) is c_ast.If:
			if type(statement.iftrue) is c_ast.Label:
				label_map[statement.iftrue.name]=statement.iftrue.name
			else:
	            		if type(statement.iftrue) is c_ast.Compound and statement.iftrue.block_items is not None:
	            			for element in statement.iftrue.block_items:
	            				if type(element) is c_ast.Label:
							lineCount=lineCount+1	            				
	            					info=[]
	            					info.append(level)
	            					info.append(block)
	            					info.append(lineCount)
	            					info.append([])
	            					label_map[element.name]=info
	            				elif type(element) is c_ast.If:
	            					block=block+1
							label_map_temp=constructLabelTable_If(element,level,block,lineCount)
							for item in label_map_temp:
            							label_map[item]=label_map_temp[item]
            						block=block-1
						else:
							if type(element) is c_ast.While:
								level=level+1
						        	label_map_temp=constructLabelTable(element.stmt.block_items,level,block,lineCount)
						        	for item in label_map_temp:
					            			label_map[item]=label_map_temp[item]
            							level=level-1
            						else:
            							lineCount=lineCount+1
	
			if type(statement.iffalse) is c_ast.Label:
				label_map[statement.iffalse.name]=statement.iffalse.name
			else:
				if type(statement.iffalse) is c_ast.Compound and statement.iffalse.block_items is not None:
	            			for element in statement.iffalse.block_items:
	            				if type(element) is c_ast.Label:
	            					lineCount=lineCount+1
	            					info=[]
							info.append(level)
	            					info.append(block)
	            					info.append(lineCount)
	            					info.append([])
	            					label_map[element.name]=info
	            				elif type(element) is c_ast.If:
	            					block=block+1
							label_map_temp=constructLabelTable_If(element,level,block,lineCount)
							for item in label_map_temp:
            							label_map[item]=label_map_temp[item]
            						block=block-1
						else:
							if type(element) is c_ast.While:
								level=level+1
						        	label_map_temp=constructLabelTable(element.stmt.block_items,level,block,lineCount)
						        	for item in label_map_temp:
					            			label_map[item]=label_map_temp[item]
            							level=level-1
            						else:
            							lineCount=lineCount+1
				else:
					if type(statement.iffalse) is c_ast.If:
						label_map_temp=constructLabelTable_If(statement.iffalse,level,block,lineCount)
						for item in label_map_temp:
							label_map[item]=label_map_temp[item]
	return label_map

    
    

def updateLabelTable(statements,level,block,lineCount,label_map):
	if statements is not None:
		for statement in statements:
			if type(statement) is c_ast.If:
				updateLabelTable_If(statement,level,block,lineCount,label_map)
	        	else:
	        		if type(statement) is c_ast.While:
	        			level=level+1
	            			updateLabelTable(statement.stmt.block_items,level,block,lineCount,label_map)
            				level=level-1
            			else:
            				lineCount=lineCount+1





def updateLabelTable_If(statement,level,block,lineCount,label_map):
	if type(statement) is c_ast.If:
			if type(statement.iftrue) is c_ast.Goto:
				lineCount=lineCount+1	            				
				info=[]
				info.append(level)
				info.append(block)
				info.append(lineCount)
				info.append(statement.cond)
				if statement.iftrue.name in label_map.keys():
					info_update=label_map[statement.iftrue.name]
				        list=info_update[3]
	            			list.append(info)
			else:
	            		if type(statement.iftrue) is c_ast.Compound and statement.iftrue.block_items is not None:
	            			for element in statement.iftrue.block_items:
	            				if type(element) is c_ast.Goto:
							lineCount=lineCount+1	            				
	            					info=[]
	            					info.append(level)
	            					info.append(block)
	            					info.append(lineCount)
	            					info.append(statement.cond)
	            					if element.name in label_map.keys():
	            						info_update=label_map[element.name]
	            						list=info_update[3]
	            						list.append(info)
	            				elif type(element) is c_ast.If:
	            					block=block+1
							updateLabelTable_If(element,level,block,lineCount,label_map)
            						block=block-1
						else:
							if type(element) is c_ast.While:
								level=level+1
						        	updateLabelTable(element.stmt.block_items,level,block,lineCount,label_map)
            							level=level-1
            						else:
            							lineCount=lineCount+1
	
			if type(statement.iffalse) is c_ast.Goto:
				lineCount=lineCount+1	            				
				info=[]
				info.append(level)
				info.append(block)
				info.append(lineCount)
				info.append(statement.cond)
				if statement.iffalse.name in label_map.keys():
					info_update=label_map[statement.iffalse.name]
					list=info_update[3]
	            			list.append(info)
			else:
				if type(statement.iffalse) is c_ast.Compound and statement.iffalse.block_items is not None:
	            			for element in statement.iffalse.block_items:
	            				if type(element) is c_ast.Goto:
	            					lineCount=lineCount+1
	            					info=[]
							info.append(level)
	            					info.append(block)
	            					info.append(lineCount)
	            					info.append(statement.cond)
	            					if element.name in label_map.keys():
	            						info_update=label_map[element.name]
	            						list=info_update[3]
	            						list.append(info)
	            				elif type(element) is c_ast.If:
	            					block=block+1
							updateLabelTable_If(element,level,block,lineCount,label_map)
            						block=block-1
						else:
							if type(element) is c_ast.While:
								level=level+1
						        	updateLabelTable(element.stmt.block_items,level,block,lineCount,label_map)
            							level=level-1
            						else:
            							lineCount=lineCount+1
				else:
					if type(statement.iffalse) is c_ast.If:
						updateLabelTable_If(statement.iffalse,level,block,lineCount,label_map)
					
					
#Check a label in a block of statement


def check_label_block(statements,label):
        status=False
	for statement in statements:
		if type(statement) is c_ast.If:
                        temp_status=check_label_block_If(statement,label)
                        if temp_status==True:
                               status=True 
		elif type(statement) is c_ast.Label:
                        if statement.name==label:
                                status = True
	return status
	



def check_label_block_sp(statements,label):
        status=False
	for statement in statements:
		if type(statement) is c_ast.Label:
                        if statement.name==label:
                                status = True
	return status

#Check a label in the blocks of statement of if loop
	
def check_label_block_If(statement,label):
        status=False
	if type(statement) is c_ast.If:
			if type(statement.iftrue) is c_ast.Label:
				if statement.iftrue.name==label:
                                        status = True
			else:
	            		if type(statement.iftrue) is c_ast.Compound and statement.iftrue.block_items is not None:
	            			for element in statement.iftrue.block_items:
	            				if type(element) is c_ast.Label:
                                                        if element.name==label:
                                                                status = True
                                                                
			if type(statement.iffalse) is c_ast.Label:
                                if statement.iffalse.name==label:
                                        status = True
			else:
				if type(statement.iffalse) is c_ast.Compound and statement.iffalse.block_items is not None:
	            			for element in statement.iffalse.block_items:
	            				if type(element) is c_ast.Label:
	            					if element.name==label:
                                                                status = True
				else:
					if type(statement.iffalse) is c_ast.If:
						temp_status = check_label_block_If(statement.iffalse,label)
						if temp_status==True:
                                                	status=True
	return status



#Check a label in statement


def check_label(statements,label):
        status=False
	for statement in statements:
		if type(statement) is c_ast.If:
                        temp_status=check_label_If(statement,label)
                        if temp_status==True:
                               status=True 
		elif type(statement) is c_ast.Label:
                        if statement.name==label:
                                status = True
	        else:
	        	if type(statement) is c_ast.While:
	            		temp_status= check_label(statement.stmt.block_items,label)
	            		if temp_status==True:
                                        status=True
	return status




#Check a label in statement of if loop

def check_label_If(statement,label):
        status=False
	if type(statement) is c_ast.If:
			if type(statement.iftrue) is c_ast.Label:
				if statement.iftrue.name==label:
                                        status = True
			else:
	            		if type(statement.iftrue) is c_ast.Compound and statement.iftrue.block_items is not None:
	            			for element in statement.iftrue.block_items:
	            				if type(element) is c_ast.Label:
                                                        if element.name==label:
                                                                status = True
	            				elif type(element) is c_ast.If:
							temp_status = check_label_If(element,label)
							if temp_status==True:
                                                               status=True
						else:
							if type(element) is c_ast.While:
						        	temp_status = check_label(element.stmt.block_items,label)
						        	if temp_status==True:
                                                                        status=True
	
			if type(statement.iffalse) is c_ast.Label:
                                if statement.iffalse.name==label:
                                        status = True
			else:
				if type(statement.iffalse) is c_ast.Compound and statement.iffalse.block_items is not None:
	            			for element in statement.iffalse.block_items:
	            				if type(element) is c_ast.Label:
	            					if element.name==label:
                                                                status = True
	            				elif type(element) is c_ast.If:
                                                        temp_status = check_label_If(element,label)
                                                        if temp_status==True:
                                                                status=True
						else:
							if type(element) is c_ast.While:
								temp_status = check_label(element.stmt.block_items,label)
								if temp_status==True:
                                                                        status=True

				else:
					temp_status = check_label_If(statement.iffalse,label)
					if temp_status==True:
                                                status=True
	return status





#Check a goto-label in a block of statement


def check_goto_block(statements,label):
        status=False
	for statement in statements:
		if type(statement) is c_ast.Goto:
                        if statement.name==label:
                                status = True

	return status


def check_goto_block_Sp(statements,label):
        status=False
	for statement in statements:
		if type(statement) is c_ast.Goto:
                        if statement.name==label:
                                status = True
               	elif type(statement) is c_ast.If:
                	temp_status=check_goto_block_If(statement,label)
                	if temp_status==True:
                		status=True
	return status
	
	

#Check a label in the blocks of statement of if loop
	
def check_goto_block_If(statement,label):
        status=False
	if type(statement) is c_ast.If:
			if type(statement.iftrue) is c_ast.Goto:
				if statement.iftrue.name==label:
                                        status = True
			else:
	            		if type(statement.iftrue) is c_ast.Compound and statement.iftrue.block_items is not None:
	            			for element in statement.iftrue.block_items:
	            				if type(element) is c_ast.Goto:
                                                        if element.name==label:
                                                                status = True
                                                                
			if type(statement.iffalse) is c_ast.Label:
                                if statement.iffalse.name==label:
                                        status = True
			else:
				if type(statement.iffalse) is c_ast.Compound and statement.iffalse.block_items is not None:
	            			for element in statement.iffalse.block_items:
	            				if type(element) is c_ast.Goto:
	            					if element.name==label:
                                                                status = True
				else:
					if type(statement.iffalse) is c_ast.If:
						temp_status = check_goto_block_If(statement.iffalse,label)
						if temp_status==True:
                                                	status=True
	return status



#Check a label in statement


def check_goto(statements,label):
        status=False
        condition=None
	for statement in statements:
		if type(statement) is c_ast.If:
                        temp_status,temp_cond=check_goto_If(statement,label)
                        if temp_status==True:
                               status=True
                               condition=temp_cond
		elif type(statement) is c_ast.Goto:
                        if statement.name==label:
                                status = True
	        else:
	        	if type(statement) is c_ast.While:
	            		temp_status,temp_cond= check_goto(statement.stmt.block_items,label)
	            		if temp_status==True:
                                        status=True
                                        condition=temp_cond
	return status,condition




#Check a label in statement of if loop

def check_goto_If(statement,label):
        status=False
        condition=None
	if type(statement) is c_ast.If:
			if type(statement.iftrue) is c_ast.Goto:
				if statement.iftrue.name==label:
                                        status = True
                                        condition=statement.cond
			else:
	            		if type(statement.iftrue) is c_ast.Compound and statement.iftrue.block_items is not None:
	            			for element in statement.iftrue.block_items:
	            				if type(element) is c_ast.Goto:
                                                        if element.name==label:
                                                                status = True
                                                                condition=statement.cond
	            				elif type(element) is c_ast.If:
							temp_status,temp_cond = check_goto_If(element,label)
							if temp_status==True:
                                                               status=True
                                                               condition=temp_cond
						else:
							if type(element) is c_ast.While:
						        	temp_status,temp_cond = check_goto(element.stmt.block_items,label)
						        	if temp_status==True:
                                                                        status=True
                                                                        condition=temp_cond
	
			if type(statement.iffalse) is c_ast.Goto:
                                if statement.iffalse.name==label:
                                        status = True
                                        condition = c_ast.UnaryOp(op='!', expr=statement.cond)
			else:
				if type(statement.iffalse) is c_ast.Compound and statement.iffalse.block_items is not None:
	            			for element in statement.iffalse.block_items:
	            				if type(element) is c_ast.Goto:
	            					if element.name==label:
                                                                status = True
                                                                condition = c_ast.UnaryOp(op='!', expr=statement.cond)
	            				elif type(element) is c_ast.If:
                                                        temp_status,temp_cond = check_goto_If(element,label)
                                                        if temp_status==True:
                                                                status=True
                                                                condition=temp_cond
						else:
							if type(element) is c_ast.While:
								temp_status,temp_cond = check_goto(element.stmt.block_items,label)
								if temp_status==True:
                                                                        status=True
                                                                        condition=temp_cond

				else:
					temp_status,temp_cond = check_goto_If(statement.iffalse,label)
					if temp_status==True:
                                                status=True
                                                condition=temp_cond
	return status,condition






#Finding Goto in a Block to Call gotomovein
#Parameter pass block of statement 
#Label


def label_finder(statements,label):
	if statements is not None:
		flag_block1=check_label_block(statements,label)
		if flag_block1==True:
			return gotomoveout(statements,label)
		else:
			update_statements=[]
			if statements is not None:
				for statement in statements:
					if type(statement) is c_ast.If:
						update_statements.append(label_finder_if(statement,label))
					elif type(statement) is c_ast.While:
						update_statements.append(c_ast.While(cond=statement.cond, stmt=c_ast.Compound(block_items=label_finder(statement.stmt.block_items,label))))
					else:
						update_statements.append(statement)
				return update_statements
			return statements
	return statements
				


#Finding Goto in a If Block to Call gotomovein
#Parameter pass statement 
#Label

def label_finder_if(statement,label):
	new_iftrue=None
	new_iffalse=None
	if type(statement) is c_ast.If:
		if type(statement.iftrue) is c_ast.Compound:
			if statement.iftrue.block_items is not None:
				new_iftrue=c_ast.Compound(block_items=label_finder(statement.iftrue.block_items,label))
			else:
				new_iftrue=statement.iftrue
		else:
			new_iftrue=statement.iftrue
		if type(statement.iffalse) is c_ast.Compound:
			if statement.iffalse.block_items is not None:
				new_iffalse=c_ast.Compound(block_items=label_finder(statement.iffalse.block_items,label))	
			else:
				new_iffalse=statement.iffalse
		elif type(statement.iffalse) is c_ast.If:
			new_iffalse=label_finder_if(statement.iffalse,label)
		else:
			new_iffalse=statement.iffalse
	return c_ast.If(cond=statement.cond,iftrue=new_iftrue,iffalse=new_iffalse)






#Method to Move Goto Outside
#Parameter pass statement 
#Label


def gotomoveout(statements,label):
	flag_block1=check_label_block(statements,label)
	update_statements=[]
	condition=None
	if flag_block1==True:
		for statement in statements:
			if type(statement) is c_ast.If:
				flag_block2,condition=check_goto_If(statement,label)
				flag_stmt2=check_goto_block_If(statement,label)
				if flag_block2==True and flag_stmt2==False:
					statement=gotomoveoutrec_if(statement,label)
			                update_statements.append(statement)
			                update_statements.append(c_ast.If(cond=condition, iftrue=c_ast.Goto(name=label), iffalse=None))
				elif flag_block2==True and flag_stmt2==True:
					statement=getRidOfGoto(statement,label)
			                if statement is not None:
			                	update_statements.append(statement)
			                	update_statements.append(c_ast.If(cond=condition, iftrue=c_ast.Goto(name=label), iffalse=None))
			        else:
					update_statements.append(statement)
			
			elif type(statement) is c_ast.While:
				flag_block2,condition=check_goto(statement.stmt.block_items,label)
				flag_stmt2=check_goto_block(statement.stmt.block_items,label)
				if flag_block2==True and flag_stmt2==False:
					stmts=gotomoveoutrec(statement.stmt.block_items,label)
					stmts.append(c_ast.If(cond=condition, iftrue=c_ast.Break(), iffalse=None))
					statement=c_ast.While(cond=statement.cond,stmt=c_ast.Compound(block_items=stmts))
					update_statements.append(statement)
					update_statements.append(c_ast.If(cond=condition, iftrue=c_ast.Goto(name=label), iffalse=None))
				elif flag_block2==True and flag_stmt2==True:
			                update_statements.append(statement)
			        else:
					update_statements.append(statement)
			                       
			else:
				update_statements.append(statement)
                                
		return update_statements



#Method to Move Goto Outside Recursive
#Parameter pass statement 
#Label

def gotomoveoutrec(statements,label):
	new_statements1=[]
	new_statements2=[]
	flag=False
	condition=None
	for statement in statements:
		if type(statement) is c_ast.If:
			flag_block2,condition=check_goto_If(statement,label)
			flag_stmt2=check_goto_block_If(statement,label)
			if flag_block2==True and flag_stmt2==False:
				statement=gotomoveoutrec_if(statement,label)
                        	new_statements1.append(statement)
                        	flag=True
			elif flag_block2==True and flag_stmt2==True:
				statement=getRidOfGoto(statement,label)
                                flag=True
                                if statement is not None:
                                	new_statements1.append(statement)
                        else:
                        	if flag==True:
					new_statements2.append(statement)
				else:
                        		new_statements1.append(statement)

		elif type(statement) is c_ast.While:
			flag_block2,condition=check_goto(statement.stmt.block_items,label)
			flag_stmt2=check_goto_block(statement.stmt.block_items,label)
			if flag_block2==True and flag_stmt2==False:
				stmts=gotomoveoutrec(statement.stmt.block_items,label)
				stmts.append(c_ast.If(cond=condition, iftrue=c_ast.Break(), iffalse=None))
				statement=c_ast.While(cond=statement.cond,stmt=c_ast.Compound(block_items=stmts))
				new_statements1.append(statement)
			elif flag_block2==True and flag_stmt2==True:
                                flag=True
                                new_statements1.append(statement)
                        else:
                        	if flag==True:
					new_statements2.append(statement)
				else:
                        		new_statements1.append(statement)
                       
                else:
                	if flag==True:
				new_statements2.append(statement)
			else:
                        	new_statements1.append(statement)
	if condition is not None:
                if len(new_statements2)>0:
                	new_statements1.append(c_ast.If(cond=c_ast.UnaryOp(op='!', expr=condition), iftrue=c_ast.Compound(block_items=new_statements2), iffalse=None))
                statements=new_statements1
        return statements



#Finding Goto in a Block to Call gotomovein
#Parameter pass block of statement 
#Label
				
				
def gotomoveoutrec_if(statement,label):
	#print statement.show()
	if type(statement) is c_ast.If:
		if type(statement.iftrue) is c_ast.Goto:
			if statement.iftrue.name==label:
	                	status = True
		else:
		        if type(statement.iftrue) is c_ast.Compound and statement.iftrue.block_items is not None:
		        	flag_block2,condition=check_goto(statement.iftrue.block_items,label)
				flag_stmt2=check_goto_block(statement.iftrue.block_items,label)
				if flag_block2==True and flag_stmt2==False:
					statement.iftrue.block_items=gotomoveoutrec(statement.iftrue.block_items,label)
					statement.iftrue=c_ast.Compound(block_items=statement.iftrue.block_items)
				elif flag_block2==True and flag_stmt2==True:
					statement.iftrue=c_ast.Compound(block_items=statement.iftrue.block_items)
	                                                                
		if type(statement.iffalse) is c_ast.Label:
	        	if statement.iffalse.name==label:
	                	status = True
		else:
			if type(statement.iffalse) is c_ast.Compound and statement.iffalse.block_items is not None:
				flag_block2,condition=check_goto(statement.iffalse.block_items,label)
				flag_stmt2=check_goto_block(statement.iffalse.block_items,label)
				if flag_block2==True and flag_stmt2==False:
					statement.iffalse.block_items=gotomoveoutrec(statement.iffalse.block_items,label)
					statement.iffalse=c_ast.Compound(block_items=statement.iffalse.block_items)
				elif flag_block2==True and flag_stmt2==True:
					statement.iffalse=c_ast.Compound(block_items=statement.iffalse.block_items)
			else:
				if type(statement.iffalse) is c_ast.If: 
					gotomoveoutrec_if(statement.iffalse,label)
	#print statement.show()
	return c_ast.If(cond=statement.cond, iftrue=statement.iftrue, iffalse=statement.iffalse)
				



#Updating Each If Else for Goto
#Parameter pass statement 
#Label
		
	
def getRidOfGoto(statement,label):
	generator = c_generator.CGenerator()
	new_iftrue=None
	new_iffalse=None
	if type(statement) is c_ast.If:
		if type(statement.iftrue) is c_ast.Goto:
			if statement.iftrue.name==label:
	                	new_iftrue=None
		else:
		        if type(statement.iftrue) is c_ast.Compound:
		        	new_block=[]
				for stmt in statement.iftrue.block_items:
					if type(stmt) is c_ast.Goto:
						if stmt.name!=label:
							new_block.append(stmt)
					else:
						new_block.append(stmt)
				new_iftrue=c_ast.Compound(block_items=new_block)
                                     
		
		if type(statement.iffalse) is c_ast.Label:
	        	if statement.iffalse.name==label:
	                	new_iffalse=None
		else:
			if type(statement.iffalse) is c_ast.Compound:
				new_block=[]
				for stmt in statement.iffalse.block_items:
					if type(stmt) is c_ast.Goto:
						if stmt.name!=label:
							new_block.append(stmt)
					else:
						new_block.append(stmt)
				new_iffalse=c_ast.Compound(block_items=new_block)
			else:
				if type(statement.iffalse) is c_ast.If:
					new_iffalse=getRidOfGoto(statement.iffalse,label)
	if new_iftrue is not None:
		return c_ast.If(cond=statement.cond, iftrue=new_iftrue, iffalse=new_iffalse)
	else:
		return None





#Finding Goto in a Block to Call gotomovein
#Parameter pass block of statement 
#Label


def goto_finder(statements,label):
	flag_block1=check_goto_block_Sp(statements,label)
	if flag_block1==True:
		flag_block1=check_label_block_sp(statements,label)
		if flag_block1==True:
			return statements
		else:
			return gotomovein(statements,label)
	else:
		update_statements=[]
		for statement in statements:
			if type(statement) is c_ast.If:
				update_statements.append(goto_finder_if(statement,label))
			elif type(statement) is c_ast.While:
				update_statements.append(c_ast.While(cond=statement.cond, stmt=c_ast.Compound(block_items=goto_finder(statement.stmt.block_items,label))))
			else:
				update_statements.append(statement)
		return update_statements


#Finding Goto in a If Block to Call gotomovein
#Parameter pass statement 
#Label

def goto_finder_if(statement,label):
	new_iftrue=None
	new_iffalse=None
	if type(statement) is c_ast.If:
		if type(statement) is c_ast.If:
			if type(statement.iftrue) is c_ast.Compound:
				if statement.iftrue.block_items is not None:
					new_iftrue=c_ast.Compound(block_items=goto_finder(statement.iftrue.block_items,label))
				else:
					new_iftrue=statement.iftrue				
			else:
				new_iftrue=statement.iftrue
			if type(statement.iffalse) is c_ast.Compound:
				if statement.iffalse.block_items is not None:
					new_iffalse=c_ast.Compound(block_items=goto_finder(statement.iffalse.block_items,label))
				else:
					new_iffalse=statement.iffalse
			elif type(statement.iffalse) is c_ast.If:
				new_iffalse=goto_finder_if(statement.iffalse,label)
			else:
				new_iffalse=statement.iffalse
	return c_ast.If(cond=statement.cond,iftrue=new_iftrue,iffalse=new_iffalse)




#Method to Move Goto Inside
#Parameter pass statement 
#Label

def gotomovein(statements,label):
	flag_block1=check_goto_block_Sp(statements,label)
	new_statements1=[]
	new_statements2=[]
	flag=False
	if flag_block1==True:
		flag_block1,condition=check_goto(statements,label)
		for statement in statements:
			if type(statement) is c_ast.If:
				flag_stmt3=check_goto_block_If(statement,label)				
				flag_block2=check_label_If(statement,label)
				flag_stmt2=check_label_block_If(statement,label)
				if flag_stmt3==True:
					if flag_block2==True and flag_stmt2==True:
						new_statements1.append(statement)
					else:
						new_statement=c_ast.Assignment(op='=', lvalue=c_ast.ID(name='go_'+label), rvalue=condition)
						new_variable['go_'+label]='go_'+label
						condition=c_ast.BinaryOp(op='>', left=c_ast.ID(name='go_'+label), right=c_ast.Constant(type='int', value='0'))
						new_statements1.append(new_statement)
						flag=True
				else:
					if flag_block2==True and flag_stmt2==False:
						flag=False
						new_statements1.append(c_ast.If(cond=c_ast.UnaryOp(op='!', expr=condition), iftrue=c_ast.Compound(block_items=new_statements2), iffalse=None))
						new_statements1.append(updateIfBlock(statement,label,condition))

						new_statements2=[]
					else:
						if flag_block2==True and flag_stmt2==True:
							flag=False
							new_statements1.append(c_ast.If(cond=c_ast.UnaryOp(op='!', expr=condition), iftrue=c_ast.Compound(block_items=new_statements2), iffalse=None))
							new_statements1.append(updateIfBlock(statement,label,condition))
							new_statements2=[]
						else:
							if flag==False:
								new_statements1.append(statement)
							else:
								new_statements2.append(statement)
			elif type(statement) is c_ast.While:
				flag_block2=check_label(statement.stmt.block_items,label)
				#flag_stmt2=check_label_block(statement.stmt.block_items,label)
				flag_stmt2=check_label_block_sp(statement.stmt.block_items,label)			
				if flag_block2==False and flag_stmt2==False:
					statement=c_ast.While(cond=statement.cond, stmt=statement.stmt)
				elif flag_block2==True and flag_stmt2==True:
					if len(new_statements2)>0:
						new_statements1.append(c_ast.If(cond=c_ast.UnaryOp(op='!', expr=condition), iftrue=c_ast.Compound(block_items=new_statements2), iffalse=None))
					new_cond=c_ast.BinaryOp(op='||', left=condition, right=statement.cond)
					new_blocks=[]
					new_blocks.append(c_ast.If(cond=condition, iftrue=c_ast.Goto(name=label), iffalse=None))
					for stmt in statement.stmt.block_items:
						new_blocks.append(stmt)
					new_blocks.append(c_ast.Assignment(op='=', lvalue=c_ast.ID(name='go_'+label) , rvalue= c_ast.Constant(type='int', value='0')))
					statement=c_ast.While(cond=new_cond, stmt=c_ast.Compound(block_items=new_blocks))
					flag=False
					new_statements2=[]
				elif flag_block2==True and flag_stmt2==False:
					if len(new_statements2)>0:
						new_statements1.append(c_ast.If(cond=c_ast.UnaryOp(op='!', expr=condition), iftrue=c_ast.Compound(block_items=new_statements2), iffalse=None))
					new_cond=c_ast.BinaryOp(op='||', left=condition, right=statement.cond)
					new_blocks=[]
					new_blocks.append(c_ast.If(cond=condition, iftrue=c_ast.Goto(name=label), iffalse=None))
					for stmt in statement.stmt.block_items:
						new_blocks.append(stmt)
					new_blocks.append(c_ast.Assignment(op='=', lvalue=c_ast.ID(name='go_'+label) , rvalue= c_ast.Constant(type='int', value='0')))
					new_blocks=gotomoveinrec(new_blocks,label,condition)
					statement=c_ast.While(cond=new_cond, stmt=c_ast.Compound(block_items=new_blocks))
					flag=False
					new_statements2=[]
				else:
					statement=c_ast.While(cond=statement.cond, stmt=statement.stmt)
				if flag==False:
					new_statements1.append(statement)
				else:
					new_statements2.append(statement)
			else:
				if flag==False:
					new_statements1.append(statement)
				else:
					new_statements2.append(statement)
		return new_statements1
	else:
		return statements



#Method to Move Goto Inside Recursive 
#Parameter pass statement 
#Label


def gotomoveinrec(statements,label,condition):
	flag_block1,condition=check_goto(statements,label)
	new_statements1=[]
	new_statements2=[]
	flag=False
	if flag_block1==True:
		for statement in statements:
			if type(statement) is c_ast.If:
				flag_stmt3=check_goto_block_If(statement,label)				
				flag_block2=check_label_If(statement,label)
				flag_stmt2=check_label_block_If(statement,label)
				if flag_stmt3==True:
					if flag_block2==True and flag_stmt2==True:
						new_statements1.append(statement)
					else:
						flag=True
				else:
					if flag_block2==True and flag_stmt2==False:
						flag=False
						new_statements1.append(c_ast.If(cond=c_ast.UnaryOp(op='!', expr=condition), iftrue=c_ast.Compound(block_items=new_statements2), iffalse=None))
						new_statements1.append(updateIfBlock(statement,label,condition))

						new_statements2=[]
					else:
						if flag_block2==True and flag_stmt2==True:
							flag=False
							if len(new_statements2)>0:
								new_statements1.append(c_ast.If(cond=c_ast.UnaryOp(op='!', expr=condition), iftrue=c_ast.Compound(block_items=new_statements2), iffalse=None))
							new_statements1.append(updateIfBlock(statement,label,condition))
							new_statements2=[]
						else:
							if flag==False:
								new_statements1.append(statement)
							else:
								new_statements2.append(statement)
			elif type(statement) is c_ast.While:
				flag_block2=check_label(statement.stmt.block_items,label)
				#flag_stmt2=check_label_block(statement.stmt.block_items,label)
				flag_stmt2=check_label_block_sp(statement.stmt.block_items,label)
				if flag_block2==False and flag_stmt2==False:
					statement=c_ast.While(cond=statement.cond, stmt=statement.stmt)
				elif flag_block2==True and flag_stmt2==True:
					if len(new_statements2)>0:
						new_statements1.append(c_ast.If(cond=c_ast.UnaryOp(op='!', expr=condition), iftrue=c_ast.Compound(block_items=new_statements2), iffalse=None))
					new_cond=c_ast.BinaryOp(op='||', left=condition, right=statement.cond)
					new_blocks=[]
					new_blocks.append(c_ast.If(cond=condition, iftrue=c_ast.Goto(name=label), iffalse=None))
					for stmt in statement.stmt.block_items:
						new_blocks.append(stmt)
					new_blocks.append(c_ast.Assignment(op='=', lvalue=c_ast.ID(name='go_'+label) , rvalue= c_ast.Constant(type='int', value='0')))
					statement=c_ast.While(cond=new_cond, stmt=c_ast.Compound(block_items=new_blocks))
					flag=False
					new_statements2=[]
				elif flag_block2==True and flag_stmt2==False:
					if len(new_statements2)>0:
						new_statements1.append(c_ast.If(cond=c_ast.UnaryOp(op='!', expr=condition), iftrue=c_ast.Compound(block_items=new_statements2), iffalse=None))
					new_cond=c_ast.BinaryOp(op='||', left=condition, right=statement.cond)
					new_blocks=[]
					new_blocks.append(c_ast.If(cond=condition, iftrue=c_ast.Goto(name=label), iffalse=None))
					for stmt in statement.stmt.block_items:
						new_blocks.append(stmt)
					new_blocks.append(c_ast.Assignment(op='=', lvalue=c_ast.ID(name='go_'+label) , rvalue= c_ast.Constant(type='int', value='0')))
					new_blocks=gotomoveinrec(new_blocks,label,condition)
					statement=c_ast.While(cond=new_cond, stmt=c_ast.Compound(block_items=new_blocks))
					flag=False
					new_statements2=[]
				else:
					statement=c_ast.While(cond=statement.cond, stmt=statement.stmt)
				if flag==False:
					new_statements1.append(statement)
				else:
					new_statements2.append(statement)
			else:
				if flag==False:
					new_statements1.append(statement)
				else:
					new_statements2.append(statement)
		return new_statements1
	else:
		return statements




#Updating Each If Else for Goto
#Parameter pass statement 
#Label

def updateIfBlock(statement,label,condition):
	new_iftrue=None
	new_iffalse=None
	new_condtion=None
	if type(statement) is c_ast.If:
		if type(statement.iftrue) is c_ast.Goto:
			if statement.iftrue.name==label:
				new_block=[]
				new_block.append(c_ast.If(cond=condition, iftrue=c_ast.Goto(name=label), iffalse=None))
				new_block.append(statement.iftrue)
		        	new_iftrue=c_ast.Compound(block_items=new_block)
		else:
			if type(statement.iftrue) is c_ast.Compound:
				flag_stmt=check_label(statement.iftrue.block_items,label)
				flag_stmt_block=check_label_block_sp(statement.iftrue.block_items,label)
			        if flag_stmt==True:
			        	new_block=[]
			        	new_block.append(c_ast.If(cond=condition, iftrue=c_ast.Goto(name=label), iffalse=None))
					for stmt in statement.iftrue.block_items:
						new_block.append(stmt)
					if flag_stmt_block==False:
						new_block=gotomoveinrec(new_block,label,condition)
					new_iftrue=c_ast.Compound(block_items=new_block)
				else:
					new_condtion=c_ast.BinaryOp(op='&&', left=c_ast.UnaryOp(op='!', expr=condition), right=statement.cond)
					new_iftrue=statement.iftrue
                         
			
		if type(statement.iffalse) is c_ast.Label:
			new_block=[]
			new_block.append(c_ast.If(cond=condition, iftrue=c_ast.Goto(name=label), iffalse=None))
			new_block.append(statement.iffalse)
		        new_iftrue=c_ast.Compound(block_items=new_block)
		else:
			if type(statement.iffalse) is c_ast.Compound:
				flag_stmt=check_label(statement.iffalse.block_items,label)
				flag_stmt_block=check_label_block_sp(statement.iffalse.block_items,label)
				if flag_stmt==True:
			        	new_block=[]
			        	new_block.append(c_ast.If(cond=condition, iftrue=c_ast.Goto(name=label), iffalse=None))
					for stmt in statement.iffalse.block_items:
						new_block.append(stmt)
					if flag_stmt_block==False:
						new_block=gotomoveinrec(new_block,label,condition)
					new_iffalse=c_ast.Compound(block_items=new_block)
				else:
					new_condtion=c_ast.BinaryOp(op='&&', left=c_ast.UnaryOp(op='!', expr=condition), right=statement.cond)
					new_iffalse=statement.iffalse
			else:
				if type(statement.iffalse) is c_ast.If:
					new_iffalse=updateIfBlock(statement.iffalse,label,condition)
	if new_condtion is not None:
		return c_ast.If(cond=new_condtion, iftrue=new_iftrue, iffalse=new_iffalse)
	else:
		return c_ast.If(cond=statement.cond, iftrue=new_iftrue, iffalse=new_iffalse)
	
	
	

def reOrganizeBreaks(statements,new_break_map):
	update_statement=[]
	if statements is not None:
		for statement in statements:
			if type(statement) is c_ast.If:
				statement=reOrganizeBreaksIf(statement,new_break_map)
				update_statement.append(statement)
			elif type(statement) is c_ast.Break:
				update_statement.append(c_ast.Assignment(op='=', lvalue=c_ast.ID(name='do_break'+str(len(new_break_map.keys())+1)), rvalue=c_ast.Constant(type='int', value='1')))
				new_break_map['do_break'+str(len(new_break_map.keys())+1)]='do_break'+str(len(new_break_map.keys())+1)
				update_statement.append(statement)
			else:
				update_statement.append(statement)
		return update_statement
	else:
		return None


def reOrganizeBreaksIf(statement,new_break_map):
	new_iftrue=None
	new_iffalse=None
	if type(statement) is c_ast.If:
		if type(statement.iftrue) is c_ast.Break:
			new_block=[]
			new_block.append(c_ast.Assignment(op='=', lvalue=c_ast.ID(name='do_break'+str(len(new_break_map.keys())+1)), rvalue=c_ast.Constant(type='int', value='1')))
			new_break_map['do_break'+str(len(new_break_map.keys())+1)]='do_break'+str(len(new_break_map.keys())+1)
			new_block.append(statement.iftrue)
			new_iftrue=c_ast.Compound(block_items=new_block)
		else:
			if type(statement.iftrue) is c_ast.Compound:
				new_block=reOrganizeBreaks(statement.iftrue.block_items,new_break_map)
				new_iftrue=c_ast.Compound(block_items=new_block)
		
		if type(statement.iffalse) is c_ast.Break:
			new_block=[]
			new_block.append(c_ast.Assignment(op='=', lvalue=c_ast.ID(name='do_break'+str(len(new_break_map.keys())+1)), rvalue=c_ast.Constant(type='int', value='1')))
			new_break_map['do_break'+str(len(new_break_map.keys())+1)]='do_break'+str(len(new_break_map.keys())+1)
			new_block.append(statement.iffalse)
			new_iffalse=c_ast.Compound(block_items=new_block)
		else:
			if type(statement.iffalse) is c_ast.Compound:
				new_block=reOrganizeBreaks(statement.iffalse.block_items,new_break_map)
				new_iffalse=c_ast.Compound(block_items=new_block)
			else:
				if type(statement.iffalse) is c_ast.If:
					new_iffalse=reOrganizeBreaksIf(statement.iffalse,new_break_map)
		return c_ast.If(cond=statement.cond, iftrue=new_iftrue, iffalse=new_iffalse)
		
		
		
def addingBreakVariables(statements,new_break_map):
	for variable in new_break_map.keys():
		global new_variable
		new_variable[variable]=variable
		new_block=[]
		new_block.append(c_ast.Assignment(op='=', lvalue=c_ast.ID(name=variable), rvalue=c_ast.Constant(type='int', value='0')))
		new_block.append(c_ast.Break())
		new_iftrue=c_ast.Compound(block_items=new_block)
		statements.append(c_ast.If(cond=c_ast.BinaryOp(op='==', left=c_ast.ID(name=variable), right=c_ast.Constant(type='int', value='1')), iftrue=new_iftrue, iffalse=None))
	return statements
	
	

def removeEmptyIfLoop(statements):
	update_statements=[]
	for statement in statements:
		if type(statement) is c_ast.If:
			statement=removeEmptyIfLoop_If(statement)
			if statement is not None:
				update_statements.append(statement)
		elif type(statement) is c_ast.While:
			new_block_items=removeEmptyIfLoop(statement.stmt.block_items)
			update_statements.append(c_ast.While(cond=statement.cond, stmt=c_ast.Compound(block_items=new_block_items)))
		else:
			update_statements.append(statement)
	return update_statements
			
			
			
def removeEmptyIfLoop_If(statement):
	new_iftrue=None
	new_iffalse=None
	if type(statement) is c_ast.If:
	
		if type(statement.iftrue) is c_ast.Compound:
			if len(statement.iftrue.block_items)==0:
				new_iftrue=None
			else:
				new_iftrue=statement.iftrue
		else:
			new_iftrue=statement.iftrue
			
		if type(statement.iffalse) is c_ast.Compound:
			if len(statement.iffalse.block_items)==0:
				new_iffalse=None
			else:
				new_iffalse=statement.iffalse
		elif type(statement.iffalse) is c_ast.If:
			result=removeEmptyIfLoop_If(statement.iffalse)
			if result is not None:
				new_iffalse=result
		else:
			new_iffalse=statement.iffalse
	
	if new_iftrue is not None and new_iffalse is None:
		return c_ast.If(cond=statement.cond, iftrue=new_iftrue, iffalse=None)
	elif new_iftrue is not None and new_iffalse is not None:
		return c_ast.If(cond=statement.cond, iftrue=new_iftrue, iffalse=new_iffalse)
	elif new_iffalse is not None and type(new_iffalse) is c_ast.Compound:
		return c_ast.If(cond=c_ast.UnaryOp(op='!', expr=statement.cond), iftrue=new_iffalse, iffalse=None)
	elif new_iffalse is not None and type(new_iffalse) is c_ast.If:
		return new_iffalse
	else:
		return None