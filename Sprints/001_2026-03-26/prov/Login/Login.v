From Stdlib Require Import String.

Module Utils.

End Utils.

Module Process.
(* some datatypes for date/time *)
Inductive date : Type :=
    | Date (year:nat) (month:nat) (day:nat).
Inductive time : Type :=
    | Time (hour:nat) (minute:nat) (second:nat) (milli:nat).
Inductive datetime : Type :=
    | DateTime (d:date) (t:time).

(* data structures we will need for the registration process *)
Inductive email : Type :=
    | Email (name:string) (domain:string) (tld:string).
Inductive password : Type :=
    | Password (actual:string) (verify:string).
Inductive otp : Type :=
    | OTP (d:datetime) (v:string).
(* this will be the final user state once they are registered *)
Inductive user : Type :=
    | User (id:nat) (e:email).

(* these are the various registration states *)
Inductive state : Type :=
    | Unregistered (* an unregistered user is a new user*)
    | Validating (e:email) (p:password) (* a user in the validation phase has entered their email and password, and we are checking that they are valid *)
    | Verifying (e:email) (o:otp) (* a user in the verifying stage has been sent an OTP which they must enter within a certain time frame to validate their email *)
    | Registered (u:user). (* once the user has been validated, they are registered and receive a userid *)

Definition next_state (s:state) : state :=
    match s with
        | Unregistered => Validating (Email "name" "domain" "com") (Password "12345" "12345")
        | Validating e _ => Verifying e (OTP (DateTime (Date 2026 1 1) (Time 0 0 0 0)) "abc")
        | Verifying e _ => Registered (User 1 e)
        | Registered u => Registered u
    end.

Definition is_valid_email (s:state) : bool :=
    match s with
        | Verifying e _ =>
            match e with
                | Email _ _ _ => true
            end
        | _ => false
    end.

End Process.

