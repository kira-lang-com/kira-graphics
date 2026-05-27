; ModuleID = "main"
source_filename = "main"
target triple = "arm64-apple-macosx"

%t.sapp_event = type { i64, i32, i32, i32, i8, i32, i32, float, float, float, float, float, float, i32, [8 x %t.sapp_touchpoint], i32, i32, i32, i32 }
%t.GraphicsShader = type { %t.BackendShaderHandle, i32 }
%t.sapp_touchpoint = type { i64, float, float, i32, i8 }
%t.sapp_logger = type { ptr, ptr }
%t.BindGroupDescriptor = type { %kira.string, ptr }
%t.sapp_gl_desc = type { i32, i32 }
%t.BlendState = type { i8, i64 }
%t.sapp_html5_desc = type { ptr, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8 }
%t.RenderPipelineDescriptor = type { %kira.string, %t.GraphicsShader, %t.VertexLayout, ptr, %t.DepthStencilDescriptor, %t.RasterizationDescriptor, %t.PrimitiveDescriptor }
%t.GraphicsRect = type { double, double, double, double }
%t.VertexAttribute = type { %kira.string, i64, i64, i64 }
%t.BackendBindGroupHandle = type { i32 }
%t.BackendBufferHandle = type { i32 }
%t.PrimitiveDescriptor = type { i64 }
%t.RenderEncoder = type { ptr }
%t.GraphicsApplication = type { %kira.string, i64, i64, i64, ptr, ptr, ptr }
%t.ColorTargetDescriptor = type { i64, %t.BlendState }
%t.DepthStencilDescriptor = type { i8, i8, i64, i64 }
%t.TextureDescriptor = type { %kira.string, i64, i64, i64, i64, i64, i64 }
%t.BindGroup = type { %t.BackendBindGroupHandle, i32 }
%t.Graphics = type { ptr }
%t.sapp_desc = type { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i32, i32, i8, i8, i8, ptr, i8, i32, i8, i32, i32, %t.sapp_icon_desc, %t.sapp_allocator, %t.sapp_logger, %t.sapp_gl_desc, %t.sapp_win32_desc, %t.sapp_html5_desc, %t.sapp_ios_desc }
%t.UniformBindEntry = type { i64, %t.GraphicsUniform }
%t.GraphicsBuffer = type { %t.BackendBufferHandle, i32 }
%t.ShaderDescriptor = type { %kira.string, %kira.string, %kira.string, %kira.string, %kira.string }
%t.sapp_range = type { ptr, i64 }
%t.ColorAttachment = type { %t.RenderTarget, i64, i64, %t.Color, %t.RenderTarget, i8 }
%t.sapp_ios_desc = type { i8 }
%t.GraphicsUniform = type { %t.BackendUniformHandle, i32 }
%t.GraphicsFrame = type { i8, i64, i32, i64, i64, i64, i64, double, double, double, double, i8, i32, i64, i64, i8, i32, i64, i64, double, i8, i8, i32, i64, i64, i64, i8, i32, i8, i32, i8, i32, i8, i64, i64, i64, i64, i8, i8, %t.RenderEncoder, i8, i8, i8, ptr }
%t.BufferDescriptor = type { %kira.string, i64, i64, ptr }
%t.RasterizationDescriptor = type { i64, i64 }
%t.BackendTextureHandle = type { i32 }
%t.TriangleState = type { %t.GraphicsShader, %t.RenderPipeline, %t.GraphicsBuffer }
%t.VertexLayout = type { i64, ptr }
%t.KslShaderDescriptor = type { %kira.string, %kira.string, %kira.string }
%t.DepthAttachment = type { %t.GraphicsTexture, i64, i64, double, i8 }
%t.RenderTarget = type { i64, %t.GraphicsTexture, i64, i64 }
%t.RenderPipeline = type { %t.BackendPipelineHandle, i32 }
%t.StencilAttachment = type { %t.GraphicsTexture, i64, i64, i64, i8 }
%t.RenderPassDescriptor = type { %kira.string, ptr, %t.ColorAttachment, i8, %t.DepthAttachment, i8, %t.StencilAttachment, i8 }
%t.Color = type { double, double, double, double }
%t.sapp_win32_desc = type { i8, i8, i8 }
%t.GraphicsAppRuntimeState = type { %t.GraphicsApplication, ptr, i64 }
%t.UniformDescriptor = type { %kira.string, i64, ptr }
%t.IndexBufferDescriptor = type { %kira.string, i64, ptr }
%t.RenderEncoderState = type { i32, i8, i8, i32, i8, i32, i8, i64, i32, i8, i32, i8, i32, i8, i32, i8, i64, i64, i64 }
%t.sapp_allocator = type { ptr, ptr, ptr }
%t.sapp_icon_desc = type { i8, [8 x %t.sapp_image_desc] }
%t.sapp_image_desc = type { i32, i32, i32, i32, %t.sapp_range }
%t.BackendUniformHandle = type { i32 }
%t.BackendPipelineHandle = type { i32 }
%t.GraphicsTexture = type { %t.BackendTextureHandle, i32 }
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
define void @"kira_release_contents_GraphicsShader"(ptr %value) {
entry:
  %release.field.0 = getelementptr inbounds %t.GraphicsShader, ptr %value, i32 0, i32 0
  call void @"kira_release_contents_BackendShaderHandle"(ptr %release.field.0)
  ret void
}
define void @"kira_destroy_GraphicsShader"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_GraphicsShader"(ptr %value)
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
define void @"kira_release_contents_BindGroupDescriptor"(ptr %value) {
entry:
  %release.array.field.1 = getelementptr inbounds %t.BindGroupDescriptor, ptr %value, i32 0, i32 1
  %release.array.1 = load ptr, ptr %release.array.field.1
  call void @"kira_array_release"(ptr %release.array.1, ptr @"kira_destroy_UniformBindEntry")
  ret void
}
define void @"kira_destroy_BindGroupDescriptor"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_BindGroupDescriptor"(ptr %value)
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
define void @"kira_release_contents_BlendState"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_BlendState"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_BlendState"(ptr %value)
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
define void @"kira_release_contents_RenderPipelineDescriptor"(ptr %value) {
entry:
  %release.field.1 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %value, i32 0, i32 1
  call void @"kira_release_contents_GraphicsShader"(ptr %release.field.1)
  %release.field.2 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %value, i32 0, i32 2
  call void @"kira_release_contents_VertexLayout"(ptr %release.field.2)
  %release.array.field.3 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %value, i32 0, i32 3
  %release.array.3 = load ptr, ptr %release.array.field.3
  call void @"kira_array_release"(ptr %release.array.3, ptr @"kira_destroy_ColorTargetDescriptor")
  %release.field.4 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %value, i32 0, i32 4
  call void @"kira_release_contents_DepthStencilDescriptor"(ptr %release.field.4)
  %release.field.5 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %value, i32 0, i32 5
  call void @"kira_release_contents_RasterizationDescriptor"(ptr %release.field.5)
  %release.field.6 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %value, i32 0, i32 6
  call void @"kira_release_contents_PrimitiveDescriptor"(ptr %release.field.6)
  ret void
}
define void @"kira_destroy_RenderPipelineDescriptor"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_RenderPipelineDescriptor"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_GraphicsRect"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_GraphicsRect"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_GraphicsRect"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_VertexAttribute"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_VertexAttribute"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_VertexAttribute"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_BackendBindGroupHandle"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_BackendBindGroupHandle"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_BackendBindGroupHandle"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_BackendBufferHandle"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_BackendBufferHandle"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_BackendBufferHandle"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_PrimitiveDescriptor"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_PrimitiveDescriptor"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_PrimitiveDescriptor"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_RenderEncoder"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_RenderEncoder"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_RenderEncoder"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_GraphicsApplication"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_GraphicsApplication"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_GraphicsApplication"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_ColorTargetDescriptor"(ptr %value) {
entry:
  %release.field.1 = getelementptr inbounds %t.ColorTargetDescriptor, ptr %value, i32 0, i32 1
  call void @"kira_release_contents_BlendState"(ptr %release.field.1)
  ret void
}
define void @"kira_destroy_ColorTargetDescriptor"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_ColorTargetDescriptor"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_DepthStencilDescriptor"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_DepthStencilDescriptor"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_DepthStencilDescriptor"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_TextureDescriptor"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_TextureDescriptor"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_TextureDescriptor"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_BindGroup"(ptr %value) {
entry:
  %release.field.0 = getelementptr inbounds %t.BindGroup, ptr %value, i32 0, i32 0
  call void @"kira_release_contents_BackendBindGroupHandle"(ptr %release.field.0)
  ret void
}
define void @"kira_destroy_BindGroup"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_BindGroup"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_Graphics"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_Graphics"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_Graphics"(ptr %value)
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
define void @"kira_release_contents_UniformBindEntry"(ptr %value) {
entry:
  %release.field.1 = getelementptr inbounds %t.UniformBindEntry, ptr %value, i32 0, i32 1
  call void @"kira_release_contents_GraphicsUniform"(ptr %release.field.1)
  ret void
}
define void @"kira_destroy_UniformBindEntry"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_UniformBindEntry"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_GraphicsBuffer"(ptr %value) {
entry:
  %release.field.0 = getelementptr inbounds %t.GraphicsBuffer, ptr %value, i32 0, i32 0
  call void @"kira_release_contents_BackendBufferHandle"(ptr %release.field.0)
  ret void
}
define void @"kira_destroy_GraphicsBuffer"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_GraphicsBuffer"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_ShaderDescriptor"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_ShaderDescriptor"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_ShaderDescriptor"(ptr %value)
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
define void @"kira_release_contents_ColorAttachment"(ptr %value) {
entry:
  %release.field.0 = getelementptr inbounds %t.ColorAttachment, ptr %value, i32 0, i32 0
  call void @"kira_release_contents_RenderTarget"(ptr %release.field.0)
  %release.field.3 = getelementptr inbounds %t.ColorAttachment, ptr %value, i32 0, i32 3
  call void @"kira_release_contents_Color"(ptr %release.field.3)
  %release.field.4 = getelementptr inbounds %t.ColorAttachment, ptr %value, i32 0, i32 4
  call void @"kira_release_contents_RenderTarget"(ptr %release.field.4)
  ret void
}
define void @"kira_destroy_ColorAttachment"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_ColorAttachment"(ptr %value)
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
define void @"kira_release_contents_GraphicsUniform"(ptr %value) {
entry:
  %release.field.0 = getelementptr inbounds %t.GraphicsUniform, ptr %value, i32 0, i32 0
  call void @"kira_release_contents_BackendUniformHandle"(ptr %release.field.0)
  ret void
}
define void @"kira_destroy_GraphicsUniform"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_GraphicsUniform"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_GraphicsFrame"(ptr %value) {
entry:
  %release.field.39 = getelementptr inbounds %t.GraphicsFrame, ptr %value, i32 0, i32 39
  call void @"kira_release_contents_RenderEncoder"(ptr %release.field.39)
  ret void
}
define void @"kira_destroy_GraphicsFrame"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_GraphicsFrame"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_BufferDescriptor"(ptr %value) {
entry:
  %release.array.field.3 = getelementptr inbounds %t.BufferDescriptor, ptr %value, i32 0, i32 3
  %release.array.3 = load ptr, ptr %release.array.field.3
  call void @"kira_array_release"(ptr %release.array.3, ptr null)
  ret void
}
define void @"kira_destroy_BufferDescriptor"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_BufferDescriptor"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_RasterizationDescriptor"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_RasterizationDescriptor"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_RasterizationDescriptor"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_BackendTextureHandle"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_BackendTextureHandle"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_BackendTextureHandle"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_TriangleState"(ptr %value) {
entry:
  %release.field.0 = getelementptr inbounds %t.TriangleState, ptr %value, i32 0, i32 0
  call void @"kira_release_contents_GraphicsShader"(ptr %release.field.0)
  %release.field.1 = getelementptr inbounds %t.TriangleState, ptr %value, i32 0, i32 1
  call void @"kira_release_contents_RenderPipeline"(ptr %release.field.1)
  %release.field.2 = getelementptr inbounds %t.TriangleState, ptr %value, i32 0, i32 2
  call void @"kira_release_contents_GraphicsBuffer"(ptr %release.field.2)
  ret void
}
define void @"kira_destroy_TriangleState"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_TriangleState"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_VertexLayout"(ptr %value) {
entry:
  %release.array.field.1 = getelementptr inbounds %t.VertexLayout, ptr %value, i32 0, i32 1
  %release.array.1 = load ptr, ptr %release.array.field.1
  call void @"kira_array_release"(ptr %release.array.1, ptr @"kira_destroy_VertexAttribute")
  ret void
}
define void @"kira_destroy_VertexLayout"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_VertexLayout"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_KslShaderDescriptor"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_KslShaderDescriptor"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_KslShaderDescriptor"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_DepthAttachment"(ptr %value) {
entry:
  %release.field.0 = getelementptr inbounds %t.DepthAttachment, ptr %value, i32 0, i32 0
  call void @"kira_release_contents_GraphicsTexture"(ptr %release.field.0)
  ret void
}
define void @"kira_destroy_DepthAttachment"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_DepthAttachment"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_RenderTarget"(ptr %value) {
entry:
  %release.field.1 = getelementptr inbounds %t.RenderTarget, ptr %value, i32 0, i32 1
  call void @"kira_release_contents_GraphicsTexture"(ptr %release.field.1)
  ret void
}
define void @"kira_destroy_RenderTarget"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_RenderTarget"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_RenderPipeline"(ptr %value) {
entry:
  %release.field.0 = getelementptr inbounds %t.RenderPipeline, ptr %value, i32 0, i32 0
  call void @"kira_release_contents_BackendPipelineHandle"(ptr %release.field.0)
  ret void
}
define void @"kira_destroy_RenderPipeline"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_RenderPipeline"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_StencilAttachment"(ptr %value) {
entry:
  %release.field.0 = getelementptr inbounds %t.StencilAttachment, ptr %value, i32 0, i32 0
  call void @"kira_release_contents_GraphicsTexture"(ptr %release.field.0)
  ret void
}
define void @"kira_destroy_StencilAttachment"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_StencilAttachment"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_RenderPassDescriptor"(ptr %value) {
entry:
  %release.array.field.1 = getelementptr inbounds %t.RenderPassDescriptor, ptr %value, i32 0, i32 1
  %release.array.1 = load ptr, ptr %release.array.field.1
  call void @"kira_array_release"(ptr %release.array.1, ptr @"kira_destroy_ColorAttachment")
  %release.field.2 = getelementptr inbounds %t.RenderPassDescriptor, ptr %value, i32 0, i32 2
  call void @"kira_release_contents_ColorAttachment"(ptr %release.field.2)
  %release.field.4 = getelementptr inbounds %t.RenderPassDescriptor, ptr %value, i32 0, i32 4
  call void @"kira_release_contents_DepthAttachment"(ptr %release.field.4)
  %release.field.6 = getelementptr inbounds %t.RenderPassDescriptor, ptr %value, i32 0, i32 6
  call void @"kira_release_contents_StencilAttachment"(ptr %release.field.6)
  ret void
}
define void @"kira_destroy_RenderPassDescriptor"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_RenderPassDescriptor"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_Color"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_Color"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_Color"(ptr %value)
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
define void @"kira_release_contents_GraphicsAppRuntimeState"(ptr %value) {
entry:
  %release.field.0 = getelementptr inbounds %t.GraphicsAppRuntimeState, ptr %value, i32 0, i32 0
  call void @"kira_release_contents_GraphicsApplication"(ptr %release.field.0)
  ret void
}
define void @"kira_destroy_GraphicsAppRuntimeState"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_GraphicsAppRuntimeState"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_UniformDescriptor"(ptr %value) {
entry:
  %release.array.field.2 = getelementptr inbounds %t.UniformDescriptor, ptr %value, i32 0, i32 2
  %release.array.2 = load ptr, ptr %release.array.field.2
  call void @"kira_array_release"(ptr %release.array.2, ptr null)
  ret void
}
define void @"kira_destroy_UniformDescriptor"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_UniformDescriptor"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_IndexBufferDescriptor"(ptr %value) {
entry:
  %release.array.field.2 = getelementptr inbounds %t.IndexBufferDescriptor, ptr %value, i32 0, i32 2
  %release.array.2 = load ptr, ptr %release.array.field.2
  call void @"kira_array_release"(ptr %release.array.2, ptr null)
  ret void
}
define void @"kira_destroy_IndexBufferDescriptor"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_IndexBufferDescriptor"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_RenderEncoderState"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_RenderEncoderState"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_RenderEncoderState"(ptr %value)
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
define void @"kira_release_contents_BackendUniformHandle"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_BackendUniformHandle"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_BackendUniformHandle"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_BackendPipelineHandle"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_BackendPipelineHandle"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_BackendPipelineHandle"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_GraphicsTexture"(ptr %value) {
entry:
  %release.field.0 = getelementptr inbounds %t.GraphicsTexture, ptr %value, i32 0, i32 0
  call void @"kira_release_contents_BackendTextureHandle"(ptr %release.field.0)
  ret void
}
define void @"kira_destroy_GraphicsTexture"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_GraphicsTexture"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_BackendShaderHandle"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_BackendShaderHandle"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_BackendShaderHandle"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}

declare void @"kg_setup"()

declare i32 @"kg_begin_float_buffer_upload"(ptr, i64, i64, i64)

declare void @"kg_set_float_buffer_upload_value"(i32, i64, double)

declare i32 @"kg_finalize_float_buffer_upload"(i32)

declare i32 @"kg_begin_index_buffer_upload"(ptr, i64, i64)

declare void @"kg_set_index_buffer_upload_value"(i32, i64, i64)

declare i32 @"kg_finalize_index_buffer_upload"(i32)

declare void @"kg_destroy_buffer_id"(i32)

declare i32 @"kg_create_uniform_id"(ptr, i64)

declare void @"kg_set_uniform_float"(i32, i64, double)

declare i32 @"kg_finish_uniform_update"(i32, i64)

declare void @"kg_destroy_uniform_id"(i32)

declare i32 @"kg_create_bind_group_id"(ptr)

declare i32 @"kg_set_bind_group_uniform"(i32, i64, i64, i32)

declare void @"kg_destroy_bind_group_id"(i32)

declare i32 @"kg_create_texture_id"(ptr, i64, i64, i64, i64, i64, i64)

declare void @"kg_destroy_texture_id"(i32)

declare i32 @"kg_begin_render_pass"(ptr, i64, i32, i64, i64, i64, i64, double, double, double, double, i64, i32, i64, i64, i64, i32, i64, i64, double, i64, i64, i32, i64, i64, i64, i64)

declare i32 @"kg_apply_pipeline_bindings_and_draw"(i32, i32, i64, i32, i64, i32, i64, i32, i64, i32, i64, i32, i64, i64, i64, i64)

declare void @"kg_log_submit_state"(i32, i32, i64, i32, i64, i64, i64, i64)

declare void @"kg_end_pass_and_commit"()

declare void @"kg_ui_push_clip"(double, double, double, double, double)

declare void @"kg_ui_pop_clip"()

declare void @"kg_ui_draw_surface"(double, double, double, double, double, double, double, double, double, double, double, double, double, double)

declare void @"kg_ui_draw_squircle_surface"(double, double, double, double, double, double, double, double, double, double, double, double, double, double)

declare void @"kg_ui_draw_glow"(double, double, double, double, double, double, double, double, double, double)

declare void @"kg_ui_draw_text"(ptr, double, double, double, double, double, double, double, double, double)

declare void @"kg_destroy_pipeline_id"(i32)

declare void @"kg_destroy_default_resources"()

declare void @"kg_report_lifetime"()

declare void @"kg_sample_lifetime_frame"()

declare void @"kg_maybe_request_quit_after_frame"(i64)

declare i32 @"kg_run_lifetime_stress"(i64, ptr, ptr)

declare void @"kg_destroy_shader_id"(i32)

declare i32 @"kg_make_pipeline_detailed"(i32, ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)

declare i32 @"kg_make_shader"(ptr, ptr, ptr, ptr, ptr)

declare i32 @"kg_make_ksl_shader"(ptr, ptr, ptr)

declare void @"sapp_request_quit"()

declare void @"sapp_run"(ptr)

declare void @"sg_shutdown"()



@kira_str_0_data = private unnamed_addr constant [29 x i8] c"Kira Graphics Basic Triangle\00"

@kira_str_0 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([29 x i8], ptr @kira_str_0_data, i64 0, i64 0), i64 28 }

@kira_str_1_data = private unnamed_addr constant [15 x i8] c"swapchain-pass\00"

@kira_str_1 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([15 x i8], ptr @kira_str_1_data, i64 0, i64 0), i64 14 }

@kira_str_2_data = private unnamed_addr constant [22 x i8] c"basic-triangle-shader\00"

@kira_str_2 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([22 x i8], ptr @kira_str_2_data, i64 0, i64 0), i64 21 }

@kira_str_3_data = private unnamed_addr constant [1 x i8] c"\00"

@kira_str_3 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([1 x i8], ptr @kira_str_3_data, i64 0, i64 0), i64 0 }

@kira_str_4_data = private unnamed_addr constant [1 x i8] c"\00"

@kira_str_4 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([1 x i8], ptr @kira_str_4_data, i64 0, i64 0), i64 0 }

@kira_str_5_data = private unnamed_addr constant [42 x i8] c"generated/Shaders/BasicTriangle.vert.glsl\00"

@kira_str_5 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([42 x i8], ptr @kira_str_5_data, i64 0, i64 0), i64 41 }

@kira_str_6_data = private unnamed_addr constant [42 x i8] c"generated/Shaders/BasicTriangle.frag.glsl\00"

@kira_str_6 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([42 x i8], ptr @kira_str_6_data, i64 0, i64 0), i64 41 }

@kira_str_7_data = private unnamed_addr constant [24 x i8] c"basic-triangle-vertices\00"

@kira_str_7 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([24 x i8], ptr @kira_str_7_data, i64 0, i64 0), i64 23 }

@kira_str_8_data = private unnamed_addr constant [24 x i8] c"basic-triangle-pipeline\00"

@kira_str_8 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([24 x i8], ptr @kira_str_8_data, i64 0, i64 0), i64 23 }


define void @"kira_native_impl_3"() {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.GraphicsApplication
  store %t.GraphicsApplication zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.15 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.15
  %cleanup.heap.slot.16 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.16
  %cleanup.heap.slot.17 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.17
  %cleanup.heap.slot.19 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.19
  %cleanup.heap.slot.21 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.21
  %cleanup.heap.slot.24 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.24
  %cleanup.heap.slot.26 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.26
  %cleanup.heap.slot.28 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.28
  %cleanup.heap.slot.30 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.30
  %alloc.size.ptr.0 = getelementptr %t.GraphicsApplication, ptr null, i32 1
  %alloc.size.0 = ptrtoint ptr %alloc.size.ptr.0 to i64
  %alloc.empty.0 = icmp eq i64 %alloc.size.0, 0
  %alloc.bytes.0 = select i1 %alloc.empty.0, i64 1, i64 %alloc.size.0
  %alloc.ptr.0 = call ptr @malloc(i64 %alloc.bytes.0)
  store %t.GraphicsApplication zeroinitializer, ptr %alloc.ptr.0
  %r0 = ptrtoint ptr %alloc.ptr.0 to i64
  store ptr %alloc.ptr.0, ptr %cleanup.heap.slot.0
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
  %r9 = add i64 0, 4
  %field.base.10 = inttoptr i64 %r0 to ptr
  %field.ptr.10 = getelementptr inbounds %t.GraphicsApplication, ptr %field.base.10, i32 0, i32 4
  %r10 = ptrtoint ptr %field.ptr.10 to i64
  %store.ptr.9 = inttoptr i64 %r10 to ptr
  %store.rawptr.9 = inttoptr i64 %r9 to ptr
  store ptr %store.rawptr.9, ptr %store.ptr.9
  %r11 = add i64 0, 5
  %field.base.12 = inttoptr i64 %r0 to ptr
  %field.ptr.12 = getelementptr inbounds %t.GraphicsApplication, ptr %field.base.12, i32 0, i32 5
  %r12 = ptrtoint ptr %field.ptr.12 to i64
  %store.ptr.11 = inttoptr i64 %r12 to ptr
  %store.rawptr.11 = inttoptr i64 %r11 to ptr
  store ptr %store.rawptr.11, ptr %store.ptr.11
  %r13 = add i64 0, 6
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
  %alloc.size.ptr.16 = getelementptr %t.TriangleState, ptr null, i32 1
  %alloc.size.16 = ptrtoint ptr %alloc.size.ptr.16 to i64
  %alloc.empty.16 = icmp eq i64 %alloc.size.16, 0
  %alloc.bytes.16 = select i1 %alloc.empty.16, i64 1, i64 %alloc.size.16
  %alloc.ptr.16 = call ptr @malloc(i64 %alloc.bytes.16)
  store %t.TriangleState zeroinitializer, ptr %alloc.ptr.16
  %r16 = ptrtoint ptr %alloc.ptr.16 to i64
  store ptr %alloc.ptr.16, ptr %cleanup.heap.slot.16
  %r17 = call i64 @"kira_native_impl_178"()
  %cleanup.call.ptr.17 = inttoptr i64 %r17 to ptr
  store ptr %cleanup.call.ptr.17, ptr %cleanup.heap.slot.17
  %field.base.18 = inttoptr i64 %r16 to ptr
  %field.ptr.18 = getelementptr inbounds %t.TriangleState, ptr %field.base.18, i32 0, i32 0
  %r18 = ptrtoint ptr %field.ptr.18 to i64
  %copy.dst.18 = inttoptr i64 %r18 to ptr
  %copy.src.17 = inttoptr i64 %r17 to ptr
  %copy.val.18 = load %t.GraphicsShader, ptr %copy.src.17
  store %t.GraphicsShader %copy.val.18, ptr %copy.dst.18
  %r19 = call i64 @"kira_native_impl_168"()
  %cleanup.call.ptr.19 = inttoptr i64 %r19 to ptr
  store ptr %cleanup.call.ptr.19, ptr %cleanup.heap.slot.19
  %field.base.20 = inttoptr i64 %r16 to ptr
  %field.ptr.20 = getelementptr inbounds %t.TriangleState, ptr %field.base.20, i32 0, i32 1
  %r20 = ptrtoint ptr %field.ptr.20 to i64
  %copy.dst.20 = inttoptr i64 %r20 to ptr
  %copy.src.19 = inttoptr i64 %r19 to ptr
  %copy.val.20 = load %t.RenderPipeline, ptr %copy.src.19
  store %t.RenderPipeline %copy.val.20, ptr %copy.dst.20
  %r21 = call i64 @"kira_native_impl_85"()
  %cleanup.call.ptr.21 = inttoptr i64 %r21 to ptr
  store ptr %cleanup.call.ptr.21, ptr %cleanup.heap.slot.21
  %field.base.22 = inttoptr i64 %r16 to ptr
  %field.ptr.22 = getelementptr inbounds %t.TriangleState, ptr %field.base.22, i32 0, i32 2
  %r22 = ptrtoint ptr %field.ptr.22 to i64
  %copy.dst.22 = inttoptr i64 %r22 to ptr
  %copy.src.21 = inttoptr i64 %r21 to ptr
  %copy.val.22 = load %t.GraphicsBuffer, ptr %copy.src.21
  store %t.GraphicsBuffer %copy.val.22, ptr %copy.dst.22
  %native.state.size.ptr.23 = getelementptr [3 x %kira.bridge.value], ptr null, i32 1
  %native.state.size.23 = ptrtoint ptr %native.state.size.ptr.23 to i64
  %native.state.box.23 = call ptr @"kira_native_state_alloc"(i64 8814238373109695030, i64 %native.state.size.23)
  %native.state.payload.23 = call ptr @"kira_native_state_payload"(ptr %native.state.box.23)
  %native.state.src.23 = inttoptr i64 %r16 to ptr
  %native.state.src.field.ptr.23.0 = getelementptr inbounds %t.TriangleState, ptr %native.state.src.23, i32 0, i32 0
  %native.state.slot.ptr.23.0 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.23, i64 0
  %native.state.pack.23.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %native.state.load.struct.23.0 = load %t.GraphicsShader, ptr %native.state.src.field.ptr.23.0
  %native.state.load.struct.size.ptr.23.0 = getelementptr %t.GraphicsShader, ptr null, i32 1
  %native.state.load.struct.size.23.0 = ptrtoint ptr %native.state.load.struct.size.ptr.23.0 to i64
  %native.state.load.struct.copy.23.0 = call ptr @malloc(i64 %native.state.load.struct.size.23.0)
  store %t.GraphicsShader %native.state.load.struct.23.0, ptr %native.state.load.struct.copy.23.0
  %native.state.load.struct.ptrint.23.0 = ptrtoint ptr %native.state.load.struct.copy.23.0 to i64
  %native.state.pack.23.0 = insertvalue %kira.bridge.value %native.state.pack.23.0.0, i64 %native.state.load.struct.ptrint.23.0, 2
  store %kira.bridge.value %native.state.pack.23.0, ptr %native.state.slot.ptr.23.0
  %native.state.src.field.ptr.23.1 = getelementptr inbounds %t.TriangleState, ptr %native.state.src.23, i32 0, i32 1
  %native.state.slot.ptr.23.1 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.23, i64 1
  %native.state.pack.23.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %native.state.load.struct.23.1 = load %t.RenderPipeline, ptr %native.state.src.field.ptr.23.1
  %native.state.load.struct.size.ptr.23.1 = getelementptr %t.RenderPipeline, ptr null, i32 1
  %native.state.load.struct.size.23.1 = ptrtoint ptr %native.state.load.struct.size.ptr.23.1 to i64
  %native.state.load.struct.copy.23.1 = call ptr @malloc(i64 %native.state.load.struct.size.23.1)
  store %t.RenderPipeline %native.state.load.struct.23.1, ptr %native.state.load.struct.copy.23.1
  %native.state.load.struct.ptrint.23.1 = ptrtoint ptr %native.state.load.struct.copy.23.1 to i64
  %native.state.pack.23.1 = insertvalue %kira.bridge.value %native.state.pack.23.1.0, i64 %native.state.load.struct.ptrint.23.1, 2
  store %kira.bridge.value %native.state.pack.23.1, ptr %native.state.slot.ptr.23.1
  %native.state.src.field.ptr.23.2 = getelementptr inbounds %t.TriangleState, ptr %native.state.src.23, i32 0, i32 2
  %native.state.slot.ptr.23.2 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.23, i64 2
  %native.state.pack.23.2.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %native.state.load.struct.23.2 = load %t.GraphicsBuffer, ptr %native.state.src.field.ptr.23.2
  %native.state.load.struct.size.ptr.23.2 = getelementptr %t.GraphicsBuffer, ptr null, i32 1
  %native.state.load.struct.size.23.2 = ptrtoint ptr %native.state.load.struct.size.ptr.23.2 to i64
  %native.state.load.struct.copy.23.2 = call ptr @malloc(i64 %native.state.load.struct.size.23.2)
  store %t.GraphicsBuffer %native.state.load.struct.23.2, ptr %native.state.load.struct.copy.23.2
  %native.state.load.struct.ptrint.23.2 = ptrtoint ptr %native.state.load.struct.copy.23.2 to i64
  %native.state.pack.23.2 = insertvalue %kira.bridge.value %native.state.pack.23.2.0, i64 %native.state.load.struct.ptrint.23.2, 2
  store %kira.bridge.value %native.state.pack.23.2, ptr %native.state.slot.ptr.23.2
  %r23 = ptrtoint ptr %native.state.box.23 to i64
  store i64 %r23, ptr %local1
  %r24 = load i64, ptr %local0
  %r25 = add i64 0, 445
  %rt.args.0 = alloca [2 x %kira.bridge.value]
  %rt.slot.0.0 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.0, i64 0, i64 0
  %rt.pack.0.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.0.0.1 = insertvalue %kira.bridge.value %rt.pack.0.0.0, i64 %r24, 2
  store %kira.bridge.value %rt.pack.0.0.1, ptr %rt.slot.0.0
  %rt.slot.0.1 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.0, i64 0, i64 1
  %rt.pack.0.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.0.1.1 = insertvalue %kira.bridge.value %rt.pack.0.1.0, i64 %r25, 2
  store %kira.bridge.value %rt.pack.0.1.1, ptr %rt.slot.0.1
  %rt.result.0 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 402, ptr %rt.args.0, i32 2, ptr %rt.result.0)
  %r26 = load i64, ptr %local0
  %r27 = add i64 0, 446
  %rt.args.1 = alloca [2 x %kira.bridge.value]
  %rt.slot.1.0 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.1, i64 0, i64 0
  %rt.pack.1.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.1.0.1 = insertvalue %kira.bridge.value %rt.pack.1.0.0, i64 %r26, 2
  store %kira.bridge.value %rt.pack.1.0.1, ptr %rt.slot.1.0
  %rt.slot.1.1 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.1, i64 0, i64 1
  %rt.pack.1.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.1.1.1 = insertvalue %kira.bridge.value %rt.pack.1.1.0, i64 %r27, 2
  store %kira.bridge.value %rt.pack.1.1.1, ptr %rt.slot.1.1
  %rt.result.1 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 403, ptr %rt.args.1, i32 2, ptr %rt.result.1)
  %r28 = load i64, ptr %local0
  %r29 = add i64 0, 448
  %rt.args.2 = alloca [2 x %kira.bridge.value]
  %rt.slot.2.0 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.2, i64 0, i64 0
  %rt.pack.2.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.2.0.1 = insertvalue %kira.bridge.value %rt.pack.2.0.0, i64 %r28, 2
  store %kira.bridge.value %rt.pack.2.0.1, ptr %rt.slot.2.0
  %rt.slot.2.1 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.2, i64 0, i64 1
  %rt.pack.2.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.2.1.1 = insertvalue %kira.bridge.value %rt.pack.2.1.0, i64 %r29, 2
  store %kira.bridge.value %rt.pack.2.1.1, ptr %rt.slot.2.1
  %rt.result.2 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 404, ptr %rt.args.2, i32 2, ptr %rt.result.2)
  %r30 = load i64, ptr %local0
  %r31 = load i64, ptr %local1
  %rt.args.3 = alloca [2 x %kira.bridge.value]
  %rt.slot.3.0 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.3, i64 0, i64 0
  %rt.pack.3.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.3.0.1 = insertvalue %kira.bridge.value %rt.pack.3.0.0, i64 %r30, 2
  store %kira.bridge.value %rt.pack.3.0.1, ptr %rt.slot.3.0
  %rt.slot.3.1 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.3, i64 0, i64 1
  %rt.pack.3.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.3.1.1 = insertvalue %kira.bridge.value %rt.pack.3.1.0, i64 %r31, 2
  store %kira.bridge.value %rt.pack.3.1.1, ptr %rt.slot.3.1
  %rt.result.3 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 405, ptr %rt.args.3, i32 2, ptr %rt.result.3)
  %cleanup.heap.ptr.4 = load ptr, ptr %cleanup.heap.slot.0
  call void @free(ptr %cleanup.heap.ptr.4)
  %cleanup.heap.ptr.5 = load ptr, ptr %cleanup.heap.slot.16
  call void @free(ptr %cleanup.heap.ptr.5)
  %cleanup.heap.ptr.6 = load ptr, ptr %cleanup.heap.slot.17
  call void @free(ptr %cleanup.heap.ptr.6)
  %cleanup.heap.ptr.7 = load ptr, ptr %cleanup.heap.slot.19
  call void @free(ptr %cleanup.heap.ptr.7)
  %cleanup.heap.ptr.8 = load ptr, ptr %cleanup.heap.slot.21
  call void @free(ptr %cleanup.heap.ptr.8)
  call void @"kira_release_contents_GraphicsApplication"(ptr %local.storage.0)
  ret void
}

define void @"kira_native_impl_8"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.GraphicsApplication
  store %t.GraphicsApplication zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local2 = alloca i64
  %local.storage.2 = alloca %t.sapp_desc
  store %t.sapp_desc zeroinitializer, ptr %local.storage.2
  %local.storage.int.2 = ptrtoint ptr %local.storage.2 to i64
  store i64 %local.storage.int.2, ptr %local2
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.9 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.9
  %cleanup.heap.slot.13 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.13
  %cleanup.heap.slot.17 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.17
  %cleanup.heap.slot.21 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.21
  %cleanup.heap.slot.25 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.25
  %cleanup.heap.slot.26 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.26
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %alloc.size.ptr.0 = getelementptr %t.sapp_desc, ptr null, i32 1
  %alloc.size.0 = ptrtoint ptr %alloc.size.ptr.0 to i64
  %alloc.empty.0 = icmp eq i64 %alloc.size.0, 0
  %alloc.bytes.0 = select i1 %alloc.empty.0, i64 1, i64 %alloc.size.0
  %alloc.ptr.0 = call ptr @malloc(i64 %alloc.bytes.0)
  store %t.sapp_desc zeroinitializer, ptr %alloc.ptr.0
  %r0 = ptrtoint ptr %alloc.ptr.0 to i64
  store ptr %alloc.ptr.0, ptr %cleanup.heap.slot.0
  %r1 = ptrtoint ptr @"kira_native_impl_9" to i64
  %field.base.2 = inttoptr i64 %r0 to ptr
  %field.ptr.2 = getelementptr inbounds %t.sapp_desc, ptr %field.base.2, i32 0, i32 5
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %store.ptr.1 = inttoptr i64 %r2 to ptr
  %store.rawptr.1 = inttoptr i64 %r1 to ptr
  store ptr %store.rawptr.1, ptr %store.ptr.1
  %r3 = ptrtoint ptr @"kira_native_impl_10" to i64
  %field.base.4 = inttoptr i64 %r0 to ptr
  %field.ptr.4 = getelementptr inbounds %t.sapp_desc, ptr %field.base.4, i32 0, i32 6
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %store.ptr.3 = inttoptr i64 %r4 to ptr
  %store.rawptr.3 = inttoptr i64 %r3 to ptr
  store ptr %store.rawptr.3, ptr %store.ptr.3
  %r5 = ptrtoint ptr @"kira_native_impl_11" to i64
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
  %call.arg.233.0 = inttoptr i64 %r26 to ptr
  call void @"sapp_run"(ptr %call.arg.233.0)
  %cleanup.heap.ptr.0 = load ptr, ptr %cleanup.heap.slot.0
  call void @free(ptr %cleanup.heap.ptr.0)
  ret void
}

