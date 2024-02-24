; ModuleID = './proj2/Oscar.bc'
source_filename = "./llvm-test-suite/SingleSource/Benchmarks/Stanford/Oscar.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.complex = type { float, float }
%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.element = type { i32, i32 }

@seed = dso_local global i64 0, align 8
@.str = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"  %15.3f%15.3f\00", align 1
@e = dso_local global [130 x %struct.complex] zeroinitializer, align 16
@zr = dso_local global float 0.000000e+00, align 4
@zi = dso_local global float 0.000000e+00, align 4
@z = dso_local global [257 x %struct.complex] zeroinitializer, align 16
@w = dso_local global [257 x %struct.complex] zeroinitializer, align 16
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
@sortlist = dso_local global [5001 x i32] zeroinitializer, align 16
@biggest = dso_local global i32 0, align 4
@littlest = dso_local global i32 0, align 4
@top = dso_local global i32 0, align 4

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
define dso_local float @Cos(float noundef %x) #0 {
entry:
  %x.addr = alloca float, align 4
  %i = alloca i32, align 4
  %factor = alloca i32, align 4
  %result = alloca float, align 4
  %power = alloca float, align 4
  store float %x, float* %x.addr, align 4
  store float 1.000000e+00, float* %result, align 4
  store i32 1, i32* %factor, align 4
  %0 = load float, float* %x.addr, align 4
  store float %0, float* %power, align 4
  store i32 2, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %1, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %factor, align 4
  %3 = load i32, i32* %i, align 4
  %mul = mul nsw i32 %2, %3
  store i32 %mul, i32* %factor, align 4
  %4 = load float, float* %power, align 4
  %5 = load float, float* %x.addr, align 4
  %mul1 = fmul float %4, %5
  store float %mul1, float* %power, align 4
  %6 = load i32, i32* %i, align 4
  %and = and i32 %6, 1
  %cmp2 = icmp eq i32 %and, 0
  br i1 %cmp2, label %if.then, label %if.end8

if.then:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %and3 = and i32 %7, 3
  %cmp4 = icmp eq i32 %and3, 0
  br i1 %cmp4, label %if.then5, label %if.else

if.then5:                                         ; preds = %if.then
  %8 = load float, float* %result, align 4
  %9 = load float, float* %power, align 4
  %10 = load i32, i32* %factor, align 4
  %conv = sitofp i32 %10 to float
  %div = fdiv float %9, %conv
  %add = fadd float %8, %div
  store float %add, float* %result, align 4
  br label %if.end

if.else:                                          ; preds = %if.then
  %11 = load float, float* %result, align 4
  %12 = load float, float* %power, align 4
  %13 = load i32, i32* %factor, align 4
  %conv6 = sitofp i32 %13 to float
  %div7 = fdiv float %12, %conv6
  %sub = fsub float %11, %div7
  store float %sub, float* %result, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then5
  br label %if.end8

if.end8:                                          ; preds = %if.end, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end8
  %14 = load i32, i32* %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !4

for.end:                                          ; preds = %for.cond
  %15 = load float, float* %result, align 4
  ret float %15
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Min0(i32 noundef %arg1, i32 noundef %arg2) #0 {
entry:
  %retval = alloca i32, align 4
  %arg1.addr = alloca i32, align 4
  %arg2.addr = alloca i32, align 4
  store i32 %arg1, i32* %arg1.addr, align 4
  store i32 %arg2, i32* %arg2.addr, align 4
  %0 = load i32, i32* %arg1.addr, align 4
  %1 = load i32, i32* %arg2.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %arg1.addr, align 4
  store i32 %2, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %arg2.addr, align 4
  store i32 %3, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %retval, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Printcomplex(%struct.complex* noundef %zarray, i32 noundef %start, i32 noundef %finish, i32 noundef %increment) #0 {
