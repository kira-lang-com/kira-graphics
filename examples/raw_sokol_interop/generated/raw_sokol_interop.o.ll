; ModuleID = "main"
source_filename = "main"
target triple = "arm64-apple-macosx"

%t.sapp_event = type { i64, i32, i32, i32, i8, i32, i32, float, float, float, float, float, float, i32, [8 x %t.sapp_touchpoint], i32, i32, i32, i32 }
%t.sapp_touchpoint = type { i64, float, float, i32, i8 }
%t.sg_shader_function = type { ptr, %t.sg_range, ptr, ptr, ptr }
%t.sapp_logger = type { ptr, ptr }
%t.sg_vertex_attr_state = type { i32, i32, i32 }
%t.sapp_gl_desc = type { i32, i32 }
%t.sg_metal_desc = type { i8, i8 }
%t.sapp_html5_desc = type { ptr, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8 }
%t.sg_range = type { ptr, i64 }
%t.sg_shader_storage_image_view = type { i32, i32, i32, i8, i8, i8, i8, i8, i8 }
%t.RawSokolState = type { %t.sg_shader, %t.sg_pipeline }
%t.sg_color = type { float, float, float, float }
%t.sg_glsl_shader_uniform = type { i32, i16, ptr }
%t.sg_metal_environment = type { ptr }
%t.sg_shader_sampler = type { i32, i32, i8, i8, i8, i8 }
%t.sg_wgpu_desc = type { i8, i32 }
%t.sg_environment_defaults = type { i32, i32, i32 }
%t.sg_d3d11_environment = type { ptr, ptr }
%t.sg_environment = type { %t.sg_environment_defaults, %t.sg_metal_environment, %t.sg_d3d11_environment, %t.sg_wgpu_environment, %t.sg_vulkan_environment }
%t.sg_shader_view = type { %t.sg_shader_texture_view, %t.sg_shader_storage_buffer_view, %t.sg_shader_storage_image_view }
%t.sg_shader_vertex_attr = type { i32, ptr, ptr, i8 }
%t.sapp_desc = type { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i32, i32, i8, i8, i8, ptr, i8, i32, i8, i32, i32, %t.sapp_icon_desc, %t.sapp_allocator, %t.sapp_logger, %t.sapp_gl_desc, %t.sapp_win32_desc, %t.sapp_html5_desc, %t.sapp_ios_desc }
%t.sg_pipeline = type { i32 }
%t.sg_pipeline_desc = type { i32, i8, %t.sg_shader, %t.sg_vertex_layout_state, %t.sg_depth_state, %t.sg_stencil_state, i32, [8 x %t.sg_color_target_state], i32, i32, i32, i32, i32, %t.sg_color, i8, ptr, i32 }
%t.sapp_range = type { ptr, i64 }
%t.sg_shader_desc = type { i32, %t.sg_shader_function, %t.sg_shader_function, %t.sg_shader_function, [16 x %t.sg_shader_vertex_attr], [8 x %t.sg_shader_uniform_block], [32 x %t.sg_shader_view], [12 x %t.sg_shader_sampler], [32 x %t.sg_shader_texture_sampler_pair], %t.sg_mtl_shader_threads_per_threadgroup, ptr, i32 }
%t.sg_stencil_state = type { i8, %t.sg_stencil_face_state, %t.sg_stencil_face_state, i8, i8, i8 }
%t.sg_desc = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i8, i8, %t.sg_d3d11_desc, %t.sg_metal_desc, %t.sg_wgpu_desc, %t.sg_vulkan_desc, %t.sg_allocator, %t.sg_logger, %t.sg_environment, i32 }
%t.sg_shader_storage_buffer_view = type { i32, i8, i8, i8, i8, i8, i8, i8 }
%t.sg_d3d11_desc = type { i8 }
%t.sg_depth_state = type { i32, i32, i8, float, float, float }
%t.sapp_ios_desc = type { i8 }
%t.sg_shader = type { i32 }
%t.sg_mtl_shader_threads_per_threadgroup = type { i32, i32, i32 }
%t.sg_shader_texture_view = type { i32, i32, i32, i8, i8, i8, i8, i8 }
%t.sg_wgpu_environment = type { ptr }
%t.sg_allocator = type { ptr, ptr, ptr }
%t.sg_vertex_layout_state = type { [8 x %t.sg_vertex_buffer_layout_state], [16 x %t.sg_vertex_attr_state] }
%t.sg_shader_uniform_block = type { i32, i32, i8, i8, i8, i8, i32, [16 x %t.sg_glsl_shader_uniform] }
%t.sg_logger = type { ptr, ptr }
%t.sg_blend_state = type { i8, i32, i32, i32, i32, i32, i32 }
%t.sapp_win32_desc = type { i8, i8, i8 }
%t.sg_vulkan_environment = type { ptr, ptr, ptr, ptr, i32 }
%t.sapp_allocator = type { ptr, ptr, ptr }
%t.sapp_icon_desc = type { i8, [8 x %t.sapp_image_desc] }
%t.sapp_image_desc = type { i32, i32, i32, i32, %t.sapp_range }
%t.sg_vertex_buffer_layout_state = type { i32, i32, i32 }
%t.sg_shader_texture_sampler_pair = type { i32, i8, i8, ptr }
%t.sg_stencil_face_state = type { i32, i32, i32, i32 }
%t.sg_color_target_state = type { i32, i32, %t.sg_blend_state }
%t.sg_vulkan_desc = type { i32, i32, i32 }

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
define void @"kira_destroy_raw_ptr"(ptr %value) {
entry:
  call void @free(ptr %value)
  ret void
}
define void @"kira_release_contents_sapp_event"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sapp_event"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sapp_event"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sapp_touchpoint"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sapp_touchpoint"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sapp_touchpoint"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_shader_function"(ptr %value) {
entry:
  %release.field.1 = getelementptr inbounds %t.sg_shader_function, ptr %value, i32 0, i32 1
  call void @"kira_release_contents_sg_range"(ptr %release.field.1)
  ret void
}
define void @"kira_destroy_sg_shader_function"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_shader_function"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sapp_logger"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sapp_logger"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sapp_logger"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_vertex_attr_state"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_vertex_attr_state"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_vertex_attr_state"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sapp_gl_desc"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sapp_gl_desc"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sapp_gl_desc"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_metal_desc"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_metal_desc"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_metal_desc"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sapp_html5_desc"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sapp_html5_desc"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sapp_html5_desc"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_range"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_range"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_range"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_shader_storage_image_view"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_shader_storage_image_view"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_shader_storage_image_view"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_RawSokolState"(ptr %value) {
entry:
  %release.field.0 = getelementptr inbounds %t.RawSokolState, ptr %value, i32 0, i32 0
  call void @"kira_release_contents_sg_shader"(ptr %release.field.0)
  %release.field.1 = getelementptr inbounds %t.RawSokolState, ptr %value, i32 0, i32 1
  call void @"kira_release_contents_sg_pipeline"(ptr %release.field.1)
  ret void
}
define void @"kira_destroy_RawSokolState"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_RawSokolState"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_color"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_color"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_color"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_glsl_shader_uniform"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_glsl_shader_uniform"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_glsl_shader_uniform"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_metal_environment"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_metal_environment"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_metal_environment"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_shader_sampler"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_shader_sampler"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_shader_sampler"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_wgpu_desc"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_wgpu_desc"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_wgpu_desc"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_environment_defaults"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_environment_defaults"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_environment_defaults"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_d3d11_environment"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_d3d11_environment"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_d3d11_environment"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_environment"(ptr %value) {
entry:
  %release.field.0 = getelementptr inbounds %t.sg_environment, ptr %value, i32 0, i32 0
  call void @"kira_release_contents_sg_environment_defaults"(ptr %release.field.0)
  %release.field.1 = getelementptr inbounds %t.sg_environment, ptr %value, i32 0, i32 1
  call void @"kira_release_contents_sg_metal_environment"(ptr %release.field.1)
  %release.field.2 = getelementptr inbounds %t.sg_environment, ptr %value, i32 0, i32 2
  call void @"kira_release_contents_sg_d3d11_environment"(ptr %release.field.2)
  %release.field.3 = getelementptr inbounds %t.sg_environment, ptr %value, i32 0, i32 3
  call void @"kira_release_contents_sg_wgpu_environment"(ptr %release.field.3)
  %release.field.4 = getelementptr inbounds %t.sg_environment, ptr %value, i32 0, i32 4
  call void @"kira_release_contents_sg_vulkan_environment"(ptr %release.field.4)
  ret void
}
define void @"kira_destroy_sg_environment"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_environment"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_shader_view"(ptr %value) {
entry:
  %release.field.0 = getelementptr inbounds %t.sg_shader_view, ptr %value, i32 0, i32 0
  call void @"kira_release_contents_sg_shader_texture_view"(ptr %release.field.0)
  %release.field.1 = getelementptr inbounds %t.sg_shader_view, ptr %value, i32 0, i32 1
  call void @"kira_release_contents_sg_shader_storage_buffer_view"(ptr %release.field.1)
  %release.field.2 = getelementptr inbounds %t.sg_shader_view, ptr %value, i32 0, i32 2
  call void @"kira_release_contents_sg_shader_storage_image_view"(ptr %release.field.2)
  ret void
}
define void @"kira_destroy_sg_shader_view"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_shader_view"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_shader_vertex_attr"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_shader_vertex_attr"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_shader_vertex_attr"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sapp_desc"(ptr %value) {
entry:
  %release.field.22 = getelementptr inbounds %t.sapp_desc, ptr %value, i32 0, i32 22
  call void @"kira_release_contents_sapp_icon_desc"(ptr %release.field.22)
  %release.field.23 = getelementptr inbounds %t.sapp_desc, ptr %value, i32 0, i32 23
  call void @"kira_release_contents_sapp_allocator"(ptr %release.field.23)
  %release.field.24 = getelementptr inbounds %t.sapp_desc, ptr %value, i32 0, i32 24
  call void @"kira_release_contents_sapp_logger"(ptr %release.field.24)
  %release.field.25 = getelementptr inbounds %t.sapp_desc, ptr %value, i32 0, i32 25
  call void @"kira_release_contents_sapp_gl_desc"(ptr %release.field.25)
  %release.field.26 = getelementptr inbounds %t.sapp_desc, ptr %value, i32 0, i32 26
  call void @"kira_release_contents_sapp_win32_desc"(ptr %release.field.26)
  %release.field.27 = getelementptr inbounds %t.sapp_desc, ptr %value, i32 0, i32 27
  call void @"kira_release_contents_sapp_html5_desc"(ptr %release.field.27)
  %release.field.28 = getelementptr inbounds %t.sapp_desc, ptr %value, i32 0, i32 28
  call void @"kira_release_contents_sapp_ios_desc"(ptr %release.field.28)
  ret void
}
define void @"kira_destroy_sapp_desc"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sapp_desc"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_pipeline"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_pipeline"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_pipeline"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_pipeline_desc"(ptr %value) {
entry:
  %release.field.2 = getelementptr inbounds %t.sg_pipeline_desc, ptr %value, i32 0, i32 2
  call void @"kira_release_contents_sg_shader"(ptr %release.field.2)
  %release.field.3 = getelementptr inbounds %t.sg_pipeline_desc, ptr %value, i32 0, i32 3
  call void @"kira_release_contents_sg_vertex_layout_state"(ptr %release.field.3)
  %release.field.4 = getelementptr inbounds %t.sg_pipeline_desc, ptr %value, i32 0, i32 4
  call void @"kira_release_contents_sg_depth_state"(ptr %release.field.4)
  %release.field.5 = getelementptr inbounds %t.sg_pipeline_desc, ptr %value, i32 0, i32 5
  call void @"kira_release_contents_sg_stencil_state"(ptr %release.field.5)
  %release.field.13 = getelementptr inbounds %t.sg_pipeline_desc, ptr %value, i32 0, i32 13
  call void @"kira_release_contents_sg_color"(ptr %release.field.13)
  ret void
}
define void @"kira_destroy_sg_pipeline_desc"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_pipeline_desc"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sapp_range"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sapp_range"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sapp_range"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_shader_desc"(ptr %value) {
entry:
  %release.field.1 = getelementptr inbounds %t.sg_shader_desc, ptr %value, i32 0, i32 1
  call void @"kira_release_contents_sg_shader_function"(ptr %release.field.1)
  %release.field.2 = getelementptr inbounds %t.sg_shader_desc, ptr %value, i32 0, i32 2
  call void @"kira_release_contents_sg_shader_function"(ptr %release.field.2)
  %release.field.3 = getelementptr inbounds %t.sg_shader_desc, ptr %value, i32 0, i32 3
  call void @"kira_release_contents_sg_shader_function"(ptr %release.field.3)
  %release.field.9 = getelementptr inbounds %t.sg_shader_desc, ptr %value, i32 0, i32 9
  call void @"kira_release_contents_sg_mtl_shader_threads_per_threadgroup"(ptr %release.field.9)
  ret void
}
define void @"kira_destroy_sg_shader_desc"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_shader_desc"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_stencil_state"(ptr %value) {
entry:
  %release.field.1 = getelementptr inbounds %t.sg_stencil_state, ptr %value, i32 0, i32 1
  call void @"kira_release_contents_sg_stencil_face_state"(ptr %release.field.1)
  %release.field.2 = getelementptr inbounds %t.sg_stencil_state, ptr %value, i32 0, i32 2
  call void @"kira_release_contents_sg_stencil_face_state"(ptr %release.field.2)
  ret void
}
define void @"kira_destroy_sg_stencil_state"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_stencil_state"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_desc"(ptr %value) {
entry:
  %release.field.11 = getelementptr inbounds %t.sg_desc, ptr %value, i32 0, i32 11
  call void @"kira_release_contents_sg_d3d11_desc"(ptr %release.field.11)
  %release.field.12 = getelementptr inbounds %t.sg_desc, ptr %value, i32 0, i32 12
  call void @"kira_release_contents_sg_metal_desc"(ptr %release.field.12)
  %release.field.13 = getelementptr inbounds %t.sg_desc, ptr %value, i32 0, i32 13
  call void @"kira_release_contents_sg_wgpu_desc"(ptr %release.field.13)
  %release.field.14 = getelementptr inbounds %t.sg_desc, ptr %value, i32 0, i32 14
  call void @"kira_release_contents_sg_vulkan_desc"(ptr %release.field.14)
  %release.field.15 = getelementptr inbounds %t.sg_desc, ptr %value, i32 0, i32 15
  call void @"kira_release_contents_sg_allocator"(ptr %release.field.15)
  %release.field.16 = getelementptr inbounds %t.sg_desc, ptr %value, i32 0, i32 16
  call void @"kira_release_contents_sg_logger"(ptr %release.field.16)
  %release.field.17 = getelementptr inbounds %t.sg_desc, ptr %value, i32 0, i32 17
  call void @"kira_release_contents_sg_environment"(ptr %release.field.17)
  ret void
}
define void @"kira_destroy_sg_desc"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_desc"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_shader_storage_buffer_view"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_shader_storage_buffer_view"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_shader_storage_buffer_view"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_d3d11_desc"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_d3d11_desc"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_d3d11_desc"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_depth_state"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_depth_state"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_depth_state"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sapp_ios_desc"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sapp_ios_desc"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sapp_ios_desc"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_shader"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_shader"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_shader"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_mtl_shader_threads_per_threadgroup"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_mtl_shader_threads_per_threadgroup"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_mtl_shader_threads_per_threadgroup"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_shader_texture_view"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_shader_texture_view"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_shader_texture_view"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_wgpu_environment"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_wgpu_environment"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_wgpu_environment"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_allocator"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_allocator"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_allocator"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_vertex_layout_state"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_vertex_layout_state"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_vertex_layout_state"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_shader_uniform_block"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_shader_uniform_block"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_shader_uniform_block"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_logger"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_logger"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_logger"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_blend_state"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_blend_state"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_blend_state"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sapp_win32_desc"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sapp_win32_desc"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sapp_win32_desc"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_vulkan_environment"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_vulkan_environment"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_vulkan_environment"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sapp_allocator"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sapp_allocator"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sapp_allocator"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sapp_icon_desc"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sapp_icon_desc"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sapp_icon_desc"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sapp_image_desc"(ptr %value) {
entry:
  %release.field.4 = getelementptr inbounds %t.sapp_image_desc, ptr %value, i32 0, i32 4
  call void @"kira_release_contents_sapp_range"(ptr %release.field.4)
  ret void
}
define void @"kira_destroy_sapp_image_desc"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sapp_image_desc"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_vertex_buffer_layout_state"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_vertex_buffer_layout_state"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_vertex_buffer_layout_state"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_shader_texture_sampler_pair"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_shader_texture_sampler_pair"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_shader_texture_sampler_pair"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_stencil_face_state"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_stencil_face_state"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_stencil_face_state"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_color_target_state"(ptr %value) {
entry:
  %release.field.2 = getelementptr inbounds %t.sg_color_target_state, ptr %value, i32 0, i32 2
  call void @"kira_release_contents_sg_blend_state"(ptr %release.field.2)
  ret void
}
define void @"kira_destroy_sg_color_target_state"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_color_target_state"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_sg_vulkan_desc"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_sg_vulkan_desc"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_sg_vulkan_desc"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}