define void @"kira_native_impl_9"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local1 = alloca i64
  %local2 = alloca i64
  %local.storage.2 = alloca %t.GraphicsApplication
  store %t.GraphicsApplication zeroinitializer, ptr %local.storage.2
  %local.storage.int.2 = ptrtoint ptr %local.storage.2 to i64
  store i64 %local.storage.int.2, ptr %local2
  %local3 = alloca i64
  %local4 = alloca i64
  %local.storage.4 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.4
  %local.storage.int.4 = ptrtoint ptr %local.storage.4 to i64
  store i64 %local.storage.int.4, ptr %local4
  %cleanup.heap.slot.3 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.3
  %cleanup.heap.slot.4 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.4
  %cleanup.heap.slot.5 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.5
  %cleanup.heap.slot.8 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.8
  %cleanup.heap.slot.12 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.12
  %cleanup.heap.slot.14 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.14
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
  %alloc.size.ptr.8 = getelementptr %t.Graphics, ptr null, i32 1
  %alloc.size.8 = ptrtoint ptr %alloc.size.ptr.8 to i64
  %alloc.empty.8 = icmp eq i64 %alloc.size.8, 0
  %alloc.bytes.8 = select i1 %alloc.empty.8, i64 1, i64 %alloc.size.8
  %alloc.ptr.8 = call ptr @malloc(i64 %alloc.bytes.8)
  store %t.Graphics zeroinitializer, ptr %alloc.ptr.8
  %r8 = ptrtoint ptr %alloc.ptr.8 to i64
  store ptr %alloc.ptr.8, ptr %cleanup.heap.slot.8
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
  %cleanup.heap.ptr.2 = load ptr, ptr %cleanup.heap.slot.8
  call void @free(ptr %cleanup.heap.ptr.2)
  call void @"kira_release_contents_Graphics"(ptr %local.storage.4)
  ret void
}

define void @"kira_native_impl_10"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local1 = alloca i64
  %local2 = alloca i64
  %local.storage.2 = alloca %t.GraphicsApplication
  store %t.GraphicsApplication zeroinitializer, ptr %local.storage.2
  %local.storage.int.2 = ptrtoint ptr %local.storage.2 to i64
  store i64 %local.storage.int.2, ptr %local2
  %local3 = alloca i64
  %local4 = alloca i64
  %local.storage.4 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.4
  %local.storage.int.4 = ptrtoint ptr %local.storage.4 to i64
  store i64 %local.storage.int.4, ptr %local4
  %local5 = alloca i64
  %local.storage.5 = alloca %t.GraphicsFrame
  store %t.GraphicsFrame zeroinitializer, ptr %local.storage.5
  %local.storage.int.5 = ptrtoint ptr %local.storage.5 to i64
  store i64 %local.storage.int.5, ptr %local5
  %cleanup.heap.slot.3 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.3
  %cleanup.heap.slot.4 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.4
  %cleanup.heap.slot.5 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.5
  %cleanup.heap.slot.8 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.8
  %cleanup.heap.slot.12 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.12
  %cleanup.heap.slot.13 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.13
  %cleanup.heap.slot.14 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.14
  %cleanup.heap.slot.15 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.15
  %cleanup.heap.slot.22 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.22
  %cleanup.heap.slot.23 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.23
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
  %alloc.size.ptr.8 = getelementptr %t.Graphics, ptr null, i32 1
  %alloc.size.8 = ptrtoint ptr %alloc.size.ptr.8 to i64
  %alloc.empty.8 = icmp eq i64 %alloc.size.8, 0
  %alloc.bytes.8 = select i1 %alloc.empty.8, i64 1, i64 %alloc.size.8
  %alloc.ptr.8 = call ptr @malloc(i64 %alloc.bytes.8)
  store %t.Graphics zeroinitializer, ptr %alloc.ptr.8
  %r8 = ptrtoint ptr %alloc.ptr.8 to i64
  store ptr %alloc.ptr.8, ptr %cleanup.heap.slot.8
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
  %r14 = call i64 @"kira_native_impl_430"(i64 %r13)
  %cleanup.call.ptr.14 = inttoptr i64 %r14 to ptr
  store ptr %cleanup.call.ptr.14, ptr %cleanup.heap.slot.14
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
  %rt.args.4 = alloca [1 x %kira.bridge.value]
  %rt.slot.4.0 = getelementptr inbounds [1 x %kira.bridge.value], ptr %rt.args.4, i64 0, i64 0
  %rt.pack.4.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.4.0.1 = insertvalue %kira.bridge.value %rt.pack.4.0.0, i64 %r23, 2
  store %kira.bridge.value %rt.pack.4.0.1, ptr %rt.slot.4.0
  %rt.result.4 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 79, ptr %rt.args.4, i32 1, ptr %rt.result.4)
  call void @"kg_sample_lifetime_frame"()
  %r24 = load i64, ptr %local1
  %native.state.get.ptr.25 = inttoptr i64 %r24 to ptr
  %native.state.get.slot.25 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.25, i64 2
  %native.state.get.val.5 = load %kira.bridge.value, ptr %native.state.get.slot.25
  %r25 = extractvalue %kira.bridge.value %native.state.get.val.5, 2
  call void @"kg_maybe_request_quit_after_frame"(i64 %r25)
  %cleanup.heap.ptr.6 = load ptr, ptr %cleanup.heap.slot.8
  call void @free(ptr %cleanup.heap.ptr.6)
  %cleanup.heap.ptr.7 = load ptr, ptr %cleanup.heap.slot.14
  call void @free(ptr %cleanup.heap.ptr.7)
  call void @"kira_release_contents_Graphics"(ptr %local.storage.4)
  call void @"kira_release_contents_GraphicsFrame"(ptr %local.storage.5)
  ret void
}

define void @"kira_native_impl_11"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local1 = alloca i64
  %local2 = alloca i64
  %local.storage.2 = alloca %t.GraphicsApplication
  store %t.GraphicsApplication zeroinitializer, ptr %local.storage.2
  %local.storage.int.2 = ptrtoint ptr %local.storage.2 to i64
  store i64 %local.storage.int.2, ptr %local2
  %local3 = alloca i64
  %local4 = alloca i64
  %local.storage.4 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.4
  %local.storage.int.4 = ptrtoint ptr %local.storage.4 to i64
  store i64 %local.storage.int.4, ptr %local4
  %cleanup.heap.slot.3 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.3
  %cleanup.heap.slot.4 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.4
  %cleanup.heap.slot.5 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.5
  %cleanup.heap.slot.8 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.8
  %cleanup.heap.slot.12 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.12
  %cleanup.heap.slot.14 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.14
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
  %alloc.size.ptr.8 = getelementptr %t.Graphics, ptr null, i32 1
  %alloc.size.8 = ptrtoint ptr %alloc.size.ptr.8 to i64
  %alloc.empty.8 = icmp eq i64 %alloc.size.8, 0
  %alloc.bytes.8 = select i1 %alloc.empty.8, i64 1, i64 %alloc.size.8
  %alloc.ptr.8 = call ptr @malloc(i64 %alloc.bytes.8)
  store %t.Graphics zeroinitializer, ptr %alloc.ptr.8
  %r8 = ptrtoint ptr %alloc.ptr.8 to i64
  store ptr %alloc.ptr.8, ptr %cleanup.heap.slot.8
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
  call void @"kg_report_lifetime"()
  call void @"sg_shutdown"()
  %cleanup.heap.ptr.2 = load ptr, ptr %cleanup.heap.slot.8
  call void @free(ptr %cleanup.heap.ptr.2)
  call void @"kira_release_contents_Graphics"(ptr %local.storage.4)
  ret void
}

define i64 @"kira_native_impl_54"(%kira.string %arg0, i64 %arg1, i64 %arg2, i64 %arg3) {
entry:
  %local0 = alloca %kira.string
  %local1 = alloca i64
  %local2 = alloca i64
  %local3 = alloca i64
  %local4 = alloca i64
  %local5 = alloca i64
  %local6 = alloca i64
  store %kira.string %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  store i64 %arg2, ptr %local2
  store i64 %arg3, ptr %local3
  %r0 = load i64, ptr %local1
  store i64 %r0, ptr %local4
  %r1 = load i64, ptr %local2
  store i64 %r1, ptr %local5
  %r2 = load i64, ptr %local3
  store i64 %r2, ptr %local6
  %r3 = load %kira.string, ptr %local0
  %r4 = load i64, ptr %local4
  %r5 = load i64, ptr %local5
  %r6 = load i64, ptr %local6
  %call.arg.str.ptr.0 = extractvalue %kira.string %r3, 0
  %call.arg.str.len.0 = extractvalue %kira.string %r3, 1
  %call.arg.str.alloclen.0 = add i64 %call.arg.str.len.0, 1
  %call.arg.14.0 = call ptr @malloc(i64 %call.arg.str.alloclen.0)
  call void @llvm.memcpy.p0.p0.i64(ptr %call.arg.14.0, ptr %call.arg.str.ptr.0, i64 %call.arg.str.len.0, i1 false)
  %call.arg.str.null.0 = getelementptr inbounds i8, ptr %call.arg.14.0, i64 %call.arg.str.len.0
  store i8 0, ptr %call.arg.str.null.0
  %call.int.7 = call i32 @"kg_begin_float_buffer_upload"(ptr %call.arg.14.0, i64 %r4, i64 %r5, i64 %r6)
  %r7.sext = sext i32 %call.int.7 to i64
  %r7 = add i64 %r7.sext, 0
  ret i64 %r7
}

define void @"kira_native_impl_55"(i64 %arg0, i64 %arg1, double %arg2) {
entry:
  %local0 = alloca i64
  %local1 = alloca i64
  %local2 = alloca double
  %local3 = alloca i64
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  store double %arg2, ptr %local2
  %r0 = load i64, ptr %local1
  store i64 %r0, ptr %local3
  %r1 = load i64, ptr %local0
  %r2 = load i64, ptr %local3
  %r3 = load double, ptr %local2
  %call.arg.15.0 = trunc i64 %r1 to i32
  call void @"kg_set_float_buffer_upload_value"(i32 %call.arg.15.0, i64 %r2, double %r3)
  ret void
}

define i64 @"kira_native_impl_56"(i64 %arg0) {
entry:
  %local0 = alloca i64
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %call.arg.16.0 = trunc i64 %r0 to i32
  %call.int.1 = call i32 @"kg_finalize_float_buffer_upload"(i32 %call.arg.16.0)
  %r1.sext = sext i32 %call.int.1 to i64
  %r1 = add i64 %r1.sext, 0
  ret i64 %r1
}

define i64 @"kira_native_impl_57"(%kira.string %arg0, i64 %arg1, i64 %arg2) {
entry:
  %local0 = alloca %kira.string
  %local1 = alloca i64
  %local2 = alloca i64
  %local3 = alloca i64
  %local4 = alloca i64
  store %kira.string %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  store i64 %arg2, ptr %local2
  %r0 = load i64, ptr %local1
  store i64 %r0, ptr %local3
  %r1 = load i64, ptr %local2
  store i64 %r1, ptr %local4
  %r2 = load %kira.string, ptr %local0
  %r3 = load i64, ptr %local3
  %r4 = load i64, ptr %local4
  %call.arg.str.ptr.0 = extractvalue %kira.string %r2, 0
  %call.arg.str.len.0 = extractvalue %kira.string %r2, 1
  %call.arg.str.alloclen.0 = add i64 %call.arg.str.len.0, 1
  %call.arg.17.0 = call ptr @malloc(i64 %call.arg.str.alloclen.0)
  call void @llvm.memcpy.p0.p0.i64(ptr %call.arg.17.0, ptr %call.arg.str.ptr.0, i64 %call.arg.str.len.0, i1 false)
  %call.arg.str.null.0 = getelementptr inbounds i8, ptr %call.arg.17.0, i64 %call.arg.str.len.0
  store i8 0, ptr %call.arg.str.null.0
  %call.int.5 = call i32 @"kg_begin_index_buffer_upload"(ptr %call.arg.17.0, i64 %r3, i64 %r4)
  %r5.sext = sext i32 %call.int.5 to i64
  %r5 = add i64 %r5.sext, 0
  ret i64 %r5
}

define void @"kira_native_impl_58"(i64 %arg0, i64 %arg1, i64 %arg2) {
entry:
  %local0 = alloca i64
  %local1 = alloca i64
  %local2 = alloca i64
  %local3 = alloca i64
  %local4 = alloca i64
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  store i64 %arg2, ptr %local2
  %r0 = load i64, ptr %local1
  store i64 %r0, ptr %local3
  %r1 = load i64, ptr %local2
  store i64 %r1, ptr %local4
  %r2 = load i64, ptr %local0
  %r3 = load i64, ptr %local3
  %r4 = load i64, ptr %local4
  %call.arg.18.0 = trunc i64 %r2 to i32
  call void @"kg_set_index_buffer_upload_value"(i32 %call.arg.18.0, i64 %r3, i64 %r4)
  ret void
}

define i64 @"kira_native_impl_59"(i64 %arg0) {
entry:
  %local0 = alloca i64
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %call.arg.19.0 = trunc i64 %r0 to i32
  %call.int.1 = call i32 @"kg_finalize_index_buffer_upload"(i32 %call.arg.19.0)
  %r1.sext = sext i32 %call.int.1 to i64
  %r1 = add i64 %r1.sext, 0
  ret i64 %r1
}

define void @"kira_native_impl_60"(i64 %arg0) {
entry:
  %local0 = alloca i64
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %r1 = add i64 0, 0
  %r2 = icmp ne i64 %r0, %r1
  br i1 %r2, label %kira_label_0, label %kira_label_1
kira_label_0:
  %r3 = load i64, ptr %local0
  %call.arg.20.0 = trunc i64 %r3 to i32
  call void @"kg_destroy_buffer_id"(i32 %call.arg.20.0)
  br label %kira_label_1
kira_label_1:
  ret void
}

define i1 @"kira_native_impl_65"(%kira.string %arg0, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, double %arg7, double %arg8, double %arg9, double %arg10, i64 %arg11, i64 %arg12, i64 %arg13, i64 %arg14, i64 %arg15, i64 %arg16, i64 %arg17, i64 %arg18, double %arg19, i64 %arg20, i64 %arg21, i64 %arg22, i64 %arg23, i64 %arg24, i64 %arg25, i64 %arg26) {
entry:
  %local0 = alloca %kira.string
  %local1 = alloca i64
  %local2 = alloca i64
  %local3 = alloca i64
  %local4 = alloca i64
  %local5 = alloca i64
  %local6 = alloca i64
  %local7 = alloca double
  %local8 = alloca double
  %local9 = alloca double
  %local10 = alloca double
  %local11 = alloca i64
  %local12 = alloca i64
  %local13 = alloca i64
  %local14 = alloca i64
  %local15 = alloca i64
  %local16 = alloca i64
  %local17 = alloca i64
  %local18 = alloca i64
  %local19 = alloca double
  %local20 = alloca i64
  %local21 = alloca i64
  %local22 = alloca i64
  %local23 = alloca i64
  %local24 = alloca i64
  %local25 = alloca i64
  %local26 = alloca i64
  store %kira.string %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  store i64 %arg2, ptr %local2
  store i64 %arg3, ptr %local3
  store i64 %arg4, ptr %local4
  store i64 %arg5, ptr %local5
  store i64 %arg6, ptr %local6
  store double %arg7, ptr %local7
  store double %arg8, ptr %local8
  store double %arg9, ptr %local9
  store double %arg10, ptr %local10
  store i64 %arg11, ptr %local11
  store i64 %arg12, ptr %local12
  store i64 %arg13, ptr %local13
  store i64 %arg14, ptr %local14
  store i64 %arg15, ptr %local15
  store i64 %arg16, ptr %local16
  store i64 %arg17, ptr %local17
  store i64 %arg18, ptr %local18
  store double %arg19, ptr %local19
  store i64 %arg20, ptr %local20
  store i64 %arg21, ptr %local21
  store i64 %arg22, ptr %local22
  store i64 %arg23, ptr %local23
  store i64 %arg24, ptr %local24
  store i64 %arg25, ptr %local25
  store i64 %arg26, ptr %local26
  %r0 = load %kira.string, ptr %local0
  %r1 = load i64, ptr %local1
  %r2 = load i64, ptr %local2
  %r3 = load i64, ptr %local3
  %r4 = load i64, ptr %local4
  %r5 = load i64, ptr %local5
  %r6 = load i64, ptr %local6
  %r7 = load double, ptr %local7
  %r8 = load double, ptr %local8
  %r9 = load double, ptr %local9
  %r10 = load double, ptr %local10
  %r11 = load i64, ptr %local11
  %r12 = load i64, ptr %local12
  %r13 = load i64, ptr %local13
  %r14 = load i64, ptr %local14
  %r15 = load i64, ptr %local15
  %r16 = load i64, ptr %local16
  %r17 = load i64, ptr %local17
  %r18 = load i64, ptr %local18
  %r19 = load double, ptr %local19
  %r20 = load i64, ptr %local20
  %r21 = load i64, ptr %local21
  %r22 = load i64, ptr %local22
  %r23 = load i64, ptr %local23
  %r24 = load i64, ptr %local24
  %r25 = load i64, ptr %local25
  %r26 = load i64, ptr %local26
  %call.arg.str.ptr.0 = extractvalue %kira.string %r0, 0
  %call.arg.str.len.0 = extractvalue %kira.string %r0, 1
  %call.arg.str.alloclen.0 = add i64 %call.arg.str.len.0, 1
  %call.arg.30.0 = call ptr @malloc(i64 %call.arg.str.alloclen.0)
  call void @llvm.memcpy.p0.p0.i64(ptr %call.arg.30.0, ptr %call.arg.str.ptr.0, i64 %call.arg.str.len.0, i1 false)
  %call.arg.str.null.0 = getelementptr inbounds i8, ptr %call.arg.30.0, i64 %call.arg.str.len.0
  store i8 0, ptr %call.arg.str.null.0
  %call.arg.30.2 = trunc i64 %r2 to i32
  %call.arg.30.12 = trunc i64 %r12 to i32
  %call.arg.30.16 = trunc i64 %r16 to i32
  %call.arg.30.22 = trunc i64 %r22 to i32
  %call.int.27 = call i32 @"kg_begin_render_pass"(ptr %call.arg.30.0, i64 %r1, i32 %call.arg.30.2, i64 %r3, i64 %r4, i64 %r5, i64 %r6, double %r7, double %r8, double %r9, double %r10, i64 %r11, i32 %call.arg.30.12, i64 %r13, i64 %r14, i64 %r15, i32 %call.arg.30.16, i64 %r17, i64 %r18, double %r19, i64 %r20, i64 %r21, i32 %call.arg.30.22, i64 %r23, i64 %r24, i64 %r25, i64 %r26)
  %r27.sext = sext i32 %call.int.27 to i64
  %r27 = add i64 %r27.sext, 0
  %r28 = add i64 0, 0
  %r29 = icmp ne i64 %r27, %r28
  ret i1 %r29
}

define i1 @"kira_native_impl_66"(i64 %arg0, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7, i64 %arg8, i64 %arg9, i64 %arg10, i64 %arg11, i64 %arg12, i64 %arg13, i64 %arg14, i64 %arg15) {
entry:
  %local0 = alloca i64
  %local1 = alloca i64
  %local2 = alloca i64
  %local3 = alloca i64
  %local4 = alloca i64
  %local5 = alloca i64
  %local6 = alloca i64
  %local7 = alloca i64
  %local8 = alloca i64
  %local9 = alloca i64
  %local10 = alloca i64
  %local11 = alloca i64
  %local12 = alloca i64
  %local13 = alloca i64
  %local14 = alloca i64
  %local15 = alloca i64
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  store i64 %arg2, ptr %local2
  store i64 %arg3, ptr %local3
  store i64 %arg4, ptr %local4
  store i64 %arg5, ptr %local5
  store i64 %arg6, ptr %local6
  store i64 %arg7, ptr %local7
  store i64 %arg8, ptr %local8
  store i64 %arg9, ptr %local9
  store i64 %arg10, ptr %local10
  store i64 %arg11, ptr %local11
  store i64 %arg12, ptr %local12
  store i64 %arg13, ptr %local13
  store i64 %arg14, ptr %local14
  store i64 %arg15, ptr %local15
  %r0 = load i64, ptr %local0
  %r1 = load i64, ptr %local1
  %r2 = load i64, ptr %local2
  %r3 = load i64, ptr %local3
  %r4 = load i64, ptr %local4
  %r5 = load i64, ptr %local5
  %r6 = load i64, ptr %local6
  %r7 = load i64, ptr %local7
  %r8 = load i64, ptr %local8
  %r9 = load i64, ptr %local9
  %r10 = load i64, ptr %local10
  %r11 = load i64, ptr %local11
  %r12 = load i64, ptr %local12
  %r13 = load i64, ptr %local13
  %r14 = load i64, ptr %local14
  %r15 = load i64, ptr %local15
  %call.arg.31.0 = trunc i64 %r0 to i32
  %call.arg.31.1 = trunc i64 %r1 to i32
  %call.arg.31.3 = trunc i64 %r3 to i32
  %call.arg.31.5 = trunc i64 %r5 to i32
  %call.arg.31.7 = trunc i64 %r7 to i32
  %call.arg.31.9 = trunc i64 %r9 to i32
  %call.arg.31.11 = trunc i64 %r11 to i32
  %call.int.16 = call i32 @"kg_apply_pipeline_bindings_and_draw"(i32 %call.arg.31.0, i32 %call.arg.31.1, i64 %r2, i32 %call.arg.31.3, i64 %r4, i32 %call.arg.31.5, i64 %r6, i32 %call.arg.31.7, i64 %r8, i32 %call.arg.31.9, i64 %r10, i32 %call.arg.31.11, i64 %r12, i64 %r13, i64 %r14, i64 %r15)
  %r16.sext = sext i32 %call.int.16 to i64
  %r16 = add i64 %r16.sext, 0
  %r17 = add i64 0, 0
  %r18 = icmp ne i64 %r16, %r17
  ret i1 %r18
}

define void @"kira_native_impl_67"() {
entry:
  call void @"kg_end_pass_and_commit"()
  ret void
}

define void @"kira_native_impl_68"() {
entry:
  call void @"sapp_request_quit"()
  ret void
}

define void @"kira_native_impl_69"(i64 %arg0, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7) {
entry:
  %local0 = alloca i64
  %local1 = alloca i64
  %local2 = alloca i64
  %local3 = alloca i64
  %local4 = alloca i64
  %local5 = alloca i64
  %local6 = alloca i64
  %local7 = alloca i64
  %local8 = alloca i64
  %local9 = alloca i64
  %local10 = alloca i64
  %local11 = alloca i64
  %local12 = alloca i64
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  store i64 %arg2, ptr %local2
  store i64 %arg3, ptr %local3
  store i64 %arg4, ptr %local4
  store i64 %arg5, ptr %local5
  store i64 %arg6, ptr %local6
  store i64 %arg7, ptr %local7
  %r0 = load i64, ptr %local2
  store i64 %r0, ptr %local8
  %r1 = load i64, ptr %local4
  store i64 %r1, ptr %local9
  %r2 = load i64, ptr %local5
  store i64 %r2, ptr %local10
  %r3 = load i64, ptr %local6
  store i64 %r3, ptr %local11
  %r4 = load i64, ptr %local7
  store i64 %r4, ptr %local12
  %r5 = load i64, ptr %local0
  %r6 = load i64, ptr %local1
  %r7 = load i64, ptr %local8
  %r8 = load i64, ptr %local3
  %r9 = load i64, ptr %local9
  %r10 = load i64, ptr %local10
  %r11 = load i64, ptr %local11
  %r12 = load i64, ptr %local12
  %call.arg.32.0 = trunc i64 %r5 to i32
  %call.arg.32.1 = trunc i64 %r6 to i32
  %call.arg.32.3 = trunc i64 %r8 to i32
  call void @"kg_log_submit_state"(i32 %call.arg.32.0, i32 %call.arg.32.1, i64 %r7, i32 %call.arg.32.3, i64 %r9, i64 %r10, i64 %r11, i64 %r12)
  ret void
}

define i64 @"kira_native_impl_70"(i64 %arg0, %kira.string %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7, i64 %arg8, i64 %arg9, i64 %arg10, i64 %arg11, i64 %arg12, i64 %arg13, i64 %arg14, i64 %arg15, i64 %arg16, i64 %arg17, i64 %arg18, i64 %arg19, i64 %arg20, i64 %arg21, i64 %arg22, i64 %arg23, i64 %arg24, i64 %arg25, i64 %arg26) {
entry:
  %local0 = alloca i64
  %local1 = alloca %kira.string
  %local2 = alloca i64
  %local3 = alloca i64
  %local4 = alloca i64
  %local5 = alloca i64
  %local6 = alloca i64
  %local7 = alloca i64
  %local8 = alloca i64
  %local9 = alloca i64
  %local10 = alloca i64
  %local11 = alloca i64
  %local12 = alloca i64
  %local13 = alloca i64
  %local14 = alloca i64
  %local15 = alloca i64
  %local16 = alloca i64
  %local17 = alloca i64
  %local18 = alloca i64
  %local19 = alloca i64
  %local20 = alloca i64
  %local21 = alloca i64
  %local22 = alloca i64
  %local23 = alloca i64
  %local24 = alloca i64
  %local25 = alloca i64
  %local26 = alloca i64
  store i64 %arg0, ptr %local0
  store %kira.string %arg1, ptr %local1
  store i64 %arg2, ptr %local2
  store i64 %arg3, ptr %local3
  store i64 %arg4, ptr %local4
  store i64 %arg5, ptr %local5
  store i64 %arg6, ptr %local6
  store i64 %arg7, ptr %local7
  store i64 %arg8, ptr %local8
  store i64 %arg9, ptr %local9
  store i64 %arg10, ptr %local10
  store i64 %arg11, ptr %local11
  store i64 %arg12, ptr %local12
  store i64 %arg13, ptr %local13
  store i64 %arg14, ptr %local14
  store i64 %arg15, ptr %local15
  store i64 %arg16, ptr %local16
  store i64 %arg17, ptr %local17
  store i64 %arg18, ptr %local18
  store i64 %arg19, ptr %local19
  store i64 %arg20, ptr %local20
  store i64 %arg21, ptr %local21
  store i64 %arg22, ptr %local22
  store i64 %arg23, ptr %local23
  store i64 %arg24, ptr %local24
  store i64 %arg25, ptr %local25
  store i64 %arg26, ptr %local26
  %r0 = load i64, ptr %local0
  %r1 = load %kira.string, ptr %local1
  %r2 = load i64, ptr %local2
  %r3 = load i64, ptr %local3
  %r4 = load i64, ptr %local4
  %r5 = load i64, ptr %local5
  %r6 = load i64, ptr %local6
  %r7 = load i64, ptr %local7
  %r8 = load i64, ptr %local8
  %r9 = load i64, ptr %local9
  %r10 = load i64, ptr %local10
  %r11 = load i64, ptr %local11
  %r12 = load i64, ptr %local12
  %r13 = load i64, ptr %local13
  %r14 = load i64, ptr %local14
  %r15 = load i64, ptr %local15
  %r16 = load i64, ptr %local16
  %r17 = load i64, ptr %local17
  %r18 = load i64, ptr %local18
  %r19 = load i64, ptr %local19
  %r20 = load i64, ptr %local20
  %r21 = load i64, ptr %local21
  %r22 = load i64, ptr %local22
  %r23 = load i64, ptr %local23
  %r24 = load i64, ptr %local24
  %r25 = load i64, ptr %local25
  %r26 = load i64, ptr %local26
  %call.arg.47.0 = trunc i64 %r0 to i32
  %call.arg.str.ptr.0 = extractvalue %kira.string %r1, 0
  %call.arg.str.len.0 = extractvalue %kira.string %r1, 1
  %call.arg.str.alloclen.0 = add i64 %call.arg.str.len.0, 1
  %call.arg.47.1 = call ptr @malloc(i64 %call.arg.str.alloclen.0)
  call void @llvm.memcpy.p0.p0.i64(ptr %call.arg.47.1, ptr %call.arg.str.ptr.0, i64 %call.arg.str.len.0, i1 false)
  %call.arg.str.null.0 = getelementptr inbounds i8, ptr %call.arg.47.1, i64 %call.arg.str.len.0
  store i8 0, ptr %call.arg.str.null.0
  %call.int.27 = call i32 @"kg_make_pipeline_detailed"(i32 %call.arg.47.0, ptr %call.arg.47.1, i64 %r2, i64 %r3, i64 %r4, i64 %r5, i64 %r6, i64 %r7, i64 %r8, i64 %r9, i64 %r10, i64 %r11, i64 %r12, i64 %r13, i64 %r14, i64 %r15, i64 %r16, i64 %r17, i64 %r18, i64 %r19, i64 %r20, i64 %r21, i64 %r22, i64 %r23, i64 %r24, i64 %r25, i64 %r26)
  %r27.sext = sext i32 %call.int.27 to i64
  %r27 = add i64 %r27.sext, 0
  ret i64 %r27
}

define void @"kira_native_impl_72"(i64 %arg0) {
entry:
  %local0 = alloca i64
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %r1 = add i64 0, 0
  %r2 = icmp ne i64 %r0, %r1
  br i1 %r2, label %kira_label_0, label %kira_label_1
kira_label_0:
  %r3 = load i64, ptr %local0
  %call.arg.40.0 = trunc i64 %r3 to i32
  call void @"kg_destroy_pipeline_id"(i32 %call.arg.40.0)
  br label %kira_label_1
kira_label_1:
  ret void
}

define i64 @"kira_native_impl_73"(%kira.string %arg0, %kira.string %arg1, %kira.string %arg2, %kira.string %arg3, %kira.string %arg4) {
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
  %call.arg.str.ptr.0 = extractvalue %kira.string %r0, 0
  %call.arg.str.len.0 = extractvalue %kira.string %r0, 1
  %call.arg.str.alloclen.0 = add i64 %call.arg.str.len.0, 1
  %call.arg.48.0 = call ptr @malloc(i64 %call.arg.str.alloclen.0)
  call void @llvm.memcpy.p0.p0.i64(ptr %call.arg.48.0, ptr %call.arg.str.ptr.0, i64 %call.arg.str.len.0, i1 false)
  %call.arg.str.null.0 = getelementptr inbounds i8, ptr %call.arg.48.0, i64 %call.arg.str.len.0
  store i8 0, ptr %call.arg.str.null.0
  %call.arg.str.ptr.1 = extractvalue %kira.string %r1, 0
  %call.arg.str.len.1 = extractvalue %kira.string %r1, 1
  %call.arg.str.alloclen.1 = add i64 %call.arg.str.len.1, 1
  %call.arg.48.1 = call ptr @malloc(i64 %call.arg.str.alloclen.1)
  call void @llvm.memcpy.p0.p0.i64(ptr %call.arg.48.1, ptr %call.arg.str.ptr.1, i64 %call.arg.str.len.1, i1 false)
  %call.arg.str.null.1 = getelementptr inbounds i8, ptr %call.arg.48.1, i64 %call.arg.str.len.1
  store i8 0, ptr %call.arg.str.null.1
  %call.arg.str.ptr.2 = extractvalue %kira.string %r2, 0
  %call.arg.str.len.2 = extractvalue %kira.string %r2, 1
  %call.arg.str.alloclen.2 = add i64 %call.arg.str.len.2, 1
  %call.arg.48.2 = call ptr @malloc(i64 %call.arg.str.alloclen.2)
  call void @llvm.memcpy.p0.p0.i64(ptr %call.arg.48.2, ptr %call.arg.str.ptr.2, i64 %call.arg.str.len.2, i1 false)
  %call.arg.str.null.2 = getelementptr inbounds i8, ptr %call.arg.48.2, i64 %call.arg.str.len.2
  store i8 0, ptr %call.arg.str.null.2
  %call.arg.str.ptr.3 = extractvalue %kira.string %r3, 0
  %call.arg.str.len.3 = extractvalue %kira.string %r3, 1
  %call.arg.str.alloclen.3 = add i64 %call.arg.str.len.3, 1
  %call.arg.48.3 = call ptr @malloc(i64 %call.arg.str.alloclen.3)
  call void @llvm.memcpy.p0.p0.i64(ptr %call.arg.48.3, ptr %call.arg.str.ptr.3, i64 %call.arg.str.len.3, i1 false)
  %call.arg.str.null.3 = getelementptr inbounds i8, ptr %call.arg.48.3, i64 %call.arg.str.len.3
  store i8 0, ptr %call.arg.str.null.3
  %call.arg.str.ptr.4 = extractvalue %kira.string %r4, 0
  %call.arg.str.len.4 = extractvalue %kira.string %r4, 1
  %call.arg.str.alloclen.4 = add i64 %call.arg.str.len.4, 1
  %call.arg.48.4 = call ptr @malloc(i64 %call.arg.str.alloclen.4)
  call void @llvm.memcpy.p0.p0.i64(ptr %call.arg.48.4, ptr %call.arg.str.ptr.4, i64 %call.arg.str.len.4, i1 false)
  %call.arg.str.null.4 = getelementptr inbounds i8, ptr %call.arg.48.4, i64 %call.arg.str.len.4
  store i8 0, ptr %call.arg.str.null.4
  %call.int.5 = call i32 @"kg_make_shader"(ptr %call.arg.48.0, ptr %call.arg.48.1, ptr %call.arg.48.2, ptr %call.arg.48.3, ptr %call.arg.48.4)
  %r5.sext = sext i32 %call.int.5 to i64
  %r5 = add i64 %r5.sext, 0
  ret i64 %r5
}

define i64 @"kira_native_impl_74"(%kira.string %arg0, %kira.string %arg1, %kira.string %arg2) {
entry:
  %local0 = alloca %kira.string
  %local1 = alloca %kira.string
  %local2 = alloca %kira.string
  store %kira.string %arg0, ptr %local0
  store %kira.string %arg1, ptr %local1
  store %kira.string %arg2, ptr %local2
  %r0 = load %kira.string, ptr %local0
  %r1 = load %kira.string, ptr %local1
  %r2 = load %kira.string, ptr %local2
  %call.arg.str.ptr.0 = extractvalue %kira.string %r0, 0
  %call.arg.str.len.0 = extractvalue %kira.string %r0, 1
  %call.arg.str.alloclen.0 = add i64 %call.arg.str.len.0, 1
  %call.arg.49.0 = call ptr @malloc(i64 %call.arg.str.alloclen.0)
  call void @llvm.memcpy.p0.p0.i64(ptr %call.arg.49.0, ptr %call.arg.str.ptr.0, i64 %call.arg.str.len.0, i1 false)
  %call.arg.str.null.0 = getelementptr inbounds i8, ptr %call.arg.49.0, i64 %call.arg.str.len.0
  store i8 0, ptr %call.arg.str.null.0
  %call.arg.str.ptr.1 = extractvalue %kira.string %r1, 0
  %call.arg.str.len.1 = extractvalue %kira.string %r1, 1
  %call.arg.str.alloclen.1 = add i64 %call.arg.str.len.1, 1
  %call.arg.49.1 = call ptr @malloc(i64 %call.arg.str.alloclen.1)
  call void @llvm.memcpy.p0.p0.i64(ptr %call.arg.49.1, ptr %call.arg.str.ptr.1, i64 %call.arg.str.len.1, i1 false)
  %call.arg.str.null.1 = getelementptr inbounds i8, ptr %call.arg.49.1, i64 %call.arg.str.len.1
  store i8 0, ptr %call.arg.str.null.1
  %call.arg.str.ptr.2 = extractvalue %kira.string %r2, 0
  %call.arg.str.len.2 = extractvalue %kira.string %r2, 1
  %call.arg.str.alloclen.2 = add i64 %call.arg.str.len.2, 1
  %call.arg.49.2 = call ptr @malloc(i64 %call.arg.str.alloclen.2)
  call void @llvm.memcpy.p0.p0.i64(ptr %call.arg.49.2, ptr %call.arg.str.ptr.2, i64 %call.arg.str.len.2, i1 false)
  %call.arg.str.null.2 = getelementptr inbounds i8, ptr %call.arg.49.2, i64 %call.arg.str.len.2
  store i8 0, ptr %call.arg.str.null.2
  %call.int.3 = call i32 @"kg_make_ksl_shader"(ptr %call.arg.49.0, ptr %call.arg.49.1, ptr %call.arg.49.2)
  %r3.sext = sext i32 %call.int.3 to i64
  %r3 = add i64 %r3.sext, 0
  ret i64 %r3
}

define void @"kira_native_impl_75"(i64 %arg0) {
entry:
  %local0 = alloca i64
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %r1 = add i64 0, 0
  %r2 = icmp ne i64 %r0, %r1
  br i1 %r2, label %kira_label_0, label %kira_label_1
kira_label_0:
  %r3 = load i64, ptr %local0
  %call.arg.46.0 = trunc i64 %r3 to i32
  call void @"kg_destroy_shader_id"(i32 %call.arg.46.0)
  br label %kira_label_1
kira_label_1:
  ret void
}