entry:
  %zarray.addr = alloca %struct.complex*, align 8
  %start.addr = alloca i32, align 4
  %finish.addr = alloca i32, align 4
  %increment.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store %struct.complex* %zarray, %struct.complex** %zarray.addr, align 8
  store i32 %start, i32* %start.addr, align 4
  store i32 %finish, i32* %finish.addr, align 4
  store i32 %increment, i32* %increment.addr, align 4
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0))
  %0 = load i32, i32* %start.addr, align 4
  store i32 %0, i32* %i, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %1 = load %struct.complex*, %struct.complex** %zarray.addr, align 8
  %2 = load i32, i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds %struct.complex, %struct.complex* %1, i64 %idxprom
  %rp = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx, i32 0, i32 0
  %3 = load float, float* %rp, align 4
  %conv = fpext float %3 to double
  %4 = load %struct.complex*, %struct.complex** %zarray.addr, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom1 = sext i32 %5 to i64
  %arrayidx2 = getelementptr inbounds %struct.complex, %struct.complex* %4, i64 %idxprom1
  %ip = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx2, i32 0, i32 1
  %6 = load float, float* %ip, align 4
  %conv3 = fpext float %6 to double
  %call4 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), double noundef %conv, double noundef %conv3)
  %7 = load i32, i32* %i, align 4
  %8 = load i32, i32* %increment.addr, align 4
  %add = add nsw i32 %7, %8
  store i32 %add, i32* %i, align 4
  %9 = load %struct.complex*, %struct.complex** %zarray.addr, align 8
  %10 = load i32, i32* %i, align 4
  %idxprom5 = sext i32 %10 to i64
  %arrayidx6 = getelementptr inbounds %struct.complex, %struct.complex* %9, i64 %idxprom5
  %rp7 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx6, i32 0, i32 0
  %11 = load float, float* %rp7, align 4
  %conv8 = fpext float %11 to double
  %12 = load %struct.complex*, %struct.complex** %zarray.addr, align 8
  %13 = load i32, i32* %i, align 4
  %idxprom9 = sext i32 %13 to i64
  %arrayidx10 = getelementptr inbounds %struct.complex, %struct.complex* %12, i64 %idxprom9
  %ip11 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx10, i32 0, i32 1
  %14 = load float, float* %ip11, align 4
  %conv12 = fpext float %14 to double
  %call13 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), double noundef %conv8, double noundef %conv12)
  %call14 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0))
  %15 = load i32, i32* %i, align 4
  %16 = load i32, i32* %increment.addr, align 4
  %add15 = add nsw i32 %15, %16
  store i32 %add15, i32* %i, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %17 = load i32, i32* %i, align 4
  %18 = load i32, i32* %finish.addr, align 4
  %cmp = icmp sle i32 %17, %18
  br i1 %cmp, label %do.body, label %do.end, !llvm.loop !6

do.end:                                           ; preds = %do.cond
  ret void
}

declare dso_local i32 @printf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @Uniform11(i32* noundef %iy, float* noundef %yfl) #0 {
entry:
  %iy.addr = alloca i32*, align 8
  %yfl.addr = alloca float*, align 8
  store i32* %iy, i32** %iy.addr, align 8
  store float* %yfl, float** %yfl.addr, align 8
  %0 = load i32*, i32** %iy.addr, align 8
  %1 = load i32, i32* %0, align 4
  %mul = mul nsw i32 4855, %1
  %add = add nsw i32 %mul, 1731
  %and = and i32 %add, 8191
  %2 = load i32*, i32** %iy.addr, align 8
  store i32 %and, i32* %2, align 4
  %3 = load i32*, i32** %iy.addr, align 8
  %4 = load i32, i32* %3, align 4
  %conv = sitofp i32 %4 to float
  %div = fdiv float %conv, 8.192000e+03
  %5 = load float*, float** %yfl.addr, align 8
  store float %div, float* %5, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Exptab(i32 noundef %n, %struct.complex* noundef %e) #0 {