declare void @"kg_begin_swapchain_pass"(float, float, float, float)

declare i32 @"sapp_height"()

declare void @"sapp_request_quit"()

declare void @"sapp_run"(ptr)

declare i32 @"sapp_width"()

declare void @"sg_apply_pipeline"(i32)

declare void @"sg_apply_viewport"(i32, i32, i32, i32, i1)

declare void @"sg_commit"()

declare void @"sg_destroy_pipeline"(i32)

declare void @"sg_destroy_shader"(i32)

declare void @"sg_draw"(i32, i32, i32)

declare void @"sg_end_pass"()

declare i32 @"sg_make_pipeline"(ptr)

declare i32 @"sg_make_shader"(ptr)

declare void @"sg_setup"(ptr)

declare void @"sg_shutdown"()

declare i704 @"sglue_environment"()



@kira_str_0_data = private unnamed_addr constant [234 x i8] c"#version 330 core\0Aout vec4 color;\0Avec2 positions[3] = vec2[3](vec2(0.0, 0.55), vec2(0.55, -0.55), vec2(-0.55, -0.55));\0Avoid main() {\0A    gl_Position = vec4(positions[gl_VertexID], 0.0, 1.0);\0A    color = vec4(1.0, 0.95, 0.85, 1.0);\0A}\0A\00"

