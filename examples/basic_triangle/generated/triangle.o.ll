; ModuleID = "main"
source_filename = "main"
target triple = "arm64-apple-macosx"

%kira.string = type { ptr, i64 }

%kira.bridge.value = type { i8, [7 x i8], i64, i64 }

@kira_bool_true_data = private unnamed_addr constant [5 x i8] c"true\00"
@kira_bool_true = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([5 x i8], ptr @kira_bool_true_data, i64 0, i64 0), i64 4 }
@kira_bool_false_data = private unnamed_addr constant [6 x i8] c"false\00"
@kira_bool_false = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([6 x i8], ptr @kira_bool_false_data, i64 0, i64 0), i64 5 }

declare void @"kira_native_write_i64"(i64)
declare void @"kira_native_write_f64"(double)
declare void @"kira_native_write_string"(ptr, i64)
declare void @"kira_native_write_ptr"(i64)
declare void @"kira_native_write_newline"()
declare void @"kira_native_print_i64"(i64)
declare void @"kira_native_print_f64"(double)
declare void @"kira_native_print_string"(ptr, i64)
declare ptr @"kira_array_alloc"(i64)
declare i64 @"kira_array_len"(ptr)
declare void @"kira_array_store"(ptr, i64, ptr)
declare void @"kira_array_append"(ptr, ptr)
declare void @"kira_array_load"(ptr, i64, ptr)
declare void @"kira_array_release"(ptr, ptr)
declare ptr @"kira_native_state_alloc"(i64, i64)
declare ptr @"kira_native_state_payload"(ptr)
declare ptr @"kira_native_state_recover"(ptr, i64)
declare i64 @strlen(ptr)
declare void @llvm.memcpy.p0.p0.i64(ptr, ptr, i64, i1 immarg)
declare ptr @malloc(i64)
declare void @free(ptr)
declare void @"kira_hybrid_call_runtime"(i32, ptr, i32, ptr)
define void @"kira_destroy_raw_ptr"(ptr %value) {
entry:
  call void @free(ptr %value)
  ret void
}


define void @"kira_native_impl_0"() {
entry:
  ret void
}

define void @"kira_native_fn_0"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  call void @"kira_native_impl_0"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