entry:
  %n.addr = alloca i32, align 4
  %e.addr = alloca %struct.complex*, align 8
  %theta = alloca float, align 4
  %divisor = alloca float, align 4
  %h = alloca [26 x float], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store %struct.complex* %e, %struct.complex** %e.addr, align 8
  store float 0x400921FB60000000, float* %theta, align 4
  store float 4.000000e+00, float* %divisor, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %0, 25
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load float, float* %theta, align 4
  %2 = load float, float* %divisor, align 4
  %div = fdiv float %1, %2
  %call = call float @Cos(float noundef %div)
  %mul = fmul float 2.000000e+00, %call
  %div1 = fdiv float 1.000000e+00, %mul
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [26 x float], [26 x float]* %h, i64 0, i64 %idxprom
  store float %div1, float* %arrayidx, align 4
  %4 = load float, float* %divisor, align 4
  %5 = load float, float* %divisor, align 4
  %add = fadd float %4, %5
  store float %add, float* %divisor, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %n.addr, align 4
  %div2 = sdiv i32 %7, 2
  store i32 %div2, i32* %m, align 4
  %8 = load i32, i32* %m, align 4
  %div3 = sdiv i32 %8, 2
  store i32 %div3, i32* %l, align 4
  store i32 1, i32* %j, align 4
  %9 = load %struct.complex*, %struct.complex** %e.addr, align 8
  %arrayidx4 = getelementptr inbounds %struct.complex, %struct.complex* %9, i64 1
  %rp = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx4, i32 0, i32 0
  store float 1.000000e+00, float* %rp, align 4
  %10 = load %struct.complex*, %struct.complex** %e.addr, align 8
  %arrayidx5 = getelementptr inbounds %struct.complex, %struct.complex* %10, i64 1
  %ip = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx5, i32 0, i32 1
  store float 0.000000e+00, float* %ip, align 4
  %11 = load %struct.complex*, %struct.complex** %e.addr, align 8
  %12 = load i32, i32* %l, align 4
  %add6 = add nsw i32 %12, 1
  %idxprom7 = sext i32 %add6 to i64
  %arrayidx8 = getelementptr inbounds %struct.complex, %struct.complex* %11, i64 %idxprom7
  %rp9 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx8, i32 0, i32 0
  store float 0.000000e+00, float* %rp9, align 4
  %13 = load %struct.complex*, %struct.complex** %e.addr, align 8
  %14 = load i32, i32* %l, align 4
  %add10 = add nsw i32 %14, 1
  %idxprom11 = sext i32 %add10 to i64
  %arrayidx12 = getelementptr inbounds %struct.complex, %struct.complex* %13, i64 %idxprom11
  %ip13 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx12, i32 0, i32 1
  store float 1.000000e+00, float* %ip13, align 4
  %15 = load %struct.complex*, %struct.complex** %e.addr, align 8
  %16 = load i32, i32* %m, align 4
  %add14 = add nsw i32 %16, 1
  %idxprom15 = sext i32 %add14 to i64
  %arrayidx16 = getelementptr inbounds %struct.complex, %struct.complex* %15, i64 %idxprom15
  %rp17 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx16, i32 0, i32 0
  store float -1.000000e+00, float* %rp17, align 4
  %17 = load %struct.complex*, %struct.complex** %e.addr, align 8
  %18 = load i32, i32* %m, align 4
  %add18 = add nsw i32 %18, 1
  %idxprom19 = sext i32 %add18 to i64
  %arrayidx20 = getelementptr inbounds %struct.complex, %struct.complex* %17, i64 %idxprom19
  %ip21 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx20, i32 0, i32 1
  store float 0.000000e+00, float* %ip21, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond63, %for.end
  %19 = load i32, i32* %l, align 4
  %div22 = sdiv i32 %19, 2
  store i32 %div22, i32* %i, align 4
  %20 = load i32, i32* %i, align 4
  store i32 %20, i32* %k, align 4
  br label %do.body23

