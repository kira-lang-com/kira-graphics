; ModuleID = "main"
source_filename = "main"
target triple = "arm64-apple-macosx"

%t.sapp_event = type { i64, i32, i32, i32, i8, i32, i32, float, float, float, float, float, float, i32, [8 x %t.sapp_touchpoint], i32, i32, i32, i32 }
%t.GraphicsShader = type { %t.BackendShaderHandle }
%t.sapp_touchpoint = type { i64, float, float, i32, i8 }
%t.sapp_logger = type { ptr, ptr }
%t.sapp_gl_desc = type { i32, i32 }
%t.sapp_html5_desc = type { ptr, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8 }
%t.RenderPipelineDescriptor = type { %kira.string, %t.GraphicsShader }
%t.RenderEncoder = type { %t.RenderPipeline, i64, i64 }
%t.GraphicsApplication = type { %kira.string, i64, i64, i64, ptr, ptr, ptr }
%t.Graphics = type { ptr }
%t.sapp_desc = type { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i32, i32, i8, i8, i8, ptr, i8, i32, i8, i32, i32, %t.sapp_icon_desc, %t.sapp_allocator, %t.sapp_logger, %t.sapp_gl_desc, %t.sapp_win32_desc, %t.sapp_html5_desc, %t.sapp_ios_desc }
%t.ShaderDescriptor = type { %kira.string, %kira.string, %kira.string, %kira.string, %kira.string }
%t.sapp_range = type { ptr, i64 }
%t.sapp_ios_desc = type { i8 }
%t.GraphicsFrame = type { %t.Color, %t.RenderEncoder, i8, i8, i8, ptr }
%t.TriangleState = type { %t.GraphicsShader, %t.RenderPipeline }
%t.RenderPipeline = type { %t.BackendPipelineHandle }
%t.Color = type { double, double, double, double }
%t.GraphicsAppRuntimeState = type { %t.GraphicsApplication, ptr, i64 }
%t.sapp_win32_desc = type { i8, i8, i8 }
%t.sapp_allocator = type { ptr, ptr, ptr }
%t.sapp_icon_desc = type { i8, [8 x %t.sapp_image_desc] }
%t.sapp_image_desc = type { i32, i32, i32, i32, %t.sapp_range }
%t.BackendPipelineHandle = type { i32 }
%t.BackendShaderHandle = type { i32 }

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
declare void @"kira_array_load"(ptr, i64, ptr)
declare ptr @"kira_native_state_alloc"(i64, i64)
declare ptr @"kira_native_state_payload"(ptr)
declare ptr @"kira_native_state_recover"(ptr, i64)
declare ptr @malloc(i64)
declare void @"kg_setup"()

declare void @"kg_apply_pipeline_and_draw"(i32, i32, i32)

declare void @"kg_begin_swapchain_pass"(float, float, float, float)

declare void @"kg_destroy_pipeline_id"(i32)

declare void @"kg_destroy_default_resources"()

declare void @"kg_destroy_shader_id"(i32)

declare i32 @"kg_make_pipeline"(i32, ptr)

declare i32 @"kg_make_shader"(ptr, ptr, ptr, ptr, ptr)

declare i32 @"sapp_height"()

declare void @"sapp_request_quit"()

declare void @"sapp_run"(ptr)

declare i32 @"sapp_width"()

declare void @"sg_apply_viewport"(i32, i32, i32, i32, i1)

declare void @"sg_commit"()

declare void @"sg_end_pass"()

declare void @"sg_shutdown"()



@kira_str_0_data = private unnamed_addr constant [27 x i8] c"Kira Graphics KSL Triangle\00"

@kira_str_0 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([27 x i8], ptr @kira_str_0_data, i64 0, i64 0), i64 26 }

@kira_str_1_data = private unnamed_addr constant [64 x i8] c"Kira Graphics skipped draw because no render pipeline was bound\00"

@kira_str_1 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([64 x i8], ptr @kira_str_1_data, i64 0, i64 0), i64 63 }

@kira_str_2_data = private unnamed_addr constant [20 x i8] c"ksl-triangle-shader\00"

@kira_str_2 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([20 x i8], ptr @kira_str_2_data, i64 0, i64 0), i64 19 }

@kira_str_3_data = private unnamed_addr constant [1 x i8] c"\00"

@kira_str_3 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([1 x i8], ptr @kira_str_3_data, i64 0, i64 0), i64 0 }

@kira_str_4_data = private unnamed_addr constant [1 x i8] c"\00"

@kira_str_4 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([1 x i8], ptr @kira_str_4_data, i64 0, i64 0), i64 0 }

@kira_str_5_data = private unnamed_addr constant [42 x i8] c"generated/shaders/BasicTriangle.vert.glsl\00"

@kira_str_5 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([42 x i8], ptr @kira_str_5_data, i64 0, i64 0), i64 41 }

@kira_str_6_data = private unnamed_addr constant [42 x i8] c"generated/shaders/BasicTriangle.frag.glsl\00"

@kira_str_6 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([42 x i8], ptr @kira_str_6_data, i64 0, i64 0), i64 41 }

@kira_str_7_data = private unnamed_addr constant [22 x i8] c"ksl-triangle-pipeline\00"

@kira_str_7 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([22 x i8], ptr @kira_str_7_data, i64 0, i64 0), i64 21 }


define void @"kira_fn_0_main"() {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.GraphicsApplication, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.GraphicsApplication zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  %local1 = alloca i64
  %alloc.size.ptr.0 = getelementptr inbounds %t.GraphicsApplication, ptr null, i32 1
  %alloc.size.0 = ptrtoint ptr %alloc.size.ptr.0 to i64
  %alloc.ptr.0 = call ptr @malloc(i64 %alloc.size.0)
  store %t.GraphicsApplication zeroinitializer, ptr %alloc.ptr.0
  %r0 = ptrtoint ptr %alloc.ptr.0 to i64
  %r1 = load %kira.string, ptr @kira_str_0
  %field.base.2 = inttoptr i64 %r0 to ptr
  %field.ptr.2 = getelementptr inbounds %t.GraphicsApplication, ptr %field.base.2, i32 0, i32 0
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %store.ptr.1 = inttoptr i64 %r2 to ptr
  store %kira.string %r1, ptr %store.ptr.1
  %r3 = add i64 0, 640
  %field.base.4 = inttoptr i64 %r0 to ptr
  %field.ptr.4 = getelementptr inbounds %t.GraphicsApplication, ptr %field.base.4, i32 0, i32 1
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %store.ptr.3 = inttoptr i64 %r4 to ptr
  store i64 %r3, ptr %store.ptr.3
  %r5 = add i64 0, 480
  %field.base.6 = inttoptr i64 %r0 to ptr
  %field.ptr.6 = getelementptr inbounds %t.GraphicsApplication, ptr %field.base.6, i32 0, i32 2
  %r6 = ptrtoint ptr %field.ptr.6 to i64
  %store.ptr.5 = inttoptr i64 %r6 to ptr
  store i64 %r5, ptr %store.ptr.5
  %r7 = add i64 0, 1
  %field.base.8 = inttoptr i64 %r0 to ptr
  %field.ptr.8 = getelementptr inbounds %t.GraphicsApplication, ptr %field.base.8, i32 0, i32 3
  %r8 = ptrtoint ptr %field.ptr.8 to i64
  %store.ptr.7 = inttoptr i64 %r8 to ptr
  store i64 %r7, ptr %store.ptr.7
  %r9 = add i64 0, 1
  %field.base.10 = inttoptr i64 %r0 to ptr
  %field.ptr.10 = getelementptr inbounds %t.GraphicsApplication, ptr %field.base.10, i32 0, i32 4
  %r10 = ptrtoint ptr %field.ptr.10 to i64
  %store.ptr.9 = inttoptr i64 %r10 to ptr
  %store.rawptr.9 = inttoptr i64 %r9 to ptr
  store ptr %store.rawptr.9, ptr %store.ptr.9
  %r11 = add i64 0, 2
  %field.base.12 = inttoptr i64 %r0 to ptr
  %field.ptr.12 = getelementptr inbounds %t.GraphicsApplication, ptr %field.base.12, i32 0, i32 5
  %r12 = ptrtoint ptr %field.ptr.12 to i64
  %store.ptr.11 = inttoptr i64 %r12 to ptr
  %store.rawptr.11 = inttoptr i64 %r11 to ptr
  store ptr %store.rawptr.11, ptr %store.ptr.11
  %r13 = add i64 0, 3
  %field.base.14 = inttoptr i64 %r0 to ptr
  %field.ptr.14 = getelementptr inbounds %t.GraphicsApplication, ptr %field.base.14, i32 0, i32 6
  %r14 = ptrtoint ptr %field.ptr.14 to i64
  %store.ptr.13 = inttoptr i64 %r14 to ptr
  %store.rawptr.13 = inttoptr i64 %r13 to ptr
  store ptr %store.rawptr.13, ptr %store.ptr.13
  %r15 = load i64, ptr %local0
  %copy.dst.15 = inttoptr i64 %r15 to ptr
  %copy.src.0 = inttoptr i64 %r0 to ptr
  %copy.val.15 = load %t.GraphicsApplication, ptr %copy.src.0
  store %t.GraphicsApplication %copy.val.15, ptr %copy.dst.15
  %alloc.size.ptr.16 = getelementptr inbounds %t.TriangleState, ptr null, i32 1
  %alloc.size.16 = ptrtoint ptr %alloc.size.ptr.16 to i64
  %alloc.ptr.16 = call ptr @malloc(i64 %alloc.size.16)
  store %t.TriangleState zeroinitializer, ptr %alloc.ptr.16
  %r16 = ptrtoint ptr %alloc.ptr.16 to i64
  %alloc.size.ptr.17 = getelementptr inbounds %t.GraphicsShader, ptr null, i32 1
  %alloc.size.17 = ptrtoint ptr %alloc.size.ptr.17 to i64
  %alloc.ptr.17 = call ptr @malloc(i64 %alloc.size.17)
  store %t.GraphicsShader zeroinitializer, ptr %alloc.ptr.17
  %r17 = ptrtoint ptr %alloc.ptr.17 to i64
  %alloc.size.ptr.18 = getelementptr inbounds %t.BackendShaderHandle, ptr null, i32 1
  %alloc.size.18 = ptrtoint ptr %alloc.size.ptr.18 to i64
  %alloc.ptr.18 = call ptr @malloc(i64 %alloc.size.18)
  store %t.BackendShaderHandle zeroinitializer, ptr %alloc.ptr.18
  %r18 = ptrtoint ptr %alloc.ptr.18 to i64
  %r19 = add i64 0, 0
  %field.base.20 = inttoptr i64 %r18 to ptr
  %field.ptr.20 = getelementptr inbounds %t.BackendShaderHandle, ptr %field.base.20, i32 0, i32 0
  %r20 = ptrtoint ptr %field.ptr.20 to i64
  %store.ptr.19 = inttoptr i64 %r20 to ptr
  %store.cast.19 = trunc i64 %r19 to i32
  store i32 %store.cast.19, ptr %store.ptr.19
  %field.base.21 = inttoptr i64 %r17 to ptr
  %field.ptr.21 = getelementptr inbounds %t.GraphicsShader, ptr %field.base.21, i32 0, i32 0
  %r21 = ptrtoint ptr %field.ptr.21 to i64
  %copy.dst.21 = inttoptr i64 %r21 to ptr
  %copy.src.18 = inttoptr i64 %r18 to ptr
  %copy.val.21 = load %t.BackendShaderHandle, ptr %copy.src.18
  store %t.BackendShaderHandle %copy.val.21, ptr %copy.dst.21
  %field.base.22 = inttoptr i64 %r16 to ptr
  %field.ptr.22 = getelementptr inbounds %t.TriangleState, ptr %field.base.22, i32 0, i32 0
  %r22 = ptrtoint ptr %field.ptr.22 to i64
  %copy.dst.22 = inttoptr i64 %r22 to ptr
  %copy.src.17 = inttoptr i64 %r17 to ptr
  %copy.val.22 = load %t.GraphicsShader, ptr %copy.src.17
  store %t.GraphicsShader %copy.val.22, ptr %copy.dst.22
  %alloc.size.ptr.23 = getelementptr inbounds %t.RenderPipeline, ptr null, i32 1
  %alloc.size.23 = ptrtoint ptr %alloc.size.ptr.23 to i64
  %alloc.ptr.23 = call ptr @malloc(i64 %alloc.size.23)
  store %t.RenderPipeline zeroinitializer, ptr %alloc.ptr.23
  %r23 = ptrtoint ptr %alloc.ptr.23 to i64
  %alloc.size.ptr.24 = getelementptr inbounds %t.BackendPipelineHandle, ptr null, i32 1
  %alloc.size.24 = ptrtoint ptr %alloc.size.ptr.24 to i64
  %alloc.ptr.24 = call ptr @malloc(i64 %alloc.size.24)
  store %t.BackendPipelineHandle zeroinitializer, ptr %alloc.ptr.24
  %r24 = ptrtoint ptr %alloc.ptr.24 to i64
  %r25 = add i64 0, 0
  %field.base.26 = inttoptr i64 %r24 to ptr
  %field.ptr.26 = getelementptr inbounds %t.BackendPipelineHandle, ptr %field.base.26, i32 0, i32 0
  %r26 = ptrtoint ptr %field.ptr.26 to i64
  %store.ptr.25 = inttoptr i64 %r26 to ptr
  %store.cast.25 = trunc i64 %r25 to i32
  store i32 %store.cast.25, ptr %store.ptr.25
  %field.base.27 = inttoptr i64 %r23 to ptr
  %field.ptr.27 = getelementptr inbounds %t.RenderPipeline, ptr %field.base.27, i32 0, i32 0
  %r27 = ptrtoint ptr %field.ptr.27 to i64
  %copy.dst.27 = inttoptr i64 %r27 to ptr
  %copy.src.24 = inttoptr i64 %r24 to ptr
  %copy.val.27 = load %t.BackendPipelineHandle, ptr %copy.src.24
  store %t.BackendPipelineHandle %copy.val.27, ptr %copy.dst.27
  %field.base.28 = inttoptr i64 %r16 to ptr
  %field.ptr.28 = getelementptr inbounds %t.TriangleState, ptr %field.base.28, i32 0, i32 1
  %r28 = ptrtoint ptr %field.ptr.28 to i64
  %copy.dst.28 = inttoptr i64 %r28 to ptr
  %copy.src.23 = inttoptr i64 %r23 to ptr
  %copy.val.28 = load %t.RenderPipeline, ptr %copy.src.23
  store %t.RenderPipeline %copy.val.28, ptr %copy.dst.28
  %native.state.size.ptr.29 = getelementptr inbounds [2 x %kira.bridge.value], ptr null, i32 1
  %native.state.size.29 = ptrtoint ptr %native.state.size.ptr.29 to i64
  %native.state.box.29 = call ptr @"kira_native_state_alloc"(i64 8814238373109695030, i64 %native.state.size.29)
  %native.state.payload.29 = call ptr @"kira_native_state_payload"(ptr %native.state.box.29)
  %native.state.src.29 = inttoptr i64 %r16 to ptr
  %native.state.src.field.ptr.29.0 = getelementptr inbounds %t.TriangleState, ptr %native.state.src.29, i32 0, i32 0
  %native.state.slot.ptr.29.0 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.29, i64 0
  %native.state.pack.29.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %native.state.load.struct.29.0 = load %t.GraphicsShader, ptr %native.state.src.field.ptr.29.0
  %native.state.load.struct.size.ptr.29.0 = getelementptr inbounds %t.GraphicsShader, ptr null, i32 1
  %native.state.load.struct.size.29.0 = ptrtoint ptr %native.state.load.struct.size.ptr.29.0 to i64
  %native.state.load.struct.copy.29.0 = call ptr @malloc(i64 %native.state.load.struct.size.29.0)
  store %t.GraphicsShader %native.state.load.struct.29.0, ptr %native.state.load.struct.copy.29.0
  %native.state.load.struct.ptrint.29.0 = ptrtoint ptr %native.state.load.struct.copy.29.0 to i64
  %native.state.pack.29.0 = insertvalue %kira.bridge.value %native.state.pack.29.0.0, i64 %native.state.load.struct.ptrint.29.0, 2
  store %kira.bridge.value %native.state.pack.29.0, ptr %native.state.slot.ptr.29.0
  %native.state.src.field.ptr.29.1 = getelementptr inbounds %t.TriangleState, ptr %native.state.src.29, i32 0, i32 1
  %native.state.slot.ptr.29.1 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.29, i64 1
  %native.state.pack.29.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %native.state.load.struct.29.1 = load %t.RenderPipeline, ptr %native.state.src.field.ptr.29.1
  %native.state.load.struct.size.ptr.29.1 = getelementptr inbounds %t.RenderPipeline, ptr null, i32 1
  %native.state.load.struct.size.29.1 = ptrtoint ptr %native.state.load.struct.size.ptr.29.1 to i64
  %native.state.load.struct.copy.29.1 = call ptr @malloc(i64 %native.state.load.struct.size.29.1)
  store %t.RenderPipeline %native.state.load.struct.29.1, ptr %native.state.load.struct.copy.29.1
  %native.state.load.struct.ptrint.29.1 = ptrtoint ptr %native.state.load.struct.copy.29.1 to i64
  %native.state.pack.29.1 = insertvalue %kira.bridge.value %native.state.pack.29.1.0, i64 %native.state.load.struct.ptrint.29.1, 2
  store %kira.bridge.value %native.state.pack.29.1, ptr %native.state.slot.ptr.29.1
  %r29 = ptrtoint ptr %native.state.box.29 to i64
  store i64 %r29, ptr %local1
  %r30 = load i64, ptr %local0
  %r31 = add i64 0, 256
  call void @"kira_fn_239_GraphicsApplication.onInit"(i64 %r30, i64 %r31)
  %r32 = load i64, ptr %local0
  %r33 = add i64 0, 257
  call void @"kira_fn_240_GraphicsApplication.onFrame"(i64 %r32, i64 %r33)
  %r34 = load i64, ptr %local0
  %r35 = add i64 0, 258
  call void @"kira_fn_241_GraphicsApplication.onCleanup"(i64 %r34, i64 %r35)
  %r36 = load i64, ptr %local0
  %r37 = load i64, ptr %local1
  call void @"kira_fn_242_GraphicsApplication.run"(i64 %r36, i64 %r37)
  ret void
}

