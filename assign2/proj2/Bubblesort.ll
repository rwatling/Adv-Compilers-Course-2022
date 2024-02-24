; ModuleID = './proj2/Bubblesort.bc'
source_filename = "./llvm-test-suite/SingleSource/Benchmarks/Stanford/Bubblesort.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = dso_local global i64 0, align 8
@biggest = dso_local global i32 0, align 4
@littlest = dso_local global i32 0, align 4
@sortlist = dso_local global [5001 x i32] zeroinitializer, align 16
@top = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"Error3 in Bubble.\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@value = dso_local global float 0.000000e+00, align 4
@fixed = dso_local global float 0.000000e+00, align 4
@floated = dso_local global float 0.000000e+00, align 4
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
@rma = dso_local global [41 x [41 x float]] zeroinitializer, align 16
@rmb = dso_local global [41 x [41 x float]] zeroinitializer, align 16
@rmr = dso_local global [41 x [41 x float]] zeroinitializer, align 16
@piececount = dso_local global [4 x i32] zeroinitializer, align 16
@class = dso_local global [13 x i32] zeroinitializer, align 16
@piecemax = dso_local global [13 x i32] zeroinitializer, align 16
@puzzl = dso_local global [512 x i32] zeroinitializer, align 16
@p = dso_local global [13 x [512 x i32]] zeroinitializer, align 16
@n = dso_local global i32 0, align 4
@kount = dso_local global i32 0, align 4
@z = dso_local global [257 x %struct.complex] zeroinitializer, align 16
@w = dso_local global [257 x %struct.complex] zeroinitializer, align 16
@e = dso_local global [130 x %struct.complex] zeroinitializer, align 16
@zr = dso_local global float 0.000000e+00, align 4
@zi = dso_local global float 0.000000e+00, align 4

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
define dso_local void @bInitarr() #0 {
entry:
  %i = alloca i32, align 4
  %temp = alloca i64, align 8
  call void @Initrand()
  store i32 0, i32* @biggest, align 4
  store i32 0, i32* @littlest, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %0, 500
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call = call i32 @Rand()
  %conv = sext i32 %call to i64
  store i64 %conv, i64* %temp, align 8
  %1 = load i64, i64* %temp, align 8
  %2 = load i64, i64* %temp, align 8
  %div = sdiv i64 %2, 100000
  %mul = mul nsw i64 %div, 100000
  %sub = sub nsw i64 %1, %mul
  %sub1 = sub nsw i64 %sub, 50000
  %conv2 = trunc i64 %sub1 to i32
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %idxprom
  store i32 %conv2, i32* %arrayidx, align 4
  %4 = load i32, i32* %i, align 4
  %idxprom3 = sext i32 %4 to i64
  %arrayidx4 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %idxprom3
  %5 = load i32, i32* %arrayidx4, align 4
  %6 = load i32, i32* @biggest, align 4
  %cmp5 = icmp sgt i32 %5, %6
  br i1 %cmp5, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %idxprom7 = sext i32 %7 to i64
  %arrayidx8 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %idxprom7
  %8 = load i32, i32* %arrayidx8, align 4
  store i32 %8, i32* @biggest, align 4
  br label %if.end16

if.else:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4
  %idxprom9 = sext i32 %9 to i64
  %arrayidx10 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %idxprom9
  %10 = load i32, i32* %arrayidx10, align 4
  %11 = load i32, i32* @littlest, align 4
  %cmp11 = icmp slt i32 %10, %11
  br i1 %cmp11, label %if.then13, label %if.end

if.then13:                                        ; preds = %if.else
  %12 = load i32, i32* %i, align 4
  %idxprom14 = sext i32 %12 to i64
  %arrayidx15 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %idxprom14
  %13 = load i32, i32* %arrayidx15, align 4
  store i32 %13, i32* @littlest, align 4
  br label %if.end

if.end:                                           ; preds = %if.then13, %if.else
  br label %if.end16

if.end16:                                         ; preds = %if.end, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end16
  %14 = load i32, i32* %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !4

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Bubble(i32 noundef %run) #0 {
entry:
  %run.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %run, i32* %run.addr, align 4
  call void @bInitarr()
  store i32 500, i32* @top, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.end, %entry
  %0 = load i32, i32* @top, align 4
  %cmp = icmp sgt i32 %0, 1
  br i1 %cmp, label %while.body, label %while.end18

while.body:                                       ; preds = %while.cond
  store i32 1, i32* %i, align 4
  br label %while.cond1

while.cond1:                                      ; preds = %if.end, %while.body
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* @top, align 4
  %cmp2 = icmp slt i32 %1, %2
  br i1 %cmp2, label %while.body3, label %while.end

while.body3:                                      ; preds = %while.cond1
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %idxprom
  %4 = load i32, i32* %arrayidx, align 4
  %5 = load i32, i32* %i, align 4
  %add = add nsw i32 %5, 1
  %idxprom4 = sext i32 %add to i64
  %arrayidx5 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %idxprom4
  %6 = load i32, i32* %arrayidx5, align 4
  %cmp6 = icmp sgt i32 %4, %6
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %while.body3
  %7 = load i32, i32* %i, align 4
  %idxprom7 = sext i32 %7 to i64
  %arrayidx8 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %idxprom7
  %8 = load i32, i32* %arrayidx8, align 4
  store i32 %8, i32* %j, align 4
  %9 = load i32, i32* %i, align 4
  %add9 = add nsw i32 %9, 1
  %idxprom10 = sext i32 %add9 to i64
  %arrayidx11 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %idxprom10
  %10 = load i32, i32* %arrayidx11, align 4
  %11 = load i32, i32* %i, align 4
  %idxprom12 = sext i32 %11 to i64
  %arrayidx13 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %idxprom12
  store i32 %10, i32* %arrayidx13, align 4
  %12 = load i32, i32* %j, align 4
  %13 = load i32, i32* %i, align 4
  %add14 = add nsw i32 %13, 1
  %idxprom15 = sext i32 %add14 to i64
  %arrayidx16 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %idxprom15
  store i32 %12, i32* %arrayidx16, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body3
  %14 = load i32, i32* %i, align 4
  %add17 = add nsw i32 %14, 1
  store i32 %add17, i32* %i, align 4
  br label %while.cond1, !llvm.loop !6

while.end:                                        ; preds = %while.cond1
  %15 = load i32, i32* @top, align 4
  %sub = sub nsw i32 %15, 1
  store i32 %sub, i32* @top, align 4
  br label %while.cond, !llvm.loop !7

while.end18:                                      ; preds = %while.cond
  %16 = load i32, i32* getelementptr inbounds ([5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 1), align 4
  %17 = load i32, i32* @littlest, align 4
  %cmp19 = icmp ne i32 %16, %17
  br i1 %cmp19, label %if.then21, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.end18
  %18 = load i32, i32* getelementptr inbounds ([5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 500), align 16
  %19 = load i32, i32* @biggest, align 4
  %cmp20 = icmp ne i32 %18, %19
  br i1 %cmp20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %lor.lhs.false, %while.end18
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0))
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %lor.lhs.false
  %20 = load i32, i32* %run.addr, align 4
  %add23 = add nsw i32 %20, 1
  %idxprom24 = sext i32 %add23 to i64
  %arrayidx25 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %idxprom24
  %21 = load i32, i32* %arrayidx25, align 4
  %call26 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 noundef %21)
  ret void
}

declare dso_local i32 @printf(i8* noundef, ...) #1

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
  %cmp = icmp slt i32 %0, 100
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  call void @Bubble(i32 noundef %1)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