do.body23:                                        ; preds = %do.cond, %do.body
  %21 = load i32, i32* %j, align 4
  %idxprom24 = sext i32 %21 to i64
  %arrayidx25 = getelementptr inbounds [26 x float], [26 x float]* %h, i64 0, i64 %idxprom24
  %22 = load float, float* %arrayidx25, align 4
  %23 = load %struct.complex*, %struct.complex** %e.addr, align 8
  %24 = load i32, i32* %k, align 4
  %25 = load i32, i32* %i, align 4
  %add26 = add nsw i32 %24, %25
  %add27 = add nsw i32 %add26, 1
  %idxprom28 = sext i32 %add27 to i64
  %arrayidx29 = getelementptr inbounds %struct.complex, %struct.complex* %23, i64 %idxprom28
  %rp30 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx29, i32 0, i32 0
  %26 = load float, float* %rp30, align 4
  %27 = load %struct.complex*, %struct.complex** %e.addr, align 8
  %28 = load i32, i32* %k, align 4
  %29 = load i32, i32* %i, align 4
  %sub = sub nsw i32 %28, %29
  %add31 = add nsw i32 %sub, 1
  %idxprom32 = sext i32 %add31 to i64
  %arrayidx33 = getelementptr inbounds %struct.complex, %struct.complex* %27, i64 %idxprom32
  %rp34 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx33, i32 0, i32 0
  %30 = load float, float* %rp34, align 4
  %add35 = fadd float %26, %30
  %mul36 = fmul float %22, %add35
  %31 = load %struct.complex*, %struct.complex** %e.addr, align 8
  %32 = load i32, i32* %k, align 4
  %add37 = add nsw i32 %32, 1
  %idxprom38 = sext i32 %add37 to i64
  %arrayidx39 = getelementptr inbounds %struct.complex, %struct.complex* %31, i64 %idxprom38
  %rp40 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx39, i32 0, i32 0
  store float %mul36, float* %rp40, align 4
  %33 = load i32, i32* %j, align 4
  %idxprom41 = sext i32 %33 to i64
  %arrayidx42 = getelementptr inbounds [26 x float], [26 x float]* %h, i64 0, i64 %idxprom41
  %34 = load float, float* %arrayidx42, align 4
  %35 = load %struct.complex*, %struct.complex** %e.addr, align 8
  %36 = load i32, i32* %k, align 4
  %37 = load i32, i32* %i, align 4
  %add43 = add nsw i32 %36, %37
  %add44 = add nsw i32 %add43, 1
  %idxprom45 = sext i32 %add44 to i64
  %arrayidx46 = getelementptr inbounds %struct.complex, %struct.complex* %35, i64 %idxprom45
  %ip47 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx46, i32 0, i32 1
  %38 = load float, float* %ip47, align 4
  %39 = load %struct.complex*, %struct.complex** %e.addr, align 8
  %40 = load i32, i32* %k, align 4
  %41 = load i32, i32* %i, align 4
  %sub48 = sub nsw i32 %40, %41
  %add49 = add nsw i32 %sub48, 1
  %idxprom50 = sext i32 %add49 to i64
  %arrayidx51 = getelementptr inbounds %struct.complex, %struct.complex* %39, i64 %idxprom50
  %ip52 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx51, i32 0, i32 1
  %42 = load float, float* %ip52, align 4
  %add53 = fadd float %38, %42
  %mul54 = fmul float %34, %add53
  %43 = load %struct.complex*, %struct.complex** %e.addr, align 8
  %44 = load i32, i32* %k, align 4
  %add55 = add nsw i32 %44, 1
  %idxprom56 = sext i32 %add55 to i64
  %arrayidx57 = getelementptr inbounds %struct.complex, %struct.complex* %43, i64 %idxprom56
  %ip58 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx57, i32 0, i32 1
  store float %mul54, float* %ip58, align 4
  %45 = load i32, i32* %k, align 4
  %46 = load i32, i32* %l, align 4
  %add59 = add nsw i32 %45, %46
  store i32 %add59, i32* %k, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body23
  %47 = load i32, i32* %k, align 4
  %48 = load i32, i32* %m, align 4
  %cmp60 = icmp sle i32 %47, %48
  br i1 %cmp60, label %do.body23, label %do.end, !llvm.loop !8

do.end:                                           ; preds = %do.cond
  %49 = load i32, i32* %j, align 4
  %add61 = add nsw i32 %49, 1
  %call62 = call i32 @Min0(i32 noundef %add61, i32 noundef 25)
  store i32 %call62, i32* %j, align 4
  %50 = load i32, i32* %i, align 4
  store i32 %50, i32* %l, align 4
  br label %do.cond63

do.cond63:                                        ; preds = %do.end
  %51 = load i32, i32* %l, align 4
  %cmp64 = icmp sgt i32 %51, 1
  br i1 %cmp64, label %do.body, label %do.end65, !llvm.loop !9

do.end65:                                         ; preds = %do.cond63
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Fft(i32 noundef %n, %struct.complex* noundef %z, %struct.complex* noundef %w, %struct.complex* noundef %e, float noundef %sqrinv) #0 {
entry:
  %n.addr = alloca i32, align 4
  %z.addr = alloca %struct.complex*, align 8
  %w.addr = alloca %struct.complex*, align 8
  %e.addr = alloca %struct.complex*, align 8
  %sqrinv.addr = alloca float, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %index = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store %struct.complex* %z, %struct.complex** %z.addr, align 8
  store %struct.complex* %w, %struct.complex** %w.addr, align 8
  store %struct.complex* %e, %struct.complex** %e.addr, align 8
  store float %sqrinv, float* %sqrinv.addr, align 4
  %0 = load i32, i32* %n.addr, align 4
  %div = sdiv i32 %0, 2
  store i32 %div, i32* %m, align 4
  store i32 1, i32* %l, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond94, %entry
  store i32 0, i32* %k, align 4
  %1 = load i32, i32* %l, align 4
  store i32 %1, i32* %j, align 4
  store i32 1, i32* %i, align 4
  br label %do.body1

do.body1:                                         ; preds = %do.cond81, %do.body
  br label %do.body2

