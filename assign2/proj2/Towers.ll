; ModuleID = './proj2/Towers.bc'
source_filename = "./llvm-test-suite/SingleSource/Benchmarks/Stanford/Towers.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.element = type { i32, i32 }
%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.complex = type { float, float }

@seed = dso_local global i64 0, align 8
@.str = private unnamed_addr constant [22 x i8] c" Error in Towers: %s\0A\00", align 1
@stack = dso_local global [4 x i32] zeroinitializer, align 16
@freelist = dso_local global i32 0, align 4
@cellspace = dso_local global [19 x %struct.element] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [16 x i8] c"out of space   \00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"disc size error\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"nothing to pop \00", align 1
@movesdone = dso_local global i32 0, align 4
@.str.4 = private unnamed_addr constant [19 x i8] c" Error in Towers.\0A\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@value = dso_local global float 0.000000e+00, align 4
@fixed = dso_local global float 0.000000e+00, align 4
@floated = dso_local global float 0.000000e+00, align 4
@permarray = dso_local global [11 x i32] zeroinitializer, align 16
@pctr = dso_local global i32 0, align 4
@tree = dso_local global %struct.node* null, align 8
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
@sortlist = dso_local global [5001 x i32] zeroinitializer, align 16
@biggest = dso_local global i32 0, align 4
@littlest = dso_local global i32 0, align 4
@top = dso_local global i32 0, align 4
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
define dso_local void @Error(i8* noundef %emsg) #0 {
entry:
  %emsg.addr = alloca i8*, align 8
  store i8* %emsg, i8** %emsg.addr, align 8
  %0 = load i8*, i8** %emsg.addr, align 8
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0), i8* noundef %0)
  ret void
}

declare dso_local i32 @printf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @Makenull(i32 noundef %s) #0 {
entry:
  %s.addr = alloca i32, align 4
  store i32 %s, i32* %s.addr, align 4
  %0 = load i32, i32* %s.addr, align 4
  %idxprom = sext i32 %0 to i64
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* @stack, i64 0, i64 %idxprom
  store i32 0, i32* %arrayidx, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Getelement() #0 {
entry:
  %temp = alloca i32, align 4
  store i32 0, i32* %temp, align 4
  %0 = load i32, i32* @freelist, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @freelist, align 4
  store i32 %1, i32* %temp, align 4
  %2 = load i32, i32* @freelist, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [19 x %struct.element], [19 x %struct.element]* @cellspace, i64 0, i64 %idxprom
  %next = getelementptr inbounds %struct.element, %struct.element* %arrayidx, i32 0, i32 1
  %3 = load i32, i32* %next, align 4
  store i32 %3, i32* @freelist, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  call void @Error(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %temp, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Push(i32 noundef %i, i32 noundef %s) #0 {
entry:
  %i.addr = alloca i32, align 4
  %s.addr = alloca i32, align 4
  %errorfound = alloca i32, align 4
  %localel = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32 %s, i32* %s.addr, align 4
  store i32 0, i32* %errorfound, align 4
  %0 = load i32, i32* %s.addr, align 4
  %idxprom = sext i32 %0 to i64
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* @stack, i64 0, i64 %idxprom
  %1 = load i32, i32* %arrayidx, align 4
  %cmp = icmp sgt i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end7

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %s.addr, align 4
  %idxprom1 = sext i32 %2 to i64
  %arrayidx2 = getelementptr inbounds [4 x i32], [4 x i32]* @stack, i64 0, i64 %idxprom1
  %3 = load i32, i32* %arrayidx2, align 4
  %idxprom3 = sext i32 %3 to i64
  %arrayidx4 = getelementptr inbounds [19 x %struct.element], [19 x %struct.element]* @cellspace, i64 0, i64 %idxprom3
  %discsize = getelementptr inbounds %struct.element, %struct.element* %arrayidx4, i32 0, i32 0
  %4 = load i32, i32* %discsize, align 8
  %5 = load i32, i32* %i.addr, align 4
  %cmp5 = icmp sle i32 %4, %5
  br i1 %cmp5, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then
  store i32 1, i32* %errorfound, align 4
  call void @Error(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0))
  br label %if.end

if.end:                                           ; preds = %if.then6, %if.then
  br label %if.end7

if.end7:                                          ; preds = %if.end, %entry
  %6 = load i32, i32* %errorfound, align 4
  %tobool = icmp ne i32 %6, 0
  br i1 %tobool, label %if.end18, label %if.then8

