
#include "share/atspre_staload.hats"
staload "./proc.sats"
#include "./proc_infix.hats"

(** IMPL **)

(** The first 6 arguments of a proc are expanded and represented as unboxed tuples **)

stadef proc_list1(id1,t1,pl1) 
  = p(id1,t1,pl1) ::: pnil()
stadef proc_list2(id1,t1,pl1,id2,t2,pl2) 
  = p(id1,t1,pl1) ::: p(id2,t2,pl2) ::: pnil()
stadef proc_list3(id1,t1,pl1,id2,t2,pl2,id3,t3,pl3) 
  = p(id1,t1,pl1) ::: p(id2,t2,pl2) ::: p(id3,t3,pl3) ::: pnil()
stadef proc_list4(id1,t1,pl1,id2,t2,pl2,id3,t3,pl3,id4,t4,pl4) 
  = p(id1,t1,pl1) ::: p(id2,t2,pl2) ::: p(id3,t3,pl3) ::: p(id4,t4,pl4) ::: pnil()
stadef proc_list5(id1,t1,pl1,id2,t2,pl2,id3,t3,pl3,id4,t4,pl4,id5,t5,pl5) 
  = p(id1,t1,pl1) ::: p(id2,t2,pl2) ::: p(id3,t3,pl3) ::: p(id4,t4,pl4) ::: p(id5,t5,pl5) ::: pnil()
stadef proc_list6(id1,t1,pl1,id2,t2,pl2,id3,t3,pl3,id4,t4,pl4,id5,t5,pl5,id6,t6,pl6) 
  = p(id1,t1,pl1) ::: p(id2,t2,pl2) ::: p(id3,t3,pl3) ::: p(id4,t4,pl4) ::: p(id5,t5,pl5) ::: p(id6,t6,pl6) ::: pnil()


implement (id0,t0:vt@ype+)
proc$eval<id0><void,t0>( x ) = proc$intr<id0><t0>()

implement (id0,t0:vt@ype+,pl0) 
proc_exec<p(id0,t0,pl0)><t0>() = proc$eval<id0><proc_res(pl0),t0>( pr ) where {
    var pr : proc_res(pl0) = proc_list_exec<pl0><proc_res(pl0)>()
  }

implement (id0,t0:vt@ype+) 
proc_exec<p(id0,t0,pnil())><t0>() = proc$eval<id0><void,t0>( pr ) where {
    var pr : void = proc_list_exec<pnil()><void>()
  }

implement (id0,t0:vt@ype+,id1,t1,pl1) 
proc_exec<p(id0,t0,p(id1,t1,pl1) ::: pnil())><t0>() = proc$eval<id0><t1,t0>( pr ) where {
    var pr : t1 = proc_list_exec<p(id1,t1,pl1) ::: pnil()><t1>()
  }

implement (id0,t0:vt@ype+,id1,t1,pl1,id2,t2,pl2) 
proc_exec<p(id0,t0,proc_list2(id1,t1,pl1,id2,t2,pl2))><t0>() = proc$eval<id0><(@(t1,t2)),t0>( pr ) where {
    var pr : @(t1,t2) = proc_list_exec<proc_list2(id1,t1,pl1,id2,t2,pl2)><(@(t1,t2))>()
  }

implement (id0,t0:vt@ype+,id1,t1,pl1,id2,t2,pl2,id3,t3,pl3) 
proc_exec<p(id0,t0,proc_list3(id1,t1,pl1,id2,t2,pl2,id3,t3,pl3))><t0>() = proc$eval<id0><(@(t1,t2,t3)),t0>( pr ) where {
    var pr : @(t1,t2,t3) = proc_list_exec<proc_list3(id1,t1,pl1,id2,t2,pl2,id3,t3,pl3)><(@(t1,t2,t3))>()
  }

implement (id0,t0:vt@ype+,id1,t1,pl1,id2,t2,pl2,id3,t3,pl3,id4,t4,pl4) 
proc_exec<p(id0,t0,proc_list4(id1,t1,pl1,id2,t2,pl2,id3,t3,pl3,id4,t4,pl4))><t0>() = proc$eval<id0><(@(t1,t2,t3,t4)),t0>( pr ) where {
    var pr : @(t1,t2,t3,t4) = proc_list_exec<proc_list4(id1,t1,pl1,id2,t2,pl2,id3,t3,pl3,id4,t4,pl4)><(@(t1,t2,t3,t4))>()
  }

implement (id0,t0:vt@ype+,id1,t1,pl1,id2,t2,pl2,id3,t3,pl3,id4,t4,pl4,id5,t5,pl5) 
proc_exec<p(id0,t0,proc_list5(id1,t1,pl1,id2,t2,pl2,id3,t3,pl3,id4,t4,pl4,id5,t5,pl5))><t0>() = proc$eval<id0><(@(t1,t2,t3,t4,t5)),t0>( pr ) where {
    var pr : @(t1,t2,t3,t4,t5) 
      = proc_list_exec<proc_list5(id1,t1,pl1,id2,t2,pl2,id3,t3,pl3,id4,t4,pl4,id5,t5,pl5)><(@(t1,t2,t3,t4,t5))>()
  }

