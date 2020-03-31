# s-pression

This demonstrates a minimal, S-expression eDSL in
the statics of ATS2.

Implementations are provided for Temptory and Postiats.

This is intended for illustrative purposes. 

```ats2

// (- (+ i0 i1) i2)
stadef test = $-.( $+.( i(i0,int), i(i1,int) ), i(i2,int)  )

implement main0 () = {
      val () = println!( proc_exec<test><int>() )
  }

```

LICENSE: MIT