do.body2:                                         ; preds = %do.cond, %do.body1
  %2 = load %struct.complex*, %struct.complex** %z.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds %struct.complex, %struct.complex* %2, i64 %idxprom
  %rp = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx, i32 0, i32 0
  %4 = load float, float* %rp, align 4
  %5 = load %struct.complex*, %struct.complex** %z.addr, align 8
  %6 = load i32, i32* %m, align 4
  %7 = load i32, i32* %i, align 4
  %add = add nsw i32 %6, %7
  %idxprom3 = sext i32 %add to i64
  %arrayidx4 = getelementptr inbounds %struct.complex, %struct.complex* %5, i64 %idxprom3
  %rp5 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx4, i32 0, i32 0
  %8 = load float, float* %rp5, align 4
  %add6 = fadd float %4, %8
  %9 = load %struct.complex*, %struct.complex** %w.addr, align 8
  %10 = load i32, i32* %i, align 4
  %11 = load i32, i32* %k, align 4
  %add7 = add nsw i32 %10, %11
  %idxprom8 = sext i32 %add7 to i64
  %arrayidx9 = getelementptr inbounds %struct.complex, %struct.complex* %9, i64 %idxprom8
  %rp10 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx9, i32 0, i32 0
  store float %add6, float* %rp10, align 4
  %12 = load %struct.complex*, %struct.complex** %z.addr, align 8
  %13 = load i32, i32* %i, align 4
  %idxprom11 = sext i32 %13 to i64
  %arrayidx12 = getelementptr inbounds %struct.complex, %struct.complex* %12, i64 %idxprom11
  %ip = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx12, i32 0, i32 1
  %14 = load float, float* %ip, align 4
  %15 = load %struct.complex*, %struct.complex** %z.addr, align 8
  %16 = load i32, i32* %m, align 4
  %17 = load i32, i32* %i, align 4
  %add13 = add nsw i32 %16, %17
  %idxprom14 = sext i32 %add13 to i64
  %arrayidx15 = getelementptr inbounds %struct.complex, %struct.complex* %15, i64 %idxprom14
  %ip16 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx15, i32 0, i32 1
  %18 = load float, float* %ip16, align 4
  %add17 = fadd float %14, %18
  %19 = load %struct.complex*, %struct.complex** %w.addr, align 8
  %20 = load i32, i32* %i, align 4
  %21 = load i32, i32* %k, align 4
  %add18 = add nsw i32 %20, %21
  %idxprom19 = sext i32 %add18 to i64
  %arrayidx20 = getelementptr inbounds %struct.complex, %struct.complex* %19, i64 %idxprom19
  %ip21 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx20, i32 0, i32 1
  store float %add17, float* %ip21, align 4
  %22 = load %struct.complex*, %struct.complex** %e.addr, align 8
  %23 = load i32, i32* %k, align 4
  %add22 = add nsw i32 %23, 1
  %idxprom23 = sext i32 %add22 to i64
  %arrayidx24 = getelementptr inbounds %struct.complex, %struct.complex* %22, i64 %idxprom23
  %rp25 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx24, i32 0, i32 0
  %24 = load float, float* %rp25, align 4
  %25 = load %struct.complex*, %struct.complex** %z.addr, align 8
  %26 = load i32, i32* %i, align 4
  %idxprom26 = sext i32 %26 to i64
  %arrayidx27 = getelementptr inbounds %struct.complex, %struct.complex* %25, i64 %idxprom26
  %rp28 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx27, i32 0, i32 0
  %27 = load float, float* %rp28, align 4
  %28 = load %struct.complex*, %struct.complex** %z.addr, align 8
  %29 = load i32, i32* %i, align 4
  %30 = load i32, i32* %m, align 4
  %add29 = add nsw i32 %29, %30
  %idxprom30 = sext i32 %add29 to i64
  %arrayidx31 = getelementptr inbounds %struct.complex, %struct.complex* %28, i64 %idxprom30
  %rp32 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx31, i32 0, i32 0
  %31 = load float, float* %rp32, align 4
  %sub = fsub float %27, %31
  %32 = load %struct.complex*, %struct.complex** %e.addr, align 8
  %33 = load i32, i32* %k, align 4
  %add33 = add nsw i32 %33, 1
  %idxprom34 = sext i32 %add33 to i64
  %arrayidx35 = getelementptr inbounds %struct.complex, %struct.complex* %32, i64 %idxprom34
  %ip36 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx35, i32 0, i32 1
  %34 = load float, float* %ip36, align 4
  %35 = load %struct.complex*, %struct.complex** %z.addr, align 8
  %36 = load i32, i32* %i, align 4
  %idxprom37 = sext i32 %36 to i64
  %arrayidx38 = getelementptr inbounds %struct.complex, %struct.complex* %35, i64 %idxprom37
  %ip39 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx38, i32 0, i32 1
  %37 = load float, float* %ip39, align 4
  %38 = load %struct.complex*, %struct.complex** %z.addr, align 8
  %39 = load i32, i32* %i, align 4
  %40 = load i32, i32* %m, align 4
  %add40 = add nsw i32 %39, %40
  %idxprom41 = sext i32 %add40 to i64
  %arrayidx42 = getelementptr inbounds %struct.complex, %struct.complex* %38, i64 %idxprom41
  %ip43 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx42, i32 0, i32 1
  %41 = load float, float* %ip43, align 4
  %sub44 = fsub float %37, %41
  %mul45 = fmul float %34, %sub44
  %neg = fneg float %mul45
  %42 = call float @llvm.fmuladd.f32(float %24, float %sub, float %neg)
  %43 = load %struct.complex*, %struct.complex** %w.addr, align 8
  %44 = load i32, i32* %i, align 4
  %45 = load i32, i32* %j, align 4
  %add46 = add nsw i32 %44, %45
  %idxprom47 = sext i32 %add46 to i64
  %arrayidx48 = getelementptr inbounds %struct.complex, %struct.complex* %43, i64 %idxprom47
  %rp49 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx48, i32 0, i32 0
  store float %42, float* %rp49, align 4
  %46 = load %struct.complex*, %struct.complex** %e.addr, align 8
  %47 = load i32, i32* %k, align 4
  %add50 = add nsw i32 %47, 1
  %idxprom51 = sext i32 %add50 to i64
  %arrayidx52 = getelementptr inbounds %struct.complex, %struct.complex* %46, i64 %idxprom51
  %rp53 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx52, i32 0, i32 0
  %48 = load float, float* %rp53, align 4
  %49 = load %struct.complex*, %struct.complex** %z.addr, align 8
  %50 = load i32, i32* %i, align 4
  %idxprom54 = sext i32 %50 to i64
  %arrayidx55 = getelementptr inbounds %struct.complex, %struct.complex* %49, i64 %idxprom54
  %ip56 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx55, i32 0, i32 1
  %51 = load float, float* %ip56, align 4
  %52 = load %struct.complex*, %struct.complex** %z.addr, align 8
  %53 = load i32, i32* %i, align 4
  %54 = load i32, i32* %m, align 4
  %add57 = add nsw i32 %53, %54
  %idxprom58 = sext i32 %add57 to i64
  %arrayidx59 = getelementptr inbounds %struct.complex, %struct.complex* %52, i64 %idxprom58
  %ip60 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx59, i32 0, i32 1
  %55 = load float, float* %ip60, align 4
  %sub61 = fsub float %51, %55
  %56 = load %struct.complex*, %struct.complex** %e.addr, align 8
  %57 = load i32, i32* %k, align 4
  %add62 = add nsw i32 %57, 1
  %idxprom63 = sext i32 %add62 to i64
  %arrayidx64 = getelementptr inbounds %struct.complex, %struct.complex* %56, i64 %idxprom63
  %ip65 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx64, i32 0, i32 1
  %58 = load float, float* %ip65, align 4
  %59 = load %struct.complex*, %struct.complex** %z.addr, align 8
  %60 = load i32, i32* %i, align 4
  %idxprom66 = sext i32 %60 to i64
  %arrayidx67 = getelementptr inbounds %struct.complex, %struct.complex* %59, i64 %idxprom66
  %rp68 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx67, i32 0, i32 0
  %61 = load float, float* %rp68, align 4
  %62 = load %struct.complex*, %struct.complex** %z.addr, align 8
  %63 = load i32, i32* %i, align 4
  %64 = load i32, i32* %m, align 4
  %add69 = add nsw i32 %63, %64
  %idxprom70 = sext i32 %add69 to i64
  %arrayidx71 = getelementptr inbounds %struct.complex, %struct.complex* %62, i64 %idxprom70
  %rp72 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx71, i32 0, i32 0
  %65 = load float, float* %rp72, align 4
  %sub73 = fsub float %61, %65
  %mul74 = fmul float %58, %sub73
  %66 = call float @llvm.fmuladd.f32(float %48, float %sub61, float %mul74)
  %67 = load %struct.complex*, %struct.complex** %w.addr, align 8
  %68 = load i32, i32* %i, align 4
  %69 = load i32, i32* %j, align 4
  %add75 = add nsw i32 %68, %69
  %idxprom76 = sext i32 %add75 to i64
  %arrayidx77 = getelementptr inbounds %struct.complex, %struct.complex* %67, i64 %idxprom76
  %ip78 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx77, i32 0, i32 1
  store float %66, float* %ip78, align 4
  %70 = load i32, i32* %i, align 4
  %add79 = add nsw i32 %70, 1
  store i32 %add79, i32* %i, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body2
  %71 = load i32, i32* %i, align 4
  %72 = load i32, i32* %j, align 4
  %cmp = icmp sle i32 %71, %72
  br i1 %cmp, label %do.body2, label %do.end, !llvm.loop !10