define i64 @"kira_native_impl_76"(%kira.string %arg0, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6) {
entry:
  %local0 = alloca %kira.string
  %local1 = alloca i64
  %local2 = alloca i64
  %local3 = alloca i64
  %local4 = alloca i64
  %local5 = alloca i64
  %local6 = alloca i64
  %local7 = alloca i64
  %local8 = alloca i64
  %local9 = alloca i64
  %local10 = alloca i64
  %local11 = alloca i64
  %local12 = alloca i64
  store %kira.string %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  store i64 %arg2, ptr %local2
  store i64 %arg3, ptr %local3
  store i64 %arg4, ptr %local4
  store i64 %arg5, ptr %local5
  store i64 %arg6, ptr %local6
  %r0 = load i64, ptr %local1
  store i64 %r0, ptr %local7
  %r1 = load i64, ptr %local2
  store i64 %r1, ptr %local8
  %r2 = load i64, ptr %local3
  store i64 %r2, ptr %local9
  %r3 = load i64, ptr %local4
  store i64 %r3, ptr %local10
  %r4 = load i64, ptr %local5
  store i64 %r4, ptr %local11
  %r5 = load i64, ptr %local6
  store i64 %r5, ptr %local12
  %r6 = load %kira.string, ptr %local0
  %r7 = load i64, ptr %local7
  %r8 = load i64, ptr %local8
  %r9 = load i64, ptr %local9
  %r10 = load i64, ptr %local10
  %r11 = load i64, ptr %local11
  %r12 = load i64, ptr %local12
  %call.arg.str.ptr.0 = extractvalue %kira.string %r6, 0
  %call.arg.str.len.0 = extractvalue %kira.string %r6, 1
  %call.arg.str.alloclen.0 = add i64 %call.arg.str.len.0, 1
  %call.arg.28.0 = call ptr @malloc(i64 %call.arg.str.alloclen.0)
  call void @llvm.memcpy.p0.p0.i64(ptr %call.arg.28.0, ptr %call.arg.str.ptr.0, i64 %call.arg.str.len.0, i1 false)
  %call.arg.str.null.0 = getelementptr inbounds i8, ptr %call.arg.28.0, i64 %call.arg.str.len.0
  store i8 0, ptr %call.arg.str.null.0
  %call.int.13 = call i32 @"kg_create_texture_id"(ptr %call.arg.28.0, i64 %r7, i64 %r8, i64 %r9, i64 %r10, i64 %r11, i64 %r12)
  %r13.sext = sext i32 %call.int.13 to i64
  %r13 = add i64 %r13.sext, 0
  ret i64 %r13
}

define void @"kira_native_impl_77"(i64 %arg0) {
entry:
  %local0 = alloca i64
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %r1 = add i64 0, 0
  %r2 = icmp ne i64 %r0, %r1
  br i1 %r2, label %kira_label_0, label %kira_label_1
kira_label_0:
  %r3 = load i64, ptr %local0
  %call.arg.29.0 = trunc i64 %r3 to i32
  call void @"kg_destroy_texture_id"(i32 %call.arg.29.0)
  br label %kira_label_1
kira_label_1:
  ret void
}

define void @"kira_native_impl_78"(%kira.string %arg0) {
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

define i64 @"kira_native_impl_85"() {
entry:
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.1 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.1
  %alloc.size.ptr.0 = getelementptr %t.GraphicsBuffer, ptr null, i32 1
  %alloc.size.0 = ptrtoint ptr %alloc.size.ptr.0 to i64
  %alloc.empty.0 = icmp eq i64 %alloc.size.0, 0
  %alloc.bytes.0 = select i1 %alloc.empty.0, i64 1, i64 %alloc.size.0
  %alloc.ptr.0 = call ptr @malloc(i64 %alloc.bytes.0)
  store %t.GraphicsBuffer zeroinitializer, ptr %alloc.ptr.0
  %r0 = ptrtoint ptr %alloc.ptr.0 to i64
  store ptr %alloc.ptr.0, ptr %cleanup.heap.slot.0
  %alloc.size.ptr.1 = getelementptr %t.BackendBufferHandle, ptr null, i32 1
  %alloc.size.1 = ptrtoint ptr %alloc.size.ptr.1 to i64
  %alloc.empty.1 = icmp eq i64 %alloc.size.1, 0
  %alloc.bytes.1 = select i1 %alloc.empty.1, i64 1, i64 %alloc.size.1
  %alloc.ptr.1 = call ptr @malloc(i64 %alloc.bytes.1)
  store %t.BackendBufferHandle zeroinitializer, ptr %alloc.ptr.1
  %r1 = ptrtoint ptr %alloc.ptr.1 to i64
  store ptr %alloc.ptr.1, ptr %cleanup.heap.slot.1
  %r2 = add i64 0, 0
  %field.base.3 = inttoptr i64 %r1 to ptr
  %field.ptr.3 = getelementptr inbounds %t.BackendBufferHandle, ptr %field.base.3, i32 0, i32 0
  %r3 = ptrtoint ptr %field.ptr.3 to i64
  %store.ptr.2 = inttoptr i64 %r3 to ptr
  %store.cast.2 = trunc i64 %r2 to i32
  store i32 %store.cast.2, ptr %store.ptr.2
  %field.base.4 = inttoptr i64 %r0 to ptr
  %field.ptr.4 = getelementptr inbounds %t.GraphicsBuffer, ptr %field.base.4, i32 0, i32 0
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %copy.dst.4 = inttoptr i64 %r4 to ptr
  %copy.src.1 = inttoptr i64 %r1 to ptr
  %copy.val.4 = load %t.BackendBufferHandle, ptr %copy.src.1
  store %t.BackendBufferHandle %copy.val.4, ptr %copy.dst.4
  %r5 = add i64 0, 0
  %field.base.6 = inttoptr i64 %r0 to ptr
  %field.ptr.6 = getelementptr inbounds %t.GraphicsBuffer, ptr %field.base.6, i32 0, i32 1
  %r6 = ptrtoint ptr %field.ptr.6 to i64
  %store.ptr.5 = inttoptr i64 %r6 to ptr
  %store.cast.5 = trunc i64 %r5 to i32
  store i32 %store.cast.5, ptr %store.ptr.5
  %cleanup.heap.ptr.0 = load ptr, ptr %cleanup.heap.slot.1
  call void @free(ptr %cleanup.heap.ptr.0)
  ret i64 %r0
}

define i64 @"kira_native_impl_89"() {
entry:
  %r0 = add i64 0, 1
  ret i64 %r0
}

define i64 @"kira_native_impl_95"() {
entry:
  %r0 = add i64 0, 1
  ret i64 %r0
}

define i64 @"kira_native_impl_98"() {
entry:
  %r0 = add i64 0, 1
  ret i64 %r0
}

define i64 @"kira_native_impl_100"() {
entry:
  %r0 = add i64 0, 3
  ret i64 %r0
}

define i64 @"kira_native_impl_101"() {
entry:
  %r0 = add i64 0, 1
  ret i64 %r0
}

define i64 @"kira_native_impl_104"() {
entry:
  %r0 = add i64 0, 1
  ret i64 %r0
}

define i64 @"kira_native_impl_114"() {
entry:
  %r0 = add i64 0, 6
  ret i64 %r0
}

define i64 @"kira_native_impl_115"() {
entry:
  %r0 = add i64 0, 0
  ret i64 %r0
}

define i64 @"kira_native_impl_118"() {
entry:
  %r0 = add i64 0, 1
  ret i64 %r0
}

define i64 @"kira_native_impl_121"() {
entry:
  %r0 = add i64 0, 2
  ret i64 %r0
}

define i64 @"kira_native_impl_122"() {
entry:
  %r0 = add i64 0, 1
  ret i64 %r0
}

define i64 @"kira_native_impl_125"() {
entry:
  %r0 = add i64 0, 1
  ret i64 %r0
}

define i64 @"kira_native_impl_127"() {
entry:
  %r0 = add i64 0, 1
  ret i64 %r0
}

define i1 @"kira_native_impl_429"(i64 %arg0, i64 %arg1, %kira.string %arg2, %kira.string %arg3) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local2 = alloca %kira.string
  %local3 = alloca %kira.string
  %local4 = alloca i64
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  store %kira.string %arg2, ptr %local2
  store %kira.string %arg3, ptr %local3
  %r0 = load i64, ptr %local1
  store i64 %r0, ptr %local4
  %r1 = load i64, ptr %local4
  %r2 = load %kira.string, ptr %local2
  %r3 = load %kira.string, ptr %local3
  %call.arg.str.ptr.0 = extractvalue %kira.string %r2, 0
  %call.arg.str.len.0 = extractvalue %kira.string %r2, 1
  %call.arg.str.alloclen.0 = add i64 %call.arg.str.len.0, 1
  %call.arg.45.1 = call ptr @malloc(i64 %call.arg.str.alloclen.0)
  call void @llvm.memcpy.p0.p0.i64(ptr %call.arg.45.1, ptr %call.arg.str.ptr.0, i64 %call.arg.str.len.0, i1 false)
  %call.arg.str.null.0 = getelementptr inbounds i8, ptr %call.arg.45.1, i64 %call.arg.str.len.0
  store i8 0, ptr %call.arg.str.null.0
  %call.arg.str.ptr.1 = extractvalue %kira.string %r3, 0
  %call.arg.str.len.1 = extractvalue %kira.string %r3, 1
  %call.arg.str.alloclen.1 = add i64 %call.arg.str.len.1, 1
  %call.arg.45.2 = call ptr @malloc(i64 %call.arg.str.alloclen.1)
  call void @llvm.memcpy.p0.p0.i64(ptr %call.arg.45.2, ptr %call.arg.str.ptr.1, i64 %call.arg.str.len.1, i1 false)
  %call.arg.str.null.1 = getelementptr inbounds i8, ptr %call.arg.45.2, i64 %call.arg.str.len.1
  store i8 0, ptr %call.arg.str.null.1
  %call.int.4 = call i32 @"kg_run_lifetime_stress"(i64 %r1, ptr %call.arg.45.1, ptr %call.arg.45.2)
  %r4.sext = sext i32 %call.int.4 to i64
  %r4 = add i64 %r4.sext, 0
  %r5 = add i64 0, 0
  %r6 = icmp ne i64 %r4, %r5
  ret i1 %r6
}

define i64 @"kira_native_impl_430"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.79 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.79
  %cleanup.heap.slot.87 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.87
  store i64 %arg0, ptr %local0
  %alloc.size.ptr.0 = getelementptr %t.GraphicsFrame, ptr null, i32 1
  %alloc.size.0 = ptrtoint ptr %alloc.size.ptr.0 to i64
  %alloc.empty.0 = icmp eq i64 %alloc.size.0, 0
  %alloc.bytes.0 = select i1 %alloc.empty.0, i64 1, i64 %alloc.size.0
  %alloc.ptr.0 = call ptr @malloc(i64 %alloc.bytes.0)
  store %t.GraphicsFrame zeroinitializer, ptr %alloc.ptr.0
  %r0 = ptrtoint ptr %alloc.ptr.0 to i64
  store ptr %alloc.ptr.0, ptr %cleanup.heap.slot.0
  %r1 = add i1 0, 0
  %field.base.2 = inttoptr i64 %r0 to ptr
  %field.ptr.2 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.2, i32 0, i32 0
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %store.ptr.1 = inttoptr i64 %r2 to ptr
  %store.bool.1 = zext i1 %r1 to i8
  store i8 %store.bool.1, ptr %store.ptr.1
  %r3 = add i64 0, 0
  %field.base.4 = inttoptr i64 %r0 to ptr
  %field.ptr.4 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.4, i32 0, i32 1
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %store.ptr.3 = inttoptr i64 %r4 to ptr
  store i64 %r3, ptr %store.ptr.3
  %r5 = add i64 0, 0
  %field.base.6 = inttoptr i64 %r0 to ptr
  %field.ptr.6 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.6, i32 0, i32 2
  %r6 = ptrtoint ptr %field.ptr.6 to i64
  %store.ptr.5 = inttoptr i64 %r6 to ptr
  %store.cast.5 = trunc i64 %r5 to i32
  store i32 %store.cast.5, ptr %store.ptr.5
  %r7 = add i64 0, 0
  %field.base.8 = inttoptr i64 %r0 to ptr
  %field.ptr.8 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.8, i32 0, i32 3
  %r8 = ptrtoint ptr %field.ptr.8 to i64
  %store.ptr.7 = inttoptr i64 %r8 to ptr
  store i64 %r7, ptr %store.ptr.7
  %r9 = add i64 0, 0
  %field.base.10 = inttoptr i64 %r0 to ptr
  %field.ptr.10 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.10, i32 0, i32 4
  %r10 = ptrtoint ptr %field.ptr.10 to i64
  %store.ptr.9 = inttoptr i64 %r10 to ptr
  store i64 %r9, ptr %store.ptr.9
  %r11 = add i64 0, 0
  %field.base.12 = inttoptr i64 %r0 to ptr
  %field.ptr.12 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.12, i32 0, i32 5
  %r12 = ptrtoint ptr %field.ptr.12 to i64
  %store.ptr.11 = inttoptr i64 %r12 to ptr
  store i64 %r11, ptr %store.ptr.11
  %r13 = add i64 0, 0
  %field.base.14 = inttoptr i64 %r0 to ptr
  %field.ptr.14 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.14, i32 0, i32 6
  %r14 = ptrtoint ptr %field.ptr.14 to i64
  %store.ptr.13 = inttoptr i64 %r14 to ptr
  store i64 %r13, ptr %store.ptr.13
  %r15 = fadd double 0.0, 0.0
  %field.base.16 = inttoptr i64 %r0 to ptr
  %field.ptr.16 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.16, i32 0, i32 7
  %r16 = ptrtoint ptr %field.ptr.16 to i64
  %store.ptr.15 = inttoptr i64 %r16 to ptr
  store double %r15, ptr %store.ptr.15
  %r17 = fadd double 0.0, 0.0
  %field.base.18 = inttoptr i64 %r0 to ptr
  %field.ptr.18 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.18, i32 0, i32 8
  %r18 = ptrtoint ptr %field.ptr.18 to i64
  %store.ptr.17 = inttoptr i64 %r18 to ptr
  store double %r17, ptr %store.ptr.17
  %r19 = fadd double 0.0, 0.0
  %field.base.20 = inttoptr i64 %r0 to ptr
  %field.ptr.20 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.20, i32 0, i32 9
  %r20 = ptrtoint ptr %field.ptr.20 to i64
  %store.ptr.19 = inttoptr i64 %r20 to ptr
  store double %r19, ptr %store.ptr.19
  %r21 = fadd double 0.0, 1.0
  %field.base.22 = inttoptr i64 %r0 to ptr
  %field.ptr.22 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.22, i32 0, i32 10
  %r22 = ptrtoint ptr %field.ptr.22 to i64
  %store.ptr.21 = inttoptr i64 %r22 to ptr
  store double %r21, ptr %store.ptr.21
  %r23 = add i1 0, 0
  %field.base.24 = inttoptr i64 %r0 to ptr
  %field.ptr.24 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.24, i32 0, i32 11
  %r24 = ptrtoint ptr %field.ptr.24 to i64
  %store.ptr.23 = inttoptr i64 %r24 to ptr
  %store.bool.23 = zext i1 %r23 to i8
  store i8 %store.bool.23, ptr %store.ptr.23
  %r25 = add i64 0, 0
  %field.base.26 = inttoptr i64 %r0 to ptr
  %field.ptr.26 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.26, i32 0, i32 12
  %r26 = ptrtoint ptr %field.ptr.26 to i64
  %store.ptr.25 = inttoptr i64 %r26 to ptr
  %store.cast.25 = trunc i64 %r25 to i32
  store i32 %store.cast.25, ptr %store.ptr.25
  %r27 = add i64 0, 0
  %field.base.28 = inttoptr i64 %r0 to ptr
  %field.ptr.28 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.28, i32 0, i32 13
  %r28 = ptrtoint ptr %field.ptr.28 to i64
  %store.ptr.27 = inttoptr i64 %r28 to ptr
  store i64 %r27, ptr %store.ptr.27
  %r29 = add i64 0, 0
  %field.base.30 = inttoptr i64 %r0 to ptr
  %field.ptr.30 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.30, i32 0, i32 14
  %r30 = ptrtoint ptr %field.ptr.30 to i64
  %store.ptr.29 = inttoptr i64 %r30 to ptr
  store i64 %r29, ptr %store.ptr.29
  %r31 = add i1 0, 0
  %field.base.32 = inttoptr i64 %r0 to ptr
  %field.ptr.32 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.32, i32 0, i32 15
  %r32 = ptrtoint ptr %field.ptr.32 to i64
  %store.ptr.31 = inttoptr i64 %r32 to ptr
  %store.bool.31 = zext i1 %r31 to i8
  store i8 %store.bool.31, ptr %store.ptr.31
  %r33 = add i64 0, 0
  %field.base.34 = inttoptr i64 %r0 to ptr
  %field.ptr.34 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.34, i32 0, i32 16
  %r34 = ptrtoint ptr %field.ptr.34 to i64
  %store.ptr.33 = inttoptr i64 %r34 to ptr
  %store.cast.33 = trunc i64 %r33 to i32
  store i32 %store.cast.33, ptr %store.ptr.33
  %r35 = add i64 0, 0
  %field.base.36 = inttoptr i64 %r0 to ptr
  %field.ptr.36 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.36, i32 0, i32 17
  %r36 = ptrtoint ptr %field.ptr.36 to i64
  %store.ptr.35 = inttoptr i64 %r36 to ptr
  store i64 %r35, ptr %store.ptr.35
  %r37 = add i64 0, 0
  %field.base.38 = inttoptr i64 %r0 to ptr
  %field.ptr.38 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.38, i32 0, i32 18
  %r38 = ptrtoint ptr %field.ptr.38 to i64
  %store.ptr.37 = inttoptr i64 %r38 to ptr
  store i64 %r37, ptr %store.ptr.37
  %r39 = fadd double 0.0, 1.0
  %field.base.40 = inttoptr i64 %r0 to ptr
  %field.ptr.40 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.40, i32 0, i32 19
  %r40 = ptrtoint ptr %field.ptr.40 to i64
  %store.ptr.39 = inttoptr i64 %r40 to ptr
  store double %r39, ptr %store.ptr.39
  %r41 = add i1 0, 0
  %field.base.42 = inttoptr i64 %r0 to ptr
  %field.ptr.42 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.42, i32 0, i32 20
  %r42 = ptrtoint ptr %field.ptr.42 to i64
  %store.ptr.41 = inttoptr i64 %r42 to ptr
  %store.bool.41 = zext i1 %r41 to i8
  store i8 %store.bool.41, ptr %store.ptr.41
  %r43 = add i1 0, 0
  %field.base.44 = inttoptr i64 %r0 to ptr
  %field.ptr.44 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.44, i32 0, i32 21
  %r44 = ptrtoint ptr %field.ptr.44 to i64
  %store.ptr.43 = inttoptr i64 %r44 to ptr
  %store.bool.43 = zext i1 %r43 to i8
  store i8 %store.bool.43, ptr %store.ptr.43
  %r45 = add i64 0, 0
  %field.base.46 = inttoptr i64 %r0 to ptr
  %field.ptr.46 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.46, i32 0, i32 22
  %r46 = ptrtoint ptr %field.ptr.46 to i64
  %store.ptr.45 = inttoptr i64 %r46 to ptr
  %store.cast.45 = trunc i64 %r45 to i32
  store i32 %store.cast.45, ptr %store.ptr.45
  %r47 = add i64 0, 0
  %field.base.48 = inttoptr i64 %r0 to ptr
  %field.ptr.48 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.48, i32 0, i32 23
  %r48 = ptrtoint ptr %field.ptr.48 to i64
  %store.ptr.47 = inttoptr i64 %r48 to ptr
  store i64 %r47, ptr %store.ptr.47
  %r49 = add i64 0, 0
  %field.base.50 = inttoptr i64 %r0 to ptr
  %field.ptr.50 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.50, i32 0, i32 24
  %r50 = ptrtoint ptr %field.ptr.50 to i64
  %store.ptr.49 = inttoptr i64 %r50 to ptr
  store i64 %r49, ptr %store.ptr.49
  %r51 = add i64 0, 0
  %field.base.52 = inttoptr i64 %r0 to ptr
  %field.ptr.52 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.52, i32 0, i32 25
  %r52 = ptrtoint ptr %field.ptr.52 to i64
  %store.ptr.51 = inttoptr i64 %r52 to ptr
  store i64 %r51, ptr %store.ptr.51
  %r53 = add i1 0, 0
  %field.base.54 = inttoptr i64 %r0 to ptr
  %field.ptr.54 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.54, i32 0, i32 26
  %r54 = ptrtoint ptr %field.ptr.54 to i64
  %store.ptr.53 = inttoptr i64 %r54 to ptr
  %store.bool.53 = zext i1 %r53 to i8
  store i8 %store.bool.53, ptr %store.ptr.53
  %r55 = add i64 0, 0
  %field.base.56 = inttoptr i64 %r0 to ptr
  %field.ptr.56 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.56, i32 0, i32 27
  %r56 = ptrtoint ptr %field.ptr.56 to i64
  %store.ptr.55 = inttoptr i64 %r56 to ptr
  %store.cast.55 = trunc i64 %r55 to i32
  store i32 %store.cast.55, ptr %store.ptr.55
  %r57 = add i1 0, 0
  %field.base.58 = inttoptr i64 %r0 to ptr
  %field.ptr.58 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.58, i32 0, i32 28
  %r58 = ptrtoint ptr %field.ptr.58 to i64
  %store.ptr.57 = inttoptr i64 %r58 to ptr
  %store.bool.57 = zext i1 %r57 to i8
  store i8 %store.bool.57, ptr %store.ptr.57
  %r59 = add i64 0, 0
  %field.base.60 = inttoptr i64 %r0 to ptr
  %field.ptr.60 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.60, i32 0, i32 29
  %r60 = ptrtoint ptr %field.ptr.60 to i64
  %store.ptr.59 = inttoptr i64 %r60 to ptr
  %store.cast.59 = trunc i64 %r59 to i32
  store i32 %store.cast.59, ptr %store.ptr.59
  %r61 = add i1 0, 0
  %field.base.62 = inttoptr i64 %r0 to ptr
  %field.ptr.62 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.62, i32 0, i32 30
  %r62 = ptrtoint ptr %field.ptr.62 to i64
  %store.ptr.61 = inttoptr i64 %r62 to ptr
  %store.bool.61 = zext i1 %r61 to i8
  store i8 %store.bool.61, ptr %store.ptr.61
  %r63 = add i64 0, 0
  %field.base.64 = inttoptr i64 %r0 to ptr
  %field.ptr.64 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.64, i32 0, i32 31
  %r64 = ptrtoint ptr %field.ptr.64 to i64
  %store.ptr.63 = inttoptr i64 %r64 to ptr
  %store.cast.63 = trunc i64 %r63 to i32
  store i32 %store.cast.63, ptr %store.ptr.63
  %r65 = add i1 0, 0
  %field.base.66 = inttoptr i64 %r0 to ptr
  %field.ptr.66 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.66, i32 0, i32 32
  %r66 = ptrtoint ptr %field.ptr.66 to i64
  %store.ptr.65 = inttoptr i64 %r66 to ptr
  %store.bool.65 = zext i1 %r65 to i8
  store i8 %store.bool.65, ptr %store.ptr.65
  %r67 = call i64 @"kira_native_impl_121"()
  %field.base.68 = inttoptr i64 %r0 to ptr
  %field.ptr.68 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.68, i32 0, i32 33
  %r68 = ptrtoint ptr %field.ptr.68 to i64
  %store.ptr.67 = inttoptr i64 %r68 to ptr
  store i64 %r67, ptr %store.ptr.67
  %r69 = add i64 0, 0
  %field.base.70 = inttoptr i64 %r0 to ptr
  %field.ptr.70 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.70, i32 0, i32 34
  %r70 = ptrtoint ptr %field.ptr.70 to i64
  %store.ptr.69 = inttoptr i64 %r70 to ptr
  store i64 %r69, ptr %store.ptr.69
  %r71 = add i64 0, 0
  %field.base.72 = inttoptr i64 %r0 to ptr
  %field.ptr.72 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.72, i32 0, i32 35
  %r72 = ptrtoint ptr %field.ptr.72 to i64
  %store.ptr.71 = inttoptr i64 %r72 to ptr
  store i64 %r71, ptr %store.ptr.71
  %r73 = add i64 0, 1
  %field.base.74 = inttoptr i64 %r0 to ptr
  %field.ptr.74 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.74, i32 0, i32 36
  %r74 = ptrtoint ptr %field.ptr.74 to i64
  %store.ptr.73 = inttoptr i64 %r74 to ptr
  store i64 %r73, ptr %store.ptr.73
  %r75 = add i1 0, 0
  %field.base.76 = inttoptr i64 %r0 to ptr
  %field.ptr.76 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.76, i32 0, i32 37
  %r76 = ptrtoint ptr %field.ptr.76 to i64
  %store.ptr.75 = inttoptr i64 %r76 to ptr
  %store.bool.75 = zext i1 %r75 to i8
  store i8 %store.bool.75, ptr %store.ptr.75
  %r77 = add i1 0, 0
  %field.base.78 = inttoptr i64 %r0 to ptr
  %field.ptr.78 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.78, i32 0, i32 38
  %r78 = ptrtoint ptr %field.ptr.78 to i64
  %store.ptr.77 = inttoptr i64 %r78 to ptr
  %store.bool.77 = zext i1 %r77 to i8
  store i8 %store.bool.77, ptr %store.ptr.77
  %rt.result.0 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 175, ptr null, i32 0, ptr %rt.result.0)
  %rt.result.load.0 = load %kira.bridge.value, ptr %rt.result.0
  %r79 = extractvalue %kira.bridge.value %rt.result.load.0, 2
  %field.base.80 = inttoptr i64 %r0 to ptr
  %field.ptr.80 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.80, i32 0, i32 39
  %r80 = ptrtoint ptr %field.ptr.80 to i64
  %copy.dst.80 = inttoptr i64 %r80 to ptr
  %copy.src.79 = inttoptr i64 %r79 to ptr
  %copy.val.80 = load %t.RenderEncoder, ptr %copy.src.79
  store %t.RenderEncoder %copy.val.80, ptr %copy.dst.80
  %r81 = add i1 0, 0
  %field.base.82 = inttoptr i64 %r0 to ptr
  %field.ptr.82 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.82, i32 0, i32 40
  %r82 = ptrtoint ptr %field.ptr.82 to i64
  %store.ptr.81 = inttoptr i64 %r82 to ptr
  %store.bool.81 = zext i1 %r81 to i8
  store i8 %store.bool.81, ptr %store.ptr.81
  %r83 = add i1 0, 0
  %field.base.84 = inttoptr i64 %r0 to ptr
  %field.ptr.84 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.84, i32 0, i32 41
  %r84 = ptrtoint ptr %field.ptr.84 to i64
  %store.ptr.83 = inttoptr i64 %r84 to ptr
  %store.bool.83 = zext i1 %r83 to i8
  store i8 %store.bool.83, ptr %store.ptr.83
  %r85 = add i1 0, 0
  %field.base.86 = inttoptr i64 %r0 to ptr
  %field.ptr.86 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.86, i32 0, i32 42
  %r86 = ptrtoint ptr %field.ptr.86 to i64
  %store.ptr.85 = inttoptr i64 %r86 to ptr
  %store.bool.85 = zext i1 %r85 to i8
  store i8 %store.bool.85, ptr %store.ptr.85
  %r87 = load i64, ptr %local0
  %field.base.88 = inttoptr i64 %r87 to ptr
  %field.ptr.88 = getelementptr inbounds %t.Graphics, ptr %field.base.88, i32 0, i32 0
  %r88 = ptrtoint ptr %field.ptr.88 to i64
  %load.ptr.89 = inttoptr i64 %r88 to ptr
  %load.rawptr.89 = load ptr, ptr %load.ptr.89
  %r89 = ptrtoint ptr %load.rawptr.89 to i64
  %field.base.90 = inttoptr i64 %r0 to ptr
  %field.ptr.90 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.90, i32 0, i32 43
  %r90 = ptrtoint ptr %field.ptr.90 to i64
  %store.ptr.89 = inttoptr i64 %r90 to ptr
  %store.rawptr.89 = inttoptr i64 %r89 to ptr
  store ptr %store.rawptr.89, ptr %store.ptr.89
  ret i64 %r0
}

define i64 @"kira_native_impl_168"() {
entry:
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.1 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.1
  %alloc.size.ptr.0 = getelementptr %t.RenderPipeline, ptr null, i32 1
  %alloc.size.0 = ptrtoint ptr %alloc.size.ptr.0 to i64
  %alloc.empty.0 = icmp eq i64 %alloc.size.0, 0
  %alloc.bytes.0 = select i1 %alloc.empty.0, i64 1, i64 %alloc.size.0
  %alloc.ptr.0 = call ptr @malloc(i64 %alloc.bytes.0)
  store %t.RenderPipeline zeroinitializer, ptr %alloc.ptr.0
  %r0 = ptrtoint ptr %alloc.ptr.0 to i64
  store ptr %alloc.ptr.0, ptr %cleanup.heap.slot.0
  %alloc.size.ptr.1 = getelementptr %t.BackendPipelineHandle, ptr null, i32 1
  %alloc.size.1 = ptrtoint ptr %alloc.size.ptr.1 to i64
  %alloc.empty.1 = icmp eq i64 %alloc.size.1, 0
  %alloc.bytes.1 = select i1 %alloc.empty.1, i64 1, i64 %alloc.size.1
  %alloc.ptr.1 = call ptr @malloc(i64 %alloc.bytes.1)
  store %t.BackendPipelineHandle zeroinitializer, ptr %alloc.ptr.1
  %r1 = ptrtoint ptr %alloc.ptr.1 to i64
  store ptr %alloc.ptr.1, ptr %cleanup.heap.slot.1
  %r2 = add i64 0, 0
  %field.base.3 = inttoptr i64 %r1 to ptr
  %field.ptr.3 = getelementptr inbounds %t.BackendPipelineHandle, ptr %field.base.3, i32 0, i32 0
  %r3 = ptrtoint ptr %field.ptr.3 to i64
  %store.ptr.2 = inttoptr i64 %r3 to ptr
  %store.cast.2 = trunc i64 %r2 to i32
  store i32 %store.cast.2, ptr %store.ptr.2
  %field.base.4 = inttoptr i64 %r0 to ptr
  %field.ptr.4 = getelementptr inbounds %t.RenderPipeline, ptr %field.base.4, i32 0, i32 0
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %copy.dst.4 = inttoptr i64 %r4 to ptr
  %copy.src.1 = inttoptr i64 %r1 to ptr
  %copy.val.4 = load %t.BackendPipelineHandle, ptr %copy.src.1
  store %t.BackendPipelineHandle %copy.val.4, ptr %copy.dst.4
  %r5 = add i64 0, 0
  %field.base.6 = inttoptr i64 %r0 to ptr
  %field.ptr.6 = getelementptr inbounds %t.RenderPipeline, ptr %field.base.6, i32 0, i32 1
  %r6 = ptrtoint ptr %field.ptr.6 to i64
  %store.ptr.5 = inttoptr i64 %r6 to ptr
  %store.cast.5 = trunc i64 %r5 to i32
  store i32 %store.cast.5, ptr %store.ptr.5
  %cleanup.heap.ptr.0 = load ptr, ptr %cleanup.heap.slot.1
  call void @free(ptr %cleanup.heap.ptr.0)
  ret i64 %r0
}

define void @"kira_native_impl_169"(double %arg0, double %arg1, double %arg2, double %arg3, double %arg4) {
entry:
  %local0 = alloca double
  %local1 = alloca double
  %local2 = alloca double
  %local3 = alloca double
  %local4 = alloca double
  store double %arg0, ptr %local0
  store double %arg1, ptr %local1
  store double %arg2, ptr %local2
  store double %arg3, ptr %local3
  store double %arg4, ptr %local4
  %r0 = load double, ptr %local0
  %r1 = load double, ptr %local1
  %r2 = load double, ptr %local2
  %r3 = load double, ptr %local3
  %r4 = load double, ptr %local4
  call void @"kg_ui_push_clip"(double %r0, double %r1, double %r2, double %r3, double %r4)
  ret void
}

define void @"kira_native_impl_170"() {
entry:
  call void @"kg_ui_pop_clip"()
  ret void
}

define void @"kira_native_impl_171"(double %arg0, double %arg1, double %arg2, double %arg3, double %arg4, double %arg5, double %arg6, double %arg7, double %arg8, double %arg9, double %arg10, double %arg11, double %arg12, double %arg13) {
entry:
  %local0 = alloca double
  %local1 = alloca double
  %local2 = alloca double
  %local3 = alloca double
  %local4 = alloca double
  %local5 = alloca double
  %local6 = alloca double
  %local7 = alloca double
  %local8 = alloca double
  %local9 = alloca double
  %local10 = alloca double
  %local11 = alloca double
  %local12 = alloca double
  %local13 = alloca double
  store double %arg0, ptr %local0
  store double %arg1, ptr %local1
  store double %arg2, ptr %local2
  store double %arg3, ptr %local3
  store double %arg4, ptr %local4
  store double %arg5, ptr %local5
  store double %arg6, ptr %local6
  store double %arg7, ptr %local7
  store double %arg8, ptr %local8
  store double %arg9, ptr %local9
  store double %arg10, ptr %local10
  store double %arg11, ptr %local11
  store double %arg12, ptr %local12
  store double %arg13, ptr %local13
  %r0 = load double, ptr %local0
  %r1 = load double, ptr %local1
  %r2 = load double, ptr %local2
  %r3 = load double, ptr %local3
  %r4 = load double, ptr %local4
  %r5 = load double, ptr %local5
  %r6 = load double, ptr %local6
  %r7 = load double, ptr %local7
  %r8 = load double, ptr %local8
  %r9 = load double, ptr %local9
  %r10 = load double, ptr %local10
  %r11 = load double, ptr %local11
  %r12 = load double, ptr %local12
  %r13 = load double, ptr %local13
  call void @"kg_ui_draw_surface"(double %r0, double %r1, double %r2, double %r3, double %r4, double %r5, double %r6, double %r7, double %r8, double %r9, double %r10, double %r11, double %r12, double %r13)
  ret void
}

define void @"kira_native_impl_172"(double %arg0, double %arg1, double %arg2, double %arg3, double %arg4, double %arg5, double %arg6, double %arg7, double %arg8, double %arg9, double %arg10, double %arg11, double %arg12, double %arg13) {
entry:
  %local0 = alloca double
  %local1 = alloca double
  %local2 = alloca double
  %local3 = alloca double
  %local4 = alloca double
  %local5 = alloca double
  %local6 = alloca double
  %local7 = alloca double
  %local8 = alloca double
  %local9 = alloca double
  %local10 = alloca double
  %local11 = alloca double
  %local12 = alloca double
  %local13 = alloca double
  store double %arg0, ptr %local0
  store double %arg1, ptr %local1
  store double %arg2, ptr %local2
  store double %arg3, ptr %local3
  store double %arg4, ptr %local4
  store double %arg5, ptr %local5
  store double %arg6, ptr %local6
  store double %arg7, ptr %local7
  store double %arg8, ptr %local8
  store double %arg9, ptr %local9
  store double %arg10, ptr %local10
  store double %arg11, ptr %local11
  store double %arg12, ptr %local12
  store double %arg13, ptr %local13
  %r0 = load double, ptr %local0
  %r1 = load double, ptr %local1
  %r2 = load double, ptr %local2
  %r3 = load double, ptr %local3
  %r4 = load double, ptr %local4
  %r5 = load double, ptr %local5
  %r6 = load double, ptr %local6
  %r7 = load double, ptr %local7
  %r8 = load double, ptr %local8
  %r9 = load double, ptr %local9
  %r10 = load double, ptr %local10
  %r11 = load double, ptr %local11
  %r12 = load double, ptr %local12
  %r13 = load double, ptr %local13
  call void @"kg_ui_draw_squircle_surface"(double %r0, double %r1, double %r2, double %r3, double %r4, double %r5, double %r6, double %r7, double %r8, double %r9, double %r10, double %r11, double %r12, double %r13)
  ret void
}

define void @"kira_native_impl_173"(double %arg0, double %arg1, double %arg2, double %arg3, double %arg4, double %arg5, double %arg6, double %arg7, double %arg8, double %arg9) {
entry:
  %local0 = alloca double
  %local1 = alloca double
  %local2 = alloca double
  %local3 = alloca double
  %local4 = alloca double
  %local5 = alloca double
  %local6 = alloca double
  %local7 = alloca double
  %local8 = alloca double
  %local9 = alloca double
  store double %arg0, ptr %local0
  store double %arg1, ptr %local1
  store double %arg2, ptr %local2
  store double %arg3, ptr %local3
  store double %arg4, ptr %local4
  store double %arg5, ptr %local5
  store double %arg6, ptr %local6
  store double %arg7, ptr %local7
  store double %arg8, ptr %local8
  store double %arg9, ptr %local9
  %r0 = load double, ptr %local0
  %r1 = load double, ptr %local1
  %r2 = load double, ptr %local2
  %r3 = load double, ptr %local3
  %r4 = load double, ptr %local4
  %r5 = load double, ptr %local5
  %r6 = load double, ptr %local6
  %r7 = load double, ptr %local7
  %r8 = load double, ptr %local8
  %r9 = load double, ptr %local9
  call void @"kg_ui_draw_glow"(double %r0, double %r1, double %r2, double %r3, double %r4, double %r5, double %r6, double %r7, double %r8, double %r9)
  ret void
}

define void @"kira_native_impl_174"(%kira.string %arg0, double %arg1, double %arg2, double %arg3, double %arg4, double %arg5, double %arg6, double %arg7, double %arg8, double %arg9) {
entry:
  %local0 = alloca %kira.string
  %local1 = alloca double
  %local2 = alloca double
  %local3 = alloca double
  %local4 = alloca double
  %local5 = alloca double
  %local6 = alloca double
  %local7 = alloca double
  %local8 = alloca double
  %local9 = alloca double
  store %kira.string %arg0, ptr %local0
  store double %arg1, ptr %local1
  store double %arg2, ptr %local2
  store double %arg3, ptr %local3
  store double %arg4, ptr %local4
  store double %arg5, ptr %local5
  store double %arg6, ptr %local6
  store double %arg7, ptr %local7
  store double %arg8, ptr %local8
  store double %arg9, ptr %local9
  %r0 = load %kira.string, ptr %local0
  %r1 = load double, ptr %local1
  %r2 = load double, ptr %local2
  %r3 = load double, ptr %local3
  %r4 = load double, ptr %local4
  %r5 = load double, ptr %local5
  %r6 = load double, ptr %local6
  %r7 = load double, ptr %local7
  %r8 = load double, ptr %local8
  %r9 = load double, ptr %local9
  %call.arg.str.ptr.0 = extractvalue %kira.string %r0, 0
  %call.arg.str.len.0 = extractvalue %kira.string %r0, 1
  %call.arg.str.alloclen.0 = add i64 %call.arg.str.len.0, 1
  %call.arg.39.0 = call ptr @malloc(i64 %call.arg.str.alloclen.0)
  call void @llvm.memcpy.p0.p0.i64(ptr %call.arg.39.0, ptr %call.arg.str.ptr.0, i64 %call.arg.str.len.0, i1 false)
  %call.arg.str.null.0 = getelementptr inbounds i8, ptr %call.arg.39.0, i64 %call.arg.str.len.0
  store i8 0, ptr %call.arg.str.null.0
  call void @"kg_ui_draw_text"(ptr %call.arg.39.0, double %r1, double %r2, double %r3, double %r4, double %r5, double %r6, double %r7, double %r8, double %r9)
  ret void
}

