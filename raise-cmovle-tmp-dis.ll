; ModuleID = '/home/user/work/llvm-project/build-debug/tools/llvm-mctoll/test/asm_test/X86/Output/raise-cmovle.s.tmp'
source_filename = "/home/user/work/llvm-project/build-debug/tools/llvm-mctoll/test/asm_test/X86/Output/raise-cmovle.s.tmp"

@rodata_14 = private unnamed_addr constant [17 x i8] c"\01\00\02\00ret val: %d\0A\00", align 4, !ROData_SecInfo !0

define dso_local i32 @call_me(i64 %arg1) {
entry:
  %0 = inttoptr i64 %arg1 to ptr
  %1 = load i64, ptr %0, align 1
  %2 = sub i64 %1, 6
  %3 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %1, i64 6)
  %CF = extractvalue { i64, i1 } %3, 1
  %ZF = icmp eq i64 %2, 0
  %highbit = and i64 -9223372036854775808, %2
  %SF = icmp ne i64 %highbit, 0
  %4 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %1, i64 6)
  %OF = extractvalue { i64, i1 } %4, 1
  %5 = and i64 %2, 255
  %6 = call i64 @llvm.ctpop.i64(i64 %5)
  %7 = and i64 %6, 1
  %PF = icmp eq i64 %7, 0
  %ZFCmp_CMOVLE = icmp eq i1 %ZF, true
  %SFOFCmp_CMOVLE = icmp ne i1 %SF, %OF
  %Cond_CMOVLE = or i1 %ZFCmp_CMOVLE, %SFOFCmp_CMOVLE
  %CMOV = select i1 %Cond_CMOVLE, i32 4, i32 2
  ret i32 %CMOV
}

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %RSP_P.0 = alloca i64, align 1
  store i64 3735928559, ptr %RSP_P.0, align 8
  %0 = getelementptr i8, ptr %RSP_P.0, i64 4
  store i32 5, ptr %0, align 1
  %1 = ptrtoint ptr %RSP_P.0 to i64
  %RDI = add i64 %1, 4
  %EAX = call i32 @call_me(i64 %RDI)
  %EAX1 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([17 x i8], ptr @rodata_14, i32 0, i32 4), i32 %EAX)
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
