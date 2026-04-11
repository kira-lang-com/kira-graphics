; ModuleID = "main"
source_filename = "main"
target triple = "x86_64-pc-windows-msvc"

%t.Application = type { %kira.string, i32, i32 }
%t.backend_state = type { %t.sg_shader, %t.sg_pipeline, i32, i32, i32, ptr, ptr, ptr }
%t.sapp_allocator = type { ptr, ptr, ptr }
%t.sapp_desc = type { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i32, i32, i8, i8, i8, ptr, i8, i32, i8, i32, i32, %t.sapp_icon_desc, %t.sapp_allocator, %t.sapp_logger, %t.sapp_gl_desc, %t.sapp_win32_desc, %t.sapp_html5_desc, %t.sapp_ios_desc }
%t.sapp_event = type { i64, i32, i32, i32, i8, i32, i32, float, float, float, float, float, float, i32, [8 x %t.sapp_touchpoint], i32, i32, i32, i32 }
%t.sapp_gl_desc = type { i32, i32 }
%t.sapp_html5_desc = type { ptr, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8 }
%t.sapp_icon_desc = type { i8, [8 x %t.sapp_image_desc] }
%t.sapp_image_desc = type { i32, i32, i32, i32, %t.sapp_range }
%t.sapp_ios_desc = type { i8 }
%t.sapp_logger = type { ptr, ptr }
%t.sapp_range = type { ptr, i64 }
%t.sapp_touchpoint = type { i64, float, float, i32, i8 }
%t.sapp_win32_desc = type { i8, i8, i8 }
%t.sg_allocator = type { ptr, ptr, ptr }
%t.sg_attachments = type { [8 x %t.sg_view], [8 x %t.sg_view], %t.sg_view }
%t.sg_blend_state = type { i8, i32, i32, i32, i32, i32, i32 }
%t.sg_color = type { float, float, float, float }
%t.sg_color_attachment_action = type { i32, i32, %t.sg_color }
%t.sg_color_target_state = type { i32, i32, %t.sg_blend_state }
%t.sg_d3d11_desc = type { i8 }
%t.sg_d3d11_environment = type { ptr, ptr }
%t.sg_d3d11_swapchain = type { ptr, ptr, ptr }
%t.sg_depth_attachment_action = type { i32, i32, float }
%t.sg_depth_state = type { i32, i32, i8, float, float, float }
%t.sg_desc = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i8, i8, %t.sg_d3d11_desc, %t.sg_metal_desc, %t.sg_wgpu_desc, %t.sg_vulkan_desc, %t.sg_allocator, %t.sg_logger, %t.sg_environment, i32 }
%t.sg_environment = type { %t.sg_environment_defaults, %t.sg_metal_environment, %t.sg_d3d11_environment, %t.sg_wgpu_environment, %t.sg_vulkan_environment }
%t.sg_environment_defaults = type { i32, i32, i32 }
%t.sg_gl_swapchain = type { i32 }
%t.sg_glsl_shader_uniform = type { i32, i16, ptr }
%t.sg_logger = type { ptr, ptr }
%t.sg_metal_desc = type { i8, i8 }
%t.sg_metal_environment = type { ptr }
%t.sg_metal_swapchain = type { ptr, ptr, ptr }
%t.sg_mtl_shader_threads_per_threadgroup = type { i32, i32, i32 }
%t.sg_pass = type { i32, i8, %t.sg_pass_action, %t.sg_attachments, %t.sg_swapchain, ptr, i32 }
%t.sg_pass_action = type { [8 x %t.sg_color_attachment_action], %t.sg_depth_attachment_action, %t.sg_stencil_attachment_action }
%t.sg_pipeline = type { i32 }
%t.sg_pipeline_desc = type { i32, i8, %t.sg_shader, %t.sg_vertex_layout_state, %t.sg_depth_state, %t.sg_stencil_state, i32, [8 x %t.sg_color_target_state], i32, i32, i32, i32, i32, %t.sg_color, i8, ptr, i32 }
%t.sg_range = type { ptr, i64 }
%t.sg_shader = type { i32 }
%t.sg_shader_desc = type { i32, %t.sg_shader_function, %t.sg_shader_function, %t.sg_shader_function, [16 x %t.sg_shader_vertex_attr], [8 x %t.sg_shader_uniform_block], [32 x %t.sg_shader_view], [12 x %t.sg_shader_sampler], [32 x %t.sg_shader_texture_sampler_pair], %t.sg_mtl_shader_threads_per_threadgroup, ptr, i32 }
%t.sg_shader_function = type { ptr, %t.sg_range, ptr, ptr, ptr }
%t.sg_shader_sampler = type { i32, i32, i8, i8, i8, i8 }
%t.sg_shader_storage_buffer_view = type { i32, i8, i8, i8, i8, i8, i8, i8 }
%t.sg_shader_storage_image_view = type { i32, i32, i32, i8, i8, i8, i8, i8, i8 }
%t.sg_shader_texture_sampler_pair = type { i32, i8, i8, ptr }
%t.sg_shader_texture_view = type { i32, i32, i32, i8, i8, i8, i8, i8 }
%t.sg_shader_uniform_block = type { i32, i32, i8, i8, i8, i8, i32, [16 x %t.sg_glsl_shader_uniform] }
%t.sg_shader_vertex_attr = type { i32, ptr, ptr, i8 }
%t.sg_shader_view = type { %t.sg_shader_texture_view, %t.sg_shader_storage_buffer_view, %t.sg_shader_storage_image_view }
%t.sg_stencil_attachment_action = type { i32, i32, i8 }
%t.sg_stencil_face_state = type { i32, i32, i32, i32 }
%t.sg_stencil_state = type { i8, %t.sg_stencil_face_state, %t.sg_stencil_face_state, i8, i8, i8 }
%t.sg_swapchain = type { i32, i32, i32, i32, i32, %t.sg_metal_swapchain, %t.sg_d3d11_swapchain, %t.sg_wgpu_swapchain, %t.sg_vulkan_swapchain, %t.sg_gl_swapchain }
%t.sg_vertex_attr_state = type { i32, i32, i32 }
%t.sg_vertex_buffer_layout_state = type { i32, i32, i32 }
%t.sg_vertex_layout_state = type { [8 x %t.sg_vertex_buffer_layout_state], [16 x %t.sg_vertex_attr_state] }
%t.sg_view = type { i32 }
%t.sg_vulkan_desc = type { i32, i32, i32 }
%t.sg_vulkan_environment = type { ptr, ptr, ptr, ptr, i32 }
%t.sg_vulkan_swapchain = type { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%t.sg_wgpu_desc = type { i8, i32 }
%t.sg_wgpu_environment = type { ptr }
%t.sg_wgpu_swapchain = type { ptr, ptr, ptr }
%t.Scene = type { %kira.string, %kira.string, %kira.string, i32 }

%kira.string = type { ptr, i64 }

@kira_bool_true_data = private unnamed_addr constant [5 x i8] c"true\00"
@kira_bool_true = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([5 x i8], ptr @kira_bool_true_data, i64 0, i64 0), i64 4 }
@kira_bool_false_data = private unnamed_addr constant [6 x i8] c"false\00"
@kira_bool_false = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([6 x i8], ptr @kira_bool_false_data, i64 0, i64 0), i64 5 }