define i64 @"kira_native_impl_178"() {
entry:
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.1 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.1
  %alloc.size.ptr.0 = getelementptr %t.GraphicsShader, ptr null, i32 1
  %alloc.size.0 = ptrtoint ptr %alloc.size.ptr.0 to i64
  %alloc.empty.0 = icmp eq i64 %alloc.size.0, 0
  %alloc.bytes.0 = select i1 %alloc.empty.0, i64 1, i64 %alloc.size.0
  %alloc.ptr.0 = call ptr @malloc(i64 %alloc.bytes.0)
  store %t.GraphicsShader zeroinitializer, ptr %alloc.ptr.0
  %r0 = ptrtoint ptr %alloc.ptr.0 to i64
  store ptr %alloc.ptr.0, ptr %cleanup.heap.slot.0
  %alloc.size.ptr.1 = getelementptr %t.BackendShaderHandle, ptr null, i32 1
  %alloc.size.1 = ptrtoint ptr %alloc.size.ptr.1 to i64
  %alloc.empty.1 = icmp eq i64 %alloc.size.1, 0
  %alloc.bytes.1 = select i1 %alloc.empty.1, i64 1, i64 %alloc.size.1
  %alloc.ptr.1 = call ptr @malloc(i64 %alloc.bytes.1)
  store %t.BackendShaderHandle zeroinitializer, ptr %alloc.ptr.1
  %r1 = ptrtoint ptr %alloc.ptr.1 to i64
  store ptr %alloc.ptr.1, ptr %cleanup.heap.slot.1
  %r2 = add i64 0, 0
  %field.base.3 = inttoptr i64 %r1 to ptr
  %field.ptr.3 = getelementptr inbounds %t.BackendShaderHandle, ptr %field.base.3, i32 0, i32 0
  %r3 = ptrtoint ptr %field.ptr.3 to i64
  %store.ptr.2 = inttoptr i64 %r3 to ptr
  %store.cast.2 = trunc i64 %r2 to i32
  store i32 %store.cast.2, ptr %store.ptr.2
  %field.base.4 = inttoptr i64 %r0 to ptr
  %field.ptr.4 = getelementptr inbounds %t.GraphicsShader, ptr %field.base.4, i32 0, i32 0
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %copy.dst.4 = inttoptr i64 %r4 to ptr
  %copy.src.1 = inttoptr i64 %r1 to ptr
  %copy.val.4 = load %t.BackendShaderHandle, ptr %copy.src.1
  store %t.BackendShaderHandle %copy.val.4, ptr %copy.dst.4
  %r5 = add i64 0, 0
  %field.base.6 = inttoptr i64 %r0 to ptr
  %field.ptr.6 = getelementptr inbounds %t.GraphicsShader, ptr %field.base.6, i32 0, i32 1
  %r6 = ptrtoint ptr %field.ptr.6 to i64
  %store.ptr.5 = inttoptr i64 %r6 to ptr
  %store.cast.5 = trunc i64 %r5 to i32
  store i32 %store.cast.5, ptr %store.ptr.5
  %cleanup.heap.ptr.0 = load ptr, ptr %cleanup.heap.slot.1
  call void @free(ptr %cleanup.heap.ptr.0)
  ret i64 %r0
}

define i64 @"kira_native_impl_179"() {
entry:
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.1 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.1
  %alloc.size.ptr.0 = getelementptr %t.GraphicsTexture, ptr null, i32 1
  %alloc.size.0 = ptrtoint ptr %alloc.size.ptr.0 to i64
  %alloc.empty.0 = icmp eq i64 %alloc.size.0, 0
  %alloc.bytes.0 = select i1 %alloc.empty.0, i64 1, i64 %alloc.size.0
  %alloc.ptr.0 = call ptr @malloc(i64 %alloc.bytes.0)
  store %t.GraphicsTexture zeroinitializer, ptr %alloc.ptr.0
  %r0 = ptrtoint ptr %alloc.ptr.0 to i64
  store ptr %alloc.ptr.0, ptr %cleanup.heap.slot.0
  %alloc.size.ptr.1 = getelementptr %t.BackendTextureHandle, ptr null, i32 1
  %alloc.size.1 = ptrtoint ptr %alloc.size.ptr.1 to i64
  %alloc.empty.1 = icmp eq i64 %alloc.size.1, 0
  %alloc.bytes.1 = select i1 %alloc.empty.1, i64 1, i64 %alloc.size.1
  %alloc.ptr.1 = call ptr @malloc(i64 %alloc.bytes.1)
  store %t.BackendTextureHandle zeroinitializer, ptr %alloc.ptr.1
  %r1 = ptrtoint ptr %alloc.ptr.1 to i64
  store ptr %alloc.ptr.1, ptr %cleanup.heap.slot.1
  %r2 = add i64 0, 0
  %field.base.3 = inttoptr i64 %r1 to ptr
  %field.ptr.3 = getelementptr inbounds %t.BackendTextureHandle, ptr %field.base.3, i32 0, i32 0
  %r3 = ptrtoint ptr %field.ptr.3 to i64
  %store.ptr.2 = inttoptr i64 %r3 to ptr
  %store.cast.2 = trunc i64 %r2 to i32
  store i32 %store.cast.2, ptr %store.ptr.2
  %field.base.4 = inttoptr i64 %r0 to ptr
  %field.ptr.4 = getelementptr inbounds %t.GraphicsTexture, ptr %field.base.4, i32 0, i32 0
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %copy.dst.4 = inttoptr i64 %r4 to ptr
  %copy.src.1 = inttoptr i64 %r1 to ptr
  %copy.val.4 = load %t.BackendTextureHandle, ptr %copy.src.1
  store %t.BackendTextureHandle %copy.val.4, ptr %copy.dst.4
  %r5 = add i64 0, 0
  %field.base.6 = inttoptr i64 %r0 to ptr
  %field.ptr.6 = getelementptr inbounds %t.GraphicsTexture, ptr %field.base.6, i32 0, i32 1
  %r6 = ptrtoint ptr %field.ptr.6 to i64
  %store.ptr.5 = inttoptr i64 %r6 to ptr
  %store.cast.5 = trunc i64 %r5 to i32
  store i32 %store.cast.5, ptr %store.ptr.5
  %cleanup.heap.ptr.0 = load ptr, ptr %cleanup.heap.slot.1
  call void @free(ptr %cleanup.heap.ptr.0)
  ret i64 %r0
}

define i64 @"kira_native_impl_181"(%kira.string %arg0, i64 %arg1) {
entry:
  %local0 = alloca %kira.string
  %local1 = alloca i64
  %local2 = alloca i64
  store %kira.string %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local1
  store i64 %r0, ptr %local2
  %r1 = load %kira.string, ptr %local0
  %r2 = load i64, ptr %local2
  %call.arg.str.ptr.0 = extractvalue %kira.string %r1, 0
  %call.arg.str.len.0 = extractvalue %kira.string %r1, 1
  %call.arg.str.alloclen.0 = add i64 %call.arg.str.len.0, 1
  %call.arg.21.0 = call ptr @malloc(i64 %call.arg.str.alloclen.0)
  call void @llvm.memcpy.p0.p0.i64(ptr %call.arg.21.0, ptr %call.arg.str.ptr.0, i64 %call.arg.str.len.0, i1 false)
  %call.arg.str.null.0 = getelementptr inbounds i8, ptr %call.arg.21.0, i64 %call.arg.str.len.0
  store i8 0, ptr %call.arg.str.null.0
  %call.int.3 = call i32 @"kg_create_uniform_id"(ptr %call.arg.21.0, i64 %r2)
  %r3.sext = sext i32 %call.int.3 to i64
  %r3 = add i64 %r3.sext, 0
  ret i64 %r3
}

define void @"kira_native_impl_182"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.GraphicsUniform
  store %t.GraphicsUniform zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local2 = alloca i64
  %local3 = alloca i64
  %local4 = alloca i64
  %cleanup.heap.slot.6 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.6
  %cleanup.heap.slot.18 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.18
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = add i64 0, 0
  store i64 %r0, ptr %local2
  br label %kira_label_0
kira_label_0:
  %r1 = load i64, ptr %local2
  %r2 = load i64, ptr %local1
  %array.ptr.3 = inttoptr i64 %r2 to ptr
  %r3 = call i64 @"kira_array_len"(ptr %array.ptr.3)
  %r4 = icmp slt i64 %r1, %r3
  br i1 %r4, label %kira_label_1, label %kira_label_2
kira_label_1:
  %r5 = load i64, ptr %local2
  store i64 %r5, ptr %local3
  %r6 = load i64, ptr %local0
  %field.base.7 = inttoptr i64 %r6 to ptr
  %field.ptr.7 = getelementptr inbounds %t.GraphicsUniform, ptr %field.base.7, i32 0, i32 1
  %r7 = ptrtoint ptr %field.ptr.7 to i64
  %load.ptr.8 = inttoptr i64 %r7 to ptr
  %load.raw.8 = load i32, ptr %load.ptr.8
  %r8 = sext i32 %load.raw.8 to i64
  %r9 = load i64, ptr %local3
  %r10 = load i64, ptr %local1
  %r11 = load i64, ptr %local2
  %array.get.ptr.12 = inttoptr i64 %r10 to ptr
  %array.get.val.ptr.0 = alloca %kira.bridge.value
  call void @"kira_array_load"(ptr %array.get.ptr.12, i64 %r11, ptr %array.get.val.ptr.0)
  %array.get.val.0 = load %kira.bridge.value, ptr %array.get.val.ptr.0
  %array.get.bits.0 = extractvalue %kira.bridge.value %array.get.val.0, 2
  %r12 = bitcast i64 %array.get.bits.0 to double
  %call.arg.22.0 = trunc i64 %r8 to i32
  call void @"kg_set_uniform_float"(i32 %call.arg.22.0, i64 %r9, double %r12)
  %r13 = load i64, ptr %local2
  %r14 = add i64 0, 1
  %r15 = add i64 %r13, %r14
  store i64 %r15, ptr %local2
  br label %kira_label_0
kira_label_2:
  %r16 = load i64, ptr %local1
  %array.ptr.17 = inttoptr i64 %r16 to ptr
  %r17 = call i64 @"kira_array_len"(ptr %array.ptr.17)
  store i64 %r17, ptr %local4
  %r18 = load i64, ptr %local0
  %field.base.19 = inttoptr i64 %r18 to ptr
  %field.ptr.19 = getelementptr inbounds %t.GraphicsUniform, ptr %field.base.19, i32 0, i32 1
  %r19 = ptrtoint ptr %field.ptr.19 to i64
  %load.ptr.20 = inttoptr i64 %r19 to ptr
  %load.raw.20 = load i32, ptr %load.ptr.20
  %r20 = sext i32 %load.raw.20 to i64
  %r21 = load i64, ptr %local4
  %call.arg.23.0 = trunc i64 %r20 to i32
  call i32 @"kg_finish_uniform_update"(i32 %call.arg.23.0, i64 %r21)
  ret void
}

define void @"kira_native_impl_183"(i64 %arg0) {
entry:
  %local0 = alloca i64
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %call.arg.24.0 = trunc i64 %r0 to i32
  call void @"kg_destroy_uniform_id"(i32 %call.arg.24.0)
  ret void
}

define i64 @"kira_native_impl_184"(%kira.string %arg0) {
entry:
  %local0 = alloca %kira.string
  store %kira.string %arg0, ptr %local0
  %r0 = load %kira.string, ptr %local0
  %call.arg.str.ptr.0 = extractvalue %kira.string %r0, 0
  %call.arg.str.len.0 = extractvalue %kira.string %r0, 1
  %call.arg.str.alloclen.0 = add i64 %call.arg.str.len.0, 1
  %call.arg.25.0 = call ptr @malloc(i64 %call.arg.str.alloclen.0)
  call void @llvm.memcpy.p0.p0.i64(ptr %call.arg.25.0, ptr %call.arg.str.ptr.0, i64 %call.arg.str.len.0, i1 false)
  %call.arg.str.null.0 = getelementptr inbounds i8, ptr %call.arg.25.0, i64 %call.arg.str.len.0
  store i8 0, ptr %call.arg.str.null.0
  %call.int.1 = call i32 @"kg_create_bind_group_id"(ptr %call.arg.25.0)
  %r1.sext = sext i32 %call.int.1 to i64
  %r1 = add i64 %r1.sext, 0
  ret i64 %r1
}

define void @"kira_native_impl_185"(i64 %arg0, i64 %arg1, i64 %arg2, i64 %arg3) {
entry:
  %local0 = alloca i64
  %local1 = alloca i64
  %local2 = alloca i64
  %local3 = alloca i64
  %local4 = alloca i64
  %local5 = alloca i64
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  store i64 %arg2, ptr %local2
  store i64 %arg3, ptr %local3
  %r0 = load i64, ptr %local1
  store i64 %r0, ptr %local4
  %r1 = load i64, ptr %local2
  store i64 %r1, ptr %local5
  %r2 = load i64, ptr %local0
  %r3 = load i64, ptr %local4
  %r4 = load i64, ptr %local5
  %r5 = load i64, ptr %local3
  %call.arg.26.0 = trunc i64 %r2 to i32
  %call.arg.26.3 = trunc i64 %r5 to i32
  call i32 @"kg_set_bind_group_uniform"(i32 %call.arg.26.0, i64 %r3, i64 %r4, i32 %call.arg.26.3)
  ret void
}

define void @"kira_native_impl_186"(i64 %arg0) {
entry:
  %local0 = alloca i64
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %call.arg.27.0 = trunc i64 %r0 to i32
  call void @"kg_destroy_bind_group_id"(i32 %call.arg.27.0)
  ret void
}

define i64 @"kira_native_impl_187"() {
entry:
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.3 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.3
  %alloc.size.ptr.0 = getelementptr %t.RenderTarget, ptr null, i32 1
  %alloc.size.0 = ptrtoint ptr %alloc.size.ptr.0 to i64
  %alloc.empty.0 = icmp eq i64 %alloc.size.0, 0
  %alloc.bytes.0 = select i1 %alloc.empty.0, i64 1, i64 %alloc.size.0
  %alloc.ptr.0 = call ptr @malloc(i64 %alloc.bytes.0)
  store %t.RenderTarget zeroinitializer, ptr %alloc.ptr.0
  %r0 = ptrtoint ptr %alloc.ptr.0 to i64
  store ptr %alloc.ptr.0, ptr %cleanup.heap.slot.0
  %r1 = call i64 @"kira_native_impl_127"()
  %field.base.2 = inttoptr i64 %r0 to ptr
  %field.ptr.2 = getelementptr inbounds %t.RenderTarget, ptr %field.base.2, i32 0, i32 0
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %store.ptr.1 = inttoptr i64 %r2 to ptr
  store i64 %r1, ptr %store.ptr.1
  %r3 = call i64 @"kira_native_impl_179"()
  %cleanup.call.ptr.3 = inttoptr i64 %r3 to ptr
  store ptr %cleanup.call.ptr.3, ptr %cleanup.heap.slot.3
  %field.base.4 = inttoptr i64 %r0 to ptr
  %field.ptr.4 = getelementptr inbounds %t.RenderTarget, ptr %field.base.4, i32 0, i32 1
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %copy.dst.4 = inttoptr i64 %r4 to ptr
  %copy.src.3 = inttoptr i64 %r3 to ptr
  %copy.val.4 = load %t.GraphicsTexture, ptr %copy.src.3
  store %t.GraphicsTexture %copy.val.4, ptr %copy.dst.4
  %r5 = add i64 0, 0
  %field.base.6 = inttoptr i64 %r0 to ptr
  %field.ptr.6 = getelementptr inbounds %t.RenderTarget, ptr %field.base.6, i32 0, i32 2
  %r6 = ptrtoint ptr %field.ptr.6 to i64
  %store.ptr.5 = inttoptr i64 %r6 to ptr
  store i64 %r5, ptr %store.ptr.5
  %r7 = add i64 0, 0
  %field.base.8 = inttoptr i64 %r0 to ptr
  %field.ptr.8 = getelementptr inbounds %t.RenderTarget, ptr %field.base.8, i32 0, i32 3
  %r8 = ptrtoint ptr %field.ptr.8 to i64
  %store.ptr.7 = inttoptr i64 %r8 to ptr
  store i64 %r7, ptr %store.ptr.7
  %cleanup.heap.ptr.0 = load ptr, ptr %cleanup.heap.slot.3
  call void @free(ptr %cleanup.heap.ptr.0)
  ret i64 %r0
}

define i64 @"kira_native_impl_188"() {
entry:
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.1 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.1
  %alloc.size.ptr.0 = getelementptr %t.DepthAttachment, ptr null, i32 1
  %alloc.size.0 = ptrtoint ptr %alloc.size.ptr.0 to i64
  %alloc.empty.0 = icmp eq i64 %alloc.size.0, 0
  %alloc.bytes.0 = select i1 %alloc.empty.0, i64 1, i64 %alloc.size.0
  %alloc.ptr.0 = call ptr @malloc(i64 %alloc.bytes.0)
  store %t.DepthAttachment zeroinitializer, ptr %alloc.ptr.0
  %r0 = ptrtoint ptr %alloc.ptr.0 to i64
  store ptr %alloc.ptr.0, ptr %cleanup.heap.slot.0
  %r1 = call i64 @"kira_native_impl_179"()
  %cleanup.call.ptr.1 = inttoptr i64 %r1 to ptr
  store ptr %cleanup.call.ptr.1, ptr %cleanup.heap.slot.1
  %field.base.2 = inttoptr i64 %r0 to ptr
  %field.ptr.2 = getelementptr inbounds %t.DepthAttachment, ptr %field.base.2, i32 0, i32 0
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %copy.dst.2 = inttoptr i64 %r2 to ptr
  %copy.src.1 = inttoptr i64 %r1 to ptr
  %copy.val.2 = load %t.GraphicsTexture, ptr %copy.src.1
  store %t.GraphicsTexture %copy.val.2, ptr %copy.dst.2
  %r3 = call i64 @"kira_native_impl_122"()
  %field.base.4 = inttoptr i64 %r0 to ptr
  %field.ptr.4 = getelementptr inbounds %t.DepthAttachment, ptr %field.base.4, i32 0, i32 1
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %store.ptr.3 = inttoptr i64 %r4 to ptr
  store i64 %r3, ptr %store.ptr.3
  %r5 = call i64 @"kira_native_impl_125"()
  %field.base.6 = inttoptr i64 %r0 to ptr
  %field.ptr.6 = getelementptr inbounds %t.DepthAttachment, ptr %field.base.6, i32 0, i32 2
  %r6 = ptrtoint ptr %field.ptr.6 to i64
  %store.ptr.5 = inttoptr i64 %r6 to ptr
  store i64 %r5, ptr %store.ptr.5
  %r7 = fadd double 0.0, 1.0
  %field.base.8 = inttoptr i64 %r0 to ptr
  %field.ptr.8 = getelementptr inbounds %t.DepthAttachment, ptr %field.base.8, i32 0, i32 3
  %r8 = ptrtoint ptr %field.ptr.8 to i64
  %store.ptr.7 = inttoptr i64 %r8 to ptr
  store double %r7, ptr %store.ptr.7
  %r9 = add i1 0, 0
  %field.base.10 = inttoptr i64 %r0 to ptr
  %field.ptr.10 = getelementptr inbounds %t.DepthAttachment, ptr %field.base.10, i32 0, i32 4
  %r10 = ptrtoint ptr %field.ptr.10 to i64
  %store.ptr.9 = inttoptr i64 %r10 to ptr
  %store.bool.9 = zext i1 %r9 to i8
  store i8 %store.bool.9, ptr %store.ptr.9
  %cleanup.heap.ptr.0 = load ptr, ptr %cleanup.heap.slot.1
  call void @free(ptr %cleanup.heap.ptr.0)
  ret i64 %r0
}

define i64 @"kira_native_impl_190"() {
entry:
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.1 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.1
  %alloc.size.ptr.0 = getelementptr %t.StencilAttachment, ptr null, i32 1
  %alloc.size.0 = ptrtoint ptr %alloc.size.ptr.0 to i64
  %alloc.empty.0 = icmp eq i64 %alloc.size.0, 0
  %alloc.bytes.0 = select i1 %alloc.empty.0, i64 1, i64 %alloc.size.0
  %alloc.ptr.0 = call ptr @malloc(i64 %alloc.bytes.0)
  store %t.StencilAttachment zeroinitializer, ptr %alloc.ptr.0
  %r0 = ptrtoint ptr %alloc.ptr.0 to i64
  store ptr %alloc.ptr.0, ptr %cleanup.heap.slot.0
  %r1 = call i64 @"kira_native_impl_179"()
  %cleanup.call.ptr.1 = inttoptr i64 %r1 to ptr
  store ptr %cleanup.call.ptr.1, ptr %cleanup.heap.slot.1
  %field.base.2 = inttoptr i64 %r0 to ptr
  %field.ptr.2 = getelementptr inbounds %t.StencilAttachment, ptr %field.base.2, i32 0, i32 0
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %copy.dst.2 = inttoptr i64 %r2 to ptr
  %copy.src.1 = inttoptr i64 %r1 to ptr
  %copy.val.2 = load %t.GraphicsTexture, ptr %copy.src.1
  store %t.GraphicsTexture %copy.val.2, ptr %copy.dst.2
  %r3 = call i64 @"kira_native_impl_122"()
  %field.base.4 = inttoptr i64 %r0 to ptr
  %field.ptr.4 = getelementptr inbounds %t.StencilAttachment, ptr %field.base.4, i32 0, i32 1
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %store.ptr.3 = inttoptr i64 %r4 to ptr
  store i64 %r3, ptr %store.ptr.3
  %r5 = call i64 @"kira_native_impl_125"()
  %field.base.6 = inttoptr i64 %r0 to ptr
  %field.ptr.6 = getelementptr inbounds %t.StencilAttachment, ptr %field.base.6, i32 0, i32 2
  %r6 = ptrtoint ptr %field.ptr.6 to i64
  %store.ptr.5 = inttoptr i64 %r6 to ptr
  store i64 %r5, ptr %store.ptr.5
  %r7 = add i64 0, 0
  %field.base.8 = inttoptr i64 %r0 to ptr
  %field.ptr.8 = getelementptr inbounds %t.StencilAttachment, ptr %field.base.8, i32 0, i32 3
  %r8 = ptrtoint ptr %field.ptr.8 to i64
  %store.ptr.7 = inttoptr i64 %r8 to ptr
  store i64 %r7, ptr %store.ptr.7
  %r9 = add i1 0, 0
  %field.base.10 = inttoptr i64 %r0 to ptr
  %field.ptr.10 = getelementptr inbounds %t.StencilAttachment, ptr %field.base.10, i32 0, i32 4
  %r10 = ptrtoint ptr %field.ptr.10 to i64
  %store.ptr.9 = inttoptr i64 %r10 to ptr
  %store.bool.9 = zext i1 %r9 to i8
  store i8 %store.bool.9, ptr %store.ptr.9
  %cleanup.heap.ptr.0 = load ptr, ptr %cleanup.heap.slot.1
  call void @free(ptr %cleanup.heap.ptr.0)
  ret i64 %r0
}

define i64 @"kira_native_impl_191"() {
entry:
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.3 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.3
  %alloc.size.ptr.0 = getelementptr %t.RenderTarget, ptr null, i32 1
  %alloc.size.0 = ptrtoint ptr %alloc.size.ptr.0 to i64
  %alloc.empty.0 = icmp eq i64 %alloc.size.0, 0
  %alloc.bytes.0 = select i1 %alloc.empty.0, i64 1, i64 %alloc.size.0
  %alloc.ptr.0 = call ptr @malloc(i64 %alloc.bytes.0)
  store %t.RenderTarget zeroinitializer, ptr %alloc.ptr.0
  %r0 = ptrtoint ptr %alloc.ptr.0 to i64
  store ptr %alloc.ptr.0, ptr %cleanup.heap.slot.0
  %r1 = call i64 @"kira_native_impl_127"()
  %field.base.2 = inttoptr i64 %r0 to ptr
  %field.ptr.2 = getelementptr inbounds %t.RenderTarget, ptr %field.base.2, i32 0, i32 0
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %store.ptr.1 = inttoptr i64 %r2 to ptr
  store i64 %r1, ptr %store.ptr.1
  %r3 = call i64 @"kira_native_impl_179"()
  %cleanup.call.ptr.3 = inttoptr i64 %r3 to ptr
  store ptr %cleanup.call.ptr.3, ptr %cleanup.heap.slot.3
  %field.base.4 = inttoptr i64 %r0 to ptr
  %field.ptr.4 = getelementptr inbounds %t.RenderTarget, ptr %field.base.4, i32 0, i32 1
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %copy.dst.4 = inttoptr i64 %r4 to ptr
  %copy.src.3 = inttoptr i64 %r3 to ptr
  %copy.val.4 = load %t.GraphicsTexture, ptr %copy.src.3
  store %t.GraphicsTexture %copy.val.4, ptr %copy.dst.4
  %r5 = add i64 0, 0
  %field.base.6 = inttoptr i64 %r0 to ptr
  %field.ptr.6 = getelementptr inbounds %t.RenderTarget, ptr %field.base.6, i32 0, i32 2
  %r6 = ptrtoint ptr %field.ptr.6 to i64
  %store.ptr.5 = inttoptr i64 %r6 to ptr
  store i64 %r5, ptr %store.ptr.5
  %r7 = add i64 0, 0
  %field.base.8 = inttoptr i64 %r0 to ptr
  %field.ptr.8 = getelementptr inbounds %t.RenderTarget, ptr %field.base.8, i32 0, i32 3
  %r8 = ptrtoint ptr %field.ptr.8 to i64
  %store.ptr.7 = inttoptr i64 %r8 to ptr
  store i64 %r7, ptr %store.ptr.7
  %cleanup.heap.ptr.0 = load ptr, ptr %cleanup.heap.slot.3
  call void @free(ptr %cleanup.heap.ptr.0)
  ret i64 %r0
}

define i64 @"kira_native_impl_192"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.Color
  store %t.Color zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.6 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.6
  %cleanup.heap.slot.7 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.7
  %cleanup.heap.slot.13 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.13
  %cleanup.heap.slot.15 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.15
  %cleanup.heap.slot.20 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.20
  %cleanup.heap.slot.21 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.21
  %cleanup.heap.slot.27 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.27
  %cleanup.heap.slot.29 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.29
  %cleanup.heap.slot.36 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.36
  %cleanup.heap.slot.40 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.40
  store i64 %arg0, ptr %local0
  %alloc.size.ptr.0 = getelementptr %t.RenderPassDescriptor, ptr null, i32 1
  %alloc.size.0 = ptrtoint ptr %alloc.size.ptr.0 to i64
  %alloc.empty.0 = icmp eq i64 %alloc.size.0, 0
  %alloc.bytes.0 = select i1 %alloc.empty.0, i64 1, i64 %alloc.size.0
  %alloc.ptr.0 = call ptr @malloc(i64 %alloc.bytes.0)
  store %t.RenderPassDescriptor zeroinitializer, ptr %alloc.ptr.0
  %r0 = ptrtoint ptr %alloc.ptr.0 to i64
  store ptr %alloc.ptr.0, ptr %cleanup.heap.slot.0
  %r1 = load %kira.string, ptr @kira_str_1
  %field.base.2 = inttoptr i64 %r0 to ptr
  %field.ptr.2 = getelementptr inbounds %t.RenderPassDescriptor, ptr %field.base.2, i32 0, i32 0
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %store.ptr.1 = inttoptr i64 %r2 to ptr
  store %kira.string %r1, ptr %store.ptr.1
  %r3 = add i64 0, 1
  %alloc.array.ptr.4 = call ptr @"kira_array_alloc"(i64 %r3)
  %r4 = ptrtoint ptr %alloc.array.ptr.4 to i64
  %r5 = add i64 0, 0
  %alloc.size.ptr.6 = getelementptr %t.ColorAttachment, ptr null, i32 1
  %alloc.size.6 = ptrtoint ptr %alloc.size.ptr.6 to i64
  %alloc.empty.6 = icmp eq i64 %alloc.size.6, 0
  %alloc.bytes.6 = select i1 %alloc.empty.6, i64 1, i64 %alloc.size.6
  %alloc.ptr.6 = call ptr @malloc(i64 %alloc.bytes.6)
  store %t.ColorAttachment zeroinitializer, ptr %alloc.ptr.6
  %r6 = ptrtoint ptr %alloc.ptr.6 to i64
  store ptr %alloc.ptr.6, ptr %cleanup.heap.slot.6
  %r7 = call i64 @"kira_native_impl_191"()
  %cleanup.call.ptr.7 = inttoptr i64 %r7 to ptr
  store ptr %cleanup.call.ptr.7, ptr %cleanup.heap.slot.7
  %field.base.8 = inttoptr i64 %r6 to ptr
  %field.ptr.8 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.8, i32 0, i32 0
  %r8 = ptrtoint ptr %field.ptr.8 to i64
  %copy.dst.8 = inttoptr i64 %r8 to ptr
  %copy.src.7 = inttoptr i64 %r7 to ptr
  %copy.val.8 = load %t.RenderTarget, ptr %copy.src.7
  store %t.RenderTarget %copy.val.8, ptr %copy.dst.8
  %r9 = call i64 @"kira_native_impl_122"()
  %field.base.10 = inttoptr i64 %r6 to ptr
  %field.ptr.10 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.10, i32 0, i32 1
  %r10 = ptrtoint ptr %field.ptr.10 to i64
  %store.ptr.9 = inttoptr i64 %r10 to ptr
  store i64 %r9, ptr %store.ptr.9
  %r11 = call i64 @"kira_native_impl_125"()
  %field.base.12 = inttoptr i64 %r6 to ptr
  %field.ptr.12 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.12, i32 0, i32 2
  %r12 = ptrtoint ptr %field.ptr.12 to i64
  %store.ptr.11 = inttoptr i64 %r12 to ptr
  store i64 %r11, ptr %store.ptr.11
  %r13 = load i64, ptr %local0
  %field.base.14 = inttoptr i64 %r6 to ptr
  %field.ptr.14 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.14, i32 0, i32 3
  %r14 = ptrtoint ptr %field.ptr.14 to i64
  %copy.dst.14 = inttoptr i64 %r14 to ptr
  %copy.src.13 = inttoptr i64 %r13 to ptr
  %copy.val.14 = load %t.Color, ptr %copy.src.13
  store %t.Color %copy.val.14, ptr %copy.dst.14
  %r15 = call i64 @"kira_native_impl_187"()
  %cleanup.call.ptr.15 = inttoptr i64 %r15 to ptr
  store ptr %cleanup.call.ptr.15, ptr %cleanup.heap.slot.15
  %field.base.16 = inttoptr i64 %r6 to ptr
  %field.ptr.16 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.16, i32 0, i32 4
  %r16 = ptrtoint ptr %field.ptr.16 to i64
  %copy.dst.16 = inttoptr i64 %r16 to ptr
  %copy.src.15 = inttoptr i64 %r15 to ptr
  %copy.val.16 = load %t.RenderTarget, ptr %copy.src.15
  store %t.RenderTarget %copy.val.16, ptr %copy.dst.16
  %r17 = add i1 0, 0
  %field.base.18 = inttoptr i64 %r6 to ptr
  %field.ptr.18 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.18, i32 0, i32 5
  %r18 = ptrtoint ptr %field.ptr.18 to i64
  %store.ptr.17 = inttoptr i64 %r18 to ptr
  %store.bool.17 = zext i1 %r17 to i8
  store i8 %store.bool.17, ptr %store.ptr.17
  %array.set.ptr.6 = inttoptr i64 %r4 to ptr
  %array.set.pack.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %array.set.struct.src.0 = inttoptr i64 %r6 to ptr
  %array.set.struct.value.0 = load %t.ColorAttachment, ptr %array.set.struct.src.0
  %array.set.struct.size.ptr.0 = getelementptr %t.ColorAttachment, ptr null, i32 1
  %array.set.struct.size.0 = ptrtoint ptr %array.set.struct.size.ptr.0 to i64
  %array.set.struct.copy.0 = call ptr @malloc(i64 %array.set.struct.size.0)
  store %t.ColorAttachment %array.set.struct.value.0, ptr %array.set.struct.copy.0
  %array.set.struct.ptrint.0 = ptrtoint ptr %array.set.struct.copy.0 to i64
  %array.set.pack.0 = insertvalue %kira.bridge.value %array.set.pack.0.0, i64 %array.set.struct.ptrint.0, 2
  %array.set.pack.ptr.0 = alloca %kira.bridge.value
  store %kira.bridge.value %array.set.pack.0, ptr %array.set.pack.ptr.0
  call void @"kira_array_store"(ptr %array.set.ptr.6, i64 %r5, ptr %array.set.pack.ptr.0)
  %field.base.19 = inttoptr i64 %r0 to ptr
  %field.ptr.19 = getelementptr inbounds %t.RenderPassDescriptor, ptr %field.base.19, i32 0, i32 1
  %r19 = ptrtoint ptr %field.ptr.19 to i64
  %store.ptr.4 = inttoptr i64 %r19 to ptr
  %store.arrayptr.4 = inttoptr i64 %r4 to ptr
  store ptr %store.arrayptr.4, ptr %store.ptr.4
  %alloc.size.ptr.20 = getelementptr %t.ColorAttachment, ptr null, i32 1
  %alloc.size.20 = ptrtoint ptr %alloc.size.ptr.20 to i64
  %alloc.empty.20 = icmp eq i64 %alloc.size.20, 0
  %alloc.bytes.20 = select i1 %alloc.empty.20, i64 1, i64 %alloc.size.20
  %alloc.ptr.20 = call ptr @malloc(i64 %alloc.bytes.20)
  store %t.ColorAttachment zeroinitializer, ptr %alloc.ptr.20
  %r20 = ptrtoint ptr %alloc.ptr.20 to i64
  store ptr %alloc.ptr.20, ptr %cleanup.heap.slot.20
  %r21 = call i64 @"kira_native_impl_191"()
  %cleanup.call.ptr.21 = inttoptr i64 %r21 to ptr
  store ptr %cleanup.call.ptr.21, ptr %cleanup.heap.slot.21
  %field.base.22 = inttoptr i64 %r20 to ptr
  %field.ptr.22 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.22, i32 0, i32 0
  %r22 = ptrtoint ptr %field.ptr.22 to i64
  %copy.dst.22 = inttoptr i64 %r22 to ptr
  %copy.src.21 = inttoptr i64 %r21 to ptr
  %copy.val.22 = load %t.RenderTarget, ptr %copy.src.21
  store %t.RenderTarget %copy.val.22, ptr %copy.dst.22
  %r23 = call i64 @"kira_native_impl_122"()
  %field.base.24 = inttoptr i64 %r20 to ptr
  %field.ptr.24 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.24, i32 0, i32 1
  %r24 = ptrtoint ptr %field.ptr.24 to i64
  %store.ptr.23 = inttoptr i64 %r24 to ptr
  store i64 %r23, ptr %store.ptr.23
  %r25 = call i64 @"kira_native_impl_125"()
  %field.base.26 = inttoptr i64 %r20 to ptr
  %field.ptr.26 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.26, i32 0, i32 2
  %r26 = ptrtoint ptr %field.ptr.26 to i64
  %store.ptr.25 = inttoptr i64 %r26 to ptr
  store i64 %r25, ptr %store.ptr.25
  %r27 = load i64, ptr %local0
  %field.base.28 = inttoptr i64 %r20 to ptr
  %field.ptr.28 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.28, i32 0, i32 3
  %r28 = ptrtoint ptr %field.ptr.28 to i64
  %copy.dst.28 = inttoptr i64 %r28 to ptr
  %copy.src.27 = inttoptr i64 %r27 to ptr
  %copy.val.28 = load %t.Color, ptr %copy.src.27
  store %t.Color %copy.val.28, ptr %copy.dst.28
  %r29 = call i64 @"kira_native_impl_187"()
  %cleanup.call.ptr.29 = inttoptr i64 %r29 to ptr
  store ptr %cleanup.call.ptr.29, ptr %cleanup.heap.slot.29
  %field.base.30 = inttoptr i64 %r20 to ptr
  %field.ptr.30 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.30, i32 0, i32 4
  %r30 = ptrtoint ptr %field.ptr.30 to i64
  %copy.dst.30 = inttoptr i64 %r30 to ptr
  %copy.src.29 = inttoptr i64 %r29 to ptr
  %copy.val.30 = load %t.RenderTarget, ptr %copy.src.29
  store %t.RenderTarget %copy.val.30, ptr %copy.dst.30
  %r31 = add i1 0, 0
  %field.base.32 = inttoptr i64 %r20 to ptr
  %field.ptr.32 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.32, i32 0, i32 5
  %r32 = ptrtoint ptr %field.ptr.32 to i64
  %store.ptr.31 = inttoptr i64 %r32 to ptr
  %store.bool.31 = zext i1 %r31 to i8
  store i8 %store.bool.31, ptr %store.ptr.31
  %field.base.33 = inttoptr i64 %r0 to ptr
  %field.ptr.33 = getelementptr inbounds %t.RenderPassDescriptor, ptr %field.base.33, i32 0, i32 2
  %r33 = ptrtoint ptr %field.ptr.33 to i64
  %copy.dst.33 = inttoptr i64 %r33 to ptr
  %copy.src.20 = inttoptr i64 %r20 to ptr
  %copy.val.33 = load %t.ColorAttachment, ptr %copy.src.20
  store %t.ColorAttachment %copy.val.33, ptr %copy.dst.33
  %r34 = add i1 0, 1
  %field.base.35 = inttoptr i64 %r0 to ptr
  %field.ptr.35 = getelementptr inbounds %t.RenderPassDescriptor, ptr %field.base.35, i32 0, i32 3
  %r35 = ptrtoint ptr %field.ptr.35 to i64
  %store.ptr.34 = inttoptr i64 %r35 to ptr
  %store.bool.34 = zext i1 %r34 to i8
  store i8 %store.bool.34, ptr %store.ptr.34
  %r36 = call i64 @"kira_native_impl_188"()
  %cleanup.call.ptr.36 = inttoptr i64 %r36 to ptr
  store ptr %cleanup.call.ptr.36, ptr %cleanup.heap.slot.36
  %field.base.37 = inttoptr i64 %r0 to ptr
  %field.ptr.37 = getelementptr inbounds %t.RenderPassDescriptor, ptr %field.base.37, i32 0, i32 4
  %r37 = ptrtoint ptr %field.ptr.37 to i64
  %copy.dst.37 = inttoptr i64 %r37 to ptr
  %copy.src.36 = inttoptr i64 %r36 to ptr
  %copy.val.37 = load %t.DepthAttachment, ptr %copy.src.36
  store %t.DepthAttachment %copy.val.37, ptr %copy.dst.37
  %r38 = add i1 0, 0
  %field.base.39 = inttoptr i64 %r0 to ptr
  %field.ptr.39 = getelementptr inbounds %t.RenderPassDescriptor, ptr %field.base.39, i32 0, i32 5
  %r39 = ptrtoint ptr %field.ptr.39 to i64
  %store.ptr.38 = inttoptr i64 %r39 to ptr
  %store.bool.38 = zext i1 %r38 to i8
  store i8 %store.bool.38, ptr %store.ptr.38
  %r40 = call i64 @"kira_native_impl_190"()
  %cleanup.call.ptr.40 = inttoptr i64 %r40 to ptr
  store ptr %cleanup.call.ptr.40, ptr %cleanup.heap.slot.40
  %field.base.41 = inttoptr i64 %r0 to ptr
  %field.ptr.41 = getelementptr inbounds %t.RenderPassDescriptor, ptr %field.base.41, i32 0, i32 6
  %r41 = ptrtoint ptr %field.ptr.41 to i64
  %copy.dst.41 = inttoptr i64 %r41 to ptr
  %copy.src.40 = inttoptr i64 %r40 to ptr
  %copy.val.41 = load %t.StencilAttachment, ptr %copy.src.40
  store %t.StencilAttachment %copy.val.41, ptr %copy.dst.41
  %r42 = add i1 0, 0
  %field.base.43 = inttoptr i64 %r0 to ptr
  %field.ptr.43 = getelementptr inbounds %t.RenderPassDescriptor, ptr %field.base.43, i32 0, i32 7
  %r43 = ptrtoint ptr %field.ptr.43 to i64
  %store.ptr.42 = inttoptr i64 %r43 to ptr
  %store.bool.42 = zext i1 %r42 to i8
  store i8 %store.bool.42, ptr %store.ptr.42
  %cleanup.heap.ptr.1 = load ptr, ptr %cleanup.heap.slot.6
  call void @free(ptr %cleanup.heap.ptr.1)
  %cleanup.heap.ptr.2 = load ptr, ptr %cleanup.heap.slot.7
  call void @free(ptr %cleanup.heap.ptr.2)
  %cleanup.heap.ptr.3 = load ptr, ptr %cleanup.heap.slot.15
  call void @free(ptr %cleanup.heap.ptr.3)
  %cleanup.heap.ptr.4 = load ptr, ptr %cleanup.heap.slot.20
  call void @free(ptr %cleanup.heap.ptr.4)
  %cleanup.heap.ptr.5 = load ptr, ptr %cleanup.heap.slot.21
  call void @free(ptr %cleanup.heap.ptr.5)
  %cleanup.heap.ptr.6 = load ptr, ptr %cleanup.heap.slot.29
  call void @free(ptr %cleanup.heap.ptr.6)
  %cleanup.heap.ptr.7 = load ptr, ptr %cleanup.heap.slot.36
  call void @free(ptr %cleanup.heap.ptr.7)
  %cleanup.heap.ptr.8 = load ptr, ptr %cleanup.heap.slot.40
  call void @free(ptr %cleanup.heap.ptr.8)
  ret i64 %r0
}

