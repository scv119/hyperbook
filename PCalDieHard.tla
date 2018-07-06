---------------------------- MODULE PCalDieHard ----------------------------
EXTENDS Integers

Min(m,n) == IF m < n THEN m ELSE n

(*

--algorithm DieHard {
    variables big = 0, small = 0;
    { while ( TRUE)
       { either big := 5
        or     small:= 3
        or     big := 0
        or     small := 0
        or     with ( poured = Min(big + small, 3) - small )
               {
                    big := big - poured;
                    small := small + poured
               }
        or     with ( poured = Min(big + small, 5) - big )
               {
                    big := big + poured;
                    small := small - poured
               }
        }
    }
}

*)
\* BEGIN TRANSLATION
VARIABLES big, small

vars == << big, small >>

Init == (* Global variables *)
        /\ big = 0
        /\ small = 0

Next == \/ /\ big' = 5
           /\ small' = small
        \/ /\ small' = 3
           /\ big' = big
        \/ /\ big' = 0
           /\ small' = small
        \/ /\ small' = 0
           /\ big' = big
        \/ /\ LET poured == Min(big + small, 3) - small IN
                /\ big' = big - poured
                /\ small' = small + poured
        \/ /\ LET poured == Min(big + small, 5) - big IN
                /\ big' = big + poured
                /\ small' = small - poured

Spec == Init /\ [][Next]_vars

\* END TRANSLATION

 
TypeOK == /\ big   \in 0..5
          /\ small \in 0..3

=============================================================================
\* Modification History
\* Last modified Thu Jul 05 23:03:20 PDT 2018 by chenshen
\* Created Thu Jul 05 22:57:19 PDT 2018 by chenshen