define void @"kira_fn_1_graphicsApplicationDefaultInit"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.Graphics, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.Graphics zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  store i64 %arg0, ptr %local0
  ret void
}

define void @"kira_fn_2_graphicsApplicationDefaultFrame"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.GraphicsFrame, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.GraphicsFrame zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  store i64 %arg0, ptr %local0
  ret void
}

define void @"kira_fn_3_graphicsApplicationDefaultCleanup"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.Graphics, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.Graphics zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  store i64 %arg0, ptr %local0
  ret void
}

define void @"kira_fn_239_GraphicsApplication.onInit"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.GraphicsApplication, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.GraphicsApplication zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  %local1 = alloca i64
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local1
  %r1 = load i64, ptr %local0
  %field.base.2 = inttoptr i64 %r1 to ptr
  %field.ptr.2 = getelementptr inbounds %t.GraphicsApplication, ptr %field.base.2, i32 0, i32 4
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %store.ptr.0 = inttoptr i64 %r2 to ptr
  %store.rawptr.0 = inttoptr i64 %r0 to ptr
  store ptr %store.rawptr.0, ptr %store.ptr.0
  ret void
}

define void @"kira_fn_240_GraphicsApplication.onFrame"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.GraphicsApplication, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.GraphicsApplication zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  %local1 = alloca i64
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local1
  %r1 = load i64, ptr %local0
  %field.base.2 = inttoptr i64 %r1 to ptr
  %field.ptr.2 = getelementptr inbounds %t.GraphicsApplication, ptr %field.base.2, i32 0, i32 5
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %store.ptr.0 = inttoptr i64 %r2 to ptr
  %store.rawptr.0 = inttoptr i64 %r0 to ptr
  store ptr %store.rawptr.0, ptr %store.ptr.0
  ret void
}

define void @"kira_fn_241_GraphicsApplication.onCleanup"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.GraphicsApplication, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.GraphicsApplication zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  %local1 = alloca i64
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local1
  %r1 = load i64, ptr %local0
  %field.base.2 = inttoptr i64 %r1 to ptr
  %field.ptr.2 = getelementptr inbounds %t.GraphicsApplication, ptr %field.base.2, i32 0, i32 6
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %store.ptr.0 = inttoptr i64 %r2 to ptr
  %store.rawptr.0 = inttoptr i64 %r0 to ptr
  store ptr %store.rawptr.0, ptr %store.ptr.0
  ret void
}

define void @"kira_fn_242_GraphicsApplication.run"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.GraphicsApplication, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.GraphicsApplication zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  %local1 = alloca i64
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local0
  %r1 = load i64, ptr %local1
  call void @"kira_fn_28_graphicsRuntimeRun"(i64 %r0, i64 %r1)
  ret void
}

define void @"kira_fn_5_sokolRunApplication"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.GraphicsApplication, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.GraphicsApplication zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  %local1 = alloca i64
  %local2 = alloca i64
  %local.size.ptr.2 = getelementptr inbounds %t.sapp_desc, ptr null, i32 1
  %local.size.2 = ptrtoint ptr %local.size.ptr.2 to i64
  %local.heap.2 = call ptr @malloc(i64 %local.size.2)
  store %t.sapp_desc zeroinitializer, ptr %local.heap.2
  %local.heap.int.2 = ptrtoint ptr %local.heap.2 to i64
  store i64 %local.heap.int.2, ptr %local2
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %alloc.size.ptr.0 = getelementptr inbounds %t.sapp_desc, ptr null, i32 1
  %alloc.size.0 = ptrtoint ptr %alloc.size.ptr.0 to i64
  %alloc.ptr.0 = call ptr @malloc(i64 %alloc.size.0)
  store %t.sapp_desc zeroinitializer, ptr %alloc.ptr.0
  %r0 = ptrtoint ptr %alloc.ptr.0 to i64
  %r1 = ptrtoint ptr @"kira_fn_6_kiraGraphicsSokolInit" to i64
  %field.base.2 = inttoptr i64 %r0 to ptr
  %field.ptr.2 = getelementptr inbounds %t.sapp_desc, ptr %field.base.2, i32 0, i32 5
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %store.ptr.1 = inttoptr i64 %r2 to ptr
  %store.rawptr.1 = inttoptr i64 %r1 to ptr
  store ptr %store.rawptr.1, ptr %store.ptr.1
  %r3 = ptrtoint ptr @"kira_fn_7_kiraGraphicsSokolFrame" to i64
  %field.base.4 = inttoptr i64 %r0 to ptr
  %field.ptr.4 = getelementptr inbounds %t.sapp_desc, ptr %field.base.4, i32 0, i32 6
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %store.ptr.3 = inttoptr i64 %r4 to ptr
  %store.rawptr.3 = inttoptr i64 %r3 to ptr
  store ptr %store.rawptr.3, ptr %store.ptr.3
  %r5 = ptrtoint ptr @"kira_fn_8_kiraGraphicsSokolCleanup" to i64
  %field.base.6 = inttoptr i64 %r0 to ptr
  %field.ptr.6 = getelementptr inbounds %t.sapp_desc, ptr %field.base.6, i32 0, i32 7
  %r6 = ptrtoint ptr %field.ptr.6 to i64
  %store.ptr.5 = inttoptr i64 %r6 to ptr
  %store.rawptr.5 = inttoptr i64 %r5 to ptr
  store ptr %store.rawptr.5, ptr %store.ptr.5
  %r7 = load i64, ptr %local1
  %field.base.8 = inttoptr i64 %r0 to ptr
  %field.ptr.8 = getelementptr inbounds %t.sapp_desc, ptr %field.base.8, i32 0, i32 4
  %r8 = ptrtoint ptr %field.ptr.8 to i64
  %store.ptr.7 = inttoptr i64 %r8 to ptr
  %store.rawptr.7 = inttoptr i64 %r7 to ptr
  store ptr %store.rawptr.7, ptr %store.ptr.7
  %r9 = load i64, ptr %local0
  %field.base.10 = inttoptr i64 %r9 to ptr
  %field.ptr.10 = getelementptr inbounds %t.GraphicsApplication, ptr %field.base.10, i32 0, i32 1
  %r10 = ptrtoint ptr %field.ptr.10 to i64
  %load.ptr.11 = inttoptr i64 %r10 to ptr
  %load.raw.11 = load i64, ptr %load.ptr.11
  %r11 = load i64, ptr %load.ptr.11
  %field.base.12 = inttoptr i64 %r0 to ptr
  %field.ptr.12 = getelementptr inbounds %t.sapp_desc, ptr %field.base.12, i32 0, i32 9
  %r12 = ptrtoint ptr %field.ptr.12 to i64
  %store.ptr.11 = inttoptr i64 %r12 to ptr
  %store.cast.11 = trunc i64 %r11 to i32
  store i32 %store.cast.11, ptr %store.ptr.11
  %r13 = load i64, ptr %local0
  %field.base.14 = inttoptr i64 %r13 to ptr
  %field.ptr.14 = getelementptr inbounds %t.GraphicsApplication, ptr %field.base.14, i32 0, i32 2
  %r14 = ptrtoint ptr %field.ptr.14 to i64
  %load.ptr.15 = inttoptr i64 %r14 to ptr
  %load.raw.15 = load i64, ptr %load.ptr.15
  %r15 = load i64, ptr %load.ptr.15
  %field.base.16 = inttoptr i64 %r0 to ptr
  %field.ptr.16 = getelementptr inbounds %t.sapp_desc, ptr %field.base.16, i32 0, i32 10
  %r16 = ptrtoint ptr %field.ptr.16 to i64
  %store.ptr.15 = inttoptr i64 %r16 to ptr
  %store.cast.15 = trunc i64 %r15 to i32
  store i32 %store.cast.15, ptr %store.ptr.15
  %r17 = load i64, ptr %local0
  %field.base.18 = inttoptr i64 %r17 to ptr
  %field.ptr.18 = getelementptr inbounds %t.GraphicsApplication, ptr %field.base.18, i32 0, i32 3
  %r18 = ptrtoint ptr %field.ptr.18 to i64
  %load.ptr.19 = inttoptr i64 %r18 to ptr
  %load.raw.19 = load i64, ptr %load.ptr.19
  %r19 = load i64, ptr %load.ptr.19
  %field.base.20 = inttoptr i64 %r0 to ptr
  %field.ptr.20 = getelementptr inbounds %t.sapp_desc, ptr %field.base.20, i32 0, i32 11
  %r20 = ptrtoint ptr %field.ptr.20 to i64
  %store.ptr.19 = inttoptr i64 %r20 to ptr
  %store.cast.19 = trunc i64 %r19 to i32
  store i32 %store.cast.19, ptr %store.ptr.19
  %r21 = load i64, ptr %local0
  %field.base.22 = inttoptr i64 %r21 to ptr
  %field.ptr.22 = getelementptr inbounds %t.GraphicsApplication, ptr %field.base.22, i32 0, i32 0
  %r22 = ptrtoint ptr %field.ptr.22 to i64
  %load.ptr.23 = inttoptr i64 %r22 to ptr
  %r23 = load %kira.string, ptr %load.ptr.23
  %field.base.24 = inttoptr i64 %r0 to ptr
  %field.ptr.24 = getelementptr inbounds %t.sapp_desc, ptr %field.base.24, i32 0, i32 16
  %r24 = ptrtoint ptr %field.ptr.24 to i64
  %store.ptr.23 = inttoptr i64 %r24 to ptr
  %store.cstr.23 = extractvalue %kira.string %r23, 0
  store ptr %store.cstr.23, ptr %store.ptr.23
  %r25 = load i64, ptr %local2
  %copy.dst.25 = inttoptr i64 %r25 to ptr
  %copy.src.0 = inttoptr i64 %r0 to ptr
  %copy.val.25 = load %t.sapp_desc, ptr %copy.src.0
  store %t.sapp_desc %copy.val.25, ptr %copy.dst.25
  %r26 = load i64, ptr %local2
  %call.arg.70.0 = inttoptr i64 %r26 to ptr
  call void @"sapp_run"(ptr %call.arg.70.0)
  ret void
}