define void @"kira_native_impl_445"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.4 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.4
  %cleanup.heap.slot.5 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.5
  %cleanup.heap.slot.16 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.16
  %cleanup.heap.slot.18 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.18
  %cleanup.heap.slot.19 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.19
  %cleanup.heap.slot.28 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.28
  %cleanup.heap.slot.30 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.30
  %cleanup.heap.slot.31 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.31
  %cleanup.heap.slot.35 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.35
  %cleanup.heap.slot.37 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.37
  %cleanup.heap.slot.42 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.42
  %cleanup.heap.slot.45 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.45
  %cleanup.heap.slot.52 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.52
  %cleanup.heap.slot.62 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.62
  %cleanup.heap.slot.68 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.68
  %cleanup.heap.slot.72 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.72
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
  %alloc.size.ptr.5 = getelementptr %t.ShaderDescriptor, ptr null, i32 1
  %alloc.size.5 = ptrtoint ptr %alloc.size.ptr.5 to i64
  %alloc.empty.5 = icmp eq i64 %alloc.size.5, 0
  %alloc.bytes.5 = select i1 %alloc.empty.5, i64 1, i64 %alloc.size.5
  %alloc.ptr.5 = call ptr @malloc(i64 %alloc.bytes.5)
  store %t.ShaderDescriptor zeroinitializer, ptr %alloc.ptr.5
  %r5 = ptrtoint ptr %alloc.ptr.5 to i64
  store ptr %alloc.ptr.5, ptr %cleanup.heap.slot.5
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
  %rt.args.0 = alloca [2 x %kira.bridge.value]
  %rt.slot.0.0 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.0, i64 0, i64 0
  %rt.pack.0.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.0.0.1 = insertvalue %kira.bridge.value %rt.pack.0.0.0, i64 %r4, 2
  store %kira.bridge.value %rt.pack.0.0.1, ptr %rt.slot.0.0
  %rt.slot.0.1 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.0, i64 0, i64 1
  %rt.pack.0.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.0.1.1 = insertvalue %kira.bridge.value %rt.pack.0.1.0, i64 %r5, 2
  store %kira.bridge.value %rt.pack.0.1.1, ptr %rt.slot.0.1
  %rt.result.0 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 412, ptr %rt.args.0, i32 2, ptr %rt.result.0)
  %rt.result.load.0 = load %kira.bridge.value, ptr %rt.result.0
  %r16 = extractvalue %kira.bridge.value %rt.result.load.0, 2
  %r17 = load i64, ptr %local1
  %native.state.set.ptr.16 = inttoptr i64 %r17 to ptr
  %native.state.set.slot.16 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.16, i64 0
  %native.state.set.pack.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %native.state.set.struct.src.1 = inttoptr i64 %r16 to ptr
  %native.state.set.struct.value.1 = load %t.GraphicsShader, ptr %native.state.set.struct.src.1
  %native.state.set.struct.size.ptr.1 = getelementptr %t.GraphicsShader, ptr null, i32 1
  %native.state.set.struct.size.1 = ptrtoint ptr %native.state.set.struct.size.ptr.1 to i64
  %native.state.set.struct.copy.1 = call ptr @malloc(i64 %native.state.set.struct.size.1)
  store %t.GraphicsShader %native.state.set.struct.value.1, ptr %native.state.set.struct.copy.1
  %native.state.set.struct.ptrint.1 = ptrtoint ptr %native.state.set.struct.copy.1 to i64
  %native.state.set.pack.1 = insertvalue %kira.bridge.value %native.state.set.pack.1.0, i64 %native.state.set.struct.ptrint.1, 2
  store %kira.bridge.value %native.state.set.pack.1, ptr %native.state.set.slot.16
  %r18 = load i64, ptr %local0
  %alloc.size.ptr.19 = getelementptr %t.BufferDescriptor, ptr null, i32 1
  %alloc.size.19 = ptrtoint ptr %alloc.size.ptr.19 to i64
  %alloc.empty.19 = icmp eq i64 %alloc.size.19, 0
  %alloc.bytes.19 = select i1 %alloc.empty.19, i64 1, i64 %alloc.size.19
  %alloc.ptr.19 = call ptr @malloc(i64 %alloc.bytes.19)
  store %t.BufferDescriptor zeroinitializer, ptr %alloc.ptr.19
  %r19 = ptrtoint ptr %alloc.ptr.19 to i64
  store ptr %alloc.ptr.19, ptr %cleanup.heap.slot.19
  %r20 = load %kira.string, ptr @kira_str_7
  %field.base.21 = inttoptr i64 %r19 to ptr
  %field.ptr.21 = getelementptr inbounds %t.BufferDescriptor, ptr %field.base.21, i32 0, i32 0
  %r21 = ptrtoint ptr %field.ptr.21 to i64
  %store.ptr.20 = inttoptr i64 %r21 to ptr
  store %kira.string %r20, ptr %store.ptr.20
  %r22 = call i64 @"kira_native_impl_89"()
  %field.base.23 = inttoptr i64 %r19 to ptr
  %field.ptr.23 = getelementptr inbounds %t.BufferDescriptor, ptr %field.base.23, i32 0, i32 1
  %r23 = ptrtoint ptr %field.ptr.23 to i64
  %store.ptr.22 = inttoptr i64 %r23 to ptr
  store i64 %r22, ptr %store.ptr.22
  %r24 = add i64 0, 8
  %field.base.25 = inttoptr i64 %r19 to ptr
  %field.ptr.25 = getelementptr inbounds %t.BufferDescriptor, ptr %field.base.25, i32 0, i32 2
  %r25 = ptrtoint ptr %field.ptr.25 to i64
  %store.ptr.24 = inttoptr i64 %r25 to ptr
  store i64 %r24, ptr %store.ptr.24
  %rt.result.2 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 0, ptr null, i32 0, ptr %rt.result.2)
  %rt.result.load.2 = load %kira.bridge.value, ptr %rt.result.2
  %r26 = extractvalue %kira.bridge.value %rt.result.load.2, 2
  %field.base.27 = inttoptr i64 %r19 to ptr
  %field.ptr.27 = getelementptr inbounds %t.BufferDescriptor, ptr %field.base.27, i32 0, i32 3
  %r27 = ptrtoint ptr %field.ptr.27 to i64
  %store.ptr.26 = inttoptr i64 %r27 to ptr
  %store.arrayptr.26 = inttoptr i64 %r26 to ptr
  store ptr %store.arrayptr.26, ptr %store.ptr.26
  %rt.args.3 = alloca [2 x %kira.bridge.value]
  %rt.slot.3.0 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.3, i64 0, i64 0
  %rt.pack.3.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.3.0.1 = insertvalue %kira.bridge.value %rt.pack.3.0.0, i64 %r18, 2
  store %kira.bridge.value %rt.pack.3.0.1, ptr %rt.slot.3.0
  %rt.slot.3.1 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.3, i64 0, i64 1
  %rt.pack.3.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.3.1.1 = insertvalue %kira.bridge.value %rt.pack.3.1.0, i64 %r19, 2
  store %kira.bridge.value %rt.pack.3.1.1, ptr %rt.slot.3.1
  %rt.result.3 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 418, ptr %rt.args.3, i32 2, ptr %rt.result.3)
  %rt.result.load.3 = load %kira.bridge.value, ptr %rt.result.3
  %r28 = extractvalue %kira.bridge.value %rt.result.load.3, 2
  %r29 = load i64, ptr %local1
  %native.state.set.ptr.28 = inttoptr i64 %r29 to ptr
  %native.state.set.slot.28 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.28, i64 2
  %native.state.set.pack.4.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %native.state.set.struct.src.4 = inttoptr i64 %r28 to ptr
  %native.state.set.struct.value.4 = load %t.GraphicsBuffer, ptr %native.state.set.struct.src.4
  %native.state.set.struct.size.ptr.4 = getelementptr %t.GraphicsBuffer, ptr null, i32 1
  %native.state.set.struct.size.4 = ptrtoint ptr %native.state.set.struct.size.ptr.4 to i64
  %native.state.set.struct.copy.4 = call ptr @malloc(i64 %native.state.set.struct.size.4)
  store %t.GraphicsBuffer %native.state.set.struct.value.4, ptr %native.state.set.struct.copy.4
  %native.state.set.struct.ptrint.4 = ptrtoint ptr %native.state.set.struct.copy.4 to i64
  %native.state.set.pack.4 = insertvalue %kira.bridge.value %native.state.set.pack.4.0, i64 %native.state.set.struct.ptrint.4, 2
  store %kira.bridge.value %native.state.set.pack.4, ptr %native.state.set.slot.28
  %r30 = load i64, ptr %local0
  %alloc.size.ptr.31 = getelementptr %t.RenderPipelineDescriptor, ptr null, i32 1
  %alloc.size.31 = ptrtoint ptr %alloc.size.ptr.31 to i64
  %alloc.empty.31 = icmp eq i64 %alloc.size.31, 0
  %alloc.bytes.31 = select i1 %alloc.empty.31, i64 1, i64 %alloc.size.31
  %alloc.ptr.31 = call ptr @malloc(i64 %alloc.bytes.31)
  store %t.RenderPipelineDescriptor zeroinitializer, ptr %alloc.ptr.31
  %r31 = ptrtoint ptr %alloc.ptr.31 to i64
  store ptr %alloc.ptr.31, ptr %cleanup.heap.slot.31
  %r32 = load %kira.string, ptr @kira_str_8
  %field.base.33 = inttoptr i64 %r31 to ptr
  %field.ptr.33 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.33, i32 0, i32 0
  %r33 = ptrtoint ptr %field.ptr.33 to i64
  %store.ptr.32 = inttoptr i64 %r33 to ptr
  store %kira.string %r32, ptr %store.ptr.32
  %r34 = load i64, ptr %local1
  %native.state.get.ptr.35 = inttoptr i64 %r34 to ptr
  %native.state.get.slot.35 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.35, i64 0
  %native.state.get.val.5 = load %kira.bridge.value, ptr %native.state.get.slot.35
  %r35 = extractvalue %kira.bridge.value %native.state.get.val.5, 2
  %field.base.36 = inttoptr i64 %r31 to ptr
  %field.ptr.36 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.36, i32 0, i32 1
  %r36 = ptrtoint ptr %field.ptr.36 to i64
  %copy.dst.36 = inttoptr i64 %r36 to ptr
  %copy.src.35 = inttoptr i64 %r35 to ptr
  %copy.val.36 = load %t.GraphicsShader, ptr %copy.src.35
  store %t.GraphicsShader %copy.val.36, ptr %copy.dst.36
  %rt.result.6 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 1, ptr null, i32 0, ptr %rt.result.6)
  %rt.result.load.6 = load %kira.bridge.value, ptr %rt.result.6
  %r37 = extractvalue %kira.bridge.value %rt.result.load.6, 2
  %field.base.38 = inttoptr i64 %r31 to ptr
  %field.ptr.38 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.38, i32 0, i32 2
  %r38 = ptrtoint ptr %field.ptr.38 to i64
  %copy.dst.38 = inttoptr i64 %r38 to ptr
  %copy.src.37 = inttoptr i64 %r37 to ptr
  %copy.val.38 = load %t.VertexLayout, ptr %copy.src.37
  store %t.VertexLayout %copy.val.38, ptr %copy.dst.38
  %r39 = add i64 0, 1
  %alloc.array.ptr.40 = call ptr @"kira_array_alloc"(i64 %r39)
  %r40 = ptrtoint ptr %alloc.array.ptr.40 to i64
  %r41 = add i64 0, 0
  %alloc.size.ptr.42 = getelementptr %t.ColorTargetDescriptor, ptr null, i32 1
  %alloc.size.42 = ptrtoint ptr %alloc.size.ptr.42 to i64
  %alloc.empty.42 = icmp eq i64 %alloc.size.42, 0
  %alloc.bytes.42 = select i1 %alloc.empty.42, i64 1, i64 %alloc.size.42
  %alloc.ptr.42 = call ptr @malloc(i64 %alloc.bytes.42)
  store %t.ColorTargetDescriptor zeroinitializer, ptr %alloc.ptr.42
  %r42 = ptrtoint ptr %alloc.ptr.42 to i64
  store ptr %alloc.ptr.42, ptr %cleanup.heap.slot.42
  %r43 = call i64 @"kira_native_impl_98"()
  %field.base.44 = inttoptr i64 %r42 to ptr
  %field.ptr.44 = getelementptr inbounds %t.ColorTargetDescriptor, ptr %field.base.44, i32 0, i32 0
  %r44 = ptrtoint ptr %field.ptr.44 to i64
  %store.ptr.43 = inttoptr i64 %r44 to ptr
  store i64 %r43, ptr %store.ptr.43
  %alloc.size.ptr.45 = getelementptr %t.BlendState, ptr null, i32 1
  %alloc.size.45 = ptrtoint ptr %alloc.size.ptr.45 to i64
  %alloc.empty.45 = icmp eq i64 %alloc.size.45, 0
  %alloc.bytes.45 = select i1 %alloc.empty.45, i64 1, i64 %alloc.size.45
  %alloc.ptr.45 = call ptr @malloc(i64 %alloc.bytes.45)
  store %t.BlendState zeroinitializer, ptr %alloc.ptr.45
  %r45 = ptrtoint ptr %alloc.ptr.45 to i64
  store ptr %alloc.ptr.45, ptr %cleanup.heap.slot.45
  %r46 = add i1 0, 0
  %field.base.47 = inttoptr i64 %r45 to ptr
  %field.ptr.47 = getelementptr inbounds %t.BlendState, ptr %field.base.47, i32 0, i32 0
  %r47 = ptrtoint ptr %field.ptr.47 to i64
  %store.ptr.46 = inttoptr i64 %r47 to ptr
  %store.bool.46 = zext i1 %r46 to i8
  store i8 %store.bool.46, ptr %store.ptr.46
  %r48 = call i64 @"kira_native_impl_104"()
  %field.base.49 = inttoptr i64 %r45 to ptr
  %field.ptr.49 = getelementptr inbounds %t.BlendState, ptr %field.base.49, i32 0, i32 1
  %r49 = ptrtoint ptr %field.ptr.49 to i64
  %store.ptr.48 = inttoptr i64 %r49 to ptr
  store i64 %r48, ptr %store.ptr.48
  %field.base.50 = inttoptr i64 %r42 to ptr
  %field.ptr.50 = getelementptr inbounds %t.ColorTargetDescriptor, ptr %field.base.50, i32 0, i32 1
  %r50 = ptrtoint ptr %field.ptr.50 to i64
  %copy.dst.50 = inttoptr i64 %r50 to ptr
  %copy.src.45 = inttoptr i64 %r45 to ptr
  %copy.val.50 = load %t.BlendState, ptr %copy.src.45
  store %t.BlendState %copy.val.50, ptr %copy.dst.50
  %array.set.ptr.42 = inttoptr i64 %r40 to ptr
  %array.set.pack.7.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %array.set.struct.src.7 = inttoptr i64 %r42 to ptr
  %array.set.struct.value.7 = load %t.ColorTargetDescriptor, ptr %array.set.struct.src.7
  %array.set.struct.size.ptr.7 = getelementptr %t.ColorTargetDescriptor, ptr null, i32 1
  %array.set.struct.size.7 = ptrtoint ptr %array.set.struct.size.ptr.7 to i64
  %array.set.struct.copy.7 = call ptr @malloc(i64 %array.set.struct.size.7)
  store %t.ColorTargetDescriptor %array.set.struct.value.7, ptr %array.set.struct.copy.7
  %array.set.struct.ptrint.7 = ptrtoint ptr %array.set.struct.copy.7 to i64
  %array.set.pack.7 = insertvalue %kira.bridge.value %array.set.pack.7.0, i64 %array.set.struct.ptrint.7, 2
  %array.set.pack.ptr.7 = alloca %kira.bridge.value
  store %kira.bridge.value %array.set.pack.7, ptr %array.set.pack.ptr.7
  call void @"kira_array_store"(ptr %array.set.ptr.42, i64 %r41, ptr %array.set.pack.ptr.7)
  %field.base.51 = inttoptr i64 %r31 to ptr
  %field.ptr.51 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.51, i32 0, i32 3
  %r51 = ptrtoint ptr %field.ptr.51 to i64
  %store.ptr.40 = inttoptr i64 %r51 to ptr
  %store.arrayptr.40 = inttoptr i64 %r40 to ptr
  store ptr %store.arrayptr.40, ptr %store.ptr.40
  %alloc.size.ptr.52 = getelementptr %t.DepthStencilDescriptor, ptr null, i32 1
  %alloc.size.52 = ptrtoint ptr %alloc.size.ptr.52 to i64
  %alloc.empty.52 = icmp eq i64 %alloc.size.52, 0
  %alloc.bytes.52 = select i1 %alloc.empty.52, i64 1, i64 %alloc.size.52
  %alloc.ptr.52 = call ptr @malloc(i64 %alloc.bytes.52)
  store %t.DepthStencilDescriptor zeroinitializer, ptr %alloc.ptr.52
  %r52 = ptrtoint ptr %alloc.ptr.52 to i64
  store ptr %alloc.ptr.52, ptr %cleanup.heap.slot.52
  %r53 = add i1 0, 0
  %field.base.54 = inttoptr i64 %r52 to ptr
  %field.ptr.54 = getelementptr inbounds %t.DepthStencilDescriptor, ptr %field.base.54, i32 0, i32 0
  %r54 = ptrtoint ptr %field.ptr.54 to i64
  %store.ptr.53 = inttoptr i64 %r54 to ptr
  %store.bool.53 = zext i1 %r53 to i8
  store i8 %store.bool.53, ptr %store.ptr.53
  %r55 = add i1 0, 0
  %field.base.56 = inttoptr i64 %r52 to ptr
  %field.ptr.56 = getelementptr inbounds %t.DepthStencilDescriptor, ptr %field.base.56, i32 0, i32 1
  %r56 = ptrtoint ptr %field.ptr.56 to i64
  %store.ptr.55 = inttoptr i64 %r56 to ptr
  %store.bool.55 = zext i1 %r55 to i8
  store i8 %store.bool.55, ptr %store.ptr.55
  %r57 = call i64 @"kira_native_impl_114"()
  %field.base.58 = inttoptr i64 %r52 to ptr
  %field.ptr.58 = getelementptr inbounds %t.DepthStencilDescriptor, ptr %field.base.58, i32 0, i32 2
  %r58 = ptrtoint ptr %field.ptr.58 to i64
  %store.ptr.57 = inttoptr i64 %r58 to ptr
  store i64 %r57, ptr %store.ptr.57
  %r59 = call i64 @"kira_native_impl_100"()
  %field.base.60 = inttoptr i64 %r52 to ptr
  %field.ptr.60 = getelementptr inbounds %t.DepthStencilDescriptor, ptr %field.base.60, i32 0, i32 3
  %r60 = ptrtoint ptr %field.ptr.60 to i64
  %store.ptr.59 = inttoptr i64 %r60 to ptr
  store i64 %r59, ptr %store.ptr.59
  %field.base.61 = inttoptr i64 %r31 to ptr
  %field.ptr.61 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.61, i32 0, i32 4
  %r61 = ptrtoint ptr %field.ptr.61 to i64
  %copy.dst.61 = inttoptr i64 %r61 to ptr
  %copy.src.52 = inttoptr i64 %r52 to ptr
  %copy.val.61 = load %t.DepthStencilDescriptor, ptr %copy.src.52
  store %t.DepthStencilDescriptor %copy.val.61, ptr %copy.dst.61
  %alloc.size.ptr.62 = getelementptr %t.RasterizationDescriptor, ptr null, i32 1
  %alloc.size.62 = ptrtoint ptr %alloc.size.ptr.62 to i64
  %alloc.empty.62 = icmp eq i64 %alloc.size.62, 0
  %alloc.bytes.62 = select i1 %alloc.empty.62, i64 1, i64 %alloc.size.62
  %alloc.ptr.62 = call ptr @malloc(i64 %alloc.bytes.62)
  store %t.RasterizationDescriptor zeroinitializer, ptr %alloc.ptr.62
  %r62 = ptrtoint ptr %alloc.ptr.62 to i64
  store ptr %alloc.ptr.62, ptr %cleanup.heap.slot.62
  %r63 = call i64 @"kira_native_impl_115"()
  %field.base.64 = inttoptr i64 %r62 to ptr
  %field.ptr.64 = getelementptr inbounds %t.RasterizationDescriptor, ptr %field.base.64, i32 0, i32 0
  %r64 = ptrtoint ptr %field.ptr.64 to i64
  %store.ptr.63 = inttoptr i64 %r64 to ptr
  store i64 %r63, ptr %store.ptr.63
  %r65 = call i64 @"kira_native_impl_118"()
  %field.base.66 = inttoptr i64 %r62 to ptr
  %field.ptr.66 = getelementptr inbounds %t.RasterizationDescriptor, ptr %field.base.66, i32 0, i32 1
  %r66 = ptrtoint ptr %field.ptr.66 to i64
  %store.ptr.65 = inttoptr i64 %r66 to ptr
  store i64 %r65, ptr %store.ptr.65
  %field.base.67 = inttoptr i64 %r31 to ptr
  %field.ptr.67 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.67, i32 0, i32 5
  %r67 = ptrtoint ptr %field.ptr.67 to i64
  %copy.dst.67 = inttoptr i64 %r67 to ptr
  %copy.src.62 = inttoptr i64 %r62 to ptr
  %copy.val.67 = load %t.RasterizationDescriptor, ptr %copy.src.62
  store %t.RasterizationDescriptor %copy.val.67, ptr %copy.dst.67
  %alloc.size.ptr.68 = getelementptr %t.PrimitiveDescriptor, ptr null, i32 1
  %alloc.size.68 = ptrtoint ptr %alloc.size.ptr.68 to i64
  %alloc.empty.68 = icmp eq i64 %alloc.size.68, 0
  %alloc.bytes.68 = select i1 %alloc.empty.68, i64 1, i64 %alloc.size.68
  %alloc.ptr.68 = call ptr @malloc(i64 %alloc.bytes.68)
  store %t.PrimitiveDescriptor zeroinitializer, ptr %alloc.ptr.68
  %r68 = ptrtoint ptr %alloc.ptr.68 to i64
  store ptr %alloc.ptr.68, ptr %cleanup.heap.slot.68
  %r69 = call i64 @"kira_native_impl_101"()
  %field.base.70 = inttoptr i64 %r68 to ptr
  %field.ptr.70 = getelementptr inbounds %t.PrimitiveDescriptor, ptr %field.base.70, i32 0, i32 0
  %r70 = ptrtoint ptr %field.ptr.70 to i64
  %store.ptr.69 = inttoptr i64 %r70 to ptr
  store i64 %r69, ptr %store.ptr.69
  %field.base.71 = inttoptr i64 %r31 to ptr
  %field.ptr.71 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.71, i32 0, i32 6
  %r71 = ptrtoint ptr %field.ptr.71 to i64
  %copy.dst.71 = inttoptr i64 %r71 to ptr
  %copy.src.68 = inttoptr i64 %r68 to ptr
  %copy.val.71 = load %t.PrimitiveDescriptor, ptr %copy.src.68
  store %t.PrimitiveDescriptor %copy.val.71, ptr %copy.dst.71
  %rt.args.8 = alloca [2 x %kira.bridge.value]
  %rt.slot.8.0 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.8, i64 0, i64 0
  %rt.pack.8.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.8.0.1 = insertvalue %kira.bridge.value %rt.pack.8.0.0, i64 %r30, 2
  store %kira.bridge.value %rt.pack.8.0.1, ptr %rt.slot.8.0
  %rt.slot.8.1 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.8, i64 0, i64 1
  %rt.pack.8.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.8.1.1 = insertvalue %kira.bridge.value %rt.pack.8.1.0, i64 %r31, 2
  store %kira.bridge.value %rt.pack.8.1.1, ptr %rt.slot.8.1
  %rt.result.8 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 415, ptr %rt.args.8, i32 2, ptr %rt.result.8)
  %rt.result.load.8 = load %kira.bridge.value, ptr %rt.result.8
  %r72 = extractvalue %kira.bridge.value %rt.result.load.8, 2
  %r73 = load i64, ptr %local1
  %native.state.set.ptr.72 = inttoptr i64 %r73 to ptr
  %native.state.set.slot.72 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.72, i64 1
  %native.state.set.pack.9.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %native.state.set.struct.src.9 = inttoptr i64 %r72 to ptr
  %native.state.set.struct.value.9 = load %t.RenderPipeline, ptr %native.state.set.struct.src.9
  %native.state.set.struct.size.ptr.9 = getelementptr %t.RenderPipeline, ptr null, i32 1
  %native.state.set.struct.size.9 = ptrtoint ptr %native.state.set.struct.size.ptr.9 to i64
  %native.state.set.struct.copy.9 = call ptr @malloc(i64 %native.state.set.struct.size.9)
  store %t.RenderPipeline %native.state.set.struct.value.9, ptr %native.state.set.struct.copy.9
  %native.state.set.struct.ptrint.9 = ptrtoint ptr %native.state.set.struct.copy.9 to i64
  %native.state.set.pack.9 = insertvalue %kira.bridge.value %native.state.set.pack.9.0, i64 %native.state.set.struct.ptrint.9, 2
  store %kira.bridge.value %native.state.set.pack.9, ptr %native.state.set.slot.72
  %cleanup.heap.ptr.10 = load ptr, ptr %cleanup.heap.slot.5
  call void @free(ptr %cleanup.heap.ptr.10)
  %cleanup.heap.ptr.11 = load ptr, ptr %cleanup.heap.slot.19
  call void @free(ptr %cleanup.heap.ptr.11)
  %cleanup.heap.ptr.12 = load ptr, ptr %cleanup.heap.slot.31
  call void @free(ptr %cleanup.heap.ptr.12)
  %cleanup.heap.ptr.13 = load ptr, ptr %cleanup.heap.slot.42
  call void @free(ptr %cleanup.heap.ptr.13)
  %cleanup.heap.ptr.14 = load ptr, ptr %cleanup.heap.slot.45
  call void @free(ptr %cleanup.heap.ptr.14)
  %cleanup.heap.ptr.15 = load ptr, ptr %cleanup.heap.slot.52
  call void @free(ptr %cleanup.heap.ptr.15)
  %cleanup.heap.ptr.16 = load ptr, ptr %cleanup.heap.slot.62
  call void @free(ptr %cleanup.heap.ptr.16)
  %cleanup.heap.ptr.17 = load ptr, ptr %cleanup.heap.slot.68
  call void @free(ptr %cleanup.heap.ptr.17)
  ret void
}

define void @"kira_native_impl_447"(i64 %arg0, i64 %arg1, i64 %arg2) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.RenderEncoder
  store %t.RenderEncoder zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.RenderPipeline
  store %t.RenderPipeline zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %local2 = alloca i64
  %local.storage.2 = alloca %t.GraphicsBuffer
  store %t.GraphicsBuffer zeroinitializer, ptr %local.storage.2
  %local.storage.int.2 = ptrtoint ptr %local.storage.2 to i64
  store i64 %local.storage.int.2, ptr %local2
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.1 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.1
  %cleanup.heap.slot.2 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.2
  %cleanup.heap.slot.3 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.3
  %cleanup.heap.slot.4 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.4
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  store i64 %arg2, ptr %local2
  %r0 = load i64, ptr %local0
  %r1 = load i64, ptr %local1
  %rt.args.0 = alloca [2 x %kira.bridge.value]
  %rt.slot.0.0 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.0, i64 0, i64 0
  %rt.pack.0.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.0.0.1 = insertvalue %kira.bridge.value %rt.pack.0.0.0, i64 %r0, 2
  store %kira.bridge.value %rt.pack.0.0.1, ptr %rt.slot.0.0
  %rt.slot.0.1 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.0, i64 0, i64 1
  %rt.pack.0.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.0.1.1 = insertvalue %kira.bridge.value %rt.pack.0.1.0, i64 %r1, 2
  store %kira.bridge.value %rt.pack.0.1.1, ptr %rt.slot.0.1
  %rt.result.0 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 431, ptr %rt.args.0, i32 2, ptr %rt.result.0)
  %r2 = load i64, ptr %local0
  %r3 = load i64, ptr %local2
  %rt.args.1 = alloca [2 x %kira.bridge.value]
  %rt.slot.1.0 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.1, i64 0, i64 0
  %rt.pack.1.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.1.0.1 = insertvalue %kira.bridge.value %rt.pack.1.0.0, i64 %r2, 2
  store %kira.bridge.value %rt.pack.1.0.1, ptr %rt.slot.1.0
  %rt.slot.1.1 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.1, i64 0, i64 1
  %rt.pack.1.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.1.1.1 = insertvalue %kira.bridge.value %rt.pack.1.1.0, i64 %r3, 2
  store %kira.bridge.value %rt.pack.1.1.1, ptr %rt.slot.1.1
  %rt.result.1 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 432, ptr %rt.args.1, i32 2, ptr %rt.result.1)
  %r4 = load i64, ptr %local0
  %r5 = add i64 0, 3
  %rt.args.2 = alloca [2 x %kira.bridge.value]
  %rt.slot.2.0 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.2, i64 0, i64 0
  %rt.pack.2.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.2.0.1 = insertvalue %kira.bridge.value %rt.pack.2.0.0, i64 %r4, 2
  store %kira.bridge.value %rt.pack.2.0.1, ptr %rt.slot.2.0
  %rt.slot.2.1 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.2, i64 0, i64 1
  %rt.pack.2.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %rt.pack.2.1.1 = insertvalue %kira.bridge.value %rt.pack.2.1.0, i64 %r5, 2
  store %kira.bridge.value %rt.pack.2.1.1, ptr %rt.slot.2.1
  %rt.result.2 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 435, ptr %rt.args.2, i32 2, ptr %rt.result.2)
  ret void
}

define void @"kira_native_impl_446"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.GraphicsFrame
  store %t.GraphicsFrame zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local2 = alloca i64
  %local.storage.2 = alloca %t.RenderPassDescriptor
  store %t.RenderPassDescriptor zeroinitializer, ptr %local.storage.2
  %local.storage.int.2 = ptrtoint ptr %local.storage.2 to i64
  store i64 %local.storage.int.2, ptr %local2
  %local3 = alloca i64
  %local.storage.3 = alloca %t.RenderPipeline
  store %t.RenderPipeline zeroinitializer, ptr %local.storage.3
  %local.storage.int.3 = ptrtoint ptr %local.storage.3 to i64
  store i64 %local.storage.int.3, ptr %local3
  %local4 = alloca i64
  %local.storage.4 = alloca %t.GraphicsBuffer
  store %t.GraphicsBuffer zeroinitializer, ptr %local.storage.4
  %local.storage.int.4 = ptrtoint ptr %local.storage.4 to i64
  store i64 %local.storage.int.4, ptr %local4
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.4 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.4
  %cleanup.heap.slot.5 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.5
  %cleanup.heap.slot.7 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.7
  %cleanup.heap.slot.8 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.8
  %cleanup.heap.slot.10 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.10
  %cleanup.heap.slot.11 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.11
  %cleanup.heap.slot.12 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.12
  %cleanup.heap.slot.13 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.13
  %cleanup.heap.slot.15 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.15
  %cleanup.heap.slot.16 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.16
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.1, i32 0, i32 43
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.rawptr.2 = load ptr, ptr %load.ptr.2
  %r2 = ptrtoint ptr %load.rawptr.2 to i64
  %native.recover.state.3 = inttoptr i64 %r2 to ptr
  %native.recover.payload.3 = call ptr @"kira_native_state_recover"(ptr %native.recover.state.3, i64 8814238373109695030)
  %r3 = ptrtoint ptr %native.recover.payload.3 to i64
  store i64 %r3, ptr %local1
  %rt.result.0 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 2, ptr null, i32 0, ptr %rt.result.0)
  %rt.result.load.0 = load %kira.bridge.value, ptr %rt.result.0
  %r4 = extractvalue %kira.bridge.value %rt.result.load.0, 2
  %r5 = load i64, ptr %local2
  %copy.dst.5 = inttoptr i64 %r5 to ptr
  %copy.src.4 = inttoptr i64 %r4 to ptr
  %copy.val.5 = load %t.RenderPassDescriptor, ptr %copy.src.4
  store %t.RenderPassDescriptor %copy.val.5, ptr %copy.dst.5
  %r6 = load i64, ptr %local1
  %native.state.get.ptr.7 = inttoptr i64 %r6 to ptr
  %native.state.get.slot.7 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.7, i64 1
  %native.state.get.val.1 = load %kira.bridge.value, ptr %native.state.get.slot.7
  %r7 = extractvalue %kira.bridge.value %native.state.get.val.1, 2
  %r8 = load i64, ptr %local3
  %copy.dst.8 = inttoptr i64 %r8 to ptr
  %copy.src.7 = inttoptr i64 %r7 to ptr
  %copy.val.8 = load %t.RenderPipeline, ptr %copy.src.7
  store %t.RenderPipeline %copy.val.8, ptr %copy.dst.8
  %r9 = load i64, ptr %local1
  %native.state.get.ptr.10 = inttoptr i64 %r9 to ptr
  %native.state.get.slot.10 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.10, i64 2
  %native.state.get.val.2 = load %kira.bridge.value, ptr %native.state.get.slot.10
  %r10 = extractvalue %kira.bridge.value %native.state.get.val.2, 2
  %r11 = load i64, ptr %local4
  %copy.dst.11 = inttoptr i64 %r11 to ptr
  %copy.src.10 = inttoptr i64 %r10 to ptr
  %copy.val.11 = load %t.GraphicsBuffer, ptr %copy.src.10
  store %t.GraphicsBuffer %copy.val.11, ptr %copy.dst.11
  %r12 = load i64, ptr %local0
  %r13 = load i64, ptr %local2
  %r15 = load i64, ptr %local3
  %r16 = load i64, ptr %local4
  %closure.size.ptr.14 = getelementptr [2 x %kira.bridge.value], ptr null, i32 1
  %closure.captures.size.14 = ptrtoint ptr %closure.size.ptr.14 to i64
  %closure.size.14 = add i64 16, %closure.captures.size.14
  %closure.ptr.14 = call ptr @malloc(i64 %closure.size.14)
  store i64 447, ptr %closure.ptr.14
  %closure.count.ptr.14 = getelementptr inbounds i64, ptr %closure.ptr.14, i64 1
  store i64 2, ptr %closure.count.ptr.14
  %closure.slots.14 = getelementptr inbounds i8, ptr %closure.ptr.14, i64 16
  %closure.slot.14.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots.14, i64 0
  %closure.pack.14.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %closure.pack.14.0 = insertvalue %kira.bridge.value %closure.pack.14.0.0, i64 %r15, 2
  store %kira.bridge.value %closure.pack.14.0, ptr %closure.slot.14.0
  %closure.slot.14.1 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots.14, i64 1
  %closure.pack.14.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %closure.pack.14.1 = insertvalue %kira.bridge.value %closure.pack.14.1.0, i64 %r16, 2
  store %kira.bridge.value %closure.pack.14.1, ptr %closure.slot.14.1
  %closure.raw.14 = ptrtoint ptr %closure.ptr.14 to i64
  %r14 = or i64 %closure.raw.14, -9223372036854775808
  %rt.args.3 = alloca [3 x %kira.bridge.value]
  %rt.slot.3.0 = getelementptr inbounds [3 x %kira.bridge.value], ptr %rt.args.3, i64 0, i64 0
  %rt.pack.3.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.3.0.1 = insertvalue %kira.bridge.value %rt.pack.3.0.0, i64 %r12, 2
  store %kira.bridge.value %rt.pack.3.0.1, ptr %rt.slot.3.0
  %rt.slot.3.1 = getelementptr inbounds [3 x %kira.bridge.value], ptr %rt.args.3, i64 0, i64 1
  %rt.pack.3.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.3.1.1 = insertvalue %kira.bridge.value %rt.pack.3.1.0, i64 %r13, 2
  store %kira.bridge.value %rt.pack.3.1.1, ptr %rt.slot.3.1
  %rt.slot.3.2 = getelementptr inbounds [3 x %kira.bridge.value], ptr %rt.args.3, i64 0, i64 2
  %rt.pack.3.2.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.3.2.1 = insertvalue %kira.bridge.value %rt.pack.3.2.0, i64 %r14, 2
  store %kira.bridge.value %rt.pack.3.2.1, ptr %rt.slot.3.2
  %rt.result.3 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 408, ptr %rt.args.3, i32 3, ptr %rt.result.3)
  ret void
}

