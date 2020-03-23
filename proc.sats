
datasort proc = 
  | p of (int, vt@ype+, proc_list )

and proc_list =
  | proc_list_nil of () 
  | proc_list_cons of (proc, proc_list)

#include "./proc_infix.hats"

stadef i( id: int, t0: vt@ype+) : proc = p(id,t0,pnil)

datavtype proc_res( proc_list, int ) =
  | proc_res_nil ( pnil, 0 )
  | {id:int}{n:nat}{t0:vt@ype+}{pl0,pl1:proc_list}
    proc_res_cons( p(id,t0,pl0) ::: pl1, n + 1 ) 
      of (t0, proc_res(pl1, n))

vtypedef proc_res(pl:proc_list) = [n:nat] proc_res(pl,n)

fun {a:vt@ype+}{env:vt@ype+}
  proc_res_foreach$fwork( !a, &env >> env ) : void

fun {pl:proc_list}{env:vt@ype+}
  proc_res_foreach( !proc_res(pl), &env >> env ) : void

fun {a:vt@ype+}{env:vt@ype+}
  proc_res_process$fwork(  a, &env >> env ) : void

fun {pl:proc_list}{env:vt@ype+}
  proc_res_process( proc_res(pl), &env >> env ) : void

fun {id:int}{a:vt@ype+}{pl:proc_list}
  proc$eval( proc_res(pl) ) : a 

fun {id:int}{a:vt@ype+}
  proc$intr( ) : a 

fun {p:proc_list} 
  proc_list_exec(   ) : proc_res( p )
 
fun {p:proc}{a:vt@ype+} 
  proc_exec(   ) : a 