define void @"kira_fn_6_kiraGraphicsSokolInit"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local1 = alloca i64
  %local2 = alloca i64
  %local.size.ptr.2 = getelementptr inbounds %t.GraphicsApplication, ptr null, i32 1
  %local.size.2 = ptrtoint ptr %local.size.ptr.2 to i64
  %local.heap.2 = call ptr @malloc(i64 %local.size.2)
  store %t.GraphicsApplication zeroinitializer, ptr %local.heap.2
  %local.heap.int.2 = ptrtoint ptr %local.heap.2 to i64
  store i64 %local.heap.int.2, ptr %local2
  %local3 = alloca i64
  %local4 = alloca i64
  %local.size.ptr.4 = getelementptr inbounds %t.Graphics, ptr null, i32 1
  %local.size.4 = ptrtoint ptr %local.size.ptr.4 to i64
  %local.heap.4 = call ptr @malloc(i64 %local.size.4)
  store %t.Graphics zeroinitializer, ptr %local.heap.4
  %local.heap.int.4 = ptrtoint ptr %local.heap.4 to i64
  store i64 %local.heap.int.4, ptr %local4
  store i64 %arg0, ptr %local0
  call void @"kg_setup"()
  %r0 = load i64, ptr %local0
  %native.recover.state.1 = inttoptr i64 %r0 to ptr
  %native.recover.payload.1 = call ptr @"kira_native_state_recover"(ptr %native.recover.state.1, i64 7551196454525180470)
  %r1 = ptrtoint ptr %native.recover.payload.1 to i64
  store i64 %r1, ptr %local1
  %r2 = load i64, ptr %local1
  %native.state.get.ptr.3 = inttoptr i64 %r2 to ptr
  %native.state.get.slot.3 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.3, i64 0
  %native.state.get.val.0 = load %kira.bridge.value, ptr %native.state.get.slot.3
  %r3 = extractvalue %kira.bridge.value %native.state.get.val.0, 2
  %r4 = load i64, ptr %local2
  %copy.dst.4 = inttoptr i64 %r4 to ptr
  %copy.src.3 = inttoptr i64 %r3 to ptr
  %copy.val.4 = load %t.GraphicsApplication, ptr %copy.src.3
  store %t.GraphicsApplication %copy.val.4, ptr %copy.dst.4
  %r5 = load i64, ptr %local2
  %field.base.6 = inttoptr i64 %r5 to ptr
  %field.ptr.6 = getelementptr inbounds %t.GraphicsApplication, ptr %field.base.6, i32 0, i32 4
  %r6 = ptrtoint ptr %field.ptr.6 to i64
  %load.ptr.7 = inttoptr i64 %r6 to ptr
  %load.rawptr.7 = load ptr, ptr %load.ptr.7
  %r7 = ptrtoint ptr %load.rawptr.7 to i64
  store i64 %r7, ptr %local3
  %alloc.size.ptr.8 = getelementptr inbounds %t.Graphics, ptr null, i32 1
  %alloc.size.8 = ptrtoint ptr %alloc.size.ptr.8 to i64
  %alloc.ptr.8 = call ptr @malloc(i64 %alloc.size.8)
  store %t.Graphics zeroinitializer, ptr %alloc.ptr.8
  %r8 = ptrtoint ptr %alloc.ptr.8 to i64
  %r9 = load i64, ptr %local1
  %native.state.get.ptr.10 = inttoptr i64 %r9 to ptr
  %native.state.get.slot.10 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.10, i64 1
  %native.state.get.val.1 = load %kira.bridge.value, ptr %native.state.get.slot.10
  %r10 = extractvalue %kira.bridge.value %native.state.get.val.1, 2
  %field.base.11 = inttoptr i64 %r8 to ptr
  %field.ptr.11 = getelementptr inbounds %t.Graphics, ptr %field.base.11, i32 0, i32 0
  %r11 = ptrtoint ptr %field.ptr.11 to i64
  %store.ptr.10 = inttoptr i64 %r11 to ptr
  %store.rawptr.10 = inttoptr i64 %r10 to ptr
  store ptr %store.rawptr.10, ptr %store.ptr.10
  %r12 = load i64, ptr %local4
  %copy.dst.12 = inttoptr i64 %r12 to ptr
  %copy.src.8 = inttoptr i64 %r8 to ptr
  %copy.val.12 = load %t.Graphics, ptr %copy.src.8
  store %t.Graphics %copy.val.12, ptr %copy.dst.12
  %r13 = load i64, ptr %local3
  %r14 = load i64, ptr %local4
  call void @"kira_callable_dispatch_739b41e868b5845f"(i64 %r13, i64 %r14)
  ret void
}

define void @"kira_fn_7_kiraGraphicsSokolFrame"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local1 = alloca i64
  %local2 = alloca i64
  %local.size.ptr.2 = getelementptr inbounds %t.GraphicsApplication, ptr null, i32 1
  %local.size.2 = ptrtoint ptr %local.size.ptr.2 to i64
  %local.heap.2 = call ptr @malloc(i64 %local.size.2)
  store %t.GraphicsApplication zeroinitializer, ptr %local.heap.2
  %local.heap.int.2 = ptrtoint ptr %local.heap.2 to i64
  store i64 %local.heap.int.2, ptr %local2
  %local3 = alloca i64
  %local4 = alloca i64
  %local.size.ptr.4 = getelementptr inbounds %t.Graphics, ptr null, i32 1
  %local.size.4 = ptrtoint ptr %local.size.ptr.4 to i64
  %local.heap.4 = call ptr @malloc(i64 %local.size.4)
  store %t.Graphics zeroinitializer, ptr %local.heap.4
  %local.heap.int.4 = ptrtoint ptr %local.heap.4 to i64
  store i64 %local.heap.int.4, ptr %local4
  %local5 = alloca i64
  %local.size.ptr.5 = getelementptr inbounds %t.GraphicsFrame, ptr null, i32 1
  %local.size.5 = ptrtoint ptr %local.size.ptr.5 to i64
  %local.heap.5 = call ptr @malloc(i64 %local.size.5)
  store %t.GraphicsFrame zeroinitializer, ptr %local.heap.5
  %local.heap.int.5 = ptrtoint ptr %local.heap.5 to i64
  store i64 %local.heap.int.5, ptr %local5
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %native.recover.state.1 = inttoptr i64 %r0 to ptr
  %native.recover.payload.1 = call ptr @"kira_native_state_recover"(ptr %native.recover.state.1, i64 7551196454525180470)
  %r1 = ptrtoint ptr %native.recover.payload.1 to i64
  store i64 %r1, ptr %local1
  %r2 = load i64, ptr %local1
  %native.state.get.ptr.3 = inttoptr i64 %r2 to ptr
  %native.state.get.slot.3 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.3, i64 0
  %native.state.get.val.0 = load %kira.bridge.value, ptr %native.state.get.slot.3
  %r3 = extractvalue %kira.bridge.value %native.state.get.val.0, 2
  %r4 = load i64, ptr %local2
  %copy.dst.4 = inttoptr i64 %r4 to ptr
  %copy.src.3 = inttoptr i64 %r3 to ptr
  %copy.val.4 = load %t.GraphicsApplication, ptr %copy.src.3
  store %t.GraphicsApplication %copy.val.4, ptr %copy.dst.4
  %r5 = load i64, ptr %local2
  %field.base.6 = inttoptr i64 %r5 to ptr
  %field.ptr.6 = getelementptr inbounds %t.GraphicsApplication, ptr %field.base.6, i32 0, i32 5
  %r6 = ptrtoint ptr %field.ptr.6 to i64
  %load.ptr.7 = inttoptr i64 %r6 to ptr
  %load.rawptr.7 = load ptr, ptr %load.ptr.7
  %r7 = ptrtoint ptr %load.rawptr.7 to i64
  store i64 %r7, ptr %local3
  %alloc.size.ptr.8 = getelementptr inbounds %t.Graphics, ptr null, i32 1
  %alloc.size.8 = ptrtoint ptr %alloc.size.ptr.8 to i64
  %alloc.ptr.8 = call ptr @malloc(i64 %alloc.size.8)
  store %t.Graphics zeroinitializer, ptr %alloc.ptr.8
  %r8 = ptrtoint ptr %alloc.ptr.8 to i64
  %r9 = load i64, ptr %local1
  %native.state.get.ptr.10 = inttoptr i64 %r9 to ptr
  %native.state.get.slot.10 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.10, i64 1
  %native.state.get.val.1 = load %kira.bridge.value, ptr %native.state.get.slot.10
  %r10 = extractvalue %kira.bridge.value %native.state.get.val.1, 2
  %field.base.11 = inttoptr i64 %r8 to ptr
  %field.ptr.11 = getelementptr inbounds %t.Graphics, ptr %field.base.11, i32 0, i32 0
  %r11 = ptrtoint ptr %field.ptr.11 to i64
  %store.ptr.10 = inttoptr i64 %r11 to ptr
  %store.rawptr.10 = inttoptr i64 %r10 to ptr
  store ptr %store.rawptr.10, ptr %store.ptr.10
  %r12 = load i64, ptr %local4
  %copy.dst.12 = inttoptr i64 %r12 to ptr
  %copy.src.8 = inttoptr i64 %r8 to ptr
  %copy.val.12 = load %t.Graphics, ptr %copy.src.8
  store %t.Graphics %copy.val.12, ptr %copy.dst.12
  %r13 = load i64, ptr %local4
  %r14 = call i64 @"kira_fn_253_Graphics.frame"(i64 %r13)
  %r15 = load i64, ptr %local5
  %copy.dst.15 = inttoptr i64 %r15 to ptr
  %copy.src.14 = inttoptr i64 %r14 to ptr
  %copy.val.15 = load %t.GraphicsFrame, ptr %copy.src.14
  store %t.GraphicsFrame %copy.val.15, ptr %copy.dst.15
  %r16 = load i64, ptr %local1
  %native.state.get.ptr.17 = inttoptr i64 %r16 to ptr
  %native.state.get.slot.17 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.17, i64 2
  %native.state.get.val.2 = load %kira.bridge.value, ptr %native.state.get.slot.17
  %r17 = extractvalue %kira.bridge.value %native.state.get.val.2, 2
  %r18 = add i64 0, 1
  %r19 = add i64 %r17, %r18
  %r20 = load i64, ptr %local1
  %native.state.set.ptr.19 = inttoptr i64 %r20 to ptr
  %native.state.set.slot.19 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.19, i64 2
  %native.state.set.pack.3.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.set.pack.3 = insertvalue %kira.bridge.value %native.state.set.pack.3.0, i64 %r19, 2
  store %kira.bridge.value %native.state.set.pack.3, ptr %native.state.set.slot.19
  %r21 = load i64, ptr %local3
  %r22 = load i64, ptr %local5
  call void @"kira_callable_dispatch_83c614efdab68a73"(i64 %r21, i64 %r22)
  %r23 = load i64, ptr %local5
  call void @"kira_fn_27_graphicsSubmitFrame"(i64 %r23)
  ret void
}

define void @"kira_fn_8_kiraGraphicsSokolCleanup"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local1 = alloca i64
  %local2 = alloca i64
  %local.size.ptr.2 = getelementptr inbounds %t.GraphicsApplication, ptr null, i32 1
  %local.size.2 = ptrtoint ptr %local.size.ptr.2 to i64
  %local.heap.2 = call ptr @malloc(i64 %local.size.2)
  store %t.GraphicsApplication zeroinitializer, ptr %local.heap.2
  %local.heap.int.2 = ptrtoint ptr %local.heap.2 to i64
  store i64 %local.heap.int.2, ptr %local2
  %local3 = alloca i64
  %local4 = alloca i64
  %local.size.ptr.4 = getelementptr inbounds %t.Graphics, ptr null, i32 1
  %local.size.4 = ptrtoint ptr %local.size.ptr.4 to i64
  %local.heap.4 = call ptr @malloc(i64 %local.size.4)
  store %t.Graphics zeroinitializer, ptr %local.heap.4
  %local.heap.int.4 = ptrtoint ptr %local.heap.4 to i64
  store i64 %local.heap.int.4, ptr %local4
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %native.recover.state.1 = inttoptr i64 %r0 to ptr
  %native.recover.payload.1 = call ptr @"kira_native_state_recover"(ptr %native.recover.state.1, i64 7551196454525180470)
  %r1 = ptrtoint ptr %native.recover.payload.1 to i64
  store i64 %r1, ptr %local1
  %r2 = load i64, ptr %local1
  %native.state.get.ptr.3 = inttoptr i64 %r2 to ptr
  %native.state.get.slot.3 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.3, i64 0
  %native.state.get.val.0 = load %kira.bridge.value, ptr %native.state.get.slot.3
  %r3 = extractvalue %kira.bridge.value %native.state.get.val.0, 2
  %r4 = load i64, ptr %local2
  %copy.dst.4 = inttoptr i64 %r4 to ptr
  %copy.src.3 = inttoptr i64 %r3 to ptr
  %copy.val.4 = load %t.GraphicsApplication, ptr %copy.src.3
  store %t.GraphicsApplication %copy.val.4, ptr %copy.dst.4
  %r5 = load i64, ptr %local2
  %field.base.6 = inttoptr i64 %r5 to ptr
  %field.ptr.6 = getelementptr inbounds %t.GraphicsApplication, ptr %field.base.6, i32 0, i32 6
  %r6 = ptrtoint ptr %field.ptr.6 to i64
  %load.ptr.7 = inttoptr i64 %r6 to ptr
  %load.rawptr.7 = load ptr, ptr %load.ptr.7
  %r7 = ptrtoint ptr %load.rawptr.7 to i64
  store i64 %r7, ptr %local3
  %alloc.size.ptr.8 = getelementptr inbounds %t.Graphics, ptr null, i32 1
  %alloc.size.8 = ptrtoint ptr %alloc.size.ptr.8 to i64
  %alloc.ptr.8 = call ptr @malloc(i64 %alloc.size.8)
  store %t.Graphics zeroinitializer, ptr %alloc.ptr.8
  %r8 = ptrtoint ptr %alloc.ptr.8 to i64
  %r9 = load i64, ptr %local1
  %native.state.get.ptr.10 = inttoptr i64 %r9 to ptr
  %native.state.get.slot.10 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.10, i64 1
  %native.state.get.val.1 = load %kira.bridge.value, ptr %native.state.get.slot.10
  %r10 = extractvalue %kira.bridge.value %native.state.get.val.1, 2
  %field.base.11 = inttoptr i64 %r8 to ptr
  %field.ptr.11 = getelementptr inbounds %t.Graphics, ptr %field.base.11, i32 0, i32 0
  %r11 = ptrtoint ptr %field.ptr.11 to i64
  %store.ptr.10 = inttoptr i64 %r11 to ptr
  %store.rawptr.10 = inttoptr i64 %r10 to ptr
  store ptr %store.rawptr.10, ptr %store.ptr.10
  %r12 = load i64, ptr %local4
  %copy.dst.12 = inttoptr i64 %r12 to ptr
  %copy.src.8 = inttoptr i64 %r8 to ptr
  %copy.val.12 = load %t.Graphics, ptr %copy.src.8
  store %t.Graphics %copy.val.12, ptr %copy.dst.12
  %r13 = load i64, ptr %local3
  %r14 = load i64, ptr %local4
  call void @"kira_callable_dispatch_739b41e868b5845f"(i64 %r13, i64 %r14)
  call void @"kg_destroy_default_resources"()
  call void @"sg_shutdown"()
  ret void
}