define void @"kira_native_impl_448"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.4 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.4
  %cleanup.heap.slot.6 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.6
  %cleanup.heap.slot.7 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.7
  %cleanup.heap.slot.9 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.9
  %cleanup.heap.slot.10 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.10
  %cleanup.heap.slot.12 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.12
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
  %native.state.get.slot.6 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.6, i64 2
  %native.state.get.val.0 = load %kira.bridge.value, ptr %native.state.get.slot.6
  %r6 = extractvalue %kira.bridge.value %native.state.get.val.0, 2
  %rt.args.1 = alloca [2 x %kira.bridge.value]
  %rt.slot.1.0 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.1, i64 0, i64 0
  %rt.pack.1.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.1.0.1 = insertvalue %kira.bridge.value %rt.pack.1.0.0, i64 %r4, 2
  store %kira.bridge.value %rt.pack.1.0.1, ptr %rt.slot.1.0
  %rt.slot.1.1 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.1, i64 0, i64 1
  %rt.pack.1.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.1.1.1 = insertvalue %kira.bridge.value %rt.pack.1.1.0, i64 %r6, 2
  store %kira.bridge.value %rt.pack.1.1.1, ptr %rt.slot.1.1
  %rt.result.1 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 420, ptr %rt.args.1, i32 2, ptr %rt.result.1)
  %r7 = load i64, ptr %local0
  %r8 = load i64, ptr %local1
  %native.state.get.ptr.9 = inttoptr i64 %r8 to ptr
  %native.state.get.slot.9 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.9, i64 1
  %native.state.get.val.2 = load %kira.bridge.value, ptr %native.state.get.slot.9
  %r9 = extractvalue %kira.bridge.value %native.state.get.val.2, 2
  %rt.args.3 = alloca [2 x %kira.bridge.value]
  %rt.slot.3.0 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.3, i64 0, i64 0
  %rt.pack.3.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.3.0.1 = insertvalue %kira.bridge.value %rt.pack.3.0.0, i64 %r7, 2
  store %kira.bridge.value %rt.pack.3.0.1, ptr %rt.slot.3.0
  %rt.slot.3.1 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.3, i64 0, i64 1
  %rt.pack.3.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.3.1.1 = insertvalue %kira.bridge.value %rt.pack.3.1.0, i64 %r9, 2
  store %kira.bridge.value %rt.pack.3.1.1, ptr %rt.slot.3.1
  %rt.result.3 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 417, ptr %rt.args.3, i32 2, ptr %rt.result.3)
  %r10 = load i64, ptr %local0
  %r11 = load i64, ptr %local1
  %native.state.get.ptr.12 = inttoptr i64 %r11 to ptr
  %native.state.get.slot.12 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.12, i64 0
  %native.state.get.val.4 = load %kira.bridge.value, ptr %native.state.get.slot.12
  %r12 = extractvalue %kira.bridge.value %native.state.get.val.4, 2
  %rt.args.5 = alloca [2 x %kira.bridge.value]
  %rt.slot.5.0 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.5, i64 0, i64 0
  %rt.pack.5.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.5.0.1 = insertvalue %kira.bridge.value %rt.pack.5.0.0, i64 %r10, 2
  store %kira.bridge.value %rt.pack.5.0.1, ptr %rt.slot.5.0
  %rt.slot.5.1 = getelementptr inbounds [2 x %kira.bridge.value], ptr %rt.args.5, i64 0, i64 1
  %rt.pack.5.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %rt.pack.5.1.1 = insertvalue %kira.bridge.value %rt.pack.5.1.0, i64 %r12, 2
  store %kira.bridge.value %rt.pack.5.1.1, ptr %rt.slot.5.1
  %rt.result.5 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 414, ptr %rt.args.5, i32 2, ptr %rt.result.5)
  ret void
}

define void @"kira_callable_dispatch_739b41e868b5845f"(i64 %function_id, i64 %arg0) {
entry:
  %dispatch.is_direct = icmp ule i64 %function_id, 4294967295
  br i1 %dispatch.is_direct, label %dispatch.direct, label %dispatch.closure
dispatch.direct:
  switch i64 %function_id, label %dispatch.default [
    i64 4, label %dispatch.case.0
    i64 6, label %dispatch.case.1
    i64 445, label %dispatch.case.2
    i64 448, label %dispatch.case.3
  ]
dispatch.case.0:
  %dispatch.rt.args.0 = alloca [1 x %kira.bridge.value]
  %dispatch.rt.slot.0.0 = getelementptr inbounds [1 x %kira.bridge.value], ptr %dispatch.rt.args.0, i64 0, i64 0
  %dispatch.rt.pack.0.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %dispatch.rt.pack.0.0.1 = insertvalue %kira.bridge.value %dispatch.rt.pack.0.0.0, i64 %arg0, 2
  store %kira.bridge.value %dispatch.rt.pack.0.0.1, ptr %dispatch.rt.slot.0.0
  %dispatch.rt.result.0 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 4, ptr %dispatch.rt.args.0, i32 1, ptr %dispatch.rt.result.0)
  ret void
dispatch.case.1:
  %dispatch.rt.args.1 = alloca [1 x %kira.bridge.value]
  %dispatch.rt.slot.1.0 = getelementptr inbounds [1 x %kira.bridge.value], ptr %dispatch.rt.args.1, i64 0, i64 0
  %dispatch.rt.pack.1.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %dispatch.rt.pack.1.0.1 = insertvalue %kira.bridge.value %dispatch.rt.pack.1.0.0, i64 %arg0, 2
  store %kira.bridge.value %dispatch.rt.pack.1.0.1, ptr %dispatch.rt.slot.1.0
  %dispatch.rt.result.1 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 6, ptr %dispatch.rt.args.1, i32 1, ptr %dispatch.rt.result.1)
  ret void
dispatch.case.2:
  call void @"kira_native_impl_445"(i64 %arg0)
  ret void
dispatch.case.3:
  call void @"kira_native_impl_448"(i64 %arg0)
  ret void
dispatch.closure:
  %closure.raw = and i64 %function_id, 9223372036854775807
  %closure.ptr = inttoptr i64 %closure.raw to ptr
  %closure.id = load i64, ptr %closure.ptr
  %closure.slots = getelementptr inbounds i8, ptr %closure.ptr, i64 16
  switch i64 %closure.id, label %dispatch.default [
    i64 414, label %dispatch.closure.case.0
    i64 416, label %dispatch.closure.case.1
    i64 417, label %dispatch.closure.case.2
    i64 420, label %dispatch.closure.case.3
    i64 422, label %dispatch.closure.case.4
    i64 423, label %dispatch.closure.case.5
    i64 426, label %dispatch.closure.case.6
    i64 428, label %dispatch.closure.case.7
  ]
dispatch.closure.case.0:
  %closure.slot.0.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.0.0 = load %kira.bridge.value, ptr %closure.slot.0.0
  %closure.arg.0.0 = extractvalue %kira.bridge.value %closure.value.0.0, 2
  %closure.rt.args.0 = alloca [2 x %kira.bridge.value]
  %closure.rt.slot.0.0 = getelementptr inbounds [2 x %kira.bridge.value], ptr %closure.rt.args.0, i64 0, i64 0
  %closure.rt.pack.0.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %closure.rt.pack.0.0.1 = insertvalue %kira.bridge.value %closure.rt.pack.0.0.0, i64 %arg0, 2
  store %kira.bridge.value %closure.rt.pack.0.0.1, ptr %closure.rt.slot.0.0
  %closure.rt.slot.0.1 = getelementptr inbounds [2 x %kira.bridge.value], ptr %closure.rt.args.0, i64 0, i64 1
  store %kira.bridge.value %closure.value.0.0, ptr %closure.rt.slot.0.1
  %closure.rt.result.0 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 414, ptr %closure.rt.args.0, i32 2, ptr %closure.rt.result.0)
  ret void
dispatch.closure.case.1:
  %closure.slot.1.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.1.0 = load %kira.bridge.value, ptr %closure.slot.1.0
  %closure.arg.1.0 = extractvalue %kira.bridge.value %closure.value.1.0, 2
  %closure.rt.args.1 = alloca [2 x %kira.bridge.value]
  %closure.rt.slot.1.0 = getelementptr inbounds [2 x %kira.bridge.value], ptr %closure.rt.args.1, i64 0, i64 0
  %closure.rt.pack.1.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %closure.rt.pack.1.0.1 = insertvalue %kira.bridge.value %closure.rt.pack.1.0.0, i64 %arg0, 2
  store %kira.bridge.value %closure.rt.pack.1.0.1, ptr %closure.rt.slot.1.0
  %closure.rt.slot.1.1 = getelementptr inbounds [2 x %kira.bridge.value], ptr %closure.rt.args.1, i64 0, i64 1
  store %kira.bridge.value %closure.value.1.0, ptr %closure.rt.slot.1.1
  %closure.rt.result.1 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 416, ptr %closure.rt.args.1, i32 2, ptr %closure.rt.result.1)
  ret void
dispatch.closure.case.2:
  %closure.slot.2.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.2.0 = load %kira.bridge.value, ptr %closure.slot.2.0
  %closure.arg.2.0 = extractvalue %kira.bridge.value %closure.value.2.0, 2
  %closure.rt.args.2 = alloca [2 x %kira.bridge.value]
  %closure.rt.slot.2.0 = getelementptr inbounds [2 x %kira.bridge.value], ptr %closure.rt.args.2, i64 0, i64 0
  %closure.rt.pack.2.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %closure.rt.pack.2.0.1 = insertvalue %kira.bridge.value %closure.rt.pack.2.0.0, i64 %arg0, 2
  store %kira.bridge.value %closure.rt.pack.2.0.1, ptr %closure.rt.slot.2.0
  %closure.rt.slot.2.1 = getelementptr inbounds [2 x %kira.bridge.value], ptr %closure.rt.args.2, i64 0, i64 1
  store %kira.bridge.value %closure.value.2.0, ptr %closure.rt.slot.2.1
  %closure.rt.result.2 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 417, ptr %closure.rt.args.2, i32 2, ptr %closure.rt.result.2)
  ret void
dispatch.closure.case.3:
  %closure.slot.3.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.3.0 = load %kira.bridge.value, ptr %closure.slot.3.0
  %closure.arg.3.0 = extractvalue %kira.bridge.value %closure.value.3.0, 2
  %closure.rt.args.3 = alloca [2 x %kira.bridge.value]
  %closure.rt.slot.3.0 = getelementptr inbounds [2 x %kira.bridge.value], ptr %closure.rt.args.3, i64 0, i64 0
  %closure.rt.pack.3.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %closure.rt.pack.3.0.1 = insertvalue %kira.bridge.value %closure.rt.pack.3.0.0, i64 %arg0, 2
  store %kira.bridge.value %closure.rt.pack.3.0.1, ptr %closure.rt.slot.3.0
  %closure.rt.slot.3.1 = getelementptr inbounds [2 x %kira.bridge.value], ptr %closure.rt.args.3, i64 0, i64 1
  store %kira.bridge.value %closure.value.3.0, ptr %closure.rt.slot.3.1
  %closure.rt.result.3 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 420, ptr %closure.rt.args.3, i32 2, ptr %closure.rt.result.3)
  ret void
dispatch.closure.case.4:
  %closure.slot.4.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.4.0 = load %kira.bridge.value, ptr %closure.slot.4.0
  %closure.arg.4.0 = extractvalue %kira.bridge.value %closure.value.4.0, 2
  %closure.slot.4.1 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 1
  %closure.value.4.1 = load %kira.bridge.value, ptr %closure.slot.4.1
  %closure.arg.4.1 = extractvalue %kira.bridge.value %closure.value.4.1, 2
  %closure.rt.args.4 = alloca [3 x %kira.bridge.value]
  %closure.rt.slot.4.0 = getelementptr inbounds [3 x %kira.bridge.value], ptr %closure.rt.args.4, i64 0, i64 0
  %closure.rt.pack.4.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %closure.rt.pack.4.0.1 = insertvalue %kira.bridge.value %closure.rt.pack.4.0.0, i64 %arg0, 2
  store %kira.bridge.value %closure.rt.pack.4.0.1, ptr %closure.rt.slot.4.0
  %closure.rt.slot.4.1 = getelementptr inbounds [3 x %kira.bridge.value], ptr %closure.rt.args.4, i64 0, i64 1
  store %kira.bridge.value %closure.value.4.0, ptr %closure.rt.slot.4.1
  %closure.rt.slot.4.2 = getelementptr inbounds [3 x %kira.bridge.value], ptr %closure.rt.args.4, i64 0, i64 2
  store %kira.bridge.value %closure.value.4.1, ptr %closure.rt.slot.4.2
  %closure.rt.result.4 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 422, ptr %closure.rt.args.4, i32 3, ptr %closure.rt.result.4)
  ret void
dispatch.closure.case.5:
  %closure.slot.5.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.5.0 = load %kira.bridge.value, ptr %closure.slot.5.0
  %closure.arg.5.0 = extractvalue %kira.bridge.value %closure.value.5.0, 2
  %closure.rt.args.5 = alloca [2 x %kira.bridge.value]
  %closure.rt.slot.5.0 = getelementptr inbounds [2 x %kira.bridge.value], ptr %closure.rt.args.5, i64 0, i64 0
  %closure.rt.pack.5.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %closure.rt.pack.5.0.1 = insertvalue %kira.bridge.value %closure.rt.pack.5.0.0, i64 %arg0, 2
  store %kira.bridge.value %closure.rt.pack.5.0.1, ptr %closure.rt.slot.5.0
  %closure.rt.slot.5.1 = getelementptr inbounds [2 x %kira.bridge.value], ptr %closure.rt.args.5, i64 0, i64 1
  store %kira.bridge.value %closure.value.5.0, ptr %closure.rt.slot.5.1
  %closure.rt.result.5 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 423, ptr %closure.rt.args.5, i32 2, ptr %closure.rt.result.5)
  ret void
dispatch.closure.case.6:
  %closure.slot.6.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.6.0 = load %kira.bridge.value, ptr %closure.slot.6.0
  %closure.arg.6.0 = extractvalue %kira.bridge.value %closure.value.6.0, 2
  %closure.rt.args.6 = alloca [2 x %kira.bridge.value]
  %closure.rt.slot.6.0 = getelementptr inbounds [2 x %kira.bridge.value], ptr %closure.rt.args.6, i64 0, i64 0
  %closure.rt.pack.6.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %closure.rt.pack.6.0.1 = insertvalue %kira.bridge.value %closure.rt.pack.6.0.0, i64 %arg0, 2
  store %kira.bridge.value %closure.rt.pack.6.0.1, ptr %closure.rt.slot.6.0
  %closure.rt.slot.6.1 = getelementptr inbounds [2 x %kira.bridge.value], ptr %closure.rt.args.6, i64 0, i64 1
  store %kira.bridge.value %closure.value.6.0, ptr %closure.rt.slot.6.1
  %closure.rt.result.6 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 426, ptr %closure.rt.args.6, i32 2, ptr %closure.rt.result.6)
  ret void
dispatch.closure.case.7:
  %closure.slot.7.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.7.0 = load %kira.bridge.value, ptr %closure.slot.7.0
  %closure.arg.7.0 = extractvalue %kira.bridge.value %closure.value.7.0, 2
  %closure.rt.args.7 = alloca [2 x %kira.bridge.value]
  %closure.rt.slot.7.0 = getelementptr inbounds [2 x %kira.bridge.value], ptr %closure.rt.args.7, i64 0, i64 0
  %closure.rt.pack.7.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %closure.rt.pack.7.0.1 = insertvalue %kira.bridge.value %closure.rt.pack.7.0.0, i64 %arg0, 2
  store %kira.bridge.value %closure.rt.pack.7.0.1, ptr %closure.rt.slot.7.0
  %closure.rt.slot.7.1 = getelementptr inbounds [2 x %kira.bridge.value], ptr %closure.rt.args.7, i64 0, i64 1
  store %kira.bridge.value %closure.value.7.0, ptr %closure.rt.slot.7.1
  %closure.rt.result.7 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 428, ptr %closure.rt.args.7, i32 2, ptr %closure.rt.result.7)
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
    i64 5, label %dispatch.case.0
    i64 64, label %dispatch.case.1
    i64 79, label %dispatch.case.2
    i64 407, label %dispatch.case.3
    i64 411, label %dispatch.case.4
    i64 446, label %dispatch.case.5
  ]
dispatch.case.0:
  %dispatch.rt.args.0 = alloca [1 x %kira.bridge.value]
  %dispatch.rt.slot.0.0 = getelementptr inbounds [1 x %kira.bridge.value], ptr %dispatch.rt.args.0, i64 0, i64 0
  %dispatch.rt.pack.0.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %dispatch.rt.pack.0.0.1 = insertvalue %kira.bridge.value %dispatch.rt.pack.0.0.0, i64 %arg0, 2
  store %kira.bridge.value %dispatch.rt.pack.0.0.1, ptr %dispatch.rt.slot.0.0
  %dispatch.rt.result.0 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 5, ptr %dispatch.rt.args.0, i32 1, ptr %dispatch.rt.result.0)
  ret void
dispatch.case.1:
  %dispatch.rt.args.1 = alloca [1 x %kira.bridge.value]
  %dispatch.rt.slot.1.0 = getelementptr inbounds [1 x %kira.bridge.value], ptr %dispatch.rt.args.1, i64 0, i64 0
  %dispatch.rt.pack.1.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %dispatch.rt.pack.1.0.1 = insertvalue %kira.bridge.value %dispatch.rt.pack.1.0.0, i64 %arg0, 2
  store %kira.bridge.value %dispatch.rt.pack.1.0.1, ptr %dispatch.rt.slot.1.0
  %dispatch.rt.result.1 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 64, ptr %dispatch.rt.args.1, i32 1, ptr %dispatch.rt.result.1)
  ret void
dispatch.case.2:
  %dispatch.rt.args.2 = alloca [1 x %kira.bridge.value]
  %dispatch.rt.slot.2.0 = getelementptr inbounds [1 x %kira.bridge.value], ptr %dispatch.rt.args.2, i64 0, i64 0
  %dispatch.rt.pack.2.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %dispatch.rt.pack.2.0.1 = insertvalue %kira.bridge.value %dispatch.rt.pack.2.0.0, i64 %arg0, 2
  store %kira.bridge.value %dispatch.rt.pack.2.0.1, ptr %dispatch.rt.slot.2.0
  %dispatch.rt.result.2 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 79, ptr %dispatch.rt.args.2, i32 1, ptr %dispatch.rt.result.2)
  ret void
dispatch.case.3:
  %dispatch.rt.args.3 = alloca [1 x %kira.bridge.value]
  %dispatch.rt.slot.3.0 = getelementptr inbounds [1 x %kira.bridge.value], ptr %dispatch.rt.args.3, i64 0, i64 0
  %dispatch.rt.pack.3.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %dispatch.rt.pack.3.0.1 = insertvalue %kira.bridge.value %dispatch.rt.pack.3.0.0, i64 %arg0, 2
  store %kira.bridge.value %dispatch.rt.pack.3.0.1, ptr %dispatch.rt.slot.3.0
  %dispatch.rt.result.3 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 407, ptr %dispatch.rt.args.3, i32 1, ptr %dispatch.rt.result.3)
  ret void
dispatch.case.4:
  %dispatch.rt.args.4 = alloca [1 x %kira.bridge.value]
  %dispatch.rt.slot.4.0 = getelementptr inbounds [1 x %kira.bridge.value], ptr %dispatch.rt.args.4, i64 0, i64 0
  %dispatch.rt.pack.4.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %dispatch.rt.pack.4.0.1 = insertvalue %kira.bridge.value %dispatch.rt.pack.4.0.0, i64 %arg0, 2
  store %kira.bridge.value %dispatch.rt.pack.4.0.1, ptr %dispatch.rt.slot.4.0
  %dispatch.rt.result.4 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 411, ptr %dispatch.rt.args.4, i32 1, ptr %dispatch.rt.result.4)
  ret void
dispatch.case.5:
  call void @"kira_native_impl_446"(i64 %arg0)
  ret void
dispatch.closure:
  %closure.raw = and i64 %function_id, 9223372036854775807
  %closure.ptr = inttoptr i64 %closure.raw to ptr
  %closure.id = load i64, ptr %closure.ptr
  %closure.slots = getelementptr inbounds i8, ptr %closure.ptr, i64 16
  switch i64 %closure.id, label %dispatch.default [
    i64 408, label %dispatch.closure.case.0
    i64 410, label %dispatch.closure.case.1
  ]
dispatch.closure.case.0:
  %closure.slot.0.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.0.0 = load %kira.bridge.value, ptr %closure.slot.0.0
  %closure.arg.0.0 = extractvalue %kira.bridge.value %closure.value.0.0, 2
  %closure.slot.0.1 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 1
  %closure.value.0.1 = load %kira.bridge.value, ptr %closure.slot.0.1
  %closure.arg.0.1 = extractvalue %kira.bridge.value %closure.value.0.1, 2
  %closure.rt.args.0 = alloca [3 x %kira.bridge.value]
  %closure.rt.slot.0.0 = getelementptr inbounds [3 x %kira.bridge.value], ptr %closure.rt.args.0, i64 0, i64 0
  %closure.rt.pack.0.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %closure.rt.pack.0.0.1 = insertvalue %kira.bridge.value %closure.rt.pack.0.0.0, i64 %arg0, 2
  store %kira.bridge.value %closure.rt.pack.0.0.1, ptr %closure.rt.slot.0.0
  %closure.rt.slot.0.1 = getelementptr inbounds [3 x %kira.bridge.value], ptr %closure.rt.args.0, i64 0, i64 1
  store %kira.bridge.value %closure.value.0.0, ptr %closure.rt.slot.0.1
  %closure.rt.slot.0.2 = getelementptr inbounds [3 x %kira.bridge.value], ptr %closure.rt.args.0, i64 0, i64 2
  store %kira.bridge.value %closure.value.0.1, ptr %closure.rt.slot.0.2
  %closure.rt.result.0 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 408, ptr %closure.rt.args.0, i32 3, ptr %closure.rt.result.0)
  ret void
dispatch.closure.case.1:
  %closure.slot.1.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.1.0 = load %kira.bridge.value, ptr %closure.slot.1.0
  %closure.arg.1.0 = extractvalue %kira.bridge.value %closure.value.1.0, 2
  %closure.slot.1.1 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 1
  %closure.value.1.1 = load %kira.bridge.value, ptr %closure.slot.1.1
  %closure.arg.1.1 = extractvalue %kira.bridge.value %closure.value.1.1, 2
  %closure.rt.args.1 = alloca [3 x %kira.bridge.value]
  %closure.rt.slot.1.0 = getelementptr inbounds [3 x %kira.bridge.value], ptr %closure.rt.args.1, i64 0, i64 0
  %closure.rt.pack.1.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %closure.rt.pack.1.0.1 = insertvalue %kira.bridge.value %closure.rt.pack.1.0.0, i64 %arg0, 2
  store %kira.bridge.value %closure.rt.pack.1.0.1, ptr %closure.rt.slot.1.0
  %closure.rt.slot.1.1 = getelementptr inbounds [3 x %kira.bridge.value], ptr %closure.rt.args.1, i64 0, i64 1
  store %kira.bridge.value %closure.value.1.0, ptr %closure.rt.slot.1.1
  %closure.rt.slot.1.2 = getelementptr inbounds [3 x %kira.bridge.value], ptr %closure.rt.args.1, i64 0, i64 2
  store %kira.bridge.value %closure.value.1.1, ptr %closure.rt.slot.1.2
  %closure.rt.result.1 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 410, ptr %closure.rt.args.1, i32 3, ptr %closure.rt.result.1)
  ret void
dispatch.default:
  unreachable
}

define void @"kira_callable_dispatch_45bbf038adba07d0"(i64 %function_id, i64 %arg0) {
entry:
  %dispatch.is_direct = icmp ule i64 %function_id, 4294967295
  br i1 %dispatch.is_direct, label %dispatch.direct, label %dispatch.closure
dispatch.direct:
  switch i64 %function_id, label %dispatch.default [
    i64 440, label %dispatch.case.0
  ]
dispatch.case.0:
  %dispatch.rt.args.0 = alloca [1 x %kira.bridge.value]
  %dispatch.rt.slot.0.0 = getelementptr inbounds [1 x %kira.bridge.value], ptr %dispatch.rt.args.0, i64 0, i64 0
  %dispatch.rt.pack.0.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %dispatch.rt.pack.0.0.1 = insertvalue %kira.bridge.value %dispatch.rt.pack.0.0.0, i64 %arg0, 2
  store %kira.bridge.value %dispatch.rt.pack.0.0.1, ptr %dispatch.rt.slot.0.0
  %dispatch.rt.result.0 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 440, ptr %dispatch.rt.args.0, i32 1, ptr %dispatch.rt.result.0)
  ret void
dispatch.closure:
  %closure.raw = and i64 %function_id, 9223372036854775807
  %closure.ptr = inttoptr i64 %closure.raw to ptr
  %closure.id = load i64, ptr %closure.ptr
  %closure.slots = getelementptr inbounds i8, ptr %closure.ptr, i64 16
  switch i64 %closure.id, label %dispatch.default [
    i64 431, label %dispatch.closure.case.0
    i64 432, label %dispatch.closure.case.1
    i64 433, label %dispatch.closure.case.2
    i64 434, label %dispatch.closure.case.3
    i64 435, label %dispatch.closure.case.4
    i64 436, label %dispatch.closure.case.5
    i64 437, label %dispatch.closure.case.6
    i64 438, label %dispatch.closure.case.7
    i64 439, label %dispatch.closure.case.8
    i64 441, label %dispatch.closure.case.9
    i64 442, label %dispatch.closure.case.10
    i64 443, label %dispatch.closure.case.11
    i64 444, label %dispatch.closure.case.12
    i64 447, label %dispatch.closure.case.13
  ]
dispatch.closure.case.0:
  %closure.slot.0.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.0.0 = load %kira.bridge.value, ptr %closure.slot.0.0
  %closure.arg.0.0 = extractvalue %kira.bridge.value %closure.value.0.0, 2
  %closure.rt.args.0 = alloca [2 x %kira.bridge.value]
  %closure.rt.slot.0.0 = getelementptr inbounds [2 x %kira.bridge.value], ptr %closure.rt.args.0, i64 0, i64 0
  %closure.rt.pack.0.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %closure.rt.pack.0.0.1 = insertvalue %kira.bridge.value %closure.rt.pack.0.0.0, i64 %arg0, 2
  store %kira.bridge.value %closure.rt.pack.0.0.1, ptr %closure.rt.slot.0.0
  %closure.rt.slot.0.1 = getelementptr inbounds [2 x %kira.bridge.value], ptr %closure.rt.args.0, i64 0, i64 1
  store %kira.bridge.value %closure.value.0.0, ptr %closure.rt.slot.0.1
  %closure.rt.result.0 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 431, ptr %closure.rt.args.0, i32 2, ptr %closure.rt.result.0)
  ret void
dispatch.closure.case.1:
  %closure.slot.1.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.1.0 = load %kira.bridge.value, ptr %closure.slot.1.0
  %closure.arg.1.0 = extractvalue %kira.bridge.value %closure.value.1.0, 2
  %closure.rt.args.1 = alloca [2 x %kira.bridge.value]
  %closure.rt.slot.1.0 = getelementptr inbounds [2 x %kira.bridge.value], ptr %closure.rt.args.1, i64 0, i64 0
  %closure.rt.pack.1.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %closure.rt.pack.1.0.1 = insertvalue %kira.bridge.value %closure.rt.pack.1.0.0, i64 %arg0, 2
  store %kira.bridge.value %closure.rt.pack.1.0.1, ptr %closure.rt.slot.1.0
  %closure.rt.slot.1.1 = getelementptr inbounds [2 x %kira.bridge.value], ptr %closure.rt.args.1, i64 0, i64 1
  store %kira.bridge.value %closure.value.1.0, ptr %closure.rt.slot.1.1
  %closure.rt.result.1 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 432, ptr %closure.rt.args.1, i32 2, ptr %closure.rt.result.1)
  ret void
dispatch.closure.case.2:
  %closure.slot.2.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.2.0 = load %kira.bridge.value, ptr %closure.slot.2.0
  %closure.arg.2.0 = extractvalue %kira.bridge.value %closure.value.2.0, 2
  %closure.slot.2.1 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 1
  %closure.value.2.1 = load %kira.bridge.value, ptr %closure.slot.2.1
  %closure.arg.2.1 = extractvalue %kira.bridge.value %closure.value.2.1, 2
  %closure.rt.args.2 = alloca [3 x %kira.bridge.value]
  %closure.rt.slot.2.0 = getelementptr inbounds [3 x %kira.bridge.value], ptr %closure.rt.args.2, i64 0, i64 0
  %closure.rt.pack.2.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %closure.rt.pack.2.0.1 = insertvalue %kira.bridge.value %closure.rt.pack.2.0.0, i64 %arg0, 2
  store %kira.bridge.value %closure.rt.pack.2.0.1, ptr %closure.rt.slot.2.0
  %closure.rt.slot.2.1 = getelementptr inbounds [3 x %kira.bridge.value], ptr %closure.rt.args.2, i64 0, i64 1
  store %kira.bridge.value %closure.value.2.0, ptr %closure.rt.slot.2.1
  %closure.rt.slot.2.2 = getelementptr inbounds [3 x %kira.bridge.value], ptr %closure.rt.args.2, i64 0, i64 2
  store %kira.bridge.value %closure.value.2.1, ptr %closure.rt.slot.2.2
  %closure.rt.result.2 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 433, ptr %closure.rt.args.2, i32 3, ptr %closure.rt.result.2)
  ret void
dispatch.closure.case.3:
  %closure.slot.3.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.3.0 = load %kira.bridge.value, ptr %closure.slot.3.0
  %closure.arg.3.0 = extractvalue %kira.bridge.value %closure.value.3.0, 2
  %closure.slot.3.1 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 1
  %closure.value.3.1 = load %kira.bridge.value, ptr %closure.slot.3.1
  %closure.arg.3.1 = extractvalue %kira.bridge.value %closure.value.3.1, 2
  %closure.rt.args.3 = alloca [3 x %kira.bridge.value]
  %closure.rt.slot.3.0 = getelementptr inbounds [3 x %kira.bridge.value], ptr %closure.rt.args.3, i64 0, i64 0
  %closure.rt.pack.3.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %closure.rt.pack.3.0.1 = insertvalue %kira.bridge.value %closure.rt.pack.3.0.0, i64 %arg0, 2
  store %kira.bridge.value %closure.rt.pack.3.0.1, ptr %closure.rt.slot.3.0
  %closure.rt.slot.3.1 = getelementptr inbounds [3 x %kira.bridge.value], ptr %closure.rt.args.3, i64 0, i64 1
  store %kira.bridge.value %closure.value.3.0, ptr %closure.rt.slot.3.1
  %closure.rt.slot.3.2 = getelementptr inbounds [3 x %kira.bridge.value], ptr %closure.rt.args.3, i64 0, i64 2
  store %kira.bridge.value %closure.value.3.1, ptr %closure.rt.slot.3.2
  %closure.rt.result.3 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 434, ptr %closure.rt.args.3, i32 3, ptr %closure.rt.result.3)
  ret void
dispatch.closure.case.4:
  %closure.slot.4.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.4.0 = load %kira.bridge.value, ptr %closure.slot.4.0
  %closure.arg.4.0 = extractvalue %kira.bridge.value %closure.value.4.0, 2
  %closure.rt.args.4 = alloca [2 x %kira.bridge.value]
  %closure.rt.slot.4.0 = getelementptr inbounds [2 x %kira.bridge.value], ptr %closure.rt.args.4, i64 0, i64 0
  %closure.rt.pack.4.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %closure.rt.pack.4.0.1 = insertvalue %kira.bridge.value %closure.rt.pack.4.0.0, i64 %arg0, 2
  store %kira.bridge.value %closure.rt.pack.4.0.1, ptr %closure.rt.slot.4.0
  %closure.rt.slot.4.1 = getelementptr inbounds [2 x %kira.bridge.value], ptr %closure.rt.args.4, i64 0, i64 1
  store %kira.bridge.value %closure.value.4.0, ptr %closure.rt.slot.4.1
  %closure.rt.result.4 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 435, ptr %closure.rt.args.4, i32 2, ptr %closure.rt.result.4)
  ret void
dispatch.closure.case.5:
  %closure.slot.5.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.5.0 = load %kira.bridge.value, ptr %closure.slot.5.0
  %closure.arg.5.0 = extractvalue %kira.bridge.value %closure.value.5.0, 2
  %closure.rt.args.5 = alloca [2 x %kira.bridge.value]
  %closure.rt.slot.5.0 = getelementptr inbounds [2 x %kira.bridge.value], ptr %closure.rt.args.5, i64 0, i64 0
  %closure.rt.pack.5.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %closure.rt.pack.5.0.1 = insertvalue %kira.bridge.value %closure.rt.pack.5.0.0, i64 %arg0, 2
  store %kira.bridge.value %closure.rt.pack.5.0.1, ptr %closure.rt.slot.5.0
  %closure.rt.slot.5.1 = getelementptr inbounds [2 x %kira.bridge.value], ptr %closure.rt.args.5, i64 0, i64 1
  store %kira.bridge.value %closure.value.5.0, ptr %closure.rt.slot.5.1
  %closure.rt.result.5 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 436, ptr %closure.rt.args.5, i32 2, ptr %closure.rt.result.5)
  ret void
dispatch.closure.case.6:
  %closure.slot.6.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.6.0 = load %kira.bridge.value, ptr %closure.slot.6.0
  %closure.arg.6.0 = extractvalue %kira.bridge.value %closure.value.6.0, 2
  %closure.slot.6.1 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 1
  %closure.value.6.1 = load %kira.bridge.value, ptr %closure.slot.6.1
  %closure.arg.6.1 = extractvalue %kira.bridge.value %closure.value.6.1, 2
  %closure.rt.args.6 = alloca [3 x %kira.bridge.value]
  %closure.rt.slot.6.0 = getelementptr inbounds [3 x %kira.bridge.value], ptr %closure.rt.args.6, i64 0, i64 0
  %closure.rt.pack.6.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %closure.rt.pack.6.0.1 = insertvalue %kira.bridge.value %closure.rt.pack.6.0.0, i64 %arg0, 2
  store %kira.bridge.value %closure.rt.pack.6.0.1, ptr %closure.rt.slot.6.0
  %closure.rt.slot.6.1 = getelementptr inbounds [3 x %kira.bridge.value], ptr %closure.rt.args.6, i64 0, i64 1
  store %kira.bridge.value %closure.value.6.0, ptr %closure.rt.slot.6.1
  %closure.rt.slot.6.2 = getelementptr inbounds [3 x %kira.bridge.value], ptr %closure.rt.args.6, i64 0, i64 2
  store %kira.bridge.value %closure.value.6.1, ptr %closure.rt.slot.6.2
  %closure.rt.result.6 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 437, ptr %closure.rt.args.6, i32 3, ptr %closure.rt.result.6)
  ret void