declare void @"kira_native_print_i64"(i64)
declare void @"kira_native_print_string"(ptr, i64)
declare i32 @"sapp_height"()

declare void @"sapp_run"(ptr)

declare i32 @"sapp_width"()

declare void @"sg_apply_pipeline"(%t.sg_pipeline)

declare void @"sg_apply_viewport"(i32, i32, i32, i32, i1)

declare void @"sg_begin_pass"(ptr)

declare void @"sg_commit"()

declare void @"sg_destroy_pipeline"(%t.sg_pipeline)

declare void @"sg_destroy_shader"(%t.sg_shader)

declare void @"sg_draw"(i32, i32, i32)

declare void @"sg_end_pass"()

declare %t.sg_pipeline @"sg_make_pipeline"(ptr)

declare %t.sg_shader @"sg_make_shader"(ptr)

declare void @"sg_setup"(ptr)

declare void @"sg_shutdown"()

declare %t.sg_environment @"sglue_environment"()

declare %t.sg_swapchain @"sglue_swapchain"()



@kira_str_0_data = private unnamed_addr constant [23 x i8] c"Kira Graphics Triangle\00"

@kira_str_0 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([23 x i8], ptr @kira_str_0_data, i64 0, i64 0), i64 22 }

@kira_str_1_data = private unnamed_addr constant [371 x i8] c"#version 330\0Aout vec4 color;\0Aconst vec2 positions[3] = vec2[3](\0A    vec2(0.0, 0.55),\0A    vec2(0.55, -0.55),\0A    vec2(-0.55, -0.55)\0A);\0Aconst vec4 colors[3] = vec4[3](\0A    vec4(1.0, 0.25, 0.25, 1.0),\0A    vec4(0.25, 1.0, 0.35, 1.0),\0A    vec4(0.25, 0.45, 1.0, 1.0)\0A);\0Avoid main() {\0A    gl_Position = vec4(positions[gl_VertexID], 0.0, 1.0);\0A    color = colors[gl_VertexID];\0A}\00"

@kira_str_1 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([371 x i8], ptr @kira_str_1_data, i64 0, i64 0), i64 370 }

@kira_str_2_data = private unnamed_addr constant [89 x i8] c"#version 330\0Ain vec4 color;\0Aout vec4 frag_color;\0Avoid main() {\0A    frag_color = color;\0A}\00"

@kira_str_2 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([89 x i8], ptr @kira_str_2_data, i64 0, i64 0), i64 88 }

@kira_str_3_data = private unnamed_addr constant [15 x i8] c"basic-triangle\00"

@kira_str_3 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([15 x i8], ptr @kira_str_3_data, i64 0, i64 0), i64 14 }

@kira_str_4_data = private unnamed_addr constant [13 x i8] c"KiraGraphics\00"

@kira_str_4 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([13 x i8], ptr @kira_str_4_data, i64 0, i64 0), i64 12 }

@kira_str_5_data = private unnamed_addr constant [1 x i8] c"\00"

@kira_str_5 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([1 x i8], ptr @kira_str_5_data, i64 0, i64 0), i64 0 }

@kira_str_6_data = private unnamed_addr constant [1 x i8] c"\00"

@kira_str_6 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([1 x i8], ptr @kira_str_6_data, i64 0, i64 0), i64 0 }

@kira_str_7_data = private unnamed_addr constant [1 x i8] c"\00"

@kira_str_7 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([1 x i8], ptr @kira_str_7_data, i64 0, i64 0), i64 0 }