define void @"kira_fn_21_sokolSubmitFrame"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.GraphicsFrame, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.GraphicsFrame zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.1, i32 0, i32 2
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.raw.2 = load i8, ptr %load.ptr.2
  %r2 = trunc i8 %load.raw.2 to i1
  %r3 = xor i1 %r2, true
  br i1 %r3, label %kira_label_0, label %kira_label_1
kira_label_0:
  ret void
kira_label_1:
  %r4 = load i64, ptr %local0
  %field.base.5 = inttoptr i64 %r4 to ptr
  %field.ptr.5 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.5, i32 0, i32 0
  %r5 = ptrtoint ptr %field.ptr.5 to i64
  %field.base.6 = inttoptr i64 %r5 to ptr
  %field.ptr.6 = getelementptr inbounds %t.Color, ptr %field.base.6, i32 0, i32 0
  %r6 = ptrtoint ptr %field.ptr.6 to i64
  %load.ptr.7 = inttoptr i64 %r6 to ptr
  %load.raw.float.7 = load double, ptr %load.ptr.7
  %r7 = fadd double %load.raw.float.7, 0.0
  %r8 = load i64, ptr %local0
  %field.base.9 = inttoptr i64 %r8 to ptr
  %field.ptr.9 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.9, i32 0, i32 0
  %r9 = ptrtoint ptr %field.ptr.9 to i64
  %field.base.10 = inttoptr i64 %r9 to ptr
  %field.ptr.10 = getelementptr inbounds %t.Color, ptr %field.base.10, i32 0, i32 1
  %r10 = ptrtoint ptr %field.ptr.10 to i64
  %load.ptr.11 = inttoptr i64 %r10 to ptr
  %load.raw.float.11 = load double, ptr %load.ptr.11
  %r11 = fadd double %load.raw.float.11, 0.0
  %r12 = load i64, ptr %local0
  %field.base.13 = inttoptr i64 %r12 to ptr
  %field.ptr.13 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.13, i32 0, i32 0
  %r13 = ptrtoint ptr %field.ptr.13 to i64
  %field.base.14 = inttoptr i64 %r13 to ptr
  %field.ptr.14 = getelementptr inbounds %t.Color, ptr %field.base.14, i32 0, i32 2
  %r14 = ptrtoint ptr %field.ptr.14 to i64
  %load.ptr.15 = inttoptr i64 %r14 to ptr
  %load.raw.float.15 = load double, ptr %load.ptr.15
  %r15 = fadd double %load.raw.float.15, 0.0
  %r16 = load i64, ptr %local0
  %field.base.17 = inttoptr i64 %r16 to ptr
  %field.ptr.17 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.17, i32 0, i32 0
  %r17 = ptrtoint ptr %field.ptr.17 to i64
  %field.base.18 = inttoptr i64 %r17 to ptr
  %field.ptr.18 = getelementptr inbounds %t.Color, ptr %field.base.18, i32 0, i32 3
  %r18 = ptrtoint ptr %field.ptr.18 to i64
  %load.ptr.19 = inttoptr i64 %r18 to ptr
  %load.raw.float.19 = load double, ptr %load.ptr.19
  %r19 = fadd double %load.raw.float.19, 0.0
  %call.arg.12.0 = fptrunc double %r7 to float
  %call.arg.12.1 = fptrunc double %r11 to float
  %call.arg.12.2 = fptrunc double %r15 to float
  %call.arg.12.3 = fptrunc double %r19 to float
  call void @"kg_begin_swapchain_pass"(float %call.arg.12.0, float %call.arg.12.1, float %call.arg.12.2, float %call.arg.12.3)
  %r20 = add i64 0, 0
  %r21 = add i64 0, 0
  %call.int.22 = call i32 @"sapp_width"()
  %r22.sext = sext i32 %call.int.22 to i64
  %r22 = add i64 %r22.sext, 0
  %call.int.23 = call i32 @"sapp_height"()
  %r23.sext = sext i32 %call.int.23 to i64
  %r23 = add i64 %r23.sext, 0
  %r24 = add i1 0, 1
  %call.arg.99.0 = trunc i64 %r20 to i32
  %call.arg.99.1 = trunc i64 %r21 to i32
  %call.arg.99.2 = trunc i64 %r22 to i32
  %call.arg.99.3 = trunc i64 %r23 to i32
  call void @"sg_apply_viewport"(i32 %call.arg.99.0, i32 %call.arg.99.1, i32 %call.arg.99.2, i32 %call.arg.99.3, i1 %r24)
  %r25 = load i64, ptr %local0
  %field.base.26 = inttoptr i64 %r25 to ptr
  %field.ptr.26 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.26, i32 0, i32 1
  %r26 = ptrtoint ptr %field.ptr.26 to i64
  %field.base.27 = inttoptr i64 %r26 to ptr
  %field.ptr.27 = getelementptr inbounds %t.RenderEncoder, ptr %field.base.27, i32 0, i32 1
  %r27 = ptrtoint ptr %field.ptr.27 to i64
  %load.ptr.28 = inttoptr i64 %r27 to ptr
  %load.raw.28 = load i64, ptr %load.ptr.28
  %r28 = load i64, ptr %load.ptr.28
  %r29 = add i64 0, 0
  %r30 = icmp eq i64 %r28, %r29
  br i1 %r30, label %kira_label_2, label %kira_label_3
kira_label_2:
  call void @"sg_end_pass"()
  call void @"sg_commit"()
  %r31 = load i64, ptr %local0
  %field.base.32 = inttoptr i64 %r31 to ptr
  %field.ptr.32 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.32, i32 0, i32 4
  %r32 = ptrtoint ptr %field.ptr.32 to i64
  %load.ptr.33 = inttoptr i64 %r32 to ptr
  %load.raw.33 = load i8, ptr %load.ptr.33
  %r33 = trunc i8 %load.raw.33 to i1
  br i1 %r33, label %kira_label_4, label %kira_label_5
kira_label_4:
  call void @"sapp_request_quit"()
  br label %kira_label_5
kira_label_5:
  ret void
kira_label_3:
  %r34 = load i64, ptr %local0
  %field.base.35 = inttoptr i64 %r34 to ptr
  %field.ptr.35 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.35, i32 0, i32 1
  %r35 = ptrtoint ptr %field.ptr.35 to i64
  %field.base.36 = inttoptr i64 %r35 to ptr
  %field.ptr.36 = getelementptr inbounds %t.RenderEncoder, ptr %field.base.36, i32 0, i32 0
  %r36 = ptrtoint ptr %field.ptr.36 to i64
  %r37 = call i1 @"kira_fn_29_graphicsValidatePipeline"(i64 %r36)
  br i1 %r37, label %kira_label_6, label %kira_label_7
kira_label_6:
  %r38 = load i64, ptr %local0
  %field.base.39 = inttoptr i64 %r38 to ptr
  %field.ptr.39 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.39, i32 0, i32 1
  %r39 = ptrtoint ptr %field.ptr.39 to i64
  %field.base.40 = inttoptr i64 %r39 to ptr
  %field.ptr.40 = getelementptr inbounds %t.RenderEncoder, ptr %field.base.40, i32 0, i32 0
  %r40 = ptrtoint ptr %field.ptr.40 to i64
  %field.base.41 = inttoptr i64 %r40 to ptr
  %field.ptr.41 = getelementptr inbounds %t.RenderPipeline, ptr %field.base.41, i32 0, i32 0
  %r41 = ptrtoint ptr %field.ptr.41 to i64
  %field.base.42 = inttoptr i64 %r41 to ptr
  %field.ptr.42 = getelementptr inbounds %t.BackendPipelineHandle, ptr %field.base.42, i32 0, i32 0
  %r42 = ptrtoint ptr %field.ptr.42 to i64
  %load.ptr.43 = inttoptr i64 %r42 to ptr
  %load.raw.43 = load i32, ptr %load.ptr.43
  %r43 = sext i32 %load.raw.43 to i64
  %r44 = load i64, ptr %local0
  %field.base.45 = inttoptr i64 %r44 to ptr
  %field.ptr.45 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.45, i32 0, i32 1
  %r45 = ptrtoint ptr %field.ptr.45 to i64
  %field.base.46 = inttoptr i64 %r45 to ptr
  %field.ptr.46 = getelementptr inbounds %t.RenderEncoder, ptr %field.base.46, i32 0, i32 1
  %r46 = ptrtoint ptr %field.ptr.46 to i64
  %load.ptr.47 = inttoptr i64 %r46 to ptr
  %load.raw.47 = load i64, ptr %load.ptr.47
  %r47 = load i64, ptr %load.ptr.47
  %r48 = load i64, ptr %local0
  %field.base.49 = inttoptr i64 %r48 to ptr
  %field.ptr.49 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.49, i32 0, i32 1
  %r49 = ptrtoint ptr %field.ptr.49 to i64
  %field.base.50 = inttoptr i64 %r49 to ptr
  %field.ptr.50 = getelementptr inbounds %t.RenderEncoder, ptr %field.base.50, i32 0, i32 2
  %r50 = ptrtoint ptr %field.ptr.50 to i64
  %load.ptr.51 = inttoptr i64 %r50 to ptr
  %load.raw.51 = load i64, ptr %load.ptr.51
  %r51 = load i64, ptr %load.ptr.51
  %call.arg.11.0 = trunc i64 %r43 to i32
  %call.arg.11.1 = trunc i64 %r47 to i32
  %call.arg.11.2 = trunc i64 %r51 to i32
  call void @"kg_apply_pipeline_and_draw"(i32 %call.arg.11.0, i32 %call.arg.11.1, i32 %call.arg.11.2)
  br label %kira_label_8
kira_label_7:
  %r52 = load %kira.string, ptr @kira_str_1
  call void @"kira_fn_26_graphicsDiagnostic"(%kira.string %r52)
  br label %kira_label_8
kira_label_8:
  call void @"sg_end_pass"()
  call void @"sg_commit"()
  %r53 = load i64, ptr %local0
  %field.base.54 = inttoptr i64 %r53 to ptr
  %field.ptr.54 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.54, i32 0, i32 4
  %r54 = ptrtoint ptr %field.ptr.54 to i64
  %load.ptr.55 = inttoptr i64 %r54 to ptr
  %load.raw.55 = load i8, ptr %load.ptr.55
  %r55 = trunc i8 %load.raw.55 to i1
  br i1 %r55, label %kira_label_9, label %kira_label_10
kira_label_9:
  call void @"sapp_request_quit"()
  br label %kira_label_10
kira_label_10:
  ret void
}

define i64 @"kira_fn_22_sokolCreateRenderPipelineId"(%kira.string %arg0, i64 %arg1) {
entry:
  %local0 = alloca %kira.string
  %local1 = alloca i64
  store %kira.string %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local1
  %r1 = load %kira.string, ptr %local0
  %call.arg.16.0 = trunc i64 %r0 to i32
  %call.arg.16.1 = extractvalue %kira.string %r1, 0
  %call.int.2 = call i32 @"kg_make_pipeline"(i32 %call.arg.16.0, ptr %call.arg.16.1)
  %r2.sext = sext i32 %call.int.2 to i64
  %r2 = add i64 %r2.sext, 0
  ret i64 %r2
}

define void @"kira_fn_23_sokolDestroyRenderPipelineId"(i64 %arg0) {
entry:
  %local0 = alloca i64
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %r1 = add i64 0, 0
  %r2 = icmp ne i64 %r0, %r1
  br i1 %r2, label %kira_label_0, label %kira_label_1
kira_label_0:
  %r3 = load i64, ptr %local0
  %call.arg.13.0 = trunc i64 %r3 to i32
  call void @"kg_destroy_pipeline_id"(i32 %call.arg.13.0)
  br label %kira_label_1
kira_label_1:
  ret void
}

define i64 @"kira_fn_24_sokolCreateShaderId"(%kira.string %arg0, %kira.string %arg1, %kira.string %arg2, %kira.string %arg3, %kira.string %arg4) {
entry:
  %local0 = alloca %kira.string
  %local1 = alloca %kira.string
  %local2 = alloca %kira.string
  %local3 = alloca %kira.string
  %local4 = alloca %kira.string
  store %kira.string %arg0, ptr %local0
  store %kira.string %arg1, ptr %local1
  store %kira.string %arg2, ptr %local2
  store %kira.string %arg3, ptr %local3
  store %kira.string %arg4, ptr %local4
  %r0 = load %kira.string, ptr %local0
  %r1 = load %kira.string, ptr %local1
  %r2 = load %kira.string, ptr %local2
  %r3 = load %kira.string, ptr %local3
  %r4 = load %kira.string, ptr %local4
  %call.arg.17.0 = extractvalue %kira.string %r0, 0
  %call.arg.17.1 = extractvalue %kira.string %r1, 0
  %call.arg.17.2 = extractvalue %kira.string %r2, 0
  %call.arg.17.3 = extractvalue %kira.string %r3, 0
  %call.arg.17.4 = extractvalue %kira.string %r4, 0
  %call.int.5 = call i32 @"kg_make_shader"(ptr %call.arg.17.0, ptr %call.arg.17.1, ptr %call.arg.17.2, ptr %call.arg.17.3, ptr %call.arg.17.4)
  %r5.sext = sext i32 %call.int.5 to i64
  %r5 = add i64 %r5.sext, 0
  ret i64 %r5
}