@kira_str_0 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([234 x i8], ptr @kira_str_0_data, i64 0, i64 0), i64 233 }

@kira_str_1_data = private unnamed_addr constant [95 x i8] c"#version 330 core\0Ain vec4 color;\0Aout vec4 frag_color;\0Avoid main() {\0A    frag_color = color;\0A}\0A\00"

@kira_str_1 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([95 x i8], ptr @kira_str_1_data, i64 0, i64 0), i64 94 }

@kira_str_2_data = private unnamed_addr constant [26 x i8] c"raw-sokol-triangle-shader\00"

@kira_str_2 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([26 x i8], ptr @kira_str_2_data, i64 0, i64 0), i64 25 }

@kira_str_3_data = private unnamed_addr constant [28 x i8] c"raw-sokol-triangle-pipeline\00"

@kira_str_3 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([28 x i8], ptr @kira_str_3_data, i64 0, i64 0), i64 27 }

@kira_str_4_data = private unnamed_addr constant [32 x i8] c"Kira Graphics Raw Sokol Interop\00"

@kira_str_4 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([32 x i8], ptr @kira_str_4_data, i64 0, i64 0), i64 31 }


define %kira.string @"kira_fn_1_rawTriangleVertexSource"() {
entry:
  %r0 = load %kira.string, ptr @kira_str_0
  ret %kira.string %r0
}

define %kira.string @"kira_fn_2_rawTriangleFragmentSource"() {
entry:
  %r0 = load %kira.string, ptr @kira_str_1
  ret %kira.string %r0
}

