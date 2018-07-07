-------------------------------- MODULE GCD --------------------------------

EXTENDS Integers

Divides(p, n) == \E q \in Int : n = q * p
DivisorsOf(n) == {p \in Int : Divides(p, n)} 
SetMax(S) == 
    CHOOSE i \in S : \A j \in S : i >= j
GCD(m, n) ==
    SetMax(DivisorsOf(m) \cap DivisorsOf(n))
    
=============================================================================
\* Modification History
\* Last modified Sat Jul 07 14:39:10 PDT 2018 by chenshen
\* Created Fri Jul 06 09:56:00 PDT 2018 by chenshen