define void @"kira_fn_25_sokolDestroyShaderId"(i64 %arg0) {
entry:
  %local0 = alloca i64
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %r1 = add i64 0, 0
  %r2 = icmp ne i64 %r0, %r1
  br i1 %r2, label %kira_label_0, label %kira_label_1
kira_label_0:
  %r3 = load i64, ptr %local0
  %call.arg.15.0 = trunc i64 %r3 to i32
  call void @"kg_destroy_shader_id"(i32 %call.arg.15.0)
  br label %kira_label_1
kira_label_1:
  ret void
}

define void @"kira_fn_26_graphicsDiagnostic"(%kira.string %arg0) {
entry:
  %local0 = alloca %kira.string
  store %kira.string %arg0, ptr %local0
  %r0 = load %kira.string, ptr %local0
  %print.str.ptr.0 = extractvalue %kira.string %r0, 0
  %print.str.len.0 = extractvalue %kira.string %r0, 1
  call void @"kira_native_write_string"(ptr %print.str.ptr.0, i64 %print.str.len.0)
  call void @"kira_native_write_newline"()
  ret void
}

define void @"kira_fn_27_graphicsSubmitFrame"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.GraphicsFrame, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.GraphicsFrame zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  call void @"kira_fn_21_sokolSubmitFrame"(i64 %r0)
  ret void
}

define void @"kira_fn_28_graphicsRuntimeRun"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.GraphicsApplication, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.GraphicsApplication zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  %local1 = alloca i64
  %local2 = alloca i64
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %alloc.size.ptr.0 = getelementptr inbounds %t.GraphicsAppRuntimeState, ptr null, i32 1
  %alloc.size.0 = ptrtoint ptr %alloc.size.ptr.0 to i64
  %alloc.ptr.0 = call ptr @malloc(i64 %alloc.size.0)
  store %t.GraphicsAppRuntimeState zeroinitializer, ptr %alloc.ptr.0
  %r0 = ptrtoint ptr %alloc.ptr.0 to i64
  %r1 = load i64, ptr %local0
  %field.base.2 = inttoptr i64 %r0 to ptr
  %field.ptr.2 = getelementptr inbounds %t.GraphicsAppRuntimeState, ptr %field.base.2, i32 0, i32 0
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %copy.dst.2 = inttoptr i64 %r2 to ptr
  %copy.src.1 = inttoptr i64 %r1 to ptr
  %copy.val.2 = load %t.GraphicsApplication, ptr %copy.src.1
  store %t.GraphicsApplication %copy.val.2, ptr %copy.dst.2
  %r3 = load i64, ptr %local1
  %field.base.4 = inttoptr i64 %r0 to ptr
  %field.ptr.4 = getelementptr inbounds %t.GraphicsAppRuntimeState, ptr %field.base.4, i32 0, i32 1
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %store.ptr.3 = inttoptr i64 %r4 to ptr
  %store.rawptr.3 = inttoptr i64 %r3 to ptr
  store ptr %store.rawptr.3, ptr %store.ptr.3
  %r5 = add i64 0, 0
  %field.base.6 = inttoptr i64 %r0 to ptr
  %field.ptr.6 = getelementptr inbounds %t.GraphicsAppRuntimeState, ptr %field.base.6, i32 0, i32 2
  %r6 = ptrtoint ptr %field.ptr.6 to i64
  %store.ptr.5 = inttoptr i64 %r6 to ptr
  store i64 %r5, ptr %store.ptr.5
  %native.state.size.ptr.7 = getelementptr inbounds [3 x %kira.bridge.value], ptr null, i32 1
  %native.state.size.7 = ptrtoint ptr %native.state.size.ptr.7 to i64
  %native.state.box.7 = call ptr @"kira_native_state_alloc"(i64 7551196454525180470, i64 %native.state.size.7)
  %native.state.payload.7 = call ptr @"kira_native_state_payload"(ptr %native.state.box.7)
  %native.state.src.7 = inttoptr i64 %r0 to ptr
  %native.state.src.field.ptr.7.0 = getelementptr inbounds %t.GraphicsAppRuntimeState, ptr %native.state.src.7, i32 0, i32 0
  %native.state.slot.ptr.7.0 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.7, i64 0
  %native.state.pack.7.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %native.state.load.struct.7.0 = load %t.GraphicsApplication, ptr %native.state.src.field.ptr.7.0
  %native.state.load.struct.size.ptr.7.0 = getelementptr inbounds %t.GraphicsApplication, ptr null, i32 1
  %native.state.load.struct.size.7.0 = ptrtoint ptr %native.state.load.struct.size.ptr.7.0 to i64
  %native.state.load.struct.copy.7.0 = call ptr @malloc(i64 %native.state.load.struct.size.7.0)
  store %t.GraphicsApplication %native.state.load.struct.7.0, ptr %native.state.load.struct.copy.7.0
  %native.state.load.struct.ptrint.7.0 = ptrtoint ptr %native.state.load.struct.copy.7.0 to i64
  %native.state.pack.7.0 = insertvalue %kira.bridge.value %native.state.pack.7.0.0, i64 %native.state.load.struct.ptrint.7.0, 2
  store %kira.bridge.value %native.state.pack.7.0, ptr %native.state.slot.ptr.7.0
  %native.state.src.field.ptr.7.1 = getelementptr inbounds %t.GraphicsAppRuntimeState, ptr %native.state.src.7, i32 0, i32 1
  %native.state.slot.ptr.7.1 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.7, i64 1
  %native.state.pack.7.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %native.state.load.ptr.7.1 = load ptr, ptr %native.state.src.field.ptr.7.1
  %native.state.load.ptrint.7.1 = ptrtoint ptr %native.state.load.ptr.7.1 to i64
  %native.state.pack.7.1 = insertvalue %kira.bridge.value %native.state.pack.7.1.0, i64 %native.state.load.ptrint.7.1, 2
  store %kira.bridge.value %native.state.pack.7.1, ptr %native.state.slot.ptr.7.1
  %native.state.src.field.ptr.7.2 = getelementptr inbounds %t.GraphicsAppRuntimeState, ptr %native.state.src.7, i32 0, i32 2
  %native.state.slot.ptr.7.2 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.7, i64 2
  %native.state.pack.7.2.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.load.int.7.2 = load i64, ptr %native.state.src.field.ptr.7.2
  %native.state.pack.7.2 = insertvalue %kira.bridge.value %native.state.pack.7.2.0, i64 %native.state.load.int.7.2, 2
  store %kira.bridge.value %native.state.pack.7.2, ptr %native.state.slot.ptr.7.2
  %r7 = ptrtoint ptr %native.state.box.7 to i64
  store i64 %r7, ptr %local2
  %r8 = load i64, ptr %local0
  %r9 = load i64, ptr %local2
  call void @"kira_fn_5_sokolRunApplication"(i64 %r8, i64 %r9)
  ret void
}

define i1 @"kira_fn_29_graphicsValidatePipeline"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.RenderPipeline, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.RenderPipeline zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.RenderPipeline, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %field.base.2 = inttoptr i64 %r1 to ptr
  %field.ptr.2 = getelementptr inbounds %t.BackendPipelineHandle, ptr %field.base.2, i32 0, i32 0
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %load.ptr.3 = inttoptr i64 %r2 to ptr
  %load.raw.3 = load i32, ptr %load.ptr.3
  %r3 = sext i32 %load.raw.3 to i64
  %r4 = add i64 0, 0
  %r5 = icmp ne i64 %r3, %r4
  ret i1 %r5
}

define i64 @"kira_fn_243_GraphicsFrame.beginPass"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.GraphicsFrame, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.GraphicsFrame zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  %local1 = alloca i64
  %local.size.ptr.1 = getelementptr inbounds %t.Color, ptr null, i32 1
  %local.size.1 = ptrtoint ptr %local.size.ptr.1 to i64
  %local.heap.1 = call ptr @malloc(i64 %local.size.1)
  store %t.Color zeroinitializer, ptr %local.heap.1
  %local.heap.int.1 = ptrtoint ptr %local.heap.1 to i64
  store i64 %local.heap.int.1, ptr %local1
  %local2 = alloca i64
  %local.size.ptr.2 = getelementptr inbounds %t.RenderEncoder, ptr null, i32 1
  %local.size.2 = ptrtoint ptr %local.size.ptr.2 to i64
  %local.heap.2 = call ptr @malloc(i64 %local.size.2)
  store %t.RenderEncoder zeroinitializer, ptr %local.heap.2
  %local.heap.int.2 = ptrtoint ptr %local.heap.2 to i64
  store i64 %local.heap.int.2, ptr %local2
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %alloc.size.ptr.0 = getelementptr inbounds %t.RenderEncoder, ptr null, i32 1
  %alloc.size.0 = ptrtoint ptr %alloc.size.ptr.0 to i64
  %alloc.ptr.0 = call ptr @malloc(i64 %alloc.size.0)
  store %t.RenderEncoder zeroinitializer, ptr %alloc.ptr.0
  %r0 = ptrtoint ptr %alloc.ptr.0 to i64
  %alloc.size.ptr.1 = getelementptr inbounds %t.RenderPipeline, ptr null, i32 1
  %alloc.size.1 = ptrtoint ptr %alloc.size.ptr.1 to i64
  %alloc.ptr.1 = call ptr @malloc(i64 %alloc.size.1)
  store %t.RenderPipeline zeroinitializer, ptr %alloc.ptr.1
  %r1 = ptrtoint ptr %alloc.ptr.1 to i64
  %alloc.size.ptr.2 = getelementptr inbounds %t.BackendPipelineHandle, ptr null, i32 1
  %alloc.size.2 = ptrtoint ptr %alloc.size.ptr.2 to i64
  %alloc.ptr.2 = call ptr @malloc(i64 %alloc.size.2)
  store %t.BackendPipelineHandle zeroinitializer, ptr %alloc.ptr.2
  %r2 = ptrtoint ptr %alloc.ptr.2 to i64
  %r3 = add i64 0, 0
  %field.base.4 = inttoptr i64 %r2 to ptr
  %field.ptr.4 = getelementptr inbounds %t.BackendPipelineHandle, ptr %field.base.4, i32 0, i32 0
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %store.ptr.3 = inttoptr i64 %r4 to ptr
  %store.cast.3 = trunc i64 %r3 to i32
  store i32 %store.cast.3, ptr %store.ptr.3
  %field.base.5 = inttoptr i64 %r1 to ptr
  %field.ptr.5 = getelementptr inbounds %t.RenderPipeline, ptr %field.base.5, i32 0, i32 0
  %r5 = ptrtoint ptr %field.ptr.5 to i64
  %copy.dst.5 = inttoptr i64 %r5 to ptr
  %copy.src.2 = inttoptr i64 %r2 to ptr
  %copy.val.5 = load %t.BackendPipelineHandle, ptr %copy.src.2
  store %t.BackendPipelineHandle %copy.val.5, ptr %copy.dst.5
  %field.base.6 = inttoptr i64 %r0 to ptr
  %field.ptr.6 = getelementptr inbounds %t.RenderEncoder, ptr %field.base.6, i32 0, i32 0
  %r6 = ptrtoint ptr %field.ptr.6 to i64
  %copy.dst.6 = inttoptr i64 %r6 to ptr
  %copy.src.1 = inttoptr i64 %r1 to ptr
  %copy.val.6 = load %t.RenderPipeline, ptr %copy.src.1
  store %t.RenderPipeline %copy.val.6, ptr %copy.dst.6
  %r7 = add i64 0, 0
  %field.base.8 = inttoptr i64 %r0 to ptr
  %field.ptr.8 = getelementptr inbounds %t.RenderEncoder, ptr %field.base.8, i32 0, i32 1
  %r8 = ptrtoint ptr %field.ptr.8 to i64
  %store.ptr.7 = inttoptr i64 %r8 to ptr
  store i64 %r7, ptr %store.ptr.7
  %r9 = add i64 0, 1
  %field.base.10 = inttoptr i64 %r0 to ptr
  %field.ptr.10 = getelementptr inbounds %t.RenderEncoder, ptr %field.base.10, i32 0, i32 2
  %r10 = ptrtoint ptr %field.ptr.10 to i64
  %store.ptr.9 = inttoptr i64 %r10 to ptr
  store i64 %r9, ptr %store.ptr.9
  %r11 = load i64, ptr %local2
  %copy.dst.11 = inttoptr i64 %r11 to ptr
  %copy.src.0 = inttoptr i64 %r0 to ptr
  %copy.val.11 = load %t.RenderEncoder, ptr %copy.src.0
  store %t.RenderEncoder %copy.val.11, ptr %copy.dst.11
  %r12 = load i64, ptr %local1
  %r13 = load i64, ptr %local0
  %field.base.14 = inttoptr i64 %r13 to ptr
  %field.ptr.14 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.14, i32 0, i32 0
  %r14 = ptrtoint ptr %field.ptr.14 to i64
  %copy.dst.14 = inttoptr i64 %r14 to ptr
  %copy.src.12 = inttoptr i64 %r12 to ptr
  %copy.val.14 = load %t.Color, ptr %copy.src.12
  store %t.Color %copy.val.14, ptr %copy.dst.14
  %r15 = load i64, ptr %local2
  %r16 = load i64, ptr %local0
  %field.base.17 = inttoptr i64 %r16 to ptr
  %field.ptr.17 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.17, i32 0, i32 1
  %r17 = ptrtoint ptr %field.ptr.17 to i64
  %copy.dst.17 = inttoptr i64 %r17 to ptr
  %copy.src.15 = inttoptr i64 %r15 to ptr
  %copy.val.17 = load %t.RenderEncoder, ptr %copy.src.15
  store %t.RenderEncoder %copy.val.17, ptr %copy.dst.17
  %r18 = add i1 0, 1
  %r19 = load i64, ptr %local0
  %field.base.20 = inttoptr i64 %r19 to ptr
  %field.ptr.20 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.20, i32 0, i32 2
  %r20 = ptrtoint ptr %field.ptr.20 to i64
  %store.ptr.18 = inttoptr i64 %r20 to ptr
  %store.bool.18 = zext i1 %r18 to i8
  store i8 %store.bool.18, ptr %store.ptr.18
  %r21 = load i64, ptr %local2
  ret i64 %r21
}

