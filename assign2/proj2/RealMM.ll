; ModuleID = './proj2/RealMM.bc'
source_filename = "./llvm-test-suite/SingleSource/Benchmarks/Stanford/RealMM.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.element = type { i32, i32 }
%struct.complex = type { double, double }

@seed = dso_local global i64 0, align 8
@rma = dso_local global [41 x [41 x double]] zeroinitializer, align 16
@rmb = dso_local global [41 x [41 x double]] zeroinitializer, align 16
@rmr = dso_local global [41 x [41 x double]] zeroinitializer, align 16
@.str = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@value = dso_local global double 0.000000e+00, align 8
@fixed = dso_local global double 0.000000e+00, align 8
@floated = dso_local global double 0.000000e+00, align 8
@permarray = dso_local global [11 x i32] zeroinitializer, align 16
@pctr = dso_local global i32 0, align 4
@tree = dso_local global %struct.node* null, align 8
@stack = dso_local global [4 x i32] zeroinitializer, align 16
@cellspace = dso_local global [19 x %struct.element] zeroinitializer, align 16
@freelist = dso_local global i32 0, align 4
@movesdone = dso_local global i32 0, align 4
@ima = dso_local global [41 x [41 x i32]] zeroinitializer, align 16
@imb = dso_local global [41 x [41 x i32]] zeroinitializer, align 16
@imr = dso_local global [41 x [41 x i32]] zeroinitializer, align 16
@piececount = dso_local global [4 x i32] zeroinitializer, align 16
@class = dso_local global [13 x i32] zeroinitializer, align 16
@piecemax = dso_local global [13 x i32] zeroinitializer, align 16
@puzzl = dso_local global [512 x i32] zeroinitializer, align 16
@p = dso_local global [13 x [512 x i32]] zeroinitializer, align 16
@n = dso_local global i32 0, align 4
@kount = dso_local global i32 0, align 4
@sortlist = dso_local global [5001 x i32] zeroinitializer, align 16
@biggest = dso_local global i32 0, align 4
@littlest = dso_local global i32 0, align 4
@top = dso_local global i32 0, align 4
@z = dso_local global [257 x %struct.complex] zeroinitializer, align 16
@w = dso_local global [257 x %struct.complex] zeroinitializer, align 16
@e = dso_local global [130 x %struct.complex] zeroinitializer, align 16
@zr = dso_local global double 0.000000e+00, align 8
@zi = dso_local global double 0.000000e+00, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @Initrand() #0 {
entry:
  store i64 74755, i64* @seed, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Rand() #0 {
entry:
  %0 = load i64, i64* @seed, align 8
  %mul = mul nsw i64 %0, 1309
  %add = add nsw i64 %mul, 13849
  %and = and i64 %add, 65535
  store i64 %and, i64* @seed, align 8
  %1 = load i64, i64* @seed, align 8
  %conv = trunc i64 %1 to i32
  ret i32 %conv
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @rInitmatrix([41 x double]* noundef %m) #0 {
entry:
  %m.addr = alloca [41 x double]*, align 8
  %temp = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store [41 x double]* %m, [41 x double]** %m.addr, align 8
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %0, 40
  br i1 %cmp, label %for.body, label %for.end10

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4
  %cmp2 = icmp sle i32 %1, 40
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %call = call i32 @Rand()
  store i32 %call, i32* %temp, align 4
  %2 = load i32, i32* %temp, align 4
  %3 = load i32, i32* %temp, align 4
  %div = sdiv i32 %3, 120
  %mul = mul nsw i32 %div, 120
  %sub = sub nsw i32 %2, %mul
  %sub4 = sub nsw i32 %sub, 60
  %conv = sitofp i32 %sub4 to double
  %div5 = fdiv double %conv, 3.000000e+00
  %4 = load [41 x double]*, [41 x double]** %m.addr, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds [41 x double], [41 x double]* %4, i64 %idxprom
  %6 = load i32, i32* %j, align 4
  %idxprom6 = sext i32 %6 to i64
  %arrayidx7 = getelementptr inbounds [41 x double], [41 x double]* %arrayidx, i64 0, i64 %idxprom6
  store double %div5, double* %arrayidx7, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %7 = load i32, i32* %j, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1, !llvm.loop !4

for.end:                                          ; preds = %for.cond1
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %8 = load i32, i32* %i, align 4
  %inc9 = add nsw i32 %8, 1
  store i32 %inc9, i32* %i, align 4
  br label %for.cond, !llvm.loop !6

