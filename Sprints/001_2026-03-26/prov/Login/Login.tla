---- MODULE Login ----
VARIABLE status


TypeOK == status \in {"unregistered","validating","verifying","registered"}

AlwaysTypeOK == [] TypeOK

Init == status = "unregistered"

Register == 
    /\ status = "unregistered"
    /\ status' = "validating"
Validate ==
    /\ status = "validating"
    /\ status' = "verifying"
Verify ==
    /\ status = "verifying"
    /\ status' = "registered"

Done == status = "registered" /\ UNCHANGED status

Next == 
    \/ Register 
    \/ Validate 
    \/ Verify
    \/ Done

Spec == Init /\ [][Next]_status

Termination == <>(status = "registered")

\* Liveness == <>(status = "registered")

====