define void @"kira_fn_244_GraphicsFrame.endPass"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.GraphicsFrame, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.GraphicsFrame zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  %local1 = alloca i64
  %local.size.ptr.1 = getelementptr inbounds %t.RenderEncoder, ptr null, i32 1
  %local.size.1 = ptrtoint ptr %local.size.ptr.1 to i64
  %local.heap.1 = call ptr @malloc(i64 %local.size.1)
  store %t.RenderEncoder zeroinitializer, ptr %local.heap.1
  %local.heap.int.1 = ptrtoint ptr %local.heap.1 to i64
  store i64 %local.heap.int.1, ptr %local1
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local1
  %r1 = load i64, ptr %local0
  %field.base.2 = inttoptr i64 %r1 to ptr
  %field.ptr.2 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.2, i32 0, i32 1
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %copy.dst.2 = inttoptr i64 %r2 to ptr
  %copy.src.0 = inttoptr i64 %r0 to ptr
  %copy.val.2 = load %t.RenderEncoder, ptr %copy.src.0
  store %t.RenderEncoder %copy.val.2, ptr %copy.dst.2
  %r3 = add i1 0, 1
  %r4 = load i64, ptr %local0
  %field.base.5 = inttoptr i64 %r4 to ptr
  %field.ptr.5 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.5, i32 0, i32 3
  %r5 = ptrtoint ptr %field.ptr.5 to i64
  %store.ptr.3 = inttoptr i64 %r5 to ptr
  %store.bool.3 = zext i1 %r3 to i8
  store i8 %store.bool.3, ptr %store.ptr.3
  ret void
}

define void @"kira_fn_246_GraphicsFrame.requestQuit"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.GraphicsFrame, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.GraphicsFrame zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  store i64 %arg0, ptr %local0
  %r0 = add i1 0, 1
  %r1 = load i64, ptr %local0
  %field.base.2 = inttoptr i64 %r1 to ptr
  %field.ptr.2 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.2, i32 0, i32 4
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %store.ptr.0 = inttoptr i64 %r2 to ptr
  %store.bool.0 = zext i1 %r0 to i8
  store i8 %store.bool.0, ptr %store.ptr.0
  ret void
}

define i64 @"kira_fn_247_Graphics.createShader"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.Graphics, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.Graphics zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  %local1 = alloca i64
  %local.size.ptr.1 = getelementptr inbounds %t.ShaderDescriptor, ptr null, i32 1
  %local.size.1 = ptrtoint ptr %local.size.ptr.1 to i64
  %local.heap.1 = call ptr @malloc(i64 %local.size.1)
  store %t.ShaderDescriptor zeroinitializer, ptr %local.heap.1
  %local.heap.int.1 = ptrtoint ptr %local.heap.1 to i64
  store i64 %local.heap.int.1, ptr %local1
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %alloc.size.ptr.0 = getelementptr inbounds %t.GraphicsShader, ptr null, i32 1
  %alloc.size.0 = ptrtoint ptr %alloc.size.ptr.0 to i64
  %alloc.ptr.0 = call ptr @malloc(i64 %alloc.size.0)
  store %t.GraphicsShader zeroinitializer, ptr %alloc.ptr.0
  %r0 = ptrtoint ptr %alloc.ptr.0 to i64
  %alloc.size.ptr.1 = getelementptr inbounds %t.BackendShaderHandle, ptr null, i32 1
  %alloc.size.1 = ptrtoint ptr %alloc.size.ptr.1 to i64
  %alloc.ptr.1 = call ptr @malloc(i64 %alloc.size.1)
  store %t.BackendShaderHandle zeroinitializer, ptr %alloc.ptr.1
  %r1 = ptrtoint ptr %alloc.ptr.1 to i64
  %r2 = load i64, ptr %local1
  %field.base.3 = inttoptr i64 %r2 to ptr
  %field.ptr.3 = getelementptr inbounds %t.ShaderDescriptor, ptr %field.base.3, i32 0, i32 0
  %r3 = ptrtoint ptr %field.ptr.3 to i64
  %load.ptr.4 = inttoptr i64 %r3 to ptr
  %r4 = load %kira.string, ptr %load.ptr.4
  %r5 = load i64, ptr %local1
  %field.base.6 = inttoptr i64 %r5 to ptr
  %field.ptr.6 = getelementptr inbounds %t.ShaderDescriptor, ptr %field.base.6, i32 0, i32 1
  %r6 = ptrtoint ptr %field.ptr.6 to i64
  %load.ptr.7 = inttoptr i64 %r6 to ptr
  %r7 = load %kira.string, ptr %load.ptr.7
  %r8 = load i64, ptr %local1
  %field.base.9 = inttoptr i64 %r8 to ptr
  %field.ptr.9 = getelementptr inbounds %t.ShaderDescriptor, ptr %field.base.9, i32 0, i32 2
  %r9 = ptrtoint ptr %field.ptr.9 to i64
  %load.ptr.10 = inttoptr i64 %r9 to ptr
  %r10 = load %kira.string, ptr %load.ptr.10
  %r11 = load i64, ptr %local1
  %field.base.12 = inttoptr i64 %r11 to ptr
  %field.ptr.12 = getelementptr inbounds %t.ShaderDescriptor, ptr %field.base.12, i32 0, i32 3
  %r12 = ptrtoint ptr %field.ptr.12 to i64
  %load.ptr.13 = inttoptr i64 %r12 to ptr
  %r13 = load %kira.string, ptr %load.ptr.13
  %r14 = load i64, ptr %local1
  %field.base.15 = inttoptr i64 %r14 to ptr
  %field.ptr.15 = getelementptr inbounds %t.ShaderDescriptor, ptr %field.base.15, i32 0, i32 4
  %r15 = ptrtoint ptr %field.ptr.15 to i64
  %load.ptr.16 = inttoptr i64 %r15 to ptr
  %r16 = load %kira.string, ptr %load.ptr.16
  %r17 = call i64 @"kira_fn_24_sokolCreateShaderId"(%kira.string %r4, %kira.string %r7, %kira.string %r10, %kira.string %r13, %kira.string %r16)
  %field.base.18 = inttoptr i64 %r1 to ptr
  %field.ptr.18 = getelementptr inbounds %t.BackendShaderHandle, ptr %field.base.18, i32 0, i32 0
  %r18 = ptrtoint ptr %field.ptr.18 to i64
  %store.ptr.17 = inttoptr i64 %r18 to ptr
  %store.cast.17 = trunc i64 %r17 to i32
  store i32 %store.cast.17, ptr %store.ptr.17
  %field.base.19 = inttoptr i64 %r0 to ptr
  %field.ptr.19 = getelementptr inbounds %t.GraphicsShader, ptr %field.base.19, i32 0, i32 0
  %r19 = ptrtoint ptr %field.ptr.19 to i64
  %copy.dst.19 = inttoptr i64 %r19 to ptr
  %copy.src.1 = inttoptr i64 %r1 to ptr
  %copy.val.19 = load %t.BackendShaderHandle, ptr %copy.src.1
  store %t.BackendShaderHandle %copy.val.19, ptr %copy.dst.19
  ret i64 %r0
}

define void @"kira_fn_248_Graphics.destroyShader"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.Graphics, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.Graphics zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  %local1 = alloca i64
  %local.size.ptr.1 = getelementptr inbounds %t.GraphicsShader, ptr null, i32 1
  %local.size.1 = ptrtoint ptr %local.size.ptr.1 to i64
  %local.heap.1 = call ptr @malloc(i64 %local.size.1)
  store %t.GraphicsShader zeroinitializer, ptr %local.heap.1
  %local.heap.int.1 = ptrtoint ptr %local.heap.1 to i64
  store i64 %local.heap.int.1, ptr %local1
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local1
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.GraphicsShader, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %field.base.2 = inttoptr i64 %r1 to ptr
  %field.ptr.2 = getelementptr inbounds %t.BackendShaderHandle, ptr %field.base.2, i32 0, i32 0
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %load.ptr.3 = inttoptr i64 %r2 to ptr
  %load.raw.3 = load i32, ptr %load.ptr.3
  %r3 = sext i32 %load.raw.3 to i64
  call void @"kira_fn_25_sokolDestroyShaderId"(i64 %r3)
  ret void
}

define i64 @"kira_fn_249_Graphics.createRenderPipeline"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.Graphics, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.Graphics zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  %local1 = alloca i64
  %local.size.ptr.1 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr null, i32 1
  %local.size.1 = ptrtoint ptr %local.size.ptr.1 to i64
  %local.heap.1 = call ptr @malloc(i64 %local.size.1)
  store %t.RenderPipelineDescriptor zeroinitializer, ptr %local.heap.1
  %local.heap.int.1 = ptrtoint ptr %local.heap.1 to i64
  store i64 %local.heap.int.1, ptr %local1
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %alloc.size.ptr.0 = getelementptr inbounds %t.RenderPipeline, ptr null, i32 1
  %alloc.size.0 = ptrtoint ptr %alloc.size.ptr.0 to i64
  %alloc.ptr.0 = call ptr @malloc(i64 %alloc.size.0)
  store %t.RenderPipeline zeroinitializer, ptr %alloc.ptr.0
  %r0 = ptrtoint ptr %alloc.ptr.0 to i64
  %alloc.size.ptr.1 = getelementptr inbounds %t.BackendPipelineHandle, ptr null, i32 1
  %alloc.size.1 = ptrtoint ptr %alloc.size.ptr.1 to i64
  %alloc.ptr.1 = call ptr @malloc(i64 %alloc.size.1)
  store %t.BackendPipelineHandle zeroinitializer, ptr %alloc.ptr.1
  %r1 = ptrtoint ptr %alloc.ptr.1 to i64
  %r2 = load i64, ptr %local1
  %field.base.3 = inttoptr i64 %r2 to ptr
  %field.ptr.3 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.3, i32 0, i32 0
  %r3 = ptrtoint ptr %field.ptr.3 to i64
  %load.ptr.4 = inttoptr i64 %r3 to ptr
  %r4 = load %kira.string, ptr %load.ptr.4
  %r5 = load i64, ptr %local1
  %field.base.6 = inttoptr i64 %r5 to ptr
  %field.ptr.6 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.6, i32 0, i32 1
  %r6 = ptrtoint ptr %field.ptr.6 to i64
  %field.base.7 = inttoptr i64 %r6 to ptr
  %field.ptr.7 = getelementptr inbounds %t.GraphicsShader, ptr %field.base.7, i32 0, i32 0
  %r7 = ptrtoint ptr %field.ptr.7 to i64
  %field.base.8 = inttoptr i64 %r7 to ptr
  %field.ptr.8 = getelementptr inbounds %t.BackendShaderHandle, ptr %field.base.8, i32 0, i32 0
  %r8 = ptrtoint ptr %field.ptr.8 to i64
  %load.ptr.9 = inttoptr i64 %r8 to ptr
  %load.raw.9 = load i32, ptr %load.ptr.9
  %r9 = sext i32 %load.raw.9 to i64
  %r10 = call i64 @"kira_fn_22_sokolCreateRenderPipelineId"(%kira.string %r4, i64 %r9)
  %field.base.11 = inttoptr i64 %r1 to ptr
  %field.ptr.11 = getelementptr inbounds %t.BackendPipelineHandle, ptr %field.base.11, i32 0, i32 0
  %r11 = ptrtoint ptr %field.ptr.11 to i64
  %store.ptr.10 = inttoptr i64 %r11 to ptr
  %store.cast.10 = trunc i64 %r10 to i32
  store i32 %store.cast.10, ptr %store.ptr.10
  %field.base.12 = inttoptr i64 %r0 to ptr
  %field.ptr.12 = getelementptr inbounds %t.RenderPipeline, ptr %field.base.12, i32 0, i32 0
  %r12 = ptrtoint ptr %field.ptr.12 to i64
  %copy.dst.12 = inttoptr i64 %r12 to ptr
  %copy.src.1 = inttoptr i64 %r1 to ptr
  %copy.val.12 = load %t.BackendPipelineHandle, ptr %copy.src.1
  store %t.BackendPipelineHandle %copy.val.12, ptr %copy.dst.12
  ret i64 %r0
}

define void @"kira_fn_250_Graphics.destroyPipeline"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.Graphics, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.Graphics zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  %local1 = alloca i64
  %local.size.ptr.1 = getelementptr inbounds %t.RenderPipeline, ptr null, i32 1
  %local.size.1 = ptrtoint ptr %local.size.ptr.1 to i64
  %local.heap.1 = call ptr @malloc(i64 %local.size.1)
  store %t.RenderPipeline zeroinitializer, ptr %local.heap.1
  %local.heap.int.1 = ptrtoint ptr %local.heap.1 to i64
  store i64 %local.heap.int.1, ptr %local1
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local1
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.RenderPipeline, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %field.base.2 = inttoptr i64 %r1 to ptr
  %field.ptr.2 = getelementptr inbounds %t.BackendPipelineHandle, ptr %field.base.2, i32 0, i32 0
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %load.ptr.3 = inttoptr i64 %r2 to ptr
  %load.raw.3 = load i32, ptr %load.ptr.3
  %r3 = sext i32 %load.raw.3 to i64
  call void @"kira_fn_23_sokolDestroyRenderPipelineId"(i64 %r3)
  ret void
}