dispatch.closure.case.7:
  %closure.slot.7.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.7.0 = load %kira.bridge.value, ptr %closure.slot.7.0
  %closure.arg.7.0 = extractvalue %kira.bridge.value %closure.value.7.0, 2
  %closure.slot.7.1 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 1
  %closure.value.7.1 = load %kira.bridge.value, ptr %closure.slot.7.1
  %closure.arg.7.1 = extractvalue %kira.bridge.value %closure.value.7.1, 2
  %closure.rt.args.7 = alloca [3 x %kira.bridge.value]
  %closure.rt.slot.7.0 = getelementptr inbounds [3 x %kira.bridge.value], ptr %closure.rt.args.7, i64 0, i64 0
  %closure.rt.pack.7.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %closure.rt.pack.7.0.1 = insertvalue %kira.bridge.value %closure.rt.pack.7.0.0, i64 %arg0, 2
  store %kira.bridge.value %closure.rt.pack.7.0.1, ptr %closure.rt.slot.7.0
  %closure.rt.slot.7.1 = getelementptr inbounds [3 x %kira.bridge.value], ptr %closure.rt.args.7, i64 0, i64 1
  store %kira.bridge.value %closure.value.7.0, ptr %closure.rt.slot.7.1
  %closure.rt.slot.7.2 = getelementptr inbounds [3 x %kira.bridge.value], ptr %closure.rt.args.7, i64 0, i64 2
  store %kira.bridge.value %closure.value.7.1, ptr %closure.rt.slot.7.2
  %closure.rt.result.7 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 438, ptr %closure.rt.args.7, i32 3, ptr %closure.rt.result.7)
  ret void
dispatch.closure.case.8:
  %closure.slot.8.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.8.0 = load %kira.bridge.value, ptr %closure.slot.8.0
  %closure.arg.8.0 = extractvalue %kira.bridge.value %closure.value.8.0, 2
  %closure.slot.8.1 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 1
  %closure.value.8.1 = load %kira.bridge.value, ptr %closure.slot.8.1
  %closure.bits.8.1 = extractvalue %kira.bridge.value %closure.value.8.1, 2
  %closure.arg.8.1 = bitcast i64 %closure.bits.8.1 to double
  %closure.rt.args.8 = alloca [3 x %kira.bridge.value]
  %closure.rt.slot.8.0 = getelementptr inbounds [3 x %kira.bridge.value], ptr %closure.rt.args.8, i64 0, i64 0
  %closure.rt.pack.8.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %closure.rt.pack.8.0.1 = insertvalue %kira.bridge.value %closure.rt.pack.8.0.0, i64 %arg0, 2
  store %kira.bridge.value %closure.rt.pack.8.0.1, ptr %closure.rt.slot.8.0
  %closure.rt.slot.8.1 = getelementptr inbounds [3 x %kira.bridge.value], ptr %closure.rt.args.8, i64 0, i64 1
  store %kira.bridge.value %closure.value.8.0, ptr %closure.rt.slot.8.1
  %closure.rt.slot.8.2 = getelementptr inbounds [3 x %kira.bridge.value], ptr %closure.rt.args.8, i64 0, i64 2
  store %kira.bridge.value %closure.value.8.1, ptr %closure.rt.slot.8.2
  %closure.rt.result.8 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 439, ptr %closure.rt.args.8, i32 3, ptr %closure.rt.result.8)
  ret void
dispatch.closure.case.9:
  %closure.slot.9.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.9.0 = load %kira.bridge.value, ptr %closure.slot.9.0
  %closure.arg.9.0 = extractvalue %kira.bridge.value %closure.value.9.0, 2
  %closure.slot.9.1 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 1
  %closure.value.9.1 = load %kira.bridge.value, ptr %closure.slot.9.1
  %closure.arg.9.1 = extractvalue %kira.bridge.value %closure.value.9.1, 2
  %closure.slot.9.2 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 2
  %closure.value.9.2 = load %kira.bridge.value, ptr %closure.slot.9.2
  %closure.arg.9.2 = extractvalue %kira.bridge.value %closure.value.9.2, 2
  %closure.slot.9.3 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 3
  %closure.value.9.3 = load %kira.bridge.value, ptr %closure.slot.9.3
  %closure.bits.9.3 = extractvalue %kira.bridge.value %closure.value.9.3, 2
  %closure.arg.9.3 = bitcast i64 %closure.bits.9.3 to double
  %closure.slot.9.4 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 4
  %closure.value.9.4 = load %kira.bridge.value, ptr %closure.slot.9.4
  %closure.bits.9.4 = extractvalue %kira.bridge.value %closure.value.9.4, 2
  %closure.arg.9.4 = bitcast i64 %closure.bits.9.4 to double
  %closure.rt.args.9 = alloca [6 x %kira.bridge.value]
  %closure.rt.slot.9.0 = getelementptr inbounds [6 x %kira.bridge.value], ptr %closure.rt.args.9, i64 0, i64 0
  %closure.rt.pack.9.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %closure.rt.pack.9.0.1 = insertvalue %kira.bridge.value %closure.rt.pack.9.0.0, i64 %arg0, 2
  store %kira.bridge.value %closure.rt.pack.9.0.1, ptr %closure.rt.slot.9.0
  %closure.rt.slot.9.1 = getelementptr inbounds [6 x %kira.bridge.value], ptr %closure.rt.args.9, i64 0, i64 1
  store %kira.bridge.value %closure.value.9.0, ptr %closure.rt.slot.9.1
  %closure.rt.slot.9.2 = getelementptr inbounds [6 x %kira.bridge.value], ptr %closure.rt.args.9, i64 0, i64 2
  store %kira.bridge.value %closure.value.9.1, ptr %closure.rt.slot.9.2
  %closure.rt.slot.9.3 = getelementptr inbounds [6 x %kira.bridge.value], ptr %closure.rt.args.9, i64 0, i64 3
  store %kira.bridge.value %closure.value.9.2, ptr %closure.rt.slot.9.3
  %closure.rt.slot.9.4 = getelementptr inbounds [6 x %kira.bridge.value], ptr %closure.rt.args.9, i64 0, i64 4
  store %kira.bridge.value %closure.value.9.3, ptr %closure.rt.slot.9.4
  %closure.rt.slot.9.5 = getelementptr inbounds [6 x %kira.bridge.value], ptr %closure.rt.args.9, i64 0, i64 5
  store %kira.bridge.value %closure.value.9.4, ptr %closure.rt.slot.9.5
  %closure.rt.result.9 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 441, ptr %closure.rt.args.9, i32 6, ptr %closure.rt.result.9)
  ret void
dispatch.closure.case.10:
  %closure.slot.10.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.10.0 = load %kira.bridge.value, ptr %closure.slot.10.0
  %closure.arg.10.0 = extractvalue %kira.bridge.value %closure.value.10.0, 2
  %closure.slot.10.1 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 1
  %closure.value.10.1 = load %kira.bridge.value, ptr %closure.slot.10.1
  %closure.arg.10.1 = extractvalue %kira.bridge.value %closure.value.10.1, 2
  %closure.slot.10.2 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 2
  %closure.value.10.2 = load %kira.bridge.value, ptr %closure.slot.10.2
  %closure.arg.10.2 = extractvalue %kira.bridge.value %closure.value.10.2, 2
  %closure.slot.10.3 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 3
  %closure.value.10.3 = load %kira.bridge.value, ptr %closure.slot.10.3
  %closure.bits.10.3 = extractvalue %kira.bridge.value %closure.value.10.3, 2
  %closure.arg.10.3 = bitcast i64 %closure.bits.10.3 to double
  %closure.slot.10.4 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 4
  %closure.value.10.4 = load %kira.bridge.value, ptr %closure.slot.10.4
  %closure.bits.10.4 = extractvalue %kira.bridge.value %closure.value.10.4, 2
  %closure.arg.10.4 = bitcast i64 %closure.bits.10.4 to double
  %closure.rt.args.10 = alloca [6 x %kira.bridge.value]
  %closure.rt.slot.10.0 = getelementptr inbounds [6 x %kira.bridge.value], ptr %closure.rt.args.10, i64 0, i64 0
  %closure.rt.pack.10.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %closure.rt.pack.10.0.1 = insertvalue %kira.bridge.value %closure.rt.pack.10.0.0, i64 %arg0, 2
  store %kira.bridge.value %closure.rt.pack.10.0.1, ptr %closure.rt.slot.10.0
  %closure.rt.slot.10.1 = getelementptr inbounds [6 x %kira.bridge.value], ptr %closure.rt.args.10, i64 0, i64 1
  store %kira.bridge.value %closure.value.10.0, ptr %closure.rt.slot.10.1
  %closure.rt.slot.10.2 = getelementptr inbounds [6 x %kira.bridge.value], ptr %closure.rt.args.10, i64 0, i64 2
  store %kira.bridge.value %closure.value.10.1, ptr %closure.rt.slot.10.2
  %closure.rt.slot.10.3 = getelementptr inbounds [6 x %kira.bridge.value], ptr %closure.rt.args.10, i64 0, i64 3
  store %kira.bridge.value %closure.value.10.2, ptr %closure.rt.slot.10.3
  %closure.rt.slot.10.4 = getelementptr inbounds [6 x %kira.bridge.value], ptr %closure.rt.args.10, i64 0, i64 4
  store %kira.bridge.value %closure.value.10.3, ptr %closure.rt.slot.10.4
  %closure.rt.slot.10.5 = getelementptr inbounds [6 x %kira.bridge.value], ptr %closure.rt.args.10, i64 0, i64 5
  store %kira.bridge.value %closure.value.10.4, ptr %closure.rt.slot.10.5
  %closure.rt.result.10 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 442, ptr %closure.rt.args.10, i32 6, ptr %closure.rt.result.10)
  ret void
dispatch.closure.case.11:
  %closure.slot.11.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.11.0 = load %kira.bridge.value, ptr %closure.slot.11.0
  %closure.arg.11.0 = extractvalue %kira.bridge.value %closure.value.11.0, 2
  %closure.slot.11.1 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 1
  %closure.value.11.1 = load %kira.bridge.value, ptr %closure.slot.11.1
  %closure.ptrint.11.1 = extractvalue %kira.bridge.value %closure.value.11.1, 2
  %closure.len.11.1 = extractvalue %kira.bridge.value %closure.value.11.1, 3
  %closure.ptr.cast.11.1 = inttoptr i64 %closure.ptrint.11.1 to ptr
  %closure.arg.11.1.0 = insertvalue %kira.string zeroinitializer, ptr %closure.ptr.cast.11.1, 0
  %closure.arg.11.1 = insertvalue %kira.string %closure.arg.11.1.0, i64 %closure.len.11.1, 1
  %closure.slot.11.2 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 2
  %closure.value.11.2 = load %kira.bridge.value, ptr %closure.slot.11.2
  %closure.arg.11.2 = extractvalue %kira.bridge.value %closure.value.11.2, 2
  %closure.slot.11.3 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 3
  %closure.value.11.3 = load %kira.bridge.value, ptr %closure.slot.11.3
  %closure.bits.11.3 = extractvalue %kira.bridge.value %closure.value.11.3, 2
  %closure.arg.11.3 = bitcast i64 %closure.bits.11.3 to double
  %closure.rt.args.11 = alloca [5 x %kira.bridge.value]
  %closure.rt.slot.11.0 = getelementptr inbounds [5 x %kira.bridge.value], ptr %closure.rt.args.11, i64 0, i64 0
  %closure.rt.pack.11.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %closure.rt.pack.11.0.1 = insertvalue %kira.bridge.value %closure.rt.pack.11.0.0, i64 %arg0, 2
  store %kira.bridge.value %closure.rt.pack.11.0.1, ptr %closure.rt.slot.11.0
  %closure.rt.slot.11.1 = getelementptr inbounds [5 x %kira.bridge.value], ptr %closure.rt.args.11, i64 0, i64 1
  store %kira.bridge.value %closure.value.11.0, ptr %closure.rt.slot.11.1
  %closure.rt.slot.11.2 = getelementptr inbounds [5 x %kira.bridge.value], ptr %closure.rt.args.11, i64 0, i64 2
  store %kira.bridge.value %closure.value.11.1, ptr %closure.rt.slot.11.2
  %closure.rt.slot.11.3 = getelementptr inbounds [5 x %kira.bridge.value], ptr %closure.rt.args.11, i64 0, i64 3
  store %kira.bridge.value %closure.value.11.2, ptr %closure.rt.slot.11.3
  %closure.rt.slot.11.4 = getelementptr inbounds [5 x %kira.bridge.value], ptr %closure.rt.args.11, i64 0, i64 4
  store %kira.bridge.value %closure.value.11.3, ptr %closure.rt.slot.11.4
  %closure.rt.result.11 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 443, ptr %closure.rt.args.11, i32 5, ptr %closure.rt.result.11)
  ret void
dispatch.closure.case.12:
  %closure.slot.12.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.12.0 = load %kira.bridge.value, ptr %closure.slot.12.0
  %closure.arg.12.0 = extractvalue %kira.bridge.value %closure.value.12.0, 2
  %closure.slot.12.1 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 1
  %closure.value.12.1 = load %kira.bridge.value, ptr %closure.slot.12.1
  %closure.arg.12.1 = extractvalue %kira.bridge.value %closure.value.12.1, 2
  %closure.slot.12.2 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 2
  %closure.value.12.2 = load %kira.bridge.value, ptr %closure.slot.12.2
  %closure.bits.12.2 = extractvalue %kira.bridge.value %closure.value.12.2, 2
  %closure.arg.12.2 = bitcast i64 %closure.bits.12.2 to double
  %closure.slot.12.3 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 3
  %closure.value.12.3 = load %kira.bridge.value, ptr %closure.slot.12.3
  %closure.bits.12.3 = extractvalue %kira.bridge.value %closure.value.12.3, 2
  %closure.arg.12.3 = bitcast i64 %closure.bits.12.3 to double
  %closure.rt.args.12 = alloca [5 x %kira.bridge.value]
  %closure.rt.slot.12.0 = getelementptr inbounds [5 x %kira.bridge.value], ptr %closure.rt.args.12, i64 0, i64 0
  %closure.rt.pack.12.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %closure.rt.pack.12.0.1 = insertvalue %kira.bridge.value %closure.rt.pack.12.0.0, i64 %arg0, 2
  store %kira.bridge.value %closure.rt.pack.12.0.1, ptr %closure.rt.slot.12.0
  %closure.rt.slot.12.1 = getelementptr inbounds [5 x %kira.bridge.value], ptr %closure.rt.args.12, i64 0, i64 1
  store %kira.bridge.value %closure.value.12.0, ptr %closure.rt.slot.12.1
  %closure.rt.slot.12.2 = getelementptr inbounds [5 x %kira.bridge.value], ptr %closure.rt.args.12, i64 0, i64 2
  store %kira.bridge.value %closure.value.12.1, ptr %closure.rt.slot.12.2
  %closure.rt.slot.12.3 = getelementptr inbounds [5 x %kira.bridge.value], ptr %closure.rt.args.12, i64 0, i64 3
  store %kira.bridge.value %closure.value.12.2, ptr %closure.rt.slot.12.3
  %closure.rt.slot.12.4 = getelementptr inbounds [5 x %kira.bridge.value], ptr %closure.rt.args.12, i64 0, i64 4
  store %kira.bridge.value %closure.value.12.3, ptr %closure.rt.slot.12.4
  %closure.rt.result.12 = alloca %kira.bridge.value
  call void @"kira_hybrid_call_runtime"(i32 444, ptr %closure.rt.args.12, i32 5, ptr %closure.rt.result.12)
  ret void
dispatch.closure.case.13:
  %closure.slot.13.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.13.0 = load %kira.bridge.value, ptr %closure.slot.13.0
  %closure.arg.13.0 = extractvalue %kira.bridge.value %closure.value.13.0, 2
  %closure.slot.13.1 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 1
  %closure.value.13.1 = load %kira.bridge.value, ptr %closure.slot.13.1
  %closure.arg.13.1 = extractvalue %kira.bridge.value %closure.value.13.1, 2
  call void @"kira_native_impl_447"(i64 %arg0, i64 %closure.arg.13.0, i64 %closure.arg.13.1)
  ret void
dispatch.default:
  unreachable
}

