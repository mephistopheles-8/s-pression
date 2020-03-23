
#include "share/atspre_staload.hats"
staload "./proc.sats"
#include "./proc_infix.hats"

(** IMPL **)

implement (id,a:vt@ype+)
proc$eval<id><a><pnil()>( args ) = proc$intr<id><a>() where {
    val ~proc_res_nil() = args
  }

implement (id,t0:vt@ype+,pl) 
proc_exec<p(id,t0,pl)><t0>() = proc$eval<id><t0><pl>( pr ) where {
    val pr = proc_list_exec<pl>()
  }

implement 
proc_list_exec<pnil()>() = proc_res_nil()

implement (id,t0:vt@ype+,pl0,pl1) 
proc_list_exec<p(id,t0,pl0) ::: pl1>() = proc_res_cons(x,xs) where {
    val x = proc_exec<p(id,t0,pl0)><t0>()
    val xs = proc_list_exec<pl1>()
  }

implement (env:vt@ype+)
proc_res_foreach<pnil()><env>( pr, env ) = ()

implement (id,t0:vt@ype+,pl0,pl1,env:vt@ype+) 
proc_res_foreach<p(id,t0,pl0) ::: pl1><env>( pr, env ) 
  = case+ pr of 
    | proc_res_cons( x, xs ) => {
        val () = proc_res_foreach$fwork<t0><env>( x, env )
        val () = proc_res_foreach<pl1><env>( xs, env )
        val () = ignoret(0) 
      }

implement (env:vt@ype+)
proc_res_process<pnil()><env>( pr, env ) = {
    val ~proc_res_nil() = pr
  }

implement (id,t0:vt@ype+,pl0,pl1,env:vt@ype+) 
proc_res_process<p(id,t0,pl0) ::: pl1><env>( pr, env ) 
  = case+ pr of 
    | ~proc_res_cons( x, xs ) => {
        val () = proc_res_process$fwork<t0><env>( x, env )
        val () = proc_res_process<pl1><env>( xs, env )
        val () = ignoret(0) 
      }

(** TEST **)

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

implement (id,pl0,pl1)
proc$eval<add><int><pnil()>( pr ) = 0 where {
    val ~proc_res_nil() = pr
  }

implement (id,pl0,pl1)
proc$eval<add><int><p(id,int,pl0) ::: pl1>( pr ) 
  = case+ pr of
     | ~proc_res_cons(x,xs) => x + s where {
        val s = proc$eval<add><int><pl1>( xs )
      } 

implement (id0,id1,pl0,pl1)
proc$eval<sub><int><p(id0,int,pl0) ::: p(id1,int,pl1) ::: pnil()>( pr ) 
  = x - y where { 
      val ~proc_res_cons(x,pr) = pr
      val ~proc_res_cons(y,pr) = pr
      val ~proc_res_nil() = pr
    } 

// (- (+ i0 i1) i2)
stadef test = 
  p(sub, int, p( add, int, i(i0,int) ::: i(i1,int) ::: pnil ) ::: i(i2,int) ::: pnil ) 

implement main0 () = {
      val () = println!( proc_exec<test><int>() )
  }

