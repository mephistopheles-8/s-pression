
#include "share/HATS/temptory_staload_bucs320.hats"
#staload "./proc.sats"
#include "./proc_infix.hats"

(** IMPL **)

(** 
  The first 6 arguments of a proc are expanded and represented as unboxed tuples.
  The code looks scary, but that's all I'm really doing here.

  This could be avoided if we stored everything as proc_res, but then even
  basic operations would allocate memory.
**)

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


impltmp (id0,t0:vtflt)
proc$eval<id0><void,t0>( x ) = proc$intr<id0><t0>()

impltmp (id0,t0:vtflt,pl0) 
proc_exec<p(id0,t0,pl0)><t0>() = proc$eval<id0><proc_res(pl0),t0>( pr ) where {
    var pr : proc_res(pl0) = proc_list_exec<pl0><proc_res(pl0)>()
  }

impltmp (id0,t0:vtflt) 
proc_exec<p(id0,t0,pnil())><t0>() = proc$eval<id0><void,t0>( pr ) where {
    var pr : void = proc_list_exec<pnil()><void>()
  }

impltmp (id0,t0:vtflt,id1,t1,pl1) 
proc_exec<p(id0,t0,p(id1,t1,pl1) ::: pnil())><t0>() = proc$eval<id0><t1,t0>( pr ) where {
    var pr : t1 = proc_list_exec<p(id1,t1,pl1) ::: pnil()><t1>()
  }

impltmp (id0,t0:vtflt,id1,t1,pl1,id2,t2,pl2) 
proc_exec<p(id0,t0,proc_list2(id1,t1,pl1,id2,t2,pl2))><t0>() = proc$eval<id0><(@(t1,t2)),t0>( pr ) where {
    var pr : @(t1,t2) = proc_list_exec<proc_list2(id1,t1,pl1,id2,t2,pl2)><(@(t1,t2))>()
  }

impltmp (id0,t0:vtflt,id1,t1,pl1,id2,t2,pl2,id3,t3,pl3) 
proc_exec<p(id0,t0,proc_list3(id1,t1,pl1,id2,t2,pl2,id3,t3,pl3))><t0>() = proc$eval<id0><(@(t1,t2,t3)),t0>( pr ) where {
    var pr : @(t1,t2,t3) = proc_list_exec<proc_list3(id1,t1,pl1,id2,t2,pl2,id3,t3,pl3)><(@(t1,t2,t3))>()
  }

impltmp (id0,t0:vtflt,id1,t1,pl1,id2,t2,pl2,id3,t3,pl3,id4,t4,pl4) 
proc_exec<p(id0,t0,proc_list4(id1,t1,pl1,id2,t2,pl2,id3,t3,pl3,id4,t4,pl4))><t0>() = proc$eval<id0><(@(t1,t2,t3,t4)),t0>( pr ) where {
    var pr : @(t1,t2,t3,t4) = proc_list_exec<proc_list4(id1,t1,pl1,id2,t2,pl2,id3,t3,pl3,id4,t4,pl4)><(@(t1,t2,t3,t4))>()
  }

impltmp (id0,t0:vtflt,id1,t1,pl1,id2,t2,pl2,id3,t3,pl3,id4,t4,pl4,id5,t5,pl5) 
proc_exec<p(id0,t0,proc_list5(id1,t1,pl1,id2,t2,pl2,id3,t3,pl3,id4,t4,pl4,id5,t5,pl5))><t0>() = proc$eval<id0><(@(t1,t2,t3,t4,t5)),t0>( pr ) where {
    var pr : @(t1,t2,t3,t4,t5) 
      = proc_list_exec<proc_list5(id1,t1,pl1,id2,t2,pl2,id3,t3,pl3,id4,t4,pl4,id5,t5,pl5)><(@(t1,t2,t3,t4,t5))>()
  }

impltmp (id0,t0:vtflt,id1,t1,pl1,id2,t2,pl2,id3,t3,pl3,id4,t4,pl4,id5,t5,pl5,id6,t6,pl6) 
proc_exec<p(id0,t0,proc_list6(id1,t1,pl1,id2,t2,pl2,id3,t3,pl3,id4,t4,pl4,id5,t5,pl5,id6,t6,pl6))><t0>() = proc$eval<id0><(@(t1,t2,t3,t4,t5,t6)),t0>( pr ) where {
    var pr : @(t1,t2,t3,t4,t5,t6) 
      = proc_list_exec<proc_list6(id1,t1,pl1,id2,t2,pl2,id3,t3,pl3,id4,t4,pl4,id5,t5,pl5,id6,t6,pl6)><(@(t1,t2,t3,t4,t5,t6))>()
  }


impltmp 
proc_list_exec<pnil()><proc_res(pnil())>() = proc_res_nil()

