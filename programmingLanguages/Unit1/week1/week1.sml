(* val is_older = fn : (int * int * int) * (int * int * int) -> bool *)
fun is_older (d1: int * int * int, d2: int * int * int) =
    if (#1 d1) < (#1 d2) then true
    else if (#1 d1) > (#1 d2) then false
    else if (#2 d1) < (#2 d2) then true
    else if (#2 d1) > (#2 d2) then false
    else if (#3 d1) < (#3 d2) then true
    else false

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
fun dates_in_months (dates: (int * int * int) list, months: int list) =
    if null dates then
        []
    else
        let fun is_in (date: (int * int * int), months: int list) =
            if null months then
                false
            else if (#2 date) = (hd months) then
                true
            else
                is_in (date, (tl months))
        in
            if is_in((hd dates), months) then
                (hd dates) :: dates_in_months((tl dates), months)
            else
                dates_in_months((tl dates), months)
        end

(* val get_nth = fn : string list * int -> string *)
fun get_nth (list: string list, n: int) =
    if n = 1 then
        hd list
    else
        get_nth((tl list), n-1)


(* val date_to_string = fn : int * int * int -> string *)
fun date_to_string (year: int, month: int, day: int) =
    let val months = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    in
        get_nth(months, month) ^ " " ^ Int.toString(day) ^ ", " ^ Int.toString(year)
    end

(* val number_before_reaching_sum = fn : int * int list -> int *)
fun number_before_reaching_sum (sum: int, nums: int list) =
    let fun recurse (sum: int, nums: int list, total: int) =
            if sum - (hd nums) <= 0 then
                total - 1
            else
                recurse(sum - (hd nums), (tl nums), total + 1)
    in
        recurse(sum, nums, 1)
    end

(* val what_month = fn : int -> int *)
fun what_month (day: int) =
    let val days_in_months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
        (number_before_reaching_sum (day, days_in_months)) + 1
    end

(* val month_range = fn : int * int -> int list *)
fun month_range (day1: int, day2: int) =
    if day1 > day2 then
        []
    else
        what_month(day1) :: month_range(day1 + 1, day2)

(* val oldest = fn : (int * int * int) list -> (int * int * int) option *)
fun oldest (dates: (int * int * int) list) =
    let
        fun is_oldest (dates_list: (int * int * int) list, oldest_date: (int * int * int)) =
            if null dates_list then
                oldest_date
            else
                let val oldest_so_far =
                        if is_older(oldest_date, (hd dates_list))
                        then oldest_date
                        else hd dates_list
                in
                    is_oldest((tl dates_list), oldest_so_far)
                end
    in
        if null dates then
            NONE
        else
            SOME (is_oldest((tl dates), (hd dates)))
    end

