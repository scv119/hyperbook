---------------------------- MODULE OneBitClock ----------------------------
            
=============================================================================
\* Modification History
\* Last modified Thu Jul 05 22:32:07 PDT 2018 by chenshen
\* Created Thu Jul 05 22:04:40 PDT 2018 by chenshen


VARIABLE b

TypeOK == b \in {0, 1}

Init1 == \/ b = 0
         \/ b = 1

Next1 == \/ /\ b = 0
            /\ b' = 1
         \/ /\ b = 1
            /\ b' = 0