define void @"kira_fn_0_main"() {
entry:
  %local0 = alloca %t.Application
  store %t.Application zeroinitializer, ptr %local0
  %local1 = alloca %t.Scene
  store %t.Scene zeroinitializer, ptr %local1
  %r0 = call i64 @"kira_fn_1_application_default"()
  %r1 = ptrtoint ptr %local0 to i64
  %copy.dst.1 = inttoptr i64 %r1 to ptr
  %copy.src.0 = inttoptr i64 %r0 to ptr
  %copy.val.1 = load %t.Application, ptr %copy.src.0
  store %t.Application %copy.val.1, ptr %copy.dst.1
  %r2 = load %kira.string, ptr @kira_str_0
  %r3 = ptrtoint ptr %local0 to i64
  %field.base.4 = inttoptr i64 %r3 to ptr
  %field.ptr.4 = getelementptr inbounds %t.Application, ptr %field.base.4, i32 0, i32 0
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %store.ptr.2 = inttoptr i64 %r4 to ptr
  store %kira.string %r2, ptr %store.ptr.2
  %r5 = add i64 0, 640
  %r6 = ptrtoint ptr %local0 to i64
  %field.base.7 = inttoptr i64 %r6 to ptr
  %field.ptr.7 = getelementptr inbounds %t.Application, ptr %field.base.7, i32 0, i32 1
  %r7 = ptrtoint ptr %field.ptr.7 to i64
  %store.ptr.5 = inttoptr i64 %r7 to ptr
  %store.cast.5 = trunc i64 %r5 to i32
  store i32 %store.cast.5, ptr %store.ptr.5
  %r8 = add i64 0, 480
  %r9 = ptrtoint ptr %local0 to i64
  %field.base.10 = inttoptr i64 %r9 to ptr
  %field.ptr.10 = getelementptr inbounds %t.Application, ptr %field.base.10, i32 0, i32 2
  %r10 = ptrtoint ptr %field.ptr.10 to i64
  %store.ptr.8 = inttoptr i64 %r10 to ptr
  %store.cast.8 = trunc i64 %r8 to i32
  store i32 %store.cast.8, ptr %store.ptr.8
  %r11 = call i64 @"kira_fn_216_scene_default"()
  %r12 = ptrtoint ptr %local1 to i64
  %copy.dst.12 = inttoptr i64 %r12 to ptr
  %copy.src.11 = inttoptr i64 %r11 to ptr
  %copy.val.12 = load %t.Scene, ptr %copy.src.11
  store %t.Scene %copy.val.12, ptr %copy.dst.12
  %r13 = load %kira.string, ptr @kira_str_1
  %r14 = ptrtoint ptr %local1 to i64
  %field.base.15 = inttoptr i64 %r14 to ptr
  %field.ptr.15 = getelementptr inbounds %t.Scene, ptr %field.base.15, i32 0, i32 0
  %r15 = ptrtoint ptr %field.ptr.15 to i64
  %store.ptr.13 = inttoptr i64 %r15 to ptr
  store %kira.string %r13, ptr %store.ptr.13
  %r16 = load %kira.string, ptr @kira_str_2
  %r17 = ptrtoint ptr %local1 to i64
  %field.base.18 = inttoptr i64 %r17 to ptr
  %field.ptr.18 = getelementptr inbounds %t.Scene, ptr %field.base.18, i32 0, i32 1
  %r18 = ptrtoint ptr %field.ptr.18 to i64
  %store.ptr.16 = inttoptr i64 %r18 to ptr
  store %kira.string %r16, ptr %store.ptr.16
  %r19 = load %kira.string, ptr @kira_str_3
  %r20 = ptrtoint ptr %local1 to i64
  %field.base.21 = inttoptr i64 %r20 to ptr
  %field.ptr.21 = getelementptr inbounds %t.Scene, ptr %field.base.21, i32 0, i32 2
  %r21 = ptrtoint ptr %field.ptr.21 to i64
  %store.ptr.19 = inttoptr i64 %r21 to ptr
  store %kira.string %r19, ptr %store.ptr.19
  %r22 = add i64 0, 3
  %r23 = ptrtoint ptr %local1 to i64
  %field.base.24 = inttoptr i64 %r23 to ptr
  %field.ptr.24 = getelementptr inbounds %t.Scene, ptr %field.base.24, i32 0, i32 3
  %r24 = ptrtoint ptr %field.ptr.24 to i64
  %store.ptr.22 = inttoptr i64 %r24 to ptr
  %store.cast.22 = trunc i64 %r22 to i32
  store i32 %store.cast.22, ptr %store.ptr.22
  %r25 = ptrtoint ptr %local0 to i64
  %r26 = ptrtoint ptr %local1 to i64
  call void @"kira_fn_2_application_run"(i64 %r25, i64 %r26)
  ret void
}

define i64 @"kira_fn_1_application_default"() {
entry:
  %local0 = alloca %t.Application
  store %t.Application zeroinitializer, ptr %local0
  %r0 = load %kira.string, ptr @kira_str_4
  %r1 = ptrtoint ptr %local0 to i64
  %field.base.2 = inttoptr i64 %r1 to ptr
  %field.ptr.2 = getelementptr inbounds %t.Application, ptr %field.base.2, i32 0, i32 0
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %store.ptr.0 = inttoptr i64 %r2 to ptr
  store %kira.string %r0, ptr %store.ptr.0
  %r3 = add i64 0, 1280
  %r4 = ptrtoint ptr %local0 to i64
  %field.base.5 = inttoptr i64 %r4 to ptr
  %field.ptr.5 = getelementptr inbounds %t.Application, ptr %field.base.5, i32 0, i32 1
  %r5 = ptrtoint ptr %field.ptr.5 to i64
  %store.ptr.3 = inttoptr i64 %r5 to ptr
  %store.cast.3 = trunc i64 %r3 to i32
  store i32 %store.cast.3, ptr %store.ptr.3
  %r6 = add i64 0, 720
  %r7 = ptrtoint ptr %local0 to i64
  %field.base.8 = inttoptr i64 %r7 to ptr
  %field.ptr.8 = getelementptr inbounds %t.Application, ptr %field.base.8, i32 0, i32 2
  %r8 = ptrtoint ptr %field.ptr.8 to i64
  %store.ptr.6 = inttoptr i64 %r8 to ptr
  %store.cast.6 = trunc i64 %r6 to i32
  store i32 %store.cast.6, ptr %store.ptr.6
  %r9 = ptrtoint ptr %local0 to i64
  ret i64 %r9
}