if.then8:                                         ; preds = %if.end7
  %call = call i32 @Getelement()
  store i32 %call, i32* %localel, align 4
  %7 = load i32, i32* %s.addr, align 4
  %idxprom9 = sext i32 %7 to i64
  %arrayidx10 = getelementptr inbounds [4 x i32], [4 x i32]* @stack, i64 0, i64 %idxprom9
  %8 = load i32, i32* %arrayidx10, align 4
  %9 = load i32, i32* %localel, align 4
  %idxprom11 = sext i32 %9 to i64
  %arrayidx12 = getelementptr inbounds [19 x %struct.element], [19 x %struct.element]* @cellspace, i64 0, i64 %idxprom11
  %next = getelementptr inbounds %struct.element, %struct.element* %arrayidx12, i32 0, i32 1
  store i32 %8, i32* %next, align 4
  %10 = load i32, i32* %localel, align 4
  %11 = load i32, i32* %s.addr, align 4
  %idxprom13 = sext i32 %11 to i64
  %arrayidx14 = getelementptr inbounds [4 x i32], [4 x i32]* @stack, i64 0, i64 %idxprom13
  store i32 %10, i32* %arrayidx14, align 4
  %12 = load i32, i32* %i.addr, align 4
  %13 = load i32, i32* %localel, align 4
  %idxprom15 = sext i32 %13 to i64
  %arrayidx16 = getelementptr inbounds [19 x %struct.element], [19 x %struct.element]* @cellspace, i64 0, i64 %idxprom15
  %discsize17 = getelementptr inbounds %struct.element, %struct.element* %arrayidx16, i32 0, i32 0
  store i32 %12, i32* %discsize17, align 8
  br label %if.end18

if.end18:                                         ; preds = %if.then8, %if.end7
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Init(i32 noundef %s, i32 noundef %n) #0 {
entry:
  %s.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %discctr = alloca i32, align 4
  store i32 %s, i32* %s.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32, i32* %s.addr, align 4
  call void @Makenull(i32 noundef %0)
  %1 = load i32, i32* %n.addr, align 4
  store i32 %1, i32* %discctr, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %discctr, align 4
  %cmp = icmp sge i32 %2, 1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %discctr, align 4
  %4 = load i32, i32* %s.addr, align 4
  call void @Push(i32 noundef %3, i32 noundef %4)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %discctr, align 4
  %dec = add nsw i32 %5, -1
  store i32 %dec, i32* %discctr, align 4
  br label %for.cond, !llvm.loop !4

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Pop(i32 noundef %s) #0 {
entry:
  %retval = alloca i32, align 4
  %s.addr = alloca i32, align 4
  %temp = alloca i32, align 4
  %temp1 = alloca i32, align 4
  store i32 %s, i32* %s.addr, align 4
  %0 = load i32, i32* %s.addr, align 4
  %idxprom = sext i32 %0 to i64
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* @stack, i64 0, i64 %idxprom
  %1 = load i32, i32* %arrayidx, align 4
  %cmp = icmp sgt i32 %1, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %s.addr, align 4
  %idxprom1 = sext i32 %2 to i64
  %arrayidx2 = getelementptr inbounds [4 x i32], [4 x i32]* @stack, i64 0, i64 %idxprom1
  %3 = load i32, i32* %arrayidx2, align 4
  %idxprom3 = sext i32 %3 to i64
  %arrayidx4 = getelementptr inbounds [19 x %struct.element], [19 x %struct.element]* @cellspace, i64 0, i64 %idxprom3
  %discsize = getelementptr inbounds %struct.element, %struct.element* %arrayidx4, i32 0, i32 0
  %4 = load i32, i32* %discsize, align 8
  store i32 %4, i32* %temp1, align 4
  %5 = load i32, i32* %s.addr, align 4
  %idxprom5 = sext i32 %5 to i64
  %arrayidx6 = getelementptr inbounds [4 x i32], [4 x i32]* @stack, i64 0, i64 %idxprom5
  %6 = load i32, i32* %arrayidx6, align 4
  %idxprom7 = sext i32 %6 to i64
  %arrayidx8 = getelementptr inbounds [19 x %struct.element], [19 x %struct.element]* @cellspace, i64 0, i64 %idxprom7
  %next = getelementptr inbounds %struct.element, %struct.element* %arrayidx8, i32 0, i32 1
  %7 = load i32, i32* %next, align 4
  store i32 %7, i32* %temp, align 4
  %8 = load i32, i32* @freelist, align 4
  %9 = load i32, i32* %s.addr, align 4
  %idxprom9 = sext i32 %9 to i64
  %arrayidx10 = getelementptr inbounds [4 x i32], [4 x i32]* @stack, i64 0, i64 %idxprom9
  %10 = load i32, i32* %arrayidx10, align 4
  %idxprom11 = sext i32 %10 to i64
  %arrayidx12 = getelementptr inbounds [19 x %struct.element], [19 x %struct.element]* @cellspace, i64 0, i64 %idxprom11
  %next13 = getelementptr inbounds %struct.element, %struct.element* %arrayidx12, i32 0, i32 1
  store i32 %8, i32* %next13, align 4
  %11 = load i32, i32* %s.addr, align 4
  %idxprom14 = sext i32 %11 to i64
  %arrayidx15 = getelementptr inbounds [4 x i32], [4 x i32]* @stack, i64 0, i64 %idxprom14
  %12 = load i32, i32* %arrayidx15, align 4
  store i32 %12, i32* @freelist, align 4
  %13 = load i32, i32* %temp, align 4
  %14 = load i32, i32* %s.addr, align 4
  %idxprom16 = sext i32 %14 to i64
  %arrayidx17 = getelementptr inbounds [4 x i32], [4 x i32]* @stack, i64 0, i64 %idxprom16
  store i32 %13, i32* %arrayidx17, align 4
  %15 = load i32, i32* %temp1, align 4
  store i32 %15, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  call void @Error(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0))
  br label %if.end

