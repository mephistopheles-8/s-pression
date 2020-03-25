(*** 
 ** This represents a procedure.
 ** The ids are best declared with
 ** `stacst` to avoid value collisions.
 **
 ** id: int
 ** return_type : vt@ype+
 ** arguments: proc_list (a list of other procs)
 **)

datasort proc = 
  | p of (int, vt@ype+, proc_list )

and proc_list =
  | proc_list_nil of () 
  | proc_list_cons of (proc, proc_list)

(***
 ** infix values are used:
 ** pnil - proc_list_nil 
 ** :::  - proc_list_cons 
 **)

#include "./proc_infix.hats"

(***
 ** Introducing a value; represented
 ** internally as a void constructor.
 **) 

stadef i( id: int, t0: vt@ype+) : proc = p(id,t0,pnil)

(***
 ** The user implements this for any  given procedure.  
 ** 
 ** If 'a' is a viewtype, it must be consumed or returned.
 **
 ** The type 'a' depends on the number of arguments:
 **
 **  0  --> void (it's recommended to use proc$intr for this case)
 **  1  --> The return type the argument proc
 ** 2-6 --> An unboxed tuple of the return types of the argument proc_list
 **  >6 --> proc_res(pl), where pl is the argument proc_list
 **
 **)
 
fun {id:int}{a,b:vt@ype+}
  proc$eval( &a >> a? ) : b 

(***
 ** The user implements this to Introduce a variable.
 **
 ** This is the default implementation for proc$eval 
 ** for p(id,a,pnil()) or i(id,a)
 **)

fun {id:int}{a:vt@ype+}
  proc$intr( ) : a 

(***
 ** Evaluate a proc_list.
 ** 
 ** The type 'a' depends on the number of arguments:
 **
 **  0  --> void (it's recommended to use proc$intr for this case)
 **  1  --> The return type the argument proc
 ** 2-6 --> An unboxed tuple of the return types of the argument proc_list
 **  >6 --> proc_res(pl), where pl is the argument proc_list
 **)

fun {p:proc_list}{a:vt@ype+} 
  proc_list_exec(   ) : a

(***
 ** Evaluate a proc
 ** 
 ** The type 'a' must be the proc return type.
 **
 ** eg.
 **    proc_exec<p(id,int,pl)><int>() : int
 **)
 
fun {p:proc}{a:vt@ype+} 
  proc_exec(   ) : a 

(***
 ** A heterogeneous list for storing 
 ** >6 arguments. 
 **)

datavtype proc_res( proc_list, int ) =
  | proc_res_nil ( pnil, 0 )
  | {id:int}{n:nat}{t0:vt@ype+}{pl0,pl1:proc_list}
    proc_res_cons( p(id,t0,pl0) ::: pl1, n + 1 ) 
      of (t0, proc_res(pl1, n))

vtypedef proc_res(pl:proc_list) = [n:nat] proc_res(pl,n)

(***
 ** Utilities for working with proc_res
 **)

fun {a:vt@ype+}{env:vt@ype+}
  proc_res_foreach$fwork( !a, &env >> env ) : void

fun {pl:proc_list}{env:vt@ype+}
  proc_res_foreach( !proc_res(pl), &env >> env ) : void

fun {a:vt@ype+}{env:vt@ype+}
  proc_res_process$fwork(  a, &env >> env ) : void

fun {pl:proc_list}{env:vt@ype+}
  proc_res_process( proc_res(pl), &env >> env ) : void


