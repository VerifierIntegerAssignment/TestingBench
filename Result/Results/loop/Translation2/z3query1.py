from z3 import *
set_param(proof=True)
_p1=Int('_p1')
_p2=Int('_p2')
x1=Int('x1')
y1=Int('y1')
_n=Int('_n')
_n1=Int('_n1')
_y1=Int('_y1')
_y2=Int('_y2')
x4=Function('x4',IntSort(),IntSort(),IntSort())
y4=Function('y4',IntSort(),IntSort(),IntSort(),IntSort())
_N1=Function('_N1',IntSort(),IntSort())
__VERIFIER_nondet_int=Int('__VERIFIER_nondet_int')

_s=Solver()
_s.set("timeout",60000)
_s.add(y1 == y4(_N1(0),50,0))
_s.add(x1 == x4(_N1(0),0))
_s.add(ForAll([_n1,_y2,_y1],Implies(_n1>=0,y4((_n1+1),_y1,_y2) == If((x4(_n1,_y2)<50),y4(_n1,_y1,_y2),(y4(_n1,_y1,_y2)+1)))))
_s.add(ForAll([_n1,_y2],Implies(_n1>=0,x4((_n1+1),_y2) == If((x4(_n1,_y2)<50),(x4(_n1,_y2)+1),(x4(_n1,_y2)+1)))))
_s.add(ForAll([_y1,_y2],Implies(_n1>=0,y4(0,_y1,_y2) == _y1)))
_s.add(ForAll([_y2],x4(0,_y2) == _y2))
_s.add(ForAll([_y2],(0>=(-(x4(_N1(_y2),_y2))+100))))
_s.add(ForAll([_n1,_y2],Implies(And(_n1>=0,_n1<_N1(_y2)),(x4(_n1,_y2)<100))))
_s.add(ForAll([_n1,_y2,_y1],Implies(_n1>=0,y4((_n1+1),_y1,_y2) == y4(_n1,If((_y2<50),_y1,(_y1+1)),If((_y2<50),(_y2+1),(_y2+1))))))
_s.add(ForAll([_n1,_y2],Implies(_n1>=0,x4((_n1+1),_y2) == x4(_n1,If((_y2<50),(_y2+1),(_y2+1))))))
_s.add(ForAll([_y2],Implies(_N1(_y2)==0,Not(_y2<100))))
_s.add(ForAll([_y2],Implies(Not(_y2<100),_N1(_y2)==0)))
_s.add(ForAll([_n1,_y2],Implies(And(_n1>=0,(_n1==_N1(If((_y2<50),(_y2+1),(_y2+1))))),_N1(_y2)==_n1+1)))
_s.add(ForAll([_n1,_y2],Implies(And(_n1>=0,_N1(_y2)==_n1+1),(_n1==_N1(If((_y2<50),(_y2+1),(_y2+1)))))))
_s.add(Not(y4(_N1(0),50,0)==100))
if sat==_s.check():
	print "Counter Example"
	print _s.model()
	witnessXmlStr=['<?xml version="1.0" encoding="UTF-8" standalone="no"?><graphml xmlns="http://graphml.graphdrawing.org/xmlns" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><key attr.name="isEntryNode" attr.type="boolean" for="node" id="entry"><default>false</default></key><key attr.name="isViolationNode" attr.type="boolean" for="node" id="violation"><default>false</default></key><key attr.name="witness-type" attr.type="string" for="graph" id="witness-type"/><key attr.name="sourcecodelang" attr.type="string" for="graph" id="sourcecodelang"/><key attr.name="producer" attr.type="string" for="graph" id="producer"/><key attr.name="specification" attr.type="string" for="graph" id="specification"/><key attr.name="programFile" attr.type="string" for="graph" id="programfile"/><key attr.name="programHash" attr.type="string" for="graph" id="programhash"/><key attr.name="memoryModel" attr.type="string" for="graph" id="memorymodel"/><key attr.name="architecture" attr.type="string" for="graph" id="architecture"/><key attr.name="startline" attr.type="int" for="edge" id="startline"/><key attr.name="assumption" attr.type="string" for="edge" id="assumption"/><key attr.name="assumption.scope" attr.type="string" for="edge" id="assumption.scope"/><key attr.name="assumption.resultfunction" attr.type="string" for="edge" id="assumption.resultfunction"/><graph edgedefault="directed"><data key="witness-type">violation_witness</data><data key="sourcecodelang">C</data><data key="producer">CPAchecker 1.6.1-svn</data><data key="specification">CHECK( init(main()), LTL(G ! call(__VERIFIER_error())) )</data><data key="programfile">sv-benchmarks/loop-invgen/apache-escape-absolute_true-unreach-call_true-termination.i</data><data key="programhash">1776ed2413d170f227b69d8c79ba700d31db6f75</data><data key="memorymodel">precise</data><data key="architecture">32bit</data><node id="entry"><data key="entry">true</data></node><node id="error"><data key="violation">true</data></node><edge source="entry" target="error">', '<data key="assumption.scope">main</data><data key="assumption.resultfunction">__VERIFIER_nondet_int</data></edge></graph></graphml>', 'main', 'sv-benchmarks/loop-invgen/apache-escape-absolute_true-unreach-call_true-termination.i']
	middle=''
	for element in _s.model():
		if str(element)==witnessXmlStr[2]:
			middle+='<data key="assumption">'+'\\'+'result=='+str(_s.model()[element])+'</data>'
	file = open(witnessXmlStr[3]+'_witness.graphml', 'w')
	file.write(witnessXmlStr[0]+middle+witnessXmlStr[1])
	file.close()
elif unsat==_s.check():
	_s.check()
	if os.path.isfile('j2llogs.logs'):
		file = open('j2llogs.logs', 'a')
		file.write("\n**************\nProof Details\n**************\n"+str(_s.proof().children())+"\n")
		file.close()
	else:
		file = open('j2llogs.logs', 'w')
		file.write("\n**************\nProof Details\n**************\n"+str(_s.proof().children())+"\n")
		file.close()
	print "Successfully Proved"
else:
	print "Failed To Prove"