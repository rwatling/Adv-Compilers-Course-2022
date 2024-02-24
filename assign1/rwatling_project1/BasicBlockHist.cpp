//===- BasicBlockHist.cpp -------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// Author: Robbie Watling (CS5130)
// This file implements a pass to perform simple basic block analysis to produce histograms
//
//===----------------------------------------------------------------------===//

#include "llvm/ADT/Statistic.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

#define DEBUG_TYPE "basicblockhist"
#define BB_MAX_INSTS 1024

namespace {
  
  struct BasicBlockHist : public FunctionPass {
    static char ID; // Pass identification, replacement for typeid
    BasicBlockHist() : FunctionPass(ID) {}

    bool runOnFunction(Function &F);
  };
}

bool BasicBlockHist::runOnFunction(Function &F) {

  int loadCount=0;
  int allCount=0;
  int allTotal=0;
  int loadTotal=0;

  float loadSum=0.0;
  float allSum=0.0;

  int allHist[BB_MAX_INSTS] = { };
  int loadHist[BB_MAX_INSTS] = { };

  errs() << "Function: ";
  errs().write_escaped(F.getName());
  errs() << "\n\n";

  // Count all instructions and load instruction
  for (Function::iterator BB = F.begin(), E = F.end(); BB != E; BB++) {
    loadCount = 0;
    allCount = 0;
        
    for (BasicBlock::iterator I = BB->begin(), IE = BB->end(); I != IE; I++) {

      if (I->getOpcode() == Instruction::Load) {
        loadCount++;
      }

    allCount++; 
  }

    allSum += allCount;
    loadSum += loadCount;

    if (allCount > 0) {
      allHist[allCount]++;
    }
    
    if (loadCount > 0) {
      loadHist[loadCount]++;
    }
  }

  // Display histograms
  errs() << "All instructions:\n";

  for (int i=0; i < BB_MAX_INSTS; i++) {
    if (allHist[i] > 0) {
      errs() << i << ": " << allHist[i] << "\n";
      allTotal += allHist[i];
    }
  }

  errs() << "avg: " << ((float) allSum / (float) allTotal) << "\n\n";

  errs() << "Load only:\n";

  for (int i=0; i < BB_MAX_INSTS; i++) {
      if (loadHist[i] > 0) {
          errs() << i << ": " << loadHist[i] << "\n";
          loadTotal += loadHist[i];
      }
  }

  if (loadTotal > 0) {
    errs() << "avg: " << ((float) loadSum / (float) loadTotal);
  }

  errs() << "\n\n";

  return false;
}

char BasicBlockHist::ID = 0;
static RegisterPass<BasicBlockHist> X("basicblockhist", "Basic Block Histogram Pass");
