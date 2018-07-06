-------------------------- MODULE PCalOneBitClock --------------------------
EXTENDS Integers
(*
--algorithm Clock {
    variable b \in {0, 1};
    { while (TRUE) { b := (b + 1) % 2
                   }
    }
}
 *)
\* BEGIN TRANSLATION
VARIABLE b

vars == << b >>

Init == (* Global variables *)
        /\ b \in {0, 1}

Next == b' = (b + 1) % 2

Spec == Init /\ [][Next]_vars

\* END TRANSLATION

TypeOK == b \in {0, 1}

=============================================================================
\* Modification History
\* Last modified Thu Jul 05 22:34:29 PDT 2018 by chenshen
\* Created Thu Jul 05 22:28:49 PDT 2018 by chenshen