do.end:                                           ; preds = %do.cond
  %73 = load i32, i32* %j, align 4
  store i32 %73, i32* %k, align 4
  %74 = load i32, i32* %k, align 4
  %75 = load i32, i32* %l, align 4
  %add80 = add nsw i32 %74, %75
  store i32 %add80, i32* %j, align 4
  br label %do.cond81

do.cond81:                                        ; preds = %do.end
  %76 = load i32, i32* %j, align 4
  %77 = load i32, i32* %m, align 4
  %cmp82 = icmp sle i32 %76, %77
  br i1 %cmp82, label %do.body1, label %do.end83, !llvm.loop !11

do.end83:                                         ; preds = %do.cond81
  store i32 1, i32* %index, align 4
  br label %do.body84

do.body84:                                        ; preds = %do.cond90, %do.end83
  %78 = load %struct.complex*, %struct.complex** %z.addr, align 8
  %79 = load i32, i32* %index, align 4
  %idxprom85 = sext i32 %79 to i64
  %arrayidx86 = getelementptr inbounds %struct.complex, %struct.complex* %78, i64 %idxprom85
  %80 = load %struct.complex*, %struct.complex** %w.addr, align 8
  %81 = load i32, i32* %index, align 4
  %idxprom87 = sext i32 %81 to i64
  %arrayidx88 = getelementptr inbounds %struct.complex, %struct.complex* %80, i64 %idxprom87
  %82 = bitcast %struct.complex* %arrayidx86 to i8*
  %83 = bitcast %struct.complex* %arrayidx88 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %82, i8* align 4 %83, i64 8, i1 false)
  %84 = load i32, i32* %index, align 4
  %add89 = add nsw i32 %84, 1
  store i32 %add89, i32* %index, align 4
  br label %do.cond90