if.end:                                           ; preds = %if.else
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %16 = load i32, i32* %retval, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Move(i32 noundef %s1, i32 noundef %s2) #0 {
entry:
  %s1.addr = alloca i32, align 4
  %s2.addr = alloca i32, align 4
  store i32 %s1, i32* %s1.addr, align 4
  store i32 %s2, i32* %s2.addr, align 4
  %0 = load i32, i32* %s1.addr, align 4
  %call = call i32 @Pop(i32 noundef %0)
  %1 = load i32, i32* %s2.addr, align 4
  call void @Push(i32 noundef %call, i32 noundef %1)
  %2 = load i32, i32* @movesdone, align 4
  %add = add nsw i32 %2, 1
  store i32 %add, i32* @movesdone, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @tower(i32 noundef %i, i32 noundef %j, i32 noundef %k) #0 {
entry:
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %other = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32 %j, i32* %j.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  %0 = load i32, i32* %k.addr, align 4
  %cmp = icmp eq i32 %0, 1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %i.addr, align 4
  %2 = load i32, i32* %j.addr, align 4
  call void @Move(i32 noundef %1, i32 noundef %2)
  br label %if.end

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %i.addr, align 4
  %sub = sub nsw i32 6, %3
  %4 = load i32, i32* %j.addr, align 4
  %sub1 = sub nsw i32 %sub, %4
  store i32 %sub1, i32* %other, align 4
  %5 = load i32, i32* %i.addr, align 4
  %6 = load i32, i32* %other, align 4
  %7 = load i32, i32* %k.addr, align 4
  %sub2 = sub nsw i32 %7, 1
  call void @tower(i32 noundef %5, i32 noundef %6, i32 noundef %sub2)
  %8 = load i32, i32* %i.addr, align 4
  %9 = load i32, i32* %j.addr, align 4
  call void @Move(i32 noundef %8, i32 noundef %9)
  %10 = load i32, i32* %other, align 4
  %11 = load i32, i32* %j.addr, align 4
  %12 = load i32, i32* %k.addr, align 4
  %sub3 = sub nsw i32 %12, 1
  call void @tower(i32 noundef %10, i32 noundef %11, i32 noundef %sub3)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Towers() #0 {
entry:
  %i = alloca i32, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %0, 18
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  %sub = sub nsw i32 %1, 1
  %2 = load i32, i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [19 x %struct.element], [19 x %struct.element]* @cellspace, i64 0, i64 %idxprom
  %next = getelementptr inbounds %struct.element, %struct.element* %arrayidx, i32 0, i32 1
  store i32 %sub, i32* %next, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  store i32 18, i32* @freelist, align 4
  call void @Init(i32 noundef 1, i32 noundef 14)
  call void @Makenull(i32 noundef 2)
  call void @Makenull(i32 noundef 3)
  store i32 0, i32* @movesdone, align 4
  call void @tower(i32 noundef 1, i32 noundef 2, i32 noundef 14)
  %4 = load i32, i32* @movesdone, align 4
  %cmp1 = icmp ne i32 %4, 16383
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.4, i64 0, i64 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end
  %5 = load i32, i32* @movesdone, align 4
  %call2 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 noundef %5)
  ret void
}

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
  call void @Towers()
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !7

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
