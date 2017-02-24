>>> file_name='sv-benchmarks/loops/sum04_false-unreach-call_true-termination.i'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_PROVE = 0;
  int i;
  int sn = 0;
  i = 1;
  while (i <= 8)
  {
    if (i < 4)
    {
      sn = sn + 2;
    }

    i = i + 1;
  }

  _1_PROVE = (sn == (8 * 2)) || (sn == 0);
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ i:int _1_PROVE:int sn:int RET:int}
Program Body
{
  int RET = 0;
  int _1_FAILED = 0;
  if (cond <= 0)
  {
    ERROR:


    _1_FAILED = 1;
  }

}

Function Name:
__VERIFIER_assert
Return Type:
void
Input Variables:
{ cond:int}
Local Variables:
{ _1_FAILED:int RET:int}
Output for main:
Output in prefix notation:
1. Frame axioms:

2. Output equations:
(= i1 (+ _N1 1))
(= sn1 (sn3 _N1))
(= main 0)

3. Other axioms:
(= (sn3 (+ _n1 1)) (ite (< (+ _n1 1) 4) (+ (sn3 _n1) 2) (sn3 _n1)))
(= (sn3 0) 0)
(> (+ _N1 1) 8)
(implies (< _n1 _N1) (<= (+ _n1 1) 8))

Output in normal notation:
1. Frame axioms:

2. Output equations:
i1 = (_N1+1)
sn1 = sn3(_N1)
main = 0

3. Other axioms:
sn3((_n1+1)) = ite(((_n1+1)<4),(sn3(_n1)+2),sn3(_n1))
sn3(0) = 0
((_N1+1)>8)
(_n1<_N1) -> ((_n1+1)<=8)

4. Assumption :

5. Assertion :
((sn3(_N1)==(8*2)) or (sn3(_N1)==0))
Output for __VERIFIER_assert:
Output in prefix notation:
1. Frame axioms:
(= (cond1 cond) cond)

2. Output equations:
(= (_1_FAILED1 cond) (ite (<= cond 0) 1 0))
(= (__VERIFIER_assert cond) 0)

3. Other axioms:

Output in normal notation:
1. Frame axioms:
cond1(cond) = cond

2. Output equations:
_1_FAILED1(cond) = ite((cond<=0),1,0)
__VERIFIER_assert(cond) = 0

3. Other axioms:

4. Assumption :

5. Assertion :

----Proving Process----


Function Name--main

Assertion To Prove:Or((sn3(_N1)==16),(sn3(_N1)==0))
Counter Example
[i1 = 9,
 _N1 = 8,
 main = 0,
 sn1 = 6,
 sn3 = [else -> sn3!36(k!35(Var(0)))],
 k!35 = [else ->
         If(Var(0) >= 0,
            If(Var(0) >= 1,
               If(Var(0) >= 2,
                  If(Var(0) >= 3,
                     If(Var(0) >= 4,
                        If(Var(0) >= 5,
                           If(Var(0) >= 6,
                              If(Var(0) >= 7,
                                 If(Var(0) >= 8,
                                    If(Var(0) >= 9,
                                       If(Var(0) >= 10,
                                        If(Var(0) >= 11,
                                        If(Var(0) >= 12,
                                        If(Var(0) >= 13,
                                        If(Var(0) >= 14,
                                        If(Var(0) >= 15,
                                        If(Var(0) >= 16,
                                        If(Var(0) >= 17,
                                        If(Var(0) >= 18,
                                        If(... >= ...,
                                        If(..., ..., ...),
                                        18),
                                        17),
                                        16),
                                        15),
                                        14),
                                        13),
                                        12),
                                        11),
                                        10),
                                        9),
                                       8),
                                    7),
                                 6),
                              5),
                           4),
                        3),
                     2),
                  1),
               0),
            -1)],
 _f = [0 -> 0,
       1 -> 1,
       2 -> 2,
       3 -> 3,
       4 -> 4,
       5 -> 5,
       6 -> 6,
       else ->
       If(Or(Var(0) >= 8, Not(Var(0) >= 0)), Var(0), 7)],
 sn3!36 = [0 -> 0, 1 -> 2, 2 -> 4, else -> 6]]


Function Name--__VERIFIER_assert
No Assertion to Prove
1