define i64 @"kira_fn_253_Graphics.frame"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.Graphics, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.Graphics zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  store i64 %arg0, ptr %local0
  %alloc.size.ptr.0 = getelementptr inbounds %t.GraphicsFrame, ptr null, i32 1
  %alloc.size.0 = ptrtoint ptr %alloc.size.ptr.0 to i64
  %alloc.ptr.0 = call ptr @malloc(i64 %alloc.size.0)
  store %t.GraphicsFrame zeroinitializer, ptr %alloc.ptr.0
  %r0 = ptrtoint ptr %alloc.ptr.0 to i64
  %alloc.size.ptr.1 = getelementptr inbounds %t.Color, ptr null, i32 1
  %alloc.size.1 = ptrtoint ptr %alloc.size.ptr.1 to i64
  %alloc.ptr.1 = call ptr @malloc(i64 %alloc.size.1)
  store %t.Color zeroinitializer, ptr %alloc.ptr.1
  %r1 = ptrtoint ptr %alloc.ptr.1 to i64
  %r2 = fadd double 0.0, 0.0
  %field.base.3 = inttoptr i64 %r1 to ptr
  %field.ptr.3 = getelementptr inbounds %t.Color, ptr %field.base.3, i32 0, i32 0
  %r3 = ptrtoint ptr %field.ptr.3 to i64
  %store.ptr.2 = inttoptr i64 %r3 to ptr
  store double %r2, ptr %store.ptr.2
  %r4 = fadd double 0.0, 0.0
  %field.base.5 = inttoptr i64 %r1 to ptr
  %field.ptr.5 = getelementptr inbounds %t.Color, ptr %field.base.5, i32 0, i32 1
  %r5 = ptrtoint ptr %field.ptr.5 to i64
  %store.ptr.4 = inttoptr i64 %r5 to ptr
  store double %r4, ptr %store.ptr.4
  %r6 = fadd double 0.0, 0.0
  %field.base.7 = inttoptr i64 %r1 to ptr
  %field.ptr.7 = getelementptr inbounds %t.Color, ptr %field.base.7, i32 0, i32 2
  %r7 = ptrtoint ptr %field.ptr.7 to i64
  %store.ptr.6 = inttoptr i64 %r7 to ptr
  store double %r6, ptr %store.ptr.6
  %r8 = fadd double 0.0, 1.0
  %field.base.9 = inttoptr i64 %r1 to ptr
  %field.ptr.9 = getelementptr inbounds %t.Color, ptr %field.base.9, i32 0, i32 3
  %r9 = ptrtoint ptr %field.ptr.9 to i64
  %store.ptr.8 = inttoptr i64 %r9 to ptr
  store double %r8, ptr %store.ptr.8
  %field.base.10 = inttoptr i64 %r0 to ptr
  %field.ptr.10 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.10, i32 0, i32 0
  %r10 = ptrtoint ptr %field.ptr.10 to i64
  %copy.dst.10 = inttoptr i64 %r10 to ptr
  %copy.src.1 = inttoptr i64 %r1 to ptr
  %copy.val.10 = load %t.Color, ptr %copy.src.1
  store %t.Color %copy.val.10, ptr %copy.dst.10
  %alloc.size.ptr.11 = getelementptr inbounds %t.RenderEncoder, ptr null, i32 1
  %alloc.size.11 = ptrtoint ptr %alloc.size.ptr.11 to i64
  %alloc.ptr.11 = call ptr @malloc(i64 %alloc.size.11)
  store %t.RenderEncoder zeroinitializer, ptr %alloc.ptr.11
  %r11 = ptrtoint ptr %alloc.ptr.11 to i64
  %alloc.size.ptr.12 = getelementptr inbounds %t.RenderPipeline, ptr null, i32 1
  %alloc.size.12 = ptrtoint ptr %alloc.size.ptr.12 to i64
  %alloc.ptr.12 = call ptr @malloc(i64 %alloc.size.12)
  store %t.RenderPipeline zeroinitializer, ptr %alloc.ptr.12
  %r12 = ptrtoint ptr %alloc.ptr.12 to i64
  %alloc.size.ptr.13 = getelementptr inbounds %t.BackendPipelineHandle, ptr null, i32 1
  %alloc.size.13 = ptrtoint ptr %alloc.size.ptr.13 to i64
  %alloc.ptr.13 = call ptr @malloc(i64 %alloc.size.13)
  store %t.BackendPipelineHandle zeroinitializer, ptr %alloc.ptr.13
  %r13 = ptrtoint ptr %alloc.ptr.13 to i64
  %r14 = add i64 0, 0
  %field.base.15 = inttoptr i64 %r13 to ptr
  %field.ptr.15 = getelementptr inbounds %t.BackendPipelineHandle, ptr %field.base.15, i32 0, i32 0
  %r15 = ptrtoint ptr %field.ptr.15 to i64
  %store.ptr.14 = inttoptr i64 %r15 to ptr
  %store.cast.14 = trunc i64 %r14 to i32
  store i32 %store.cast.14, ptr %store.ptr.14
  %field.base.16 = inttoptr i64 %r12 to ptr
  %field.ptr.16 = getelementptr inbounds %t.RenderPipeline, ptr %field.base.16, i32 0, i32 0
  %r16 = ptrtoint ptr %field.ptr.16 to i64
  %copy.dst.16 = inttoptr i64 %r16 to ptr
  %copy.src.13 = inttoptr i64 %r13 to ptr
  %copy.val.16 = load %t.BackendPipelineHandle, ptr %copy.src.13
  store %t.BackendPipelineHandle %copy.val.16, ptr %copy.dst.16
  %field.base.17 = inttoptr i64 %r11 to ptr
  %field.ptr.17 = getelementptr inbounds %t.RenderEncoder, ptr %field.base.17, i32 0, i32 0
  %r17 = ptrtoint ptr %field.ptr.17 to i64
  %copy.dst.17 = inttoptr i64 %r17 to ptr
  %copy.src.12 = inttoptr i64 %r12 to ptr
  %copy.val.17 = load %t.RenderPipeline, ptr %copy.src.12
  store %t.RenderPipeline %copy.val.17, ptr %copy.dst.17
  %r18 = add i64 0, 0
  %field.base.19 = inttoptr i64 %r11 to ptr
  %field.ptr.19 = getelementptr inbounds %t.RenderEncoder, ptr %field.base.19, i32 0, i32 1
  %r19 = ptrtoint ptr %field.ptr.19 to i64
  %store.ptr.18 = inttoptr i64 %r19 to ptr
  store i64 %r18, ptr %store.ptr.18
  %r20 = add i64 0, 1
  %field.base.21 = inttoptr i64 %r11 to ptr
  %field.ptr.21 = getelementptr inbounds %t.RenderEncoder, ptr %field.base.21, i32 0, i32 2
  %r21 = ptrtoint ptr %field.ptr.21 to i64
  %store.ptr.20 = inttoptr i64 %r21 to ptr
  store i64 %r20, ptr %store.ptr.20
  %field.base.22 = inttoptr i64 %r0 to ptr
  %field.ptr.22 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.22, i32 0, i32 1
  %r22 = ptrtoint ptr %field.ptr.22 to i64
  %copy.dst.22 = inttoptr i64 %r22 to ptr
  %copy.src.11 = inttoptr i64 %r11 to ptr
  %copy.val.22 = load %t.RenderEncoder, ptr %copy.src.11
  store %t.RenderEncoder %copy.val.22, ptr %copy.dst.22
  %r23 = add i1 0, 0
  %field.base.24 = inttoptr i64 %r0 to ptr
  %field.ptr.24 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.24, i32 0, i32 2
  %r24 = ptrtoint ptr %field.ptr.24 to i64
  %store.ptr.23 = inttoptr i64 %r24 to ptr
  %store.bool.23 = zext i1 %r23 to i8
  store i8 %store.bool.23, ptr %store.ptr.23
  %r25 = add i1 0, 0
  %field.base.26 = inttoptr i64 %r0 to ptr
  %field.ptr.26 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.26, i32 0, i32 3
  %r26 = ptrtoint ptr %field.ptr.26 to i64
  %store.ptr.25 = inttoptr i64 %r26 to ptr
  %store.bool.25 = zext i1 %r25 to i8
  store i8 %store.bool.25, ptr %store.ptr.25
  %r27 = add i1 0, 0
  %field.base.28 = inttoptr i64 %r0 to ptr
  %field.ptr.28 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.28, i32 0, i32 4
  %r28 = ptrtoint ptr %field.ptr.28 to i64
  %store.ptr.27 = inttoptr i64 %r28 to ptr
  %store.bool.27 = zext i1 %r27 to i8
  store i8 %store.bool.27, ptr %store.ptr.27
  %r29 = load i64, ptr %local0
  %field.base.30 = inttoptr i64 %r29 to ptr
  %field.ptr.30 = getelementptr inbounds %t.Graphics, ptr %field.base.30, i32 0, i32 0
  %r30 = ptrtoint ptr %field.ptr.30 to i64
  %load.ptr.31 = inttoptr i64 %r30 to ptr
  %load.rawptr.31 = load ptr, ptr %load.ptr.31
  %r31 = ptrtoint ptr %load.rawptr.31 to i64
  %field.base.32 = inttoptr i64 %r0 to ptr
  %field.ptr.32 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.32, i32 0, i32 5
  %r32 = ptrtoint ptr %field.ptr.32 to i64
  %store.ptr.31 = inttoptr i64 %r32 to ptr
  %store.rawptr.31 = inttoptr i64 %r31 to ptr
  store ptr %store.rawptr.31, ptr %store.ptr.31
  ret i64 %r0
}

define void @"kira_fn_254_RenderEncoder.setPipeline"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.RenderEncoder, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.RenderEncoder zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  %local1 = alloca i64
  %local.size.ptr.1 = getelementptr inbounds %t.RenderPipeline, ptr null, i32 1
  %local.size.1 = ptrtoint ptr %local.size.ptr.1 to i64
  %local.heap.1 = call ptr @malloc(i64 %local.size.1)
  store %t.RenderPipeline zeroinitializer, ptr %local.heap.1
  %local.heap.int.1 = ptrtoint ptr %local.heap.1 to i64
  store i64 %local.heap.int.1, ptr %local1
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local1
  %r1 = load i64, ptr %local0
  %field.base.2 = inttoptr i64 %r1 to ptr
  %field.ptr.2 = getelementptr inbounds %t.RenderEncoder, ptr %field.base.2, i32 0, i32 0
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %copy.dst.2 = inttoptr i64 %r2 to ptr
  %copy.src.0 = inttoptr i64 %r0 to ptr
  %copy.val.2 = load %t.RenderPipeline, ptr %copy.src.0
  store %t.RenderPipeline %copy.val.2, ptr %copy.dst.2
  ret void
}

define void @"kira_fn_255_RenderEncoder.draw"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.RenderEncoder, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.RenderEncoder zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  %local1 = alloca i64
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local1
  %r1 = load i64, ptr %local0
  %field.base.2 = inttoptr i64 %r1 to ptr
  %field.ptr.2 = getelementptr inbounds %t.RenderEncoder, ptr %field.base.2, i32 0, i32 1
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %store.ptr.0 = inttoptr i64 %r2 to ptr
  store i64 %r0, ptr %store.ptr.0
  %r3 = add i64 0, 1
  %r4 = load i64, ptr %local0
  %field.base.5 = inttoptr i64 %r4 to ptr
  %field.ptr.5 = getelementptr inbounds %t.RenderEncoder, ptr %field.base.5, i32 0, i32 2
  %r5 = ptrtoint ptr %field.ptr.5 to i64
  %store.ptr.3 = inttoptr i64 %r5 to ptr
  store i64 %r3, ptr %store.ptr.3
  ret void
}

define void @"kira_fn_256_main$callback_256"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.Graphics, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.Graphics zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  %local1 = alloca i64
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.Graphics, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.rawptr.2 = load ptr, ptr %load.ptr.2
  %r2 = ptrtoint ptr %load.rawptr.2 to i64
  %native.recover.state.3 = inttoptr i64 %r2 to ptr
  %native.recover.payload.3 = call ptr @"kira_native_state_recover"(ptr %native.recover.state.3, i64 8814238373109695030)
  %r3 = ptrtoint ptr %native.recover.payload.3 to i64
  store i64 %r3, ptr %local1
  %r4 = load i64, ptr %local0
  %alloc.size.ptr.5 = getelementptr inbounds %t.ShaderDescriptor, ptr null, i32 1
  %alloc.size.5 = ptrtoint ptr %alloc.size.ptr.5 to i64
  %alloc.ptr.5 = call ptr @malloc(i64 %alloc.size.5)
  store %t.ShaderDescriptor zeroinitializer, ptr %alloc.ptr.5
  %r5 = ptrtoint ptr %alloc.ptr.5 to i64
  %r6 = load %kira.string, ptr @kira_str_2
  %field.base.7 = inttoptr i64 %r5 to ptr
  %field.ptr.7 = getelementptr inbounds %t.ShaderDescriptor, ptr %field.base.7, i32 0, i32 0
  %r7 = ptrtoint ptr %field.ptr.7 to i64
  %store.ptr.6 = inttoptr i64 %r7 to ptr
  store %kira.string %r6, ptr %store.ptr.6
  %r8 = load %kira.string, ptr @kira_str_3
  %field.base.9 = inttoptr i64 %r5 to ptr
  %field.ptr.9 = getelementptr inbounds %t.ShaderDescriptor, ptr %field.base.9, i32 0, i32 1
  %r9 = ptrtoint ptr %field.ptr.9 to i64
  %store.ptr.8 = inttoptr i64 %r9 to ptr
  store %kira.string %r8, ptr %store.ptr.8
  %r10 = load %kira.string, ptr @kira_str_4
  %field.base.11 = inttoptr i64 %r5 to ptr
  %field.ptr.11 = getelementptr inbounds %t.ShaderDescriptor, ptr %field.base.11, i32 0, i32 2
  %r11 = ptrtoint ptr %field.ptr.11 to i64
  %store.ptr.10 = inttoptr i64 %r11 to ptr
  store %kira.string %r10, ptr %store.ptr.10
  %r12 = load %kira.string, ptr @kira_str_5
  %field.base.13 = inttoptr i64 %r5 to ptr
  %field.ptr.13 = getelementptr inbounds %t.ShaderDescriptor, ptr %field.base.13, i32 0, i32 3
  %r13 = ptrtoint ptr %field.ptr.13 to i64
  %store.ptr.12 = inttoptr i64 %r13 to ptr
  store %kira.string %r12, ptr %store.ptr.12
  %r14 = load %kira.string, ptr @kira_str_6
  %field.base.15 = inttoptr i64 %r5 to ptr
  %field.ptr.15 = getelementptr inbounds %t.ShaderDescriptor, ptr %field.base.15, i32 0, i32 4
  %r15 = ptrtoint ptr %field.ptr.15 to i64
  %store.ptr.14 = inttoptr i64 %r15 to ptr
  store %kira.string %r14, ptr %store.ptr.14
  %r16 = call i64 @"kira_fn_247_Graphics.createShader"(i64 %r4, i64 %r5)
  %r17 = load i64, ptr %local1
  %native.state.set.ptr.16 = inttoptr i64 %r17 to ptr
  %native.state.set.slot.16 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.16, i64 0
  %native.state.set.pack.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %native.state.set.struct.src.0 = inttoptr i64 %r16 to ptr
  %native.state.set.struct.value.0 = load %t.GraphicsShader, ptr %native.state.set.struct.src.0
  %native.state.set.struct.size.ptr.0 = getelementptr inbounds %t.GraphicsShader, ptr null, i32 1
  %native.state.set.struct.size.0 = ptrtoint ptr %native.state.set.struct.size.ptr.0 to i64
  %native.state.set.struct.copy.0 = call ptr @malloc(i64 %native.state.set.struct.size.0)
  store %t.GraphicsShader %native.state.set.struct.value.0, ptr %native.state.set.struct.copy.0
  %native.state.set.struct.ptrint.0 = ptrtoint ptr %native.state.set.struct.copy.0 to i64
  %native.state.set.pack.0 = insertvalue %kira.bridge.value %native.state.set.pack.0.0, i64 %native.state.set.struct.ptrint.0, 2
  store %kira.bridge.value %native.state.set.pack.0, ptr %native.state.set.slot.16
  %r18 = load i64, ptr %local0
  %alloc.size.ptr.19 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr null, i32 1
  %alloc.size.19 = ptrtoint ptr %alloc.size.ptr.19 to i64
  %alloc.ptr.19 = call ptr @malloc(i64 %alloc.size.19)
  store %t.RenderPipelineDescriptor zeroinitializer, ptr %alloc.ptr.19
  %r19 = ptrtoint ptr %alloc.ptr.19 to i64
  %r20 = load %kira.string, ptr @kira_str_7
  %field.base.21 = inttoptr i64 %r19 to ptr
  %field.ptr.21 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.21, i32 0, i32 0
  %r21 = ptrtoint ptr %field.ptr.21 to i64
  %store.ptr.20 = inttoptr i64 %r21 to ptr
  store %kira.string %r20, ptr %store.ptr.20
  %r22 = load i64, ptr %local1
  %native.state.get.ptr.23 = inttoptr i64 %r22 to ptr
  %native.state.get.slot.23 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.23, i64 0
  %native.state.get.val.1 = load %kira.bridge.value, ptr %native.state.get.slot.23
  %r23 = extractvalue %kira.bridge.value %native.state.get.val.1, 2
  %field.base.24 = inttoptr i64 %r19 to ptr
  %field.ptr.24 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.24, i32 0, i32 1
  %r24 = ptrtoint ptr %field.ptr.24 to i64
  %copy.dst.24 = inttoptr i64 %r24 to ptr
  %copy.src.23 = inttoptr i64 %r23 to ptr
  %copy.val.24 = load %t.GraphicsShader, ptr %copy.src.23
  store %t.GraphicsShader %copy.val.24, ptr %copy.dst.24
  %r25 = call i64 @"kira_fn_249_Graphics.createRenderPipeline"(i64 %r18, i64 %r19)
  %r26 = load i64, ptr %local1
  %native.state.set.ptr.25 = inttoptr i64 %r26 to ptr
  %native.state.set.slot.25 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.25, i64 1
  %native.state.set.pack.2.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %native.state.set.struct.src.2 = inttoptr i64 %r25 to ptr
  %native.state.set.struct.value.2 = load %t.RenderPipeline, ptr %native.state.set.struct.src.2
  %native.state.set.struct.size.ptr.2 = getelementptr inbounds %t.RenderPipeline, ptr null, i32 1
  %native.state.set.struct.size.2 = ptrtoint ptr %native.state.set.struct.size.ptr.2 to i64
  %native.state.set.struct.copy.2 = call ptr @malloc(i64 %native.state.set.struct.size.2)
  store %t.RenderPipeline %native.state.set.struct.value.2, ptr %native.state.set.struct.copy.2
  %native.state.set.struct.ptrint.2 = ptrtoint ptr %native.state.set.struct.copy.2 to i64
  %native.state.set.pack.2 = insertvalue %kira.bridge.value %native.state.set.pack.2.0, i64 %native.state.set.struct.ptrint.2, 2
  store %kira.bridge.value %native.state.set.pack.2, ptr %native.state.set.slot.25
  ret void
}

