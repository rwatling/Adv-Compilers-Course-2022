; ModuleID = 'cost.bc'
source_filename = "cost.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@s = dso_local local_unnamed_addr global i32 0, align 4
@x = dso_local local_unnamed_addr global [512 x i32] zeroinitializer, align 16
@y = dso_local local_unnamed_addr global [512 x i32] zeroinitializer, align 16
@a = dso_local local_unnamed_addr global [512 x [512 x i32]] zeroinitializer, align 16
@b = dso_local local_unnamed_addr global [512 x [512 x i32]] zeroinitializer, align 16
@A = dso_local local_unnamed_addr global [512 x [512 x [512 x i32]]] zeroinitializer, align 16
@B = dso_local local_unnamed_addr global [512 x [512 x [512 x i32]]] zeroinitializer, align 16

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @test1() local_unnamed_addr #0 {
entry:
  %s.promoted = load i32, i32* @s, align 4, !tbaa !3
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %add45 = phi i32 [ %s.promoted, %entry ], [ %add, %for.body ]
  %arrayidx = getelementptr inbounds [512 x i32], [512 x i32]* @x, i64 0, i64 %indvars.iv
  %0 = load i32, i32* %arrayidx, align 4, !tbaa !3
  %add = add nsw i32 %add45, %0
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 512
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !7

for.end:                                          ; preds = %for.body
  store i32 %add, i32* @s, align 4, !tbaa !3
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @test2() local_unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds [512 x i32], [512 x i32]* @y, i64 0, i64 %indvars.iv
  %0 = load i32, i32* %arrayidx, align 4, !tbaa !3
  %add = add nsw i32 %0, 5
  %arrayidx2 = getelementptr inbounds [512 x i32], [512 x i32]* @x, i64 0, i64 %indvars.iv
  store i32 %add, i32* %arrayidx2, align 4, !tbaa !3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 512
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !10

for.end:                                          ; preds = %for.body
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @test3() local_unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %0 = or i64 %indvars.iv, 1
  %arrayidx = getelementptr inbounds [512 x i32], [512 x i32]* @x, i64 0, i64 %0
  %1 = load i32, i32* %arrayidx, align 4, !tbaa !3
  %arrayidx2 = getelementptr inbounds [512 x i32], [512 x i32]* @y, i64 0, i64 %indvars.iv
  %2 = load i32, i32* %arrayidx2, align 8, !tbaa !3
  %add3 = add nsw i32 %2, %1
  %arrayidx6 = getelementptr inbounds [512 x i32], [512 x i32]* @y, i64 0, i64 %0
  %3 = load i32, i32* %arrayidx6, align 4, !tbaa !3
  %add7 = add nsw i32 %add3, %3
  %arrayidx9 = getelementptr inbounds [512 x i32], [512 x i32]* @x, i64 0, i64 %indvars.iv
  store i32 %add7, i32* %arrayidx9, align 8, !tbaa !3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 2
  %cmp = icmp ult i64 %indvars.iv, 510
  br i1 %cmp, label %for.body, label %for.end, !llvm.loop !11

for.end:                                          ; preds = %for.body
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @test4() local_unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %0 = shl nuw i64 %indvars.iv, 1
  %1 = or i64 %0, 1
  %arrayidx = getelementptr inbounds [512 x i32], [512 x i32]* @x, i64 0, i64 %1
  %2 = load i32, i32* %arrayidx, align 4, !tbaa !3
  %arrayidx2 = getelementptr inbounds [512 x i32], [512 x i32]* @y, i64 0, i64 %indvars.iv
  %3 = load i32, i32* %arrayidx2, align 4, !tbaa !3
  %add3 = add nsw i32 %3, %2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx6 = getelementptr inbounds [512 x i32], [512 x i32]* @y, i64 0, i64 %indvars.iv.next
  %4 = load i32, i32* %arrayidx6, align 4, !tbaa !3
  %add7 = add nsw i32 %add3, %4
  %arrayidx10 = getelementptr inbounds [512 x i32], [512 x i32]* @x, i64 0, i64 %0
  store i32 %add7, i32* %arrayidx10, align 8, !tbaa !3
  %exitcond.not = icmp eq i64 %indvars.iv.next, 255
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !12

for.end:                                          ; preds = %for.body
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @test5() local_unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc34
  %indvars.iv57 = phi i64 [ 0, %entry ], [ %indvars.iv.next58, %for.inc34 ]
  %0 = shl nuw i64 %indvars.iv57, 1
  %1 = or i64 %0, 1
  br label %for.body3

