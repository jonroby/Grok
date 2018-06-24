(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

fun all_except_option (str, lst) =
    let fun filt (lst) =
        case lst of
            [] => []
          | x::xs => if same_string(x, str)
                     then filt(xs)
                     else x::filt(xs)
    in
        if (filt (lst)) = lst then NONE else SOME (filt(lst))
    end

fun get_substitutions1 (strs, str) =
    case strs of
        [] => []
      | x::xs => case all_except_option (str, x) of
                     SOME y => y @ get_substitutions1 (xs, str)
                   | NONE  => get_substitutions1 (xs, str)

fun get_substitutions2 (strs, str) =
    let fun helper (strs, str, lst) =
        case strs of
            [] => lst
          | x::xs => case all_except_option (str, x) of
                         SOME y => helper (xs, str, lst @ y)
                       | NONE  => helper (xs, str, lst)
    in
        helper (strs, str, [])
    end

fun my_map(lst, cb) =
    case lst of
        x::[] => cb(x) :: []
      | x::xs => cb(x) :: my_map(xs, cb)

fun similar_names (strs, {first=f, middle=m, last=l}) =
    let
        fun make_name (n) = {first=n, middle=m, last=l}
        fun helper (strs) = get_substitutions2(strs, f)
    in
        {first=f, middle=m, last=l} :: (my_map(helper(strs), make_name))
    end



(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

              (* put your solutions for problem 2 here *)

fun card_color (suit, _) =
    case suit of
         (Clubs | Spades) => Black
       | (Diamonds | Hearts) => Red

fun card_value (_, value) =
    case value of
        Ace => 11
     |  (King 
        |  Queen
        |  Jack) => 10
     | Num n => n

fun remove_card (cs, c, e) =
    case cs of
        [] => raise e
     | x::xs => if x = c then xs else x :: remove_card(xs, c, e)