define void @"kira_fn_2_application_run"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca %t.Application
  store %t.Application zeroinitializer, ptr %local0
  %local1 = alloca %t.Scene
  store %t.Scene zeroinitializer, ptr %local1
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = ptrtoint ptr %local0 to i64
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.Application, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %r2 = load %kira.string, ptr %load.ptr.2
  %r3 = ptrtoint ptr %local0 to i64
  %field.base.4 = inttoptr i64 %r3 to ptr
  %field.ptr.4 = getelementptr inbounds %t.Application, ptr %field.base.4, i32 0, i32 1
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %load.ptr.5 = inttoptr i64 %r4 to ptr
  %load.raw.5 = load i32, ptr %load.ptr.5
  %r5 = sext i32 %load.raw.5 to i64
  %r6 = ptrtoint ptr %local0 to i64
  %field.base.7 = inttoptr i64 %r6 to ptr
  %field.ptr.7 = getelementptr inbounds %t.Application, ptr %field.base.7, i32 0, i32 2
  %r7 = ptrtoint ptr %field.ptr.7 to i64
  %load.ptr.8 = inttoptr i64 %r7 to ptr
  %load.raw.8 = load i32, ptr %load.ptr.8
  %r8 = sext i32 %load.raw.8 to i64
  %r9 = ptrtoint ptr %local1 to i64
  %field.base.10 = inttoptr i64 %r9 to ptr
  %field.ptr.10 = getelementptr inbounds %t.Scene, ptr %field.base.10, i32 0, i32 0
  %r10 = ptrtoint ptr %field.ptr.10 to i64
  %load.ptr.11 = inttoptr i64 %r10 to ptr
  %r11 = load %kira.string, ptr %load.ptr.11
  %r12 = ptrtoint ptr %local1 to i64
  %field.base.13 = inttoptr i64 %r12 to ptr
  %field.ptr.13 = getelementptr inbounds %t.Scene, ptr %field.base.13, i32 0, i32 1
  %r13 = ptrtoint ptr %field.ptr.13 to i64
  %load.ptr.14 = inttoptr i64 %r13 to ptr
  %r14 = load %kira.string, ptr %load.ptr.14
  %r15 = ptrtoint ptr %local1 to i64
  %field.base.16 = inttoptr i64 %r15 to ptr
  %field.ptr.16 = getelementptr inbounds %t.Scene, ptr %field.base.16, i32 0, i32 2
  %r16 = ptrtoint ptr %field.ptr.16 to i64
  %load.ptr.17 = inttoptr i64 %r16 to ptr
  %r17 = load %kira.string, ptr %load.ptr.17
  %r18 = ptrtoint ptr %local1 to i64
  %field.base.19 = inttoptr i64 %r18 to ptr
  %field.ptr.19 = getelementptr inbounds %t.Scene, ptr %field.base.19, i32 0, i32 3
  %r19 = ptrtoint ptr %field.ptr.19 to i64
  %load.ptr.20 = inttoptr i64 %r19 to ptr
  %load.raw.20 = load i32, ptr %load.ptr.20
  %r20 = sext i32 %load.raw.20 to i64
  call void @"kira_fn_6_backend_run_application"(%kira.string %r2, i64 %r5, i64 %r8, %kira.string %r11, %kira.string %r14, %kira.string %r17, i64 %r20)
  ret void
}

