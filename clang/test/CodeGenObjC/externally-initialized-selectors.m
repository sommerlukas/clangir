// RUN: %clang_cc1 -fobjc-runtime=macosx-fragile-10.5 -o - -emit-llvm %s | FileCheck -check-prefix=FRAGILE %s
// RUN: %clang_cc1 -o - -emit-llvm %s | FileCheck -check-prefix=NONFRAGILE %s

// NONFRAGILE: @OBJC_SELECTOR_REFERENCES_ = internal externally_initialized global
// FRAGILE: @OBJC_SELECTOR_REFERENCES_ = private externally_initialized global

void test(id x) {
  [x doSomething];
}