define void @"kira_fn_3_rawSokolInit"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local1 = alloca i64
  %local2 = alloca i64
  %local.storage.2 = alloca %t.sg_desc
  store %t.sg_desc zeroinitializer, ptr %local.storage.2
  %local.storage.int.2 = ptrtoint ptr %local.storage.2 to i64
  store i64 %local.storage.int.2, ptr %local2
  %local3 = alloca i64
  %local.storage.3 = alloca %t.sg_shader_desc
  store %t.sg_shader_desc zeroinitializer, ptr %local.storage.3
  %local.storage.int.3 = ptrtoint ptr %local.storage.3 to i64
  store i64 %local.storage.int.3, ptr %local3
  %local4 = alloca i64
  %local.storage.4 = alloca %t.sg_pipeline_desc
  store %t.sg_pipeline_desc zeroinitializer, ptr %local.storage.4
  %local.storage.int.4 = ptrtoint ptr %local.storage.4 to i64
  store i64 %local.storage.int.4, ptr %local4
  %cleanup.heap.slot.2 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.2
  %cleanup.heap.slot.3 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.3
  %cleanup.heap.slot.5 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.5
  %cleanup.heap.slot.6 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.6
  %cleanup.heap.slot.7 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.7
  %cleanup.heap.slot.8 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.8
  %cleanup.heap.slot.12 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.12
  %cleanup.heap.slot.18 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.18
  %cleanup.heap.slot.19 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.19
  %cleanup.heap.slot.20 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.20
  %cleanup.heap.slot.22 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.22
  %cleanup.heap.slot.24 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.24
  %cleanup.heap.slot.28 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.28
  %cleanup.heap.slot.29 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.29
  %cleanup.heap.slot.30 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.30
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %native.recover.state.1 = inttoptr i64 %r0 to ptr
  %native.recover.payload.1 = call ptr @"kira_native_state_recover"(ptr %native.recover.state.1, i64 2254967578164254324)
  %r1 = ptrtoint ptr %native.recover.payload.1 to i64
  store i64 %r1, ptr %local1
  %alloc.size.ptr.2 = getelementptr %t.sg_desc, ptr null, i32 1
  %alloc.size.2 = ptrtoint ptr %alloc.size.ptr.2 to i64
  %alloc.empty.2 = icmp eq i64 %alloc.size.2, 0
  %alloc.bytes.2 = select i1 %alloc.empty.2, i64 1, i64 %alloc.size.2
  %alloc.ptr.2 = call ptr @malloc(i64 %alloc.bytes.2)
  store %t.sg_desc zeroinitializer, ptr %alloc.ptr.2
  %r2 = ptrtoint ptr %alloc.ptr.2 to i64
  store ptr %alloc.ptr.2, ptr %cleanup.heap.slot.2
  %call.struct.3 = call i704 @"sglue_environment"()
  %call.ret.ptr.3 = alloca %t.sg_environment
  store i704 %call.struct.3, ptr %call.ret.ptr.3
  %r3 = ptrtoint ptr %call.ret.ptr.3 to i64
  %field.base.4 = inttoptr i64 %r2 to ptr
  %field.ptr.4 = getelementptr inbounds %t.sg_desc, ptr %field.base.4, i32 0, i32 17
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %copy.dst.4 = inttoptr i64 %r4 to ptr
  %copy.src.3 = inttoptr i64 %r3 to ptr
  %copy.val.4 = load %t.sg_environment, ptr %copy.src.3
  store %t.sg_environment %copy.val.4, ptr %copy.dst.4
  %r5 = load i64, ptr %local2
  %copy.dst.5 = inttoptr i64 %r5 to ptr
  %copy.src.2 = inttoptr i64 %r2 to ptr
  %copy.val.5 = load %t.sg_desc, ptr %copy.src.2
  store %t.sg_desc %copy.val.5, ptr %copy.dst.5
  %r6 = load i64, ptr %local2
  %call.arg.380.0 = inttoptr i64 %r6 to ptr
  call void @"sg_setup"(ptr %call.arg.380.0)
  %alloc.size.ptr.7 = getelementptr %t.sg_shader_desc, ptr null, i32 1
  %alloc.size.7 = ptrtoint ptr %alloc.size.ptr.7 to i64
  %alloc.empty.7 = icmp eq i64 %alloc.size.7, 0
  %alloc.bytes.7 = select i1 %alloc.empty.7, i64 1, i64 %alloc.size.7
  %alloc.ptr.7 = call ptr @malloc(i64 %alloc.bytes.7)
  store %t.sg_shader_desc zeroinitializer, ptr %alloc.ptr.7
  %r7 = ptrtoint ptr %alloc.ptr.7 to i64
  store ptr %alloc.ptr.7, ptr %cleanup.heap.slot.7
  %alloc.size.ptr.8 = getelementptr %t.sg_shader_function, ptr null, i32 1
  %alloc.size.8 = ptrtoint ptr %alloc.size.ptr.8 to i64
  %alloc.empty.8 = icmp eq i64 %alloc.size.8, 0
  %alloc.bytes.8 = select i1 %alloc.empty.8, i64 1, i64 %alloc.size.8
  %alloc.ptr.8 = call ptr @malloc(i64 %alloc.bytes.8)
  store %t.sg_shader_function zeroinitializer, ptr %alloc.ptr.8
  %r8 = ptrtoint ptr %alloc.ptr.8 to i64
  store ptr %alloc.ptr.8, ptr %cleanup.heap.slot.8
  %r9 = call %kira.string @"kira_fn_1_rawTriangleVertexSource"()
  %field.base.10 = inttoptr i64 %r8 to ptr
  %field.ptr.10 = getelementptr inbounds %t.sg_shader_function, ptr %field.base.10, i32 0, i32 0
  %r10 = ptrtoint ptr %field.ptr.10 to i64
  %store.ptr.9 = inttoptr i64 %r10 to ptr
  %store.cstr.9 = extractvalue %kira.string %r9, 0
  store ptr %store.cstr.9, ptr %store.ptr.9
  %field.base.11 = inttoptr i64 %r7 to ptr
  %field.ptr.11 = getelementptr inbounds %t.sg_shader_desc, ptr %field.base.11, i32 0, i32 1
  %r11 = ptrtoint ptr %field.ptr.11 to i64
  %copy.dst.11 = inttoptr i64 %r11 to ptr
  %copy.src.8 = inttoptr i64 %r8 to ptr
  %copy.val.11 = load %t.sg_shader_function, ptr %copy.src.8
  store %t.sg_shader_function %copy.val.11, ptr %copy.dst.11
  %alloc.size.ptr.12 = getelementptr %t.sg_shader_function, ptr null, i32 1
  %alloc.size.12 = ptrtoint ptr %alloc.size.ptr.12 to i64
  %alloc.empty.12 = icmp eq i64 %alloc.size.12, 0
  %alloc.bytes.12 = select i1 %alloc.empty.12, i64 1, i64 %alloc.size.12
  %alloc.ptr.12 = call ptr @malloc(i64 %alloc.bytes.12)
  store %t.sg_shader_function zeroinitializer, ptr %alloc.ptr.12
  %r12 = ptrtoint ptr %alloc.ptr.12 to i64
  store ptr %alloc.ptr.12, ptr %cleanup.heap.slot.12
  %r13 = call %kira.string @"kira_fn_2_rawTriangleFragmentSource"()
  %field.base.14 = inttoptr i64 %r12 to ptr
  %field.ptr.14 = getelementptr inbounds %t.sg_shader_function, ptr %field.base.14, i32 0, i32 0
  %r14 = ptrtoint ptr %field.ptr.14 to i64
  %store.ptr.13 = inttoptr i64 %r14 to ptr
  %store.cstr.13 = extractvalue %kira.string %r13, 0
  store ptr %store.cstr.13, ptr %store.ptr.13
  %field.base.15 = inttoptr i64 %r7 to ptr
  %field.ptr.15 = getelementptr inbounds %t.sg_shader_desc, ptr %field.base.15, i32 0, i32 2
  %r15 = ptrtoint ptr %field.ptr.15 to i64
  %copy.dst.15 = inttoptr i64 %r15 to ptr
  %copy.src.12 = inttoptr i64 %r12 to ptr
  %copy.val.15 = load %t.sg_shader_function, ptr %copy.src.12
  store %t.sg_shader_function %copy.val.15, ptr %copy.dst.15
  %r16 = load %kira.string, ptr @kira_str_2
  %field.base.17 = inttoptr i64 %r7 to ptr
  %field.ptr.17 = getelementptr inbounds %t.sg_shader_desc, ptr %field.base.17, i32 0, i32 10
  %r17 = ptrtoint ptr %field.ptr.17 to i64
  %store.ptr.16 = inttoptr i64 %r17 to ptr
  %store.cstr.16 = extractvalue %kira.string %r16, 0
  store ptr %store.cstr.16, ptr %store.ptr.16
  %r18 = load i64, ptr %local3
  %copy.dst.18 = inttoptr i64 %r18 to ptr
  %copy.src.7 = inttoptr i64 %r7 to ptr
  %copy.val.18 = load %t.sg_shader_desc, ptr %copy.src.7
  store %t.sg_shader_desc %copy.val.18, ptr %copy.dst.18
  %r19 = load i64, ptr %local3
  %call.arg.318.0 = inttoptr i64 %r19 to ptr
  %call.struct.20 = call i32 @"sg_make_shader"(ptr %call.arg.318.0)
  %call.ret.ptr.20 = alloca %t.sg_shader
  store i32 %call.struct.20, ptr %call.ret.ptr.20
  %r20 = ptrtoint ptr %call.ret.ptr.20 to i64
  %r21 = load i64, ptr %local1
  %native.state.set.ptr.20 = inttoptr i64 %r21 to ptr
  %native.state.set.slot.20 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.20, i64 0
  %native.state.set.pack.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %native.state.set.struct.src.0 = inttoptr i64 %r20 to ptr
  %native.state.set.struct.value.0 = load %t.sg_shader, ptr %native.state.set.struct.src.0
  %native.state.set.struct.size.ptr.0 = getelementptr %t.sg_shader, ptr null, i32 1
  %native.state.set.struct.size.0 = ptrtoint ptr %native.state.set.struct.size.ptr.0 to i64
  %native.state.set.struct.copy.0 = call ptr @malloc(i64 %native.state.set.struct.size.0)
  store %t.sg_shader %native.state.set.struct.value.0, ptr %native.state.set.struct.copy.0
  %native.state.set.struct.ptrint.0 = ptrtoint ptr %native.state.set.struct.copy.0 to i64
  %native.state.set.pack.0 = insertvalue %kira.bridge.value %native.state.set.pack.0.0, i64 %native.state.set.struct.ptrint.0, 2
  store %kira.bridge.value %native.state.set.pack.0, ptr %native.state.set.slot.20
  %alloc.size.ptr.22 = getelementptr %t.sg_pipeline_desc, ptr null, i32 1
  %alloc.size.22 = ptrtoint ptr %alloc.size.ptr.22 to i64
  %alloc.empty.22 = icmp eq i64 %alloc.size.22, 0
  %alloc.bytes.22 = select i1 %alloc.empty.22, i64 1, i64 %alloc.size.22
  %alloc.ptr.22 = call ptr @malloc(i64 %alloc.bytes.22)
  store %t.sg_pipeline_desc zeroinitializer, ptr %alloc.ptr.22
  %r22 = ptrtoint ptr %alloc.ptr.22 to i64
  store ptr %alloc.ptr.22, ptr %cleanup.heap.slot.22
  %r23 = load i64, ptr %local1
  %native.state.get.ptr.24 = inttoptr i64 %r23 to ptr
  %native.state.get.slot.24 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.24, i64 0
  %native.state.get.val.1 = load %kira.bridge.value, ptr %native.state.get.slot.24
  %r24 = extractvalue %kira.bridge.value %native.state.get.val.1, 2
  %field.base.25 = inttoptr i64 %r22 to ptr
  %field.ptr.25 = getelementptr inbounds %t.sg_pipeline_desc, ptr %field.base.25, i32 0, i32 2
  %r25 = ptrtoint ptr %field.ptr.25 to i64
  %copy.dst.25 = inttoptr i64 %r25 to ptr
  %copy.src.24 = inttoptr i64 %r24 to ptr
  %copy.val.25 = load %t.sg_shader, ptr %copy.src.24
  store %t.sg_shader %copy.val.25, ptr %copy.dst.25
  %r26 = load %kira.string, ptr @kira_str_3
  %field.base.27 = inttoptr i64 %r22 to ptr
  %field.ptr.27 = getelementptr inbounds %t.sg_pipeline_desc, ptr %field.base.27, i32 0, i32 15
  %r27 = ptrtoint ptr %field.ptr.27 to i64
  %store.ptr.26 = inttoptr i64 %r27 to ptr
  %store.cstr.26 = extractvalue %kira.string %r26, 0
  store ptr %store.cstr.26, ptr %store.ptr.26
  %r28 = load i64, ptr %local4
  %copy.dst.28 = inttoptr i64 %r28 to ptr
  %copy.src.22 = inttoptr i64 %r22 to ptr
  %copy.val.28 = load %t.sg_pipeline_desc, ptr %copy.src.22
  store %t.sg_pipeline_desc %copy.val.28, ptr %copy.dst.28
  %r29 = load i64, ptr %local4
  %call.arg.316.0 = inttoptr i64 %r29 to ptr
  %call.struct.30 = call i32 @"sg_make_pipeline"(ptr %call.arg.316.0)
  %call.ret.ptr.30 = alloca %t.sg_pipeline
  store i32 %call.struct.30, ptr %call.ret.ptr.30
  %r30 = ptrtoint ptr %call.ret.ptr.30 to i64
  %r31 = load i64, ptr %local1
  %native.state.set.ptr.30 = inttoptr i64 %r31 to ptr
  %native.state.set.slot.30 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.30, i64 1
  %native.state.set.pack.2.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %native.state.set.struct.src.2 = inttoptr i64 %r30 to ptr
  %native.state.set.struct.value.2 = load %t.sg_pipeline, ptr %native.state.set.struct.src.2
  %native.state.set.struct.size.ptr.2 = getelementptr %t.sg_pipeline, ptr null, i32 1
  %native.state.set.struct.size.2 = ptrtoint ptr %native.state.set.struct.size.ptr.2 to i64
  %native.state.set.struct.copy.2 = call ptr @malloc(i64 %native.state.set.struct.size.2)
  store %t.sg_pipeline %native.state.set.struct.value.2, ptr %native.state.set.struct.copy.2
  %native.state.set.struct.ptrint.2 = ptrtoint ptr %native.state.set.struct.copy.2 to i64
  %native.state.set.pack.2 = insertvalue %kira.bridge.value %native.state.set.pack.2.0, i64 %native.state.set.struct.ptrint.2, 2
  store %kira.bridge.value %native.state.set.pack.2, ptr %native.state.set.slot.30
  %cleanup.heap.ptr.3 = load ptr, ptr %cleanup.heap.slot.2
  call void @free(ptr %cleanup.heap.ptr.3)
  %cleanup.heap.ptr.4 = load ptr, ptr %cleanup.heap.slot.7
  call void @free(ptr %cleanup.heap.ptr.4)
  %cleanup.heap.ptr.5 = load ptr, ptr %cleanup.heap.slot.8
  call void @free(ptr %cleanup.heap.ptr.5)
  %cleanup.heap.ptr.6 = load ptr, ptr %cleanup.heap.slot.12
  call void @free(ptr %cleanup.heap.ptr.6)
  %cleanup.heap.ptr.7 = load ptr, ptr %cleanup.heap.slot.22
  call void @free(ptr %cleanup.heap.ptr.7)
  ret void
}