define void @"kira_fn_257_main$callback_257"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.GraphicsFrame, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.GraphicsFrame zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  %local1 = alloca i64
  %local2 = alloca i64
  %local.size.ptr.2 = getelementptr inbounds %t.RenderEncoder, ptr null, i32 1
  %local.size.2 = ptrtoint ptr %local.size.ptr.2 to i64
  %local.heap.2 = call ptr @malloc(i64 %local.size.2)
  store %t.RenderEncoder zeroinitializer, ptr %local.heap.2
  %local.heap.int.2 = ptrtoint ptr %local.heap.2 to i64
  store i64 %local.heap.int.2, ptr %local2
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.1, i32 0, i32 5
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.rawptr.2 = load ptr, ptr %load.ptr.2
  %r2 = ptrtoint ptr %load.rawptr.2 to i64
  %native.recover.state.3 = inttoptr i64 %r2 to ptr
  %native.recover.payload.3 = call ptr @"kira_native_state_recover"(ptr %native.recover.state.3, i64 8814238373109695030)
  %r3 = ptrtoint ptr %native.recover.payload.3 to i64
  store i64 %r3, ptr %local1
  %r4 = load i64, ptr %local0
  %alloc.size.ptr.5 = getelementptr inbounds %t.Color, ptr null, i32 1
  %alloc.size.5 = ptrtoint ptr %alloc.size.ptr.5 to i64
  %alloc.ptr.5 = call ptr @malloc(i64 %alloc.size.5)
  store %t.Color zeroinitializer, ptr %alloc.ptr.5
  %r5 = ptrtoint ptr %alloc.ptr.5 to i64
  %r6 = fadd double 0.0, 0.03
  %field.base.7 = inttoptr i64 %r5 to ptr
  %field.ptr.7 = getelementptr inbounds %t.Color, ptr %field.base.7, i32 0, i32 0
  %r7 = ptrtoint ptr %field.ptr.7 to i64
  %store.ptr.6 = inttoptr i64 %r7 to ptr
  store double %r6, ptr %store.ptr.6
  %r8 = fadd double 0.0, 0.04
  %field.base.9 = inttoptr i64 %r5 to ptr
  %field.ptr.9 = getelementptr inbounds %t.Color, ptr %field.base.9, i32 0, i32 1
  %r9 = ptrtoint ptr %field.ptr.9 to i64
  %store.ptr.8 = inttoptr i64 %r9 to ptr
  store double %r8, ptr %store.ptr.8
  %r10 = fadd double 0.0, 0.07
  %field.base.11 = inttoptr i64 %r5 to ptr
  %field.ptr.11 = getelementptr inbounds %t.Color, ptr %field.base.11, i32 0, i32 2
  %r11 = ptrtoint ptr %field.ptr.11 to i64
  %store.ptr.10 = inttoptr i64 %r11 to ptr
  store double %r10, ptr %store.ptr.10
  %r12 = fadd double 0.0, 1.0
  %field.base.13 = inttoptr i64 %r5 to ptr
  %field.ptr.13 = getelementptr inbounds %t.Color, ptr %field.base.13, i32 0, i32 3
  %r13 = ptrtoint ptr %field.ptr.13 to i64
  %store.ptr.12 = inttoptr i64 %r13 to ptr
  store double %r12, ptr %store.ptr.12
  %r14 = call i64 @"kira_fn_243_GraphicsFrame.beginPass"(i64 %r4, i64 %r5)
  %r15 = load i64, ptr %local2
  %copy.dst.15 = inttoptr i64 %r15 to ptr
  %copy.src.14 = inttoptr i64 %r14 to ptr
  %copy.val.15 = load %t.RenderEncoder, ptr %copy.src.14
  store %t.RenderEncoder %copy.val.15, ptr %copy.dst.15
  %r16 = load i64, ptr %local2
  %r17 = load i64, ptr %local1
  %native.state.get.ptr.18 = inttoptr i64 %r17 to ptr
  %native.state.get.slot.18 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.18, i64 1
  %native.state.get.val.0 = load %kira.bridge.value, ptr %native.state.get.slot.18
  %r18 = extractvalue %kira.bridge.value %native.state.get.val.0, 2
  call void @"kira_fn_254_RenderEncoder.setPipeline"(i64 %r16, i64 %r18)
  %r19 = load i64, ptr %local2
  %r20 = add i64 0, 3
  call void @"kira_fn_255_RenderEncoder.draw"(i64 %r19, i64 %r20)
  %r21 = load i64, ptr %local0
  %r22 = load i64, ptr %local2
  call void @"kira_fn_244_GraphicsFrame.endPass"(i64 %r21, i64 %r22)
  %r23 = load i64, ptr %local0
  call void @"kira_fn_246_GraphicsFrame.requestQuit"(i64 %r23)
  ret void
}

define void @"kira_fn_258_main$callback_258"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.size.ptr.0 = getelementptr inbounds %t.Graphics, ptr null, i32 1
  %local.size.0 = ptrtoint ptr %local.size.ptr.0 to i64
  %local.heap.0 = call ptr @malloc(i64 %local.size.0)
  store %t.Graphics zeroinitializer, ptr %local.heap.0
  %local.heap.int.0 = ptrtoint ptr %local.heap.0 to i64
  store i64 %local.heap.int.0, ptr %local0
  %local1 = alloca i64
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.Graphics, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.rawptr.2 = load ptr, ptr %load.ptr.2
  %r2 = ptrtoint ptr %load.rawptr.2 to i64
  %native.recover.state.3 = inttoptr i64 %r2 to ptr
  %native.recover.payload.3 = call ptr @"kira_native_state_recover"(ptr %native.recover.state.3, i64 8814238373109695030)
  %r3 = ptrtoint ptr %native.recover.payload.3 to i64
  store i64 %r3, ptr %local1
  %r4 = load i64, ptr %local0
  %r5 = load i64, ptr %local1
  %native.state.get.ptr.6 = inttoptr i64 %r5 to ptr
  %native.state.get.slot.6 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.6, i64 1
  %native.state.get.val.0 = load %kira.bridge.value, ptr %native.state.get.slot.6
  %r6 = extractvalue %kira.bridge.value %native.state.get.val.0, 2
  call void @"kira_fn_250_Graphics.destroyPipeline"(i64 %r4, i64 %r6)
  %r7 = load i64, ptr %local0
  %r8 = load i64, ptr %local1
  %native.state.get.ptr.9 = inttoptr i64 %r8 to ptr
  %native.state.get.slot.9 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.9, i64 0
  %native.state.get.val.1 = load %kira.bridge.value, ptr %native.state.get.slot.9
  %r9 = extractvalue %kira.bridge.value %native.state.get.val.1, 2
  call void @"kira_fn_248_Graphics.destroyShader"(i64 %r7, i64 %r9)
  ret void
}

define i32 @main() {
entry:
  call void @"kira_fn_0_main"()
  ret i32 0
}

define void @"kira_callable_dispatch_739b41e868b5845f"(i64 %function_id, i64 %arg0) {
entry:
  %dispatch.is_direct = icmp ule i64 %function_id, 4294967295
  br i1 %dispatch.is_direct, label %dispatch.direct, label %dispatch.closure
dispatch.direct:
  switch i64 %function_id, label %dispatch.default [
    i64 1, label %dispatch.case.0
    i64 3, label %dispatch.case.1
    i64 256, label %dispatch.case.2
    i64 258, label %dispatch.case.3
  ]
dispatch.case.0:
  call void @"kira_fn_1_graphicsApplicationDefaultInit"(i64 %arg0)
  ret void
dispatch.case.1:
  call void @"kira_fn_3_graphicsApplicationDefaultCleanup"(i64 %arg0)
  ret void
dispatch.case.2:
  call void @"kira_fn_256_main$callback_256"(i64 %arg0)
  ret void
dispatch.case.3:
  call void @"kira_fn_258_main$callback_258"(i64 %arg0)
  ret void
dispatch.closure:
  %closure.ptr = inttoptr i64 %function_id to ptr
  %closure.id = load i64, ptr %closure.ptr
  %closure.slots = getelementptr inbounds i8, ptr %closure.ptr, i64 16
  switch i64 %closure.id, label %dispatch.default [
    i64 248, label %dispatch.closure.case.0
    i64 250, label %dispatch.closure.case.1
  ]
dispatch.closure.case.0:
  %closure.slot.0.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.0.0 = load %kira.bridge.value, ptr %closure.slot.0.0
  %closure.arg.0.0 = extractvalue %kira.bridge.value %closure.value.0.0, 2
  call void @"kira_fn_248_Graphics.destroyShader"(i64 %arg0, i64 %closure.arg.0.0)
  ret void
dispatch.closure.case.1:
  %closure.slot.1.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.1.0 = load %kira.bridge.value, ptr %closure.slot.1.0
  %closure.arg.1.0 = extractvalue %kira.bridge.value %closure.value.1.0, 2
  call void @"kira_fn_250_Graphics.destroyPipeline"(i64 %arg0, i64 %closure.arg.1.0)
  ret void
dispatch.default:
  unreachable
}

define void @"kira_callable_dispatch_83c614efdab68a73"(i64 %function_id, i64 %arg0) {
entry:
  %dispatch.is_direct = icmp ule i64 %function_id, 4294967295
  br i1 %dispatch.is_direct, label %dispatch.direct, label %dispatch.closure
dispatch.direct:
  switch i64 %function_id, label %dispatch.default [
    i64 2, label %dispatch.case.0
    i64 21, label %dispatch.case.1
    i64 27, label %dispatch.case.2
    i64 246, label %dispatch.case.3
    i64 257, label %dispatch.case.4
  ]
dispatch.case.0:
  call void @"kira_fn_2_graphicsApplicationDefaultFrame"(i64 %arg0)
  ret void
dispatch.case.1:
  call void @"kira_fn_21_sokolSubmitFrame"(i64 %arg0)
  ret void
dispatch.case.2:
  call void @"kira_fn_27_graphicsSubmitFrame"(i64 %arg0)
  ret void
dispatch.case.3:
  call void @"kira_fn_246_GraphicsFrame.requestQuit"(i64 %arg0)
  ret void
dispatch.case.4:
  call void @"kira_fn_257_main$callback_257"(i64 %arg0)
  ret void
dispatch.closure:
  %closure.ptr = inttoptr i64 %function_id to ptr
  %closure.id = load i64, ptr %closure.ptr
  %closure.slots = getelementptr inbounds i8, ptr %closure.ptr, i64 16
  switch i64 %closure.id, label %dispatch.default [
    i64 244, label %dispatch.closure.case.0
  ]
dispatch.closure.case.0:
  %closure.slot.0.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.0.0 = load %kira.bridge.value, ptr %closure.slot.0.0
  %closure.arg.0.0 = extractvalue %kira.bridge.value %closure.value.0.0, 2
  call void @"kira_fn_244_GraphicsFrame.endPass"(i64 %arg0, i64 %closure.arg.0.0)
  ret void
dispatch.default:
  unreachable
}

