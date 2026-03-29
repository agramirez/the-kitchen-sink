---- MODULE Login ----
VARIABLE status


TypeOK == status \in {"red","green","yellow"}

AlwaysTypeOK == [] TypeOK

Init == status = "red"

Register == 
    /\ status = "red"
    /\ status' = "green"
Validate ==
    /\ status = "green"
    /\ status' = "yellow"
Verify ==
    /\ status = "yellow"
    /\ status' = "red"

Next == 
    \/ Register 
    \/ Validate 
    \/ Verify

Spec == Init /\ [][Next]_status

\* Liveness == <>(status = "red")

====