define void @"kira_fn_4_rawSokolFrame"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local1 = alloca i64
  %cleanup.heap.slot.12 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.12
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %native.recover.state.1 = inttoptr i64 %r0 to ptr
  %native.recover.payload.1 = call ptr @"kira_native_state_recover"(ptr %native.recover.state.1, i64 2254967578164254324)
  %r1 = ptrtoint ptr %native.recover.payload.1 to i64
  store i64 %r1, ptr %local1
  %r2 = fadd double 0.0, 0.04
  %r3 = fadd double 0.0, 0.05
  %r4 = fadd double 0.0, 0.08
  %r5 = fadd double 0.0, 1.0
  %call.arg.0.0 = fptrunc double %r2 to float
  %call.arg.0.1 = fptrunc double %r3 to float
  %call.arg.0.2 = fptrunc double %r4 to float
  %call.arg.0.3 = fptrunc double %r5 to float
  call void @"kg_begin_swapchain_pass"(float %call.arg.0.0, float %call.arg.0.1, float %call.arg.0.2, float %call.arg.0.3)
  %r6 = add i64 0, 0
  %r7 = add i64 0, 0
  %call.int.8 = call i32 @"sapp_width"()
  %r8.sext = sext i32 %call.int.8 to i64
  %r8 = add i64 %r8.sext, 0
  %call.int.9 = call i32 @"sapp_height"()
  %r9.sext = sext i32 %call.int.9 to i64
  %r9 = add i64 %r9.sext, 0
  %r10 = add i1 0, 1
  %call.arg.265.0 = trunc i64 %r6 to i32
  %call.arg.265.1 = trunc i64 %r7 to i32
  %call.arg.265.2 = trunc i64 %r8 to i32
  %call.arg.265.3 = trunc i64 %r9 to i32
  call void @"sg_apply_viewport"(i32 %call.arg.265.0, i32 %call.arg.265.1, i32 %call.arg.265.2, i32 %call.arg.265.3, i1 %r10)
  %r11 = load i64, ptr %local1
  %native.state.get.ptr.12 = inttoptr i64 %r11 to ptr
  %native.state.get.slot.12 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.12, i64 1
  %native.state.get.val.0 = load %kira.bridge.value, ptr %native.state.get.slot.12
  %r12 = extractvalue %kira.bridge.value %native.state.get.val.0, 2
  %call.arg.ptr.261.0 = inttoptr i64 %r12 to ptr
  %call.arg.261.0 = load i32, ptr %call.arg.ptr.261.0
  call void @"sg_apply_pipeline"(i32 %call.arg.261.0)
  %r13 = add i64 0, 0
  %r14 = add i64 0, 3
  %r15 = add i64 0, 1
  %call.arg.291.0 = trunc i64 %r13 to i32
  %call.arg.291.1 = trunc i64 %r14 to i32
  %call.arg.291.2 = trunc i64 %r15 to i32
  call void @"sg_draw"(i32 %call.arg.291.0, i32 %call.arg.291.1, i32 %call.arg.291.2)
  call void @"sg_end_pass"()
  call void @"sg_commit"()
  call void @"sapp_request_quit"()
  ret void
}

