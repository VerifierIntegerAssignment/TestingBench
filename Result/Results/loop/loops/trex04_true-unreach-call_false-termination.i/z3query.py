from z3 import *
set_param(proof=True)
_p1=Int('_p1')
_p2=Int('_p2')
_n=Int('_n')
arraySort = DeclareSort('arraySort')
_f=Function('_f',IntSort(),IntSort())
c2_var=Bool('c2_var')
d=Int('d')
f2_2_RET=Int('f2_2_RET')
f2_2_c2_var=Int('f2_2_c2_var')
_1_PROVE=Int('_1_PROVE')
RET=Int('RET')
_1DUMMY=Int('_1DUMMY')
f2_1_RET=Int('f2_1_RET')
f2_1_c1_var=Int('f2_1_c1_var')
_2DUMMY=Int('_2DUMMY')
f2_2_c1_var=Int('f2_2_c1_var')
_1_ASSUME=Int('_1_ASSUME')
x=Int('x')
c1_var=Bool('c1_var')
f2_1_c2_var=Int('f2_1_c2_var')
_1DUMMY1=Int('_1DUMMY1')
_1_ASSUME1=Int('_1_ASSUME1')
c2_var1=Bool('c2_var1')
f2_1_RET1=Int('f2_1_RET1')
f2_2_c1_var1=Int('f2_2_c1_var1')
_2DUMMY1=Int('_2DUMMY1')
f2_1_c2_var1=Int('f2_1_c2_var1')
_1_PROVE1=Int('_1_PROVE1')
RET1=Int('RET1')
f2_2_c2_var1=Int('f2_2_c2_var1')
f2_2_RET1=Int('f2_2_RET1')
f2_1_c1_var1=Int('f2_1_c1_var1')
c1_var1=Bool('c1_var1')
x1=Int('x1')
d1=Int('d1')
_N1=Const('_N1',IntSort())
_n1=Int('_n1')
__VERIFIER_nondet_bool=Int('__VERIFIER_nondet_bool')
__VERIFIER_nondet_int=Int('__VERIFIER_nondet_int')
__VERIFIER_nondet_bool=Int('__VERIFIER_nondet_bool')
main=Int('main')
__VERIFIER_assert=Function('__VERIFIER_assert',RealSort(),IntSort())
__VERIFIER_nondet_bool=Int('__VERIFIER_nondet_bool')
__VERIFIER_nondet_bool=Int('__VERIFIER_nondet_bool')
foo=Bool('foo')
_s=Solver()
_s.add(ForAll([_n],Implies(_n>=0, _f(_n)==_n)))
_s.set("timeout",60000)
_s.add(d1 == If(__VERIFIER_nondet_bool > 0,If(__VERIFIER_nondet_bool > 0,1-1,1)-1,If(__VERIFIER_nondet_bool > 0,1-1,1)))
_s.add(f2_2_RET1 == If(__VERIFIER_nondet_bool > 0,0,0))
_s.add(f2_2_c2_var1 == If(__VERIFIER_nondet_bool > 0,__VERIFIER_nondet_bool,0))
_s.add(c2_var1 == __VERIFIER_nondet_bool)
_s.add(main == 0)
_s.add(_1DUMMY1 == 0)
_s.add(f2_1_c1_var1 == If(__VERIFIER_nondet_bool > 0,__VERIFIER_nondet_bool,0))
_s.add(_2DUMMY1 == 0)
_s.add(f2_2_c1_var1 == If(__VERIFIER_nondet_bool > 0,__VERIFIER_nondet_bool,0))
_s.add(f2_1_RET1 == If(__VERIFIER_nondet_bool > 0,0,0))
_s.add(x1 == ((-_N1*If(__VERIFIER_nondet_bool > 0,If(__VERIFIER_nondet_bool > 0,1-1,1)-1,If(__VERIFIER_nondet_bool > 0,1-1,1)))+__VERIFIER_nondet_int))
_s.add(c1_var1 == __VERIFIER_nondet_bool)
_s.add(f2_1_c2_var1 == If(__VERIFIER_nondet_bool > 0,__VERIFIER_nondet_bool,0))
_s.add((_N1>=(__VERIFIER_nondet_int/If(__VERIFIER_nondet_bool > 0,If(__VERIFIER_nondet_bool > 0,1-1,1)-1,If(__VERIFIER_nondet_bool > 0,1-1,1)))))
_s.add(ForAll([_n1],Implies(And(_n1 < _N1,_n1>=0),(((-_f(_n1)*If(__VERIFIER_nondet_bool > 0,If(__VERIFIER_nondet_bool > 0,1-1,1)-1,If(__VERIFIER_nondet_bool > 0,1-1,1)))+__VERIFIER_nondet_int)>0))))
_s.add(Or(_N1==0,(((-(_N1-1)*If(__VERIFIER_nondet_bool > 0,If(__VERIFIER_nondet_bool > 0,1-1,1)-1,If(__VERIFIER_nondet_bool > 0,1-1,1)))+__VERIFIER_nondet_int)>0)))
_s.add(_N1>=0)
_s.add(And(__VERIFIER_nondet_int <= 1000000,__VERIFIER_nondet_int >= -1000000))
_s.add(Not((((-_N1*If(__VERIFIER_nondet_bool > 0,If(__VERIFIER_nondet_bool > 0,1-1,1)-1,If(__VERIFIER_nondet_bool > 0,1-1,1)))+__VERIFIER_nondet_int)<=0)))
if sat==_s.check():
	print "Counter Example"
	print _s.model()
	witnessXmlStr=['<?xml version="1.0" encoding="UTF-8" standalone="no"?><graphml xmlns="http://graphml.graphdrawing.org/xmlns" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><key attr.name="isEntryNode" attr.type="boolean" for="node" id="entry"><default>false</default></key><key attr.name="isViolationNode" attr.type="boolean" for="node" id="violation"><default>false</default></key><key attr.name="witness-type" attr.type="string" for="graph" id="witness-type"/><key attr.name="sourcecodelang" attr.type="string" for="graph" id="sourcecodelang"/><key attr.name="producer" attr.type="string" for="graph" id="producer"/><key attr.name="specification" attr.type="string" for="graph" id="specification"/><key attr.name="programFile" attr.type="string" for="graph" id="programfile"/><key attr.name="programHash" attr.type="string" for="graph" id="programhash"/><key attr.name="memoryModel" attr.type="string" for="graph" id="memorymodel"/><key attr.name="architecture" attr.type="string" for="graph" id="architecture"/><key attr.name="startline" attr.type="int" for="edge" id="startline"/><key attr.name="assumption" attr.type="string" for="edge" id="assumption"/><key attr.name="assumption.scope" attr.type="string" for="edge" id="assumption.scope"/><key attr.name="assumption.resultfunction" attr.type="string" for="edge" id="assumption.resultfunction"/><graph edgedefault="directed"><data key="witness-type">violation_witness</data><data key="sourcecodelang">C</data><data key="producer">CPAchecker 1.6.1-svn</data><data key="specification">CHECK( init(main()), LTL(G ! call(__VERIFIER_error())) )</data><data key="programfile">sv-benchmarks/loops/trex04_true-unreach-call_false-termination.i</data><data key="programhash">1776ed2413d170f227b69d8c79ba700d31db6f75</data><data key="memorymodel">precise</data><data key="architecture">32bit</data><node id="entry"><data key="entry">true</data></node><node id="error"><data key="violation">true</data></node><edge source="entry" target="error">', '<data key="assumption.scope">main</data><data key="assumption.resultfunction">__VERIFIER_nondet_int</data></edge></graph></graphml>', 'main', 'sv-benchmarks/loops/trex04_true-unreach-call_false-termination.i']
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