define void @"kira_fn_3_backend_on_init"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local1 = alloca i64
  %local2 = alloca %t.sg_desc
  store %t.sg_desc zeroinitializer, ptr %local2
  %local3 = alloca %t.sg_shader_desc
  store %t.sg_shader_desc zeroinitializer, ptr %local3
  %local4 = alloca %t.sg_pipeline_desc
  store %t.sg_pipeline_desc zeroinitializer, ptr %local4
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  store i64 %r0, ptr %local1
  %call.int.1 = call i32 @"sapp_width"()
  %r1.sext = sext i32 %call.int.1 to i64
  %r1 = add i64 %r1.sext, 0
  %r2 = load i64, ptr %local1
  %field.base.3 = inttoptr i64 %r2 to ptr
  %field.ptr.3 = getelementptr inbounds %t.backend_state, ptr %field.base.3, i32 0, i32 2
  %r3 = ptrtoint ptr %field.ptr.3 to i64
  %store.ptr.1 = inttoptr i64 %r3 to ptr
  %store.cast.1 = trunc i64 %r1 to i32
  store i32 %store.cast.1, ptr %store.ptr.1
  %call.int.4 = call i32 @"sapp_height"()
  %r4.sext = sext i32 %call.int.4 to i64
  %r4 = add i64 %r4.sext, 0
  %r5 = load i64, ptr %local1
  %field.base.6 = inttoptr i64 %r5 to ptr
  %field.ptr.6 = getelementptr inbounds %t.backend_state, ptr %field.base.6, i32 0, i32 3
  %r6 = ptrtoint ptr %field.ptr.6 to i64
  %store.ptr.4 = inttoptr i64 %r6 to ptr
  %store.cast.4 = trunc i64 %r4 to i32
  store i32 %store.cast.4, ptr %store.ptr.4
  %call.struct.7 = call %t.sg_environment @"sglue_environment"()
  %call.ret.ptr.7 = alloca %t.sg_environment
  store %t.sg_environment %call.struct.7, ptr %call.ret.ptr.7
  %r7 = ptrtoint ptr %call.ret.ptr.7 to i64
  %r8 = ptrtoint ptr %local2 to i64
  %field.base.9 = inttoptr i64 %r8 to ptr
  %field.ptr.9 = getelementptr inbounds %t.sg_desc, ptr %field.base.9, i32 0, i32 17
  %r9 = ptrtoint ptr %field.ptr.9 to i64
  %copy.dst.9 = inttoptr i64 %r9 to ptr
  %copy.src.7 = inttoptr i64 %r7 to ptr
  %copy.val.9 = load %t.sg_environment, ptr %copy.src.7
  store %t.sg_environment %copy.val.9, ptr %copy.dst.9
  %r10 = ptrtoint ptr %local2 to i64
  %call.arg.190.0 = inttoptr i64 %r10 to ptr
  call void @"sg_setup"(ptr %call.arg.190.0)
  %r11 = load i64, ptr %local1
  %field.base.12 = inttoptr i64 %r11 to ptr
  %field.ptr.12 = getelementptr inbounds %t.backend_state, ptr %field.base.12, i32 0, i32 5
  %r12 = ptrtoint ptr %field.ptr.12 to i64
  %load.ptr.13 = inttoptr i64 %r12 to ptr
  %load.rawptr.13 = load ptr, ptr %load.ptr.13
  %r13 = ptrtoint ptr %load.rawptr.13 to i64
  %r14 = ptrtoint ptr %local3 to i64
  %field.base.15 = inttoptr i64 %r14 to ptr
  %field.ptr.15 = getelementptr inbounds %t.sg_shader_desc, ptr %field.base.15, i32 0, i32 1
  %r15 = ptrtoint ptr %field.ptr.15 to i64
  %field.base.16 = inttoptr i64 %r15 to ptr
  %field.ptr.16 = getelementptr inbounds %t.sg_shader_function, ptr %field.base.16, i32 0, i32 0
  %r16 = ptrtoint ptr %field.ptr.16 to i64
  %store.ptr.13 = inttoptr i64 %r16 to ptr
  %store.rawptr.13 = inttoptr i64 %r13 to ptr
  store ptr %store.rawptr.13, ptr %store.ptr.13
  %r17 = load i64, ptr %local1
  %field.base.18 = inttoptr i64 %r17 to ptr
  %field.ptr.18 = getelementptr inbounds %t.backend_state, ptr %field.base.18, i32 0, i32 6
  %r18 = ptrtoint ptr %field.ptr.18 to i64
  %load.ptr.19 = inttoptr i64 %r18 to ptr
  %load.rawptr.19 = load ptr, ptr %load.ptr.19
  %r19 = ptrtoint ptr %load.rawptr.19 to i64
  %r20 = ptrtoint ptr %local3 to i64
  %field.base.21 = inttoptr i64 %r20 to ptr
  %field.ptr.21 = getelementptr inbounds %t.sg_shader_desc, ptr %field.base.21, i32 0, i32 2
  %r21 = ptrtoint ptr %field.ptr.21 to i64
  %field.base.22 = inttoptr i64 %r21 to ptr
  %field.ptr.22 = getelementptr inbounds %t.sg_shader_function, ptr %field.base.22, i32 0, i32 0
  %r22 = ptrtoint ptr %field.ptr.22 to i64
  %store.ptr.19 = inttoptr i64 %r22 to ptr
  %store.rawptr.19 = inttoptr i64 %r19 to ptr
  store ptr %store.rawptr.19, ptr %store.ptr.19
  %r23 = load i64, ptr %local1
  %field.base.24 = inttoptr i64 %r23 to ptr
  %field.ptr.24 = getelementptr inbounds %t.backend_state, ptr %field.base.24, i32 0, i32 7
  %r24 = ptrtoint ptr %field.ptr.24 to i64
  %load.ptr.25 = inttoptr i64 %r24 to ptr
  %load.rawptr.25 = load ptr, ptr %load.ptr.25
  %r25 = ptrtoint ptr %load.rawptr.25 to i64
  %r26 = ptrtoint ptr %local3 to i64
  %field.base.27 = inttoptr i64 %r26 to ptr
  %field.ptr.27 = getelementptr inbounds %t.sg_shader_desc, ptr %field.base.27, i32 0, i32 10
  %r27 = ptrtoint ptr %field.ptr.27 to i64
  %store.ptr.25 = inttoptr i64 %r27 to ptr
  %store.rawptr.25 = inttoptr i64 %r25 to ptr
  store ptr %store.rawptr.25, ptr %store.ptr.25
  %r28 = ptrtoint ptr %local3 to i64
  %call.arg.128.0 = inttoptr i64 %r28 to ptr
  %call.struct.29 = call %t.sg_shader @"sg_make_shader"(ptr %call.arg.128.0)
  %call.ret.ptr.29 = alloca %t.sg_shader
  store %t.sg_shader %call.struct.29, ptr %call.ret.ptr.29
  %r29 = ptrtoint ptr %call.ret.ptr.29 to i64
  %r30 = load i64, ptr %local1
  %field.base.31 = inttoptr i64 %r30 to ptr
  %field.ptr.31 = getelementptr inbounds %t.backend_state, ptr %field.base.31, i32 0, i32 0
  %r31 = ptrtoint ptr %field.ptr.31 to i64
  %copy.dst.31 = inttoptr i64 %r31 to ptr
  %copy.src.29 = inttoptr i64 %r29 to ptr
  %copy.val.31 = load %t.sg_shader, ptr %copy.src.29
  store %t.sg_shader %copy.val.31, ptr %copy.dst.31
  %r32 = load i64, ptr %local1
  %field.base.33 = inttoptr i64 %r32 to ptr
  %field.ptr.33 = getelementptr inbounds %t.backend_state, ptr %field.base.33, i32 0, i32 0
  %r33 = ptrtoint ptr %field.ptr.33 to i64
  %r34 = ptrtoint ptr %local4 to i64
  %field.base.35 = inttoptr i64 %r34 to ptr
  %field.ptr.35 = getelementptr inbounds %t.sg_pipeline_desc, ptr %field.base.35, i32 0, i32 2
  %r35 = ptrtoint ptr %field.ptr.35 to i64
  %copy.dst.35 = inttoptr i64 %r35 to ptr
  %copy.src.33 = inttoptr i64 %r33 to ptr
  %copy.val.35 = load %t.sg_shader, ptr %copy.src.33
  store %t.sg_shader %copy.val.35, ptr %copy.dst.35
  %r36 = load i64, ptr %local1
  %field.base.37 = inttoptr i64 %r36 to ptr
  %field.ptr.37 = getelementptr inbounds %t.backend_state, ptr %field.base.37, i32 0, i32 7
  %r37 = ptrtoint ptr %field.ptr.37 to i64
  %load.ptr.38 = inttoptr i64 %r37 to ptr
  %load.rawptr.38 = load ptr, ptr %load.ptr.38
  %r38 = ptrtoint ptr %load.rawptr.38 to i64
  %r39 = ptrtoint ptr %local4 to i64
  %field.base.40 = inttoptr i64 %r39 to ptr
  %field.ptr.40 = getelementptr inbounds %t.sg_pipeline_desc, ptr %field.base.40, i32 0, i32 15
  %r40 = ptrtoint ptr %field.ptr.40 to i64
  %store.ptr.38 = inttoptr i64 %r40 to ptr
  %store.rawptr.38 = inttoptr i64 %r38 to ptr
  store ptr %store.rawptr.38, ptr %store.ptr.38
  %r41 = ptrtoint ptr %local4 to i64
  %call.arg.126.0 = inttoptr i64 %r41 to ptr
  %call.struct.42 = call %t.sg_pipeline @"sg_make_pipeline"(ptr %call.arg.126.0)
  %call.ret.ptr.42 = alloca %t.sg_pipeline
  store %t.sg_pipeline %call.struct.42, ptr %call.ret.ptr.42
  %r42 = ptrtoint ptr %call.ret.ptr.42 to i64
  %r43 = load i64, ptr %local1
  %field.base.44 = inttoptr i64 %r43 to ptr
  %field.ptr.44 = getelementptr inbounds %t.backend_state, ptr %field.base.44, i32 0, i32 1
  %r44 = ptrtoint ptr %field.ptr.44 to i64
  %copy.dst.44 = inttoptr i64 %r44 to ptr
  %copy.src.42 = inttoptr i64 %r42 to ptr
  %copy.val.44 = load %t.sg_pipeline, ptr %copy.src.42
  store %t.sg_pipeline %copy.val.44, ptr %copy.dst.44
  ret void
}