define void @"kira_fn_5_rawSokolCleanup"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local1 = alloca i64
  %cleanup.heap.slot.3 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.3
  %cleanup.heap.slot.5 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.5
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %native.recover.state.1 = inttoptr i64 %r0 to ptr
  %native.recover.payload.1 = call ptr @"kira_native_state_recover"(ptr %native.recover.state.1, i64 2254967578164254324)
  %r1 = ptrtoint ptr %native.recover.payload.1 to i64
  store i64 %r1, ptr %local1
  %r2 = load i64, ptr %local1
  %native.state.get.ptr.3 = inttoptr i64 %r2 to ptr
  %native.state.get.slot.3 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.3, i64 1
  %native.state.get.val.0 = load %kira.bridge.value, ptr %native.state.get.slot.3
  %r3 = extractvalue %kira.bridge.value %native.state.get.val.0, 2
  %call.arg.ptr.285.0 = inttoptr i64 %r3 to ptr
  %call.arg.285.0 = load i32, ptr %call.arg.ptr.285.0
  call void @"sg_destroy_pipeline"(i32 %call.arg.285.0)
  %r4 = load i64, ptr %local1
  %native.state.get.ptr.5 = inttoptr i64 %r4 to ptr
  %native.state.get.slot.5 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.5, i64 0
  %native.state.get.val.1 = load %kira.bridge.value, ptr %native.state.get.slot.5
  %r5 = extractvalue %kira.bridge.value %native.state.get.val.1, 2
  %call.arg.ptr.287.0 = inttoptr i64 %r5 to ptr
  %call.arg.287.0 = load i32, ptr %call.arg.ptr.287.0
  call void @"sg_destroy_shader"(i32 %call.arg.287.0)
  call void @"sg_shutdown"()
  ret void
}

