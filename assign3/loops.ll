; ModuleID = 'loops.bc'
source_filename = "loops.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@y = dso_local local_unnamed_addr global [512 x i32] zeroinitializer, align 16
@x = dso_local local_unnamed_addr global [512 x i32] zeroinitializer, align 16
@z = dso_local local_unnamed_addr global [512 x i32] zeroinitializer, align 16
@b = dso_local local_unnamed_addr global [512 x [512 x i32]] zeroinitializer, align 16
@a = dso_local local_unnamed_addr global [512 x [512 x i32]] zeroinitializer, align 16
@c = dso_local local_unnamed_addr global [512 x [512 x i32]] zeroinitializer, align 16
@B = dso_local local_unnamed_addr global [512 x [512 x [512 x double]]] zeroinitializer, align 16
@C = dso_local local_unnamed_addr global [512 x [512 x [512 x double]]] zeroinitializer, align 16
@A = dso_local local_unnamed_addr global [512 x [512 x [512 x double]]] zeroinitializer, align 16

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @test1() local_unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds [512 x i32], [512 x i32]* @y, i64 0, i64 %indvars.iv
  %0 = load i32, i32* %arrayidx, align 4, !tbaa !3
  %mul = shl nsw i32 %0, 1
  %arrayidx2 = getelementptr inbounds [512 x i32], [512 x i32]* @x, i64 0, i64 %indvars.iv
  store i32 %mul, i32* %arrayidx2, align 4, !tbaa !3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 512
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !7

for.end:                                          ; preds = %for.body
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @test2() local_unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %0 = shl nuw i64 %indvars.iv, 1
  %arrayidx = getelementptr inbounds [512 x i32], [512 x i32]* @y, i64 0, i64 %0
  %1 = load i32, i32* %arrayidx, align 8, !tbaa !3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx2 = getelementptr inbounds [512 x i32], [512 x i32]* @x, i64 0, i64 %indvars.iv.next
  store i32 %1, i32* %arrayidx2, align 4, !tbaa !3
  %exitcond.not = icmp eq i64 %indvars.iv.next, 256
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !10

for.end:                                          ; preds = %for.body
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @test3() local_unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ 1, %entry ], [ %indvars.iv.next, %for.body ]
  %0 = shl nuw i64 %indvars.iv, 1
  %arrayidx = getelementptr inbounds [512 x i32], [512 x i32]* @y, i64 0, i64 %0
  %1 = load i32, i32* %arrayidx, align 8, !tbaa !3
  %2 = add nsw i64 %indvars.iv, -1
  %arrayidx2 = getelementptr inbounds [512 x i32], [512 x i32]* @x, i64 0, i64 %2
  store i32 %1, i32* %arrayidx2, align 4, !tbaa !3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 2
  %cmp = icmp ult i64 %indvars.iv, 254
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
  %1 = or i64 %0, 5
  %arrayidx = getelementptr inbounds [512 x i32], [512 x i32]* @y, i64 0, i64 %1
  %2 = load i32, i32* %arrayidx, align 4, !tbaa !3
  %3 = mul nuw nsw i64 %indvars.iv, 3
  %arrayidx3 = getelementptr inbounds [512 x i32], [512 x i32]* @z, i64 0, i64 %3
  %4 = load i32, i32* %arrayidx3, align 16, !tbaa !3
  %add4 = add nsw i32 %4, %2
  %5 = shl i64 %indvars.iv, 2
  %arrayidx7 = getelementptr inbounds [512 x i32], [512 x i32]* @x, i64 0, i64 %5
  store i32 %add4, i32* %arrayidx7, align 16, !tbaa !3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 4
  %cmp = icmp ult i64 %indvars.iv, 124
  br i1 %cmp, label %for.body, label %for.end, !llvm.loop !12

for.end:                                          ; preds = %for.body
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @test5() local_unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc10
  %indvars.iv24 = phi i64 [ 0, %entry ], [ %indvars.iv.next25, %for.inc10 ]
  br label %for.body3

for.body3:                                        ; preds = %for.cond1.preheader, %for.body3
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @b, i64 0, i64 %indvars.iv24, i64 %indvars.iv
  %0 = load i32, i32* %arrayidx5, align 4, !tbaa !3
  %mul = mul nsw i32 %0, 3
  %arrayidx9 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @a, i64 0, i64 %indvars.iv24, i64 %indvars.iv
  store i32 %mul, i32* %arrayidx9, align 4, !tbaa !3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 512
  br i1 %exitcond.not, label %for.inc10, label %for.body3, !llvm.loop !13

