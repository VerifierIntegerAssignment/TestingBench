>>> file_name='sv-benchmarks/loop-new/gauss_sum_true-unreach-call_true-termination-i.c'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_ASSUME = 0;
  int _1_PROVE = 0;
  int n;
  int sum;
  int i;
  n = __VERIFIER_nondet_int();
  _1_ASSUME = (1 <= n) && (n <= 1000);
  sum = 0;
  i = 1;
  while (i <= n)
  {
    sum = sum + i;
    i = i + 1;
  }

  _1_PROVE = (2 * sum) == (n * (n + 1));
  RET = 0;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ i:int sum:int _1_PROVE:int RET:int n:int _1_ASSUME:int}
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
(= sum1 (/ (+ (- (+ (** _N1 2) (* (* 2 _N1) 1)) _N1) (* 2 0)) 2))
(= main 0)
(= n1 __VERIFIER_nondet_int)

3. Other axioms:
(> (+ _N1 1) __VERIFIER_nondet_int)
(implies (< _n1 _N1) (<= (+ _n1 1) __VERIFIER_nondet_int))

Output in normal notation:
1. Frame axioms:

2. Output equations:
i1 = (_N1+1)
sum1 = (((((_N1**2)+((2*_N1)*1))-_N1)+(2*0))/2)
main = 0
n1 = __VERIFIER_nondet_int

3. Other axioms:
((_N1+1)>__VERIFIER_nondet_int)
(_n1<_N1) -> ((_n1+1)<=__VERIFIER_nondet_int)

4. Assumption :
((1<=__VERIFIER_nondet_int) and (__VERIFIER_nondet_int<=1000))

5. Assertion :
((2*(((((_N1**2)+((2*_N1)*1))-_N1)+(2*0))/2))==(__VERIFIER_nondet_int*(__VERIFIE
R_nondet_int+1)))
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

Assertion To Prove:((2*(_N1 + _N1*_N1/2))==__VERIFIER_nondet_int*__VERIFIER_nond
et_int + 1)
Counter Example
[__VERIFIER_nondet_int = 2,
 i1 = 3,
 _N1 = 2,
 sum1 = 4,
 main = 0,
 n1 = 2,
 _f = [0 -> 0,
       else ->
       If(Or(Var(0) >= 2, Not(Var(0) >= 0)), Var(0), 1)]]


Function Name--__VERIFIER_assert
No Assertion to Prove
0