#-----------------------------------------------------------------
# Syntax Translator
#
# Syntax Translator  and  rewriting AST
#
# September 02 2016, Pritom Rajkhowa
# Project: VIAP
#-----------------------------------------------------------------
import sys

from pycparser import parse_file,c_parser, c_ast, c_generator




def test(filename):
    content=None
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
    body_comp = c_ast.Compound(block_items=syntaxTranslate(statements))
    generator = c_generator.CGenerator()
    
    print(generator.visit(body_comp))
       
    #generator = c_generator.CGenerator()
    
    #print(generator.visit(new_function))
    
    


def syntaxTranslate(statements):
        update_statements=[]
        for statement in statements:
                if type(statement) is c_ast.UnaryOp:
                        if statement.op=='++' or statement.op=='p++':
                                update_statements.append(c_ast.Assignment(op='=',lvalue=statement.expr, rvalue=c_ast.BinaryOp(op='+',left=statement.expr, right=c_ast.Constant('int','1'))))
                        elif statement.op=='--' or statement.op=='p--':
                                update_statements.append(c_ast.Assignment(op='=',lvalue=statement.expr, rvalue=c_ast.BinaryOp(op='-',left=statement.expr, right=c_ast.Constant('int','1'))))
                        else:
                                update_statements.append(statement)
                elif type(statement) is c_ast.For:
                        update_statements.append(statement.init)
                        new_block_items=statement.stmt.block_items
                        new_block_items.append(statement.next)
                        new_block_items=syntaxTranslate(new_block_items)
                        new_stmt=c_ast.Compound(block_items=new_block_items)
                        update_while=c_ast.While(statement.cond,new_stmt)
                        update_statements.append(update_while)
                elif type(statement) is c_ast.DoWhile:
		        new_block_items=statement.stmt.block_items
		        for item in new_block_items:
		        	update_statements.append(item)
		        new_block_items=syntaxTranslate(new_block_items)
		        new_stmt=c_ast.Compound(block_items=new_block_items)
		        update_while=c_ast.While(statement.cond,new_stmt)
                        update_statements.append(update_while)
                elif type(statement) is c_ast.Switch:
                	stmts=statement.stmt.block_items
                	statement=convertToIfElse(stmts,statement.cond)
                	update_statements.append(statement)
                else:
                        update_statements.append(statement)
        return update_statements


def convertToIfElse(statements,condition):
	if statements is not None and len(statements)>0:
		statement=statements[0]
		if type(statement) is not c_ast.Default:
			new_condition_left=constructCondition(statements,condition)
			new_condition_right,new_block_items,statements,is_break=constructBody(statements,condition)
			new_compund_left=c_ast.Compound(block_items=new_block_items)
			
			if new_condition_left is not None:
				new_Else_stmt=convertToIfElse(statements,condition)
				new_If_stmt=c_ast.If(cond=c_ast.BinaryOp(op='||', left=new_condition_left, right=new_condition_right),iftrue=new_compund_left,iffalse=new_Else_stmt)
				return new_If_stmt
			else:
				new_Else_stmt=convertToIfElse(statements,condition)
				new_If_stmt=c_ast.If(cond=new_condition_right,iftrue=new_compund_left,iffalse=new_Else_stmt)
				return new_If_stmt
		else:
			update_stmts=[]
			for stmt in statement.stmts:
				if type(stmt) is not c_ast.Break:
					update_stmts.append(stmt)
			return c_ast.Compound(block_items=update_stmts)
		

	return None
	
def constructCondition(statements,condition):
	if statements is not None and len(statements)>0:
		statement=statements[0]
		if type(statement) is not c_ast.Default:
			if len(statement.stmts)==0:
				new_condition_left=c_ast.BinaryOp(op='==', left=condition, right=statement.expr)
				new_condition_right=constructCondition(statements[1:],condition)
				if new_condition_right is None:
					return new_condition_left
				else:
					return c_ast.BinaryOp(op='||', left=new_condition_left, right=new_condition_right)
			else:
				return None
		else:
			return None
	return None

def constructBody(statements,condition):
	if statements is not None and len(statements)>0:
		statement=statements[0]
		if type(statement) is not c_ast.Default:
			if len(statement.stmts)>0:
				update_stmts=[]
				new_condition=c_ast.BinaryOp(op='==', left=condition, right=statement.expr)
				is_break=False
				for stmt in statement.stmts:
					if type(stmt) is c_ast.Break:
						is_break=True;
					else:
						update_stmts.append(stmt)
				return new_condition,update_stmts,statements[1:],is_break
			else:
				return constructBody(statements[1:],condition)
		else:
			return None,None,None,False
	return None,None,None,False


