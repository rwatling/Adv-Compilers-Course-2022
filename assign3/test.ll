; ModuleID = 'test.bc'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = dso_local local_unnamed_addr global [128 x [128 x i32]] zeroinitializer, align 16

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @test() local_unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc10
  %indvars.iv25 = phi i64 [ 0, %entry ], [ %indvars.iv.next26, %for.inc10 ]
  br label %for.body3

for.body3:                                        ; preds = %for.cond1.preheader, %for.body3
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %0 = shl nuw nsw i64 %indvars.iv, 1
  %arrayidx5 = getelementptr inbounds [128 x [128 x i32]], [128 x [128 x i32]]* @a, i64 0, i64 %indvars.iv25, i64 %0
  %1 = load i32, i32* %arrayidx5, align 8, !tbaa !3
  %add = add nsw i32 %1, 10
  %arrayidx9 = getelementptr inbounds [128 x [128 x i32]], [128 x [128 x i32]]* @a, i64 0, i64 %indvars.iv25, i64 %indvars.iv
  store i32 %add, i32* %arrayidx9, align 4, !tbaa !3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 128
  br i1 %exitcond.not, label %for.inc10, label %for.body3, !llvm.loop !7

for.inc10:                                        ; preds = %for.body3
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond28.not = icmp eq i64 %indvars.iv.next26, 128
  br i1 %exitcond28.not, label %for.end12, label %for.cond1.preheader, !llvm.loop !10

for.end12:                                        ; preds = %for.inc10
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