for.inc10:                                        ; preds = %for.body3
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27.not = icmp eq i64 %indvars.iv.next25, 512
  br i1 %exitcond27.not, label %for.end12, label %for.cond1.preheader, !llvm.loop !14

for.end12:                                        ; preds = %for.inc10
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @test6() local_unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc15
  %indvars.iv33 = phi i64 [ 0, %entry ], [ %indvars.iv.next34, %for.inc15 ]
  %arrayidx9 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @c, i64 0, i64 %indvars.iv33, i64 %indvars.iv33
  %0 = load i32, i32* %arrayidx9, align 4, !tbaa !3
  %1 = shl nuw i64 %indvars.iv33, 1
  br label %for.body3

for.body3:                                        ; preds = %for.cond1.preheader, %for.body3
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %2 = add nuw nsw i64 %indvars.iv, %indvars.iv33
  %arrayidx5 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @b, i64 0, i64 %indvars.iv33, i64 %2
  %3 = load i32, i32* %arrayidx5, align 4, !tbaa !3
  %add10 = add nsw i32 %0, %3
  %arrayidx14 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @a, i64 0, i64 %1, i64 %indvars.iv
  store i32 %add10, i32* %arrayidx14, align 4, !tbaa !3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 256
  br i1 %exitcond.not, label %for.inc15, label %for.body3, !llvm.loop !15

for.inc15:                                        ; preds = %for.body3
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond37.not = icmp eq i64 %indvars.iv.next34, 256
  br i1 %exitcond37.not, label %for.end17, label %for.cond1.preheader, !llvm.loop !16

for.end17:                                        ; preds = %for.inc15
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @test7() local_unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc18
  %indvars.iv38 = phi i64 [ 0, %entry ], [ %indvars.iv.next39, %for.inc18 ]
  %0 = add nuw nsw i64 %indvars.iv38, 10
  %1 = shl nuw i64 %indvars.iv38, 1
  br label %for.body3

for.body3:                                        ; preds = %for.cond1.preheader, %for.body3
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %2 = shl nuw i64 %indvars.iv, 1
  %3 = add nuw nsw i64 %0, %2
  %arrayidx6 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @b, i64 0, i64 %indvars.iv38, i64 %3
  %4 = load i32, i32* %arrayidx6, align 8, !tbaa !3
  %5 = mul nuw nsw i64 %indvars.iv, 3
  %arrayidx11 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @c, i64 0, i64 %indvars.iv38, i64 %5
  %6 = load i32, i32* %arrayidx11, align 4, !tbaa !3
  %add12 = add nsw i32 %6, %4
  %arrayidx17 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @a, i64 0, i64 %1, i64 %indvars.iv
  store i32 %add12, i32* %arrayidx17, align 4, !tbaa !3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 170
  br i1 %exitcond.not, label %for.inc18, label %for.body3, !llvm.loop !17

for.inc18:                                        ; preds = %for.body3
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 2
  %cmp = icmp ult i64 %indvars.iv38, 254
  br i1 %cmp, label %for.cond1.preheader, label %for.end20, !llvm.loop !18

for.end20:                                        ; preds = %for.inc18
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @test8() local_unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc15
  %indvars.iv31 = phi i64 [ 0, %entry ], [ %indvars.iv.next32, %for.inc15 ]
  br label %for.body3

for.body3:                                        ; preds = %for.cond1.preheader, %for.body3
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @b, i64 0, i64 %indvars.iv, i64 %indvars.iv31
  %0 = load i32, i32* %arrayidx5, align 8, !tbaa !3
  %arrayidx9 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @c, i64 0, i64 %indvars.iv, i64 %indvars.iv
  %1 = load i32, i32* %arrayidx9, align 4, !tbaa !3
  %add = add nsw i32 %1, %0
  %arrayidx13 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @a, i64 0, i64 %indvars.iv31, i64 %indvars.iv
  store i32 %add, i32* %arrayidx13, align 4, !tbaa !3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 3
  %cmp2 = icmp ult i64 %indvars.iv, 509
  br i1 %cmp2, label %for.body3, label %for.inc15, !llvm.loop !19

for.inc15:                                        ; preds = %for.body3
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 2
  %cmp = icmp ult i64 %indvars.iv31, 510
  br i1 %cmp, label %for.cond1.preheader, label %for.end17, !llvm.loop !20

