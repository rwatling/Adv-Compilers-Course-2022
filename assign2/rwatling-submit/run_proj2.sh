#!/bin/bash

source llvm_path.sh

mkdir -p proj2/gvn

mkdir -p proj2/svn

mkdir -p proj2/lvn

for benchmark in ./llvm-test-suite/SingleSource/Benchmarks/Stanford/*.c
do
  clang -w -O0 -emit-llvm -Xclang -disable-O0-optnone -c "${benchmark}"

  benchname=$(basename ${benchmark})
  
  benchname="${benchname%%.c}"

  echo $benchname

  mv "./${benchname}.bc" "./proj2"

  llvm-dis "./proj2/${benchname}.bc"

  opt -enable-pre=false -gvn -stats "./proj2/${benchname}.ll" 2> "./proj2/gvn/${benchname}.txt"

  opt -enable-pre=false -gvn -lvn -stats "./proj2/${benchname}.ll" 2> "./proj2/lvn/${benchname}.txt"

  opt -enable-pre=false -gvn -svn -stats "./proj2/${benchname}.ll" 2> "./proj2/svn/${benchname}.txt"

  cp "./proj2/svn/${benchname}.txt" "./proj2/svn/${benchname}.ebb"
done