impltmp (id,t0:vtflt,pl0,pl1)
proc_list_exec<p(id,t0,pl0) ::: pl1><proc_res(p(id,t0,pl0) ::: pl1)>() = proc_res_cons(x,xs) where {
    val x = proc_exec<p(id,t0,pl0)><t0>()
    val xs = proc_list_exec<pl1><proc_res(pl1)>()
  }

impltmp 
proc_list_exec<pnil()><void>() = ()

impltmp (id,t0:vtflt,pl0) 
proc_list_exec<p(id,t0,pl0) ::: pnil()><t0>() = x where {
    val x = proc_exec<p(id,t0,pl0)><t0>()
  }
impltmp (id0,t0:vtflt,pl0,id1,t1:vtflt,pl1) 
proc_list_exec<p(id0,t0,pl0) ::: p(id1,t1,pl1) :::pnil()><(@(t0,t1))>() = @(x,y) where {
    val x = proc_exec<p(id0,t0,pl0)><t0>()
    val y = proc_exec<p(id1,t1,pl1)><t1>()
  }

impltmp (id0,t0:vtflt,pl0,id1,t1:vtflt,pl1,id2,t2:vtflt,pl2) 
proc_list_exec<p(id0,t0,pl0) ::: p(id1,t1,pl1) ::: p(id2,t2,pl2) :::pnil()><(@(t0,t1,t2))>() = @(x,y,z) where {
    val x = proc_exec<p(id0,t0,pl0)><t0>()
    val y = proc_exec<p(id1,t1,pl1)><t1>()
    val z = proc_exec<p(id2,t2,pl2)><t2>()
  }

impltmp (id0,t0:vtflt,pl0,id1,t1:vtflt,pl1,id2,t2:vtflt,pl2,id3,t3:vtflt,pl3) 
proc_list_exec<p(id0,t0,pl0) ::: p(id1,t1,pl1) ::: p(id2,t2,pl2) ::: p(id3,t3,pl3) :::pnil()><(@(t0,t1,t2,t3))>() 
  = @(x,y,z,a) where {

    val x = proc_exec<p(id0,t0,pl0)><t0>()
    val y = proc_exec<p(id1,t1,pl1)><t1>()
    val z = proc_exec<p(id2,t2,pl2)><t2>()
    val a = proc_exec<p(id3,t3,pl3)><t3>()
  }

impltmp (id0,t0:vtflt,pl0,id1,t1:vtflt,pl1,id2,t2:vtflt,pl2,id3,t3:vtflt,pl3,id4,t4:vtflt,pl4) 
proc_list_exec<p(id0,t0,pl0) ::: p(id1,t1,pl1) ::: p(id2,t2,pl2) ::: p(id3,t3,pl3) ::: p(id4,t4,pl4) :::pnil()><(@(t0,t1,t2,t3,t4))>() 
  = @(x,y,z,a,b) where {

    val x = proc_exec<p(id0,t0,pl0)><t0>()
    val y = proc_exec<p(id1,t1,pl1)><t1>()
    val z = proc_exec<p(id2,t2,pl2)><t2>()
    val a = proc_exec<p(id3,t3,pl3)><t3>()
    val b = proc_exec<p(id4,t4,pl4)><t4>()
  }

impltmp (id0,t0:vtflt,pl0,id1,t1:vtflt,pl1,id2,t2:vtflt,pl2,id3,t3:vtflt,pl3,id4,t4:vtflt,pl4,id5,t5:vtflt,pl5) 
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

impltmp (env:vtflt)
proc_res_foreach<pnil()><env>( pr, env ) = ()

impltmp (id,t0:vtflt,pl0,pl1,env:vtflt) 
proc_res_foreach<p(id,t0,pl0) ::: pl1><env>( pr, env ) 
  = case+ pr of 
    | proc_res_cons( x, xs ) => {
        val () = proc_res_foreach$fwork<t0><env>( x, env )
        val () = proc_res_foreach<pl1><env>( xs, env )
        (**
           The biggest caveat of this style of programming
           is that you must be careful to avoid TCO 
           when calling a template with the same name, but
           different arguments.  Failure to do so
           may result in chaos.
        **)
        (** Avoid TCO **)
        val () = ignoret(0) 
      }

impltmp (env:vtflt)
proc_res_process<pnil()><env>( pr, env ) = {
    val ~proc_res_nil() = pr
  }

impltmp (id,t0:vtflt,pl0,pl1,env:vtflt) 
proc_res_process<p(id,t0,pl0) ::: pl1><env>( pr, env ) 
  = case+ pr of 
    | ~proc_res_cons( x, xs ) => {
        val () = proc_res_process$fwork<t0><env>( x, env )
        val () = proc_res_process<pl1><env>( xs, env )
        (** Avoid TCO **)
        val () = ignoret(0) 
      }