for.end17:                                        ; preds = %for.inc15
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @test9() local_unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc29
  %indvars.iv57 = phi i64 [ 0, %entry ], [ %indvars.iv.next58, %for.inc29 ]
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.cond1.preheader, %for.inc26
  %indvars.iv53 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next54, %for.inc26 ]
  br label %for.body6

for.body6:                                        ; preds = %for.cond4.preheader, %for.body6
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next, %for.body6 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx10 = getelementptr inbounds [512 x [512 x [512 x double]]], [512 x [512 x [512 x double]]]* @B, i64 0, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv.next
  %0 = load double, double* %arrayidx10, align 8, !tbaa !21
  %1 = shl nuw i64 %indvars.iv, 1
  %2 = or i64 %1, 1
  %arrayidx17 = getelementptr inbounds [512 x [512 x [512 x double]]], [512 x [512 x [512 x double]]]* @C, i64 0, i64 %indvars.iv57, i64 %indvars.iv53, i64 %2
  %3 = load double, double* %arrayidx17, align 8, !tbaa !21
  %add18 = fadd double %0, %3
  %arrayidx25 = getelementptr inbounds [512 x [512 x [512 x double]]], [512 x [512 x [512 x double]]]* @A, i64 0, i64 %indvars.iv.next58, i64 %indvars.iv53, i64 %indvars.iv
  store double %add18, double* %arrayidx25, align 8, !tbaa !21
  %exitcond.not = icmp eq i64 %indvars.iv.next, 255
  br i1 %exitcond.not, label %for.inc26, label %for.body6, !llvm.loop !23

for.inc26:                                        ; preds = %for.body6
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond56.not = icmp eq i64 %indvars.iv.next54, 512
  br i1 %exitcond56.not, label %for.inc29, label %for.cond4.preheader, !llvm.loop !24

for.inc29:                                        ; preds = %for.inc26
  %exitcond60.not = icmp eq i64 %indvars.iv.next58, 511
  br i1 %exitcond60.not, label %for.end31, label %for.cond1.preheader, !llvm.loop !25

for.end31:                                        ; preds = %for.inc29
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @test10() local_unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc28
  %indvars.iv56 = phi i64 [ 0, %entry ], [ %indvars.iv.next57, %for.inc28 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.cond1.preheader, %for.inc26
  %indvars.iv53 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next54, %for.inc26 ]
  br label %for.body6

for.body6:                                        ; preds = %for.cond4.preheader, %for.body6
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next, %for.body6 ]
  %0 = or i64 %indvars.iv, 1
  %arrayidx10 = getelementptr inbounds [512 x [512 x [512 x double]]], [512 x [512 x [512 x double]]]* @B, i64 0, i64 %indvars.iv, i64 %indvars.iv53, i64 %0
  %1 = load double, double* %arrayidx10, align 8, !tbaa !21
  %2 = shl nuw i64 %indvars.iv, 1
  %3 = or i64 %2, 1
  %arrayidx17 = getelementptr inbounds [512 x [512 x [512 x double]]], [512 x [512 x [512 x double]]]* @C, i64 0, i64 %indvars.iv56, i64 %indvars.iv53, i64 %3
  %4 = load double, double* %arrayidx17, align 8, !tbaa !21
  %add18 = fadd double %1, %4
  %arrayidx24 = getelementptr inbounds [512 x [512 x [512 x double]]], [512 x [512 x [512 x double]]]* @A, i64 0, i64 %indvars.iv56, i64 %indvars.iv53, i64 %indvars.iv
  store double %add18, double* %arrayidx24, align 16, !tbaa !21
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 2
  %cmp5 = icmp ult i64 %indvars.iv, 253
  br i1 %cmp5, label %for.body6, label %for.inc26, !llvm.loop !26

for.inc26:                                        ; preds = %for.body6
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next54, 512
  br i1 %exitcond.not, label %for.inc28, label %for.cond4.preheader, !llvm.loop !27

for.inc28:                                        ; preds = %for.inc26
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond59.not = icmp eq i64 %indvars.iv.next57, 512
  br i1 %exitcond59.not, label %for.end30, label %for.cond1.preheader, !llvm.loop !28

for.end30:                                        ; preds = %for.inc28
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @test11() local_unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc28
  %indvars.iv56 = phi i64 [ 0, %entry ], [ %indvars.iv.next57, %for.inc28 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.cond1.preheader, %for.inc26
  %indvars.iv53 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next54, %for.inc26 ]
  br label %for.body6