do.cond90:                                        ; preds = %do.body84
  %85 = load i32, i32* %index, align 4
  %86 = load i32, i32* %n.addr, align 4
  %cmp91 = icmp sle i32 %85, %86
  br i1 %cmp91, label %do.body84, label %do.end92, !llvm.loop !12

do.end92:                                         ; preds = %do.cond90
  %87 = load i32, i32* %l, align 4
  %88 = load i32, i32* %l, align 4
  %add93 = add nsw i32 %87, %88
  store i32 %add93, i32* %l, align 4
  br label %do.cond94

do.cond94:                                        ; preds = %do.end92
  %89 = load i32, i32* %l, align 4
  %90 = load i32, i32* %m, align 4
  %cmp95 = icmp sle i32 %89, %90
  br i1 %cmp95, label %do.body, label %do.end96, !llvm.loop !13

do.end96:                                         ; preds = %do.cond94
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %do.end96
  %91 = load i32, i32* %i, align 4
  %92 = load i32, i32* %n.addr, align 4
  %cmp97 = icmp sle i32 %91, %92
  br i1 %cmp97, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %93 = load float, float* %sqrinv.addr, align 4
  %94 = load %struct.complex*, %struct.complex** %z.addr, align 8
  %95 = load i32, i32* %i, align 4
  %idxprom98 = sext i32 %95 to i64
  %arrayidx99 = getelementptr inbounds %struct.complex, %struct.complex* %94, i64 %idxprom98
  %rp100 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx99, i32 0, i32 0
  %96 = load float, float* %rp100, align 4
  %mul = fmul float %93, %96
  %97 = load %struct.complex*, %struct.complex** %z.addr, align 8
  %98 = load i32, i32* %i, align 4
  %idxprom101 = sext i32 %98 to i64
  %arrayidx102 = getelementptr inbounds %struct.complex, %struct.complex* %97, i64 %idxprom101
  %rp103 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx102, i32 0, i32 0
  store float %mul, float* %rp103, align 4
  %99 = load float, float* %sqrinv.addr, align 4
  %fneg = fneg float %99
  %100 = load %struct.complex*, %struct.complex** %z.addr, align 8
  %101 = load i32, i32* %i, align 4
  %idxprom104 = sext i32 %101 to i64
  %arrayidx105 = getelementptr inbounds %struct.complex, %struct.complex* %100, i64 %idxprom104
  %ip106 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx105, i32 0, i32 1
  %102 = load float, float* %ip106, align 4
  %mul107 = fmul float %fneg, %102
  %103 = load %struct.complex*, %struct.complex** %z.addr, align 8
  %104 = load i32, i32* %i, align 4
  %idxprom108 = sext i32 %104 to i64
  %arrayidx109 = getelementptr inbounds %struct.complex, %struct.complex* %103, i64 %idxprom108
  %ip110 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx109, i32 0, i32 1
  store float %mul107, float* %ip110, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %105 = load i32, i32* %i, align 4
  %inc = add nsw i32 %105, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !14

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @Oscar() #0 {
entry:
  %i = alloca i32, align 4
  %s = alloca i32, align 4
  call void @Exptab(i32 noundef 256, %struct.complex* noundef getelementptr inbounds ([130 x %struct.complex], [130 x %struct.complex]* @e, i64 0, i64 0))
  store i64 5767, i64* @seed, align 8
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %0, 256
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* @seed, align 8
  %conv = trunc i64 %1 to i32
  store i32 %conv, i32* %s, align 4
  call void @Uniform11(i32* noundef %s, float* noundef @zr)
  %2 = load i32, i32* %s, align 4
  %conv1 = sext i32 %2 to i64
  store i64 %conv1, i64* @seed, align 8
  call void @Uniform11(i32* noundef %s, float* noundef @zi)
  %3 = load i32, i32* %s, align 4
  %conv2 = sext i32 %3 to i64
  store i64 %conv2, i64* @seed, align 8
  %4 = load float, float* @zr, align 4
  %5 = call float @llvm.fmuladd.f32(float 2.000000e+01, float %4, float -1.000000e+01)
  %6 = load i32, i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds [257 x %struct.complex], [257 x %struct.complex]* @z, i64 0, i64 %idxprom
  %rp = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx, i32 0, i32 0
  store float %5, float* %rp, align 8
  %7 = load float, float* @zi, align 4
  %8 = call float @llvm.fmuladd.f32(float 2.000000e+01, float %7, float -1.000000e+01)
  %9 = load i32, i32* %i, align 4
  %idxprom3 = sext i32 %9 to i64
  %arrayidx4 = getelementptr inbounds [257 x %struct.complex], [257 x %struct.complex]* @z, i64 0, i64 %idxprom3
  %ip = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx4, i32 0, i32 1
  store float %8, float* %ip, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !15

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %i, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc9, %for.end
  %11 = load i32, i32* %i, align 4
  %cmp6 = icmp sle i32 %11, 20
  br i1 %cmp6, label %for.body8, label %for.end11