define void @"kira_fn_4_backend_on_frame"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local1 = alloca i64
  %local2 = alloca %t.sg_pass
  store %t.sg_pass zeroinitializer, ptr %local2
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  store i64 %r0, ptr %local1
  %call.int.1 = call i32 @"sapp_width"()
  %r1.sext = sext i32 %call.int.1 to i64
  %r1 = add i64 %r1.sext, 0
  %r2 = load i64, ptr %local1
  %field.base.3 = inttoptr i64 %r2 to ptr
  %field.ptr.3 = getelementptr inbounds %t.backend_state, ptr %field.base.3, i32 0, i32 2
  %r3 = ptrtoint ptr %field.ptr.3 to i64
  %store.ptr.1 = inttoptr i64 %r3 to ptr
  %store.cast.1 = trunc i64 %r1 to i32
  store i32 %store.cast.1, ptr %store.ptr.1
  %call.int.4 = call i32 @"sapp_height"()
  %r4.sext = sext i32 %call.int.4 to i64
  %r4 = add i64 %r4.sext, 0
  %r5 = load i64, ptr %local1
  %field.base.6 = inttoptr i64 %r5 to ptr
  %field.ptr.6 = getelementptr inbounds %t.backend_state, ptr %field.base.6, i32 0, i32 3
  %r6 = ptrtoint ptr %field.ptr.6 to i64
  %store.ptr.4 = inttoptr i64 %r6 to ptr
  %store.cast.4 = trunc i64 %r4 to i32
  store i32 %store.cast.4, ptr %store.ptr.4
  %call.struct.7 = call %t.sg_swapchain @"sglue_swapchain"()
  %call.ret.ptr.7 = alloca %t.sg_swapchain
  store %t.sg_swapchain %call.struct.7, ptr %call.ret.ptr.7
  %r7 = ptrtoint ptr %call.ret.ptr.7 to i64
  %r8 = ptrtoint ptr %local2 to i64
  %field.base.9 = inttoptr i64 %r8 to ptr
  %field.ptr.9 = getelementptr inbounds %t.sg_pass, ptr %field.base.9, i32 0, i32 4
  %r9 = ptrtoint ptr %field.ptr.9 to i64
  %copy.dst.9 = inttoptr i64 %r9 to ptr
  %copy.src.7 = inttoptr i64 %r7 to ptr
  %copy.val.9 = load %t.sg_swapchain, ptr %copy.src.7
  store %t.sg_swapchain %copy.val.9, ptr %copy.dst.9
  %r10 = ptrtoint ptr %local2 to i64
  %call.arg.77.0 = inttoptr i64 %r10 to ptr
  call void @"sg_begin_pass"(ptr %call.arg.77.0)
  %r11 = add i64 0, 0
  %r12 = add i64 0, 0
  %r13 = load i64, ptr %local1
  %field.base.14 = inttoptr i64 %r13 to ptr
  %field.ptr.14 = getelementptr inbounds %t.backend_state, ptr %field.base.14, i32 0, i32 2
  %r14 = ptrtoint ptr %field.ptr.14 to i64
  %load.ptr.15 = inttoptr i64 %r14 to ptr
  %load.raw.15 = load i32, ptr %load.ptr.15
  %r15 = sext i32 %load.raw.15 to i64
  %r16 = load i64, ptr %local1
  %field.base.17 = inttoptr i64 %r16 to ptr
  %field.ptr.17 = getelementptr inbounds %t.backend_state, ptr %field.base.17, i32 0, i32 3
  %r17 = ptrtoint ptr %field.ptr.17 to i64
  %load.ptr.18 = inttoptr i64 %r17 to ptr
  %load.raw.18 = load i32, ptr %load.ptr.18
  %r18 = sext i32 %load.raw.18 to i64
  %r19 = add i1 0, 1
  %call.arg.75.0 = trunc i64 %r11 to i32
  %call.arg.75.1 = trunc i64 %r12 to i32
  %call.arg.75.2 = trunc i64 %r15 to i32
  %call.arg.75.3 = trunc i64 %r18 to i32
  call void @"sg_apply_viewport"(i32 %call.arg.75.0, i32 %call.arg.75.1, i32 %call.arg.75.2, i32 %call.arg.75.3, i1 %r19)
  %r20 = load i64, ptr %local1
  %field.base.21 = inttoptr i64 %r20 to ptr
  %field.ptr.21 = getelementptr inbounds %t.backend_state, ptr %field.base.21, i32 0, i32 1
  %r21 = ptrtoint ptr %field.ptr.21 to i64
  %call.arg.ptr.71.0 = inttoptr i64 %r21 to ptr
  %call.arg.71.0 = load %t.sg_pipeline, ptr %call.arg.ptr.71.0
  call void @"sg_apply_pipeline"(%t.sg_pipeline %call.arg.71.0)
  %r22 = add i64 0, 0
  %r23 = load i64, ptr %local1
  %field.base.24 = inttoptr i64 %r23 to ptr
  %field.ptr.24 = getelementptr inbounds %t.backend_state, ptr %field.base.24, i32 0, i32 4
  %r24 = ptrtoint ptr %field.ptr.24 to i64
  %load.ptr.25 = inttoptr i64 %r24 to ptr
  %load.raw.25 = load i32, ptr %load.ptr.25
  %r25 = sext i32 %load.raw.25 to i64
  %r26 = add i64 0, 1
  %call.arg.101.0 = trunc i64 %r22 to i32
  %call.arg.101.1 = trunc i64 %r25 to i32
  %call.arg.101.2 = trunc i64 %r26 to i32
  call void @"sg_draw"(i32 %call.arg.101.0, i32 %call.arg.101.1, i32 %call.arg.101.2)
  call void @"sg_end_pass"()
  call void @"sg_commit"()
  ret void
}

