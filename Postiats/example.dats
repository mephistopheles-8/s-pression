
#include "share/atspre_staload.hats"
staload "./proc.sats"
staload _ = "./proc.dats"
#include "./proc_infix.hats"

(** TEST **)

(** 
 * Declaring static ids with `stacst`
 * gives more readable complier errors
 * and helps avoid value collisions
 *)

stacst sub : int
stacst add : int
stacst i0 : int
stacst i1 : int
stacst i2 : int

implement
proc$intr<i0><int>() = 22
implement
proc$intr<i1><int>() = 2
implement
proc$intr<i2><int>() = 3

implement
proc$eval<add><(@(int,int)),int>( arg ) = arg.0 + arg.1

implement
proc$eval<sub><(@(int,int)),int>( arg ) = arg.0 - arg.1

stadef $+.( p1, p2 ) = p(add, int, p1 ::: p2 ::: pnil)
stadef $-.( p1, p2 ) = p(sub, int, p1 ::: p2 ::: pnil)

// (- (+ i0 i1) i2)
stadef test = $-.( $+.( i(i0,int), i(i1,int) ), i(i2,int)  )

implement main0 () = {
      val () = println!( proc_exec<test><int>() )
  }