implement (id0,t0:vt@ype+,id1,t1,pl1,id2,t2,pl2,id3,t3,pl3,id4,t4,pl4,id5,t5,pl5,id6,t6,pl6) 
proc_exec<p(id0,t0,proc_list6(id1,t1,pl1,id2,t2,pl2,id3,t3,pl3,id4,t4,pl4,id5,t5,pl5,id6,t6,pl6))><t0>() = proc$eval<id0><(@(t1,t2,t3,t4,t5,t6)),t0>( pr ) where {
    var pr : @(t1,t2,t3,t4,t5,t6) 
      = proc_list_exec<proc_list6(id1,t1,pl1,id2,t2,pl2,id3,t3,pl3,id4,t4,pl4,id5,t5,pl5,id6,t6,pl6)><(@(t1,t2,t3,t4,t5,t6))>()
  }


implement 
proc_list_exec<pnil()><proc_res(pnil())>() = proc_res_nil()

implement (id,t0:vt@ype+,pl0,pl1)
proc_list_exec<p(id,t0,pl0) ::: pl1><proc_res(p(id,t0,pl0) ::: pl1)>() = proc_res_cons(x,xs) where {
    val x = proc_exec<p(id,t0,pl0)><t0>()
    val xs = proc_list_exec<pl1><proc_res(pl1)>()
  }

implement 
proc_list_exec<pnil()><void>() = ()

implement (id,t0:vt@ype+,pl0) 
proc_list_exec<p(id,t0,pl0) ::: pnil()><t0>() = x where {
    val x = proc_exec<p(id,t0,pl0)><t0>()
  }
implement (id0,t0:vt@ype+,pl0,id1,t1:vt@ype+,pl1) 
proc_list_exec<p(id0,t0,pl0) ::: p(id1,t1,pl1) :::pnil()><(@(t0,t1))>() = @(x,y) where {
    val x = proc_exec<p(id0,t0,pl0)><t0>()
    val y = proc_exec<p(id1,t1,pl1)><t1>()
  }

implement (id0,t0:vt@ype+,pl0,id1,t1:vt@ype+,pl1,id2,t2:vt@ype+,pl2) 
proc_list_exec<p(id0,t0,pl0) ::: p(id1,t1,pl1) ::: p(id2,t2,pl2) :::pnil()><(@(t0,t1,t2))>() = @(x,y,z) where {
    val x = proc_exec<p(id0,t0,pl0)><t0>()
    val y = proc_exec<p(id1,t1,pl1)><t1>()
    val z = proc_exec<p(id2,t2,pl2)><t2>()
  }

implement (id0,t0:vt@ype+,pl0,id1,t1:vt@ype+,pl1,id2,t2:vt@ype+,pl2,id3,t3:vt@ype+,pl3) 
proc_list_exec<p(id0,t0,pl0) ::: p(id1,t1,pl1) ::: p(id2,t2,pl2) ::: p(id3,t3,pl3) :::pnil()><(@(t0,t1,t2,t3))>() 
  = @(x,y,z,a) where {

    val x = proc_exec<p(id0,t0,pl0)><t0>()
    val y = proc_exec<p(id1,t1,pl1)><t1>()
    val z = proc_exec<p(id2,t2,pl2)><t2>()
    val a = proc_exec<p(id3,t3,pl3)><t3>()
  }

implement (id0,t0:vt@ype+,pl0,id1,t1:vt@ype+,pl1,id2,t2:vt@ype+,pl2,id3,t3:vt@ype+,pl3,id4,t4:vt@ype+,pl4) 
proc_list_exec<p(id0,t0,pl0) ::: p(id1,t1,pl1) ::: p(id2,t2,pl2) ::: p(id3,t3,pl3) ::: p(id4,t4,pl4) :::pnil()><(@(t0,t1,t2,t3,t4))>() 
  = @(x,y,z,a,b) where {

    val x = proc_exec<p(id0,t0,pl0)><t0>()
    val y = proc_exec<p(id1,t1,pl1)><t1>()
    val z = proc_exec<p(id2,t2,pl2)><t2>()
    val a = proc_exec<p(id3,t3,pl3)><t3>()
    val b = proc_exec<p(id4,t4,pl4)><t4>()
  }

implement (id0,t0:vt@ype+,pl0,id1,t1:vt@ype+,pl1,id2,t2:vt@ype+,pl2,id3,t3:vt@ype+,pl3,id4,t4:vt@ype+,pl4,id5,t5:vt@ype+,pl5) 
proc_list_exec<p(id0,t0,pl0) ::: p(id1,t1,pl1) ::: p(id2,t2,pl2) ::: p(id3,t3,pl3) ::: p(id4,t4,pl4) ::: p(id5,t5,pl5) :::pnil()><(@(t0,t1,t2,t3,t4,t5))>() 
  = @(x,y,z,a,b,c) where {

    val x = proc_exec<p(id0,t0,pl0)><t0>()
    val y = proc_exec<p(id1,t1,pl1)><t1>()
    val z = proc_exec<p(id2,t2,pl2)><t2>()
    val a = proc_exec<p(id3,t3,pl3)><t3>()
    val b = proc_exec<p(id4,t4,pl4)><t4>()
    val c = proc_exec<p(id5,t5,pl5)><t5>()
  }



(** UTIL **)

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

implement
proc$eval<add><(@(int,int)),int>( arg ) = arg.0 + arg.1

implement (id0,id1,pl0,pl1)
proc$eval<sub><(@(int,int)),int>( arg ) = arg.0 - arg.1

stadef $+.( p1, p2 ) = p(add, int, p1 ::: p2 ::: pnil)
stadef $-.( p1, p2 ) = p(sub, int, p1 ::: p2 ::: pnil)

// (- (+ i0 i1) i2)
stadef test = $-.( $+.( i(i0,int), i(i1,int) ), i(i2,int)  )

implement main0 () = {
      val () = println!( proc_exec<test><int>() )
  }