define void @"kira_fn_5_backend_on_cleanup"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local1 = alloca i64
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  store i64 %r0, ptr %local1
  %r1 = load i64, ptr %local1
  %field.base.2 = inttoptr i64 %r1 to ptr
  %field.ptr.2 = getelementptr inbounds %t.backend_state, ptr %field.base.2, i32 0, i32 1
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %call.arg.ptr.95.0 = inttoptr i64 %r2 to ptr
  %call.arg.95.0 = load %t.sg_pipeline, ptr %call.arg.ptr.95.0
  call void @"sg_destroy_pipeline"(%t.sg_pipeline %call.arg.95.0)
  %r3 = load i64, ptr %local1
  %field.base.4 = inttoptr i64 %r3 to ptr
  %field.ptr.4 = getelementptr inbounds %t.backend_state, ptr %field.base.4, i32 0, i32 0
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %call.arg.ptr.97.0 = inttoptr i64 %r4 to ptr
  %call.arg.97.0 = load %t.sg_shader, ptr %call.arg.ptr.97.0
  call void @"sg_destroy_shader"(%t.sg_shader %call.arg.97.0)
  call void @"sg_shutdown"()
  ret void
}

define void @"kira_fn_6_backend_run_application"(%kira.string %arg0, i64 %arg1, i64 %arg2, %kira.string %arg3, %kira.string %arg4, %kira.string %arg5, i64 %arg6) {
entry:
  %local0 = alloca %kira.string
  %local1 = alloca i64
  %local2 = alloca i64
  %local3 = alloca %kira.string
  %local4 = alloca %kira.string
  %local5 = alloca %kira.string
  %local6 = alloca i64
  %local7 = alloca %t.backend_state
  store %t.backend_state zeroinitializer, ptr %local7
  %local8 = alloca %t.sapp_desc
  store %t.sapp_desc zeroinitializer, ptr %local8
  store %kira.string %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  store i64 %arg2, ptr %local2
  store %kira.string %arg3, ptr %local3
  store %kira.string %arg4, ptr %local4
  store %kira.string %arg5, ptr %local5
  store i64 %arg6, ptr %local6
  %r0 = add i64 0, 0
  %r1 = ptrtoint ptr %local7 to i64
  %field.base.2 = inttoptr i64 %r1 to ptr
  %field.ptr.2 = getelementptr inbounds %t.backend_state, ptr %field.base.2, i32 0, i32 2
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %store.ptr.0 = inttoptr i64 %r2 to ptr
  %store.cast.0 = trunc i64 %r0 to i32
  store i32 %store.cast.0, ptr %store.ptr.0
  %r3 = add i64 0, 0
  %r4 = ptrtoint ptr %local7 to i64
  %field.base.5 = inttoptr i64 %r4 to ptr
  %field.ptr.5 = getelementptr inbounds %t.backend_state, ptr %field.base.5, i32 0, i32 3
  %r5 = ptrtoint ptr %field.ptr.5 to i64
  %store.ptr.3 = inttoptr i64 %r5 to ptr
  %store.cast.3 = trunc i64 %r3 to i32
  store i32 %store.cast.3, ptr %store.ptr.3
  %r6 = load i64, ptr %local6
  %r7 = ptrtoint ptr %local7 to i64
  %field.base.8 = inttoptr i64 %r7 to ptr
  %field.ptr.8 = getelementptr inbounds %t.backend_state, ptr %field.base.8, i32 0, i32 4
  %r8 = ptrtoint ptr %field.ptr.8 to i64
  %store.ptr.6 = inttoptr i64 %r8 to ptr
  %store.cast.6 = trunc i64 %r6 to i32
  store i32 %store.cast.6, ptr %store.ptr.6
  %r9 = load %kira.string, ptr %local3
  %r10 = ptrtoint ptr %local7 to i64
  %field.base.11 = inttoptr i64 %r10 to ptr
  %field.ptr.11 = getelementptr inbounds %t.backend_state, ptr %field.base.11, i32 0, i32 5
  %r11 = ptrtoint ptr %field.ptr.11 to i64
  %store.ptr.9 = inttoptr i64 %r11 to ptr
  %store.cstr.9 = extractvalue %kira.string %r9, 0
  store ptr %store.cstr.9, ptr %store.ptr.9
  %r12 = load %kira.string, ptr %local4
  %r13 = ptrtoint ptr %local7 to i64
  %field.base.14 = inttoptr i64 %r13 to ptr
  %field.ptr.14 = getelementptr inbounds %t.backend_state, ptr %field.base.14, i32 0, i32 6
  %r14 = ptrtoint ptr %field.ptr.14 to i64
  %store.ptr.12 = inttoptr i64 %r14 to ptr
  %store.cstr.12 = extractvalue %kira.string %r12, 0
  store ptr %store.cstr.12, ptr %store.ptr.12
  %r15 = load %kira.string, ptr %local5
  %r16 = ptrtoint ptr %local7 to i64
  %field.base.17 = inttoptr i64 %r16 to ptr
  %field.ptr.17 = getelementptr inbounds %t.backend_state, ptr %field.base.17, i32 0, i32 7
  %r17 = ptrtoint ptr %field.ptr.17 to i64
  %store.ptr.15 = inttoptr i64 %r17 to ptr
  %store.cstr.15 = extractvalue %kira.string %r15, 0
  store ptr %store.cstr.15, ptr %store.ptr.15
  %r18 = ptrtoint ptr @"kira_fn_3_backend_on_init" to i64
  %r19 = ptrtoint ptr %local8 to i64
  %field.base.20 = inttoptr i64 %r19 to ptr
  %field.ptr.20 = getelementptr inbounds %t.sapp_desc, ptr %field.base.20, i32 0, i32 5
  %r20 = ptrtoint ptr %field.ptr.20 to i64
  %store.ptr.18 = inttoptr i64 %r20 to ptr
  %store.rawptr.18 = inttoptr i64 %r18 to ptr
  store ptr %store.rawptr.18, ptr %store.ptr.18
  %r21 = ptrtoint ptr @"kira_fn_4_backend_on_frame" to i64
  %r22 = ptrtoint ptr %local8 to i64
  %field.base.23 = inttoptr i64 %r22 to ptr
  %field.ptr.23 = getelementptr inbounds %t.sapp_desc, ptr %field.base.23, i32 0, i32 6
  %r23 = ptrtoint ptr %field.ptr.23 to i64
  %store.ptr.21 = inttoptr i64 %r23 to ptr
  %store.rawptr.21 = inttoptr i64 %r21 to ptr
  store ptr %store.rawptr.21, ptr %store.ptr.21
  %r24 = ptrtoint ptr @"kira_fn_5_backend_on_cleanup" to i64
  %r25 = ptrtoint ptr %local8 to i64
  %field.base.26 = inttoptr i64 %r25 to ptr
  %field.ptr.26 = getelementptr inbounds %t.sapp_desc, ptr %field.base.26, i32 0, i32 7
  %r26 = ptrtoint ptr %field.ptr.26 to i64
  %store.ptr.24 = inttoptr i64 %r26 to ptr
  %store.rawptr.24 = inttoptr i64 %r24 to ptr
  store ptr %store.rawptr.24, ptr %store.ptr.24
  %r27 = ptrtoint ptr %local7 to i64
  %r28 = ptrtoint ptr %local8 to i64
  %field.base.29 = inttoptr i64 %r28 to ptr
  %field.ptr.29 = getelementptr inbounds %t.sapp_desc, ptr %field.base.29, i32 0, i32 4
  %r29 = ptrtoint ptr %field.ptr.29 to i64
  %store.ptr.27 = inttoptr i64 %r29 to ptr
  %store.rawptr.27 = inttoptr i64 %r27 to ptr
  store ptr %store.rawptr.27, ptr %store.ptr.27
  %r30 = load i64, ptr %local1
  %r31 = ptrtoint ptr %local8 to i64
  %field.base.32 = inttoptr i64 %r31 to ptr
  %field.ptr.32 = getelementptr inbounds %t.sapp_desc, ptr %field.base.32, i32 0, i32 9
  %r32 = ptrtoint ptr %field.ptr.32 to i64
  %store.ptr.30 = inttoptr i64 %r32 to ptr
  %store.cast.30 = trunc i64 %r30 to i32
  store i32 %store.cast.30, ptr %store.ptr.30
  %r33 = load i64, ptr %local2
  %r34 = ptrtoint ptr %local8 to i64
  %field.base.35 = inttoptr i64 %r34 to ptr
  %field.ptr.35 = getelementptr inbounds %t.sapp_desc, ptr %field.base.35, i32 0, i32 10
  %r35 = ptrtoint ptr %field.ptr.35 to i64
  %store.ptr.33 = inttoptr i64 %r35 to ptr
  %store.cast.33 = trunc i64 %r33 to i32
  store i32 %store.cast.33, ptr %store.ptr.33
  %r36 = load %kira.string, ptr %local0
  %r37 = ptrtoint ptr %local8 to i64
  %field.base.38 = inttoptr i64 %r37 to ptr
  %field.ptr.38 = getelementptr inbounds %t.sapp_desc, ptr %field.base.38, i32 0, i32 16
  %r38 = ptrtoint ptr %field.ptr.38 to i64
  %store.ptr.36 = inttoptr i64 %r38 to ptr
  %store.cstr.36 = extractvalue %kira.string %r36, 0
  store ptr %store.cstr.36, ptr %store.ptr.36
  %r39 = ptrtoint ptr %local8 to i64
  %call.arg.46.0 = inttoptr i64 %r39 to ptr
  call void @"sapp_run"(ptr %call.arg.46.0)
  ret void
}

