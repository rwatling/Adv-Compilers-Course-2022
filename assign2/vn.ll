; ModuleID = 'vn.bc'
source_filename = "vn.ll"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-f128:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind
define void @init(i32 %a, i32 %b, i32 %c, i32* nocapture %r) #0 {
entry:
  %0 = icmp eq i32 %a, 0
  %1 = add nsw i32 %c, %b
  %2 = sub nsw i32 %b, %c
  br i1 %0, label %bb1, label %bb

bb:                                               ; preds = %entry
  %3 = add nsw i32 %c, %b
  %4 = mul nsw i32 %3, 10
  br label %bb2

bb1:                                              ; preds = %entry
  %5 = sub nsw i32 %b, %c
  %6 = mul nsw i32 %5, 5
  br label %bb2

bb2:                                              ; preds = %bb1, %bb
  %k.0 = phi i32 [ %4, %bb ], [ %6, %bb1 ]
  %7 = add nsw i32 %c, %b
  %8 = add nsw i32 %c, %b
  %k.1 = add i32 %k.0, %7
  %9 = add i32 %1, %2
  %10 = add i32 %9, %k.1
  %11 = add i32 %8, %10
  store i32 %11, i32* %r, align 4
  ret void
}

attributes #0 = { nounwind }