define void @"kira_fn_6_main"() {
entry:
  %local0 = alloca i64
  %local1 = alloca i64
  %local.storage.1 = alloca %t.sapp_desc
  store %t.sapp_desc zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.1 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.1
  %cleanup.heap.slot.5 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.5
  %cleanup.heap.slot.10 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.10
  %cleanup.heap.slot.27 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.27
  %cleanup.heap.slot.28 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.28
  %alloc.size.ptr.0 = getelementptr %t.RawSokolState, ptr null, i32 1
  %alloc.size.0 = ptrtoint ptr %alloc.size.ptr.0 to i64
  %alloc.empty.0 = icmp eq i64 %alloc.size.0, 0
  %alloc.bytes.0 = select i1 %alloc.empty.0, i64 1, i64 %alloc.size.0
  %alloc.ptr.0 = call ptr @malloc(i64 %alloc.bytes.0)
  store %t.RawSokolState zeroinitializer, ptr %alloc.ptr.0
  %r0 = ptrtoint ptr %alloc.ptr.0 to i64
  store ptr %alloc.ptr.0, ptr %cleanup.heap.slot.0
  %alloc.size.ptr.1 = getelementptr %t.sg_shader, ptr null, i32 1
  %alloc.size.1 = ptrtoint ptr %alloc.size.ptr.1 to i64
  %alloc.empty.1 = icmp eq i64 %alloc.size.1, 0
  %alloc.bytes.1 = select i1 %alloc.empty.1, i64 1, i64 %alloc.size.1
  %alloc.ptr.1 = call ptr @malloc(i64 %alloc.bytes.1)
  store %t.sg_shader zeroinitializer, ptr %alloc.ptr.1
  %r1 = ptrtoint ptr %alloc.ptr.1 to i64
  store ptr %alloc.ptr.1, ptr %cleanup.heap.slot.1
  %r2 = add i64 0, 0
  %field.base.3 = inttoptr i64 %r1 to ptr
  %field.ptr.3 = getelementptr inbounds %t.sg_shader, ptr %field.base.3, i32 0, i32 0
  %r3 = ptrtoint ptr %field.ptr.3 to i64
  %store.ptr.2 = inttoptr i64 %r3 to ptr
  %store.cast.2 = trunc i64 %r2 to i32
  store i32 %store.cast.2, ptr %store.ptr.2
  %field.base.4 = inttoptr i64 %r0 to ptr
  %field.ptr.4 = getelementptr inbounds %t.RawSokolState, ptr %field.base.4, i32 0, i32 0
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %copy.dst.4 = inttoptr i64 %r4 to ptr
  %copy.src.1 = inttoptr i64 %r1 to ptr
  %copy.val.4 = load %t.sg_shader, ptr %copy.src.1
  store %t.sg_shader %copy.val.4, ptr %copy.dst.4
  %alloc.size.ptr.5 = getelementptr %t.sg_pipeline, ptr null, i32 1
  %alloc.size.5 = ptrtoint ptr %alloc.size.ptr.5 to i64
  %alloc.empty.5 = icmp eq i64 %alloc.size.5, 0
  %alloc.bytes.5 = select i1 %alloc.empty.5, i64 1, i64 %alloc.size.5
  %alloc.ptr.5 = call ptr @malloc(i64 %alloc.bytes.5)
  store %t.sg_pipeline zeroinitializer, ptr %alloc.ptr.5
  %r5 = ptrtoint ptr %alloc.ptr.5 to i64
  store ptr %alloc.ptr.5, ptr %cleanup.heap.slot.5
  %r6 = add i64 0, 0
  %field.base.7 = inttoptr i64 %r5 to ptr
  %field.ptr.7 = getelementptr inbounds %t.sg_pipeline, ptr %field.base.7, i32 0, i32 0
  %r7 = ptrtoint ptr %field.ptr.7 to i64
  %store.ptr.6 = inttoptr i64 %r7 to ptr
  %store.cast.6 = trunc i64 %r6 to i32
  store i32 %store.cast.6, ptr %store.ptr.6
  %field.base.8 = inttoptr i64 %r0 to ptr
  %field.ptr.8 = getelementptr inbounds %t.RawSokolState, ptr %field.base.8, i32 0, i32 1
  %r8 = ptrtoint ptr %field.ptr.8 to i64
  %copy.dst.8 = inttoptr i64 %r8 to ptr
  %copy.src.5 = inttoptr i64 %r5 to ptr
  %copy.val.8 = load %t.sg_pipeline, ptr %copy.src.5
  store %t.sg_pipeline %copy.val.8, ptr %copy.dst.8
  %native.state.size.ptr.9 = getelementptr [2 x %kira.bridge.value], ptr null, i32 1
  %native.state.size.9 = ptrtoint ptr %native.state.size.ptr.9 to i64
  %native.state.box.9 = call ptr @"kira_native_state_alloc"(i64 2254967578164254324, i64 %native.state.size.9)
  %native.state.payload.9 = call ptr @"kira_native_state_payload"(ptr %native.state.box.9)
  %native.state.src.9 = inttoptr i64 %r0 to ptr
  %native.state.src.field.ptr.9.0 = getelementptr inbounds %t.RawSokolState, ptr %native.state.src.9, i32 0, i32 0
  %native.state.slot.ptr.9.0 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.9, i64 0
  %native.state.pack.9.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %native.state.load.struct.9.0 = load %t.sg_shader, ptr %native.state.src.field.ptr.9.0
  %native.state.load.struct.size.ptr.9.0 = getelementptr %t.sg_shader, ptr null, i32 1
  %native.state.load.struct.size.9.0 = ptrtoint ptr %native.state.load.struct.size.ptr.9.0 to i64
  %native.state.load.struct.copy.9.0 = call ptr @malloc(i64 %native.state.load.struct.size.9.0)
  store %t.sg_shader %native.state.load.struct.9.0, ptr %native.state.load.struct.copy.9.0
  %native.state.load.struct.ptrint.9.0 = ptrtoint ptr %native.state.load.struct.copy.9.0 to i64
  %native.state.pack.9.0 = insertvalue %kira.bridge.value %native.state.pack.9.0.0, i64 %native.state.load.struct.ptrint.9.0, 2
  store %kira.bridge.value %native.state.pack.9.0, ptr %native.state.slot.ptr.9.0
  %native.state.src.field.ptr.9.1 = getelementptr inbounds %t.RawSokolState, ptr %native.state.src.9, i32 0, i32 1
  %native.state.slot.ptr.9.1 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.9, i64 1
  %native.state.pack.9.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %native.state.load.struct.9.1 = load %t.sg_pipeline, ptr %native.state.src.field.ptr.9.1
  %native.state.load.struct.size.ptr.9.1 = getelementptr %t.sg_pipeline, ptr null, i32 1
  %native.state.load.struct.size.9.1 = ptrtoint ptr %native.state.load.struct.size.ptr.9.1 to i64
  %native.state.load.struct.copy.9.1 = call ptr @malloc(i64 %native.state.load.struct.size.9.1)
  store %t.sg_pipeline %native.state.load.struct.9.1, ptr %native.state.load.struct.copy.9.1
  %native.state.load.struct.ptrint.9.1 = ptrtoint ptr %native.state.load.struct.copy.9.1 to i64
  %native.state.pack.9.1 = insertvalue %kira.bridge.value %native.state.pack.9.1.0, i64 %native.state.load.struct.ptrint.9.1, 2
  store %kira.bridge.value %native.state.pack.9.1, ptr %native.state.slot.ptr.9.1
  %r9 = ptrtoint ptr %native.state.box.9 to i64
  store i64 %r9, ptr %local0
  %alloc.size.ptr.10 = getelementptr %t.sapp_desc, ptr null, i32 1
  %alloc.size.10 = ptrtoint ptr %alloc.size.ptr.10 to i64
  %alloc.empty.10 = icmp eq i64 %alloc.size.10, 0
  %alloc.bytes.10 = select i1 %alloc.empty.10, i64 1, i64 %alloc.size.10
  %alloc.ptr.10 = call ptr @malloc(i64 %alloc.bytes.10)
  store %t.sapp_desc zeroinitializer, ptr %alloc.ptr.10
  %r10 = ptrtoint ptr %alloc.ptr.10 to i64
  store ptr %alloc.ptr.10, ptr %cleanup.heap.slot.10
  %r11 = ptrtoint ptr @"kira_fn_3_rawSokolInit" to i64
  %field.base.12 = inttoptr i64 %r10 to ptr
  %field.ptr.12 = getelementptr inbounds %t.sapp_desc, ptr %field.base.12, i32 0, i32 5
  %r12 = ptrtoint ptr %field.ptr.12 to i64
  %store.ptr.11 = inttoptr i64 %r12 to ptr
  %store.rawptr.11 = inttoptr i64 %r11 to ptr
  store ptr %store.rawptr.11, ptr %store.ptr.11
  %r13 = ptrtoint ptr @"kira_fn_4_rawSokolFrame" to i64
  %field.base.14 = inttoptr i64 %r10 to ptr
  %field.ptr.14 = getelementptr inbounds %t.sapp_desc, ptr %field.base.14, i32 0, i32 6
  %r14 = ptrtoint ptr %field.ptr.14 to i64
  %store.ptr.13 = inttoptr i64 %r14 to ptr
  %store.rawptr.13 = inttoptr i64 %r13 to ptr
  store ptr %store.rawptr.13, ptr %store.ptr.13
  %r15 = ptrtoint ptr @"kira_fn_5_rawSokolCleanup" to i64
  %field.base.16 = inttoptr i64 %r10 to ptr
  %field.ptr.16 = getelementptr inbounds %t.sapp_desc, ptr %field.base.16, i32 0, i32 7
  %r16 = ptrtoint ptr %field.ptr.16 to i64
  %store.ptr.15 = inttoptr i64 %r16 to ptr
  %store.rawptr.15 = inttoptr i64 %r15 to ptr
  store ptr %store.rawptr.15, ptr %store.ptr.15
  %r17 = load i64, ptr %local0
  %field.base.18 = inttoptr i64 %r10 to ptr
  %field.ptr.18 = getelementptr inbounds %t.sapp_desc, ptr %field.base.18, i32 0, i32 4
  %r18 = ptrtoint ptr %field.ptr.18 to i64
  %store.ptr.17 = inttoptr i64 %r18 to ptr
  %store.rawptr.17 = inttoptr i64 %r17 to ptr
  store ptr %store.rawptr.17, ptr %store.ptr.17
  %r19 = add i64 0, 640
  %field.base.20 = inttoptr i64 %r10 to ptr
  %field.ptr.20 = getelementptr inbounds %t.sapp_desc, ptr %field.base.20, i32 0, i32 9
  %r20 = ptrtoint ptr %field.ptr.20 to i64
  %store.ptr.19 = inttoptr i64 %r20 to ptr
  %store.cast.19 = trunc i64 %r19 to i32
  store i32 %store.cast.19, ptr %store.ptr.19
  %r21 = add i64 0, 480
  %field.base.22 = inttoptr i64 %r10 to ptr
  %field.ptr.22 = getelementptr inbounds %t.sapp_desc, ptr %field.base.22, i32 0, i32 10
  %r22 = ptrtoint ptr %field.ptr.22 to i64
  %store.ptr.21 = inttoptr i64 %r22 to ptr
  %store.cast.21 = trunc i64 %r21 to i32
  store i32 %store.cast.21, ptr %store.ptr.21
  %r23 = add i64 0, 1
  %field.base.24 = inttoptr i64 %r10 to ptr
  %field.ptr.24 = getelementptr inbounds %t.sapp_desc, ptr %field.base.24, i32 0, i32 11
  %r24 = ptrtoint ptr %field.ptr.24 to i64
  %store.ptr.23 = inttoptr i64 %r24 to ptr
  %store.cast.23 = trunc i64 %r23 to i32
  store i32 %store.cast.23, ptr %store.ptr.23
  %r25 = load %kira.string, ptr @kira_str_4
  %field.base.26 = inttoptr i64 %r10 to ptr
  %field.ptr.26 = getelementptr inbounds %t.sapp_desc, ptr %field.base.26, i32 0, i32 16
  %r26 = ptrtoint ptr %field.ptr.26 to i64
  %store.ptr.25 = inttoptr i64 %r26 to ptr
  %store.cstr.25 = extractvalue %kira.string %r25, 0
  store ptr %store.cstr.25, ptr %store.ptr.25
  %r27 = load i64, ptr %local1
  %copy.dst.27 = inttoptr i64 %r27 to ptr
  %copy.src.10 = inttoptr i64 %r10 to ptr
  %copy.val.27 = load %t.sapp_desc, ptr %copy.src.10
  store %t.sapp_desc %copy.val.27, ptr %copy.dst.27
  %r28 = load i64, ptr %local1
  %call.arg.236.0 = inttoptr i64 %r28 to ptr
  call void @"sapp_run"(ptr %call.arg.236.0)
  %cleanup.heap.ptr.0 = load ptr, ptr %cleanup.heap.slot.0
  call void @free(ptr %cleanup.heap.ptr.0)
  %cleanup.heap.ptr.1 = load ptr, ptr %cleanup.heap.slot.1
  call void @free(ptr %cleanup.heap.ptr.1)
  %cleanup.heap.ptr.2 = load ptr, ptr %cleanup.heap.slot.5
  call void @free(ptr %cleanup.heap.ptr.2)
  %cleanup.heap.ptr.3 = load ptr, ptr %cleanup.heap.slot.10
  call void @free(ptr %cleanup.heap.ptr.3)
  ret void
}

define i32 @main() {
entry:
  call void @"kira_fn_6_main"()
  ret i32 0
}