for.end10:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @rInnerproduct(double* noundef %result, [41 x double]* noundef %a, [41 x double]* noundef %b, i32 noundef %row, i32 noundef %column) #0 {
entry:
  %result.addr = alloca double*, align 8
  %a.addr = alloca [41 x double]*, align 8
  %b.addr = alloca [41 x double]*, align 8
  %row.addr = alloca i32, align 4
  %column.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store double* %result, double** %result.addr, align 8
  store [41 x double]* %a, [41 x double]** %a.addr, align 8
  store [41 x double]* %b, [41 x double]** %b.addr, align 8
  store i32 %row, i32* %row.addr, align 4
  store i32 %column, i32* %column.addr, align 4
  %0 = load double*, double** %result.addr, align 8
  store double 0.000000e+00, double* %0, align 8
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %1, 40
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load double*, double** %result.addr, align 8
  %3 = load double, double* %2, align 8
  %4 = load [41 x double]*, [41 x double]** %a.addr, align 8
  %5 = load i32, i32* %row.addr, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds [41 x double], [41 x double]* %4, i64 %idxprom
  %6 = load i32, i32* %i, align 4
  %idxprom1 = sext i32 %6 to i64
  %arrayidx2 = getelementptr inbounds [41 x double], [41 x double]* %arrayidx, i64 0, i64 %idxprom1
  %7 = load double, double* %arrayidx2, align 8
  %8 = load [41 x double]*, [41 x double]** %b.addr, align 8
  %9 = load i32, i32* %i, align 4
  %idxprom3 = sext i32 %9 to i64
  %arrayidx4 = getelementptr inbounds [41 x double], [41 x double]* %8, i64 %idxprom3
  %10 = load i32, i32* %column.addr, align 4
  %idxprom5 = sext i32 %10 to i64
  %arrayidx6 = getelementptr inbounds [41 x double], [41 x double]* %arrayidx4, i64 0, i64 %idxprom5
  %11 = load double, double* %arrayidx6, align 8
  %12 = call double @llvm.fmuladd.f64(double %7, double %11, double %3)
  %13 = load double*, double** %result.addr, align 8
  store double %12, double* %13, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @Mm(i32 noundef %run) #0 {
entry:
  %run.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %run, i32* %run.addr, align 4
  call void @Initrand()
  call void @rInitmatrix([41 x double]* noundef getelementptr inbounds ([41 x [41 x double]], [41 x [41 x double]]* @rma, i64 0, i64 0))
  call void @rInitmatrix([41 x double]* noundef getelementptr inbounds ([41 x [41 x double]], [41 x [41 x double]]* @rmb, i64 0, i64 0))
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %0, 40
  br i1 %cmp, label %for.body, label %for.end8

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4
  %cmp2 = icmp sle i32 %1, 40
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %2 = load i32, i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [41 x [41 x double]], [41 x [41 x double]]* @rmr, i64 0, i64 %idxprom
  %3 = load i32, i32* %j, align 4
  %idxprom4 = sext i32 %3 to i64
  %arrayidx5 = getelementptr inbounds [41 x double], [41 x double]* %arrayidx, i64 0, i64 %idxprom4
  %4 = load i32, i32* %i, align 4
  %5 = load i32, i32* %j, align 4
  call void @rInnerproduct(double* noundef %arrayidx5, [41 x double]* noundef getelementptr inbounds ([41 x [41 x double]], [41 x [41 x double]]* @rma, i64 0, i64 0), [41 x double]* noundef getelementptr inbounds ([41 x [41 x double]], [41 x [41 x double]]* @rmb, i64 0, i64 0), i32 noundef %4, i32 noundef %5)
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %6 = load i32, i32* %j, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1, !llvm.loop !8

for.end:                                          ; preds = %for.cond1
  br label %for.inc6

for.inc6:                                         ; preds = %for.end
  %7 = load i32, i32* %i, align 4
  %inc7 = add nsw i32 %7, 1
  store i32 %inc7, i32* %i, align 4
  br label %for.cond, !llvm.loop !9

for.end8:                                         ; preds = %for.cond
  %8 = load i32, i32* %run.addr, align 4
  %add = add nsw i32 %8, 1
  %idxprom9 = sext i32 %add to i64
  %arrayidx10 = getelementptr inbounds [41 x [41 x double]], [41 x [41 x double]]* @rmr, i64 0, i64 %idxprom9
  %9 = load i32, i32* %run.addr, align 4
  %add11 = add nsw i32 %9, 1
  %idxprom12 = sext i32 %add11 to i64
  %arrayidx13 = getelementptr inbounds [41 x double], [41 x double]* %arrayidx10, i64 0, i64 %idxprom12
  %10 = load double, double* %arrayidx13, align 8
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double noundef %10)
  ret void
}

declare dso_local i32 @printf(i8* noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  call void @Mm(i32 noundef %1)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !10

for.end:                                          ; preds = %for.cond
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 14.0.6"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = distinct !{!6, !5}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !5}
!9 = distinct !{!9, !5}
!10 = distinct !{!10, !5}