define i64 @"kira_fn_216_scene_default"() {
entry:
  %local0 = alloca %t.Scene
  store %t.Scene zeroinitializer, ptr %local0
  %r0 = load %kira.string, ptr @kira_str_5
  %r1 = ptrtoint ptr %local0 to i64
  %field.base.2 = inttoptr i64 %r1 to ptr
  %field.ptr.2 = getelementptr inbounds %t.Scene, ptr %field.base.2, i32 0, i32 0
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %store.ptr.0 = inttoptr i64 %r2 to ptr
  store %kira.string %r0, ptr %store.ptr.0
  %r3 = load %kira.string, ptr @kira_str_6
  %r4 = ptrtoint ptr %local0 to i64
  %field.base.5 = inttoptr i64 %r4 to ptr
  %field.ptr.5 = getelementptr inbounds %t.Scene, ptr %field.base.5, i32 0, i32 1
  %r5 = ptrtoint ptr %field.ptr.5 to i64
  %store.ptr.3 = inttoptr i64 %r5 to ptr
  store %kira.string %r3, ptr %store.ptr.3
  %r6 = load %kira.string, ptr @kira_str_7
  %r7 = ptrtoint ptr %local0 to i64
  %field.base.8 = inttoptr i64 %r7 to ptr
  %field.ptr.8 = getelementptr inbounds %t.Scene, ptr %field.base.8, i32 0, i32 2
  %r8 = ptrtoint ptr %field.ptr.8 to i64
  %store.ptr.6 = inttoptr i64 %r8 to ptr
  store %kira.string %r6, ptr %store.ptr.6
  %r9 = add i64 0, 3
  %r10 = ptrtoint ptr %local0 to i64
  %field.base.11 = inttoptr i64 %r10 to ptr
  %field.ptr.11 = getelementptr inbounds %t.Scene, ptr %field.base.11, i32 0, i32 3
  %r11 = ptrtoint ptr %field.ptr.11 to i64
  %store.ptr.9 = inttoptr i64 %r11 to ptr
  %store.cast.9 = trunc i64 %r9 to i32
  store i32 %store.cast.9, ptr %store.ptr.9
  %r12 = ptrtoint ptr %local0 to i64
  ret i64 %r12
}

define i32 @main() {
entry:
  call void @"kira_fn_0_main"()
  ret i32 0
}