define void @"kira_native_fn_3"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  call void @"kira_native_impl_3"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_8"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.slot.1 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 1
  %bridge.load.1 = load %kira.bridge.value, ptr %bridge.slot.1
  %bridge.word0.1 = extractvalue %kira.bridge.value %bridge.load.1, 2
  call void @"kira_native_impl_8"(i64 %bridge.word0.0, i64 %bridge.word0.1)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_9"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  call void @"kira_native_impl_9"(i64 %bridge.word0.0)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_10"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  call void @"kira_native_impl_10"(i64 %bridge.word0.0)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_11"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  call void @"kira_native_impl_11"(i64 %bridge.word0.0)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_54"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.ptrint.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.len.0 = extractvalue %kira.bridge.value %bridge.load.0, 3
  %bridge.ptr.0 = inttoptr i64 %bridge.ptrint.0 to ptr
  %bridge.str.init.0 = insertvalue %kira.string zeroinitializer, ptr %bridge.ptr.0, 0
  %bridge.str.0 = insertvalue %kira.string %bridge.str.init.0, i64 %bridge.len.0, 1
  %bridge.slot.1 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 1
  %bridge.load.1 = load %kira.bridge.value, ptr %bridge.slot.1
  %bridge.word0.1 = extractvalue %kira.bridge.value %bridge.load.1, 2
  %bridge.slot.2 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 2
  %bridge.load.2 = load %kira.bridge.value, ptr %bridge.slot.2
  %bridge.word0.2 = extractvalue %kira.bridge.value %bridge.load.2, 2
  %bridge.slot.3 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 3
  %bridge.load.3 = load %kira.bridge.value, ptr %bridge.slot.3
  %bridge.word0.3 = extractvalue %kira.bridge.value %bridge.load.3, 2
  %bridge.call = call i64 @"kira_native_impl_54"(%kira.string %bridge.str.0, i64 %bridge.word0.1, i64 %bridge.word0.2, i64 %bridge.word0.3)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_55"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.slot.1 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 1
  %bridge.load.1 = load %kira.bridge.value, ptr %bridge.slot.1
  %bridge.word0.1 = extractvalue %kira.bridge.value %bridge.load.1, 2
  %bridge.slot.2 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 2
  %bridge.load.2 = load %kira.bridge.value, ptr %bridge.slot.2
  %bridge.word0.2 = extractvalue %kira.bridge.value %bridge.load.2, 2
  %bridge.float64.2 = bitcast i64 %bridge.word0.2 to double
  %bridge.float.2 = fadd double %bridge.float64.2, 0.0
  call void @"kira_native_impl_55"(i64 %bridge.word0.0, i64 %bridge.word0.1, double %bridge.float.2)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_56"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.call = call i64 @"kira_native_impl_56"(i64 %bridge.word0.0)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_57"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.ptrint.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.len.0 = extractvalue %kira.bridge.value %bridge.load.0, 3
  %bridge.ptr.0 = inttoptr i64 %bridge.ptrint.0 to ptr
  %bridge.str.init.0 = insertvalue %kira.string zeroinitializer, ptr %bridge.ptr.0, 0
  %bridge.str.0 = insertvalue %kira.string %bridge.str.init.0, i64 %bridge.len.0, 1
  %bridge.slot.1 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 1
  %bridge.load.1 = load %kira.bridge.value, ptr %bridge.slot.1
  %bridge.word0.1 = extractvalue %kira.bridge.value %bridge.load.1, 2
  %bridge.slot.2 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 2
  %bridge.load.2 = load %kira.bridge.value, ptr %bridge.slot.2
  %bridge.word0.2 = extractvalue %kira.bridge.value %bridge.load.2, 2
  %bridge.call = call i64 @"kira_native_impl_57"(%kira.string %bridge.str.0, i64 %bridge.word0.1, i64 %bridge.word0.2)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_58"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.slot.1 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 1
  %bridge.load.1 = load %kira.bridge.value, ptr %bridge.slot.1
  %bridge.word0.1 = extractvalue %kira.bridge.value %bridge.load.1, 2
  %bridge.slot.2 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 2
  %bridge.load.2 = load %kira.bridge.value, ptr %bridge.slot.2
  %bridge.word0.2 = extractvalue %kira.bridge.value %bridge.load.2, 2
  call void @"kira_native_impl_58"(i64 %bridge.word0.0, i64 %bridge.word0.1, i64 %bridge.word0.2)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_59"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.call = call i64 @"kira_native_impl_59"(i64 %bridge.word0.0)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_60"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  call void @"kira_native_impl_60"(i64 %bridge.word0.0)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_65"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.ptrint.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.len.0 = extractvalue %kira.bridge.value %bridge.load.0, 3
  %bridge.ptr.0 = inttoptr i64 %bridge.ptrint.0 to ptr
  %bridge.str.init.0 = insertvalue %kira.string zeroinitializer, ptr %bridge.ptr.0, 0
  %bridge.str.0 = insertvalue %kira.string %bridge.str.init.0, i64 %bridge.len.0, 1
  %bridge.slot.1 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 1
  %bridge.load.1 = load %kira.bridge.value, ptr %bridge.slot.1
  %bridge.word0.1 = extractvalue %kira.bridge.value %bridge.load.1, 2
  %bridge.slot.2 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 2
  %bridge.load.2 = load %kira.bridge.value, ptr %bridge.slot.2
  %bridge.word0.2 = extractvalue %kira.bridge.value %bridge.load.2, 2
  %bridge.slot.3 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 3
  %bridge.load.3 = load %kira.bridge.value, ptr %bridge.slot.3
  %bridge.word0.3 = extractvalue %kira.bridge.value %bridge.load.3, 2
  %bridge.slot.4 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 4
  %bridge.load.4 = load %kira.bridge.value, ptr %bridge.slot.4
  %bridge.word0.4 = extractvalue %kira.bridge.value %bridge.load.4, 2
  %bridge.slot.5 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 5
  %bridge.load.5 = load %kira.bridge.value, ptr %bridge.slot.5
  %bridge.word0.5 = extractvalue %kira.bridge.value %bridge.load.5, 2
  %bridge.slot.6 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 6
  %bridge.load.6 = load %kira.bridge.value, ptr %bridge.slot.6
  %bridge.word0.6 = extractvalue %kira.bridge.value %bridge.load.6, 2
  %bridge.slot.7 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 7
  %bridge.load.7 = load %kira.bridge.value, ptr %bridge.slot.7
  %bridge.word0.7 = extractvalue %kira.bridge.value %bridge.load.7, 2
  %bridge.float64.7 = bitcast i64 %bridge.word0.7 to double
  %bridge.float.7 = fadd double %bridge.float64.7, 0.0
  %bridge.slot.8 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 8
  %bridge.load.8 = load %kira.bridge.value, ptr %bridge.slot.8
  %bridge.word0.8 = extractvalue %kira.bridge.value %bridge.load.8, 2
  %bridge.float64.8 = bitcast i64 %bridge.word0.8 to double
  %bridge.float.8 = fadd double %bridge.float64.8, 0.0
  %bridge.slot.9 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 9
  %bridge.load.9 = load %kira.bridge.value, ptr %bridge.slot.9
  %bridge.word0.9 = extractvalue %kira.bridge.value %bridge.load.9, 2
  %bridge.float64.9 = bitcast i64 %bridge.word0.9 to double
  %bridge.float.9 = fadd double %bridge.float64.9, 0.0
  %bridge.slot.10 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 10
  %bridge.load.10 = load %kira.bridge.value, ptr %bridge.slot.10
  %bridge.word0.10 = extractvalue %kira.bridge.value %bridge.load.10, 2
  %bridge.float64.10 = bitcast i64 %bridge.word0.10 to double
  %bridge.float.10 = fadd double %bridge.float64.10, 0.0
  %bridge.slot.11 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 11
  %bridge.load.11 = load %kira.bridge.value, ptr %bridge.slot.11
  %bridge.word0.11 = extractvalue %kira.bridge.value %bridge.load.11, 2
  %bridge.slot.12 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 12
  %bridge.load.12 = load %kira.bridge.value, ptr %bridge.slot.12
  %bridge.word0.12 = extractvalue %kira.bridge.value %bridge.load.12, 2
  %bridge.slot.13 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 13
  %bridge.load.13 = load %kira.bridge.value, ptr %bridge.slot.13
  %bridge.word0.13 = extractvalue %kira.bridge.value %bridge.load.13, 2
  %bridge.slot.14 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 14
  %bridge.load.14 = load %kira.bridge.value, ptr %bridge.slot.14
  %bridge.word0.14 = extractvalue %kira.bridge.value %bridge.load.14, 2
  %bridge.slot.15 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 15
  %bridge.load.15 = load %kira.bridge.value, ptr %bridge.slot.15
  %bridge.word0.15 = extractvalue %kira.bridge.value %bridge.load.15, 2
  %bridge.slot.16 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 16
  %bridge.load.16 = load %kira.bridge.value, ptr %bridge.slot.16
  %bridge.word0.16 = extractvalue %kira.bridge.value %bridge.load.16, 2
  %bridge.slot.17 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 17
  %bridge.load.17 = load %kira.bridge.value, ptr %bridge.slot.17
  %bridge.word0.17 = extractvalue %kira.bridge.value %bridge.load.17, 2
  %bridge.slot.18 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 18
  %bridge.load.18 = load %kira.bridge.value, ptr %bridge.slot.18
  %bridge.word0.18 = extractvalue %kira.bridge.value %bridge.load.18, 2
  %bridge.slot.19 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 19
  %bridge.load.19 = load %kira.bridge.value, ptr %bridge.slot.19
  %bridge.word0.19 = extractvalue %kira.bridge.value %bridge.load.19, 2
  %bridge.float64.19 = bitcast i64 %bridge.word0.19 to double
  %bridge.float.19 = fadd double %bridge.float64.19, 0.0
  %bridge.slot.20 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 20
  %bridge.load.20 = load %kira.bridge.value, ptr %bridge.slot.20
  %bridge.word0.20 = extractvalue %kira.bridge.value %bridge.load.20, 2
  %bridge.slot.21 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 21
  %bridge.load.21 = load %kira.bridge.value, ptr %bridge.slot.21
  %bridge.word0.21 = extractvalue %kira.bridge.value %bridge.load.21, 2
  %bridge.slot.22 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 22
  %bridge.load.22 = load %kira.bridge.value, ptr %bridge.slot.22
  %bridge.word0.22 = extractvalue %kira.bridge.value %bridge.load.22, 2
  %bridge.slot.23 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 23
  %bridge.load.23 = load %kira.bridge.value, ptr %bridge.slot.23
  %bridge.word0.23 = extractvalue %kira.bridge.value %bridge.load.23, 2
  %bridge.slot.24 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 24
  %bridge.load.24 = load %kira.bridge.value, ptr %bridge.slot.24
  %bridge.word0.24 = extractvalue %kira.bridge.value %bridge.load.24, 2
  %bridge.slot.25 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 25
  %bridge.load.25 = load %kira.bridge.value, ptr %bridge.slot.25
  %bridge.word0.25 = extractvalue %kira.bridge.value %bridge.load.25, 2
  %bridge.slot.26 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 26
  %bridge.load.26 = load %kira.bridge.value, ptr %bridge.slot.26
  %bridge.word0.26 = extractvalue %kira.bridge.value %bridge.load.26, 2
  %bridge.call = call i1 @"kira_native_impl_65"(%kira.string %bridge.str.0, i64 %bridge.word0.1, i64 %bridge.word0.2, i64 %bridge.word0.3, i64 %bridge.word0.4, i64 %bridge.word0.5, i64 %bridge.word0.6, double %bridge.float.7, double %bridge.float.8, double %bridge.float.9, double %bridge.float.10, i64 %bridge.word0.11, i64 %bridge.word0.12, i64 %bridge.word0.13, i64 %bridge.word0.14, i64 %bridge.word0.15, i64 %bridge.word0.16, i64 %bridge.word0.17, i64 %bridge.word0.18, double %bridge.float.19, i64 %bridge.word0.20, i64 %bridge.word0.21, i64 %bridge.word0.22, i64 %bridge.word0.23, i64 %bridge.word0.24, i64 %bridge.word0.25, i64 %bridge.word0.26)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 4, 0
  %bridge.ret.bool = zext i1 %bridge.call to i64
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.ret.bool, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_66"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.slot.1 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 1
  %bridge.load.1 = load %kira.bridge.value, ptr %bridge.slot.1
  %bridge.word0.1 = extractvalue %kira.bridge.value %bridge.load.1, 2
  %bridge.slot.2 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 2
  %bridge.load.2 = load %kira.bridge.value, ptr %bridge.slot.2
  %bridge.word0.2 = extractvalue %kira.bridge.value %bridge.load.2, 2
  %bridge.slot.3 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 3
  %bridge.load.3 = load %kira.bridge.value, ptr %bridge.slot.3
  %bridge.word0.3 = extractvalue %kira.bridge.value %bridge.load.3, 2
  %bridge.slot.4 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 4
  %bridge.load.4 = load %kira.bridge.value, ptr %bridge.slot.4
  %bridge.word0.4 = extractvalue %kira.bridge.value %bridge.load.4, 2
  %bridge.slot.5 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 5
  %bridge.load.5 = load %kira.bridge.value, ptr %bridge.slot.5
  %bridge.word0.5 = extractvalue %kira.bridge.value %bridge.load.5, 2
  %bridge.slot.6 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 6
  %bridge.load.6 = load %kira.bridge.value, ptr %bridge.slot.6
  %bridge.word0.6 = extractvalue %kira.bridge.value %bridge.load.6, 2
  %bridge.slot.7 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 7
  %bridge.load.7 = load %kira.bridge.value, ptr %bridge.slot.7
  %bridge.word0.7 = extractvalue %kira.bridge.value %bridge.load.7, 2
  %bridge.slot.8 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 8
  %bridge.load.8 = load %kira.bridge.value, ptr %bridge.slot.8
  %bridge.word0.8 = extractvalue %kira.bridge.value %bridge.load.8, 2
  %bridge.slot.9 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 9
  %bridge.load.9 = load %kira.bridge.value, ptr %bridge.slot.9
  %bridge.word0.9 = extractvalue %kira.bridge.value %bridge.load.9, 2
  %bridge.slot.10 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 10
  %bridge.load.10 = load %kira.bridge.value, ptr %bridge.slot.10
  %bridge.word0.10 = extractvalue %kira.bridge.value %bridge.load.10, 2
  %bridge.slot.11 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 11
  %bridge.load.11 = load %kira.bridge.value, ptr %bridge.slot.11
  %bridge.word0.11 = extractvalue %kira.bridge.value %bridge.load.11, 2
  %bridge.slot.12 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 12
  %bridge.load.12 = load %kira.bridge.value, ptr %bridge.slot.12
  %bridge.word0.12 = extractvalue %kira.bridge.value %bridge.load.12, 2
  %bridge.slot.13 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 13
  %bridge.load.13 = load %kira.bridge.value, ptr %bridge.slot.13
  %bridge.word0.13 = extractvalue %kira.bridge.value %bridge.load.13, 2
  %bridge.slot.14 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 14
  %bridge.load.14 = load %kira.bridge.value, ptr %bridge.slot.14
  %bridge.word0.14 = extractvalue %kira.bridge.value %bridge.load.14, 2
  %bridge.slot.15 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 15
  %bridge.load.15 = load %kira.bridge.value, ptr %bridge.slot.15
  %bridge.word0.15 = extractvalue %kira.bridge.value %bridge.load.15, 2
  %bridge.call = call i1 @"kira_native_impl_66"(i64 %bridge.word0.0, i64 %bridge.word0.1, i64 %bridge.word0.2, i64 %bridge.word0.3, i64 %bridge.word0.4, i64 %bridge.word0.5, i64 %bridge.word0.6, i64 %bridge.word0.7, i64 %bridge.word0.8, i64 %bridge.word0.9, i64 %bridge.word0.10, i64 %bridge.word0.11, i64 %bridge.word0.12, i64 %bridge.word0.13, i64 %bridge.word0.14, i64 %bridge.word0.15)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 4, 0
  %bridge.ret.bool = zext i1 %bridge.call to i64
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.ret.bool, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_67"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  call void @"kira_native_impl_67"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_68"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  call void @"kira_native_impl_68"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_69"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.slot.1 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 1
  %bridge.load.1 = load %kira.bridge.value, ptr %bridge.slot.1
  %bridge.word0.1 = extractvalue %kira.bridge.value %bridge.load.1, 2
  %bridge.slot.2 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 2
  %bridge.load.2 = load %kira.bridge.value, ptr %bridge.slot.2
  %bridge.word0.2 = extractvalue %kira.bridge.value %bridge.load.2, 2
  %bridge.slot.3 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 3
  %bridge.load.3 = load %kira.bridge.value, ptr %bridge.slot.3
  %bridge.word0.3 = extractvalue %kira.bridge.value %bridge.load.3, 2
  %bridge.slot.4 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 4
  %bridge.load.4 = load %kira.bridge.value, ptr %bridge.slot.4
  %bridge.word0.4 = extractvalue %kira.bridge.value %bridge.load.4, 2
  %bridge.slot.5 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 5
  %bridge.load.5 = load %kira.bridge.value, ptr %bridge.slot.5
  %bridge.word0.5 = extractvalue %kira.bridge.value %bridge.load.5, 2
  %bridge.slot.6 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 6
  %bridge.load.6 = load %kira.bridge.value, ptr %bridge.slot.6
  %bridge.word0.6 = extractvalue %kira.bridge.value %bridge.load.6, 2
  %bridge.slot.7 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 7
  %bridge.load.7 = load %kira.bridge.value, ptr %bridge.slot.7
  %bridge.word0.7 = extractvalue %kira.bridge.value %bridge.load.7, 2
  call void @"kira_native_impl_69"(i64 %bridge.word0.0, i64 %bridge.word0.1, i64 %bridge.word0.2, i64 %bridge.word0.3, i64 %bridge.word0.4, i64 %bridge.word0.5, i64 %bridge.word0.6, i64 %bridge.word0.7)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_70"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.slot.1 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 1
  %bridge.load.1 = load %kira.bridge.value, ptr %bridge.slot.1
  %bridge.ptrint.1 = extractvalue %kira.bridge.value %bridge.load.1, 2
  %bridge.len.1 = extractvalue %kira.bridge.value %bridge.load.1, 3
  %bridge.ptr.1 = inttoptr i64 %bridge.ptrint.1 to ptr
  %bridge.str.init.1 = insertvalue %kira.string zeroinitializer, ptr %bridge.ptr.1, 0
  %bridge.str.1 = insertvalue %kira.string %bridge.str.init.1, i64 %bridge.len.1, 1
  %bridge.slot.2 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 2
  %bridge.load.2 = load %kira.bridge.value, ptr %bridge.slot.2
  %bridge.word0.2 = extractvalue %kira.bridge.value %bridge.load.2, 2
  %bridge.slot.3 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 3
  %bridge.load.3 = load %kira.bridge.value, ptr %bridge.slot.3
  %bridge.word0.3 = extractvalue %kira.bridge.value %bridge.load.3, 2
  %bridge.slot.4 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 4
  %bridge.load.4 = load %kira.bridge.value, ptr %bridge.slot.4
  %bridge.word0.4 = extractvalue %kira.bridge.value %bridge.load.4, 2
  %bridge.slot.5 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 5
  %bridge.load.5 = load %kira.bridge.value, ptr %bridge.slot.5
  %bridge.word0.5 = extractvalue %kira.bridge.value %bridge.load.5, 2
  %bridge.slot.6 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 6
  %bridge.load.6 = load %kira.bridge.value, ptr %bridge.slot.6
  %bridge.word0.6 = extractvalue %kira.bridge.value %bridge.load.6, 2
  %bridge.slot.7 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 7
  %bridge.load.7 = load %kira.bridge.value, ptr %bridge.slot.7
  %bridge.word0.7 = extractvalue %kira.bridge.value %bridge.load.7, 2
  %bridge.slot.8 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 8
  %bridge.load.8 = load %kira.bridge.value, ptr %bridge.slot.8
  %bridge.word0.8 = extractvalue %kira.bridge.value %bridge.load.8, 2
  %bridge.slot.9 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 9
  %bridge.load.9 = load %kira.bridge.value, ptr %bridge.slot.9
  %bridge.word0.9 = extractvalue %kira.bridge.value %bridge.load.9, 2
  %bridge.slot.10 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 10
  %bridge.load.10 = load %kira.bridge.value, ptr %bridge.slot.10
  %bridge.word0.10 = extractvalue %kira.bridge.value %bridge.load.10, 2
  %bridge.slot.11 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 11
  %bridge.load.11 = load %kira.bridge.value, ptr %bridge.slot.11
  %bridge.word0.11 = extractvalue %kira.bridge.value %bridge.load.11, 2
  %bridge.slot.12 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 12
  %bridge.load.12 = load %kira.bridge.value, ptr %bridge.slot.12
  %bridge.word0.12 = extractvalue %kira.bridge.value %bridge.load.12, 2
  %bridge.slot.13 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 13
  %bridge.load.13 = load %kira.bridge.value, ptr %bridge.slot.13
  %bridge.word0.13 = extractvalue %kira.bridge.value %bridge.load.13, 2
  %bridge.slot.14 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 14
  %bridge.load.14 = load %kira.bridge.value, ptr %bridge.slot.14
  %bridge.word0.14 = extractvalue %kira.bridge.value %bridge.load.14, 2
  %bridge.slot.15 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 15
  %bridge.load.15 = load %kira.bridge.value, ptr %bridge.slot.15
  %bridge.word0.15 = extractvalue %kira.bridge.value %bridge.load.15, 2
  %bridge.slot.16 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 16
  %bridge.load.16 = load %kira.bridge.value, ptr %bridge.slot.16
  %bridge.word0.16 = extractvalue %kira.bridge.value %bridge.load.16, 2
  %bridge.slot.17 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 17
  %bridge.load.17 = load %kira.bridge.value, ptr %bridge.slot.17
  %bridge.word0.17 = extractvalue %kira.bridge.value %bridge.load.17, 2
  %bridge.slot.18 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 18
  %bridge.load.18 = load %kira.bridge.value, ptr %bridge.slot.18
  %bridge.word0.18 = extractvalue %kira.bridge.value %bridge.load.18, 2
  %bridge.slot.19 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 19
  %bridge.load.19 = load %kira.bridge.value, ptr %bridge.slot.19
  %bridge.word0.19 = extractvalue %kira.bridge.value %bridge.load.19, 2
  %bridge.slot.20 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 20
  %bridge.load.20 = load %kira.bridge.value, ptr %bridge.slot.20
  %bridge.word0.20 = extractvalue %kira.bridge.value %bridge.load.20, 2
  %bridge.slot.21 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 21
  %bridge.load.21 = load %kira.bridge.value, ptr %bridge.slot.21
  %bridge.word0.21 = extractvalue %kira.bridge.value %bridge.load.21, 2
  %bridge.slot.22 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 22
  %bridge.load.22 = load %kira.bridge.value, ptr %bridge.slot.22
  %bridge.word0.22 = extractvalue %kira.bridge.value %bridge.load.22, 2
  %bridge.slot.23 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 23
  %bridge.load.23 = load %kira.bridge.value, ptr %bridge.slot.23
  %bridge.word0.23 = extractvalue %kira.bridge.value %bridge.load.23, 2
  %bridge.slot.24 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 24
  %bridge.load.24 = load %kira.bridge.value, ptr %bridge.slot.24
  %bridge.word0.24 = extractvalue %kira.bridge.value %bridge.load.24, 2
  %bridge.slot.25 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 25
  %bridge.load.25 = load %kira.bridge.value, ptr %bridge.slot.25
  %bridge.word0.25 = extractvalue %kira.bridge.value %bridge.load.25, 2
  %bridge.slot.26 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 26
  %bridge.load.26 = load %kira.bridge.value, ptr %bridge.slot.26
  %bridge.word0.26 = extractvalue %kira.bridge.value %bridge.load.26, 2
  %bridge.call = call i64 @"kira_native_impl_70"(i64 %bridge.word0.0, %kira.string %bridge.str.1, i64 %bridge.word0.2, i64 %bridge.word0.3, i64 %bridge.word0.4, i64 %bridge.word0.5, i64 %bridge.word0.6, i64 %bridge.word0.7, i64 %bridge.word0.8, i64 %bridge.word0.9, i64 %bridge.word0.10, i64 %bridge.word0.11, i64 %bridge.word0.12, i64 %bridge.word0.13, i64 %bridge.word0.14, i64 %bridge.word0.15, i64 %bridge.word0.16, i64 %bridge.word0.17, i64 %bridge.word0.18, i64 %bridge.word0.19, i64 %bridge.word0.20, i64 %bridge.word0.21, i64 %bridge.word0.22, i64 %bridge.word0.23, i64 %bridge.word0.24, i64 %bridge.word0.25, i64 %bridge.word0.26)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_72"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  call void @"kira_native_impl_72"(i64 %bridge.word0.0)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_73"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.ptrint.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.len.0 = extractvalue %kira.bridge.value %bridge.load.0, 3
  %bridge.ptr.0 = inttoptr i64 %bridge.ptrint.0 to ptr
  %bridge.str.init.0 = insertvalue %kira.string zeroinitializer, ptr %bridge.ptr.0, 0
  %bridge.str.0 = insertvalue %kira.string %bridge.str.init.0, i64 %bridge.len.0, 1
  %bridge.slot.1 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 1
  %bridge.load.1 = load %kira.bridge.value, ptr %bridge.slot.1
  %bridge.ptrint.1 = extractvalue %kira.bridge.value %bridge.load.1, 2
  %bridge.len.1 = extractvalue %kira.bridge.value %bridge.load.1, 3
  %bridge.ptr.1 = inttoptr i64 %bridge.ptrint.1 to ptr
  %bridge.str.init.1 = insertvalue %kira.string zeroinitializer, ptr %bridge.ptr.1, 0
  %bridge.str.1 = insertvalue %kira.string %bridge.str.init.1, i64 %bridge.len.1, 1
  %bridge.slot.2 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 2
  %bridge.load.2 = load %kira.bridge.value, ptr %bridge.slot.2
  %bridge.ptrint.2 = extractvalue %kira.bridge.value %bridge.load.2, 2
  %bridge.len.2 = extractvalue %kira.bridge.value %bridge.load.2, 3
  %bridge.ptr.2 = inttoptr i64 %bridge.ptrint.2 to ptr
  %bridge.str.init.2 = insertvalue %kira.string zeroinitializer, ptr %bridge.ptr.2, 0
  %bridge.str.2 = insertvalue %kira.string %bridge.str.init.2, i64 %bridge.len.2, 1
  %bridge.slot.3 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 3
  %bridge.load.3 = load %kira.bridge.value, ptr %bridge.slot.3
  %bridge.ptrint.3 = extractvalue %kira.bridge.value %bridge.load.3, 2
  %bridge.len.3 = extractvalue %kira.bridge.value %bridge.load.3, 3
  %bridge.ptr.3 = inttoptr i64 %bridge.ptrint.3 to ptr
  %bridge.str.init.3 = insertvalue %kira.string zeroinitializer, ptr %bridge.ptr.3, 0
  %bridge.str.3 = insertvalue %kira.string %bridge.str.init.3, i64 %bridge.len.3, 1
  %bridge.slot.4 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 4
  %bridge.load.4 = load %kira.bridge.value, ptr %bridge.slot.4
  %bridge.ptrint.4 = extractvalue %kira.bridge.value %bridge.load.4, 2
  %bridge.len.4 = extractvalue %kira.bridge.value %bridge.load.4, 3
  %bridge.ptr.4 = inttoptr i64 %bridge.ptrint.4 to ptr
  %bridge.str.init.4 = insertvalue %kira.string zeroinitializer, ptr %bridge.ptr.4, 0
  %bridge.str.4 = insertvalue %kira.string %bridge.str.init.4, i64 %bridge.len.4, 1
  %bridge.call = call i64 @"kira_native_impl_73"(%kira.string %bridge.str.0, %kira.string %bridge.str.1, %kira.string %bridge.str.2, %kira.string %bridge.str.3, %kira.string %bridge.str.4)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_74"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.ptrint.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.len.0 = extractvalue %kira.bridge.value %bridge.load.0, 3
  %bridge.ptr.0 = inttoptr i64 %bridge.ptrint.0 to ptr
  %bridge.str.init.0 = insertvalue %kira.string zeroinitializer, ptr %bridge.ptr.0, 0
  %bridge.str.0 = insertvalue %kira.string %bridge.str.init.0, i64 %bridge.len.0, 1
  %bridge.slot.1 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 1
  %bridge.load.1 = load %kira.bridge.value, ptr %bridge.slot.1
  %bridge.ptrint.1 = extractvalue %kira.bridge.value %bridge.load.1, 2
  %bridge.len.1 = extractvalue %kira.bridge.value %bridge.load.1, 3
  %bridge.ptr.1 = inttoptr i64 %bridge.ptrint.1 to ptr
  %bridge.str.init.1 = insertvalue %kira.string zeroinitializer, ptr %bridge.ptr.1, 0
  %bridge.str.1 = insertvalue %kira.string %bridge.str.init.1, i64 %bridge.len.1, 1
  %bridge.slot.2 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 2
  %bridge.load.2 = load %kira.bridge.value, ptr %bridge.slot.2
  %bridge.ptrint.2 = extractvalue %kira.bridge.value %bridge.load.2, 2
  %bridge.len.2 = extractvalue %kira.bridge.value %bridge.load.2, 3
  %bridge.ptr.2 = inttoptr i64 %bridge.ptrint.2 to ptr
  %bridge.str.init.2 = insertvalue %kira.string zeroinitializer, ptr %bridge.ptr.2, 0
  %bridge.str.2 = insertvalue %kira.string %bridge.str.init.2, i64 %bridge.len.2, 1
  %bridge.call = call i64 @"kira_native_impl_74"(%kira.string %bridge.str.0, %kira.string %bridge.str.1, %kira.string %bridge.str.2)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_75"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  call void @"kira_native_impl_75"(i64 %bridge.word0.0)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_76"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.ptrint.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.len.0 = extractvalue %kira.bridge.value %bridge.load.0, 3
  %bridge.ptr.0 = inttoptr i64 %bridge.ptrint.0 to ptr
  %bridge.str.init.0 = insertvalue %kira.string zeroinitializer, ptr %bridge.ptr.0, 0
  %bridge.str.0 = insertvalue %kira.string %bridge.str.init.0, i64 %bridge.len.0, 1
  %bridge.slot.1 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 1
  %bridge.load.1 = load %kira.bridge.value, ptr %bridge.slot.1
  %bridge.word0.1 = extractvalue %kira.bridge.value %bridge.load.1, 2
  %bridge.slot.2 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 2
  %bridge.load.2 = load %kira.bridge.value, ptr %bridge.slot.2
  %bridge.word0.2 = extractvalue %kira.bridge.value %bridge.load.2, 2
  %bridge.slot.3 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 3
  %bridge.load.3 = load %kira.bridge.value, ptr %bridge.slot.3
  %bridge.word0.3 = extractvalue %kira.bridge.value %bridge.load.3, 2
  %bridge.slot.4 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 4
  %bridge.load.4 = load %kira.bridge.value, ptr %bridge.slot.4
  %bridge.word0.4 = extractvalue %kira.bridge.value %bridge.load.4, 2
  %bridge.slot.5 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 5
  %bridge.load.5 = load %kira.bridge.value, ptr %bridge.slot.5
  %bridge.word0.5 = extractvalue %kira.bridge.value %bridge.load.5, 2
  %bridge.slot.6 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 6
  %bridge.load.6 = load %kira.bridge.value, ptr %bridge.slot.6
  %bridge.word0.6 = extractvalue %kira.bridge.value %bridge.load.6, 2
  %bridge.call = call i64 @"kira_native_impl_76"(%kira.string %bridge.str.0, i64 %bridge.word0.1, i64 %bridge.word0.2, i64 %bridge.word0.3, i64 %bridge.word0.4, i64 %bridge.word0.5, i64 %bridge.word0.6)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_77"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  call void @"kira_native_impl_77"(i64 %bridge.word0.0)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_78"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.ptrint.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.len.0 = extractvalue %kira.bridge.value %bridge.load.0, 3
  %bridge.ptr.0 = inttoptr i64 %bridge.ptrint.0 to ptr
  %bridge.str.init.0 = insertvalue %kira.string zeroinitializer, ptr %bridge.ptr.0, 0
  %bridge.str.0 = insertvalue %kira.string %bridge.str.init.0, i64 %bridge.len.0, 1
  call void @"kira_native_impl_78"(%kira.string %bridge.str.0)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_85"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.call = call i64 @"kira_native_impl_85"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_89"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.call = call i64 @"kira_native_impl_89"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_95"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.call = call i64 @"kira_native_impl_95"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_98"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.call = call i64 @"kira_native_impl_98"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_100"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.call = call i64 @"kira_native_impl_100"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_101"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.call = call i64 @"kira_native_impl_101"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_104"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.call = call i64 @"kira_native_impl_104"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_114"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.call = call i64 @"kira_native_impl_114"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_115"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.call = call i64 @"kira_native_impl_115"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_118"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.call = call i64 @"kira_native_impl_118"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_121"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.call = call i64 @"kira_native_impl_121"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_122"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.call = call i64 @"kira_native_impl_122"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_125"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.call = call i64 @"kira_native_impl_125"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_127"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.call = call i64 @"kira_native_impl_127"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_429"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.slot.1 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 1
  %bridge.load.1 = load %kira.bridge.value, ptr %bridge.slot.1
  %bridge.word0.1 = extractvalue %kira.bridge.value %bridge.load.1, 2
  %bridge.slot.2 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 2
  %bridge.load.2 = load %kira.bridge.value, ptr %bridge.slot.2
  %bridge.ptrint.2 = extractvalue %kira.bridge.value %bridge.load.2, 2
  %bridge.len.2 = extractvalue %kira.bridge.value %bridge.load.2, 3
  %bridge.ptr.2 = inttoptr i64 %bridge.ptrint.2 to ptr
  %bridge.str.init.2 = insertvalue %kira.string zeroinitializer, ptr %bridge.ptr.2, 0
  %bridge.str.2 = insertvalue %kira.string %bridge.str.init.2, i64 %bridge.len.2, 1
  %bridge.slot.3 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 3
  %bridge.load.3 = load %kira.bridge.value, ptr %bridge.slot.3
  %bridge.ptrint.3 = extractvalue %kira.bridge.value %bridge.load.3, 2
  %bridge.len.3 = extractvalue %kira.bridge.value %bridge.load.3, 3
  %bridge.ptr.3 = inttoptr i64 %bridge.ptrint.3 to ptr
  %bridge.str.init.3 = insertvalue %kira.string zeroinitializer, ptr %bridge.ptr.3, 0
  %bridge.str.3 = insertvalue %kira.string %bridge.str.init.3, i64 %bridge.len.3, 1
  %bridge.call = call i1 @"kira_native_impl_429"(i64 %bridge.word0.0, i64 %bridge.word0.1, %kira.string %bridge.str.2, %kira.string %bridge.str.3)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 4, 0
  %bridge.ret.bool = zext i1 %bridge.call to i64
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.ret.bool, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_430"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.call = call i64 @"kira_native_impl_430"(i64 %bridge.word0.0)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_168"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.call = call i64 @"kira_native_impl_168"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_169"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.float64.0 = bitcast i64 %bridge.word0.0 to double
  %bridge.float.0 = fadd double %bridge.float64.0, 0.0
  %bridge.slot.1 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 1
  %bridge.load.1 = load %kira.bridge.value, ptr %bridge.slot.1
  %bridge.word0.1 = extractvalue %kira.bridge.value %bridge.load.1, 2
  %bridge.float64.1 = bitcast i64 %bridge.word0.1 to double
  %bridge.float.1 = fadd double %bridge.float64.1, 0.0
  %bridge.slot.2 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 2
  %bridge.load.2 = load %kira.bridge.value, ptr %bridge.slot.2
  %bridge.word0.2 = extractvalue %kira.bridge.value %bridge.load.2, 2
  %bridge.float64.2 = bitcast i64 %bridge.word0.2 to double
  %bridge.float.2 = fadd double %bridge.float64.2, 0.0
  %bridge.slot.3 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 3
  %bridge.load.3 = load %kira.bridge.value, ptr %bridge.slot.3
  %bridge.word0.3 = extractvalue %kira.bridge.value %bridge.load.3, 2
  %bridge.float64.3 = bitcast i64 %bridge.word0.3 to double
  %bridge.float.3 = fadd double %bridge.float64.3, 0.0
  %bridge.slot.4 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 4
  %bridge.load.4 = load %kira.bridge.value, ptr %bridge.slot.4
  %bridge.word0.4 = extractvalue %kira.bridge.value %bridge.load.4, 2
  %bridge.float64.4 = bitcast i64 %bridge.word0.4 to double
  %bridge.float.4 = fadd double %bridge.float64.4, 0.0
  call void @"kira_native_impl_169"(double %bridge.float.0, double %bridge.float.1, double %bridge.float.2, double %bridge.float.3, double %bridge.float.4)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_170"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  call void @"kira_native_impl_170"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_171"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.float64.0 = bitcast i64 %bridge.word0.0 to double
  %bridge.float.0 = fadd double %bridge.float64.0, 0.0
  %bridge.slot.1 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 1
  %bridge.load.1 = load %kira.bridge.value, ptr %bridge.slot.1
  %bridge.word0.1 = extractvalue %kira.bridge.value %bridge.load.1, 2
  %bridge.float64.1 = bitcast i64 %bridge.word0.1 to double
  %bridge.float.1 = fadd double %bridge.float64.1, 0.0
  %bridge.slot.2 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 2
  %bridge.load.2 = load %kira.bridge.value, ptr %bridge.slot.2
  %bridge.word0.2 = extractvalue %kira.bridge.value %bridge.load.2, 2
  %bridge.float64.2 = bitcast i64 %bridge.word0.2 to double
  %bridge.float.2 = fadd double %bridge.float64.2, 0.0
  %bridge.slot.3 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 3
  %bridge.load.3 = load %kira.bridge.value, ptr %bridge.slot.3
  %bridge.word0.3 = extractvalue %kira.bridge.value %bridge.load.3, 2
  %bridge.float64.3 = bitcast i64 %bridge.word0.3 to double
  %bridge.float.3 = fadd double %bridge.float64.3, 0.0
  %bridge.slot.4 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 4
  %bridge.load.4 = load %kira.bridge.value, ptr %bridge.slot.4
  %bridge.word0.4 = extractvalue %kira.bridge.value %bridge.load.4, 2
  %bridge.float64.4 = bitcast i64 %bridge.word0.4 to double
  %bridge.float.4 = fadd double %bridge.float64.4, 0.0
  %bridge.slot.5 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 5
  %bridge.load.5 = load %kira.bridge.value, ptr %bridge.slot.5
  %bridge.word0.5 = extractvalue %kira.bridge.value %bridge.load.5, 2
  %bridge.float64.5 = bitcast i64 %bridge.word0.5 to double
  %bridge.float.5 = fadd double %bridge.float64.5, 0.0
  %bridge.slot.6 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 6
  %bridge.load.6 = load %kira.bridge.value, ptr %bridge.slot.6
  %bridge.word0.6 = extractvalue %kira.bridge.value %bridge.load.6, 2
  %bridge.float64.6 = bitcast i64 %bridge.word0.6 to double
  %bridge.float.6 = fadd double %bridge.float64.6, 0.0
  %bridge.slot.7 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 7
  %bridge.load.7 = load %kira.bridge.value, ptr %bridge.slot.7
  %bridge.word0.7 = extractvalue %kira.bridge.value %bridge.load.7, 2
  %bridge.float64.7 = bitcast i64 %bridge.word0.7 to double
  %bridge.float.7 = fadd double %bridge.float64.7, 0.0
  %bridge.slot.8 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 8
  %bridge.load.8 = load %kira.bridge.value, ptr %bridge.slot.8
  %bridge.word0.8 = extractvalue %kira.bridge.value %bridge.load.8, 2
  %bridge.float64.8 = bitcast i64 %bridge.word0.8 to double
  %bridge.float.8 = fadd double %bridge.float64.8, 0.0
  %bridge.slot.9 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 9
  %bridge.load.9 = load %kira.bridge.value, ptr %bridge.slot.9
  %bridge.word0.9 = extractvalue %kira.bridge.value %bridge.load.9, 2
  %bridge.float64.9 = bitcast i64 %bridge.word0.9 to double
  %bridge.float.9 = fadd double %bridge.float64.9, 0.0
  %bridge.slot.10 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 10
  %bridge.load.10 = load %kira.bridge.value, ptr %bridge.slot.10
  %bridge.word0.10 = extractvalue %kira.bridge.value %bridge.load.10, 2
  %bridge.float64.10 = bitcast i64 %bridge.word0.10 to double
  %bridge.float.10 = fadd double %bridge.float64.10, 0.0
  %bridge.slot.11 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 11
  %bridge.load.11 = load %kira.bridge.value, ptr %bridge.slot.11
  %bridge.word0.11 = extractvalue %kira.bridge.value %bridge.load.11, 2
  %bridge.float64.11 = bitcast i64 %bridge.word0.11 to double
  %bridge.float.11 = fadd double %bridge.float64.11, 0.0
  %bridge.slot.12 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 12
  %bridge.load.12 = load %kira.bridge.value, ptr %bridge.slot.12
  %bridge.word0.12 = extractvalue %kira.bridge.value %bridge.load.12, 2
  %bridge.float64.12 = bitcast i64 %bridge.word0.12 to double
  %bridge.float.12 = fadd double %bridge.float64.12, 0.0
  %bridge.slot.13 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 13
  %bridge.load.13 = load %kira.bridge.value, ptr %bridge.slot.13
  %bridge.word0.13 = extractvalue %kira.bridge.value %bridge.load.13, 2
  %bridge.float64.13 = bitcast i64 %bridge.word0.13 to double
  %bridge.float.13 = fadd double %bridge.float64.13, 0.0
  call void @"kira_native_impl_171"(double %bridge.float.0, double %bridge.float.1, double %bridge.float.2, double %bridge.float.3, double %bridge.float.4, double %bridge.float.5, double %bridge.float.6, double %bridge.float.7, double %bridge.float.8, double %bridge.float.9, double %bridge.float.10, double %bridge.float.11, double %bridge.float.12, double %bridge.float.13)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_172"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.float64.0 = bitcast i64 %bridge.word0.0 to double
  %bridge.float.0 = fadd double %bridge.float64.0, 0.0
  %bridge.slot.1 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 1
  %bridge.load.1 = load %kira.bridge.value, ptr %bridge.slot.1
  %bridge.word0.1 = extractvalue %kira.bridge.value %bridge.load.1, 2
  %bridge.float64.1 = bitcast i64 %bridge.word0.1 to double
  %bridge.float.1 = fadd double %bridge.float64.1, 0.0
  %bridge.slot.2 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 2
  %bridge.load.2 = load %kira.bridge.value, ptr %bridge.slot.2
  %bridge.word0.2 = extractvalue %kira.bridge.value %bridge.load.2, 2
  %bridge.float64.2 = bitcast i64 %bridge.word0.2 to double
  %bridge.float.2 = fadd double %bridge.float64.2, 0.0
  %bridge.slot.3 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 3
  %bridge.load.3 = load %kira.bridge.value, ptr %bridge.slot.3
  %bridge.word0.3 = extractvalue %kira.bridge.value %bridge.load.3, 2
  %bridge.float64.3 = bitcast i64 %bridge.word0.3 to double
  %bridge.float.3 = fadd double %bridge.float64.3, 0.0
  %bridge.slot.4 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 4
  %bridge.load.4 = load %kira.bridge.value, ptr %bridge.slot.4
  %bridge.word0.4 = extractvalue %kira.bridge.value %bridge.load.4, 2
  %bridge.float64.4 = bitcast i64 %bridge.word0.4 to double
  %bridge.float.4 = fadd double %bridge.float64.4, 0.0
  %bridge.slot.5 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 5
  %bridge.load.5 = load %kira.bridge.value, ptr %bridge.slot.5
  %bridge.word0.5 = extractvalue %kira.bridge.value %bridge.load.5, 2
  %bridge.float64.5 = bitcast i64 %bridge.word0.5 to double
  %bridge.float.5 = fadd double %bridge.float64.5, 0.0
  %bridge.slot.6 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 6
  %bridge.load.6 = load %kira.bridge.value, ptr %bridge.slot.6
  %bridge.word0.6 = extractvalue %kira.bridge.value %bridge.load.6, 2
  %bridge.float64.6 = bitcast i64 %bridge.word0.6 to double
  %bridge.float.6 = fadd double %bridge.float64.6, 0.0
  %bridge.slot.7 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 7
  %bridge.load.7 = load %kira.bridge.value, ptr %bridge.slot.7
  %bridge.word0.7 = extractvalue %kira.bridge.value %bridge.load.7, 2
  %bridge.float64.7 = bitcast i64 %bridge.word0.7 to double
  %bridge.float.7 = fadd double %bridge.float64.7, 0.0
  %bridge.slot.8 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 8
  %bridge.load.8 = load %kira.bridge.value, ptr %bridge.slot.8
  %bridge.word0.8 = extractvalue %kira.bridge.value %bridge.load.8, 2
  %bridge.float64.8 = bitcast i64 %bridge.word0.8 to double
  %bridge.float.8 = fadd double %bridge.float64.8, 0.0
  %bridge.slot.9 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 9
  %bridge.load.9 = load %kira.bridge.value, ptr %bridge.slot.9
  %bridge.word0.9 = extractvalue %kira.bridge.value %bridge.load.9, 2
  %bridge.float64.9 = bitcast i64 %bridge.word0.9 to double
  %bridge.float.9 = fadd double %bridge.float64.9, 0.0
  %bridge.slot.10 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 10
  %bridge.load.10 = load %kira.bridge.value, ptr %bridge.slot.10
  %bridge.word0.10 = extractvalue %kira.bridge.value %bridge.load.10, 2
  %bridge.float64.10 = bitcast i64 %bridge.word0.10 to double
  %bridge.float.10 = fadd double %bridge.float64.10, 0.0
  %bridge.slot.11 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 11
  %bridge.load.11 = load %kira.bridge.value, ptr %bridge.slot.11
  %bridge.word0.11 = extractvalue %kira.bridge.value %bridge.load.11, 2
  %bridge.float64.11 = bitcast i64 %bridge.word0.11 to double
  %bridge.float.11 = fadd double %bridge.float64.11, 0.0
  %bridge.slot.12 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 12
  %bridge.load.12 = load %kira.bridge.value, ptr %bridge.slot.12
  %bridge.word0.12 = extractvalue %kira.bridge.value %bridge.load.12, 2
  %bridge.float64.12 = bitcast i64 %bridge.word0.12 to double
  %bridge.float.12 = fadd double %bridge.float64.12, 0.0
  %bridge.slot.13 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 13
  %bridge.load.13 = load %kira.bridge.value, ptr %bridge.slot.13
  %bridge.word0.13 = extractvalue %kira.bridge.value %bridge.load.13, 2
  %bridge.float64.13 = bitcast i64 %bridge.word0.13 to double
  %bridge.float.13 = fadd double %bridge.float64.13, 0.0
  call void @"kira_native_impl_172"(double %bridge.float.0, double %bridge.float.1, double %bridge.float.2, double %bridge.float.3, double %bridge.float.4, double %bridge.float.5, double %bridge.float.6, double %bridge.float.7, double %bridge.float.8, double %bridge.float.9, double %bridge.float.10, double %bridge.float.11, double %bridge.float.12, double %bridge.float.13)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_173"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.float64.0 = bitcast i64 %bridge.word0.0 to double
  %bridge.float.0 = fadd double %bridge.float64.0, 0.0
  %bridge.slot.1 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 1
  %bridge.load.1 = load %kira.bridge.value, ptr %bridge.slot.1
  %bridge.word0.1 = extractvalue %kira.bridge.value %bridge.load.1, 2
  %bridge.float64.1 = bitcast i64 %bridge.word0.1 to double
  %bridge.float.1 = fadd double %bridge.float64.1, 0.0
  %bridge.slot.2 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 2
  %bridge.load.2 = load %kira.bridge.value, ptr %bridge.slot.2
  %bridge.word0.2 = extractvalue %kira.bridge.value %bridge.load.2, 2
  %bridge.float64.2 = bitcast i64 %bridge.word0.2 to double
  %bridge.float.2 = fadd double %bridge.float64.2, 0.0
  %bridge.slot.3 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 3
  %bridge.load.3 = load %kira.bridge.value, ptr %bridge.slot.3
  %bridge.word0.3 = extractvalue %kira.bridge.value %bridge.load.3, 2
  %bridge.float64.3 = bitcast i64 %bridge.word0.3 to double
  %bridge.float.3 = fadd double %bridge.float64.3, 0.0
  %bridge.slot.4 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 4
  %bridge.load.4 = load %kira.bridge.value, ptr %bridge.slot.4
  %bridge.word0.4 = extractvalue %kira.bridge.value %bridge.load.4, 2
  %bridge.float64.4 = bitcast i64 %bridge.word0.4 to double
  %bridge.float.4 = fadd double %bridge.float64.4, 0.0
  %bridge.slot.5 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 5
  %bridge.load.5 = load %kira.bridge.value, ptr %bridge.slot.5
  %bridge.word0.5 = extractvalue %kira.bridge.value %bridge.load.5, 2
  %bridge.float64.5 = bitcast i64 %bridge.word0.5 to double
  %bridge.float.5 = fadd double %bridge.float64.5, 0.0
  %bridge.slot.6 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 6
  %bridge.load.6 = load %kira.bridge.value, ptr %bridge.slot.6
  %bridge.word0.6 = extractvalue %kira.bridge.value %bridge.load.6, 2
  %bridge.float64.6 = bitcast i64 %bridge.word0.6 to double
  %bridge.float.6 = fadd double %bridge.float64.6, 0.0
  %bridge.slot.7 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 7
  %bridge.load.7 = load %kira.bridge.value, ptr %bridge.slot.7
  %bridge.word0.7 = extractvalue %kira.bridge.value %bridge.load.7, 2
  %bridge.float64.7 = bitcast i64 %bridge.word0.7 to double
  %bridge.float.7 = fadd double %bridge.float64.7, 0.0
  %bridge.slot.8 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 8
  %bridge.load.8 = load %kira.bridge.value, ptr %bridge.slot.8
  %bridge.word0.8 = extractvalue %kira.bridge.value %bridge.load.8, 2
  %bridge.float64.8 = bitcast i64 %bridge.word0.8 to double
  %bridge.float.8 = fadd double %bridge.float64.8, 0.0
  %bridge.slot.9 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 9
  %bridge.load.9 = load %kira.bridge.value, ptr %bridge.slot.9
  %bridge.word0.9 = extractvalue %kira.bridge.value %bridge.load.9, 2
  %bridge.float64.9 = bitcast i64 %bridge.word0.9 to double
  %bridge.float.9 = fadd double %bridge.float64.9, 0.0
  call void @"kira_native_impl_173"(double %bridge.float.0, double %bridge.float.1, double %bridge.float.2, double %bridge.float.3, double %bridge.float.4, double %bridge.float.5, double %bridge.float.6, double %bridge.float.7, double %bridge.float.8, double %bridge.float.9)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_174"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.ptrint.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.len.0 = extractvalue %kira.bridge.value %bridge.load.0, 3
  %bridge.ptr.0 = inttoptr i64 %bridge.ptrint.0 to ptr
  %bridge.str.init.0 = insertvalue %kira.string zeroinitializer, ptr %bridge.ptr.0, 0
  %bridge.str.0 = insertvalue %kira.string %bridge.str.init.0, i64 %bridge.len.0, 1
  %bridge.slot.1 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 1
  %bridge.load.1 = load %kira.bridge.value, ptr %bridge.slot.1
  %bridge.word0.1 = extractvalue %kira.bridge.value %bridge.load.1, 2
  %bridge.float64.1 = bitcast i64 %bridge.word0.1 to double
  %bridge.float.1 = fadd double %bridge.float64.1, 0.0
  %bridge.slot.2 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 2
  %bridge.load.2 = load %kira.bridge.value, ptr %bridge.slot.2
  %bridge.word0.2 = extractvalue %kira.bridge.value %bridge.load.2, 2
  %bridge.float64.2 = bitcast i64 %bridge.word0.2 to double
  %bridge.float.2 = fadd double %bridge.float64.2, 0.0
  %bridge.slot.3 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 3
  %bridge.load.3 = load %kira.bridge.value, ptr %bridge.slot.3
  %bridge.word0.3 = extractvalue %kira.bridge.value %bridge.load.3, 2
  %bridge.float64.3 = bitcast i64 %bridge.word0.3 to double
  %bridge.float.3 = fadd double %bridge.float64.3, 0.0
  %bridge.slot.4 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 4
  %bridge.load.4 = load %kira.bridge.value, ptr %bridge.slot.4
  %bridge.word0.4 = extractvalue %kira.bridge.value %bridge.load.4, 2
  %bridge.float64.4 = bitcast i64 %bridge.word0.4 to double
  %bridge.float.4 = fadd double %bridge.float64.4, 0.0
  %bridge.slot.5 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 5
  %bridge.load.5 = load %kira.bridge.value, ptr %bridge.slot.5
  %bridge.word0.5 = extractvalue %kira.bridge.value %bridge.load.5, 2
  %bridge.float64.5 = bitcast i64 %bridge.word0.5 to double
  %bridge.float.5 = fadd double %bridge.float64.5, 0.0
  %bridge.slot.6 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 6
  %bridge.load.6 = load %kira.bridge.value, ptr %bridge.slot.6
  %bridge.word0.6 = extractvalue %kira.bridge.value %bridge.load.6, 2
  %bridge.float64.6 = bitcast i64 %bridge.word0.6 to double
  %bridge.float.6 = fadd double %bridge.float64.6, 0.0
  %bridge.slot.7 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 7
  %bridge.load.7 = load %kira.bridge.value, ptr %bridge.slot.7
  %bridge.word0.7 = extractvalue %kira.bridge.value %bridge.load.7, 2
  %bridge.float64.7 = bitcast i64 %bridge.word0.7 to double
  %bridge.float.7 = fadd double %bridge.float64.7, 0.0
  %bridge.slot.8 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 8
  %bridge.load.8 = load %kira.bridge.value, ptr %bridge.slot.8
  %bridge.word0.8 = extractvalue %kira.bridge.value %bridge.load.8, 2
  %bridge.float64.8 = bitcast i64 %bridge.word0.8 to double
  %bridge.float.8 = fadd double %bridge.float64.8, 0.0
  %bridge.slot.9 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 9
  %bridge.load.9 = load %kira.bridge.value, ptr %bridge.slot.9
  %bridge.word0.9 = extractvalue %kira.bridge.value %bridge.load.9, 2
  %bridge.float64.9 = bitcast i64 %bridge.word0.9 to double
  %bridge.float.9 = fadd double %bridge.float64.9, 0.0
  call void @"kira_native_impl_174"(%kira.string %bridge.str.0, double %bridge.float.1, double %bridge.float.2, double %bridge.float.3, double %bridge.float.4, double %bridge.float.5, double %bridge.float.6, double %bridge.float.7, double %bridge.float.8, double %bridge.float.9)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_178"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.call = call i64 @"kira_native_impl_178"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_179"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.call = call i64 @"kira_native_impl_179"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_181"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.ptrint.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.len.0 = extractvalue %kira.bridge.value %bridge.load.0, 3
  %bridge.ptr.0 = inttoptr i64 %bridge.ptrint.0 to ptr
  %bridge.str.init.0 = insertvalue %kira.string zeroinitializer, ptr %bridge.ptr.0, 0
  %bridge.str.0 = insertvalue %kira.string %bridge.str.init.0, i64 %bridge.len.0, 1
  %bridge.slot.1 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 1
  %bridge.load.1 = load %kira.bridge.value, ptr %bridge.slot.1
  %bridge.word0.1 = extractvalue %kira.bridge.value %bridge.load.1, 2
  %bridge.call = call i64 @"kira_native_impl_181"(%kira.string %bridge.str.0, i64 %bridge.word0.1)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_182"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.slot.1 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 1
  %bridge.load.1 = load %kira.bridge.value, ptr %bridge.slot.1
  %bridge.word0.1 = extractvalue %kira.bridge.value %bridge.load.1, 2
  call void @"kira_native_impl_182"(i64 %bridge.word0.0, i64 %bridge.word0.1)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_183"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  call void @"kira_native_impl_183"(i64 %bridge.word0.0)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_184"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.ptrint.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.len.0 = extractvalue %kira.bridge.value %bridge.load.0, 3
  %bridge.ptr.0 = inttoptr i64 %bridge.ptrint.0 to ptr
  %bridge.str.init.0 = insertvalue %kira.string zeroinitializer, ptr %bridge.ptr.0, 0
  %bridge.str.0 = insertvalue %kira.string %bridge.str.init.0, i64 %bridge.len.0, 1
  %bridge.call = call i64 @"kira_native_impl_184"(%kira.string %bridge.str.0)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_185"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.slot.1 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 1
  %bridge.load.1 = load %kira.bridge.value, ptr %bridge.slot.1
  %bridge.word0.1 = extractvalue %kira.bridge.value %bridge.load.1, 2
  %bridge.slot.2 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 2
  %bridge.load.2 = load %kira.bridge.value, ptr %bridge.slot.2
  %bridge.word0.2 = extractvalue %kira.bridge.value %bridge.load.2, 2
  %bridge.slot.3 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 3
  %bridge.load.3 = load %kira.bridge.value, ptr %bridge.slot.3
  %bridge.word0.3 = extractvalue %kira.bridge.value %bridge.load.3, 2
  call void @"kira_native_impl_185"(i64 %bridge.word0.0, i64 %bridge.word0.1, i64 %bridge.word0.2, i64 %bridge.word0.3)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_186"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  call void @"kira_native_impl_186"(i64 %bridge.word0.0)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_187"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.call = call i64 @"kira_native_impl_187"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_188"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.call = call i64 @"kira_native_impl_188"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_190"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.call = call i64 @"kira_native_impl_190"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_191"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.call = call i64 @"kira_native_impl_191"()
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_192"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.call = call i64 @"kira_native_impl_192"(i64 %bridge.word0.0)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %bridge.out.1 = insertvalue %kira.bridge.value %bridge.out.0, i64 %bridge.call, 2
  store %kira.bridge.value %bridge.out.1, ptr %out_result
  ret void
}

define void @"kira_native_fn_445"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  call void @"kira_native_impl_445"(i64 %bridge.word0.0)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_447"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  %bridge.slot.1 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 1
  %bridge.load.1 = load %kira.bridge.value, ptr %bridge.slot.1
  %bridge.word0.1 = extractvalue %kira.bridge.value %bridge.load.1, 2
  %bridge.slot.2 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 2
  %bridge.load.2 = load %kira.bridge.value, ptr %bridge.slot.2
  %bridge.word0.2 = extractvalue %kira.bridge.value %bridge.load.2, 2
  call void @"kira_native_impl_447"(i64 %bridge.word0.0, i64 %bridge.word0.1, i64 %bridge.word0.2)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_446"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  call void @"kira_native_impl_446"(i64 %bridge.word0.0)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

define void @"kira_native_fn_448"(ptr %args, i32 %arg_count, ptr %out_result) {
entry:
  %bridge.slot.0 = getelementptr inbounds %kira.bridge.value, ptr %args, i64 0
  %bridge.load.0 = load %kira.bridge.value, ptr %bridge.slot.0
  %bridge.word0.0 = extractvalue %kira.bridge.value %bridge.load.0, 2
  call void @"kira_native_impl_448"(i64 %bridge.word0.0)
  %bridge.out.0 = insertvalue %kira.bridge.value zeroinitializer, i8 0, 0
  store %kira.bridge.value %bridge.out.0, ptr %out_result
  ret void
}