for.body8:                                        ; preds = %for.cond5
  call void @Fft(i32 noundef 256, %struct.complex* noundef getelementptr inbounds ([257 x %struct.complex], [257 x %struct.complex]* @z, i64 0, i64 0), %struct.complex* noundef getelementptr inbounds ([257 x %struct.complex], [257 x %struct.complex]* @w, i64 0, i64 0), %struct.complex* noundef getelementptr inbounds ([130 x %struct.complex], [130 x %struct.complex]* @e, i64 0, i64 0), float noundef 6.250000e-02)
  br label %for.inc9

for.inc9:                                         ; preds = %for.body8
  %12 = load i32, i32* %i, align 4
  %inc10 = add nsw i32 %12, 1
  store i32 %inc10, i32* %i, align 4
  br label %for.cond5, !llvm.loop !16

for.end11:                                        ; preds = %for.cond5
  call void @Printcomplex(%struct.complex* noundef getelementptr inbounds ([257 x %struct.complex], [257 x %struct.complex]* @z, i64 0, i64 0), i32 noundef 1, i32 noundef 256, i32 noundef 17)
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
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @Oscar()
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !17

for.end:                                          ; preds = %for.cond
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nofree nounwind willreturn }

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
!11 = distinct !{!11, !5}
!12 = distinct !{!12, !5}
!13 = distinct !{!13, !5}
!14 = distinct !{!14, !5}
!15 = distinct !{!15, !5}
!16 = distinct !{!16, !5}
!17 = distinct !{!17, !5}
