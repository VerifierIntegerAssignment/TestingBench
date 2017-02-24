from z3 import *
set_param(proof=True)
_p1=Int('_p1')
_p2=Int('_p2')

_n=Int('_n')

x1=Int('x1')
y1=Int('y1')
i1=Int('i1')
j1=Int('j1')
i=Int('i')
j=Int('j')
_y6=Int('_y6')
_y7=Int('_y7')
_n1=Int('_n1')
__VERIFIER_nondet_int=Int('__VERIFIER_nondet_int')
_N1=Function('_N1',IntSort(),IntSort())
x2=Function('x2',IntSort(),IntSort(),IntSort())
y2=Function('y2',IntSort(),IntSort(),IntSort())



_s=Solver()
_s.set("timeout",60000)

_s.add(i1 == __VERIFIER_nondet_int)
_s.add(j1 == __VERIFIER_nondet_int)
_s.add(y1 == y2(_N1(__VERIFIER_nondet_int),__VERIFIER_nondet_int))
_s.add(x1 == x2(_N1(__VERIFIER_nondet_int),__VERIFIER_nondet_int))
_s.add(And((__VERIFIER_nondet_int>=0),(__VERIFIER_nondet_int>=0)))
_s.add(ForAll([_n1,_y6],Implies(_n1>=0,y2((_n1+1),_y6) == (y2(_n1,_y6)-1))))
_s.add(ForAll([_n1,_y7],Implies(_n1>=0,x2((_n1+1),_y7) == (x2(_n1,_y7)-1))))
_s.add(ForAll([_y6],y2(0,_y6) == _y6))
_s.add(ForAll([_y7],x2(0,_y7) == _y7))
_s.add(ForAll([_y7],(x2(_N1(_y7),_y7)==0)))
_s.add(ForAll([_n1,_y7],Implies(And(_n1>=0,(_n1<_N1(_y7))),(x2(_n1,_y7)!=0))))
_s.add(ForAll([_y7],Implies(_N1(_y7)==0,Not(_y7!=0))))
_s.add(ForAll([_y7],Implies(Not(_y7!=0),_N1(_y7)==0)))
_s.add(ForAll([_n1,_y7],Implies(And(_n1>=0,_N1(_y7)==_n1+1),(_n1==_N1((_y7-1))))))
_s.add(ForAll([_n1,_y7],Implies(And(_n1>=0,(_n1==_N1((_y7-1)))),_N1(_y7)==_n1+1)))
_s.add(ForAll([_n1,_y6],Implies(_n1>=0,y2((_n1+1),_y6) == y2(_n1,(_y6-1)))))
_s.add(ForAll([_n1,_y7],Implies(_n1>=0,x2((_n1+1),_y7) == x2(_n1,(_y7-1)))))
_s.add(ForAll([_y7],_N1(_y7)>=0))
_s.add(Not(Implies(y2(_N1(__VERIFIER_nondet_int),__VERIFIER_nondet_int)==0,y2(_N1(__VERIFIER_nondet_int+1),__VERIFIER_nondet_int+1)==0)))
#_s.add(Not(Implies(Implies((__VERIFIER_nondet_int==__VERIFIER_nondet_int),y2(_N1(__VERIFIER_nondet_int),__VERIFIER_nondet_int)==0),Implies((__VERIFIER_nondet_int+1==__VERIFIER_nondet_int+1),y2(_N1(__VERIFIER_nondet_int+1),__VERIFIER_nondet_int+1)==0))))
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