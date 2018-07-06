------------------------------ MODULE DieHard ------------------------------
EXTENDS Integers

VARIABLES big, small

Init == /\ big = 0
        /\ small = 0

FillSmall == /\ small' = 3
             /\ big' = big
             
FillBig ==  /\ big' = 5
            /\ small' = small
            
EmptySmall == /\ small' = 0
              /\ big' = big
              
EmptyBig == /\ small' = small
            /\ big' = 0
 
Min(m, n) == IF m < n THEN m ELSE n

SmallToBig ==
    LET poured == Min(big + small, 5) - big
    IN  /\ big' = big + poured
        /\ small' = small - poured
   
BigToSmall == 
    LET poured == Min(big + small, 3) - small
    IN  /\ big' = big - poured
        /\ small' = small + poured      

Next == \/ FillSmall
        \/ FillBig
        \/ EmptySmall
        \/ EmptyBig
        \/ SmallToBig
        \/ BigToSmall
 
TypeOK == /\ big   \in 0..5
          /\ small \in 0..3
          
UnSolvable == big /= 4
              

=============================================================================
\* Modification History
\* Last modified Thu Jul 05 22:55:01 PDT 2018 by chenshen
\* Created Thu Jul 05 22:39:11 PDT 2018 by chenshen
