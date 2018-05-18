(* val is_older = fn : (int * int * int) * (int * int * int) -> bool *)
fun is_older (d1: int * int * int, d2: int * int * int) =
    if (#1 d1) < (#1 d2) then false
    else if (#2 d1) < (#2 d2) then false
    else if (#3 d1) <= (#3 d2) then false
    else true

(* val number_in_month = fn : (int * int * int) list * int -> int *)
fun number_in_month (dates: (int * int * int) list, month: int) =
    if null dates
    then 0
    else
        let
            fun match(d: (int * int * int)) = if (#2 d) = month then 1 else 0
        in
            match((hd dates)) + number_in_month((tl dates), month)
        end

(* val number_in_months = fn : (int * int * int) list * int list -> int *)
fun number_in_months (dates: (int * int * int) list, months: int list) =
    if null months
    then
        0
    else
        number_in_month(dates, (hd months)) + number_in_months(dates, (tl months))

(* val dates_in_month = fn : (int * int * int) list * int -> (int * int * int) list *)
fun dates_in_month (dates: (int * int * int) list, month: int) =
    if null dates
    then
        []
    else if (#2 (hd dates)) = month
    then
        (hd dates) :: dates_in_month((tl dates), month)
    else
        dates_in_month((tl dates), month)


(* val dates_in_months = fn : (int * int * int) list * int list -> (int * int * int) list *)
(* val get_nth = fn : string list * int -> string *)
(* val date_to_string = fn : int * int * int -> string *)
(* val number_before_reaching_sum = fn : int * int list -> int *)
(* val what_month = fn : int -> int *)
(* val month_range = fn : int * int -> int list *)
(* val oldest = fn : (int * int * int) list -> (int * int * int) option *)