for.body3:                                        ; preds = %for.cond1.preheader, %for.body3
  %indvars.iv = phi i64 [ 1, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @a, i64 0, i64 %0, i64 %indvars.iv
  %2 = load i32, i32* %arrayidx5, align 4, !tbaa !3
  %arrayidx9 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @b, i64 0, i64 %indvars.iv, i64 %indvars.iv57
  %3 = load i32, i32* %arrayidx9, align 4, !tbaa !3
  %add = add i32 %2, 10
  %add10 = add i32 %add, %3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx16 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @a, i64 0, i64 %0, i64 %indvars.iv.next
  store i32 %add10, i32* %arrayidx16, align 4, !tbaa !3
  %4 = add nsw i64 %indvars.iv, -1
  %arrayidx21 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @a, i64 0, i64 %0, i64 %4
  %5 = load i32, i32* %arrayidx21, align 4, !tbaa !3
  %arrayidx26 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @b, i64 0, i64 %indvars.iv.next, i64 %indvars.iv57
  %6 = load i32, i32* %arrayidx26, align 4, !tbaa !3
  %add27 = add nsw i32 %6, %5
  %arrayidx33 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @a, i64 0, i64 %1, i64 %indvars.iv
  store i32 %add27, i32* %arrayidx33, align 4, !tbaa !3
  %exitcond.not = icmp eq i64 %indvars.iv.next, 511
  br i1 %exitcond.not, label %for.inc34, label %for.body3, !llvm.loop !13

for.inc34:                                        ; preds = %for.body3
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond62.not = icmp eq i64 %indvars.iv.next58, 255
  br i1 %exitcond62.not, label %for.end36, label %for.cond1.preheader, !llvm.loop !14

for.end36:                                        ; preds = %for.inc34
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @test6() local_unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc27
  %indvars.iv54 = phi i64 [ 0, %entry ], [ %indvars.iv.next55, %for.inc27 ]
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.cond1.preheader, %for.inc24
  %indvars.iv49 = phi i64 [ 1, %for.cond1.preheader ], [ %indvars.iv.next50, %for.inc24 ]
  %0 = add nsw i64 %indvars.iv49, -1
  br label %for.body6

for.body6:                                        ; preds = %for.cond4.preheader, %for.body6
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next, %for.body6 ]
  %arrayidx10 = getelementptr inbounds [512 x [512 x [512 x i32]]], [512 x [512 x [512 x i32]]]* @A, i64 0, i64 %indvars.iv, i64 %0, i64 %indvars.iv.next55
  %1 = load i32, i32* %arrayidx10, align 4, !tbaa !3
  %arrayidx16 = getelementptr inbounds [512 x [512 x [512 x i32]]], [512 x [512 x [512 x i32]]]* @B, i64 0, i64 %indvars.iv, i64 %indvars.iv54, i64 %indvars.iv49
  %2 = load i32, i32* %arrayidx16, align 4, !tbaa !3
  %add17 = add nsw i32 %2, %1
  %arrayidx23 = getelementptr inbounds [512 x [512 x [512 x i32]]], [512 x [512 x [512 x i32]]]* @A, i64 0, i64 %indvars.iv, i64 %indvars.iv49, i64 %indvars.iv54
  store i32 %add17, i32* %arrayidx23, align 4, !tbaa !3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 512
  br i1 %exitcond.not, label %for.inc24, label %for.body6, !llvm.loop !15

for.inc24:                                        ; preds = %for.body6
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond53.not = icmp eq i64 %indvars.iv.next50, 512
  br i1 %exitcond53.not, label %for.inc27, label %for.cond4.preheader, !llvm.loop !16

for.inc27:                                        ; preds = %for.inc24
  %exitcond57.not = icmp eq i64 %indvars.iv.next55, 512
  br i1 %exitcond57.not, label %for.end29, label %for.cond1.preheader, !llvm.loop !17

for.end29:                                        ; preds = %for.inc27
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @test7() local_unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc35
  %indvars.iv64 = phi i64 [ 0, %entry ], [ %indvars.iv.next65, %for.inc35 ]
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.cond1.preheader, %for.inc32
  %indvars.iv60 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next61, %for.inc32 ]
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  br label %for.body6

for.body6:                                        ; preds = %for.cond4.preheader, %for.body6
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next, %for.body6 ]
  %arrayidx10 = getelementptr inbounds [512 x [512 x [512 x i32]]], [512 x [512 x [512 x i32]]]* @B, i64 0, i64 %indvars.iv, i64 %indvars.iv.next61, i64 %indvars.iv64
  %0 = load i32, i32* %arrayidx10, align 4, !tbaa !3
  %arrayidx16 = getelementptr inbounds [512 x [512 x [512 x i32]]], [512 x [512 x [512 x i32]]]* @B, i64 0, i64 %indvars.iv, i64 %indvars.iv60, i64 %indvars.iv64
  %1 = load i32, i32* %arrayidx16, align 4, !tbaa !3
  %add17 = add nsw i32 %1, %0
  %arrayidx24 = getelementptr inbounds [512 x [512 x [512 x i32]]], [512 x [512 x [512 x i32]]]* @B, i64 0, i64 %indvars.iv, i64 %indvars.iv60, i64 %indvars.iv.next65
  %2 = load i32, i32* %arrayidx24, align 4, !tbaa !3
  %add25 = add nsw i32 %add17, %2
  %arrayidx31 = getelementptr inbounds [512 x [512 x [512 x i32]]], [512 x [512 x [512 x i32]]]* @A, i64 0, i64 %indvars.iv, i64 %indvars.iv60, i64 %indvars.iv64
  store i32 %add25, i32* %arrayidx31, align 4, !tbaa !3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 512
  br i1 %exitcond.not, label %for.inc32, label %for.body6, !llvm.loop !18

for.inc32:                                        ; preds = %for.body6
  %exitcond63.not = icmp eq i64 %indvars.iv.next61, 511
  br i1 %exitcond63.not, label %for.inc35, label %for.cond4.preheader, !llvm.loop !19

for.inc35:                                        ; preds = %for.inc32
  %exitcond67.not = icmp eq i64 %indvars.iv.next65, 511
  br i1 %exitcond67.not, label %for.end37, label %for.cond1.preheader, !llvm.loop !20

for.end37:                                        ; preds = %for.inc35
  ret void
}

attributes #0 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{!"clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!"llvm.loop.unroll.disable"}
!10 = distinct !{!10, !8, !9}
!11 = distinct !{!11, !8, !9}
!12 = distinct !{!12, !8, !9}
!13 = distinct !{!13, !8, !9}
!14 = distinct !{!14, !8, !9}
!15 = distinct !{!15, !8, !9}
!16 = distinct !{!16, !8, !9}
!17 = distinct !{!17, !8, !9}
!18 = distinct !{!18, !8, !9}
!19 = distinct !{!19, !8, !9}
!20 = distinct !{!20, !8, !9}