for.body6:                                        ; preds = %for.cond4.preheader, %for.body6
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next, %for.body6 ]
  %0 = or i64 %indvars.iv, 1
  %arrayidx10 = getelementptr inbounds [512 x [512 x [512 x double]]], [512 x [512 x [512 x double]]]* @B, i64 0, i64 %indvars.iv, i64 %indvars.iv53, i64 %0
  %1 = load double, double* %arrayidx10, align 8, !tbaa !21
  %2 = shl nuw i64 %indvars.iv, 1
  %3 = or i64 %2, 1
  %arrayidx17 = getelementptr inbounds [512 x [512 x [512 x double]]], [512 x [512 x [512 x double]]]* @C, i64 0, i64 %indvars.iv56, i64 %indvars.iv53, i64 %3
  %4 = load double, double* %arrayidx17, align 8, !tbaa !21
  %add18 = fadd double %1, %4
  %arrayidx24 = getelementptr inbounds [512 x [512 x [512 x double]]], [512 x [512 x [512 x double]]]* @A, i64 0, i64 %indvars.iv56, i64 %indvars.iv, i64 %indvars.iv53
  store double %add18, double* %arrayidx24, align 8, !tbaa !21
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 4
  %cmp5 = icmp ult i64 %indvars.iv, 252
  br i1 %cmp5, label %for.body6, label %for.inc26, !llvm.loop !29

for.inc26:                                        ; preds = %for.body6
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next54, 512
  br i1 %exitcond.not, label %for.inc28, label %for.cond4.preheader, !llvm.loop !30

for.inc28:                                        ; preds = %for.inc26
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond59.not = icmp eq i64 %indvars.iv.next57, 512
  br i1 %exitcond59.not, label %for.end30, label %for.cond1.preheader, !llvm.loop !31

for.end30:                                        ; preds = %for.inc28
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @test12() local_unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc28
  %indvars.iv58 = phi i64 [ 0, %entry ], [ %indvars.iv.next59, %for.inc28 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.cond1.preheader, %for.inc25
  %indvars.iv54 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next55, %for.inc25 ]
  br label %for.body6

for.body6:                                        ; preds = %for.cond4.preheader, %for.body6
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next, %for.body6 ]
  %0 = mul nuw nsw i64 %indvars.iv, 5
  %arrayidx10 = getelementptr inbounds [512 x [512 x [512 x double]]], [512 x [512 x [512 x double]]]* @B, i64 0, i64 %indvars.iv58, i64 %indvars.iv54, i64 %0
  %1 = load double, double* %arrayidx10, align 8, !tbaa !21
  %2 = shl i64 %indvars.iv, 3
  %arrayidx17 = getelementptr inbounds [512 x [512 x [512 x double]]], [512 x [512 x [512 x double]]]* @C, i64 0, i64 %indvars.iv58, i64 %indvars.iv54, i64 %2
  %3 = load double, double* %arrayidx17, align 16, !tbaa !21
  %add = fadd double %1, %3
  %4 = add nuw nsw i64 %indvars.iv, %indvars.iv54
  %arrayidx24 = getelementptr inbounds [512 x [512 x [512 x double]]], [512 x [512 x [512 x double]]]* @A, i64 0, i64 %indvars.iv58, i64 %4, i64 %indvars.iv
  store double %add, double* %arrayidx24, align 8, !tbaa !21
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 64
  br i1 %exitcond.not, label %for.inc25, label %for.body6, !llvm.loop !32

for.inc25:                                        ; preds = %for.body6
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57.not = icmp eq i64 %indvars.iv.next55, 256
  br i1 %exitcond57.not, label %for.inc28, label %for.cond4.preheader, !llvm.loop !33

for.inc28:                                        ; preds = %for.inc25
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond61.not = icmp eq i64 %indvars.iv.next59, 512
  br i1 %exitcond61.not, label %for.end30, label %for.cond1.preheader, !llvm.loop !34

for.end30:                                        ; preds = %for.inc28
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
!21 = !{!22, !22, i64 0}
!22 = !{!"double", !5, i64 0}
!23 = distinct !{!23, !8, !9}
!24 = distinct !{!24, !8, !9}
!25 = distinct !{!25, !8, !9}
!26 = distinct !{!26, !8, !9}
!27 = distinct !{!27, !8, !9}
!28 = distinct !{!28, !8, !9}
!29 = distinct !{!29, !8, !9}
!30 = distinct !{!30, !8, !9}
!31 = distinct !{!31, !8, !9}
!32 = distinct !{!32, !8, !9}
!33 = distinct !{!33, !8, !9}
!34 = distinct !{!34, !8, !9}
