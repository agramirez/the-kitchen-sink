Module Utils.
    Definition negb (b:bool) : bool :=
        if b then false else true.

    Fixpoint eqb (n m:nat) : bool :=
        match n,m with
            | O,O => true
            | S n', S m' => eqb n' m'
            | _,_ => false
        end.

    Definition neqb (n m:nat) : bool :=
        negb (eqb n m).

    Fixpoint gtb (n m:nat) : bool :=
        match n,m with
            | S _,O => true
            | S n', S m' => gtb n' m'
            | _,_ => false
        end.

    Fixpoint ltb (n m:nat) : bool :=
        match n,m with
            | O,S _ => true
            | S n', S m' => ltb n' m'
            | _,_ => false
        end.

End Utils.

From Stdlib Require Import String.
Module Features.
Import Utils.

Inductive date : Type :=
    | Date (year:nat) (month:nat) (day:nat).
Inductive time : Type :=
    | Time (hour:nat) (minut:nat) (second:nat) (millisecond:nat).
Inductive datetime : Type :=
    | DateTime (d:date) (t:time).

Inductive email : Type :=
    | Email (prefix:string) (domain:string) (tld:string).

Inductive state : Type :=
    | Unregistered
    | Registering (e:email) (p:string) (vp:string)
    | Verifying (t:datetime) (otp:string)
    | Registered (e:email) (p:string).

Inductive state_order : Type :=
    | Before
    | After
    | Same.

Definition compare_state_order (s1 s2:state) : state_order :=
    match s1, s2 with
        | Unregistered,Unregistered => Same
        | Unregistered,_ => Before
        | Registering _ _ _, Registering _ _ _ => Same
        | Registering _ _ _, Unregistered => After
        | Registering _ _ _, _ => Before
        | Verifying _ _, Verifying _ _ => Same
        | Verifying _ _, Registered _ _ => Before
        | Verifying _ _, _ => After
        | Registered _ _, Registered _ _ => Same
        | Registered _ _, _ => After
    end.

Definition is_valid_email (e:email) : bool :=
    true.

Definition is_valid (s:state) : bool :=
    match s with
        | Unregistered => true
        | Registering email pass veri_pass =>
            match 
                is_valid_email(email),
                is_valid_password(password), 
                is_valid_verification_password(pass,veri_pass) 
            with
                | true,true,true => true
                | _,_,_ => false
            end
        | Verifying sent, otp =>
            match
                is_valid_otp(sent,otp)
            with
                | true => true
                | _ => false
            end
        | Registered _ _ => true
    end.

Definition next_state (s:state) : state :=
    match s 

Inductive user : Type :=
    | User (registration:state).



End Features.
