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
%t.VertexLayout = type { i64, ptr }
%t.KslShaderDescriptor = type { %kira.string, %kira.string, %kira.string }
%t.DepthAttachment = type { %t.GraphicsTexture, i64, i64, double, i8 }
%t.RenderTarget = type { i64, %t.GraphicsTexture, i64, i64 }
%t.RenderPipeline = type { %t.BackendPipelineHandle, i32 }
%t.StencilAttachment = type { %t.GraphicsTexture, i64, i64, i64, i8 }
%t.RenderPassDescriptor = type { %kira.string, ptr, %t.ColorAttachment, i8, %t.DepthAttachment, i8, %t.StencilAttachment, i8 }
%t.FrameTriangleState = type { %t.GraphicsShader, %t.RenderPipeline, %t.GraphicsBuffer }
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
define void @"kira_release_contents_FrameTriangleState"(ptr %value) {
entry:
  %release.field.0 = getelementptr inbounds %t.FrameTriangleState, ptr %value, i32 0, i32 0
  call void @"kira_release_contents_GraphicsShader"(ptr %release.field.0)
  %release.field.1 = getelementptr inbounds %t.FrameTriangleState, ptr %value, i32 0, i32 1
  call void @"kira_release_contents_RenderPipeline"(ptr %release.field.1)
  %release.field.2 = getelementptr inbounds %t.FrameTriangleState, ptr %value, i32 0, i32 2
  call void @"kira_release_contents_GraphicsBuffer"(ptr %release.field.2)
  ret void
}
define void @"kira_destroy_FrameTriangleState"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_FrameTriangleState"(ptr %value)
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



@kira_str_0_data = private unnamed_addr constant [194 x i8] c"#version 330 core\0Alayout(location = 0) in vec2 kira_attr_position;\0Aout vec4 color;\0Avoid main() {\0A    gl_Position = vec4(kira_attr_position, 0.0, 1.0);\0A    color = vec4(0.28, 0.78, 1.0, 1.0);\0A}\0A\00"

@kira_str_0 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([194 x i8], ptr @kira_str_0_data, i64 0, i64 0), i64 193 }

@kira_str_1_data = private unnamed_addr constant [95 x i8] c"#version 330 core\0Ain vec4 color;\0Aout vec4 frag_color;\0Avoid main() {\0A    frag_color = color;\0A}\0A\00"

@kira_str_1 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([95 x i8], ptr @kira_str_1_data, i64 0, i64 0), i64 94 }

@kira_str_2_data = private unnamed_addr constant [33 x i8] c"Kira Graphics Frame API Triangle\00"

@kira_str_2 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([33 x i8], ptr @kira_str_2_data, i64 0, i64 0), i64 32 }

@kira_str_3_data = private unnamed_addr constant [87 x i8] c"Kira Graphics skipped render pass because the pass descriptor has no color attachments\00"

@kira_str_3 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([87 x i8], ptr @kira_str_3_data, i64 0, i64 0), i64 86 }

@kira_str_4_data = private unnamed_addr constant [1 x i8] c"\00"

@kira_str_4 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([1 x i8], ptr @kira_str_4_data, i64 0, i64 0), i64 0 }

@kira_str_5_data = private unnamed_addr constant [15 x i8] c"submit:no-pass\00"

@kira_str_5 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([15 x i8], ptr @kira_str_5_data, i64 0, i64 0), i64 14 }

@kira_str_6_data = private unnamed_addr constant [20 x i8] c"submit:begin-failed\00"

@kira_str_6 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([20 x i8], ptr @kira_str_6_data, i64 0, i64 0), i64 19 }

@kira_str_7_data = private unnamed_addr constant [7 x i8] c"submit\00"

@kira_str_7 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([7 x i8], ptr @kira_str_7_data, i64 0, i64 0), i64 6 }

@kira_str_8_data = private unnamed_addr constant [64 x i8] c"Kira Graphics skipped draw because no render pipeline was bound\00"

@kira_str_8 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([64 x i8], ptr @kira_str_8_data, i64 0, i64 0), i64 63 }

@kira_str_9_data = private unnamed_addr constant [68 x i8] c"Kira Graphics skipped draw because no valid vertex buffer was bound\00"

@kira_str_9 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([68 x i8], ptr @kira_str_9_data, i64 0, i64 0), i64 67 }

@kira_str_10_data = private unnamed_addr constant [75 x i8] c"Kira Graphics skipped indexed draw because no valid index buffer was bound\00"

@kira_str_10 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([75 x i8], ptr @kira_str_10_data, i64 0, i64 0), i64 74 }

@kira_str_11_data = private unnamed_addr constant [116 x i8] c"Kira Graphics skipped indexed draw because the current Sokol backend only supports indexFormatUint32() in this pass\00"

@kira_str_11 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([116 x i8], ptr @kira_str_11_data, i64 0, i64 0), i64 115 }

@kira_str_12_data = private unnamed_addr constant [97 x i8] c"Kira Graphics skipped draw because the backend could not apply the current pipeline and bindings\00"

@kira_str_12 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([97 x i8], ptr @kira_str_12_data, i64 0, i64 0), i64 96 }

@kira_str_13_data = private unnamed_addr constant [73 x i8] c"Kira Graphics skipped render pass because the backend could not begin it\00"

@kira_str_13 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([73 x i8], ptr @kira_str_13_data, i64 0, i64 0), i64 72 }

@kira_str_14_data = private unnamed_addr constant [15 x i8] c"swapchain-pass\00"

@kira_str_14 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([15 x i8], ptr @kira_str_14_data, i64 0, i64 0), i64 14 }

@kira_str_15_data = private unnamed_addr constant [26 x i8] c"frame-api-triangle-shader\00"

@kira_str_15 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([26 x i8], ptr @kira_str_15_data, i64 0, i64 0), i64 25 }

@kira_str_16_data = private unnamed_addr constant [1 x i8] c"\00"

@kira_str_16 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([1 x i8], ptr @kira_str_16_data, i64 0, i64 0), i64 0 }

@kira_str_17_data = private unnamed_addr constant [1 x i8] c"\00"

@kira_str_17 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([1 x i8], ptr @kira_str_17_data, i64 0, i64 0), i64 0 }

@kira_str_18_data = private unnamed_addr constant [28 x i8] c"frame-api-triangle-vertices\00"

@kira_str_18 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([28 x i8], ptr @kira_str_18_data, i64 0, i64 0), i64 27 }

@kira_str_19_data = private unnamed_addr constant [28 x i8] c"frame-api-triangle-pipeline\00"

@kira_str_19 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([28 x i8], ptr @kira_str_19_data, i64 0, i64 0), i64 27 }

@kira_str_20_data = private unnamed_addr constant [9 x i8] c"position\00"

@kira_str_20 = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([9 x i8], ptr @kira_str_20_data, i64 0, i64 0), i64 8 }


define %kira.string @"kira_fn_0_frameTriangleVertexSource"() {
entry:
  %r0 = load %kira.string, ptr @kira_str_0
  ret %kira.string %r0
}

define %kira.string @"kira_fn_1_frameTriangleFragmentSource"() {
entry:
  %r0 = load %kira.string, ptr @kira_str_1
  ret %kira.string %r0
}

define i64 @"kira_fn_2_frameTriangleVertices"() {
entry:
  %r0 = add i64 0, 6
  %alloc.array.ptr.1 = call ptr @"kira_array_alloc"(i64 %r0)
  %r1 = ptrtoint ptr %alloc.array.ptr.1 to i64
  %r2 = add i64 0, 0
  %r3 = fadd double 0.0, 0.0
  %array.set.ptr.3 = inttoptr i64 %r1 to ptr
  %array.set.pack.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 2, 0
  %array.set.float.bits.0 = bitcast double %r3 to i64
  %array.set.pack.0 = insertvalue %kira.bridge.value %array.set.pack.0.0, i64 %array.set.float.bits.0, 2
  %array.set.pack.ptr.0 = alloca %kira.bridge.value
  store %kira.bridge.value %array.set.pack.0, ptr %array.set.pack.ptr.0
  call void @"kira_array_store"(ptr %array.set.ptr.3, i64 %r2, ptr %array.set.pack.ptr.0)
  %r4 = add i64 0, 1
  %r5 = fadd double 0.0, 0.55
  %array.set.ptr.5 = inttoptr i64 %r1 to ptr
  %array.set.pack.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 2, 0
  %array.set.float.bits.1 = bitcast double %r5 to i64
  %array.set.pack.1 = insertvalue %kira.bridge.value %array.set.pack.1.0, i64 %array.set.float.bits.1, 2
  %array.set.pack.ptr.1 = alloca %kira.bridge.value
  store %kira.bridge.value %array.set.pack.1, ptr %array.set.pack.ptr.1
  call void @"kira_array_store"(ptr %array.set.ptr.5, i64 %r4, ptr %array.set.pack.ptr.1)
  %r6 = add i64 0, 2
  %r7 = fadd double 0.0, 0.55
  %array.set.ptr.7 = inttoptr i64 %r1 to ptr
  %array.set.pack.2.0 = insertvalue %kira.bridge.value zeroinitializer, i8 2, 0
  %array.set.float.bits.2 = bitcast double %r7 to i64
  %array.set.pack.2 = insertvalue %kira.bridge.value %array.set.pack.2.0, i64 %array.set.float.bits.2, 2
  %array.set.pack.ptr.2 = alloca %kira.bridge.value
  store %kira.bridge.value %array.set.pack.2, ptr %array.set.pack.ptr.2
  call void @"kira_array_store"(ptr %array.set.ptr.7, i64 %r6, ptr %array.set.pack.ptr.2)
  %r8 = add i64 0, 3
  %r9 = fadd double 0.0, 0.55
  %r10 = fsub double 0.0, %r9
  %array.set.ptr.10 = inttoptr i64 %r1 to ptr
  %array.set.pack.3.0 = insertvalue %kira.bridge.value zeroinitializer, i8 2, 0
  %array.set.float.bits.3 = bitcast double %r10 to i64
  %array.set.pack.3 = insertvalue %kira.bridge.value %array.set.pack.3.0, i64 %array.set.float.bits.3, 2
  %array.set.pack.ptr.3 = alloca %kira.bridge.value
  store %kira.bridge.value %array.set.pack.3, ptr %array.set.pack.ptr.3
  call void @"kira_array_store"(ptr %array.set.ptr.10, i64 %r8, ptr %array.set.pack.ptr.3)
  %r11 = add i64 0, 4
  %r12 = fadd double 0.0, 0.55
  %r13 = fsub double 0.0, %r12
  %array.set.ptr.13 = inttoptr i64 %r1 to ptr
  %array.set.pack.4.0 = insertvalue %kira.bridge.value zeroinitializer, i8 2, 0
  %array.set.float.bits.4 = bitcast double %r13 to i64
  %array.set.pack.4 = insertvalue %kira.bridge.value %array.set.pack.4.0, i64 %array.set.float.bits.4, 2
  %array.set.pack.ptr.4 = alloca %kira.bridge.value
  store %kira.bridge.value %array.set.pack.4, ptr %array.set.pack.ptr.4
  call void @"kira_array_store"(ptr %array.set.ptr.13, i64 %r11, ptr %array.set.pack.ptr.4)
  %r14 = add i64 0, 5
  %r15 = fadd double 0.0, 0.55
  %r16 = fsub double 0.0, %r15
  %array.set.ptr.16 = inttoptr i64 %r1 to ptr
  %array.set.pack.5.0 = insertvalue %kira.bridge.value zeroinitializer, i8 2, 0
  %array.set.float.bits.5 = bitcast double %r16 to i64
  %array.set.pack.5 = insertvalue %kira.bridge.value %array.set.pack.5.0, i64 %array.set.float.bits.5, 2
  %array.set.pack.ptr.5 = alloca %kira.bridge.value
  store %kira.bridge.value %array.set.pack.5, ptr %array.set.pack.ptr.5
  call void @"kira_array_store"(ptr %array.set.ptr.16, i64 %r14, ptr %array.set.pack.ptr.5)
  ret i64 %r1
}

define void @"kira_fn_3_main"() {
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
  %r1 = load %kira.string, ptr @kira_str_2
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
  %alloc.size.ptr.16 = getelementptr %t.FrameTriangleState, ptr null, i32 1
  %alloc.size.16 = ptrtoint ptr %alloc.size.ptr.16 to i64
  %alloc.empty.16 = icmp eq i64 %alloc.size.16, 0
  %alloc.bytes.16 = select i1 %alloc.empty.16, i64 1, i64 %alloc.size.16
  %alloc.ptr.16 = call ptr @malloc(i64 %alloc.bytes.16)
  store %t.FrameTriangleState zeroinitializer, ptr %alloc.ptr.16
  %r16 = ptrtoint ptr %alloc.ptr.16 to i64
  store ptr %alloc.ptr.16, ptr %cleanup.heap.slot.16
  %r17 = call i64 @"kira_fn_178_emptyGraphicsShader"()
  %cleanup.call.ptr.17 = inttoptr i64 %r17 to ptr
  store ptr %cleanup.call.ptr.17, ptr %cleanup.heap.slot.17
  %field.base.18 = inttoptr i64 %r16 to ptr
  %field.ptr.18 = getelementptr inbounds %t.FrameTriangleState, ptr %field.base.18, i32 0, i32 0
  %r18 = ptrtoint ptr %field.ptr.18 to i64
  %copy.dst.18 = inttoptr i64 %r18 to ptr
  %copy.src.17 = inttoptr i64 %r17 to ptr
  %copy.val.18 = load %t.GraphicsShader, ptr %copy.src.17
  store %t.GraphicsShader %copy.val.18, ptr %copy.dst.18
  %r19 = call i64 @"kira_fn_168_emptyRenderPipeline"()
  %cleanup.call.ptr.19 = inttoptr i64 %r19 to ptr
  store ptr %cleanup.call.ptr.19, ptr %cleanup.heap.slot.19
  %field.base.20 = inttoptr i64 %r16 to ptr
  %field.ptr.20 = getelementptr inbounds %t.FrameTriangleState, ptr %field.base.20, i32 0, i32 1
  %r20 = ptrtoint ptr %field.ptr.20 to i64
  %copy.dst.20 = inttoptr i64 %r20 to ptr
  %copy.src.19 = inttoptr i64 %r19 to ptr
  %copy.val.20 = load %t.RenderPipeline, ptr %copy.src.19
  store %t.RenderPipeline %copy.val.20, ptr %copy.dst.20
  %r21 = call i64 @"kira_fn_85_emptyGraphicsBuffer"()
  %cleanup.call.ptr.21 = inttoptr i64 %r21 to ptr
  store ptr %cleanup.call.ptr.21, ptr %cleanup.heap.slot.21
  %field.base.22 = inttoptr i64 %r16 to ptr
  %field.ptr.22 = getelementptr inbounds %t.FrameTriangleState, ptr %field.base.22, i32 0, i32 2
  %r22 = ptrtoint ptr %field.ptr.22 to i64
  %copy.dst.22 = inttoptr i64 %r22 to ptr
  %copy.src.21 = inttoptr i64 %r21 to ptr
  %copy.val.22 = load %t.GraphicsBuffer, ptr %copy.src.21
  store %t.GraphicsBuffer %copy.val.22, ptr %copy.dst.22
  %native.state.size.ptr.23 = getelementptr [3 x %kira.bridge.value], ptr null, i32 1
  %native.state.size.23 = ptrtoint ptr %native.state.size.ptr.23 to i64
  %native.state.box.23 = call ptr @"kira_native_state_alloc"(i64 8458404067835574923, i64 %native.state.size.23)
  %native.state.payload.23 = call ptr @"kira_native_state_payload"(ptr %native.state.box.23)
  %native.state.src.23 = inttoptr i64 %r16 to ptr
  %native.state.src.field.ptr.23.0 = getelementptr inbounds %t.FrameTriangleState, ptr %native.state.src.23, i32 0, i32 0
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
  %native.state.src.field.ptr.23.1 = getelementptr inbounds %t.FrameTriangleState, ptr %native.state.src.23, i32 0, i32 1
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
  %native.state.src.field.ptr.23.2 = getelementptr inbounds %t.FrameTriangleState, ptr %native.state.src.23, i32 0, i32 2
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
  call void @"kira_fn_402_GraphicsApplication.onInit"(i64 %r24, i64 %r25)
  %r26 = load i64, ptr %local0
  %r27 = add i64 0, 446
  call void @"kira_fn_403_GraphicsApplication.onFrame"(i64 %r26, i64 %r27)
  %r28 = load i64, ptr %local0
  %r29 = add i64 0, 447
  call void @"kira_fn_404_GraphicsApplication.onCleanup"(i64 %r28, i64 %r29)
  %r30 = load i64, ptr %local0
  %r31 = load i64, ptr %local1
  call void @"kira_fn_405_GraphicsApplication.run"(i64 %r30, i64 %r31)
  %cleanup.heap.ptr.0 = load ptr, ptr %cleanup.heap.slot.0
  call void @free(ptr %cleanup.heap.ptr.0)
  %cleanup.heap.ptr.1 = load ptr, ptr %cleanup.heap.slot.16
  call void @free(ptr %cleanup.heap.ptr.1)
  %cleanup.heap.ptr.2 = load ptr, ptr %cleanup.heap.slot.17
  call void @free(ptr %cleanup.heap.ptr.2)
  %cleanup.heap.ptr.3 = load ptr, ptr %cleanup.heap.slot.19
  call void @free(ptr %cleanup.heap.ptr.3)
  %cleanup.heap.ptr.4 = load ptr, ptr %cleanup.heap.slot.21
  call void @free(ptr %cleanup.heap.ptr.4)
  call void @"kira_release_contents_GraphicsApplication"(ptr %local.storage.0)
  ret void
}

define void @"kira_fn_4_graphicsApplicationDefaultInit"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  store i64 %arg0, ptr %local0
  ret void
}

define void @"kira_fn_5_graphicsApplicationDefaultFrame"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.GraphicsFrame
  store %t.GraphicsFrame zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  store i64 %arg0, ptr %local0
  ret void
}

define void @"kira_fn_6_graphicsApplicationDefaultCleanup"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  store i64 %arg0, ptr %local0
  ret void
}

define void @"kira_fn_402_GraphicsApplication.onInit"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.GraphicsApplication
  store %t.GraphicsApplication zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %cleanup.heap.slot.1 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.1
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
  call void @"kira_release_contents_GraphicsApplication"(ptr %local.storage.0)
  ret void
}

define void @"kira_fn_403_GraphicsApplication.onFrame"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.GraphicsApplication
  store %t.GraphicsApplication zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %cleanup.heap.slot.1 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.1
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
  call void @"kira_release_contents_GraphicsApplication"(ptr %local.storage.0)
  ret void
}

define void @"kira_fn_404_GraphicsApplication.onCleanup"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.GraphicsApplication
  store %t.GraphicsApplication zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %cleanup.heap.slot.1 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.1
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
  call void @"kira_release_contents_GraphicsApplication"(ptr %local.storage.0)
  ret void
}

define void @"kira_fn_405_GraphicsApplication.run"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.GraphicsApplication
  store %t.GraphicsApplication zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local0
  %r1 = load i64, ptr %local1
  call void @"kira_fn_80_graphicsRuntimeRun"(i64 %r0, i64 %r1)
  ret void
}

define void @"kira_fn_8_sokolRunApplication"(i64 %arg0, i64 %arg1) {
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
  %r1 = ptrtoint ptr @"kira_fn_9_kiraGraphicsSokolInit" to i64
  %field.base.2 = inttoptr i64 %r0 to ptr
  %field.ptr.2 = getelementptr inbounds %t.sapp_desc, ptr %field.base.2, i32 0, i32 5
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %store.ptr.1 = inttoptr i64 %r2 to ptr
  %store.rawptr.1 = inttoptr i64 %r1 to ptr
  store ptr %store.rawptr.1, ptr %store.ptr.1
  %r3 = ptrtoint ptr @"kira_fn_10_kiraGraphicsSokolFrame" to i64
  %field.base.4 = inttoptr i64 %r0 to ptr
  %field.ptr.4 = getelementptr inbounds %t.sapp_desc, ptr %field.base.4, i32 0, i32 6
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %store.ptr.3 = inttoptr i64 %r4 to ptr
  %store.rawptr.3 = inttoptr i64 %r3 to ptr
  store ptr %store.rawptr.3, ptr %store.ptr.3
  %r5 = ptrtoint ptr @"kira_fn_11_kiraGraphicsSokolCleanup" to i64
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

define void @"kira_fn_9_kiraGraphicsSokolInit"(i64 %arg0) {
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

define void @"kira_fn_10_kiraGraphicsSokolFrame"(i64 %arg0) {
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
  %r14 = call i64 @"kira_fn_430_Graphics.frame"(i64 %r13)
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
  call void @"kira_fn_79_graphicsSubmitFrame"(i64 %r23)
  call void @"kg_sample_lifetime_frame"()
  %r24 = load i64, ptr %local1
  %native.state.get.ptr.25 = inttoptr i64 %r24 to ptr
  %native.state.get.slot.25 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.25, i64 2
  %native.state.get.val.4 = load %kira.bridge.value, ptr %native.state.get.slot.25
  %r25 = extractvalue %kira.bridge.value %native.state.get.val.4, 2
  call void @"kg_maybe_request_quit_after_frame"(i64 %r25)
  %cleanup.heap.ptr.5 = load ptr, ptr %cleanup.heap.slot.8
  call void @free(ptr %cleanup.heap.ptr.5)
  %cleanup.heap.ptr.6 = load ptr, ptr %cleanup.heap.slot.14
  call void @free(ptr %cleanup.heap.ptr.6)
  call void @"kira_release_contents_Graphics"(ptr %local.storage.4)
  call void @"kira_release_contents_GraphicsFrame"(ptr %local.storage.5)
  ret void
}

define void @"kira_fn_11_kiraGraphicsSokolCleanup"(i64 %arg0) {
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

define i64 @"kira_fn_54_sokolBeginFloatBufferUpload"(%kira.string %arg0, i64 %arg1, i64 %arg2, i64 %arg3) {
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

define void @"kira_fn_55_sokolSetFloatBufferUploadValue"(i64 %arg0, i64 %arg1, double %arg2) {
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

define i64 @"kira_fn_56_sokolFinalizeFloatBufferUpload"(i64 %arg0) {
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

define i64 @"kira_fn_57_sokolBeginIndexBufferUpload"(%kira.string %arg0, i64 %arg1, i64 %arg2) {
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

define void @"kira_fn_58_sokolSetIndexBufferUploadValue"(i64 %arg0, i64 %arg1, i64 %arg2) {
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

define i64 @"kira_fn_59_sokolFinalizeIndexBufferUpload"(i64 %arg0) {
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

define void @"kira_fn_60_sokolDestroyBufferId"(i64 %arg0) {
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

define i1 @"kira_fn_62_sokolBeginRenderPass"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.GraphicsFrame
  store %t.GraphicsFrame zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local2 = alloca i64
  %local3 = alloca i64
  %local4 = alloca i64
  %local5 = alloca i64
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.7 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.7
  %cleanup.heap.slot.10 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.10
  %cleanup.heap.slot.13 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.13
  %cleanup.heap.slot.16 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.16
  %cleanup.heap.slot.19 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.19
  %cleanup.heap.slot.22 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.22
  %cleanup.heap.slot.25 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.25
  %cleanup.heap.slot.28 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.28
  %cleanup.heap.slot.31 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.31
  %cleanup.heap.slot.34 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.34
  %cleanup.heap.slot.37 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.37
  %cleanup.heap.slot.43 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.43
  %cleanup.heap.slot.46 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.46
  %cleanup.heap.slot.49 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.49
  %cleanup.heap.slot.52 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.52
  %cleanup.heap.slot.58 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.58
  %cleanup.heap.slot.61 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.61
  %cleanup.heap.slot.64 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.64
  %cleanup.heap.slot.67 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.67
  %cleanup.heap.slot.70 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.70
  %cleanup.heap.slot.76 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.76
  %cleanup.heap.slot.82 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.82
  %cleanup.heap.slot.85 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.85
  %cleanup.heap.slot.88 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.88
  %cleanup.heap.slot.91 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.91
  %cleanup.heap.slot.94 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.94
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.raw.2 = load i8, ptr %load.ptr.2
  %r2 = trunc i8 %load.raw.2 to i1
  %r3 = xor i1 %r2, true
  br i1 %r3, label %kira_label_0, label %kira_label_1
kira_label_0:
  %r4 = load %kira.string, ptr @kira_str_3
  call void @"kira_fn_78_graphicsDiagnostic"(%kira.string %r4)
  %r5 = add i1 0, 0
  ret i1 %r5
kira_label_1:
  %r6 = load %kira.string, ptr @kira_str_4
  %r7 = load i64, ptr %local0
  %field.base.8 = inttoptr i64 %r7 to ptr
  %field.ptr.8 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.8, i32 0, i32 1
  %r8 = ptrtoint ptr %field.ptr.8 to i64
  %load.ptr.9 = inttoptr i64 %r8 to ptr
  %load.raw.9 = load i64, ptr %load.ptr.9
  %r9 = load i64, ptr %load.ptr.9
  %r10 = load i64, ptr %local0
  %field.base.11 = inttoptr i64 %r10 to ptr
  %field.ptr.11 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.11, i32 0, i32 2
  %r11 = ptrtoint ptr %field.ptr.11 to i64
  %load.ptr.12 = inttoptr i64 %r11 to ptr
  %load.raw.12 = load i32, ptr %load.ptr.12
  %r12 = sext i32 %load.raw.12 to i64
  %r13 = load i64, ptr %local0
  %field.base.14 = inttoptr i64 %r13 to ptr
  %field.ptr.14 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.14, i32 0, i32 3
  %r14 = ptrtoint ptr %field.ptr.14 to i64
  %load.ptr.15 = inttoptr i64 %r14 to ptr
  %load.raw.15 = load i64, ptr %load.ptr.15
  %r15 = load i64, ptr %load.ptr.15
  %r16 = load i64, ptr %local0
  %field.base.17 = inttoptr i64 %r16 to ptr
  %field.ptr.17 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.17, i32 0, i32 4
  %r17 = ptrtoint ptr %field.ptr.17 to i64
  %load.ptr.18 = inttoptr i64 %r17 to ptr
  %load.raw.18 = load i64, ptr %load.ptr.18
  %r18 = load i64, ptr %load.ptr.18
  %r19 = load i64, ptr %local0
  %field.base.20 = inttoptr i64 %r19 to ptr
  %field.ptr.20 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.20, i32 0, i32 5
  %r20 = ptrtoint ptr %field.ptr.20 to i64
  %load.ptr.21 = inttoptr i64 %r20 to ptr
  %load.raw.21 = load i64, ptr %load.ptr.21
  %r21 = load i64, ptr %load.ptr.21
  %r22 = load i64, ptr %local0
  %field.base.23 = inttoptr i64 %r22 to ptr
  %field.ptr.23 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.23, i32 0, i32 6
  %r23 = ptrtoint ptr %field.ptr.23 to i64
  %load.ptr.24 = inttoptr i64 %r23 to ptr
  %load.raw.24 = load i64, ptr %load.ptr.24
  %r24 = load i64, ptr %load.ptr.24
  %r25 = load i64, ptr %local0
  %field.base.26 = inttoptr i64 %r25 to ptr
  %field.ptr.26 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.26, i32 0, i32 7
  %r26 = ptrtoint ptr %field.ptr.26 to i64
  %load.ptr.27 = inttoptr i64 %r26 to ptr
  %load.raw.float.27 = load double, ptr %load.ptr.27
  %r27 = fadd double %load.raw.float.27, 0.0
  %r28 = load i64, ptr %local0
  %field.base.29 = inttoptr i64 %r28 to ptr
  %field.ptr.29 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.29, i32 0, i32 8
  %r29 = ptrtoint ptr %field.ptr.29 to i64
  %load.ptr.30 = inttoptr i64 %r29 to ptr
  %load.raw.float.30 = load double, ptr %load.ptr.30
  %r30 = fadd double %load.raw.float.30, 0.0
  %r31 = load i64, ptr %local0
  %field.base.32 = inttoptr i64 %r31 to ptr
  %field.ptr.32 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.32, i32 0, i32 9
  %r32 = ptrtoint ptr %field.ptr.32 to i64
  %load.ptr.33 = inttoptr i64 %r32 to ptr
  %load.raw.float.33 = load double, ptr %load.ptr.33
  %r33 = fadd double %load.raw.float.33, 0.0
  %r34 = load i64, ptr %local0
  %field.base.35 = inttoptr i64 %r34 to ptr
  %field.ptr.35 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.35, i32 0, i32 10
  %r35 = ptrtoint ptr %field.ptr.35 to i64
  %load.ptr.36 = inttoptr i64 %r35 to ptr
  %load.raw.float.36 = load double, ptr %load.ptr.36
  %r36 = fadd double %load.raw.float.36, 0.0
  %r37 = load i64, ptr %local0
  %field.base.38 = inttoptr i64 %r37 to ptr
  %field.ptr.38 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.38, i32 0, i32 11
  %r38 = ptrtoint ptr %field.ptr.38 to i64
  %load.ptr.39 = inttoptr i64 %r38 to ptr
  %load.raw.39 = load i8, ptr %load.ptr.39
  %r39 = trunc i8 %load.raw.39 to i1
  br i1 %r39, label %kira_label_2, label %kira_label_3
kira_label_2:
  %r40 = add i64 0, 1
  store i64 %r40, ptr %local1
  br label %kira_label_4
kira_label_3:
  %r41 = add i64 0, 0
  store i64 %r41, ptr %local1
  br label %kira_label_4
kira_label_4:
  %r42 = load i64, ptr %local1
  %r43 = load i64, ptr %local0
  %field.base.44 = inttoptr i64 %r43 to ptr
  %field.ptr.44 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.44, i32 0, i32 12
  %r44 = ptrtoint ptr %field.ptr.44 to i64
  %load.ptr.45 = inttoptr i64 %r44 to ptr
  %load.raw.45 = load i32, ptr %load.ptr.45
  %r45 = sext i32 %load.raw.45 to i64
  %r46 = load i64, ptr %local0
  %field.base.47 = inttoptr i64 %r46 to ptr
  %field.ptr.47 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.47, i32 0, i32 13
  %r47 = ptrtoint ptr %field.ptr.47 to i64
  %load.ptr.48 = inttoptr i64 %r47 to ptr
  %load.raw.48 = load i64, ptr %load.ptr.48
  %r48 = load i64, ptr %load.ptr.48
  %r49 = load i64, ptr %local0
  %field.base.50 = inttoptr i64 %r49 to ptr
  %field.ptr.50 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.50, i32 0, i32 14
  %r50 = ptrtoint ptr %field.ptr.50 to i64
  %load.ptr.51 = inttoptr i64 %r50 to ptr
  %load.raw.51 = load i64, ptr %load.ptr.51
  %r51 = load i64, ptr %load.ptr.51
  %r52 = load i64, ptr %local0
  %field.base.53 = inttoptr i64 %r52 to ptr
  %field.ptr.53 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.53, i32 0, i32 15
  %r53 = ptrtoint ptr %field.ptr.53 to i64
  %load.ptr.54 = inttoptr i64 %r53 to ptr
  %load.raw.54 = load i8, ptr %load.ptr.54
  %r54 = trunc i8 %load.raw.54 to i1
  br i1 %r54, label %kira_label_5, label %kira_label_6
kira_label_5:
  %r55 = add i64 0, 1
  store i64 %r55, ptr %local2
  br label %kira_label_7
kira_label_6:
  %r56 = add i64 0, 0
  store i64 %r56, ptr %local2
  br label %kira_label_7
kira_label_7:
  %r57 = load i64, ptr %local2
  %r58 = load i64, ptr %local0
  %field.base.59 = inttoptr i64 %r58 to ptr
  %field.ptr.59 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.59, i32 0, i32 16
  %r59 = ptrtoint ptr %field.ptr.59 to i64
  %load.ptr.60 = inttoptr i64 %r59 to ptr
  %load.raw.60 = load i32, ptr %load.ptr.60
  %r60 = sext i32 %load.raw.60 to i64
  %r61 = load i64, ptr %local0
  %field.base.62 = inttoptr i64 %r61 to ptr
  %field.ptr.62 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.62, i32 0, i32 17
  %r62 = ptrtoint ptr %field.ptr.62 to i64
  %load.ptr.63 = inttoptr i64 %r62 to ptr
  %load.raw.63 = load i64, ptr %load.ptr.63
  %r63 = load i64, ptr %load.ptr.63
  %r64 = load i64, ptr %local0
  %field.base.65 = inttoptr i64 %r64 to ptr
  %field.ptr.65 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.65, i32 0, i32 18
  %r65 = ptrtoint ptr %field.ptr.65 to i64
  %load.ptr.66 = inttoptr i64 %r65 to ptr
  %load.raw.66 = load i64, ptr %load.ptr.66
  %r66 = load i64, ptr %load.ptr.66
  %r67 = load i64, ptr %local0
  %field.base.68 = inttoptr i64 %r67 to ptr
  %field.ptr.68 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.68, i32 0, i32 19
  %r68 = ptrtoint ptr %field.ptr.68 to i64
  %load.ptr.69 = inttoptr i64 %r68 to ptr
  %load.raw.float.69 = load double, ptr %load.ptr.69
  %r69 = fadd double %load.raw.float.69, 0.0
  %r70 = load i64, ptr %local0
  %field.base.71 = inttoptr i64 %r70 to ptr
  %field.ptr.71 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.71, i32 0, i32 20
  %r71 = ptrtoint ptr %field.ptr.71 to i64
  %load.ptr.72 = inttoptr i64 %r71 to ptr
  %load.raw.72 = load i8, ptr %load.ptr.72
  %r72 = trunc i8 %load.raw.72 to i1
  br i1 %r72, label %kira_label_8, label %kira_label_9
kira_label_8:
  %r73 = add i64 0, 1
  store i64 %r73, ptr %local3
  br label %kira_label_10
kira_label_9:
  %r74 = add i64 0, 0
  store i64 %r74, ptr %local3
  br label %kira_label_10
kira_label_10:
  %r75 = load i64, ptr %local3
  %r76 = load i64, ptr %local0
  %field.base.77 = inttoptr i64 %r76 to ptr
  %field.ptr.77 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.77, i32 0, i32 21
  %r77 = ptrtoint ptr %field.ptr.77 to i64
  %load.ptr.78 = inttoptr i64 %r77 to ptr
  %load.raw.78 = load i8, ptr %load.ptr.78
  %r78 = trunc i8 %load.raw.78 to i1
  br i1 %r78, label %kira_label_11, label %kira_label_12
kira_label_11:
  %r79 = add i64 0, 1
  store i64 %r79, ptr %local4
  br label %kira_label_13
kira_label_12:
  %r80 = add i64 0, 0
  store i64 %r80, ptr %local4
  br label %kira_label_13
kira_label_13:
  %r81 = load i64, ptr %local4
  %r82 = load i64, ptr %local0
  %field.base.83 = inttoptr i64 %r82 to ptr
  %field.ptr.83 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.83, i32 0, i32 22
  %r83 = ptrtoint ptr %field.ptr.83 to i64
  %load.ptr.84 = inttoptr i64 %r83 to ptr
  %load.raw.84 = load i32, ptr %load.ptr.84
  %r84 = sext i32 %load.raw.84 to i64
  %r85 = load i64, ptr %local0
  %field.base.86 = inttoptr i64 %r85 to ptr
  %field.ptr.86 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.86, i32 0, i32 23
  %r86 = ptrtoint ptr %field.ptr.86 to i64
  %load.ptr.87 = inttoptr i64 %r86 to ptr
  %load.raw.87 = load i64, ptr %load.ptr.87
  %r87 = load i64, ptr %load.ptr.87
  %r88 = load i64, ptr %local0
  %field.base.89 = inttoptr i64 %r88 to ptr
  %field.ptr.89 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.89, i32 0, i32 24
  %r89 = ptrtoint ptr %field.ptr.89 to i64
  %load.ptr.90 = inttoptr i64 %r89 to ptr
  %load.raw.90 = load i64, ptr %load.ptr.90
  %r90 = load i64, ptr %load.ptr.90
  %r91 = load i64, ptr %local0
  %field.base.92 = inttoptr i64 %r91 to ptr
  %field.ptr.92 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.92, i32 0, i32 25
  %r92 = ptrtoint ptr %field.ptr.92 to i64
  %load.ptr.93 = inttoptr i64 %r92 to ptr
  %load.raw.93 = load i64, ptr %load.ptr.93
  %r93 = load i64, ptr %load.ptr.93
  %r94 = load i64, ptr %local0
  %field.base.95 = inttoptr i64 %r94 to ptr
  %field.ptr.95 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.95, i32 0, i32 26
  %r95 = ptrtoint ptr %field.ptr.95 to i64
  %load.ptr.96 = inttoptr i64 %r95 to ptr
  %load.raw.96 = load i8, ptr %load.ptr.96
  %r96 = trunc i8 %load.raw.96 to i1
  br i1 %r96, label %kira_label_14, label %kira_label_15
kira_label_14:
  %r97 = add i64 0, 1
  store i64 %r97, ptr %local5
  br label %kira_label_16
kira_label_15:
  %r98 = add i64 0, 0
  store i64 %r98, ptr %local5
  br label %kira_label_16
kira_label_16:
  %r99 = load i64, ptr %local5
  %r100 = call i1 @"kira_fn_65_sokolBeginRenderPassFlat"(%kira.string %r6, i64 %r9, i64 %r12, i64 %r15, i64 %r18, i64 %r21, i64 %r24, double %r27, double %r30, double %r33, double %r36, i64 %r42, i64 %r45, i64 %r48, i64 %r51, i64 %r57, i64 %r60, i64 %r63, i64 %r66, double %r69, i64 %r75, i64 %r81, i64 %r84, i64 %r87, i64 %r90, i64 %r93, i64 %r99)
  ret i1 %r100
}

define i1 @"kira_fn_63_sokolBeginRenderPassFromFrame"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.GraphicsFrame
  store %t.GraphicsFrame zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %r1 = call i1 @"kira_fn_62_sokolBeginRenderPass"(i64 %r0)
  ret i1 %r1
}

define void @"kira_fn_64_sokolSubmitFrame"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.GraphicsFrame
  store %t.GraphicsFrame zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i1
  %local2 = alloca i1
  %local3 = alloca i64
  %local4 = alloca i64
  %local5 = alloca i1
  %local6 = alloca i1
  %local7 = alloca i1
  %local8 = alloca i1
  %local9 = alloca i1
  %local10 = alloca i64
  %local11 = alloca i64
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.3 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.3
  %cleanup.heap.slot.6 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.6
  %cleanup.heap.slot.11 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.11
  %cleanup.heap.slot.15 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.15
  %cleanup.heap.slot.18 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.18
  %cleanup.heap.slot.24 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.24
  %cleanup.heap.slot.30 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.30
  %cleanup.heap.slot.33 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.33
  %cleanup.heap.slot.36 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.36
  %cleanup.heap.slot.42 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.42
  %cleanup.heap.slot.45 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.45
  %cleanup.heap.slot.51 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.51
  %cleanup.heap.slot.54 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.54
  %cleanup.heap.slot.57 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.57
  %cleanup.heap.slot.61 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.61
  %cleanup.heap.slot.64 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.64
  %cleanup.heap.slot.67 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.67
  %cleanup.heap.slot.70 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.70
  %cleanup.heap.slot.73 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.73
  %cleanup.heap.slot.76 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.76
  %cleanup.heap.slot.80 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.80
  %cleanup.heap.slot.85 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.85
  %cleanup.heap.slot.92 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.92
  %cleanup.heap.slot.97 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.97
  %cleanup.heap.slot.104 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.104
  %cleanup.heap.slot.110 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.110
  %cleanup.heap.slot.115 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.115
  %cleanup.heap.slot.123 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.123
  %cleanup.heap.slot.129 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.129
  %cleanup.heap.slot.136 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.136
  %cleanup.heap.slot.139 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.139
  %cleanup.heap.slot.142 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.142
  %cleanup.heap.slot.148 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.148
  %cleanup.heap.slot.151 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.151
  %cleanup.heap.slot.165 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.165
  %cleanup.heap.slot.168 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.168
  %cleanup.heap.slot.171 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.171
  %cleanup.heap.slot.177 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.177
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.1, i32 0, i32 41
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.raw.2 = load i8, ptr %load.ptr.2
  %r2 = trunc i8 %load.raw.2 to i1
  br i1 %r2, label %kira_label_0, label %kira_label_1
kira_label_0:
  %r3 = load i64, ptr %local0
  %field.base.4 = inttoptr i64 %r3 to ptr
  %field.ptr.4 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.4, i32 0, i32 42
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %load.ptr.5 = inttoptr i64 %r4 to ptr
  %load.raw.5 = load i8, ptr %load.ptr.5
  %r5 = trunc i8 %load.raw.5 to i1
  br i1 %r5, label %kira_label_2, label %kira_label_3
kira_label_2:
  call void @"kira_fn_68_sokolRequestQuitNative"()
  br label %kira_label_3
kira_label_3:
  ret void
kira_label_1:
  %r6 = load i64, ptr %local0
  %field.base.7 = inttoptr i64 %r6 to ptr
  %field.ptr.7 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.7, i32 0, i32 37
  %r7 = ptrtoint ptr %field.ptr.7 to i64
  %load.ptr.8 = inttoptr i64 %r7 to ptr
  %load.raw.8 = load i8, ptr %load.ptr.8
  %r8 = trunc i8 %load.raw.8 to i1
  %r9 = xor i1 %r8, true
  br i1 %r9, label %kira_label_4, label %kira_label_5
kira_label_4:
  %r10 = load %kira.string, ptr @kira_str_5
  %print.str.ptr.0 = extractvalue %kira.string %r10, 0
  %print.str.len.0 = extractvalue %kira.string %r10, 1
  call void @"kira_native_write_string"(ptr %print.str.ptr.0, i64 %print.str.len.0)
  call void @"kira_native_write_newline"()
  ret void
kira_label_5:
  %r11 = load i64, ptr %local0
  %r12 = call i1 @"kira_fn_62_sokolBeginRenderPass"(i64 %r11)
  %r13 = xor i1 %r12, true
  br i1 %r13, label %kira_label_6, label %kira_label_7
kira_label_6:
  %r14 = load %kira.string, ptr @kira_str_6
  %print.str.ptr.1 = extractvalue %kira.string %r14, 0
  %print.str.len.1 = extractvalue %kira.string %r14, 1
  call void @"kira_native_write_string"(ptr %print.str.ptr.1, i64 %print.str.len.1)
  call void @"kira_native_write_newline"()
  %r15 = load i64, ptr %local0
  %field.base.16 = inttoptr i64 %r15 to ptr
  %field.ptr.16 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.16, i32 0, i32 42
  %r16 = ptrtoint ptr %field.ptr.16 to i64
  %load.ptr.17 = inttoptr i64 %r16 to ptr
  %load.raw.17 = load i8, ptr %load.ptr.17
  %r17 = trunc i8 %load.raw.17 to i1
  br i1 %r17, label %kira_label_8, label %kira_label_9
kira_label_8:
  call void @"kira_fn_68_sokolRequestQuitNative"()
  br label %kira_label_9
kira_label_9:
  ret void
kira_label_7:
  %r18 = load i64, ptr %local0
  %field.base.19 = inttoptr i64 %r18 to ptr
  %field.ptr.19 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.19, i32 0, i32 34
  %r19 = ptrtoint ptr %field.ptr.19 to i64
  %load.ptr.20 = inttoptr i64 %r19 to ptr
  %load.raw.20 = load i64, ptr %load.ptr.20
  %r20 = load i64, ptr %load.ptr.20
  %r21 = add i64 0, 0
  %r22 = icmp sgt i64 %r20, %r21
  br i1 %r22, label %kira_label_11, label %kira_label_10
kira_label_11:
  %r23 = add i1 0, 1
  store i1 %r23, ptr %local2
  br label %kira_label_12
kira_label_10:
  %r24 = load i64, ptr %local0
  %field.base.25 = inttoptr i64 %r24 to ptr
  %field.ptr.25 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.25, i32 0, i32 35
  %r25 = ptrtoint ptr %field.ptr.25 to i64
  %load.ptr.26 = inttoptr i64 %r25 to ptr
  %load.raw.26 = load i64, ptr %load.ptr.26
  %r26 = load i64, ptr %load.ptr.26
  %r27 = add i64 0, 0
  %r28 = icmp sgt i64 %r26, %r27
  store i1 %r28, ptr %local2
  br label %kira_label_12
kira_label_12:
  %r29 = load i1, ptr %local2
  store i1 %r29, ptr %local1
  %r30 = load i64, ptr %local0
  %field.base.31 = inttoptr i64 %r30 to ptr
  %field.ptr.31 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.31, i32 0, i32 27
  %r31 = ptrtoint ptr %field.ptr.31 to i64
  %load.ptr.32 = inttoptr i64 %r31 to ptr
  %load.raw.32 = load i32, ptr %load.ptr.32
  %r32 = sext i32 %load.raw.32 to i64
  %r33 = load i64, ptr %local0
  %field.base.34 = inttoptr i64 %r33 to ptr
  %field.ptr.34 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.34, i32 0, i32 29
  %r34 = ptrtoint ptr %field.ptr.34 to i64
  %load.ptr.35 = inttoptr i64 %r34 to ptr
  %load.raw.35 = load i32, ptr %load.ptr.35
  %r35 = sext i32 %load.raw.35 to i64
  %r36 = load i64, ptr %local0
  %field.base.37 = inttoptr i64 %r36 to ptr
  %field.ptr.37 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.37, i32 0, i32 30
  %r37 = ptrtoint ptr %field.ptr.37 to i64
  %load.ptr.38 = inttoptr i64 %r37 to ptr
  %load.raw.38 = load i8, ptr %load.ptr.38
  %r38 = trunc i8 %load.raw.38 to i1
  br i1 %r38, label %kira_label_13, label %kira_label_14
kira_label_13:
  %r39 = add i64 0, 1
  store i64 %r39, ptr %local3
  br label %kira_label_15
kira_label_14:
  %r40 = add i64 0, 0
  store i64 %r40, ptr %local3
  br label %kira_label_15
kira_label_15:
  %r41 = load i64, ptr %local3
  %r42 = load i64, ptr %local0
  %field.base.43 = inttoptr i64 %r42 to ptr
  %field.ptr.43 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.43, i32 0, i32 31
  %r43 = ptrtoint ptr %field.ptr.43 to i64
  %load.ptr.44 = inttoptr i64 %r43 to ptr
  %load.raw.44 = load i32, ptr %load.ptr.44
  %r44 = sext i32 %load.raw.44 to i64
  %r45 = load i64, ptr %local0
  %field.base.46 = inttoptr i64 %r45 to ptr
  %field.ptr.46 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.46, i32 0, i32 32
  %r46 = ptrtoint ptr %field.ptr.46 to i64
  %load.ptr.47 = inttoptr i64 %r46 to ptr
  %load.raw.47 = load i8, ptr %load.ptr.47
  %r47 = trunc i8 %load.raw.47 to i1
  br i1 %r47, label %kira_label_16, label %kira_label_17
kira_label_16:
  %r48 = add i64 0, 1
  store i64 %r48, ptr %local4
  br label %kira_label_18
kira_label_17:
  %r49 = add i64 0, 0
  store i64 %r49, ptr %local4
  br label %kira_label_18
kira_label_18:
  %r50 = load i64, ptr %local4
  %r51 = load i64, ptr %local0
  %field.base.52 = inttoptr i64 %r51 to ptr
  %field.ptr.52 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.52, i32 0, i32 34
  %r52 = ptrtoint ptr %field.ptr.52 to i64
  %load.ptr.53 = inttoptr i64 %r52 to ptr
  %load.raw.53 = load i64, ptr %load.ptr.53
  %r53 = load i64, ptr %load.ptr.53
  %r54 = load i64, ptr %local0
  %field.base.55 = inttoptr i64 %r54 to ptr
  %field.ptr.55 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.55, i32 0, i32 35
  %r55 = ptrtoint ptr %field.ptr.55 to i64
  %load.ptr.56 = inttoptr i64 %r55 to ptr
  %load.raw.56 = load i64, ptr %load.ptr.56
  %r56 = load i64, ptr %load.ptr.56
  %r57 = load i64, ptr %local0
  %field.base.58 = inttoptr i64 %r57 to ptr
  %field.ptr.58 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.58, i32 0, i32 36
  %r58 = ptrtoint ptr %field.ptr.58 to i64
  %load.ptr.59 = inttoptr i64 %r58 to ptr
  %load.raw.59 = load i64, ptr %load.ptr.59
  %r59 = load i64, ptr %load.ptr.59
  call void @"kira_fn_69_sokolLogSubmitState"(i64 %r32, i64 %r35, i64 %r41, i64 %r44, i64 %r50, i64 %r53, i64 %r56, i64 %r59)
  %r60 = load %kira.string, ptr @kira_str_7
  %print.str.ptr.2 = extractvalue %kira.string %r60, 0
  %print.str.len.2 = extractvalue %kira.string %r60, 1
  call void @"kira_native_write_string"(ptr %print.str.ptr.2, i64 %print.str.len.2)
  call void @"kira_native_write_newline"()
  %r61 = load i64, ptr %local0
  %field.base.62 = inttoptr i64 %r61 to ptr
  %field.ptr.62 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.62, i32 0, i32 27
  %r62 = ptrtoint ptr %field.ptr.62 to i64
  %load.ptr.63 = inttoptr i64 %r62 to ptr
  %load.raw.63 = load i32, ptr %load.ptr.63
  %r63 = sext i32 %load.raw.63 to i64
  call void @"kira_native_write_i64"(i64 %r63)
  call void @"kira_native_write_newline"()
  %r64 = load i64, ptr %local0
  %field.base.65 = inttoptr i64 %r64 to ptr
  %field.ptr.65 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.65, i32 0, i32 29
  %r65 = ptrtoint ptr %field.ptr.65 to i64
  %load.ptr.66 = inttoptr i64 %r65 to ptr
  %load.raw.66 = load i32, ptr %load.ptr.66
  %r66 = sext i32 %load.raw.66 to i64
  call void @"kira_native_write_i64"(i64 %r66)
  call void @"kira_native_write_newline"()
  %r67 = load i64, ptr %local0
  %field.base.68 = inttoptr i64 %r67 to ptr
  %field.ptr.68 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.68, i32 0, i32 31
  %r68 = ptrtoint ptr %field.ptr.68 to i64
  %load.ptr.69 = inttoptr i64 %r68 to ptr
  %load.raw.69 = load i32, ptr %load.ptr.69
  %r69 = sext i32 %load.raw.69 to i64
  call void @"kira_native_write_i64"(i64 %r69)
  call void @"kira_native_write_newline"()
  %r70 = load i64, ptr %local0
  %field.base.71 = inttoptr i64 %r70 to ptr
  %field.ptr.71 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.71, i32 0, i32 34
  %r71 = ptrtoint ptr %field.ptr.71 to i64
  %load.ptr.72 = inttoptr i64 %r71 to ptr
  %load.raw.72 = load i64, ptr %load.ptr.72
  %r72 = load i64, ptr %load.ptr.72
  call void @"kira_native_write_i64"(i64 %r72)
  call void @"kira_native_write_newline"()
  %r73 = load i64, ptr %local0
  %field.base.74 = inttoptr i64 %r73 to ptr
  %field.ptr.74 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.74, i32 0, i32 35
  %r74 = ptrtoint ptr %field.ptr.74 to i64
  %load.ptr.75 = inttoptr i64 %r74 to ptr
  %load.raw.75 = load i64, ptr %load.ptr.75
  %r75 = load i64, ptr %load.ptr.75
  call void @"kira_native_write_i64"(i64 %r75)
  call void @"kira_native_write_newline"()
  %r76 = load i64, ptr %local0
  %field.base.77 = inttoptr i64 %r76 to ptr
  %field.ptr.77 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.77, i32 0, i32 36
  %r77 = ptrtoint ptr %field.ptr.77 to i64
  %load.ptr.78 = inttoptr i64 %r77 to ptr
  %load.raw.78 = load i64, ptr %load.ptr.78
  %r78 = load i64, ptr %load.ptr.78
  call void @"kira_native_write_i64"(i64 %r78)
  call void @"kira_native_write_newline"()
  %r79 = load i1, ptr %local1
  br i1 %r79, label %kira_label_19, label %kira_label_20
kira_label_19:
  %r80 = load i64, ptr %local0
  %field.base.81 = inttoptr i64 %r80 to ptr
  %field.ptr.81 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.81, i32 0, i32 28
  %r81 = ptrtoint ptr %field.ptr.81 to i64
  %load.ptr.82 = inttoptr i64 %r81 to ptr
  %load.raw.82 = load i8, ptr %load.ptr.82
  %r82 = trunc i8 %load.raw.82 to i1
  %r83 = xor i1 %r82, true
  br i1 %r83, label %kira_label_22, label %kira_label_21
kira_label_22:
  %r84 = add i1 0, 1
  store i1 %r84, ptr %local5
  br label %kira_label_23
kira_label_21:
  %r85 = load i64, ptr %local0
  %field.base.86 = inttoptr i64 %r85 to ptr
  %field.ptr.86 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.86, i32 0, i32 27
  %r86 = ptrtoint ptr %field.ptr.86 to i64
  %load.ptr.87 = inttoptr i64 %r86 to ptr
  %load.raw.87 = load i32, ptr %load.ptr.87
  %r87 = sext i32 %load.raw.87 to i64
  %r88 = add i64 0, 0
  %r89 = icmp eq i64 %r87, %r88
  store i1 %r89, ptr %local5
  br label %kira_label_23
kira_label_23:
  %r90 = load i1, ptr %local5
  br i1 %r90, label %kira_label_24, label %kira_label_25
kira_label_24:
  %r91 = load %kira.string, ptr @kira_str_8
  call void @"kira_fn_78_graphicsDiagnostic"(%kira.string %r91)
  br label %kira_label_26
kira_label_25:
  %r92 = load i64, ptr %local0
  %field.base.93 = inttoptr i64 %r92 to ptr
  %field.ptr.93 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.93, i32 0, i32 30
  %r93 = ptrtoint ptr %field.ptr.93 to i64
  %load.ptr.94 = inttoptr i64 %r93 to ptr
  %load.raw.94 = load i8, ptr %load.ptr.94
  %r94 = trunc i8 %load.raw.94 to i1
  %r95 = xor i1 %r94, true
  br i1 %r95, label %kira_label_28, label %kira_label_27
kira_label_28:
  %r96 = add i1 0, 1
  store i1 %r96, ptr %local6
  br label %kira_label_29
kira_label_27:
  %r97 = load i64, ptr %local0
  %field.base.98 = inttoptr i64 %r97 to ptr
  %field.ptr.98 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.98, i32 0, i32 29
  %r98 = ptrtoint ptr %field.ptr.98 to i64
  %load.ptr.99 = inttoptr i64 %r98 to ptr
  %load.raw.99 = load i32, ptr %load.ptr.99
  %r99 = sext i32 %load.raw.99 to i64
  %r100 = add i64 0, 0
  %r101 = icmp eq i64 %r99, %r100
  store i1 %r101, ptr %local6
  br label %kira_label_29
kira_label_29:
  %r102 = load i1, ptr %local6
  br i1 %r102, label %kira_label_30, label %kira_label_31
kira_label_30:
  %r103 = load %kira.string, ptr @kira_str_9
  call void @"kira_fn_78_graphicsDiagnostic"(%kira.string %r103)
  br label %kira_label_32
kira_label_31:
  %r104 = load i64, ptr %local0
  %field.base.105 = inttoptr i64 %r104 to ptr
  %field.ptr.105 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.105, i32 0, i32 35
  %r105 = ptrtoint ptr %field.ptr.105 to i64
  %load.ptr.106 = inttoptr i64 %r105 to ptr
  %load.raw.106 = load i64, ptr %load.ptr.106
  %r106 = load i64, ptr %load.ptr.106
  %r107 = add i64 0, 0
  %r108 = icmp sgt i64 %r106, %r107
  br i1 %r108, label %kira_label_33, label %kira_label_34
kira_label_34:
  %r109 = add i1 0, 0
  store i1 %r109, ptr %local7
  br label %kira_label_35
kira_label_33:
  %r110 = load i64, ptr %local0
  %field.base.111 = inttoptr i64 %r110 to ptr
  %field.ptr.111 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.111, i32 0, i32 32
  %r111 = ptrtoint ptr %field.ptr.111 to i64
  %load.ptr.112 = inttoptr i64 %r111 to ptr
  %load.raw.112 = load i8, ptr %load.ptr.112
  %r112 = trunc i8 %load.raw.112 to i1
  %r113 = xor i1 %r112, true
  br i1 %r113, label %kira_label_37, label %kira_label_36
kira_label_37:
  %r114 = add i1 0, 1
  store i1 %r114, ptr %local8
  br label %kira_label_38
kira_label_36:
  %r115 = load i64, ptr %local0
  %field.base.116 = inttoptr i64 %r115 to ptr
  %field.ptr.116 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.116, i32 0, i32 31
  %r116 = ptrtoint ptr %field.ptr.116 to i64
  %load.ptr.117 = inttoptr i64 %r116 to ptr
  %load.raw.117 = load i32, ptr %load.ptr.117
  %r117 = sext i32 %load.raw.117 to i64
  %r118 = add i64 0, 0
  %r119 = icmp eq i64 %r117, %r118
  store i1 %r119, ptr %local8
  br label %kira_label_38
kira_label_38:
  %r120 = load i1, ptr %local8
  store i1 %r120, ptr %local7
  br label %kira_label_35
kira_label_35:
  %r121 = load i1, ptr %local7
  br i1 %r121, label %kira_label_39, label %kira_label_40
kira_label_39:
  %r122 = load %kira.string, ptr @kira_str_10
  call void @"kira_fn_78_graphicsDiagnostic"(%kira.string %r122)
  br label %kira_label_41
kira_label_40:
  %r123 = load i64, ptr %local0
  %field.base.124 = inttoptr i64 %r123 to ptr
  %field.ptr.124 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.124, i32 0, i32 35
  %r124 = ptrtoint ptr %field.ptr.124 to i64
  %load.ptr.125 = inttoptr i64 %r124 to ptr
  %load.raw.125 = load i64, ptr %load.ptr.125
  %r125 = load i64, ptr %load.ptr.125
  %r126 = add i64 0, 0
  %r127 = icmp sgt i64 %r125, %r126
  br i1 %r127, label %kira_label_42, label %kira_label_43
kira_label_43:
  %r128 = add i1 0, 0
  store i1 %r128, ptr %local9
  br label %kira_label_44
kira_label_42:
  %r129 = load i64, ptr %local0
  %field.base.130 = inttoptr i64 %r129 to ptr
  %field.ptr.130 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.130, i32 0, i32 33
  %r130 = ptrtoint ptr %field.ptr.130 to i64
  %load.ptr.131 = inttoptr i64 %r130 to ptr
  %load.raw.131 = load i64, ptr %load.ptr.131
  %r131 = load i64, ptr %load.ptr.131
  %r132 = call i64 @"kira_fn_121_indexFormatUint32"()
  %r133 = icmp ne i64 %r131, %r132
  store i1 %r133, ptr %local9
  br label %kira_label_44
kira_label_44:
  %r134 = load i1, ptr %local9
  br i1 %r134, label %kira_label_45, label %kira_label_46
kira_label_45:
  %r135 = load %kira.string, ptr @kira_str_11
  call void @"kira_fn_78_graphicsDiagnostic"(%kira.string %r135)
  br label %kira_label_47
kira_label_46:
  %r136 = load i64, ptr %local0
  %field.base.137 = inttoptr i64 %r136 to ptr
  %field.ptr.137 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.137, i32 0, i32 27
  %r137 = ptrtoint ptr %field.ptr.137 to i64
  %load.ptr.138 = inttoptr i64 %r137 to ptr
  %load.raw.138 = load i32, ptr %load.ptr.138
  %r138 = sext i32 %load.raw.138 to i64
  %r139 = load i64, ptr %local0
  %field.base.140 = inttoptr i64 %r139 to ptr
  %field.ptr.140 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.140, i32 0, i32 29
  %r140 = ptrtoint ptr %field.ptr.140 to i64
  %load.ptr.141 = inttoptr i64 %r140 to ptr
  %load.raw.141 = load i32, ptr %load.ptr.141
  %r141 = sext i32 %load.raw.141 to i64
  %r142 = load i64, ptr %local0
  %field.base.143 = inttoptr i64 %r142 to ptr
  %field.ptr.143 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.143, i32 0, i32 30
  %r143 = ptrtoint ptr %field.ptr.143 to i64
  %load.ptr.144 = inttoptr i64 %r143 to ptr
  %load.raw.144 = load i8, ptr %load.ptr.144
  %r144 = trunc i8 %load.raw.144 to i1
  br i1 %r144, label %kira_label_48, label %kira_label_49
kira_label_48:
  %r145 = add i64 0, 1
  store i64 %r145, ptr %local10
  br label %kira_label_50
kira_label_49:
  %r146 = add i64 0, 0
  store i64 %r146, ptr %local10
  br label %kira_label_50
kira_label_50:
  %r147 = load i64, ptr %local10
  %r148 = load i64, ptr %local0
  %field.base.149 = inttoptr i64 %r148 to ptr
  %field.ptr.149 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.149, i32 0, i32 31
  %r149 = ptrtoint ptr %field.ptr.149 to i64
  %load.ptr.150 = inttoptr i64 %r149 to ptr
  %load.raw.150 = load i32, ptr %load.ptr.150
  %r150 = sext i32 %load.raw.150 to i64
  %r151 = load i64, ptr %local0
  %field.base.152 = inttoptr i64 %r151 to ptr
  %field.ptr.152 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.152, i32 0, i32 32
  %r152 = ptrtoint ptr %field.ptr.152 to i64
  %load.ptr.153 = inttoptr i64 %r152 to ptr
  %load.raw.153 = load i8, ptr %load.ptr.153
  %r153 = trunc i8 %load.raw.153 to i1
  br i1 %r153, label %kira_label_51, label %kira_label_52
kira_label_51:
  %r154 = add i64 0, 1
  store i64 %r154, ptr %local11
  br label %kira_label_53
kira_label_52:
  %r155 = add i64 0, 0
  store i64 %r155, ptr %local11
  br label %kira_label_53
kira_label_53:
  %r156 = load i64, ptr %local11
  %r157 = add i64 0, 0
  %r158 = add i64 0, 0
  %r159 = add i64 0, 0
  %r160 = add i64 0, 0
  %r161 = add i64 0, 0
  %r162 = add i64 0, 0
  %r163 = add i64 0, 0
  %r164 = add i64 0, 0
  %r165 = load i64, ptr %local0
  %field.base.166 = inttoptr i64 %r165 to ptr
  %field.ptr.166 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.166, i32 0, i32 34
  %r166 = ptrtoint ptr %field.ptr.166 to i64
  %load.ptr.167 = inttoptr i64 %r166 to ptr
  %load.raw.167 = load i64, ptr %load.ptr.167
  %r167 = load i64, ptr %load.ptr.167
  %r168 = load i64, ptr %local0
  %field.base.169 = inttoptr i64 %r168 to ptr
  %field.ptr.169 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.169, i32 0, i32 35
  %r169 = ptrtoint ptr %field.ptr.169 to i64
  %load.ptr.170 = inttoptr i64 %r169 to ptr
  %load.raw.170 = load i64, ptr %load.ptr.170
  %r170 = load i64, ptr %load.ptr.170
  %r171 = load i64, ptr %local0
  %field.base.172 = inttoptr i64 %r171 to ptr
  %field.ptr.172 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.172, i32 0, i32 36
  %r172 = ptrtoint ptr %field.ptr.172 to i64
  %load.ptr.173 = inttoptr i64 %r172 to ptr
  %load.raw.173 = load i64, ptr %load.ptr.173
  %r173 = load i64, ptr %load.ptr.173
  %r174 = call i1 @"kira_fn_66_sokolApplyPipelineBindingsAndDrawFlat"(i64 %r138, i64 %r141, i64 %r147, i64 %r150, i64 %r156, i64 %r157, i64 %r158, i64 %r159, i64 %r160, i64 %r161, i64 %r162, i64 %r163, i64 %r164, i64 %r167, i64 %r170, i64 %r173)
  %r175 = xor i1 %r174, true
  br i1 %r175, label %kira_label_54, label %kira_label_55
kira_label_54:
  %r176 = load %kira.string, ptr @kira_str_12
  call void @"kira_fn_78_graphicsDiagnostic"(%kira.string %r176)
  br label %kira_label_55
kira_label_55:
  br label %kira_label_47
kira_label_47:
  br label %kira_label_41
kira_label_41:
  br label %kira_label_32
kira_label_32:
  br label %kira_label_26
kira_label_26:
  br label %kira_label_20
kira_label_20:
  call void @"kira_fn_67_sokolEndPassAndCommitNative"()
  %r177 = load i64, ptr %local0
  %field.base.178 = inttoptr i64 %r177 to ptr
  %field.ptr.178 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.178, i32 0, i32 42
  %r178 = ptrtoint ptr %field.ptr.178 to i64
  %load.ptr.179 = inttoptr i64 %r178 to ptr
  %load.raw.179 = load i8, ptr %load.ptr.179
  %r179 = trunc i8 %load.raw.179 to i1
  br i1 %r179, label %kira_label_56, label %kira_label_57
kira_label_56:
  call void @"kira_fn_68_sokolRequestQuitNative"()
  br label %kira_label_57
kira_label_57:
  ret void
}

define i1 @"kira_fn_65_sokolBeginRenderPassFlat"(%kira.string %arg0, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, double %arg7, double %arg8, double %arg9, double %arg10, i64 %arg11, i64 %arg12, i64 %arg13, i64 %arg14, i64 %arg15, i64 %arg16, i64 %arg17, i64 %arg18, double %arg19, i64 %arg20, i64 %arg21, i64 %arg22, i64 %arg23, i64 %arg24, i64 %arg25, i64 %arg26) {
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

define i1 @"kira_fn_66_sokolApplyPipelineBindingsAndDrawFlat"(i64 %arg0, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7, i64 %arg8, i64 %arg9, i64 %arg10, i64 %arg11, i64 %arg12, i64 %arg13, i64 %arg14, i64 %arg15) {
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

define void @"kira_fn_67_sokolEndPassAndCommitNative"() {
entry:
  call void @"kg_end_pass_and_commit"()
  ret void
}

define void @"kira_fn_68_sokolRequestQuitNative"() {
entry:
  call void @"sapp_request_quit"()
  ret void
}

define void @"kira_fn_69_sokolLogSubmitState"(i64 %arg0, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7) {
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

define i64 @"kira_fn_70_sokolCreateRenderPipelineId"(i64 %arg0, %kira.string %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7, i64 %arg8, i64 %arg9, i64 %arg10, i64 %arg11, i64 %arg12, i64 %arg13, i64 %arg14, i64 %arg15, i64 %arg16, i64 %arg17, i64 %arg18, i64 %arg19, i64 %arg20, i64 %arg21, i64 %arg22, i64 %arg23, i64 %arg24, i64 %arg25, i64 %arg26) {
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

define i64 @"kira_fn_71_sokolCreateRenderPipeline"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.RenderPipelineDescriptor
  store %t.RenderPipelineDescriptor zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
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
  %local27 = alloca i64
  %local28 = alloca i64
  %local29 = alloca i64
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.5 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.5
  %cleanup.heap.slot.9 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.9
  %cleanup.heap.slot.28 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.28
  %cleanup.heap.slot.33 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.33
  %cleanup.heap.slot.36 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.36
  %cleanup.heap.slot.41 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.41
  %cleanup.heap.slot.44 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.44
  %cleanup.heap.slot.49 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.49
  %cleanup.heap.slot.55 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.55
  %cleanup.heap.slot.60 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.60
  %cleanup.heap.slot.63 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.63
  %cleanup.heap.slot.68 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.68
  %cleanup.heap.slot.71 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.71
  %cleanup.heap.slot.76 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.76
  %cleanup.heap.slot.82 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.82
  %cleanup.heap.slot.87 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.87
  %cleanup.heap.slot.90 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.90
  %cleanup.heap.slot.95 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.95
  %cleanup.heap.slot.98 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.98
  %cleanup.heap.slot.103 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.103
  %cleanup.heap.slot.109 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.109
  %cleanup.heap.slot.114 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.114
  %cleanup.heap.slot.117 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.117
  %cleanup.heap.slot.122 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.122
  %cleanup.heap.slot.125 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.125
  %cleanup.heap.slot.130 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.130
  %cleanup.heap.slot.133 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.133
  %cleanup.heap.slot.137 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.137
  %cleanup.heap.slot.140 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.140
  %cleanup.heap.slot.144 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.144
  %cleanup.heap.slot.151 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.151
  %cleanup.heap.slot.155 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.155
  %cleanup.heap.slot.159 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.159
  %cleanup.heap.slot.166 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.166
  %cleanup.heap.slot.173 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.173
  %cleanup.heap.slot.177 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.177
  %cleanup.heap.slot.181 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.181
  %cleanup.heap.slot.185 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.185
  %cleanup.heap.slot.189 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.189
  %cleanup.heap.slot.193 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.193
  %cleanup.heap.slot.198 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.198
  %cleanup.heap.slot.227 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.227
  %cleanup.heap.slot.228 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.228
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.1, i32 0, i32 2
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %field.base.2 = inttoptr i64 %r1 to ptr
  %field.ptr.2 = getelementptr inbounds %t.VertexLayout, ptr %field.base.2, i32 0, i32 1
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %load.ptr.3 = inttoptr i64 %r2 to ptr
  %load.arrayptr.3 = load ptr, ptr %load.ptr.3
  %r3 = ptrtoint ptr %load.arrayptr.3 to i64
  %array.ptr.4 = inttoptr i64 %r3 to ptr
  %r4 = call i64 @"kira_array_len"(ptr %array.ptr.4)
  store i64 %r4, ptr %local1
  %r5 = load i64, ptr %local0
  %field.base.6 = inttoptr i64 %r5 to ptr
  %field.ptr.6 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.6, i32 0, i32 3
  %r6 = ptrtoint ptr %field.ptr.6 to i64
  %load.ptr.7 = inttoptr i64 %r6 to ptr
  %load.arrayptr.7 = load ptr, ptr %load.ptr.7
  %r7 = ptrtoint ptr %load.arrayptr.7 to i64
  %array.ptr.8 = inttoptr i64 %r7 to ptr
  %r8 = call i64 @"kira_array_len"(ptr %array.ptr.8)
  store i64 %r8, ptr %local2
  %r9 = load i64, ptr %local0
  %field.base.10 = inttoptr i64 %r9 to ptr
  %field.ptr.10 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.10, i32 0, i32 2
  %r10 = ptrtoint ptr %field.ptr.10 to i64
  %field.base.11 = inttoptr i64 %r10 to ptr
  %field.ptr.11 = getelementptr inbounds %t.VertexLayout, ptr %field.base.11, i32 0, i32 0
  %r11 = ptrtoint ptr %field.ptr.11 to i64
  %load.ptr.12 = inttoptr i64 %r11 to ptr
  %load.raw.12 = load i64, ptr %load.ptr.12
  %r12 = load i64, ptr %load.ptr.12
  store i64 %r12, ptr %local3
  %r13 = add i64 0, 0
  store i64 %r13, ptr %local4
  %r14 = call i64 @"kira_fn_95_vertexFormatFloat2"()
  store i64 %r14, ptr %local5
  %r15 = add i64 0, 0
  store i64 %r15, ptr %local6
  %r16 = add i64 0, 1
  store i64 %r16, ptr %local7
  %r17 = call i64 @"kira_fn_95_vertexFormatFloat2"()
  store i64 %r17, ptr %local8
  %r18 = add i64 0, 0
  store i64 %r18, ptr %local9
  %r19 = add i64 0, 2
  store i64 %r19, ptr %local10
  %r20 = call i64 @"kira_fn_95_vertexFormatFloat2"()
  store i64 %r20, ptr %local11
  %r21 = add i64 0, 0
  store i64 %r21, ptr %local12
  %r22 = add i64 0, 3
  store i64 %r22, ptr %local13
  %r23 = call i64 @"kira_fn_95_vertexFormatFloat2"()
  store i64 %r23, ptr %local14
  %r24 = add i64 0, 0
  store i64 %r24, ptr %local15
  %r25 = load i64, ptr %local1
  %r26 = add i64 0, 0
  %r27 = icmp sgt i64 %r25, %r26
  br i1 %r27, label %kira_label_0, label %kira_label_1
kira_label_0:
  %r28 = load i64, ptr %local0
  %field.base.29 = inttoptr i64 %r28 to ptr
  %field.ptr.29 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.29, i32 0, i32 2
  %r29 = ptrtoint ptr %field.ptr.29 to i64
  %field.base.30 = inttoptr i64 %r29 to ptr
  %field.ptr.30 = getelementptr inbounds %t.VertexLayout, ptr %field.base.30, i32 0, i32 1
  %r30 = ptrtoint ptr %field.ptr.30 to i64
  %load.ptr.31 = inttoptr i64 %r30 to ptr
  %load.arrayptr.31 = load ptr, ptr %load.ptr.31
  %r31 = ptrtoint ptr %load.arrayptr.31 to i64
  %r32 = add i64 0, 0
  %array.get.ptr.33 = inttoptr i64 %r31 to ptr
  %array.get.val.ptr.0 = alloca %kira.bridge.value
  call void @"kira_array_load"(ptr %array.get.ptr.33, i64 %r32, ptr %array.get.val.ptr.0)
  %array.get.val.0 = load %kira.bridge.value, ptr %array.get.val.ptr.0
  %r33 = extractvalue %kira.bridge.value %array.get.val.0, 2
  %field.base.34 = inttoptr i64 %r33 to ptr
  %field.ptr.34 = getelementptr inbounds %t.VertexAttribute, ptr %field.base.34, i32 0, i32 1
  %r34 = ptrtoint ptr %field.ptr.34 to i64
  %load.ptr.35 = inttoptr i64 %r34 to ptr
  %load.raw.35 = load i64, ptr %load.ptr.35
  %r35 = load i64, ptr %load.ptr.35
  store i64 %r35, ptr %local4
  %r36 = load i64, ptr %local0
  %field.base.37 = inttoptr i64 %r36 to ptr
  %field.ptr.37 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.37, i32 0, i32 2
  %r37 = ptrtoint ptr %field.ptr.37 to i64
  %field.base.38 = inttoptr i64 %r37 to ptr
  %field.ptr.38 = getelementptr inbounds %t.VertexLayout, ptr %field.base.38, i32 0, i32 1
  %r38 = ptrtoint ptr %field.ptr.38 to i64
  %load.ptr.39 = inttoptr i64 %r38 to ptr
  %load.arrayptr.39 = load ptr, ptr %load.ptr.39
  %r39 = ptrtoint ptr %load.arrayptr.39 to i64
  %r40 = add i64 0, 0
  %array.get.ptr.41 = inttoptr i64 %r39 to ptr
  %array.get.val.ptr.1 = alloca %kira.bridge.value
  call void @"kira_array_load"(ptr %array.get.ptr.41, i64 %r40, ptr %array.get.val.ptr.1)
  %array.get.val.1 = load %kira.bridge.value, ptr %array.get.val.ptr.1
  %r41 = extractvalue %kira.bridge.value %array.get.val.1, 2
  %field.base.42 = inttoptr i64 %r41 to ptr
  %field.ptr.42 = getelementptr inbounds %t.VertexAttribute, ptr %field.base.42, i32 0, i32 2
  %r42 = ptrtoint ptr %field.ptr.42 to i64
  %load.ptr.43 = inttoptr i64 %r42 to ptr
  %load.raw.43 = load i64, ptr %load.ptr.43
  %r43 = load i64, ptr %load.ptr.43
  store i64 %r43, ptr %local5
  %r44 = load i64, ptr %local0
  %field.base.45 = inttoptr i64 %r44 to ptr
  %field.ptr.45 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.45, i32 0, i32 2
  %r45 = ptrtoint ptr %field.ptr.45 to i64
  %field.base.46 = inttoptr i64 %r45 to ptr
  %field.ptr.46 = getelementptr inbounds %t.VertexLayout, ptr %field.base.46, i32 0, i32 1
  %r46 = ptrtoint ptr %field.ptr.46 to i64
  %load.ptr.47 = inttoptr i64 %r46 to ptr
  %load.arrayptr.47 = load ptr, ptr %load.ptr.47
  %r47 = ptrtoint ptr %load.arrayptr.47 to i64
  %r48 = add i64 0, 0
  %array.get.ptr.49 = inttoptr i64 %r47 to ptr
  %array.get.val.ptr.2 = alloca %kira.bridge.value
  call void @"kira_array_load"(ptr %array.get.ptr.49, i64 %r48, ptr %array.get.val.ptr.2)
  %array.get.val.2 = load %kira.bridge.value, ptr %array.get.val.ptr.2
  %r49 = extractvalue %kira.bridge.value %array.get.val.2, 2
  %field.base.50 = inttoptr i64 %r49 to ptr
  %field.ptr.50 = getelementptr inbounds %t.VertexAttribute, ptr %field.base.50, i32 0, i32 3
  %r50 = ptrtoint ptr %field.ptr.50 to i64
  %load.ptr.51 = inttoptr i64 %r50 to ptr
  %load.raw.51 = load i64, ptr %load.ptr.51
  %r51 = load i64, ptr %load.ptr.51
  store i64 %r51, ptr %local6
  br label %kira_label_1
kira_label_1:
  %r52 = load i64, ptr %local1
  %r53 = add i64 0, 1
  %r54 = icmp sgt i64 %r52, %r53
  br i1 %r54, label %kira_label_2, label %kira_label_3
kira_label_2:
  %r55 = load i64, ptr %local0
  %field.base.56 = inttoptr i64 %r55 to ptr
  %field.ptr.56 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.56, i32 0, i32 2
  %r56 = ptrtoint ptr %field.ptr.56 to i64
  %field.base.57 = inttoptr i64 %r56 to ptr
  %field.ptr.57 = getelementptr inbounds %t.VertexLayout, ptr %field.base.57, i32 0, i32 1
  %r57 = ptrtoint ptr %field.ptr.57 to i64
  %load.ptr.58 = inttoptr i64 %r57 to ptr
  %load.arrayptr.58 = load ptr, ptr %load.ptr.58
  %r58 = ptrtoint ptr %load.arrayptr.58 to i64
  %r59 = add i64 0, 1
  %array.get.ptr.60 = inttoptr i64 %r58 to ptr
  %array.get.val.ptr.3 = alloca %kira.bridge.value
  call void @"kira_array_load"(ptr %array.get.ptr.60, i64 %r59, ptr %array.get.val.ptr.3)
  %array.get.val.3 = load %kira.bridge.value, ptr %array.get.val.ptr.3
  %r60 = extractvalue %kira.bridge.value %array.get.val.3, 2
  %field.base.61 = inttoptr i64 %r60 to ptr
  %field.ptr.61 = getelementptr inbounds %t.VertexAttribute, ptr %field.base.61, i32 0, i32 1
  %r61 = ptrtoint ptr %field.ptr.61 to i64
  %load.ptr.62 = inttoptr i64 %r61 to ptr
  %load.raw.62 = load i64, ptr %load.ptr.62
  %r62 = load i64, ptr %load.ptr.62
  store i64 %r62, ptr %local7
  %r63 = load i64, ptr %local0
  %field.base.64 = inttoptr i64 %r63 to ptr
  %field.ptr.64 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.64, i32 0, i32 2
  %r64 = ptrtoint ptr %field.ptr.64 to i64
  %field.base.65 = inttoptr i64 %r64 to ptr
  %field.ptr.65 = getelementptr inbounds %t.VertexLayout, ptr %field.base.65, i32 0, i32 1
  %r65 = ptrtoint ptr %field.ptr.65 to i64
  %load.ptr.66 = inttoptr i64 %r65 to ptr
  %load.arrayptr.66 = load ptr, ptr %load.ptr.66
  %r66 = ptrtoint ptr %load.arrayptr.66 to i64
  %r67 = add i64 0, 1
  %array.get.ptr.68 = inttoptr i64 %r66 to ptr
  %array.get.val.ptr.4 = alloca %kira.bridge.value
  call void @"kira_array_load"(ptr %array.get.ptr.68, i64 %r67, ptr %array.get.val.ptr.4)
  %array.get.val.4 = load %kira.bridge.value, ptr %array.get.val.ptr.4
  %r68 = extractvalue %kira.bridge.value %array.get.val.4, 2
  %field.base.69 = inttoptr i64 %r68 to ptr
  %field.ptr.69 = getelementptr inbounds %t.VertexAttribute, ptr %field.base.69, i32 0, i32 2
  %r69 = ptrtoint ptr %field.ptr.69 to i64
  %load.ptr.70 = inttoptr i64 %r69 to ptr
  %load.raw.70 = load i64, ptr %load.ptr.70
  %r70 = load i64, ptr %load.ptr.70
  store i64 %r70, ptr %local8
  %r71 = load i64, ptr %local0
  %field.base.72 = inttoptr i64 %r71 to ptr
  %field.ptr.72 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.72, i32 0, i32 2
  %r72 = ptrtoint ptr %field.ptr.72 to i64
  %field.base.73 = inttoptr i64 %r72 to ptr
  %field.ptr.73 = getelementptr inbounds %t.VertexLayout, ptr %field.base.73, i32 0, i32 1
  %r73 = ptrtoint ptr %field.ptr.73 to i64
  %load.ptr.74 = inttoptr i64 %r73 to ptr
  %load.arrayptr.74 = load ptr, ptr %load.ptr.74
  %r74 = ptrtoint ptr %load.arrayptr.74 to i64
  %r75 = add i64 0, 1
  %array.get.ptr.76 = inttoptr i64 %r74 to ptr
  %array.get.val.ptr.5 = alloca %kira.bridge.value
  call void @"kira_array_load"(ptr %array.get.ptr.76, i64 %r75, ptr %array.get.val.ptr.5)
  %array.get.val.5 = load %kira.bridge.value, ptr %array.get.val.ptr.5
  %r76 = extractvalue %kira.bridge.value %array.get.val.5, 2
  %field.base.77 = inttoptr i64 %r76 to ptr
  %field.ptr.77 = getelementptr inbounds %t.VertexAttribute, ptr %field.base.77, i32 0, i32 3
  %r77 = ptrtoint ptr %field.ptr.77 to i64
  %load.ptr.78 = inttoptr i64 %r77 to ptr
  %load.raw.78 = load i64, ptr %load.ptr.78
  %r78 = load i64, ptr %load.ptr.78
  store i64 %r78, ptr %local9
  br label %kira_label_3
kira_label_3:
  %r79 = load i64, ptr %local1
  %r80 = add i64 0, 2
  %r81 = icmp sgt i64 %r79, %r80
  br i1 %r81, label %kira_label_4, label %kira_label_5
kira_label_4:
  %r82 = load i64, ptr %local0
  %field.base.83 = inttoptr i64 %r82 to ptr
  %field.ptr.83 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.83, i32 0, i32 2
  %r83 = ptrtoint ptr %field.ptr.83 to i64
  %field.base.84 = inttoptr i64 %r83 to ptr
  %field.ptr.84 = getelementptr inbounds %t.VertexLayout, ptr %field.base.84, i32 0, i32 1
  %r84 = ptrtoint ptr %field.ptr.84 to i64
  %load.ptr.85 = inttoptr i64 %r84 to ptr
  %load.arrayptr.85 = load ptr, ptr %load.ptr.85
  %r85 = ptrtoint ptr %load.arrayptr.85 to i64
  %r86 = add i64 0, 2
  %array.get.ptr.87 = inttoptr i64 %r85 to ptr
  %array.get.val.ptr.6 = alloca %kira.bridge.value
  call void @"kira_array_load"(ptr %array.get.ptr.87, i64 %r86, ptr %array.get.val.ptr.6)
  %array.get.val.6 = load %kira.bridge.value, ptr %array.get.val.ptr.6
  %r87 = extractvalue %kira.bridge.value %array.get.val.6, 2
  %field.base.88 = inttoptr i64 %r87 to ptr
  %field.ptr.88 = getelementptr inbounds %t.VertexAttribute, ptr %field.base.88, i32 0, i32 1
  %r88 = ptrtoint ptr %field.ptr.88 to i64
  %load.ptr.89 = inttoptr i64 %r88 to ptr
  %load.raw.89 = load i64, ptr %load.ptr.89
  %r89 = load i64, ptr %load.ptr.89
  store i64 %r89, ptr %local10
  %r90 = load i64, ptr %local0
  %field.base.91 = inttoptr i64 %r90 to ptr
  %field.ptr.91 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.91, i32 0, i32 2
  %r91 = ptrtoint ptr %field.ptr.91 to i64
  %field.base.92 = inttoptr i64 %r91 to ptr
  %field.ptr.92 = getelementptr inbounds %t.VertexLayout, ptr %field.base.92, i32 0, i32 1
  %r92 = ptrtoint ptr %field.ptr.92 to i64
  %load.ptr.93 = inttoptr i64 %r92 to ptr
  %load.arrayptr.93 = load ptr, ptr %load.ptr.93
  %r93 = ptrtoint ptr %load.arrayptr.93 to i64
  %r94 = add i64 0, 2
  %array.get.ptr.95 = inttoptr i64 %r93 to ptr
  %array.get.val.ptr.7 = alloca %kira.bridge.value
  call void @"kira_array_load"(ptr %array.get.ptr.95, i64 %r94, ptr %array.get.val.ptr.7)
  %array.get.val.7 = load %kira.bridge.value, ptr %array.get.val.ptr.7
  %r95 = extractvalue %kira.bridge.value %array.get.val.7, 2
  %field.base.96 = inttoptr i64 %r95 to ptr
  %field.ptr.96 = getelementptr inbounds %t.VertexAttribute, ptr %field.base.96, i32 0, i32 2
  %r96 = ptrtoint ptr %field.ptr.96 to i64
  %load.ptr.97 = inttoptr i64 %r96 to ptr
  %load.raw.97 = load i64, ptr %load.ptr.97
  %r97 = load i64, ptr %load.ptr.97
  store i64 %r97, ptr %local11
  %r98 = load i64, ptr %local0
  %field.base.99 = inttoptr i64 %r98 to ptr
  %field.ptr.99 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.99, i32 0, i32 2
  %r99 = ptrtoint ptr %field.ptr.99 to i64
  %field.base.100 = inttoptr i64 %r99 to ptr
  %field.ptr.100 = getelementptr inbounds %t.VertexLayout, ptr %field.base.100, i32 0, i32 1
  %r100 = ptrtoint ptr %field.ptr.100 to i64
  %load.ptr.101 = inttoptr i64 %r100 to ptr
  %load.arrayptr.101 = load ptr, ptr %load.ptr.101
  %r101 = ptrtoint ptr %load.arrayptr.101 to i64
  %r102 = add i64 0, 2
  %array.get.ptr.103 = inttoptr i64 %r101 to ptr
  %array.get.val.ptr.8 = alloca %kira.bridge.value
  call void @"kira_array_load"(ptr %array.get.ptr.103, i64 %r102, ptr %array.get.val.ptr.8)
  %array.get.val.8 = load %kira.bridge.value, ptr %array.get.val.ptr.8
  %r103 = extractvalue %kira.bridge.value %array.get.val.8, 2
  %field.base.104 = inttoptr i64 %r103 to ptr
  %field.ptr.104 = getelementptr inbounds %t.VertexAttribute, ptr %field.base.104, i32 0, i32 3
  %r104 = ptrtoint ptr %field.ptr.104 to i64
  %load.ptr.105 = inttoptr i64 %r104 to ptr
  %load.raw.105 = load i64, ptr %load.ptr.105
  %r105 = load i64, ptr %load.ptr.105
  store i64 %r105, ptr %local12
  br label %kira_label_5
kira_label_5:
  %r106 = load i64, ptr %local1
  %r107 = add i64 0, 3
  %r108 = icmp sgt i64 %r106, %r107
  br i1 %r108, label %kira_label_6, label %kira_label_7
kira_label_6:
  %r109 = load i64, ptr %local0
  %field.base.110 = inttoptr i64 %r109 to ptr
  %field.ptr.110 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.110, i32 0, i32 2
  %r110 = ptrtoint ptr %field.ptr.110 to i64
  %field.base.111 = inttoptr i64 %r110 to ptr
  %field.ptr.111 = getelementptr inbounds %t.VertexLayout, ptr %field.base.111, i32 0, i32 1
  %r111 = ptrtoint ptr %field.ptr.111 to i64
  %load.ptr.112 = inttoptr i64 %r111 to ptr
  %load.arrayptr.112 = load ptr, ptr %load.ptr.112
  %r112 = ptrtoint ptr %load.arrayptr.112 to i64
  %r113 = add i64 0, 3
  %array.get.ptr.114 = inttoptr i64 %r112 to ptr
  %array.get.val.ptr.9 = alloca %kira.bridge.value
  call void @"kira_array_load"(ptr %array.get.ptr.114, i64 %r113, ptr %array.get.val.ptr.9)
  %array.get.val.9 = load %kira.bridge.value, ptr %array.get.val.ptr.9
  %r114 = extractvalue %kira.bridge.value %array.get.val.9, 2
  %field.base.115 = inttoptr i64 %r114 to ptr
  %field.ptr.115 = getelementptr inbounds %t.VertexAttribute, ptr %field.base.115, i32 0, i32 1
  %r115 = ptrtoint ptr %field.ptr.115 to i64
  %load.ptr.116 = inttoptr i64 %r115 to ptr
  %load.raw.116 = load i64, ptr %load.ptr.116
  %r116 = load i64, ptr %load.ptr.116
  store i64 %r116, ptr %local13
  %r117 = load i64, ptr %local0
  %field.base.118 = inttoptr i64 %r117 to ptr
  %field.ptr.118 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.118, i32 0, i32 2
  %r118 = ptrtoint ptr %field.ptr.118 to i64
  %field.base.119 = inttoptr i64 %r118 to ptr
  %field.ptr.119 = getelementptr inbounds %t.VertexLayout, ptr %field.base.119, i32 0, i32 1
  %r119 = ptrtoint ptr %field.ptr.119 to i64
  %load.ptr.120 = inttoptr i64 %r119 to ptr
  %load.arrayptr.120 = load ptr, ptr %load.ptr.120
  %r120 = ptrtoint ptr %load.arrayptr.120 to i64
  %r121 = add i64 0, 3
  %array.get.ptr.122 = inttoptr i64 %r120 to ptr
  %array.get.val.ptr.10 = alloca %kira.bridge.value
  call void @"kira_array_load"(ptr %array.get.ptr.122, i64 %r121, ptr %array.get.val.ptr.10)
  %array.get.val.10 = load %kira.bridge.value, ptr %array.get.val.ptr.10
  %r122 = extractvalue %kira.bridge.value %array.get.val.10, 2
  %field.base.123 = inttoptr i64 %r122 to ptr
  %field.ptr.123 = getelementptr inbounds %t.VertexAttribute, ptr %field.base.123, i32 0, i32 2
  %r123 = ptrtoint ptr %field.ptr.123 to i64
  %load.ptr.124 = inttoptr i64 %r123 to ptr
  %load.raw.124 = load i64, ptr %load.ptr.124
  %r124 = load i64, ptr %load.ptr.124
  store i64 %r124, ptr %local14
  %r125 = load i64, ptr %local0
  %field.base.126 = inttoptr i64 %r125 to ptr
  %field.ptr.126 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.126, i32 0, i32 2
  %r126 = ptrtoint ptr %field.ptr.126 to i64
  %field.base.127 = inttoptr i64 %r126 to ptr
  %field.ptr.127 = getelementptr inbounds %t.VertexLayout, ptr %field.base.127, i32 0, i32 1
  %r127 = ptrtoint ptr %field.ptr.127 to i64
  %load.ptr.128 = inttoptr i64 %r127 to ptr
  %load.arrayptr.128 = load ptr, ptr %load.ptr.128
  %r128 = ptrtoint ptr %load.arrayptr.128 to i64
  %r129 = add i64 0, 3
  %array.get.ptr.130 = inttoptr i64 %r128 to ptr
  %array.get.val.ptr.11 = alloca %kira.bridge.value
  call void @"kira_array_load"(ptr %array.get.ptr.130, i64 %r129, ptr %array.get.val.ptr.11)
  %array.get.val.11 = load %kira.bridge.value, ptr %array.get.val.ptr.11
  %r130 = extractvalue %kira.bridge.value %array.get.val.11, 2
  %field.base.131 = inttoptr i64 %r130 to ptr
  %field.ptr.131 = getelementptr inbounds %t.VertexAttribute, ptr %field.base.131, i32 0, i32 3
  %r131 = ptrtoint ptr %field.ptr.131 to i64
  %load.ptr.132 = inttoptr i64 %r131 to ptr
  %load.raw.132 = load i64, ptr %load.ptr.132
  %r132 = load i64, ptr %load.ptr.132
  store i64 %r132, ptr %local15
  br label %kira_label_7
kira_label_7:
  %r133 = load i64, ptr %local0
  %field.base.134 = inttoptr i64 %r133 to ptr
  %field.ptr.134 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.134, i32 0, i32 3
  %r134 = ptrtoint ptr %field.ptr.134 to i64
  %load.ptr.135 = inttoptr i64 %r134 to ptr
  %load.arrayptr.135 = load ptr, ptr %load.ptr.135
  %r135 = ptrtoint ptr %load.arrayptr.135 to i64
  %r136 = add i64 0, 0
  %array.get.ptr.137 = inttoptr i64 %r135 to ptr
  %array.get.val.ptr.12 = alloca %kira.bridge.value
  call void @"kira_array_load"(ptr %array.get.ptr.137, i64 %r136, ptr %array.get.val.ptr.12)
  %array.get.val.12 = load %kira.bridge.value, ptr %array.get.val.ptr.12
  %r137 = extractvalue %kira.bridge.value %array.get.val.12, 2
  %field.base.138 = inttoptr i64 %r137 to ptr
  %field.ptr.138 = getelementptr inbounds %t.ColorTargetDescriptor, ptr %field.base.138, i32 0, i32 0
  %r138 = ptrtoint ptr %field.ptr.138 to i64
  %load.ptr.139 = inttoptr i64 %r138 to ptr
  %load.raw.139 = load i64, ptr %load.ptr.139
  %r139 = load i64, ptr %load.ptr.139
  store i64 %r139, ptr %local16
  %r140 = load i64, ptr %local0
  %field.base.141 = inttoptr i64 %r140 to ptr
  %field.ptr.141 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.141, i32 0, i32 3
  %r141 = ptrtoint ptr %field.ptr.141 to i64
  %load.ptr.142 = inttoptr i64 %r141 to ptr
  %load.arrayptr.142 = load ptr, ptr %load.ptr.142
  %r142 = ptrtoint ptr %load.arrayptr.142 to i64
  %r143 = add i64 0, 0
  %array.get.ptr.144 = inttoptr i64 %r142 to ptr
  %array.get.val.ptr.13 = alloca %kira.bridge.value
  call void @"kira_array_load"(ptr %array.get.ptr.144, i64 %r143, ptr %array.get.val.ptr.13)
  %array.get.val.13 = load %kira.bridge.value, ptr %array.get.val.ptr.13
  %r144 = extractvalue %kira.bridge.value %array.get.val.13, 2
  %field.base.145 = inttoptr i64 %r144 to ptr
  %field.ptr.145 = getelementptr inbounds %t.ColorTargetDescriptor, ptr %field.base.145, i32 0, i32 1
  %r145 = ptrtoint ptr %field.ptr.145 to i64
  %field.base.146 = inttoptr i64 %r145 to ptr
  %field.ptr.146 = getelementptr inbounds %t.BlendState, ptr %field.base.146, i32 0, i32 0
  %r146 = ptrtoint ptr %field.ptr.146 to i64
  %load.ptr.147 = inttoptr i64 %r146 to ptr
  %load.raw.147 = load i8, ptr %load.ptr.147
  %r147 = trunc i8 %load.raw.147 to i1
  br i1 %r147, label %kira_label_8, label %kira_label_9
kira_label_8:
  %r148 = add i64 0, 1
  store i64 %r148, ptr %local27
  br label %kira_label_10
kira_label_9:
  %r149 = add i64 0, 0
  store i64 %r149, ptr %local27
  br label %kira_label_10
kira_label_10:
  %r150 = load i64, ptr %local27
  store i64 %r150, ptr %local17
  %r151 = load i64, ptr %local0
  %field.base.152 = inttoptr i64 %r151 to ptr
  %field.ptr.152 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.152, i32 0, i32 3
  %r152 = ptrtoint ptr %field.ptr.152 to i64
  %load.ptr.153 = inttoptr i64 %r152 to ptr
  %load.arrayptr.153 = load ptr, ptr %load.ptr.153
  %r153 = ptrtoint ptr %load.arrayptr.153 to i64
  %r154 = add i64 0, 0
  %array.get.ptr.155 = inttoptr i64 %r153 to ptr
  %array.get.val.ptr.14 = alloca %kira.bridge.value
  call void @"kira_array_load"(ptr %array.get.ptr.155, i64 %r154, ptr %array.get.val.ptr.14)
  %array.get.val.14 = load %kira.bridge.value, ptr %array.get.val.ptr.14
  %r155 = extractvalue %kira.bridge.value %array.get.val.14, 2
  %field.base.156 = inttoptr i64 %r155 to ptr
  %field.ptr.156 = getelementptr inbounds %t.ColorTargetDescriptor, ptr %field.base.156, i32 0, i32 1
  %r156 = ptrtoint ptr %field.ptr.156 to i64
  %field.base.157 = inttoptr i64 %r156 to ptr
  %field.ptr.157 = getelementptr inbounds %t.BlendState, ptr %field.base.157, i32 0, i32 1
  %r157 = ptrtoint ptr %field.ptr.157 to i64
  %load.ptr.158 = inttoptr i64 %r157 to ptr
  %load.raw.158 = load i64, ptr %load.ptr.158
  %r158 = load i64, ptr %load.ptr.158
  store i64 %r158, ptr %local18
  %r159 = load i64, ptr %local0
  %field.base.160 = inttoptr i64 %r159 to ptr
  %field.ptr.160 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.160, i32 0, i32 4
  %r160 = ptrtoint ptr %field.ptr.160 to i64
  %field.base.161 = inttoptr i64 %r160 to ptr
  %field.ptr.161 = getelementptr inbounds %t.DepthStencilDescriptor, ptr %field.base.161, i32 0, i32 0
  %r161 = ptrtoint ptr %field.ptr.161 to i64
  %load.ptr.162 = inttoptr i64 %r161 to ptr
  %load.raw.162 = load i8, ptr %load.ptr.162
  %r162 = trunc i8 %load.raw.162 to i1
  br i1 %r162, label %kira_label_11, label %kira_label_12
kira_label_11:
  %r163 = add i64 0, 1
  store i64 %r163, ptr %local28
  br label %kira_label_13
kira_label_12:
  %r164 = add i64 0, 0
  store i64 %r164, ptr %local28
  br label %kira_label_13
kira_label_13:
  %r165 = load i64, ptr %local28
  store i64 %r165, ptr %local19
  %r166 = load i64, ptr %local0
  %field.base.167 = inttoptr i64 %r166 to ptr
  %field.ptr.167 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.167, i32 0, i32 4
  %r167 = ptrtoint ptr %field.ptr.167 to i64
  %field.base.168 = inttoptr i64 %r167 to ptr
  %field.ptr.168 = getelementptr inbounds %t.DepthStencilDescriptor, ptr %field.base.168, i32 0, i32 1
  %r168 = ptrtoint ptr %field.ptr.168 to i64
  %load.ptr.169 = inttoptr i64 %r168 to ptr
  %load.raw.169 = load i8, ptr %load.ptr.169
  %r169 = trunc i8 %load.raw.169 to i1
  br i1 %r169, label %kira_label_14, label %kira_label_15
kira_label_14:
  %r170 = add i64 0, 1
  store i64 %r170, ptr %local29
  br label %kira_label_16
kira_label_15:
  %r171 = add i64 0, 0
  store i64 %r171, ptr %local29
  br label %kira_label_16
kira_label_16:
  %r172 = load i64, ptr %local29
  store i64 %r172, ptr %local20
  %r173 = load i64, ptr %local0
  %field.base.174 = inttoptr i64 %r173 to ptr
  %field.ptr.174 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.174, i32 0, i32 4
  %r174 = ptrtoint ptr %field.ptr.174 to i64
  %field.base.175 = inttoptr i64 %r174 to ptr
  %field.ptr.175 = getelementptr inbounds %t.DepthStencilDescriptor, ptr %field.base.175, i32 0, i32 2
  %r175 = ptrtoint ptr %field.ptr.175 to i64
  %load.ptr.176 = inttoptr i64 %r175 to ptr
  %load.raw.176 = load i64, ptr %load.ptr.176
  %r176 = load i64, ptr %load.ptr.176
  store i64 %r176, ptr %local21
  %r177 = load i64, ptr %local0
  %field.base.178 = inttoptr i64 %r177 to ptr
  %field.ptr.178 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.178, i32 0, i32 4
  %r178 = ptrtoint ptr %field.ptr.178 to i64
  %field.base.179 = inttoptr i64 %r178 to ptr
  %field.ptr.179 = getelementptr inbounds %t.DepthStencilDescriptor, ptr %field.base.179, i32 0, i32 3
  %r179 = ptrtoint ptr %field.ptr.179 to i64
  %load.ptr.180 = inttoptr i64 %r179 to ptr
  %load.raw.180 = load i64, ptr %load.ptr.180
  %r180 = load i64, ptr %load.ptr.180
  store i64 %r180, ptr %local22
  %r181 = load i64, ptr %local0
  %field.base.182 = inttoptr i64 %r181 to ptr
  %field.ptr.182 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.182, i32 0, i32 5
  %r182 = ptrtoint ptr %field.ptr.182 to i64
  %field.base.183 = inttoptr i64 %r182 to ptr
  %field.ptr.183 = getelementptr inbounds %t.RasterizationDescriptor, ptr %field.base.183, i32 0, i32 0
  %r183 = ptrtoint ptr %field.ptr.183 to i64
  %load.ptr.184 = inttoptr i64 %r183 to ptr
  %load.raw.184 = load i64, ptr %load.ptr.184
  %r184 = load i64, ptr %load.ptr.184
  store i64 %r184, ptr %local23
  %r185 = load i64, ptr %local0
  %field.base.186 = inttoptr i64 %r185 to ptr
  %field.ptr.186 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.186, i32 0, i32 5
  %r186 = ptrtoint ptr %field.ptr.186 to i64
  %field.base.187 = inttoptr i64 %r186 to ptr
  %field.ptr.187 = getelementptr inbounds %t.RasterizationDescriptor, ptr %field.base.187, i32 0, i32 1
  %r187 = ptrtoint ptr %field.ptr.187 to i64
  %load.ptr.188 = inttoptr i64 %r187 to ptr
  %load.raw.188 = load i64, ptr %load.ptr.188
  %r188 = load i64, ptr %load.ptr.188
  store i64 %r188, ptr %local24
  %r189 = load i64, ptr %local0
  %field.base.190 = inttoptr i64 %r189 to ptr
  %field.ptr.190 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.190, i32 0, i32 6
  %r190 = ptrtoint ptr %field.ptr.190 to i64
  %field.base.191 = inttoptr i64 %r190 to ptr
  %field.ptr.191 = getelementptr inbounds %t.PrimitiveDescriptor, ptr %field.base.191, i32 0, i32 0
  %r191 = ptrtoint ptr %field.ptr.191 to i64
  %load.ptr.192 = inttoptr i64 %r191 to ptr
  %load.raw.192 = load i64, ptr %load.ptr.192
  %r192 = load i64, ptr %load.ptr.192
  store i64 %r192, ptr %local25
  %r193 = load i64, ptr %local0
  %field.base.194 = inttoptr i64 %r193 to ptr
  %field.ptr.194 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.194, i32 0, i32 1
  %r194 = ptrtoint ptr %field.ptr.194 to i64
  %field.base.195 = inttoptr i64 %r194 to ptr
  %field.ptr.195 = getelementptr inbounds %t.GraphicsShader, ptr %field.base.195, i32 0, i32 0
  %r195 = ptrtoint ptr %field.ptr.195 to i64
  %field.base.196 = inttoptr i64 %r195 to ptr
  %field.ptr.196 = getelementptr inbounds %t.BackendShaderHandle, ptr %field.base.196, i32 0, i32 0
  %r196 = ptrtoint ptr %field.ptr.196 to i64
  %load.ptr.197 = inttoptr i64 %r196 to ptr
  %load.raw.197 = load i32, ptr %load.ptr.197
  %r197 = sext i32 %load.raw.197 to i64
  %r198 = load i64, ptr %local0
  %field.base.199 = inttoptr i64 %r198 to ptr
  %field.ptr.199 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.199, i32 0, i32 0
  %r199 = ptrtoint ptr %field.ptr.199 to i64
  %load.ptr.200 = inttoptr i64 %r199 to ptr
  %r200 = load %kira.string, ptr %load.ptr.200
  %r201 = load i64, ptr %local3
  %r202 = load i64, ptr %local1
  %r203 = load i64, ptr %local4
  %r204 = load i64, ptr %local5
  %r205 = load i64, ptr %local6
  %r206 = load i64, ptr %local7
  %r207 = load i64, ptr %local8
  %r208 = load i64, ptr %local9
  %r209 = load i64, ptr %local10
  %r210 = load i64, ptr %local11
  %r211 = load i64, ptr %local12
  %r212 = load i64, ptr %local13
  %r213 = load i64, ptr %local14
  %r214 = load i64, ptr %local15
  %r215 = load i64, ptr %local2
  %r216 = load i64, ptr %local16
  %r217 = load i64, ptr %local17
  %r218 = load i64, ptr %local18
  %r219 = load i64, ptr %local19
  %r220 = load i64, ptr %local20
  %r221 = load i64, ptr %local21
  %r222 = load i64, ptr %local22
  %r223 = load i64, ptr %local23
  %r224 = load i64, ptr %local24
  %r225 = load i64, ptr %local25
  %r226 = call i64 @"kira_fn_70_sokolCreateRenderPipelineId"(i64 %r197, %kira.string %r200, i64 %r201, i64 %r202, i64 %r203, i64 %r204, i64 %r205, i64 %r206, i64 %r207, i64 %r208, i64 %r209, i64 %r210, i64 %r211, i64 %r212, i64 %r213, i64 %r214, i64 %r215, i64 %r216, i64 %r217, i64 %r218, i64 %r219, i64 %r220, i64 %r221, i64 %r222, i64 %r223, i64 %r224, i64 %r225)
  store i64 %r226, ptr %local26
  %alloc.size.ptr.227 = getelementptr %t.RenderPipeline, ptr null, i32 1
  %alloc.size.227 = ptrtoint ptr %alloc.size.ptr.227 to i64
  %alloc.empty.227 = icmp eq i64 %alloc.size.227, 0
  %alloc.bytes.227 = select i1 %alloc.empty.227, i64 1, i64 %alloc.size.227
  %alloc.ptr.227 = call ptr @malloc(i64 %alloc.bytes.227)
  store %t.RenderPipeline zeroinitializer, ptr %alloc.ptr.227
  %r227 = ptrtoint ptr %alloc.ptr.227 to i64
  store ptr %alloc.ptr.227, ptr %cleanup.heap.slot.227
  %alloc.size.ptr.228 = getelementptr %t.BackendPipelineHandle, ptr null, i32 1
  %alloc.size.228 = ptrtoint ptr %alloc.size.ptr.228 to i64
  %alloc.empty.228 = icmp eq i64 %alloc.size.228, 0
  %alloc.bytes.228 = select i1 %alloc.empty.228, i64 1, i64 %alloc.size.228
  %alloc.ptr.228 = call ptr @malloc(i64 %alloc.bytes.228)
  store %t.BackendPipelineHandle zeroinitializer, ptr %alloc.ptr.228
  %r228 = ptrtoint ptr %alloc.ptr.228 to i64
  store ptr %alloc.ptr.228, ptr %cleanup.heap.slot.228
  %r229 = load i64, ptr %local26
  %field.base.230 = inttoptr i64 %r228 to ptr
  %field.ptr.230 = getelementptr inbounds %t.BackendPipelineHandle, ptr %field.base.230, i32 0, i32 0
  %r230 = ptrtoint ptr %field.ptr.230 to i64
  %store.ptr.229 = inttoptr i64 %r230 to ptr
  %store.cast.229 = trunc i64 %r229 to i32
  store i32 %store.cast.229, ptr %store.ptr.229
  %field.base.231 = inttoptr i64 %r227 to ptr
  %field.ptr.231 = getelementptr inbounds %t.RenderPipeline, ptr %field.base.231, i32 0, i32 0
  %r231 = ptrtoint ptr %field.ptr.231 to i64
  %copy.dst.231 = inttoptr i64 %r231 to ptr
  %copy.src.228 = inttoptr i64 %r228 to ptr
  %copy.val.231 = load %t.BackendPipelineHandle, ptr %copy.src.228
  store %t.BackendPipelineHandle %copy.val.231, ptr %copy.dst.231
  %r232 = load i64, ptr %local26
  %field.base.233 = inttoptr i64 %r227 to ptr
  %field.ptr.233 = getelementptr inbounds %t.RenderPipeline, ptr %field.base.233, i32 0, i32 1
  %r233 = ptrtoint ptr %field.ptr.233 to i64
  %store.ptr.232 = inttoptr i64 %r233 to ptr
  %store.cast.232 = trunc i64 %r232 to i32
  store i32 %store.cast.232, ptr %store.ptr.232
  %cleanup.heap.ptr.15 = load ptr, ptr %cleanup.heap.slot.228
  call void @free(ptr %cleanup.heap.ptr.15)
  ret i64 %r227
}

define void @"kira_fn_72_sokolDestroyRenderPipelineId"(i64 %arg0) {
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

define i64 @"kira_fn_73_sokolCreateShaderId"(%kira.string %arg0, %kira.string %arg1, %kira.string %arg2, %kira.string %arg3, %kira.string %arg4) {
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

define i64 @"kira_fn_74_sokolCreateShaderFromKslId"(%kira.string %arg0, %kira.string %arg1, %kira.string %arg2) {
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

define void @"kira_fn_75_sokolDestroyShaderId"(i64 %arg0) {
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

define i64 @"kira_fn_76_sokolCreateTextureId"(%kira.string %arg0, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6) {
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

define void @"kira_fn_77_sokolDestroyTextureId"(i64 %arg0) {
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

define void @"kira_fn_78_graphicsDiagnostic"(%kira.string %arg0) {
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

define void @"kira_fn_79_graphicsSubmitFrame"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.GraphicsFrame
  store %t.GraphicsFrame zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  call void @"kira_fn_64_sokolSubmitFrame"(i64 %r0)
  ret void
}

define void @"kira_fn_80_graphicsRuntimeRun"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.GraphicsApplication
  store %t.GraphicsApplication zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local2 = alloca i64
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.1 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.1
  %cleanup.heap.slot.8 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.8
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %alloc.size.ptr.0 = getelementptr %t.GraphicsAppRuntimeState, ptr null, i32 1
  %alloc.size.0 = ptrtoint ptr %alloc.size.ptr.0 to i64
  %alloc.empty.0 = icmp eq i64 %alloc.size.0, 0
  %alloc.bytes.0 = select i1 %alloc.empty.0, i64 1, i64 %alloc.size.0
  %alloc.ptr.0 = call ptr @malloc(i64 %alloc.bytes.0)
  store %t.GraphicsAppRuntimeState zeroinitializer, ptr %alloc.ptr.0
  %r0 = ptrtoint ptr %alloc.ptr.0 to i64
  store ptr %alloc.ptr.0, ptr %cleanup.heap.slot.0
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
  %native.state.size.ptr.7 = getelementptr [3 x %kira.bridge.value], ptr null, i32 1
  %native.state.size.7 = ptrtoint ptr %native.state.size.ptr.7 to i64
  %native.state.box.7 = call ptr @"kira_native_state_alloc"(i64 7551196454525180470, i64 %native.state.size.7)
  %native.state.payload.7 = call ptr @"kira_native_state_payload"(ptr %native.state.box.7)
  %native.state.src.7 = inttoptr i64 %r0 to ptr
  %native.state.src.field.ptr.7.0 = getelementptr inbounds %t.GraphicsAppRuntimeState, ptr %native.state.src.7, i32 0, i32 0
  %native.state.slot.ptr.7.0 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.7, i64 0
  %native.state.pack.7.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %native.state.load.struct.7.0 = load %t.GraphicsApplication, ptr %native.state.src.field.ptr.7.0
  %native.state.load.struct.size.ptr.7.0 = getelementptr %t.GraphicsApplication, ptr null, i32 1
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
  call void @"kira_fn_8_sokolRunApplication"(i64 %r8, i64 %r9)
  %cleanup.heap.ptr.0 = load ptr, ptr %cleanup.heap.slot.0
  call void @free(ptr %cleanup.heap.ptr.0)
  ret void
}

define i64 @"kira_fn_85_emptyGraphicsBuffer"() {
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

define i64 @"kira_fn_89_bufferUsageVertex"() {
entry:
  %r0 = add i64 0, 1
  ret i64 %r0
}

define i64 @"kira_fn_95_vertexFormatFloat2"() {
entry:
  %r0 = add i64 0, 1
  ret i64 %r0
}

define i64 @"kira_fn_98_textureFormatRgba8Unorm"() {
entry:
  %r0 = add i64 0, 1
  ret i64 %r0
}

define i64 @"kira_fn_100_textureFormatDepth24Stencil8"() {
entry:
  %r0 = add i64 0, 3
  ret i64 %r0
}

define i64 @"kira_fn_101_primitiveTopologyTriangleList"() {
entry:
  %r0 = add i64 0, 1
  ret i64 %r0
}

define i64 @"kira_fn_104_blendPresetReplace"() {
entry:
  %r0 = add i64 0, 1
  ret i64 %r0
}

define i64 @"kira_fn_114_compareFunctionAlways"() {
entry:
  %r0 = add i64 0, 6
  ret i64 %r0
}

define i64 @"kira_fn_115_cullModeNone"() {
entry:
  %r0 = add i64 0, 0
  ret i64 %r0
}

define i64 @"kira_fn_118_frontFaceCounterClockwise"() {
entry:
  %r0 = add i64 0, 1
  ret i64 %r0
}

define i64 @"kira_fn_121_indexFormatUint32"() {
entry:
  %r0 = add i64 0, 2
  ret i64 %r0
}

define i64 @"kira_fn_122_loadActionClear"() {
entry:
  %r0 = add i64 0, 1
  ret i64 %r0
}

define i64 @"kira_fn_125_storeActionStore"() {
entry:
  %r0 = add i64 0, 1
  ret i64 %r0
}

define i64 @"kira_fn_127_renderTargetKindSwapchain"() {
entry:
  %r0 = add i64 0, 1
  ret i64 %r0
}

define i64 @"kira_fn_406_GraphicsFrame.beginRenderPass"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.GraphicsFrame
  store %t.GraphicsFrame zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.RenderPassDescriptor
  store %t.RenderPassDescriptor zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %local2 = alloca i64
  %local.storage.2 = alloca %t.ColorAttachment
  store %t.ColorAttachment zeroinitializer, ptr %local.storage.2
  %local.storage.int.2 = ptrtoint ptr %local.storage.2 to i64
  store i64 %local.storage.int.2, ptr %local2
  %local3 = alloca i64
  %local.storage.3 = alloca %t.RenderEncoder
  store %t.RenderEncoder zeroinitializer, ptr %local.storage.3
  %local.storage.int.3 = ptrtoint ptr %local.storage.3 to i64
  store i64 %local.storage.int.3, ptr %local3
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.2 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.2
  %cleanup.heap.slot.3 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.3
  %cleanup.heap.slot.6 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.6
  %cleanup.heap.slot.8 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.8
  %cleanup.heap.slot.12 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.12
  %cleanup.heap.slot.18 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.18
  %cleanup.heap.slot.22 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.22
  %cleanup.heap.slot.23 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.23
  %cleanup.heap.slot.25 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.25
  %cleanup.heap.slot.27 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.27
  %cleanup.heap.slot.31 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.31
  %cleanup.heap.slot.33 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.33
  %cleanup.heap.slot.38 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.38
  %cleanup.heap.slot.40 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.40
  %cleanup.heap.slot.44 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.44
  %cleanup.heap.slot.46 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.46
  %cleanup.heap.slot.50 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.50
  %cleanup.heap.slot.52 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.52
  %cleanup.heap.slot.55 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.55
  %cleanup.heap.slot.57 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.57
  %cleanup.heap.slot.60 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.60
  %cleanup.heap.slot.62 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.62
  %cleanup.heap.slot.66 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.66
  %cleanup.heap.slot.68 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.68
  %cleanup.heap.slot.72 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.72
  %cleanup.heap.slot.74 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.74
  %cleanup.heap.slot.78 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.78
  %cleanup.heap.slot.80 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.80
  %cleanup.heap.slot.84 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.84
  %cleanup.heap.slot.86 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.86
  %cleanup.heap.slot.89 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.89
  %cleanup.heap.slot.91 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.91
  %cleanup.heap.slot.96 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.96
  %cleanup.heap.slot.98 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.98
  %cleanup.heap.slot.102 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.102
  %cleanup.heap.slot.104 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.104
  %cleanup.heap.slot.108 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.108
  %cleanup.heap.slot.110 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.110
  %cleanup.heap.slot.113 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.113
  %cleanup.heap.slot.115 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.115
  %cleanup.heap.slot.120 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.120
  %cleanup.heap.slot.122 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.122
  %cleanup.heap.slot.126 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.126
  %cleanup.heap.slot.128 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.128
  %cleanup.heap.slot.132 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.132
  %cleanup.heap.slot.134 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.134
  %cleanup.heap.slot.138 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.138
  %cleanup.heap.slot.140 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.140
  %cleanup.heap.slot.144 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.144
  %cleanup.heap.slot.146 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.146
  %cleanup.heap.slot.149 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.149
  %cleanup.heap.slot.151 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.151
  %cleanup.heap.slot.156 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.156
  %cleanup.heap.slot.158 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.158
  %cleanup.heap.slot.162 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.162
  %cleanup.heap.slot.164 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.164
  %cleanup.heap.slot.168 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.168
  %cleanup.heap.slot.170 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.170
  %cleanup.heap.slot.174 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.174
  %cleanup.heap.slot.176 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.176
  %cleanup.heap.slot.180 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.180
  %cleanup.heap.slot.183 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.183
  %cleanup.heap.slot.186 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.186
  %cleanup.heap.slot.189 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.189
  %cleanup.heap.slot.191 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.191
  %cleanup.heap.slot.193 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.193
  %cleanup.heap.slot.195 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.195
  %cleanup.heap.slot.200 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.200
  %cleanup.heap.slot.203 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.203
  %cleanup.heap.slot.204 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.204
  %cleanup.heap.slot.205 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.205
  %cleanup.heap.slot.206 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.206
  %cleanup.heap.slot.208 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.208
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local1
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.RenderPassDescriptor, ptr %field.base.1, i32 0, i32 2
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %r2 = load i64, ptr %local2
  %copy.dst.2 = inttoptr i64 %r2 to ptr
  %copy.src.1 = inttoptr i64 %r1 to ptr
  %copy.val.2 = load %t.ColorAttachment, ptr %copy.src.1
  store %t.ColorAttachment %copy.val.2, ptr %copy.dst.2
  %r3 = load i64, ptr %local1
  %field.base.4 = inttoptr i64 %r3 to ptr
  %field.ptr.4 = getelementptr inbounds %t.RenderPassDescriptor, ptr %field.base.4, i32 0, i32 3
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %load.ptr.5 = inttoptr i64 %r4 to ptr
  %load.raw.5 = load i8, ptr %load.ptr.5
  %r5 = trunc i8 %load.raw.5 to i1
  %r6 = load i64, ptr %local0
  %field.base.7 = inttoptr i64 %r6 to ptr
  %field.ptr.7 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.7, i32 0, i32 0
  %r7 = ptrtoint ptr %field.ptr.7 to i64
  %store.ptr.5 = inttoptr i64 %r7 to ptr
  %store.bool.5 = zext i1 %r5 to i8
  store i8 %store.bool.5, ptr %store.ptr.5
  %r8 = load i64, ptr %local0
  %field.base.9 = inttoptr i64 %r8 to ptr
  %field.ptr.9 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.9, i32 0, i32 0
  %r9 = ptrtoint ptr %field.ptr.9 to i64
  %load.ptr.10 = inttoptr i64 %r9 to ptr
  %load.raw.10 = load i8, ptr %load.ptr.10
  %r10 = trunc i8 %load.raw.10 to i1
  %r11 = xor i1 %r10, true
  br i1 %r11, label %kira_label_0, label %kira_label_1
kira_label_0:
  %r12 = load i64, ptr %local1
  %field.base.13 = inttoptr i64 %r12 to ptr
  %field.ptr.13 = getelementptr inbounds %t.RenderPassDescriptor, ptr %field.base.13, i32 0, i32 1
  %r13 = ptrtoint ptr %field.ptr.13 to i64
  %load.ptr.14 = inttoptr i64 %r13 to ptr
  %load.arrayptr.14 = load ptr, ptr %load.ptr.14
  %r14 = ptrtoint ptr %load.arrayptr.14 to i64
  %array.ptr.15 = inttoptr i64 %r14 to ptr
  %r15 = call i64 @"kira_array_len"(ptr %array.ptr.15)
  %r16 = add i64 0, 0
  %r17 = icmp sgt i64 %r15, %r16
  br i1 %r17, label %kira_label_2, label %kira_label_3
kira_label_2:
  %r18 = load i64, ptr %local1
  %field.base.19 = inttoptr i64 %r18 to ptr
  %field.ptr.19 = getelementptr inbounds %t.RenderPassDescriptor, ptr %field.base.19, i32 0, i32 1
  %r19 = ptrtoint ptr %field.ptr.19 to i64
  %load.ptr.20 = inttoptr i64 %r19 to ptr
  %load.arrayptr.20 = load ptr, ptr %load.ptr.20
  %r20 = ptrtoint ptr %load.arrayptr.20 to i64
  %r21 = add i64 0, 0
  %array.get.ptr.22 = inttoptr i64 %r20 to ptr
  %array.get.val.ptr.0 = alloca %kira.bridge.value
  call void @"kira_array_load"(ptr %array.get.ptr.22, i64 %r21, ptr %array.get.val.ptr.0)
  %array.get.val.0 = load %kira.bridge.value, ptr %array.get.val.ptr.0
  %r22 = extractvalue %kira.bridge.value %array.get.val.0, 2
  %r23 = load i64, ptr %local2
  %copy.dst.23 = inttoptr i64 %r23 to ptr
  %copy.src.22 = inttoptr i64 %r22 to ptr
  %copy.val.23 = load %t.ColorAttachment, ptr %copy.src.22
  store %t.ColorAttachment %copy.val.23, ptr %copy.dst.23
  %r24 = add i1 0, 1
  %r25 = load i64, ptr %local0
  %field.base.26 = inttoptr i64 %r25 to ptr
  %field.ptr.26 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.26, i32 0, i32 0
  %r26 = ptrtoint ptr %field.ptr.26 to i64
  %store.ptr.24 = inttoptr i64 %r26 to ptr
  %store.bool.24 = zext i1 %r24 to i8
  store i8 %store.bool.24, ptr %store.ptr.24
  br label %kira_label_3
kira_label_3:
  br label %kira_label_1
kira_label_1:
  %r27 = load i64, ptr %local2
  %field.base.28 = inttoptr i64 %r27 to ptr
  %field.ptr.28 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.28, i32 0, i32 0
  %r28 = ptrtoint ptr %field.ptr.28 to i64
  %field.base.29 = inttoptr i64 %r28 to ptr
  %field.ptr.29 = getelementptr inbounds %t.RenderTarget, ptr %field.base.29, i32 0, i32 0
  %r29 = ptrtoint ptr %field.ptr.29 to i64
  %load.ptr.30 = inttoptr i64 %r29 to ptr
  %load.raw.30 = load i64, ptr %load.ptr.30
  %r30 = load i64, ptr %load.ptr.30
  %r31 = load i64, ptr %local0
  %field.base.32 = inttoptr i64 %r31 to ptr
  %field.ptr.32 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.32, i32 0, i32 1
  %r32 = ptrtoint ptr %field.ptr.32 to i64
  %store.ptr.30 = inttoptr i64 %r32 to ptr
  store i64 %r30, ptr %store.ptr.30
  %r33 = load i64, ptr %local2
  %field.base.34 = inttoptr i64 %r33 to ptr
  %field.ptr.34 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.34, i32 0, i32 0
  %r34 = ptrtoint ptr %field.ptr.34 to i64
  %field.base.35 = inttoptr i64 %r34 to ptr
  %field.ptr.35 = getelementptr inbounds %t.RenderTarget, ptr %field.base.35, i32 0, i32 1
  %r35 = ptrtoint ptr %field.ptr.35 to i64
  %field.base.36 = inttoptr i64 %r35 to ptr
  %field.ptr.36 = getelementptr inbounds %t.GraphicsTexture, ptr %field.base.36, i32 0, i32 1
  %r36 = ptrtoint ptr %field.ptr.36 to i64
  %load.ptr.37 = inttoptr i64 %r36 to ptr
  %load.raw.37 = load i32, ptr %load.ptr.37
  %r37 = sext i32 %load.raw.37 to i64
  %r38 = load i64, ptr %local0
  %field.base.39 = inttoptr i64 %r38 to ptr
  %field.ptr.39 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.39, i32 0, i32 2
  %r39 = ptrtoint ptr %field.ptr.39 to i64
  %store.ptr.37 = inttoptr i64 %r39 to ptr
  %store.cast.37 = trunc i64 %r37 to i32
  store i32 %store.cast.37, ptr %store.ptr.37
  %r40 = load i64, ptr %local2
  %field.base.41 = inttoptr i64 %r40 to ptr
  %field.ptr.41 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.41, i32 0, i32 0
  %r41 = ptrtoint ptr %field.ptr.41 to i64
  %field.base.42 = inttoptr i64 %r41 to ptr
  %field.ptr.42 = getelementptr inbounds %t.RenderTarget, ptr %field.base.42, i32 0, i32 2
  %r42 = ptrtoint ptr %field.ptr.42 to i64
  %load.ptr.43 = inttoptr i64 %r42 to ptr
  %load.raw.43 = load i64, ptr %load.ptr.43
  %r43 = load i64, ptr %load.ptr.43
  %r44 = load i64, ptr %local0
  %field.base.45 = inttoptr i64 %r44 to ptr
  %field.ptr.45 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.45, i32 0, i32 3
  %r45 = ptrtoint ptr %field.ptr.45 to i64
  %store.ptr.43 = inttoptr i64 %r45 to ptr
  store i64 %r43, ptr %store.ptr.43
  %r46 = load i64, ptr %local2
  %field.base.47 = inttoptr i64 %r46 to ptr
  %field.ptr.47 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.47, i32 0, i32 0
  %r47 = ptrtoint ptr %field.ptr.47 to i64
  %field.base.48 = inttoptr i64 %r47 to ptr
  %field.ptr.48 = getelementptr inbounds %t.RenderTarget, ptr %field.base.48, i32 0, i32 3
  %r48 = ptrtoint ptr %field.ptr.48 to i64
  %load.ptr.49 = inttoptr i64 %r48 to ptr
  %load.raw.49 = load i64, ptr %load.ptr.49
  %r49 = load i64, ptr %load.ptr.49
  %r50 = load i64, ptr %local0
  %field.base.51 = inttoptr i64 %r50 to ptr
  %field.ptr.51 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.51, i32 0, i32 4
  %r51 = ptrtoint ptr %field.ptr.51 to i64
  %store.ptr.49 = inttoptr i64 %r51 to ptr
  store i64 %r49, ptr %store.ptr.49
  %r52 = load i64, ptr %local2
  %field.base.53 = inttoptr i64 %r52 to ptr
  %field.ptr.53 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.53, i32 0, i32 1
  %r53 = ptrtoint ptr %field.ptr.53 to i64
  %load.ptr.54 = inttoptr i64 %r53 to ptr
  %load.raw.54 = load i64, ptr %load.ptr.54
  %r54 = load i64, ptr %load.ptr.54
  %r55 = load i64, ptr %local0
  %field.base.56 = inttoptr i64 %r55 to ptr
  %field.ptr.56 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.56, i32 0, i32 5
  %r56 = ptrtoint ptr %field.ptr.56 to i64
  %store.ptr.54 = inttoptr i64 %r56 to ptr
  store i64 %r54, ptr %store.ptr.54
  %r57 = load i64, ptr %local2
  %field.base.58 = inttoptr i64 %r57 to ptr
  %field.ptr.58 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.58, i32 0, i32 2
  %r58 = ptrtoint ptr %field.ptr.58 to i64
  %load.ptr.59 = inttoptr i64 %r58 to ptr
  %load.raw.59 = load i64, ptr %load.ptr.59
  %r59 = load i64, ptr %load.ptr.59
  %r60 = load i64, ptr %local0
  %field.base.61 = inttoptr i64 %r60 to ptr
  %field.ptr.61 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.61, i32 0, i32 6
  %r61 = ptrtoint ptr %field.ptr.61 to i64
  %store.ptr.59 = inttoptr i64 %r61 to ptr
  store i64 %r59, ptr %store.ptr.59
  %r62 = load i64, ptr %local2
  %field.base.63 = inttoptr i64 %r62 to ptr
  %field.ptr.63 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.63, i32 0, i32 3
  %r63 = ptrtoint ptr %field.ptr.63 to i64
  %field.base.64 = inttoptr i64 %r63 to ptr
  %field.ptr.64 = getelementptr inbounds %t.Color, ptr %field.base.64, i32 0, i32 0
  %r64 = ptrtoint ptr %field.ptr.64 to i64
  %load.ptr.65 = inttoptr i64 %r64 to ptr
  %load.raw.float.65 = load double, ptr %load.ptr.65
  %r65 = fadd double %load.raw.float.65, 0.0
  %r66 = load i64, ptr %local0
  %field.base.67 = inttoptr i64 %r66 to ptr
  %field.ptr.67 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.67, i32 0, i32 7
  %r67 = ptrtoint ptr %field.ptr.67 to i64
  %store.ptr.65 = inttoptr i64 %r67 to ptr
  store double %r65, ptr %store.ptr.65
  %r68 = load i64, ptr %local2
  %field.base.69 = inttoptr i64 %r68 to ptr
  %field.ptr.69 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.69, i32 0, i32 3
  %r69 = ptrtoint ptr %field.ptr.69 to i64
  %field.base.70 = inttoptr i64 %r69 to ptr
  %field.ptr.70 = getelementptr inbounds %t.Color, ptr %field.base.70, i32 0, i32 1
  %r70 = ptrtoint ptr %field.ptr.70 to i64
  %load.ptr.71 = inttoptr i64 %r70 to ptr
  %load.raw.float.71 = load double, ptr %load.ptr.71
  %r71 = fadd double %load.raw.float.71, 0.0
  %r72 = load i64, ptr %local0
  %field.base.73 = inttoptr i64 %r72 to ptr
  %field.ptr.73 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.73, i32 0, i32 8
  %r73 = ptrtoint ptr %field.ptr.73 to i64
  %store.ptr.71 = inttoptr i64 %r73 to ptr
  store double %r71, ptr %store.ptr.71
  %r74 = load i64, ptr %local2
  %field.base.75 = inttoptr i64 %r74 to ptr
  %field.ptr.75 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.75, i32 0, i32 3
  %r75 = ptrtoint ptr %field.ptr.75 to i64
  %field.base.76 = inttoptr i64 %r75 to ptr
  %field.ptr.76 = getelementptr inbounds %t.Color, ptr %field.base.76, i32 0, i32 2
  %r76 = ptrtoint ptr %field.ptr.76 to i64
  %load.ptr.77 = inttoptr i64 %r76 to ptr
  %load.raw.float.77 = load double, ptr %load.ptr.77
  %r77 = fadd double %load.raw.float.77, 0.0
  %r78 = load i64, ptr %local0
  %field.base.79 = inttoptr i64 %r78 to ptr
  %field.ptr.79 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.79, i32 0, i32 9
  %r79 = ptrtoint ptr %field.ptr.79 to i64
  %store.ptr.77 = inttoptr i64 %r79 to ptr
  store double %r77, ptr %store.ptr.77
  %r80 = load i64, ptr %local2
  %field.base.81 = inttoptr i64 %r80 to ptr
  %field.ptr.81 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.81, i32 0, i32 3
  %r81 = ptrtoint ptr %field.ptr.81 to i64
  %field.base.82 = inttoptr i64 %r81 to ptr
  %field.ptr.82 = getelementptr inbounds %t.Color, ptr %field.base.82, i32 0, i32 3
  %r82 = ptrtoint ptr %field.ptr.82 to i64
  %load.ptr.83 = inttoptr i64 %r82 to ptr
  %load.raw.float.83 = load double, ptr %load.ptr.83
  %r83 = fadd double %load.raw.float.83, 0.0
  %r84 = load i64, ptr %local0
  %field.base.85 = inttoptr i64 %r84 to ptr
  %field.ptr.85 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.85, i32 0, i32 10
  %r85 = ptrtoint ptr %field.ptr.85 to i64
  %store.ptr.83 = inttoptr i64 %r85 to ptr
  store double %r83, ptr %store.ptr.83
  %r86 = load i64, ptr %local2
  %field.base.87 = inttoptr i64 %r86 to ptr
  %field.ptr.87 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.87, i32 0, i32 5
  %r87 = ptrtoint ptr %field.ptr.87 to i64
  %load.ptr.88 = inttoptr i64 %r87 to ptr
  %load.raw.88 = load i8, ptr %load.ptr.88
  %r88 = trunc i8 %load.raw.88 to i1
  %r89 = load i64, ptr %local0
  %field.base.90 = inttoptr i64 %r89 to ptr
  %field.ptr.90 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.90, i32 0, i32 11
  %r90 = ptrtoint ptr %field.ptr.90 to i64
  %store.ptr.88 = inttoptr i64 %r90 to ptr
  %store.bool.88 = zext i1 %r88 to i8
  store i8 %store.bool.88, ptr %store.ptr.88
  %r91 = load i64, ptr %local2
  %field.base.92 = inttoptr i64 %r91 to ptr
  %field.ptr.92 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.92, i32 0, i32 4
  %r92 = ptrtoint ptr %field.ptr.92 to i64
  %field.base.93 = inttoptr i64 %r92 to ptr
  %field.ptr.93 = getelementptr inbounds %t.RenderTarget, ptr %field.base.93, i32 0, i32 1
  %r93 = ptrtoint ptr %field.ptr.93 to i64
  %field.base.94 = inttoptr i64 %r93 to ptr
  %field.ptr.94 = getelementptr inbounds %t.GraphicsTexture, ptr %field.base.94, i32 0, i32 1
  %r94 = ptrtoint ptr %field.ptr.94 to i64
  %load.ptr.95 = inttoptr i64 %r94 to ptr
  %load.raw.95 = load i32, ptr %load.ptr.95
  %r95 = sext i32 %load.raw.95 to i64
  %r96 = load i64, ptr %local0
  %field.base.97 = inttoptr i64 %r96 to ptr
  %field.ptr.97 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.97, i32 0, i32 12
  %r97 = ptrtoint ptr %field.ptr.97 to i64
  %store.ptr.95 = inttoptr i64 %r97 to ptr
  %store.cast.95 = trunc i64 %r95 to i32
  store i32 %store.cast.95, ptr %store.ptr.95
  %r98 = load i64, ptr %local2
  %field.base.99 = inttoptr i64 %r98 to ptr
  %field.ptr.99 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.99, i32 0, i32 4
  %r99 = ptrtoint ptr %field.ptr.99 to i64
  %field.base.100 = inttoptr i64 %r99 to ptr
  %field.ptr.100 = getelementptr inbounds %t.RenderTarget, ptr %field.base.100, i32 0, i32 2
  %r100 = ptrtoint ptr %field.ptr.100 to i64
  %load.ptr.101 = inttoptr i64 %r100 to ptr
  %load.raw.101 = load i64, ptr %load.ptr.101
  %r101 = load i64, ptr %load.ptr.101
  %r102 = load i64, ptr %local0
  %field.base.103 = inttoptr i64 %r102 to ptr
  %field.ptr.103 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.103, i32 0, i32 13
  %r103 = ptrtoint ptr %field.ptr.103 to i64
  %store.ptr.101 = inttoptr i64 %r103 to ptr
  store i64 %r101, ptr %store.ptr.101
  %r104 = load i64, ptr %local2
  %field.base.105 = inttoptr i64 %r104 to ptr
  %field.ptr.105 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.105, i32 0, i32 4
  %r105 = ptrtoint ptr %field.ptr.105 to i64
  %field.base.106 = inttoptr i64 %r105 to ptr
  %field.ptr.106 = getelementptr inbounds %t.RenderTarget, ptr %field.base.106, i32 0, i32 3
  %r106 = ptrtoint ptr %field.ptr.106 to i64
  %load.ptr.107 = inttoptr i64 %r106 to ptr
  %load.raw.107 = load i64, ptr %load.ptr.107
  %r107 = load i64, ptr %load.ptr.107
  %r108 = load i64, ptr %local0
  %field.base.109 = inttoptr i64 %r108 to ptr
  %field.ptr.109 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.109, i32 0, i32 14
  %r109 = ptrtoint ptr %field.ptr.109 to i64
  %store.ptr.107 = inttoptr i64 %r109 to ptr
  store i64 %r107, ptr %store.ptr.107
  %r110 = load i64, ptr %local1
  %field.base.111 = inttoptr i64 %r110 to ptr
  %field.ptr.111 = getelementptr inbounds %t.RenderPassDescriptor, ptr %field.base.111, i32 0, i32 5
  %r111 = ptrtoint ptr %field.ptr.111 to i64
  %load.ptr.112 = inttoptr i64 %r111 to ptr
  %load.raw.112 = load i8, ptr %load.ptr.112
  %r112 = trunc i8 %load.raw.112 to i1
  %r113 = load i64, ptr %local0
  %field.base.114 = inttoptr i64 %r113 to ptr
  %field.ptr.114 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.114, i32 0, i32 15
  %r114 = ptrtoint ptr %field.ptr.114 to i64
  %store.ptr.112 = inttoptr i64 %r114 to ptr
  %store.bool.112 = zext i1 %r112 to i8
  store i8 %store.bool.112, ptr %store.ptr.112
  %r115 = load i64, ptr %local1
  %field.base.116 = inttoptr i64 %r115 to ptr
  %field.ptr.116 = getelementptr inbounds %t.RenderPassDescriptor, ptr %field.base.116, i32 0, i32 4
  %r116 = ptrtoint ptr %field.ptr.116 to i64
  %field.base.117 = inttoptr i64 %r116 to ptr
  %field.ptr.117 = getelementptr inbounds %t.DepthAttachment, ptr %field.base.117, i32 0, i32 0
  %r117 = ptrtoint ptr %field.ptr.117 to i64
  %field.base.118 = inttoptr i64 %r117 to ptr
  %field.ptr.118 = getelementptr inbounds %t.GraphicsTexture, ptr %field.base.118, i32 0, i32 1
  %r118 = ptrtoint ptr %field.ptr.118 to i64
  %load.ptr.119 = inttoptr i64 %r118 to ptr
  %load.raw.119 = load i32, ptr %load.ptr.119
  %r119 = sext i32 %load.raw.119 to i64
  %r120 = load i64, ptr %local0
  %field.base.121 = inttoptr i64 %r120 to ptr
  %field.ptr.121 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.121, i32 0, i32 16
  %r121 = ptrtoint ptr %field.ptr.121 to i64
  %store.ptr.119 = inttoptr i64 %r121 to ptr
  %store.cast.119 = trunc i64 %r119 to i32
  store i32 %store.cast.119, ptr %store.ptr.119
  %r122 = load i64, ptr %local1
  %field.base.123 = inttoptr i64 %r122 to ptr
  %field.ptr.123 = getelementptr inbounds %t.RenderPassDescriptor, ptr %field.base.123, i32 0, i32 4
  %r123 = ptrtoint ptr %field.ptr.123 to i64
  %field.base.124 = inttoptr i64 %r123 to ptr
  %field.ptr.124 = getelementptr inbounds %t.DepthAttachment, ptr %field.base.124, i32 0, i32 1
  %r124 = ptrtoint ptr %field.ptr.124 to i64
  %load.ptr.125 = inttoptr i64 %r124 to ptr
  %load.raw.125 = load i64, ptr %load.ptr.125
  %r125 = load i64, ptr %load.ptr.125
  %r126 = load i64, ptr %local0
  %field.base.127 = inttoptr i64 %r126 to ptr
  %field.ptr.127 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.127, i32 0, i32 17
  %r127 = ptrtoint ptr %field.ptr.127 to i64
  %store.ptr.125 = inttoptr i64 %r127 to ptr
  store i64 %r125, ptr %store.ptr.125
  %r128 = load i64, ptr %local1
  %field.base.129 = inttoptr i64 %r128 to ptr
  %field.ptr.129 = getelementptr inbounds %t.RenderPassDescriptor, ptr %field.base.129, i32 0, i32 4
  %r129 = ptrtoint ptr %field.ptr.129 to i64
  %field.base.130 = inttoptr i64 %r129 to ptr
  %field.ptr.130 = getelementptr inbounds %t.DepthAttachment, ptr %field.base.130, i32 0, i32 2
  %r130 = ptrtoint ptr %field.ptr.130 to i64
  %load.ptr.131 = inttoptr i64 %r130 to ptr
  %load.raw.131 = load i64, ptr %load.ptr.131
  %r131 = load i64, ptr %load.ptr.131
  %r132 = load i64, ptr %local0
  %field.base.133 = inttoptr i64 %r132 to ptr
  %field.ptr.133 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.133, i32 0, i32 18
  %r133 = ptrtoint ptr %field.ptr.133 to i64
  %store.ptr.131 = inttoptr i64 %r133 to ptr
  store i64 %r131, ptr %store.ptr.131
  %r134 = load i64, ptr %local1
  %field.base.135 = inttoptr i64 %r134 to ptr
  %field.ptr.135 = getelementptr inbounds %t.RenderPassDescriptor, ptr %field.base.135, i32 0, i32 4
  %r135 = ptrtoint ptr %field.ptr.135 to i64
  %field.base.136 = inttoptr i64 %r135 to ptr
  %field.ptr.136 = getelementptr inbounds %t.DepthAttachment, ptr %field.base.136, i32 0, i32 3
  %r136 = ptrtoint ptr %field.ptr.136 to i64
  %load.ptr.137 = inttoptr i64 %r136 to ptr
  %load.raw.float.137 = load double, ptr %load.ptr.137
  %r137 = fadd double %load.raw.float.137, 0.0
  %r138 = load i64, ptr %local0
  %field.base.139 = inttoptr i64 %r138 to ptr
  %field.ptr.139 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.139, i32 0, i32 19
  %r139 = ptrtoint ptr %field.ptr.139 to i64
  %store.ptr.137 = inttoptr i64 %r139 to ptr
  store double %r137, ptr %store.ptr.137
  %r140 = load i64, ptr %local1
  %field.base.141 = inttoptr i64 %r140 to ptr
  %field.ptr.141 = getelementptr inbounds %t.RenderPassDescriptor, ptr %field.base.141, i32 0, i32 4
  %r141 = ptrtoint ptr %field.ptr.141 to i64
  %field.base.142 = inttoptr i64 %r141 to ptr
  %field.ptr.142 = getelementptr inbounds %t.DepthAttachment, ptr %field.base.142, i32 0, i32 4
  %r142 = ptrtoint ptr %field.ptr.142 to i64
  %load.ptr.143 = inttoptr i64 %r142 to ptr
  %load.raw.143 = load i8, ptr %load.ptr.143
  %r143 = trunc i8 %load.raw.143 to i1
  %r144 = load i64, ptr %local0
  %field.base.145 = inttoptr i64 %r144 to ptr
  %field.ptr.145 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.145, i32 0, i32 20
  %r145 = ptrtoint ptr %field.ptr.145 to i64
  %store.ptr.143 = inttoptr i64 %r145 to ptr
  %store.bool.143 = zext i1 %r143 to i8
  store i8 %store.bool.143, ptr %store.ptr.143
  %r146 = load i64, ptr %local1
  %field.base.147 = inttoptr i64 %r146 to ptr
  %field.ptr.147 = getelementptr inbounds %t.RenderPassDescriptor, ptr %field.base.147, i32 0, i32 7
  %r147 = ptrtoint ptr %field.ptr.147 to i64
  %load.ptr.148 = inttoptr i64 %r147 to ptr
  %load.raw.148 = load i8, ptr %load.ptr.148
  %r148 = trunc i8 %load.raw.148 to i1
  %r149 = load i64, ptr %local0
  %field.base.150 = inttoptr i64 %r149 to ptr
  %field.ptr.150 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.150, i32 0, i32 21
  %r150 = ptrtoint ptr %field.ptr.150 to i64
  %store.ptr.148 = inttoptr i64 %r150 to ptr
  %store.bool.148 = zext i1 %r148 to i8
  store i8 %store.bool.148, ptr %store.ptr.148
  %r151 = load i64, ptr %local1
  %field.base.152 = inttoptr i64 %r151 to ptr
  %field.ptr.152 = getelementptr inbounds %t.RenderPassDescriptor, ptr %field.base.152, i32 0, i32 6
  %r152 = ptrtoint ptr %field.ptr.152 to i64
  %field.base.153 = inttoptr i64 %r152 to ptr
  %field.ptr.153 = getelementptr inbounds %t.StencilAttachment, ptr %field.base.153, i32 0, i32 0
  %r153 = ptrtoint ptr %field.ptr.153 to i64
  %field.base.154 = inttoptr i64 %r153 to ptr
  %field.ptr.154 = getelementptr inbounds %t.GraphicsTexture, ptr %field.base.154, i32 0, i32 1
  %r154 = ptrtoint ptr %field.ptr.154 to i64
  %load.ptr.155 = inttoptr i64 %r154 to ptr
  %load.raw.155 = load i32, ptr %load.ptr.155
  %r155 = sext i32 %load.raw.155 to i64
  %r156 = load i64, ptr %local0
  %field.base.157 = inttoptr i64 %r156 to ptr
  %field.ptr.157 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.157, i32 0, i32 22
  %r157 = ptrtoint ptr %field.ptr.157 to i64
  %store.ptr.155 = inttoptr i64 %r157 to ptr
  %store.cast.155 = trunc i64 %r155 to i32
  store i32 %store.cast.155, ptr %store.ptr.155
  %r158 = load i64, ptr %local1
  %field.base.159 = inttoptr i64 %r158 to ptr
  %field.ptr.159 = getelementptr inbounds %t.RenderPassDescriptor, ptr %field.base.159, i32 0, i32 6
  %r159 = ptrtoint ptr %field.ptr.159 to i64
  %field.base.160 = inttoptr i64 %r159 to ptr
  %field.ptr.160 = getelementptr inbounds %t.StencilAttachment, ptr %field.base.160, i32 0, i32 1
  %r160 = ptrtoint ptr %field.ptr.160 to i64
  %load.ptr.161 = inttoptr i64 %r160 to ptr
  %load.raw.161 = load i64, ptr %load.ptr.161
  %r161 = load i64, ptr %load.ptr.161
  %r162 = load i64, ptr %local0
  %field.base.163 = inttoptr i64 %r162 to ptr
  %field.ptr.163 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.163, i32 0, i32 23
  %r163 = ptrtoint ptr %field.ptr.163 to i64
  %store.ptr.161 = inttoptr i64 %r163 to ptr
  store i64 %r161, ptr %store.ptr.161
  %r164 = load i64, ptr %local1
  %field.base.165 = inttoptr i64 %r164 to ptr
  %field.ptr.165 = getelementptr inbounds %t.RenderPassDescriptor, ptr %field.base.165, i32 0, i32 6
  %r165 = ptrtoint ptr %field.ptr.165 to i64
  %field.base.166 = inttoptr i64 %r165 to ptr
  %field.ptr.166 = getelementptr inbounds %t.StencilAttachment, ptr %field.base.166, i32 0, i32 2
  %r166 = ptrtoint ptr %field.ptr.166 to i64
  %load.ptr.167 = inttoptr i64 %r166 to ptr
  %load.raw.167 = load i64, ptr %load.ptr.167
  %r167 = load i64, ptr %load.ptr.167
  %r168 = load i64, ptr %local0
  %field.base.169 = inttoptr i64 %r168 to ptr
  %field.ptr.169 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.169, i32 0, i32 24
  %r169 = ptrtoint ptr %field.ptr.169 to i64
  %store.ptr.167 = inttoptr i64 %r169 to ptr
  store i64 %r167, ptr %store.ptr.167
  %r170 = load i64, ptr %local1
  %field.base.171 = inttoptr i64 %r170 to ptr
  %field.ptr.171 = getelementptr inbounds %t.RenderPassDescriptor, ptr %field.base.171, i32 0, i32 6
  %r171 = ptrtoint ptr %field.ptr.171 to i64
  %field.base.172 = inttoptr i64 %r171 to ptr
  %field.ptr.172 = getelementptr inbounds %t.StencilAttachment, ptr %field.base.172, i32 0, i32 3
  %r172 = ptrtoint ptr %field.ptr.172 to i64
  %load.ptr.173 = inttoptr i64 %r172 to ptr
  %load.raw.173 = load i64, ptr %load.ptr.173
  %r173 = load i64, ptr %load.ptr.173
  %r174 = load i64, ptr %local0
  %field.base.175 = inttoptr i64 %r174 to ptr
  %field.ptr.175 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.175, i32 0, i32 25
  %r175 = ptrtoint ptr %field.ptr.175 to i64
  %store.ptr.173 = inttoptr i64 %r175 to ptr
  store i64 %r173, ptr %store.ptr.173
  %r176 = load i64, ptr %local1
  %field.base.177 = inttoptr i64 %r176 to ptr
  %field.ptr.177 = getelementptr inbounds %t.RenderPassDescriptor, ptr %field.base.177, i32 0, i32 6
  %r177 = ptrtoint ptr %field.ptr.177 to i64
  %field.base.178 = inttoptr i64 %r177 to ptr
  %field.ptr.178 = getelementptr inbounds %t.StencilAttachment, ptr %field.base.178, i32 0, i32 4
  %r178 = ptrtoint ptr %field.ptr.178 to i64
  %load.ptr.179 = inttoptr i64 %r178 to ptr
  %load.raw.179 = load i8, ptr %load.ptr.179
  %r179 = trunc i8 %load.raw.179 to i1
  %r180 = load i64, ptr %local0
  %field.base.181 = inttoptr i64 %r180 to ptr
  %field.ptr.181 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.181, i32 0, i32 26
  %r181 = ptrtoint ptr %field.ptr.181 to i64
  %store.ptr.179 = inttoptr i64 %r181 to ptr
  %store.bool.179 = zext i1 %r179 to i8
  store i8 %store.bool.179, ptr %store.ptr.179
  %r182 = add i1 0, 1
  %r183 = load i64, ptr %local0
  %field.base.184 = inttoptr i64 %r183 to ptr
  %field.ptr.184 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.184, i32 0, i32 37
  %r184 = ptrtoint ptr %field.ptr.184 to i64
  %store.ptr.182 = inttoptr i64 %r184 to ptr
  %store.bool.182 = zext i1 %r182 to i8
  store i8 %store.bool.182, ptr %store.ptr.182
  %r185 = add i1 0, 0
  %r186 = load i64, ptr %local0
  %field.base.187 = inttoptr i64 %r186 to ptr
  %field.ptr.187 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.187, i32 0, i32 40
  %r187 = ptrtoint ptr %field.ptr.187 to i64
  %store.ptr.185 = inttoptr i64 %r187 to ptr
  %store.bool.185 = zext i1 %r185 to i8
  store i8 %store.bool.185, ptr %store.ptr.185
  %r188 = add i1 0, 0
  %r189 = load i64, ptr %local0
  %field.base.190 = inttoptr i64 %r189 to ptr
  %field.ptr.190 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.190, i32 0, i32 41
  %r190 = ptrtoint ptr %field.ptr.190 to i64
  %store.ptr.188 = inttoptr i64 %r190 to ptr
  %store.bool.188 = zext i1 %r188 to i8
  store i8 %store.bool.188, ptr %store.ptr.188
  %r191 = load i64, ptr %local0
  %r192 = call i1 @"kira_fn_63_sokolBeginRenderPassFromFrame"(i64 %r191)
  %r193 = load i64, ptr %local0
  %field.base.194 = inttoptr i64 %r193 to ptr
  %field.ptr.194 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.194, i32 0, i32 38
  %r194 = ptrtoint ptr %field.ptr.194 to i64
  %store.ptr.192 = inttoptr i64 %r194 to ptr
  %store.bool.192 = zext i1 %r192 to i8
  store i8 %store.bool.192, ptr %store.ptr.192
  %r195 = load i64, ptr %local0
  %field.base.196 = inttoptr i64 %r195 to ptr
  %field.ptr.196 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.196, i32 0, i32 38
  %r196 = ptrtoint ptr %field.ptr.196 to i64
  %load.ptr.197 = inttoptr i64 %r196 to ptr
  %load.raw.197 = load i8, ptr %load.ptr.197
  %r197 = trunc i8 %load.raw.197 to i1
  %r198 = xor i1 %r197, true
  br i1 %r198, label %kira_label_4, label %kira_label_5
kira_label_4:
  %r199 = load %kira.string, ptr @kira_str_13
  call void @"kira_fn_78_graphicsDiagnostic"(%kira.string %r199)
  br label %kira_label_5
kira_label_5:
  %r200 = load i64, ptr %local0
  %field.base.201 = inttoptr i64 %r200 to ptr
  %field.ptr.201 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.201, i32 0, i32 38
  %r201 = ptrtoint ptr %field.ptr.201 to i64
  %load.ptr.202 = inttoptr i64 %r201 to ptr
  %load.raw.202 = load i8, ptr %load.ptr.202
  %r202 = trunc i8 %load.raw.202 to i1
  %r203 = call i64 @"kira_fn_176_makeRenderEncoderWithPassActive"(i1 %r202)
  %cleanup.call.ptr.203 = inttoptr i64 %r203 to ptr
  store ptr %cleanup.call.ptr.203, ptr %cleanup.heap.slot.203
  %r204 = load i64, ptr %local3
  %copy.dst.204 = inttoptr i64 %r204 to ptr
  %copy.src.203 = inttoptr i64 %r203 to ptr
  %copy.val.204 = load %t.RenderEncoder, ptr %copy.src.203
  store %t.RenderEncoder %copy.val.204, ptr %copy.dst.204
  %r205 = load i64, ptr %local3
  %r206 = load i64, ptr %local0
  %field.base.207 = inttoptr i64 %r206 to ptr
  %field.ptr.207 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.207, i32 0, i32 39
  %r207 = ptrtoint ptr %field.ptr.207 to i64
  %copy.dst.207 = inttoptr i64 %r207 to ptr
  %copy.src.205 = inttoptr i64 %r205 to ptr
  %copy.val.207 = load %t.RenderEncoder, ptr %copy.src.205
  store %t.RenderEncoder %copy.val.207, ptr %copy.dst.207
  %r208 = load i64, ptr %local3
  %return.struct.src.1 = inttoptr i64 %r208 to ptr
  %return.struct.value.1 = load %t.RenderEncoder, ptr %return.struct.src.1
  %return.struct.size.ptr.1 = getelementptr %t.RenderEncoder, ptr null, i32 1
  %return.struct.size.1 = ptrtoint ptr %return.struct.size.ptr.1 to i64
  %return.struct.copy.1 = call ptr @malloc(i64 %return.struct.size.1)
  store %t.RenderEncoder %return.struct.value.1, ptr %return.struct.copy.1
  %return.struct.ptrint.1 = ptrtoint ptr %return.struct.copy.1 to i64
  %cleanup.heap.ptr.2 = load ptr, ptr %cleanup.heap.slot.203
  call void @free(ptr %cleanup.heap.ptr.2)
  call void @"kira_release_contents_GraphicsFrame"(ptr %local.storage.0)
  ret i64 %return.struct.ptrint.1
}

define void @"kira_fn_407_GraphicsFrame.endPass"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.GraphicsFrame
  store %t.GraphicsFrame zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.7 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.7
  %cleanup.heap.slot.11 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.11
  %cleanup.heap.slot.15 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.15
  %cleanup.heap.slot.19 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.19
  %cleanup.heap.slot.23 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.23
  %cleanup.heap.slot.27 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.27
  %cleanup.heap.slot.31 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.31
  %cleanup.heap.slot.35 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.35
  %cleanup.heap.slot.39 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.39
  %cleanup.heap.slot.43 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.43
  %cleanup.heap.slot.46 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.46
  %cleanup.heap.slot.49 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.49
  %cleanup.heap.slot.51 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.51
  %cleanup.heap.slot.55 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.55
  %cleanup.heap.slot.57 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.57
  %cleanup.heap.slot.58 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.58
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.1, i32 0, i32 39
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %field.base.2 = inttoptr i64 %r1 to ptr
  %field.ptr.2 = getelementptr inbounds %t.RenderEncoder, ptr %field.base.2, i32 0, i32 0
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %load.ptr.3 = inttoptr i64 %r2 to ptr
  %load.rawptr.3 = load ptr, ptr %load.ptr.3
  %r3 = ptrtoint ptr %load.rawptr.3 to i64
  %native.recover.state.4 = inttoptr i64 %r3 to ptr
  %native.recover.payload.4 = call ptr @"kira_native_state_recover"(ptr %native.recover.state.4, i64 8245922201398611848)
  %r4 = ptrtoint ptr %native.recover.payload.4 to i64
  store i64 %r4, ptr %local1
  %r5 = load i64, ptr %local1
  %native.state.get.ptr.6 = inttoptr i64 %r5 to ptr
  %native.state.get.slot.6 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.6, i64 0
  %native.state.get.val.0 = load %kira.bridge.value, ptr %native.state.get.slot.6
  %r6 = extractvalue %kira.bridge.value %native.state.get.val.0, 2
  %r7 = load i64, ptr %local0
  %field.base.8 = inttoptr i64 %r7 to ptr
  %field.ptr.8 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.8, i32 0, i32 27
  %r8 = ptrtoint ptr %field.ptr.8 to i64
  %store.ptr.6 = inttoptr i64 %r8 to ptr
  %store.cast.6 = trunc i64 %r6 to i32
  store i32 %store.cast.6, ptr %store.ptr.6
  %r9 = load i64, ptr %local1
  %native.state.get.ptr.10 = inttoptr i64 %r9 to ptr
  %native.state.get.slot.10 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.10, i64 1
  %native.state.get.val.1 = load %kira.bridge.value, ptr %native.state.get.slot.10
  %native.state.get.word.1 = extractvalue %kira.bridge.value %native.state.get.val.1, 2
  %r10 = trunc i64 %native.state.get.word.1 to i1
  %r11 = load i64, ptr %local0
  %field.base.12 = inttoptr i64 %r11 to ptr
  %field.ptr.12 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.12, i32 0, i32 28
  %r12 = ptrtoint ptr %field.ptr.12 to i64
  %store.ptr.10 = inttoptr i64 %r12 to ptr
  %store.bool.10 = zext i1 %r10 to i8
  store i8 %store.bool.10, ptr %store.ptr.10
  %r13 = load i64, ptr %local1
  %native.state.get.ptr.14 = inttoptr i64 %r13 to ptr
  %native.state.get.slot.14 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.14, i64 3
  %native.state.get.val.2 = load %kira.bridge.value, ptr %native.state.get.slot.14
  %r14 = extractvalue %kira.bridge.value %native.state.get.val.2, 2
  %r15 = load i64, ptr %local0
  %field.base.16 = inttoptr i64 %r15 to ptr
  %field.ptr.16 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.16, i32 0, i32 29
  %r16 = ptrtoint ptr %field.ptr.16 to i64
  %store.ptr.14 = inttoptr i64 %r16 to ptr
  %store.cast.14 = trunc i64 %r14 to i32
  store i32 %store.cast.14, ptr %store.ptr.14
  %r17 = load i64, ptr %local1
  %native.state.get.ptr.18 = inttoptr i64 %r17 to ptr
  %native.state.get.slot.18 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.18, i64 4
  %native.state.get.val.3 = load %kira.bridge.value, ptr %native.state.get.slot.18
  %native.state.get.word.3 = extractvalue %kira.bridge.value %native.state.get.val.3, 2
  %r18 = trunc i64 %native.state.get.word.3 to i1
  %r19 = load i64, ptr %local0
  %field.base.20 = inttoptr i64 %r19 to ptr
  %field.ptr.20 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.20, i32 0, i32 30
  %r20 = ptrtoint ptr %field.ptr.20 to i64
  %store.ptr.18 = inttoptr i64 %r20 to ptr
  %store.bool.18 = zext i1 %r18 to i8
  store i8 %store.bool.18, ptr %store.ptr.18
  %r21 = load i64, ptr %local1
  %native.state.get.ptr.22 = inttoptr i64 %r21 to ptr
  %native.state.get.slot.22 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.22, i64 5
  %native.state.get.val.4 = load %kira.bridge.value, ptr %native.state.get.slot.22
  %r22 = extractvalue %kira.bridge.value %native.state.get.val.4, 2
  %r23 = load i64, ptr %local0
  %field.base.24 = inttoptr i64 %r23 to ptr
  %field.ptr.24 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.24, i32 0, i32 31
  %r24 = ptrtoint ptr %field.ptr.24 to i64
  %store.ptr.22 = inttoptr i64 %r24 to ptr
  %store.cast.22 = trunc i64 %r22 to i32
  store i32 %store.cast.22, ptr %store.ptr.22
  %r25 = load i64, ptr %local1
  %native.state.get.ptr.26 = inttoptr i64 %r25 to ptr
  %native.state.get.slot.26 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.26, i64 6
  %native.state.get.val.5 = load %kira.bridge.value, ptr %native.state.get.slot.26
  %native.state.get.word.5 = extractvalue %kira.bridge.value %native.state.get.val.5, 2
  %r26 = trunc i64 %native.state.get.word.5 to i1
  %r27 = load i64, ptr %local0
  %field.base.28 = inttoptr i64 %r27 to ptr
  %field.ptr.28 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.28, i32 0, i32 32
  %r28 = ptrtoint ptr %field.ptr.28 to i64
  %store.ptr.26 = inttoptr i64 %r28 to ptr
  %store.bool.26 = zext i1 %r26 to i8
  store i8 %store.bool.26, ptr %store.ptr.26
  %r29 = load i64, ptr %local1
  %native.state.get.ptr.30 = inttoptr i64 %r29 to ptr
  %native.state.get.slot.30 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.30, i64 7
  %native.state.get.val.6 = load %kira.bridge.value, ptr %native.state.get.slot.30
  %r30 = extractvalue %kira.bridge.value %native.state.get.val.6, 2
  %r31 = load i64, ptr %local0
  %field.base.32 = inttoptr i64 %r31 to ptr
  %field.ptr.32 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.32, i32 0, i32 33
  %r32 = ptrtoint ptr %field.ptr.32 to i64
  %store.ptr.30 = inttoptr i64 %r32 to ptr
  store i64 %r30, ptr %store.ptr.30
  %r33 = load i64, ptr %local1
  %native.state.get.ptr.34 = inttoptr i64 %r33 to ptr
  %native.state.get.slot.34 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.34, i64 16
  %native.state.get.val.7 = load %kira.bridge.value, ptr %native.state.get.slot.34
  %r34 = extractvalue %kira.bridge.value %native.state.get.val.7, 2
  %r35 = load i64, ptr %local0
  %field.base.36 = inttoptr i64 %r35 to ptr
  %field.ptr.36 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.36, i32 0, i32 34
  %r36 = ptrtoint ptr %field.ptr.36 to i64
  %store.ptr.34 = inttoptr i64 %r36 to ptr
  store i64 %r34, ptr %store.ptr.34
  %r37 = load i64, ptr %local1
  %native.state.get.ptr.38 = inttoptr i64 %r37 to ptr
  %native.state.get.slot.38 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.38, i64 17
  %native.state.get.val.8 = load %kira.bridge.value, ptr %native.state.get.slot.38
  %r38 = extractvalue %kira.bridge.value %native.state.get.val.8, 2
  %r39 = load i64, ptr %local0
  %field.base.40 = inttoptr i64 %r39 to ptr
  %field.ptr.40 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.40, i32 0, i32 35
  %r40 = ptrtoint ptr %field.ptr.40 to i64
  %store.ptr.38 = inttoptr i64 %r40 to ptr
  store i64 %r38, ptr %store.ptr.38
  %r41 = load i64, ptr %local1
  %native.state.get.ptr.42 = inttoptr i64 %r41 to ptr
  %native.state.get.slot.42 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.42, i64 18
  %native.state.get.val.9 = load %kira.bridge.value, ptr %native.state.get.slot.42
  %r42 = extractvalue %kira.bridge.value %native.state.get.val.9, 2
  %r43 = load i64, ptr %local0
  %field.base.44 = inttoptr i64 %r43 to ptr
  %field.ptr.44 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.44, i32 0, i32 36
  %r44 = ptrtoint ptr %field.ptr.44 to i64
  %store.ptr.42 = inttoptr i64 %r44 to ptr
  store i64 %r42, ptr %store.ptr.42
  %r45 = add i1 0, 1
  %r46 = load i64, ptr %local0
  %field.base.47 = inttoptr i64 %r46 to ptr
  %field.ptr.47 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.47, i32 0, i32 40
  %r47 = ptrtoint ptr %field.ptr.47 to i64
  %store.ptr.45 = inttoptr i64 %r47 to ptr
  %store.bool.45 = zext i1 %r45 to i8
  store i8 %store.bool.45, ptr %store.ptr.45
  %r48 = add i1 0, 1
  %r49 = load i64, ptr %local0
  %field.base.50 = inttoptr i64 %r49 to ptr
  %field.ptr.50 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.50, i32 0, i32 41
  %r50 = ptrtoint ptr %field.ptr.50 to i64
  %store.ptr.48 = inttoptr i64 %r50 to ptr
  %store.bool.48 = zext i1 %r48 to i8
  store i8 %store.bool.48, ptr %store.ptr.48
  %r51 = load i64, ptr %local0
  %field.base.52 = inttoptr i64 %r51 to ptr
  %field.ptr.52 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.52, i32 0, i32 38
  %r52 = ptrtoint ptr %field.ptr.52 to i64
  %load.ptr.53 = inttoptr i64 %r52 to ptr
  %load.raw.53 = load i8, ptr %load.ptr.53
  %r53 = trunc i8 %load.raw.53 to i1
  br i1 %r53, label %kira_label_0, label %kira_label_1
kira_label_0:
  call void @"kira_fn_67_sokolEndPassAndCommitNative"()
  br label %kira_label_1
kira_label_1:
  %r54 = add i1 0, 0
  %r55 = load i64, ptr %local0
  %field.base.56 = inttoptr i64 %r55 to ptr
  %field.ptr.56 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.56, i32 0, i32 38
  %r56 = ptrtoint ptr %field.ptr.56 to i64
  %store.ptr.54 = inttoptr i64 %r56 to ptr
  %store.bool.54 = zext i1 %r54 to i8
  store i8 %store.bool.54, ptr %store.ptr.54
  %r57 = call i64 @"kira_fn_175_makeRenderEncoder"()
  %cleanup.call.ptr.57 = inttoptr i64 %r57 to ptr
  store ptr %cleanup.call.ptr.57, ptr %cleanup.heap.slot.57
  %r58 = load i64, ptr %local0
  %field.base.59 = inttoptr i64 %r58 to ptr
  %field.ptr.59 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.59, i32 0, i32 39
  %r59 = ptrtoint ptr %field.ptr.59 to i64
  %copy.dst.59 = inttoptr i64 %r59 to ptr
  %copy.src.57 = inttoptr i64 %r57 to ptr
  %copy.val.59 = load %t.RenderEncoder, ptr %copy.src.57
  store %t.RenderEncoder %copy.val.59, ptr %copy.dst.59
  %cleanup.heap.ptr.10 = load ptr, ptr %cleanup.heap.slot.57
  call void @free(ptr %cleanup.heap.ptr.10)
  call void @"kira_release_contents_GraphicsFrame"(ptr %local.storage.0)
  ret void
}

define void @"kira_fn_408_GraphicsFrame.renderPass"(i64 %arg0, i64 %arg1, i64 %arg2) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.GraphicsFrame
  store %t.GraphicsFrame zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.RenderPassDescriptor
  store %t.RenderPassDescriptor zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %local2 = alloca i64
  %local3 = alloca i64
  %local.storage.3 = alloca %t.RenderEncoder
  store %t.RenderEncoder zeroinitializer, ptr %local.storage.3
  %local.storage.int.3 = ptrtoint ptr %local.storage.3 to i64
  store i64 %local.storage.int.3, ptr %local3
  %local4 = alloca i64
  %local.storage.4 = alloca %t.RenderEncoder
  store %t.RenderEncoder zeroinitializer, ptr %local.storage.4
  %local.storage.int.4 = ptrtoint ptr %local.storage.4 to i64
  store i64 %local.storage.int.4, ptr %local4
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
  %cleanup.heap.slot.5 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.5
  %cleanup.heap.slot.7 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.7
  %cleanup.heap.slot.8 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.8
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  store i64 %arg2, ptr %local2
  %r0 = load i64, ptr %local0
  %r1 = load i64, ptr %local1
  %r2 = call i64 @"kira_fn_406_GraphicsFrame.beginRenderPass"(i64 %r0, i64 %r1)
  %cleanup.call.ptr.2 = inttoptr i64 %r2 to ptr
  store ptr %cleanup.call.ptr.2, ptr %cleanup.heap.slot.2
  %r3 = load i64, ptr %local3
  %copy.dst.3 = inttoptr i64 %r3 to ptr
  %copy.src.2 = inttoptr i64 %r2 to ptr
  %copy.val.3 = load %t.RenderEncoder, ptr %copy.src.2
  store %t.RenderEncoder %copy.val.3, ptr %copy.dst.3
  %r4 = load i64, ptr %local3
  %r5 = load i64, ptr %local4
  %copy.dst.5 = inttoptr i64 %r5 to ptr
  %copy.src.4 = inttoptr i64 %r4 to ptr
  %copy.val.5 = load %t.RenderEncoder, ptr %copy.src.4
  store %t.RenderEncoder %copy.val.5, ptr %copy.dst.5
  %r6 = load i64, ptr %local2
  %r7 = load i64, ptr %local4
  call void @"kira_callable_dispatch_45bbf038adba07d0"(i64 %r6, i64 %r7)
  %r8 = load i64, ptr %local0
  call void @"kira_fn_407_GraphicsFrame.endPass"(i64 %r8)
  %cleanup.heap.ptr.0 = load ptr, ptr %cleanup.heap.slot.2
  call void @free(ptr %cleanup.heap.ptr.0)
  call void @"kira_release_contents_RenderEncoder"(ptr %local.storage.4)
  ret void
}

define i64 @"kira_fn_409_GraphicsFrame.beginPass"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.GraphicsFrame
  store %t.GraphicsFrame zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.Color
  store %t.Color zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.1 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.1
  %cleanup.heap.slot.2 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.2
  %cleanup.heap.slot.3 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.3
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local0
  %r1 = load i64, ptr %local1
  %r2 = call i64 @"kira_fn_192_clearSwapchainRenderPass"(i64 %r1)
  %cleanup.call.ptr.2 = inttoptr i64 %r2 to ptr
  store ptr %cleanup.call.ptr.2, ptr %cleanup.heap.slot.2
  %r3 = call i64 @"kira_fn_406_GraphicsFrame.beginRenderPass"(i64 %r0, i64 %r2)
  %cleanup.call.ptr.3 = inttoptr i64 %r3 to ptr
  store ptr %cleanup.call.ptr.3, ptr %cleanup.heap.slot.3
  %cleanup.heap.ptr.0 = load ptr, ptr %cleanup.heap.slot.2
  call void @free(ptr %cleanup.heap.ptr.0)
  ret i64 %r3
}

define void @"kira_fn_410_GraphicsFrame.pass"(i64 %arg0, i64 %arg1, i64 %arg2) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.GraphicsFrame
  store %t.GraphicsFrame zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.Color
  store %t.Color zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %local2 = alloca i64
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.1 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.1
  %cleanup.heap.slot.2 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.2
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  store i64 %arg2, ptr %local2
  %r0 = load i64, ptr %local0
  %r1 = load i64, ptr %local1
  %r2 = call i64 @"kira_fn_192_clearSwapchainRenderPass"(i64 %r1)
  %cleanup.call.ptr.2 = inttoptr i64 %r2 to ptr
  store ptr %cleanup.call.ptr.2, ptr %cleanup.heap.slot.2
  %r3 = load i64, ptr %local2
  call void @"kira_fn_408_GraphicsFrame.renderPass"(i64 %r0, i64 %r2, i64 %r3)
  %cleanup.heap.ptr.0 = load ptr, ptr %cleanup.heap.slot.2
  call void @free(ptr %cleanup.heap.ptr.0)
  ret void
}

define void @"kira_fn_411_GraphicsFrame.requestQuit"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.GraphicsFrame
  store %t.GraphicsFrame zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %cleanup.heap.slot.1 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.1
  store i64 %arg0, ptr %local0
  %r0 = add i1 0, 1
  %r1 = load i64, ptr %local0
  %field.base.2 = inttoptr i64 %r1 to ptr
  %field.ptr.2 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.2, i32 0, i32 42
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %store.ptr.0 = inttoptr i64 %r2 to ptr
  %store.bool.0 = zext i1 %r0 to i8
  store i8 %store.bool.0, ptr %store.ptr.0
  call void @"kira_release_contents_GraphicsFrame"(ptr %local.storage.0)
  ret void
}

define i64 @"kira_fn_412_Graphics.createShader"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.ShaderDescriptor
  store %t.ShaderDescriptor zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %local2 = alloca i64
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.3 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.3
  %cleanup.heap.slot.6 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.6
  %cleanup.heap.slot.9 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.9
  %cleanup.heap.slot.12 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.12
  %cleanup.heap.slot.16 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.16
  %cleanup.heap.slot.17 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.17
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local1
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.ShaderDescriptor, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %r2 = load %kira.string, ptr %load.ptr.2
  %r3 = load i64, ptr %local1
  %field.base.4 = inttoptr i64 %r3 to ptr
  %field.ptr.4 = getelementptr inbounds %t.ShaderDescriptor, ptr %field.base.4, i32 0, i32 1
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %load.ptr.5 = inttoptr i64 %r4 to ptr
  %r5 = load %kira.string, ptr %load.ptr.5
  %r6 = load i64, ptr %local1
  %field.base.7 = inttoptr i64 %r6 to ptr
  %field.ptr.7 = getelementptr inbounds %t.ShaderDescriptor, ptr %field.base.7, i32 0, i32 2
  %r7 = ptrtoint ptr %field.ptr.7 to i64
  %load.ptr.8 = inttoptr i64 %r7 to ptr
  %r8 = load %kira.string, ptr %load.ptr.8
  %r9 = load i64, ptr %local1
  %field.base.10 = inttoptr i64 %r9 to ptr
  %field.ptr.10 = getelementptr inbounds %t.ShaderDescriptor, ptr %field.base.10, i32 0, i32 3
  %r10 = ptrtoint ptr %field.ptr.10 to i64
  %load.ptr.11 = inttoptr i64 %r10 to ptr
  %r11 = load %kira.string, ptr %load.ptr.11
  %r12 = load i64, ptr %local1
  %field.base.13 = inttoptr i64 %r12 to ptr
  %field.ptr.13 = getelementptr inbounds %t.ShaderDescriptor, ptr %field.base.13, i32 0, i32 4
  %r13 = ptrtoint ptr %field.ptr.13 to i64
  %load.ptr.14 = inttoptr i64 %r13 to ptr
  %r14 = load %kira.string, ptr %load.ptr.14
  %r15 = call i64 @"kira_fn_73_sokolCreateShaderId"(%kira.string %r2, %kira.string %r5, %kira.string %r8, %kira.string %r11, %kira.string %r14)
  store i64 %r15, ptr %local2
  %alloc.size.ptr.16 = getelementptr %t.GraphicsShader, ptr null, i32 1
  %alloc.size.16 = ptrtoint ptr %alloc.size.ptr.16 to i64
  %alloc.empty.16 = icmp eq i64 %alloc.size.16, 0
  %alloc.bytes.16 = select i1 %alloc.empty.16, i64 1, i64 %alloc.size.16
  %alloc.ptr.16 = call ptr @malloc(i64 %alloc.bytes.16)
  store %t.GraphicsShader zeroinitializer, ptr %alloc.ptr.16
  %r16 = ptrtoint ptr %alloc.ptr.16 to i64
  store ptr %alloc.ptr.16, ptr %cleanup.heap.slot.16
  %alloc.size.ptr.17 = getelementptr %t.BackendShaderHandle, ptr null, i32 1
  %alloc.size.17 = ptrtoint ptr %alloc.size.ptr.17 to i64
  %alloc.empty.17 = icmp eq i64 %alloc.size.17, 0
  %alloc.bytes.17 = select i1 %alloc.empty.17, i64 1, i64 %alloc.size.17
  %alloc.ptr.17 = call ptr @malloc(i64 %alloc.bytes.17)
  store %t.BackendShaderHandle zeroinitializer, ptr %alloc.ptr.17
  %r17 = ptrtoint ptr %alloc.ptr.17 to i64
  store ptr %alloc.ptr.17, ptr %cleanup.heap.slot.17
  %r18 = load i64, ptr %local2
  %field.base.19 = inttoptr i64 %r17 to ptr
  %field.ptr.19 = getelementptr inbounds %t.BackendShaderHandle, ptr %field.base.19, i32 0, i32 0
  %r19 = ptrtoint ptr %field.ptr.19 to i64
  %store.ptr.18 = inttoptr i64 %r19 to ptr
  %store.cast.18 = trunc i64 %r18 to i32
  store i32 %store.cast.18, ptr %store.ptr.18
  %field.base.20 = inttoptr i64 %r16 to ptr
  %field.ptr.20 = getelementptr inbounds %t.GraphicsShader, ptr %field.base.20, i32 0, i32 0
  %r20 = ptrtoint ptr %field.ptr.20 to i64
  %copy.dst.20 = inttoptr i64 %r20 to ptr
  %copy.src.17 = inttoptr i64 %r17 to ptr
  %copy.val.20 = load %t.BackendShaderHandle, ptr %copy.src.17
  store %t.BackendShaderHandle %copy.val.20, ptr %copy.dst.20
  %r21 = load i64, ptr %local2
  %field.base.22 = inttoptr i64 %r16 to ptr
  %field.ptr.22 = getelementptr inbounds %t.GraphicsShader, ptr %field.base.22, i32 0, i32 1
  %r22 = ptrtoint ptr %field.ptr.22 to i64
  %store.ptr.21 = inttoptr i64 %r22 to ptr
  %store.cast.21 = trunc i64 %r21 to i32
  store i32 %store.cast.21, ptr %store.ptr.21
  %cleanup.heap.ptr.0 = load ptr, ptr %cleanup.heap.slot.17
  call void @free(ptr %cleanup.heap.ptr.0)
  ret i64 %r16
}

define i64 @"kira_fn_413_Graphics.createShaderFromKsl"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.KslShaderDescriptor
  store %t.KslShaderDescriptor zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %local2 = alloca i64
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.3 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.3
  %cleanup.heap.slot.6 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.6
  %cleanup.heap.slot.10 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.10
  %cleanup.heap.slot.11 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.11
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local1
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.KslShaderDescriptor, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %r2 = load %kira.string, ptr %load.ptr.2
  %r3 = load i64, ptr %local1
  %field.base.4 = inttoptr i64 %r3 to ptr
  %field.ptr.4 = getelementptr inbounds %t.KslShaderDescriptor, ptr %field.base.4, i32 0, i32 1
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %load.ptr.5 = inttoptr i64 %r4 to ptr
  %r5 = load %kira.string, ptr %load.ptr.5
  %r6 = load i64, ptr %local1
  %field.base.7 = inttoptr i64 %r6 to ptr
  %field.ptr.7 = getelementptr inbounds %t.KslShaderDescriptor, ptr %field.base.7, i32 0, i32 2
  %r7 = ptrtoint ptr %field.ptr.7 to i64
  %load.ptr.8 = inttoptr i64 %r7 to ptr
  %r8 = load %kira.string, ptr %load.ptr.8
  %r9 = call i64 @"kira_fn_74_sokolCreateShaderFromKslId"(%kira.string %r2, %kira.string %r5, %kira.string %r8)
  store i64 %r9, ptr %local2
  %alloc.size.ptr.10 = getelementptr %t.GraphicsShader, ptr null, i32 1
  %alloc.size.10 = ptrtoint ptr %alloc.size.ptr.10 to i64
  %alloc.empty.10 = icmp eq i64 %alloc.size.10, 0
  %alloc.bytes.10 = select i1 %alloc.empty.10, i64 1, i64 %alloc.size.10
  %alloc.ptr.10 = call ptr @malloc(i64 %alloc.bytes.10)
  store %t.GraphicsShader zeroinitializer, ptr %alloc.ptr.10
  %r10 = ptrtoint ptr %alloc.ptr.10 to i64
  store ptr %alloc.ptr.10, ptr %cleanup.heap.slot.10
  %alloc.size.ptr.11 = getelementptr %t.BackendShaderHandle, ptr null, i32 1
  %alloc.size.11 = ptrtoint ptr %alloc.size.ptr.11 to i64
  %alloc.empty.11 = icmp eq i64 %alloc.size.11, 0
  %alloc.bytes.11 = select i1 %alloc.empty.11, i64 1, i64 %alloc.size.11
  %alloc.ptr.11 = call ptr @malloc(i64 %alloc.bytes.11)
  store %t.BackendShaderHandle zeroinitializer, ptr %alloc.ptr.11
  %r11 = ptrtoint ptr %alloc.ptr.11 to i64
  store ptr %alloc.ptr.11, ptr %cleanup.heap.slot.11
  %r12 = load i64, ptr %local2
  %field.base.13 = inttoptr i64 %r11 to ptr
  %field.ptr.13 = getelementptr inbounds %t.BackendShaderHandle, ptr %field.base.13, i32 0, i32 0
  %r13 = ptrtoint ptr %field.ptr.13 to i64
  %store.ptr.12 = inttoptr i64 %r13 to ptr
  %store.cast.12 = trunc i64 %r12 to i32
  store i32 %store.cast.12, ptr %store.ptr.12
  %field.base.14 = inttoptr i64 %r10 to ptr
  %field.ptr.14 = getelementptr inbounds %t.GraphicsShader, ptr %field.base.14, i32 0, i32 0
  %r14 = ptrtoint ptr %field.ptr.14 to i64
  %copy.dst.14 = inttoptr i64 %r14 to ptr
  %copy.src.11 = inttoptr i64 %r11 to ptr
  %copy.val.14 = load %t.BackendShaderHandle, ptr %copy.src.11
  store %t.BackendShaderHandle %copy.val.14, ptr %copy.dst.14
  %r15 = load i64, ptr %local2
  %field.base.16 = inttoptr i64 %r10 to ptr
  %field.ptr.16 = getelementptr inbounds %t.GraphicsShader, ptr %field.base.16, i32 0, i32 1
  %r16 = ptrtoint ptr %field.ptr.16 to i64
  %store.ptr.15 = inttoptr i64 %r16 to ptr
  %store.cast.15 = trunc i64 %r15 to i32
  store i32 %store.cast.15, ptr %store.ptr.15
  %cleanup.heap.ptr.0 = load ptr, ptr %cleanup.heap.slot.11
  call void @free(ptr %cleanup.heap.ptr.0)
  ret i64 %r10
}

define void @"kira_fn_414_Graphics.destroyShader"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.GraphicsShader
  store %t.GraphicsShader zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local1
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.GraphicsShader, ptr %field.base.1, i32 0, i32 1
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.raw.2 = load i32, ptr %load.ptr.2
  %r2 = sext i32 %load.raw.2 to i64
  call void @"kira_fn_75_sokolDestroyShaderId"(i64 %r2)
  ret void
}

define i64 @"kira_fn_415_Graphics.createRenderPipeline"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.RenderPipelineDescriptor
  store %t.RenderPipelineDescriptor zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.1 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.1
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local1
  %r1 = call i64 @"kira_fn_71_sokolCreateRenderPipeline"(i64 %r0)
  %cleanup.call.ptr.1 = inttoptr i64 %r1 to ptr
  store ptr %cleanup.call.ptr.1, ptr %cleanup.heap.slot.1
  ret i64 %r1
}

define void @"kira_fn_416_Graphics.destroyPipeline"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.RenderPipeline
  store %t.RenderPipeline zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local1
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.RenderPipeline, ptr %field.base.1, i32 0, i32 1
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.raw.2 = load i32, ptr %load.ptr.2
  %r2 = sext i32 %load.raw.2 to i64
  call void @"kira_fn_72_sokolDestroyRenderPipelineId"(i64 %r2)
  ret void
}

define void @"kira_fn_417_Graphics.destroyRenderPipeline"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.RenderPipeline
  store %t.RenderPipeline zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.1 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.1
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local0
  %r1 = load i64, ptr %local1
  call void @"kira_fn_416_Graphics.destroyPipeline"(i64 %r0, i64 %r1)
  ret void
}

define i64 @"kira_fn_418_Graphics.createBuffer"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.BufferDescriptor
  store %t.BufferDescriptor zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %local2 = alloca i64
  %local3 = alloca i64
  %local4 = alloca i64
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.3 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.3
  %cleanup.heap.slot.6 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.6
  %cleanup.heap.slot.9 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.9
  %cleanup.heap.slot.16 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.16
  %cleanup.heap.slot.23 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.23
  %cleanup.heap.slot.33 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.33
  %cleanup.heap.slot.34 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.34
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local1
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.BufferDescriptor, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %r2 = load %kira.string, ptr %load.ptr.2
  %r3 = load i64, ptr %local1
  %field.base.4 = inttoptr i64 %r3 to ptr
  %field.ptr.4 = getelementptr inbounds %t.BufferDescriptor, ptr %field.base.4, i32 0, i32 1
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %load.ptr.5 = inttoptr i64 %r4 to ptr
  %load.raw.5 = load i64, ptr %load.ptr.5
  %r5 = load i64, ptr %load.ptr.5
  %r6 = load i64, ptr %local1
  %field.base.7 = inttoptr i64 %r6 to ptr
  %field.ptr.7 = getelementptr inbounds %t.BufferDescriptor, ptr %field.base.7, i32 0, i32 2
  %r7 = ptrtoint ptr %field.ptr.7 to i64
  %load.ptr.8 = inttoptr i64 %r7 to ptr
  %load.raw.8 = load i64, ptr %load.ptr.8
  %r8 = load i64, ptr %load.ptr.8
  %r9 = load i64, ptr %local1
  %field.base.10 = inttoptr i64 %r9 to ptr
  %field.ptr.10 = getelementptr inbounds %t.BufferDescriptor, ptr %field.base.10, i32 0, i32 3
  %r10 = ptrtoint ptr %field.ptr.10 to i64
  %load.ptr.11 = inttoptr i64 %r10 to ptr
  %load.arrayptr.11 = load ptr, ptr %load.ptr.11
  %r11 = ptrtoint ptr %load.arrayptr.11 to i64
  %array.ptr.12 = inttoptr i64 %r11 to ptr
  %r12 = call i64 @"kira_array_len"(ptr %array.ptr.12)
  %r13 = call i64 @"kira_fn_54_sokolBeginFloatBufferUpload"(%kira.string %r2, i64 %r5, i64 %r8, i64 %r12)
  store i64 %r13, ptr %local2
  %r14 = add i64 0, 0
  store i64 %r14, ptr %local3
  br label %kira_label_0
kira_label_0:
  %r15 = load i64, ptr %local3
  %r16 = load i64, ptr %local1
  %field.base.17 = inttoptr i64 %r16 to ptr
  %field.ptr.17 = getelementptr inbounds %t.BufferDescriptor, ptr %field.base.17, i32 0, i32 3
  %r17 = ptrtoint ptr %field.ptr.17 to i64
  %load.ptr.18 = inttoptr i64 %r17 to ptr
  %load.arrayptr.18 = load ptr, ptr %load.ptr.18
  %r18 = ptrtoint ptr %load.arrayptr.18 to i64
  %array.ptr.19 = inttoptr i64 %r18 to ptr
  %r19 = call i64 @"kira_array_len"(ptr %array.ptr.19)
  %r20 = icmp slt i64 %r15, %r19
  br i1 %r20, label %kira_label_1, label %kira_label_2
kira_label_1:
  %r21 = load i64, ptr %local2
  %r22 = load i64, ptr %local3
  %r23 = load i64, ptr %local1
  %field.base.24 = inttoptr i64 %r23 to ptr
  %field.ptr.24 = getelementptr inbounds %t.BufferDescriptor, ptr %field.base.24, i32 0, i32 3
  %r24 = ptrtoint ptr %field.ptr.24 to i64
  %load.ptr.25 = inttoptr i64 %r24 to ptr
  %load.arrayptr.25 = load ptr, ptr %load.ptr.25
  %r25 = ptrtoint ptr %load.arrayptr.25 to i64
  %r26 = load i64, ptr %local3
  %array.get.ptr.27 = inttoptr i64 %r25 to ptr
  %array.get.val.ptr.0 = alloca %kira.bridge.value
  call void @"kira_array_load"(ptr %array.get.ptr.27, i64 %r26, ptr %array.get.val.ptr.0)
  %array.get.val.0 = load %kira.bridge.value, ptr %array.get.val.ptr.0
  %array.get.bits.0 = extractvalue %kira.bridge.value %array.get.val.0, 2
  %r27 = bitcast i64 %array.get.bits.0 to double
  call void @"kira_fn_55_sokolSetFloatBufferUploadValue"(i64 %r21, i64 %r22, double %r27)
  %r28 = load i64, ptr %local3
  %r29 = add i64 0, 1
  %r30 = add i64 %r28, %r29
  store i64 %r30, ptr %local3
  br label %kira_label_0
kira_label_2:
  %r31 = load i64, ptr %local2
  %r32 = call i64 @"kira_fn_56_sokolFinalizeFloatBufferUpload"(i64 %r31)
  store i64 %r32, ptr %local4
  %alloc.size.ptr.33 = getelementptr %t.GraphicsBuffer, ptr null, i32 1
  %alloc.size.33 = ptrtoint ptr %alloc.size.ptr.33 to i64
  %alloc.empty.33 = icmp eq i64 %alloc.size.33, 0
  %alloc.bytes.33 = select i1 %alloc.empty.33, i64 1, i64 %alloc.size.33
  %alloc.ptr.33 = call ptr @malloc(i64 %alloc.bytes.33)
  store %t.GraphicsBuffer zeroinitializer, ptr %alloc.ptr.33
  %r33 = ptrtoint ptr %alloc.ptr.33 to i64
  store ptr %alloc.ptr.33, ptr %cleanup.heap.slot.33
  %alloc.size.ptr.34 = getelementptr %t.BackendBufferHandle, ptr null, i32 1
  %alloc.size.34 = ptrtoint ptr %alloc.size.ptr.34 to i64
  %alloc.empty.34 = icmp eq i64 %alloc.size.34, 0
  %alloc.bytes.34 = select i1 %alloc.empty.34, i64 1, i64 %alloc.size.34
  %alloc.ptr.34 = call ptr @malloc(i64 %alloc.bytes.34)
  store %t.BackendBufferHandle zeroinitializer, ptr %alloc.ptr.34
  %r34 = ptrtoint ptr %alloc.ptr.34 to i64
  store ptr %alloc.ptr.34, ptr %cleanup.heap.slot.34
  %r35 = load i64, ptr %local4
  %field.base.36 = inttoptr i64 %r34 to ptr
  %field.ptr.36 = getelementptr inbounds %t.BackendBufferHandle, ptr %field.base.36, i32 0, i32 0
  %r36 = ptrtoint ptr %field.ptr.36 to i64
  %store.ptr.35 = inttoptr i64 %r36 to ptr
  %store.cast.35 = trunc i64 %r35 to i32
  store i32 %store.cast.35, ptr %store.ptr.35
  %field.base.37 = inttoptr i64 %r33 to ptr
  %field.ptr.37 = getelementptr inbounds %t.GraphicsBuffer, ptr %field.base.37, i32 0, i32 0
  %r37 = ptrtoint ptr %field.ptr.37 to i64
  %copy.dst.37 = inttoptr i64 %r37 to ptr
  %copy.src.34 = inttoptr i64 %r34 to ptr
  %copy.val.37 = load %t.BackendBufferHandle, ptr %copy.src.34
  store %t.BackendBufferHandle %copy.val.37, ptr %copy.dst.37
  %r38 = load i64, ptr %local4
  %field.base.39 = inttoptr i64 %r33 to ptr
  %field.ptr.39 = getelementptr inbounds %t.GraphicsBuffer, ptr %field.base.39, i32 0, i32 1
  %r39 = ptrtoint ptr %field.ptr.39 to i64
  %store.ptr.38 = inttoptr i64 %r39 to ptr
  %store.cast.38 = trunc i64 %r38 to i32
  store i32 %store.cast.38, ptr %store.ptr.38
  %cleanup.heap.ptr.1 = load ptr, ptr %cleanup.heap.slot.34
  call void @free(ptr %cleanup.heap.ptr.1)
  ret i64 %r33
}

define i64 @"kira_fn_419_Graphics.createIndexBuffer"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.IndexBufferDescriptor
  store %t.IndexBufferDescriptor zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %local2 = alloca i64
  %local3 = alloca i64
  %local4 = alloca i64
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.3 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.3
  %cleanup.heap.slot.6 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.6
  %cleanup.heap.slot.13 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.13
  %cleanup.heap.slot.20 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.20
  %cleanup.heap.slot.30 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.30
  %cleanup.heap.slot.31 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.31
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local1
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.IndexBufferDescriptor, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %r2 = load %kira.string, ptr %load.ptr.2
  %r3 = load i64, ptr %local1
  %field.base.4 = inttoptr i64 %r3 to ptr
  %field.ptr.4 = getelementptr inbounds %t.IndexBufferDescriptor, ptr %field.base.4, i32 0, i32 1
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %load.ptr.5 = inttoptr i64 %r4 to ptr
  %load.raw.5 = load i64, ptr %load.ptr.5
  %r5 = load i64, ptr %load.ptr.5
  %r6 = load i64, ptr %local1
  %field.base.7 = inttoptr i64 %r6 to ptr
  %field.ptr.7 = getelementptr inbounds %t.IndexBufferDescriptor, ptr %field.base.7, i32 0, i32 2
  %r7 = ptrtoint ptr %field.ptr.7 to i64
  %load.ptr.8 = inttoptr i64 %r7 to ptr
  %load.arrayptr.8 = load ptr, ptr %load.ptr.8
  %r8 = ptrtoint ptr %load.arrayptr.8 to i64
  %array.ptr.9 = inttoptr i64 %r8 to ptr
  %r9 = call i64 @"kira_array_len"(ptr %array.ptr.9)
  %r10 = call i64 @"kira_fn_57_sokolBeginIndexBufferUpload"(%kira.string %r2, i64 %r5, i64 %r9)
  store i64 %r10, ptr %local2
  %r11 = add i64 0, 0
  store i64 %r11, ptr %local3
  br label %kira_label_0
kira_label_0:
  %r12 = load i64, ptr %local3
  %r13 = load i64, ptr %local1
  %field.base.14 = inttoptr i64 %r13 to ptr
  %field.ptr.14 = getelementptr inbounds %t.IndexBufferDescriptor, ptr %field.base.14, i32 0, i32 2
  %r14 = ptrtoint ptr %field.ptr.14 to i64
  %load.ptr.15 = inttoptr i64 %r14 to ptr
  %load.arrayptr.15 = load ptr, ptr %load.ptr.15
  %r15 = ptrtoint ptr %load.arrayptr.15 to i64
  %array.ptr.16 = inttoptr i64 %r15 to ptr
  %r16 = call i64 @"kira_array_len"(ptr %array.ptr.16)
  %r17 = icmp slt i64 %r12, %r16
  br i1 %r17, label %kira_label_1, label %kira_label_2
kira_label_1:
  %r18 = load i64, ptr %local2
  %r19 = load i64, ptr %local3
  %r20 = load i64, ptr %local1
  %field.base.21 = inttoptr i64 %r20 to ptr
  %field.ptr.21 = getelementptr inbounds %t.IndexBufferDescriptor, ptr %field.base.21, i32 0, i32 2
  %r21 = ptrtoint ptr %field.ptr.21 to i64
  %load.ptr.22 = inttoptr i64 %r21 to ptr
  %load.arrayptr.22 = load ptr, ptr %load.ptr.22
  %r22 = ptrtoint ptr %load.arrayptr.22 to i64
  %r23 = load i64, ptr %local3
  %array.get.ptr.24 = inttoptr i64 %r22 to ptr
  %array.get.val.ptr.0 = alloca %kira.bridge.value
  call void @"kira_array_load"(ptr %array.get.ptr.24, i64 %r23, ptr %array.get.val.ptr.0)
  %array.get.val.0 = load %kira.bridge.value, ptr %array.get.val.ptr.0
  %r24 = extractvalue %kira.bridge.value %array.get.val.0, 2
  call void @"kira_fn_58_sokolSetIndexBufferUploadValue"(i64 %r18, i64 %r19, i64 %r24)
  %r25 = load i64, ptr %local3
  %r26 = add i64 0, 1
  %r27 = add i64 %r25, %r26
  store i64 %r27, ptr %local3
  br label %kira_label_0
kira_label_2:
  %r28 = load i64, ptr %local2
  %r29 = call i64 @"kira_fn_59_sokolFinalizeIndexBufferUpload"(i64 %r28)
  store i64 %r29, ptr %local4
  %alloc.size.ptr.30 = getelementptr %t.GraphicsBuffer, ptr null, i32 1
  %alloc.size.30 = ptrtoint ptr %alloc.size.ptr.30 to i64
  %alloc.empty.30 = icmp eq i64 %alloc.size.30, 0
  %alloc.bytes.30 = select i1 %alloc.empty.30, i64 1, i64 %alloc.size.30
  %alloc.ptr.30 = call ptr @malloc(i64 %alloc.bytes.30)
  store %t.GraphicsBuffer zeroinitializer, ptr %alloc.ptr.30
  %r30 = ptrtoint ptr %alloc.ptr.30 to i64
  store ptr %alloc.ptr.30, ptr %cleanup.heap.slot.30
  %alloc.size.ptr.31 = getelementptr %t.BackendBufferHandle, ptr null, i32 1
  %alloc.size.31 = ptrtoint ptr %alloc.size.ptr.31 to i64
  %alloc.empty.31 = icmp eq i64 %alloc.size.31, 0
  %alloc.bytes.31 = select i1 %alloc.empty.31, i64 1, i64 %alloc.size.31
  %alloc.ptr.31 = call ptr @malloc(i64 %alloc.bytes.31)
  store %t.BackendBufferHandle zeroinitializer, ptr %alloc.ptr.31
  %r31 = ptrtoint ptr %alloc.ptr.31 to i64
  store ptr %alloc.ptr.31, ptr %cleanup.heap.slot.31
  %r32 = load i64, ptr %local4
  %field.base.33 = inttoptr i64 %r31 to ptr
  %field.ptr.33 = getelementptr inbounds %t.BackendBufferHandle, ptr %field.base.33, i32 0, i32 0
  %r33 = ptrtoint ptr %field.ptr.33 to i64
  %store.ptr.32 = inttoptr i64 %r33 to ptr
  %store.cast.32 = trunc i64 %r32 to i32
  store i32 %store.cast.32, ptr %store.ptr.32
  %field.base.34 = inttoptr i64 %r30 to ptr
  %field.ptr.34 = getelementptr inbounds %t.GraphicsBuffer, ptr %field.base.34, i32 0, i32 0
  %r34 = ptrtoint ptr %field.ptr.34 to i64
  %copy.dst.34 = inttoptr i64 %r34 to ptr
  %copy.src.31 = inttoptr i64 %r31 to ptr
  %copy.val.34 = load %t.BackendBufferHandle, ptr %copy.src.31
  store %t.BackendBufferHandle %copy.val.34, ptr %copy.dst.34
  %r35 = load i64, ptr %local4
  %field.base.36 = inttoptr i64 %r30 to ptr
  %field.ptr.36 = getelementptr inbounds %t.GraphicsBuffer, ptr %field.base.36, i32 0, i32 1
  %r36 = ptrtoint ptr %field.ptr.36 to i64
  %store.ptr.35 = inttoptr i64 %r36 to ptr
  %store.cast.35 = trunc i64 %r35 to i32
  store i32 %store.cast.35, ptr %store.ptr.35
  %cleanup.heap.ptr.1 = load ptr, ptr %cleanup.heap.slot.31
  call void @free(ptr %cleanup.heap.ptr.1)
  ret i64 %r30
}

define void @"kira_fn_420_Graphics.destroyBuffer"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.GraphicsBuffer
  store %t.GraphicsBuffer zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local1
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.GraphicsBuffer, ptr %field.base.1, i32 0, i32 1
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.raw.2 = load i32, ptr %load.ptr.2
  %r2 = sext i32 %load.raw.2 to i64
  call void @"kira_fn_60_sokolDestroyBufferId"(i64 %r2)
  ret void
}

define i64 @"kira_fn_421_Graphics.createUniform"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.UniformDescriptor
  store %t.UniformDescriptor zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %local2 = alloca i64
  %local3 = alloca i64
  %local.storage.3 = alloca %t.GraphicsUniform
  store %t.GraphicsUniform zeroinitializer, ptr %local.storage.3
  %local.storage.int.3 = ptrtoint ptr %local.storage.3 to i64
  store i64 %local.storage.int.3, ptr %local3
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.3 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.3
  %cleanup.heap.slot.7 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.7
  %cleanup.heap.slot.8 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.8
  %cleanup.heap.slot.14 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.14
  %cleanup.heap.slot.15 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.15
  %cleanup.heap.slot.16 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.16
  %cleanup.heap.slot.17 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.17
  %cleanup.heap.slot.20 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.20
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local1
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.UniformDescriptor, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %r2 = load %kira.string, ptr %load.ptr.2
  %r3 = load i64, ptr %local1
  %field.base.4 = inttoptr i64 %r3 to ptr
  %field.ptr.4 = getelementptr inbounds %t.UniformDescriptor, ptr %field.base.4, i32 0, i32 1
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %load.ptr.5 = inttoptr i64 %r4 to ptr
  %load.raw.5 = load i64, ptr %load.ptr.5
  %r5 = load i64, ptr %load.ptr.5
  %r6 = call i64 @"kira_fn_181_sokolCreateUniformId"(%kira.string %r2, i64 %r5)
  store i64 %r6, ptr %local2
  %alloc.size.ptr.7 = getelementptr %t.GraphicsUniform, ptr null, i32 1
  %alloc.size.7 = ptrtoint ptr %alloc.size.ptr.7 to i64
  %alloc.empty.7 = icmp eq i64 %alloc.size.7, 0
  %alloc.bytes.7 = select i1 %alloc.empty.7, i64 1, i64 %alloc.size.7
  %alloc.ptr.7 = call ptr @malloc(i64 %alloc.bytes.7)
  store %t.GraphicsUniform zeroinitializer, ptr %alloc.ptr.7
  %r7 = ptrtoint ptr %alloc.ptr.7 to i64
  store ptr %alloc.ptr.7, ptr %cleanup.heap.slot.7
  %alloc.size.ptr.8 = getelementptr %t.BackendUniformHandle, ptr null, i32 1
  %alloc.size.8 = ptrtoint ptr %alloc.size.ptr.8 to i64
  %alloc.empty.8 = icmp eq i64 %alloc.size.8, 0
  %alloc.bytes.8 = select i1 %alloc.empty.8, i64 1, i64 %alloc.size.8
  %alloc.ptr.8 = call ptr @malloc(i64 %alloc.bytes.8)
  store %t.BackendUniformHandle zeroinitializer, ptr %alloc.ptr.8
  %r8 = ptrtoint ptr %alloc.ptr.8 to i64
  store ptr %alloc.ptr.8, ptr %cleanup.heap.slot.8
  %r9 = load i64, ptr %local2
  %field.base.10 = inttoptr i64 %r8 to ptr
  %field.ptr.10 = getelementptr inbounds %t.BackendUniformHandle, ptr %field.base.10, i32 0, i32 0
  %r10 = ptrtoint ptr %field.ptr.10 to i64
  %store.ptr.9 = inttoptr i64 %r10 to ptr
  %store.cast.9 = trunc i64 %r9 to i32
  store i32 %store.cast.9, ptr %store.ptr.9
  %field.base.11 = inttoptr i64 %r7 to ptr
  %field.ptr.11 = getelementptr inbounds %t.GraphicsUniform, ptr %field.base.11, i32 0, i32 0
  %r11 = ptrtoint ptr %field.ptr.11 to i64
  %copy.dst.11 = inttoptr i64 %r11 to ptr
  %copy.src.8 = inttoptr i64 %r8 to ptr
  %copy.val.11 = load %t.BackendUniformHandle, ptr %copy.src.8
  store %t.BackendUniformHandle %copy.val.11, ptr %copy.dst.11
  %r12 = load i64, ptr %local2
  %field.base.13 = inttoptr i64 %r7 to ptr
  %field.ptr.13 = getelementptr inbounds %t.GraphicsUniform, ptr %field.base.13, i32 0, i32 1
  %r13 = ptrtoint ptr %field.ptr.13 to i64
  %store.ptr.12 = inttoptr i64 %r13 to ptr
  %store.cast.12 = trunc i64 %r12 to i32
  store i32 %store.cast.12, ptr %store.ptr.12
  %r14 = load i64, ptr %local3
  %copy.dst.14 = inttoptr i64 %r14 to ptr
  %copy.src.7 = inttoptr i64 %r7 to ptr
  %copy.val.14 = load %t.GraphicsUniform, ptr %copy.src.7
  store %t.GraphicsUniform %copy.val.14, ptr %copy.dst.14
  %r15 = load i64, ptr %local0
  %r16 = load i64, ptr %local3
  %r17 = load i64, ptr %local1
  %field.base.18 = inttoptr i64 %r17 to ptr
  %field.ptr.18 = getelementptr inbounds %t.UniformDescriptor, ptr %field.base.18, i32 0, i32 2
  %r18 = ptrtoint ptr %field.ptr.18 to i64
  %load.ptr.19 = inttoptr i64 %r18 to ptr
  %load.arrayptr.19 = load ptr, ptr %load.ptr.19
  %r19 = ptrtoint ptr %load.arrayptr.19 to i64
  call void @"kira_fn_422_Graphics.updateUniform"(i64 %r15, i64 %r16, i64 %r19)
  %r20 = load i64, ptr %local3
  %return.struct.src.0 = inttoptr i64 %r20 to ptr
  %return.struct.value.0 = load %t.GraphicsUniform, ptr %return.struct.src.0
  %return.struct.size.ptr.0 = getelementptr %t.GraphicsUniform, ptr null, i32 1
  %return.struct.size.0 = ptrtoint ptr %return.struct.size.ptr.0 to i64
  %return.struct.copy.0 = call ptr @malloc(i64 %return.struct.size.0)
  store %t.GraphicsUniform %return.struct.value.0, ptr %return.struct.copy.0
  %return.struct.ptrint.0 = ptrtoint ptr %return.struct.copy.0 to i64
  %cleanup.heap.ptr.1 = load ptr, ptr %cleanup.heap.slot.7
  call void @free(ptr %cleanup.heap.ptr.1)
  %cleanup.heap.ptr.2 = load ptr, ptr %cleanup.heap.slot.8
  call void @free(ptr %cleanup.heap.ptr.2)
  ret i64 %return.struct.ptrint.0
}

define void @"kira_fn_422_Graphics.updateUniform"(i64 %arg0, i64 %arg1, i64 %arg2) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.GraphicsUniform
  store %t.GraphicsUniform zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %local2 = alloca i64
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  store i64 %arg2, ptr %local2
  %r0 = load i64, ptr %local1
  %r1 = load i64, ptr %local2
  call void @"kira_fn_182_updateGraphicsUniform"(i64 %r0, i64 %r1)
  ret void
}

define void @"kira_fn_423_Graphics.destroyUniform"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.GraphicsUniform
  store %t.GraphicsUniform zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local1
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.GraphicsUniform, ptr %field.base.1, i32 0, i32 1
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.raw.2 = load i32, ptr %load.ptr.2
  %r2 = sext i32 %load.raw.2 to i64
  call void @"kira_fn_183_sokolDestroyUniformId"(i64 %r2)
  ret void
}

define i64 @"kira_fn_424_Graphics.createBindGroup"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.BindGroupDescriptor
  store %t.BindGroupDescriptor zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %local2 = alloca i64
  %local3 = alloca i64
  %local4 = alloca i64
  %local.storage.4 = alloca %t.UniformBindEntry
  store %t.UniformBindEntry zeroinitializer, ptr %local.storage.4
  %local.storage.int.4 = ptrtoint ptr %local.storage.4 to i64
  store i64 %local.storage.int.4, ptr %local4
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.6 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.6
  %cleanup.heap.slot.11 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.11
  %cleanup.heap.slot.15 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.15
  %cleanup.heap.slot.16 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.16
  %cleanup.heap.slot.19 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.19
  %cleanup.heap.slot.22 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.22
  %cleanup.heap.slot.29 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.29
  %cleanup.heap.slot.30 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.30
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local1
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.BindGroupDescriptor, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %r2 = load %kira.string, ptr %load.ptr.2
  %r3 = call i64 @"kira_fn_184_sokolCreateBindGroupId"(%kira.string %r2)
  store i64 %r3, ptr %local2
  %r4 = add i64 0, 0
  store i64 %r4, ptr %local3
  br label %kira_label_0
kira_label_0:
  %r5 = load i64, ptr %local3
  %r6 = load i64, ptr %local1
  %field.base.7 = inttoptr i64 %r6 to ptr
  %field.ptr.7 = getelementptr inbounds %t.BindGroupDescriptor, ptr %field.base.7, i32 0, i32 1
  %r7 = ptrtoint ptr %field.ptr.7 to i64
  %load.ptr.8 = inttoptr i64 %r7 to ptr
  %load.arrayptr.8 = load ptr, ptr %load.ptr.8
  %r8 = ptrtoint ptr %load.arrayptr.8 to i64
  %array.ptr.9 = inttoptr i64 %r8 to ptr
  %r9 = call i64 @"kira_array_len"(ptr %array.ptr.9)
  %r10 = icmp slt i64 %r5, %r9
  br i1 %r10, label %kira_label_1, label %kira_label_2
kira_label_1:
  %r11 = load i64, ptr %local1
  %field.base.12 = inttoptr i64 %r11 to ptr
  %field.ptr.12 = getelementptr inbounds %t.BindGroupDescriptor, ptr %field.base.12, i32 0, i32 1
  %r12 = ptrtoint ptr %field.ptr.12 to i64
  %load.ptr.13 = inttoptr i64 %r12 to ptr
  %load.arrayptr.13 = load ptr, ptr %load.ptr.13
  %r13 = ptrtoint ptr %load.arrayptr.13 to i64
  %r14 = load i64, ptr %local3
  %array.get.ptr.15 = inttoptr i64 %r13 to ptr
  %array.get.val.ptr.0 = alloca %kira.bridge.value
  call void @"kira_array_load"(ptr %array.get.ptr.15, i64 %r14, ptr %array.get.val.ptr.0)
  %array.get.val.0 = load %kira.bridge.value, ptr %array.get.val.ptr.0
  %r15 = extractvalue %kira.bridge.value %array.get.val.0, 2
  %r16 = load i64, ptr %local4
  %copy.dst.16 = inttoptr i64 %r16 to ptr
  %copy.src.15 = inttoptr i64 %r15 to ptr
  %copy.val.16 = load %t.UniformBindEntry, ptr %copy.src.15
  store %t.UniformBindEntry %copy.val.16, ptr %copy.dst.16
  %r17 = load i64, ptr %local2
  %r18 = load i64, ptr %local3
  %r19 = load i64, ptr %local4
  %field.base.20 = inttoptr i64 %r19 to ptr
  %field.ptr.20 = getelementptr inbounds %t.UniformBindEntry, ptr %field.base.20, i32 0, i32 0
  %r20 = ptrtoint ptr %field.ptr.20 to i64
  %load.ptr.21 = inttoptr i64 %r20 to ptr
  %load.raw.21 = load i64, ptr %load.ptr.21
  %r21 = load i64, ptr %load.ptr.21
  %r22 = load i64, ptr %local4
  %field.base.23 = inttoptr i64 %r22 to ptr
  %field.ptr.23 = getelementptr inbounds %t.UniformBindEntry, ptr %field.base.23, i32 0, i32 1
  %r23 = ptrtoint ptr %field.ptr.23 to i64
  %field.base.24 = inttoptr i64 %r23 to ptr
  %field.ptr.24 = getelementptr inbounds %t.GraphicsUniform, ptr %field.base.24, i32 0, i32 1
  %r24 = ptrtoint ptr %field.ptr.24 to i64
  %load.ptr.25 = inttoptr i64 %r24 to ptr
  %load.raw.25 = load i32, ptr %load.ptr.25
  %r25 = sext i32 %load.raw.25 to i64
  call void @"kira_fn_185_sokolSetBindGroupUniform"(i64 %r17, i64 %r18, i64 %r21, i64 %r25)
  %r26 = load i64, ptr %local3
  %r27 = add i64 0, 1
  %r28 = add i64 %r26, %r27
  store i64 %r28, ptr %local3
  br label %kira_label_0
kira_label_2:
  %alloc.size.ptr.29 = getelementptr %t.BindGroup, ptr null, i32 1
  %alloc.size.29 = ptrtoint ptr %alloc.size.ptr.29 to i64
  %alloc.empty.29 = icmp eq i64 %alloc.size.29, 0
  %alloc.bytes.29 = select i1 %alloc.empty.29, i64 1, i64 %alloc.size.29
  %alloc.ptr.29 = call ptr @malloc(i64 %alloc.bytes.29)
  store %t.BindGroup zeroinitializer, ptr %alloc.ptr.29
  %r29 = ptrtoint ptr %alloc.ptr.29 to i64
  store ptr %alloc.ptr.29, ptr %cleanup.heap.slot.29
  %alloc.size.ptr.30 = getelementptr %t.BackendBindGroupHandle, ptr null, i32 1
  %alloc.size.30 = ptrtoint ptr %alloc.size.ptr.30 to i64
  %alloc.empty.30 = icmp eq i64 %alloc.size.30, 0
  %alloc.bytes.30 = select i1 %alloc.empty.30, i64 1, i64 %alloc.size.30
  %alloc.ptr.30 = call ptr @malloc(i64 %alloc.bytes.30)
  store %t.BackendBindGroupHandle zeroinitializer, ptr %alloc.ptr.30
  %r30 = ptrtoint ptr %alloc.ptr.30 to i64
  store ptr %alloc.ptr.30, ptr %cleanup.heap.slot.30
  %r31 = load i64, ptr %local2
  %field.base.32 = inttoptr i64 %r30 to ptr
  %field.ptr.32 = getelementptr inbounds %t.BackendBindGroupHandle, ptr %field.base.32, i32 0, i32 0
  %r32 = ptrtoint ptr %field.ptr.32 to i64
  %store.ptr.31 = inttoptr i64 %r32 to ptr
  %store.cast.31 = trunc i64 %r31 to i32
  store i32 %store.cast.31, ptr %store.ptr.31
  %field.base.33 = inttoptr i64 %r29 to ptr
  %field.ptr.33 = getelementptr inbounds %t.BindGroup, ptr %field.base.33, i32 0, i32 0
  %r33 = ptrtoint ptr %field.ptr.33 to i64
  %copy.dst.33 = inttoptr i64 %r33 to ptr
  %copy.src.30 = inttoptr i64 %r30 to ptr
  %copy.val.33 = load %t.BackendBindGroupHandle, ptr %copy.src.30
  store %t.BackendBindGroupHandle %copy.val.33, ptr %copy.dst.33
  %r34 = load i64, ptr %local2
  %field.base.35 = inttoptr i64 %r29 to ptr
  %field.ptr.35 = getelementptr inbounds %t.BindGroup, ptr %field.base.35, i32 0, i32 1
  %r35 = ptrtoint ptr %field.ptr.35 to i64
  %store.ptr.34 = inttoptr i64 %r35 to ptr
  %store.cast.34 = trunc i64 %r34 to i32
  store i32 %store.cast.34, ptr %store.ptr.34
  %cleanup.heap.ptr.1 = load ptr, ptr %cleanup.heap.slot.30
  call void @free(ptr %cleanup.heap.ptr.1)
  ret i64 %r29
}

define i64 @"kira_fn_425_Graphics.createUniformBindGroup"(i64 %arg0, %kira.string %arg1, i64 %arg2, i64 %arg3) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca %kira.string
  %local2 = alloca i64
  %local3 = alloca i64
  %local.storage.3 = alloca %t.GraphicsUniform
  store %t.GraphicsUniform zeroinitializer, ptr %local.storage.3
  %local.storage.int.3 = ptrtoint ptr %local.storage.3 to i64
  store i64 %local.storage.int.3, ptr %local3
  %local4 = alloca i64
  %cleanup.heap.slot.5 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.5
  %cleanup.heap.slot.8 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.8
  %cleanup.heap.slot.9 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.9
  store i64 %arg0, ptr %local0
  store %kira.string %arg1, ptr %local1
  store i64 %arg2, ptr %local2
  store i64 %arg3, ptr %local3
  %r0 = load %kira.string, ptr %local1
  %r1 = call i64 @"kira_fn_184_sokolCreateBindGroupId"(%kira.string %r0)
  store i64 %r1, ptr %local4
  %r2 = load i64, ptr %local4
  %r3 = add i64 0, 0
  %r4 = load i64, ptr %local2
  %r5 = load i64, ptr %local3
  %field.base.6 = inttoptr i64 %r5 to ptr
  %field.ptr.6 = getelementptr inbounds %t.GraphicsUniform, ptr %field.base.6, i32 0, i32 1
  %r6 = ptrtoint ptr %field.ptr.6 to i64
  %load.ptr.7 = inttoptr i64 %r6 to ptr
  %load.raw.7 = load i32, ptr %load.ptr.7
  %r7 = sext i32 %load.raw.7 to i64
  call void @"kira_fn_185_sokolSetBindGroupUniform"(i64 %r2, i64 %r3, i64 %r4, i64 %r7)
  %alloc.size.ptr.8 = getelementptr %t.BindGroup, ptr null, i32 1
  %alloc.size.8 = ptrtoint ptr %alloc.size.ptr.8 to i64
  %alloc.empty.8 = icmp eq i64 %alloc.size.8, 0
  %alloc.bytes.8 = select i1 %alloc.empty.8, i64 1, i64 %alloc.size.8
  %alloc.ptr.8 = call ptr @malloc(i64 %alloc.bytes.8)
  store %t.BindGroup zeroinitializer, ptr %alloc.ptr.8
  %r8 = ptrtoint ptr %alloc.ptr.8 to i64
  store ptr %alloc.ptr.8, ptr %cleanup.heap.slot.8
  %alloc.size.ptr.9 = getelementptr %t.BackendBindGroupHandle, ptr null, i32 1
  %alloc.size.9 = ptrtoint ptr %alloc.size.ptr.9 to i64
  %alloc.empty.9 = icmp eq i64 %alloc.size.9, 0
  %alloc.bytes.9 = select i1 %alloc.empty.9, i64 1, i64 %alloc.size.9
  %alloc.ptr.9 = call ptr @malloc(i64 %alloc.bytes.9)
  store %t.BackendBindGroupHandle zeroinitializer, ptr %alloc.ptr.9
  %r9 = ptrtoint ptr %alloc.ptr.9 to i64
  store ptr %alloc.ptr.9, ptr %cleanup.heap.slot.9
  %r10 = load i64, ptr %local4
  %field.base.11 = inttoptr i64 %r9 to ptr
  %field.ptr.11 = getelementptr inbounds %t.BackendBindGroupHandle, ptr %field.base.11, i32 0, i32 0
  %r11 = ptrtoint ptr %field.ptr.11 to i64
  %store.ptr.10 = inttoptr i64 %r11 to ptr
  %store.cast.10 = trunc i64 %r10 to i32
  store i32 %store.cast.10, ptr %store.ptr.10
  %field.base.12 = inttoptr i64 %r8 to ptr
  %field.ptr.12 = getelementptr inbounds %t.BindGroup, ptr %field.base.12, i32 0, i32 0
  %r12 = ptrtoint ptr %field.ptr.12 to i64
  %copy.dst.12 = inttoptr i64 %r12 to ptr
  %copy.src.9 = inttoptr i64 %r9 to ptr
  %copy.val.12 = load %t.BackendBindGroupHandle, ptr %copy.src.9
  store %t.BackendBindGroupHandle %copy.val.12, ptr %copy.dst.12
  %r13 = load i64, ptr %local4
  %field.base.14 = inttoptr i64 %r8 to ptr
  %field.ptr.14 = getelementptr inbounds %t.BindGroup, ptr %field.base.14, i32 0, i32 1
  %r14 = ptrtoint ptr %field.ptr.14 to i64
  %store.ptr.13 = inttoptr i64 %r14 to ptr
  %store.cast.13 = trunc i64 %r13 to i32
  store i32 %store.cast.13, ptr %store.ptr.13
  %cleanup.heap.ptr.0 = load ptr, ptr %cleanup.heap.slot.9
  call void @free(ptr %cleanup.heap.ptr.0)
  ret i64 %r8
}

define void @"kira_fn_426_Graphics.destroyBindGroup"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.BindGroup
  store %t.BindGroup zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local1
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.BindGroup, ptr %field.base.1, i32 0, i32 1
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.raw.2 = load i32, ptr %load.ptr.2
  %r2 = sext i32 %load.raw.2 to i64
  call void @"kira_fn_186_sokolDestroyBindGroupId"(i64 %r2)
  ret void
}

define i64 @"kira_fn_427_Graphics.createTexture"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.TextureDescriptor
  store %t.TextureDescriptor zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %local2 = alloca i64
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.3 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.3
  %cleanup.heap.slot.6 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.6
  %cleanup.heap.slot.9 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.9
  %cleanup.heap.slot.12 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.12
  %cleanup.heap.slot.15 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.15
  %cleanup.heap.slot.18 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.18
  %cleanup.heap.slot.22 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.22
  %cleanup.heap.slot.23 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.23
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local1
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.TextureDescriptor, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %r2 = load %kira.string, ptr %load.ptr.2
  %r3 = load i64, ptr %local1
  %field.base.4 = inttoptr i64 %r3 to ptr
  %field.ptr.4 = getelementptr inbounds %t.TextureDescriptor, ptr %field.base.4, i32 0, i32 1
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %load.ptr.5 = inttoptr i64 %r4 to ptr
  %load.raw.5 = load i64, ptr %load.ptr.5
  %r5 = load i64, ptr %load.ptr.5
  %r6 = load i64, ptr %local1
  %field.base.7 = inttoptr i64 %r6 to ptr
  %field.ptr.7 = getelementptr inbounds %t.TextureDescriptor, ptr %field.base.7, i32 0, i32 2
  %r7 = ptrtoint ptr %field.ptr.7 to i64
  %load.ptr.8 = inttoptr i64 %r7 to ptr
  %load.raw.8 = load i64, ptr %load.ptr.8
  %r8 = load i64, ptr %load.ptr.8
  %r9 = load i64, ptr %local1
  %field.base.10 = inttoptr i64 %r9 to ptr
  %field.ptr.10 = getelementptr inbounds %t.TextureDescriptor, ptr %field.base.10, i32 0, i32 3
  %r10 = ptrtoint ptr %field.ptr.10 to i64
  %load.ptr.11 = inttoptr i64 %r10 to ptr
  %load.raw.11 = load i64, ptr %load.ptr.11
  %r11 = load i64, ptr %load.ptr.11
  %r12 = load i64, ptr %local1
  %field.base.13 = inttoptr i64 %r12 to ptr
  %field.ptr.13 = getelementptr inbounds %t.TextureDescriptor, ptr %field.base.13, i32 0, i32 4
  %r13 = ptrtoint ptr %field.ptr.13 to i64
  %load.ptr.14 = inttoptr i64 %r13 to ptr
  %load.raw.14 = load i64, ptr %load.ptr.14
  %r14 = load i64, ptr %load.ptr.14
  %r15 = load i64, ptr %local1
  %field.base.16 = inttoptr i64 %r15 to ptr
  %field.ptr.16 = getelementptr inbounds %t.TextureDescriptor, ptr %field.base.16, i32 0, i32 5
  %r16 = ptrtoint ptr %field.ptr.16 to i64
  %load.ptr.17 = inttoptr i64 %r16 to ptr
  %load.raw.17 = load i64, ptr %load.ptr.17
  %r17 = load i64, ptr %load.ptr.17
  %r18 = load i64, ptr %local1
  %field.base.19 = inttoptr i64 %r18 to ptr
  %field.ptr.19 = getelementptr inbounds %t.TextureDescriptor, ptr %field.base.19, i32 0, i32 6
  %r19 = ptrtoint ptr %field.ptr.19 to i64
  %load.ptr.20 = inttoptr i64 %r19 to ptr
  %load.raw.20 = load i64, ptr %load.ptr.20
  %r20 = load i64, ptr %load.ptr.20
  %r21 = call i64 @"kira_fn_76_sokolCreateTextureId"(%kira.string %r2, i64 %r5, i64 %r8, i64 %r11, i64 %r14, i64 %r17, i64 %r20)
  store i64 %r21, ptr %local2
  %alloc.size.ptr.22 = getelementptr %t.GraphicsTexture, ptr null, i32 1
  %alloc.size.22 = ptrtoint ptr %alloc.size.ptr.22 to i64
  %alloc.empty.22 = icmp eq i64 %alloc.size.22, 0
  %alloc.bytes.22 = select i1 %alloc.empty.22, i64 1, i64 %alloc.size.22
  %alloc.ptr.22 = call ptr @malloc(i64 %alloc.bytes.22)
  store %t.GraphicsTexture zeroinitializer, ptr %alloc.ptr.22
  %r22 = ptrtoint ptr %alloc.ptr.22 to i64
  store ptr %alloc.ptr.22, ptr %cleanup.heap.slot.22
  %alloc.size.ptr.23 = getelementptr %t.BackendTextureHandle, ptr null, i32 1
  %alloc.size.23 = ptrtoint ptr %alloc.size.ptr.23 to i64
  %alloc.empty.23 = icmp eq i64 %alloc.size.23, 0
  %alloc.bytes.23 = select i1 %alloc.empty.23, i64 1, i64 %alloc.size.23
  %alloc.ptr.23 = call ptr @malloc(i64 %alloc.bytes.23)
  store %t.BackendTextureHandle zeroinitializer, ptr %alloc.ptr.23
  %r23 = ptrtoint ptr %alloc.ptr.23 to i64
  store ptr %alloc.ptr.23, ptr %cleanup.heap.slot.23
  %r24 = load i64, ptr %local2
  %field.base.25 = inttoptr i64 %r23 to ptr
  %field.ptr.25 = getelementptr inbounds %t.BackendTextureHandle, ptr %field.base.25, i32 0, i32 0
  %r25 = ptrtoint ptr %field.ptr.25 to i64
  %store.ptr.24 = inttoptr i64 %r25 to ptr
  %store.cast.24 = trunc i64 %r24 to i32
  store i32 %store.cast.24, ptr %store.ptr.24
  %field.base.26 = inttoptr i64 %r22 to ptr
  %field.ptr.26 = getelementptr inbounds %t.GraphicsTexture, ptr %field.base.26, i32 0, i32 0
  %r26 = ptrtoint ptr %field.ptr.26 to i64
  %copy.dst.26 = inttoptr i64 %r26 to ptr
  %copy.src.23 = inttoptr i64 %r23 to ptr
  %copy.val.26 = load %t.BackendTextureHandle, ptr %copy.src.23
  store %t.BackendTextureHandle %copy.val.26, ptr %copy.dst.26
  %r27 = load i64, ptr %local2
  %field.base.28 = inttoptr i64 %r22 to ptr
  %field.ptr.28 = getelementptr inbounds %t.GraphicsTexture, ptr %field.base.28, i32 0, i32 1
  %r28 = ptrtoint ptr %field.ptr.28 to i64
  %store.ptr.27 = inttoptr i64 %r28 to ptr
  %store.cast.27 = trunc i64 %r27 to i32
  store i32 %store.cast.27, ptr %store.ptr.27
  %cleanup.heap.ptr.0 = load ptr, ptr %cleanup.heap.slot.23
  call void @free(ptr %cleanup.heap.ptr.0)
  ret i64 %r22
}

define void @"kira_fn_428_Graphics.destroyTexture"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.Graphics
  store %t.Graphics zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.GraphicsTexture
  store %t.GraphicsTexture zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local1
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.GraphicsTexture, ptr %field.base.1, i32 0, i32 1
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.raw.2 = load i32, ptr %load.ptr.2
  %r2 = sext i32 %load.raw.2 to i64
  call void @"kira_fn_77_sokolDestroyTextureId"(i64 %r2)
  ret void
}

define i1 @"kira_fn_429_Graphics.runLifetimeStress"(i64 %arg0, i64 %arg1, %kira.string %arg2, %kira.string %arg3) {
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

define i64 @"kira_fn_430_Graphics.frame"(i64 %arg0) {
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
  %r67 = call i64 @"kira_fn_121_indexFormatUint32"()
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
  %r79 = call i64 @"kira_fn_175_makeRenderEncoder"()
  %cleanup.call.ptr.79 = inttoptr i64 %r79 to ptr
  store ptr %cleanup.call.ptr.79, ptr %cleanup.heap.slot.79
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
  %cleanup.heap.ptr.0 = load ptr, ptr %cleanup.heap.slot.79
  call void @free(ptr %cleanup.heap.ptr.0)
  ret i64 %r0
}

define i64 @"kira_fn_168_emptyRenderPipeline"() {
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

define void @"kira_fn_431_RenderEncoder.setPipeline"(i64 %arg0, i64 %arg1) {
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
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.4 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.4
  %cleanup.heap.slot.8 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.8
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local0
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.RenderEncoder, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.rawptr.2 = load ptr, ptr %load.ptr.2
  %r2 = ptrtoint ptr %load.rawptr.2 to i64
  %native.recover.state.3 = inttoptr i64 %r2 to ptr
  %native.recover.payload.3 = call ptr @"kira_native_state_recover"(ptr %native.recover.state.3, i64 8245922201398611848)
  %r3 = ptrtoint ptr %native.recover.payload.3 to i64
  store i64 %r3, ptr %local2
  %r4 = load i64, ptr %local1
  %field.base.5 = inttoptr i64 %r4 to ptr
  %field.ptr.5 = getelementptr inbounds %t.RenderPipeline, ptr %field.base.5, i32 0, i32 1
  %r5 = ptrtoint ptr %field.ptr.5 to i64
  %load.ptr.6 = inttoptr i64 %r5 to ptr
  %load.raw.6 = load i32, ptr %load.ptr.6
  %r6 = sext i32 %load.raw.6 to i64
  %r7 = load i64, ptr %local2
  %native.state.set.ptr.6 = inttoptr i64 %r7 to ptr
  %native.state.set.slot.6 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.6, i64 0
  %native.state.set.pack.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.set.pack.0 = insertvalue %kira.bridge.value %native.state.set.pack.0.0, i64 %r6, 2
  store %kira.bridge.value %native.state.set.pack.0, ptr %native.state.set.slot.6
  %r8 = load i64, ptr %local1
  %field.base.9 = inttoptr i64 %r8 to ptr
  %field.ptr.9 = getelementptr inbounds %t.RenderPipeline, ptr %field.base.9, i32 0, i32 1
  %r9 = ptrtoint ptr %field.ptr.9 to i64
  %load.ptr.10 = inttoptr i64 %r9 to ptr
  %load.raw.10 = load i32, ptr %load.ptr.10
  %r10 = sext i32 %load.raw.10 to i64
  %r11 = add i64 0, 0
  %r12 = icmp ne i64 %r10, %r11
  %r13 = load i64, ptr %local2
  %native.state.set.ptr.12 = inttoptr i64 %r13 to ptr
  %native.state.set.slot.12 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.12, i64 1
  %native.state.set.pack.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 4, 0
  %native.state.set.bool.1 = zext i1 %r12 to i64
  %native.state.set.pack.1 = insertvalue %kira.bridge.value %native.state.set.pack.1.0, i64 %native.state.set.bool.1, 2
  store %kira.bridge.value %native.state.set.pack.1, ptr %native.state.set.slot.12
  ret void
}

define void @"kira_fn_432_RenderEncoder.setVertexBuffer"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.RenderEncoder
  store %t.RenderEncoder zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.GraphicsBuffer
  store %t.GraphicsBuffer zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %local2 = alloca i64
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.4 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.4
  %cleanup.heap.slot.8 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.8
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local0
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.RenderEncoder, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.rawptr.2 = load ptr, ptr %load.ptr.2
  %r2 = ptrtoint ptr %load.rawptr.2 to i64
  %native.recover.state.3 = inttoptr i64 %r2 to ptr
  %native.recover.payload.3 = call ptr @"kira_native_state_recover"(ptr %native.recover.state.3, i64 8245922201398611848)
  %r3 = ptrtoint ptr %native.recover.payload.3 to i64
  store i64 %r3, ptr %local2
  %r4 = load i64, ptr %local1
  %field.base.5 = inttoptr i64 %r4 to ptr
  %field.ptr.5 = getelementptr inbounds %t.GraphicsBuffer, ptr %field.base.5, i32 0, i32 1
  %r5 = ptrtoint ptr %field.ptr.5 to i64
  %load.ptr.6 = inttoptr i64 %r5 to ptr
  %load.raw.6 = load i32, ptr %load.ptr.6
  %r6 = sext i32 %load.raw.6 to i64
  %r7 = load i64, ptr %local2
  %native.state.set.ptr.6 = inttoptr i64 %r7 to ptr
  %native.state.set.slot.6 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.6, i64 3
  %native.state.set.pack.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.set.pack.0 = insertvalue %kira.bridge.value %native.state.set.pack.0.0, i64 %r6, 2
  store %kira.bridge.value %native.state.set.pack.0, ptr %native.state.set.slot.6
  %r8 = load i64, ptr %local1
  %field.base.9 = inttoptr i64 %r8 to ptr
  %field.ptr.9 = getelementptr inbounds %t.GraphicsBuffer, ptr %field.base.9, i32 0, i32 1
  %r9 = ptrtoint ptr %field.ptr.9 to i64
  %load.ptr.10 = inttoptr i64 %r9 to ptr
  %load.raw.10 = load i32, ptr %load.ptr.10
  %r10 = sext i32 %load.raw.10 to i64
  %r11 = add i64 0, 0
  %r12 = icmp ne i64 %r10, %r11
  %r13 = load i64, ptr %local2
  %native.state.set.ptr.12 = inttoptr i64 %r13 to ptr
  %native.state.set.slot.12 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.12, i64 4
  %native.state.set.pack.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 4, 0
  %native.state.set.bool.1 = zext i1 %r12 to i64
  %native.state.set.pack.1 = insertvalue %kira.bridge.value %native.state.set.pack.1.0, i64 %native.state.set.bool.1, 2
  store %kira.bridge.value %native.state.set.pack.1, ptr %native.state.set.slot.12
  ret void
}

define void @"kira_fn_433_RenderEncoder.setIndexBuffer"(i64 %arg0, i64 %arg1, i64 %arg2) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.RenderEncoder
  store %t.RenderEncoder zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.GraphicsBuffer
  store %t.GraphicsBuffer zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %local2 = alloca i64
  %local3 = alloca i64
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.4 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.4
  %cleanup.heap.slot.10 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.10
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  store i64 %arg2, ptr %local2
  %r0 = load i64, ptr %local0
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.RenderEncoder, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.rawptr.2 = load ptr, ptr %load.ptr.2
  %r2 = ptrtoint ptr %load.rawptr.2 to i64
  %native.recover.state.3 = inttoptr i64 %r2 to ptr
  %native.recover.payload.3 = call ptr @"kira_native_state_recover"(ptr %native.recover.state.3, i64 8245922201398611848)
  %r3 = ptrtoint ptr %native.recover.payload.3 to i64
  store i64 %r3, ptr %local3
  %r4 = load i64, ptr %local1
  %field.base.5 = inttoptr i64 %r4 to ptr
  %field.ptr.5 = getelementptr inbounds %t.GraphicsBuffer, ptr %field.base.5, i32 0, i32 1
  %r5 = ptrtoint ptr %field.ptr.5 to i64
  %load.ptr.6 = inttoptr i64 %r5 to ptr
  %load.raw.6 = load i32, ptr %load.ptr.6
  %r6 = sext i32 %load.raw.6 to i64
  %r7 = load i64, ptr %local3
  %native.state.set.ptr.6 = inttoptr i64 %r7 to ptr
  %native.state.set.slot.6 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.6, i64 5
  %native.state.set.pack.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.set.pack.0 = insertvalue %kira.bridge.value %native.state.set.pack.0.0, i64 %r6, 2
  store %kira.bridge.value %native.state.set.pack.0, ptr %native.state.set.slot.6
  %r8 = load i64, ptr %local2
  %r9 = load i64, ptr %local3
  %native.state.set.ptr.8 = inttoptr i64 %r9 to ptr
  %native.state.set.slot.8 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.8, i64 7
  %native.state.set.pack.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.set.pack.1 = insertvalue %kira.bridge.value %native.state.set.pack.1.0, i64 %r8, 2
  store %kira.bridge.value %native.state.set.pack.1, ptr %native.state.set.slot.8
  %r10 = load i64, ptr %local1
  %field.base.11 = inttoptr i64 %r10 to ptr
  %field.ptr.11 = getelementptr inbounds %t.GraphicsBuffer, ptr %field.base.11, i32 0, i32 1
  %r11 = ptrtoint ptr %field.ptr.11 to i64
  %load.ptr.12 = inttoptr i64 %r11 to ptr
  %load.raw.12 = load i32, ptr %load.ptr.12
  %r12 = sext i32 %load.raw.12 to i64
  %r13 = add i64 0, 0
  %r14 = icmp ne i64 %r12, %r13
  %r15 = load i64, ptr %local3
  %native.state.set.ptr.14 = inttoptr i64 %r15 to ptr
  %native.state.set.slot.14 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.14, i64 6
  %native.state.set.pack.2.0 = insertvalue %kira.bridge.value zeroinitializer, i8 4, 0
  %native.state.set.bool.2 = zext i1 %r14 to i64
  %native.state.set.pack.2 = insertvalue %kira.bridge.value %native.state.set.pack.2.0, i64 %native.state.set.bool.2, 2
  store %kira.bridge.value %native.state.set.pack.2, ptr %native.state.set.slot.14
  ret void
}

define void @"kira_fn_434_RenderEncoder.setBindGroup"(i64 %arg0, i64 %arg1, i64 %arg2) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.RenderEncoder
  store %t.RenderEncoder zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local2 = alloca i64
  %local.storage.2 = alloca %t.BindGroup
  store %t.BindGroup zeroinitializer, ptr %local.storage.2
  %local.storage.int.2 = ptrtoint ptr %local.storage.2 to i64
  store i64 %local.storage.int.2, ptr %local2
  %local3 = alloca i64
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.7 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.7
  %cleanup.heap.slot.11 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.11
  %cleanup.heap.slot.20 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.20
  %cleanup.heap.slot.24 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.24
  %cleanup.heap.slot.33 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.33
  %cleanup.heap.slot.37 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.37
  %cleanup.heap.slot.46 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.46
  %cleanup.heap.slot.50 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.50
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  store i64 %arg2, ptr %local2
  %r0 = load i64, ptr %local0
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.RenderEncoder, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.rawptr.2 = load ptr, ptr %load.ptr.2
  %r2 = ptrtoint ptr %load.rawptr.2 to i64
  %native.recover.state.3 = inttoptr i64 %r2 to ptr
  %native.recover.payload.3 = call ptr @"kira_native_state_recover"(ptr %native.recover.state.3, i64 8245922201398611848)
  %r3 = ptrtoint ptr %native.recover.payload.3 to i64
  store i64 %r3, ptr %local3
  %r4 = load i64, ptr %local1
  %r5 = add i64 0, 0
  %r6 = icmp eq i64 %r4, %r5
  br i1 %r6, label %kira_label_0, label %kira_label_1
kira_label_0:
  %r7 = load i64, ptr %local2
  %field.base.8 = inttoptr i64 %r7 to ptr
  %field.ptr.8 = getelementptr inbounds %t.BindGroup, ptr %field.base.8, i32 0, i32 1
  %r8 = ptrtoint ptr %field.ptr.8 to i64
  %load.ptr.9 = inttoptr i64 %r8 to ptr
  %load.raw.9 = load i32, ptr %load.ptr.9
  %r9 = sext i32 %load.raw.9 to i64
  %r10 = load i64, ptr %local3
  %native.state.set.ptr.9 = inttoptr i64 %r10 to ptr
  %native.state.set.slot.9 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.9, i64 8
  %native.state.set.pack.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.set.pack.0 = insertvalue %kira.bridge.value %native.state.set.pack.0.0, i64 %r9, 2
  store %kira.bridge.value %native.state.set.pack.0, ptr %native.state.set.slot.9
  %r11 = load i64, ptr %local2
  %field.base.12 = inttoptr i64 %r11 to ptr
  %field.ptr.12 = getelementptr inbounds %t.BindGroup, ptr %field.base.12, i32 0, i32 1
  %r12 = ptrtoint ptr %field.ptr.12 to i64
  %load.ptr.13 = inttoptr i64 %r12 to ptr
  %load.raw.13 = load i32, ptr %load.ptr.13
  %r13 = sext i32 %load.raw.13 to i64
  %r14 = add i64 0, 0
  %r15 = icmp ne i64 %r13, %r14
  %r16 = load i64, ptr %local3
  %native.state.set.ptr.15 = inttoptr i64 %r16 to ptr
  %native.state.set.slot.15 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.15, i64 9
  %native.state.set.pack.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 4, 0
  %native.state.set.bool.1 = zext i1 %r15 to i64
  %native.state.set.pack.1 = insertvalue %kira.bridge.value %native.state.set.pack.1.0, i64 %native.state.set.bool.1, 2
  store %kira.bridge.value %native.state.set.pack.1, ptr %native.state.set.slot.15
  br label %kira_label_1
kira_label_1:
  %r17 = load i64, ptr %local1
  %r18 = add i64 0, 1
  %r19 = icmp eq i64 %r17, %r18
  br i1 %r19, label %kira_label_2, label %kira_label_3
kira_label_2:
  %r20 = load i64, ptr %local2
  %field.base.21 = inttoptr i64 %r20 to ptr
  %field.ptr.21 = getelementptr inbounds %t.BindGroup, ptr %field.base.21, i32 0, i32 1
  %r21 = ptrtoint ptr %field.ptr.21 to i64
  %load.ptr.22 = inttoptr i64 %r21 to ptr
  %load.raw.22 = load i32, ptr %load.ptr.22
  %r22 = sext i32 %load.raw.22 to i64
  %r23 = load i64, ptr %local3
  %native.state.set.ptr.22 = inttoptr i64 %r23 to ptr
  %native.state.set.slot.22 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.22, i64 10
  %native.state.set.pack.2.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.set.pack.2 = insertvalue %kira.bridge.value %native.state.set.pack.2.0, i64 %r22, 2
  store %kira.bridge.value %native.state.set.pack.2, ptr %native.state.set.slot.22
  %r24 = load i64, ptr %local2
  %field.base.25 = inttoptr i64 %r24 to ptr
  %field.ptr.25 = getelementptr inbounds %t.BindGroup, ptr %field.base.25, i32 0, i32 1
  %r25 = ptrtoint ptr %field.ptr.25 to i64
  %load.ptr.26 = inttoptr i64 %r25 to ptr
  %load.raw.26 = load i32, ptr %load.ptr.26
  %r26 = sext i32 %load.raw.26 to i64
  %r27 = add i64 0, 0
  %r28 = icmp ne i64 %r26, %r27
  %r29 = load i64, ptr %local3
  %native.state.set.ptr.28 = inttoptr i64 %r29 to ptr
  %native.state.set.slot.28 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.28, i64 11
  %native.state.set.pack.3.0 = insertvalue %kira.bridge.value zeroinitializer, i8 4, 0
  %native.state.set.bool.3 = zext i1 %r28 to i64
  %native.state.set.pack.3 = insertvalue %kira.bridge.value %native.state.set.pack.3.0, i64 %native.state.set.bool.3, 2
  store %kira.bridge.value %native.state.set.pack.3, ptr %native.state.set.slot.28
  br label %kira_label_3
kira_label_3:
  %r30 = load i64, ptr %local1
  %r31 = add i64 0, 2
  %r32 = icmp eq i64 %r30, %r31
  br i1 %r32, label %kira_label_4, label %kira_label_5
kira_label_4:
  %r33 = load i64, ptr %local2
  %field.base.34 = inttoptr i64 %r33 to ptr
  %field.ptr.34 = getelementptr inbounds %t.BindGroup, ptr %field.base.34, i32 0, i32 1
  %r34 = ptrtoint ptr %field.ptr.34 to i64
  %load.ptr.35 = inttoptr i64 %r34 to ptr
  %load.raw.35 = load i32, ptr %load.ptr.35
  %r35 = sext i32 %load.raw.35 to i64
  %r36 = load i64, ptr %local3
  %native.state.set.ptr.35 = inttoptr i64 %r36 to ptr
  %native.state.set.slot.35 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.35, i64 12
  %native.state.set.pack.4.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.set.pack.4 = insertvalue %kira.bridge.value %native.state.set.pack.4.0, i64 %r35, 2
  store %kira.bridge.value %native.state.set.pack.4, ptr %native.state.set.slot.35
  %r37 = load i64, ptr %local2
  %field.base.38 = inttoptr i64 %r37 to ptr
  %field.ptr.38 = getelementptr inbounds %t.BindGroup, ptr %field.base.38, i32 0, i32 1
  %r38 = ptrtoint ptr %field.ptr.38 to i64
  %load.ptr.39 = inttoptr i64 %r38 to ptr
  %load.raw.39 = load i32, ptr %load.ptr.39
  %r39 = sext i32 %load.raw.39 to i64
  %r40 = add i64 0, 0
  %r41 = icmp ne i64 %r39, %r40
  %r42 = load i64, ptr %local3
  %native.state.set.ptr.41 = inttoptr i64 %r42 to ptr
  %native.state.set.slot.41 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.41, i64 13
  %native.state.set.pack.5.0 = insertvalue %kira.bridge.value zeroinitializer, i8 4, 0
  %native.state.set.bool.5 = zext i1 %r41 to i64
  %native.state.set.pack.5 = insertvalue %kira.bridge.value %native.state.set.pack.5.0, i64 %native.state.set.bool.5, 2
  store %kira.bridge.value %native.state.set.pack.5, ptr %native.state.set.slot.41
  br label %kira_label_5
kira_label_5:
  %r43 = load i64, ptr %local1
  %r44 = add i64 0, 3
  %r45 = icmp eq i64 %r43, %r44
  br i1 %r45, label %kira_label_6, label %kira_label_7
kira_label_6:
  %r46 = load i64, ptr %local2
  %field.base.47 = inttoptr i64 %r46 to ptr
  %field.ptr.47 = getelementptr inbounds %t.BindGroup, ptr %field.base.47, i32 0, i32 1
  %r47 = ptrtoint ptr %field.ptr.47 to i64
  %load.ptr.48 = inttoptr i64 %r47 to ptr
  %load.raw.48 = load i32, ptr %load.ptr.48
  %r48 = sext i32 %load.raw.48 to i64
  %r49 = load i64, ptr %local3
  %native.state.set.ptr.48 = inttoptr i64 %r49 to ptr
  %native.state.set.slot.48 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.48, i64 14
  %native.state.set.pack.6.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.set.pack.6 = insertvalue %kira.bridge.value %native.state.set.pack.6.0, i64 %r48, 2
  store %kira.bridge.value %native.state.set.pack.6, ptr %native.state.set.slot.48
  %r50 = load i64, ptr %local2
  %field.base.51 = inttoptr i64 %r50 to ptr
  %field.ptr.51 = getelementptr inbounds %t.BindGroup, ptr %field.base.51, i32 0, i32 1
  %r51 = ptrtoint ptr %field.ptr.51 to i64
  %load.ptr.52 = inttoptr i64 %r51 to ptr
  %load.raw.52 = load i32, ptr %load.ptr.52
  %r52 = sext i32 %load.raw.52 to i64
  %r53 = add i64 0, 0
  %r54 = icmp ne i64 %r52, %r53
  %r55 = load i64, ptr %local3
  %native.state.set.ptr.54 = inttoptr i64 %r55 to ptr
  %native.state.set.slot.54 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.54, i64 15
  %native.state.set.pack.7.0 = insertvalue %kira.bridge.value zeroinitializer, i8 4, 0
  %native.state.set.bool.7 = zext i1 %r54 to i64
  %native.state.set.pack.7 = insertvalue %kira.bridge.value %native.state.set.pack.7.0, i64 %native.state.set.bool.7, 2
  store %kira.bridge.value %native.state.set.pack.7, ptr %native.state.set.slot.54
  br label %kira_label_7
kira_label_7:
  ret void
}

define void @"kira_fn_435_RenderEncoder.draw"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.RenderEncoder
  store %t.RenderEncoder zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local2 = alloca i64
  %local3 = alloca i1
  %local4 = alloca i1
  %local5 = alloca i64
  %local6 = alloca i64
  %local7 = alloca i64
  %local8 = alloca i64
  %local9 = alloca i64
  %local10 = alloca i64
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local0
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.RenderEncoder, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.rawptr.2 = load ptr, ptr %load.ptr.2
  %r2 = ptrtoint ptr %load.rawptr.2 to i64
  %native.recover.state.3 = inttoptr i64 %r2 to ptr
  %native.recover.payload.3 = call ptr @"kira_native_state_recover"(ptr %native.recover.state.3, i64 8245922201398611848)
  %r3 = ptrtoint ptr %native.recover.payload.3 to i64
  store i64 %r3, ptr %local2
  %r4 = load i64, ptr %local1
  %r5 = load i64, ptr %local2
  %native.state.set.ptr.4 = inttoptr i64 %r5 to ptr
  %native.state.set.slot.4 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.4, i64 16
  %native.state.set.pack.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.set.pack.0 = insertvalue %kira.bridge.value %native.state.set.pack.0.0, i64 %r4, 2
  store %kira.bridge.value %native.state.set.pack.0, ptr %native.state.set.slot.4
  %r6 = add i64 0, 0
  %r7 = load i64, ptr %local2
  %native.state.set.ptr.6 = inttoptr i64 %r7 to ptr
  %native.state.set.slot.6 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.6, i64 17
  %native.state.set.pack.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.set.pack.1 = insertvalue %kira.bridge.value %native.state.set.pack.1.0, i64 %r6, 2
  store %kira.bridge.value %native.state.set.pack.1, ptr %native.state.set.slot.6
  %r8 = add i64 0, 1
  %r9 = load i64, ptr %local2
  %native.state.set.ptr.8 = inttoptr i64 %r9 to ptr
  %native.state.set.slot.8 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.8, i64 18
  %native.state.set.pack.2.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.set.pack.2 = insertvalue %kira.bridge.value %native.state.set.pack.2.0, i64 %r8, 2
  store %kira.bridge.value %native.state.set.pack.2, ptr %native.state.set.slot.8
  %r10 = load i64, ptr %local2
  %native.state.get.ptr.11 = inttoptr i64 %r10 to ptr
  %native.state.get.slot.11 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.11, i64 2
  %native.state.get.val.3 = load %kira.bridge.value, ptr %native.state.get.slot.11
  %native.state.get.word.3 = extractvalue %kira.bridge.value %native.state.get.val.3, 2
  %r11 = trunc i64 %native.state.get.word.3 to i1
  br i1 %r11, label %kira_label_0, label %kira_label_1
kira_label_1:
  %r12 = add i1 0, 0
  store i1 %r12, ptr %local3
  br label %kira_label_2
kira_label_0:
  %r13 = load i64, ptr %local2
  %native.state.get.ptr.14 = inttoptr i64 %r13 to ptr
  %native.state.get.slot.14 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.14, i64 1
  %native.state.get.val.4 = load %kira.bridge.value, ptr %native.state.get.slot.14
  %native.state.get.word.4 = extractvalue %kira.bridge.value %native.state.get.val.4, 2
  %r14 = trunc i64 %native.state.get.word.4 to i1
  store i1 %r14, ptr %local3
  br label %kira_label_2
kira_label_2:
  %r15 = load i1, ptr %local3
  br i1 %r15, label %kira_label_3, label %kira_label_4
kira_label_4:
  %r16 = add i1 0, 0
  store i1 %r16, ptr %local4
  br label %kira_label_5
kira_label_3:
  %r17 = load i64, ptr %local2
  %native.state.get.ptr.18 = inttoptr i64 %r17 to ptr
  %native.state.get.slot.18 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.18, i64 0
  %native.state.get.val.5 = load %kira.bridge.value, ptr %native.state.get.slot.18
  %r18 = extractvalue %kira.bridge.value %native.state.get.val.5, 2
  %r19 = add i64 0, 0
  %r20 = icmp ne i64 %r18, %r19
  store i1 %r20, ptr %local4
  br label %kira_label_5
kira_label_5:
  %r21 = load i1, ptr %local4
  br i1 %r21, label %kira_label_6, label %kira_label_7
kira_label_6:
  %r22 = load i64, ptr %local2
  %native.state.get.ptr.23 = inttoptr i64 %r22 to ptr
  %native.state.get.slot.23 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.23, i64 0
  %native.state.get.val.6 = load %kira.bridge.value, ptr %native.state.get.slot.23
  %r23 = extractvalue %kira.bridge.value %native.state.get.val.6, 2
  %r24 = load i64, ptr %local2
  %native.state.get.ptr.25 = inttoptr i64 %r24 to ptr
  %native.state.get.slot.25 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.25, i64 3
  %native.state.get.val.7 = load %kira.bridge.value, ptr %native.state.get.slot.25
  %r25 = extractvalue %kira.bridge.value %native.state.get.val.7, 2
  %r26 = load i64, ptr %local2
  %native.state.get.ptr.27 = inttoptr i64 %r26 to ptr
  %native.state.get.slot.27 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.27, i64 4
  %native.state.get.val.8 = load %kira.bridge.value, ptr %native.state.get.slot.27
  %native.state.get.word.8 = extractvalue %kira.bridge.value %native.state.get.val.8, 2
  %r27 = trunc i64 %native.state.get.word.8 to i1
  br i1 %r27, label %kira_label_8, label %kira_label_9
kira_label_8:
  %r28 = add i64 0, 1
  store i64 %r28, ptr %local5
  br label %kira_label_10
kira_label_9:
  %r29 = add i64 0, 0
  store i64 %r29, ptr %local5
  br label %kira_label_10
kira_label_10:
  %r30 = load i64, ptr %local5
  %r31 = load i64, ptr %local2
  %native.state.get.ptr.32 = inttoptr i64 %r31 to ptr
  %native.state.get.slot.32 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.32, i64 5
  %native.state.get.val.9 = load %kira.bridge.value, ptr %native.state.get.slot.32
  %r32 = extractvalue %kira.bridge.value %native.state.get.val.9, 2
  %r33 = load i64, ptr %local2
  %native.state.get.ptr.34 = inttoptr i64 %r33 to ptr
  %native.state.get.slot.34 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.34, i64 6
  %native.state.get.val.10 = load %kira.bridge.value, ptr %native.state.get.slot.34
  %native.state.get.word.10 = extractvalue %kira.bridge.value %native.state.get.val.10, 2
  %r34 = trunc i64 %native.state.get.word.10 to i1
  br i1 %r34, label %kira_label_11, label %kira_label_12
kira_label_11:
  %r35 = add i64 0, 1
  store i64 %r35, ptr %local6
  br label %kira_label_13
kira_label_12:
  %r36 = add i64 0, 0
  store i64 %r36, ptr %local6
  br label %kira_label_13
kira_label_13:
  %r37 = load i64, ptr %local6
  %r38 = load i64, ptr %local2
  %native.state.get.ptr.39 = inttoptr i64 %r38 to ptr
  %native.state.get.slot.39 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.39, i64 8
  %native.state.get.val.11 = load %kira.bridge.value, ptr %native.state.get.slot.39
  %r39 = extractvalue %kira.bridge.value %native.state.get.val.11, 2
  %r40 = load i64, ptr %local2
  %native.state.get.ptr.41 = inttoptr i64 %r40 to ptr
  %native.state.get.slot.41 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.41, i64 9
  %native.state.get.val.12 = load %kira.bridge.value, ptr %native.state.get.slot.41
  %native.state.get.word.12 = extractvalue %kira.bridge.value %native.state.get.val.12, 2
  %r41 = trunc i64 %native.state.get.word.12 to i1
  br i1 %r41, label %kira_label_14, label %kira_label_15
kira_label_14:
  %r42 = add i64 0, 1
  store i64 %r42, ptr %local7
  br label %kira_label_16
kira_label_15:
  %r43 = add i64 0, 0
  store i64 %r43, ptr %local7
  br label %kira_label_16
kira_label_16:
  %r44 = load i64, ptr %local7
  %r45 = load i64, ptr %local2
  %native.state.get.ptr.46 = inttoptr i64 %r45 to ptr
  %native.state.get.slot.46 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.46, i64 10
  %native.state.get.val.13 = load %kira.bridge.value, ptr %native.state.get.slot.46
  %r46 = extractvalue %kira.bridge.value %native.state.get.val.13, 2
  %r47 = load i64, ptr %local2
  %native.state.get.ptr.48 = inttoptr i64 %r47 to ptr
  %native.state.get.slot.48 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.48, i64 11
  %native.state.get.val.14 = load %kira.bridge.value, ptr %native.state.get.slot.48
  %native.state.get.word.14 = extractvalue %kira.bridge.value %native.state.get.val.14, 2
  %r48 = trunc i64 %native.state.get.word.14 to i1
  br i1 %r48, label %kira_label_17, label %kira_label_18
kira_label_17:
  %r49 = add i64 0, 1
  store i64 %r49, ptr %local8
  br label %kira_label_19
kira_label_18:
  %r50 = add i64 0, 0
  store i64 %r50, ptr %local8
  br label %kira_label_19
kira_label_19:
  %r51 = load i64, ptr %local8
  %r52 = load i64, ptr %local2
  %native.state.get.ptr.53 = inttoptr i64 %r52 to ptr
  %native.state.get.slot.53 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.53, i64 12
  %native.state.get.val.15 = load %kira.bridge.value, ptr %native.state.get.slot.53
  %r53 = extractvalue %kira.bridge.value %native.state.get.val.15, 2
  %r54 = load i64, ptr %local2
  %native.state.get.ptr.55 = inttoptr i64 %r54 to ptr
  %native.state.get.slot.55 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.55, i64 13
  %native.state.get.val.16 = load %kira.bridge.value, ptr %native.state.get.slot.55
  %native.state.get.word.16 = extractvalue %kira.bridge.value %native.state.get.val.16, 2
  %r55 = trunc i64 %native.state.get.word.16 to i1
  br i1 %r55, label %kira_label_20, label %kira_label_21
kira_label_20:
  %r56 = add i64 0, 1
  store i64 %r56, ptr %local9
  br label %kira_label_22
kira_label_21:
  %r57 = add i64 0, 0
  store i64 %r57, ptr %local9
  br label %kira_label_22
kira_label_22:
  %r58 = load i64, ptr %local9
  %r59 = load i64, ptr %local2
  %native.state.get.ptr.60 = inttoptr i64 %r59 to ptr
  %native.state.get.slot.60 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.60, i64 14
  %native.state.get.val.17 = load %kira.bridge.value, ptr %native.state.get.slot.60
  %r60 = extractvalue %kira.bridge.value %native.state.get.val.17, 2
  %r61 = load i64, ptr %local2
  %native.state.get.ptr.62 = inttoptr i64 %r61 to ptr
  %native.state.get.slot.62 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.62, i64 15
  %native.state.get.val.18 = load %kira.bridge.value, ptr %native.state.get.slot.62
  %native.state.get.word.18 = extractvalue %kira.bridge.value %native.state.get.val.18, 2
  %r62 = trunc i64 %native.state.get.word.18 to i1
  br i1 %r62, label %kira_label_23, label %kira_label_24
kira_label_23:
  %r63 = add i64 0, 1
  store i64 %r63, ptr %local10
  br label %kira_label_25
kira_label_24:
  %r64 = add i64 0, 0
  store i64 %r64, ptr %local10
  br label %kira_label_25
kira_label_25:
  %r65 = load i64, ptr %local10
  %r66 = load i64, ptr %local2
  %native.state.get.ptr.67 = inttoptr i64 %r66 to ptr
  %native.state.get.slot.67 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.67, i64 16
  %native.state.get.val.19 = load %kira.bridge.value, ptr %native.state.get.slot.67
  %r67 = extractvalue %kira.bridge.value %native.state.get.val.19, 2
  %r68 = load i64, ptr %local2
  %native.state.get.ptr.69 = inttoptr i64 %r68 to ptr
  %native.state.get.slot.69 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.69, i64 17
  %native.state.get.val.20 = load %kira.bridge.value, ptr %native.state.get.slot.69
  %r69 = extractvalue %kira.bridge.value %native.state.get.val.20, 2
  %r70 = load i64, ptr %local2
  %native.state.get.ptr.71 = inttoptr i64 %r70 to ptr
  %native.state.get.slot.71 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.71, i64 18
  %native.state.get.val.21 = load %kira.bridge.value, ptr %native.state.get.slot.71
  %r71 = extractvalue %kira.bridge.value %native.state.get.val.21, 2
  call i1 @"kira_fn_66_sokolApplyPipelineBindingsAndDrawFlat"(i64 %r23, i64 %r25, i64 %r30, i64 %r32, i64 %r37, i64 %r39, i64 %r44, i64 %r46, i64 %r51, i64 %r53, i64 %r58, i64 %r60, i64 %r65, i64 %r67, i64 %r69, i64 %r71)
  br label %kira_label_7
kira_label_7:
  ret void
}

define void @"kira_fn_436_RenderEncoder.drawIndexed"(i64 %arg0, i64 %arg1) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.RenderEncoder
  store %t.RenderEncoder zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local2 = alloca i64
  %local3 = alloca i1
  %local4 = alloca i1
  %local5 = alloca i64
  %local6 = alloca i64
  %local7 = alloca i64
  %local8 = alloca i64
  %local9 = alloca i64
  %local10 = alloca i64
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  %r0 = load i64, ptr %local0
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.RenderEncoder, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.rawptr.2 = load ptr, ptr %load.ptr.2
  %r2 = ptrtoint ptr %load.rawptr.2 to i64
  %native.recover.state.3 = inttoptr i64 %r2 to ptr
  %native.recover.payload.3 = call ptr @"kira_native_state_recover"(ptr %native.recover.state.3, i64 8245922201398611848)
  %r3 = ptrtoint ptr %native.recover.payload.3 to i64
  store i64 %r3, ptr %local2
  %r4 = load i64, ptr %local1
  %r5 = load i64, ptr %local2
  %native.state.set.ptr.4 = inttoptr i64 %r5 to ptr
  %native.state.set.slot.4 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.4, i64 17
  %native.state.set.pack.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.set.pack.0 = insertvalue %kira.bridge.value %native.state.set.pack.0.0, i64 %r4, 2
  store %kira.bridge.value %native.state.set.pack.0, ptr %native.state.set.slot.4
  %r6 = add i64 0, 0
  %r7 = load i64, ptr %local2
  %native.state.set.ptr.6 = inttoptr i64 %r7 to ptr
  %native.state.set.slot.6 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.6, i64 16
  %native.state.set.pack.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.set.pack.1 = insertvalue %kira.bridge.value %native.state.set.pack.1.0, i64 %r6, 2
  store %kira.bridge.value %native.state.set.pack.1, ptr %native.state.set.slot.6
  %r8 = add i64 0, 1
  %r9 = load i64, ptr %local2
  %native.state.set.ptr.8 = inttoptr i64 %r9 to ptr
  %native.state.set.slot.8 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.8, i64 18
  %native.state.set.pack.2.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.set.pack.2 = insertvalue %kira.bridge.value %native.state.set.pack.2.0, i64 %r8, 2
  store %kira.bridge.value %native.state.set.pack.2, ptr %native.state.set.slot.8
  %r10 = load i64, ptr %local2
  %native.state.get.ptr.11 = inttoptr i64 %r10 to ptr
  %native.state.get.slot.11 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.11, i64 2
  %native.state.get.val.3 = load %kira.bridge.value, ptr %native.state.get.slot.11
  %native.state.get.word.3 = extractvalue %kira.bridge.value %native.state.get.val.3, 2
  %r11 = trunc i64 %native.state.get.word.3 to i1
  br i1 %r11, label %kira_label_0, label %kira_label_1
kira_label_1:
  %r12 = add i1 0, 0
  store i1 %r12, ptr %local3
  br label %kira_label_2
kira_label_0:
  %r13 = load i64, ptr %local2
  %native.state.get.ptr.14 = inttoptr i64 %r13 to ptr
  %native.state.get.slot.14 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.14, i64 1
  %native.state.get.val.4 = load %kira.bridge.value, ptr %native.state.get.slot.14
  %native.state.get.word.4 = extractvalue %kira.bridge.value %native.state.get.val.4, 2
  %r14 = trunc i64 %native.state.get.word.4 to i1
  store i1 %r14, ptr %local3
  br label %kira_label_2
kira_label_2:
  %r15 = load i1, ptr %local3
  br i1 %r15, label %kira_label_3, label %kira_label_4
kira_label_4:
  %r16 = add i1 0, 0
  store i1 %r16, ptr %local4
  br label %kira_label_5
kira_label_3:
  %r17 = load i64, ptr %local2
  %native.state.get.ptr.18 = inttoptr i64 %r17 to ptr
  %native.state.get.slot.18 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.18, i64 0
  %native.state.get.val.5 = load %kira.bridge.value, ptr %native.state.get.slot.18
  %r18 = extractvalue %kira.bridge.value %native.state.get.val.5, 2
  %r19 = add i64 0, 0
  %r20 = icmp ne i64 %r18, %r19
  store i1 %r20, ptr %local4
  br label %kira_label_5
kira_label_5:
  %r21 = load i1, ptr %local4
  br i1 %r21, label %kira_label_6, label %kira_label_7
kira_label_6:
  %r22 = load i64, ptr %local2
  %native.state.get.ptr.23 = inttoptr i64 %r22 to ptr
  %native.state.get.slot.23 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.23, i64 0
  %native.state.get.val.6 = load %kira.bridge.value, ptr %native.state.get.slot.23
  %r23 = extractvalue %kira.bridge.value %native.state.get.val.6, 2
  %r24 = load i64, ptr %local2
  %native.state.get.ptr.25 = inttoptr i64 %r24 to ptr
  %native.state.get.slot.25 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.25, i64 3
  %native.state.get.val.7 = load %kira.bridge.value, ptr %native.state.get.slot.25
  %r25 = extractvalue %kira.bridge.value %native.state.get.val.7, 2
  %r26 = load i64, ptr %local2
  %native.state.get.ptr.27 = inttoptr i64 %r26 to ptr
  %native.state.get.slot.27 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.27, i64 4
  %native.state.get.val.8 = load %kira.bridge.value, ptr %native.state.get.slot.27
  %native.state.get.word.8 = extractvalue %kira.bridge.value %native.state.get.val.8, 2
  %r27 = trunc i64 %native.state.get.word.8 to i1
  br i1 %r27, label %kira_label_8, label %kira_label_9
kira_label_8:
  %r28 = add i64 0, 1
  store i64 %r28, ptr %local5
  br label %kira_label_10
kira_label_9:
  %r29 = add i64 0, 0
  store i64 %r29, ptr %local5
  br label %kira_label_10
kira_label_10:
  %r30 = load i64, ptr %local5
  %r31 = load i64, ptr %local2
  %native.state.get.ptr.32 = inttoptr i64 %r31 to ptr
  %native.state.get.slot.32 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.32, i64 5
  %native.state.get.val.9 = load %kira.bridge.value, ptr %native.state.get.slot.32
  %r32 = extractvalue %kira.bridge.value %native.state.get.val.9, 2
  %r33 = load i64, ptr %local2
  %native.state.get.ptr.34 = inttoptr i64 %r33 to ptr
  %native.state.get.slot.34 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.34, i64 6
  %native.state.get.val.10 = load %kira.bridge.value, ptr %native.state.get.slot.34
  %native.state.get.word.10 = extractvalue %kira.bridge.value %native.state.get.val.10, 2
  %r34 = trunc i64 %native.state.get.word.10 to i1
  br i1 %r34, label %kira_label_11, label %kira_label_12
kira_label_11:
  %r35 = add i64 0, 1
  store i64 %r35, ptr %local6
  br label %kira_label_13
kira_label_12:
  %r36 = add i64 0, 0
  store i64 %r36, ptr %local6
  br label %kira_label_13
kira_label_13:
  %r37 = load i64, ptr %local6
  %r38 = load i64, ptr %local2
  %native.state.get.ptr.39 = inttoptr i64 %r38 to ptr
  %native.state.get.slot.39 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.39, i64 8
  %native.state.get.val.11 = load %kira.bridge.value, ptr %native.state.get.slot.39
  %r39 = extractvalue %kira.bridge.value %native.state.get.val.11, 2
  %r40 = load i64, ptr %local2
  %native.state.get.ptr.41 = inttoptr i64 %r40 to ptr
  %native.state.get.slot.41 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.41, i64 9
  %native.state.get.val.12 = load %kira.bridge.value, ptr %native.state.get.slot.41
  %native.state.get.word.12 = extractvalue %kira.bridge.value %native.state.get.val.12, 2
  %r41 = trunc i64 %native.state.get.word.12 to i1
  br i1 %r41, label %kira_label_14, label %kira_label_15
kira_label_14:
  %r42 = add i64 0, 1
  store i64 %r42, ptr %local7
  br label %kira_label_16
kira_label_15:
  %r43 = add i64 0, 0
  store i64 %r43, ptr %local7
  br label %kira_label_16
kira_label_16:
  %r44 = load i64, ptr %local7
  %r45 = load i64, ptr %local2
  %native.state.get.ptr.46 = inttoptr i64 %r45 to ptr
  %native.state.get.slot.46 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.46, i64 10
  %native.state.get.val.13 = load %kira.bridge.value, ptr %native.state.get.slot.46
  %r46 = extractvalue %kira.bridge.value %native.state.get.val.13, 2
  %r47 = load i64, ptr %local2
  %native.state.get.ptr.48 = inttoptr i64 %r47 to ptr
  %native.state.get.slot.48 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.48, i64 11
  %native.state.get.val.14 = load %kira.bridge.value, ptr %native.state.get.slot.48
  %native.state.get.word.14 = extractvalue %kira.bridge.value %native.state.get.val.14, 2
  %r48 = trunc i64 %native.state.get.word.14 to i1
  br i1 %r48, label %kira_label_17, label %kira_label_18
kira_label_17:
  %r49 = add i64 0, 1
  store i64 %r49, ptr %local8
  br label %kira_label_19
kira_label_18:
  %r50 = add i64 0, 0
  store i64 %r50, ptr %local8
  br label %kira_label_19
kira_label_19:
  %r51 = load i64, ptr %local8
  %r52 = load i64, ptr %local2
  %native.state.get.ptr.53 = inttoptr i64 %r52 to ptr
  %native.state.get.slot.53 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.53, i64 12
  %native.state.get.val.15 = load %kira.bridge.value, ptr %native.state.get.slot.53
  %r53 = extractvalue %kira.bridge.value %native.state.get.val.15, 2
  %r54 = load i64, ptr %local2
  %native.state.get.ptr.55 = inttoptr i64 %r54 to ptr
  %native.state.get.slot.55 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.55, i64 13
  %native.state.get.val.16 = load %kira.bridge.value, ptr %native.state.get.slot.55
  %native.state.get.word.16 = extractvalue %kira.bridge.value %native.state.get.val.16, 2
  %r55 = trunc i64 %native.state.get.word.16 to i1
  br i1 %r55, label %kira_label_20, label %kira_label_21
kira_label_20:
  %r56 = add i64 0, 1
  store i64 %r56, ptr %local9
  br label %kira_label_22
kira_label_21:
  %r57 = add i64 0, 0
  store i64 %r57, ptr %local9
  br label %kira_label_22
kira_label_22:
  %r58 = load i64, ptr %local9
  %r59 = load i64, ptr %local2
  %native.state.get.ptr.60 = inttoptr i64 %r59 to ptr
  %native.state.get.slot.60 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.60, i64 14
  %native.state.get.val.17 = load %kira.bridge.value, ptr %native.state.get.slot.60
  %r60 = extractvalue %kira.bridge.value %native.state.get.val.17, 2
  %r61 = load i64, ptr %local2
  %native.state.get.ptr.62 = inttoptr i64 %r61 to ptr
  %native.state.get.slot.62 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.62, i64 15
  %native.state.get.val.18 = load %kira.bridge.value, ptr %native.state.get.slot.62
  %native.state.get.word.18 = extractvalue %kira.bridge.value %native.state.get.val.18, 2
  %r62 = trunc i64 %native.state.get.word.18 to i1
  br i1 %r62, label %kira_label_23, label %kira_label_24
kira_label_23:
  %r63 = add i64 0, 1
  store i64 %r63, ptr %local10
  br label %kira_label_25
kira_label_24:
  %r64 = add i64 0, 0
  store i64 %r64, ptr %local10
  br label %kira_label_25
kira_label_25:
  %r65 = load i64, ptr %local10
  %r66 = load i64, ptr %local2
  %native.state.get.ptr.67 = inttoptr i64 %r66 to ptr
  %native.state.get.slot.67 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.67, i64 16
  %native.state.get.val.19 = load %kira.bridge.value, ptr %native.state.get.slot.67
  %r67 = extractvalue %kira.bridge.value %native.state.get.val.19, 2
  %r68 = load i64, ptr %local2
  %native.state.get.ptr.69 = inttoptr i64 %r68 to ptr
  %native.state.get.slot.69 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.69, i64 17
  %native.state.get.val.20 = load %kira.bridge.value, ptr %native.state.get.slot.69
  %r69 = extractvalue %kira.bridge.value %native.state.get.val.20, 2
  %r70 = load i64, ptr %local2
  %native.state.get.ptr.71 = inttoptr i64 %r70 to ptr
  %native.state.get.slot.71 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.71, i64 18
  %native.state.get.val.21 = load %kira.bridge.value, ptr %native.state.get.slot.71
  %r71 = extractvalue %kira.bridge.value %native.state.get.val.21, 2
  call i1 @"kira_fn_66_sokolApplyPipelineBindingsAndDrawFlat"(i64 %r23, i64 %r25, i64 %r30, i64 %r32, i64 %r37, i64 %r39, i64 %r44, i64 %r46, i64 %r51, i64 %r53, i64 %r58, i64 %r60, i64 %r65, i64 %r67, i64 %r69, i64 %r71)
  br label %kira_label_7
kira_label_7:
  ret void
}

define void @"kira_fn_437_RenderEncoder.drawInstanced"(i64 %arg0, i64 %arg1, i64 %arg2) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.RenderEncoder
  store %t.RenderEncoder zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local2 = alloca i64
  %local3 = alloca i64
  %local4 = alloca i1
  %local5 = alloca i1
  %local6 = alloca i64
  %local7 = alloca i64
  %local8 = alloca i64
  %local9 = alloca i64
  %local10 = alloca i64
  %local11 = alloca i64
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  store i64 %arg2, ptr %local2
  %r0 = load i64, ptr %local0
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.RenderEncoder, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.rawptr.2 = load ptr, ptr %load.ptr.2
  %r2 = ptrtoint ptr %load.rawptr.2 to i64
  %native.recover.state.3 = inttoptr i64 %r2 to ptr
  %native.recover.payload.3 = call ptr @"kira_native_state_recover"(ptr %native.recover.state.3, i64 8245922201398611848)
  %r3 = ptrtoint ptr %native.recover.payload.3 to i64
  store i64 %r3, ptr %local3
  %r4 = load i64, ptr %local1
  %r5 = load i64, ptr %local3
  %native.state.set.ptr.4 = inttoptr i64 %r5 to ptr
  %native.state.set.slot.4 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.4, i64 16
  %native.state.set.pack.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.set.pack.0 = insertvalue %kira.bridge.value %native.state.set.pack.0.0, i64 %r4, 2
  store %kira.bridge.value %native.state.set.pack.0, ptr %native.state.set.slot.4
  %r6 = add i64 0, 0
  %r7 = load i64, ptr %local3
  %native.state.set.ptr.6 = inttoptr i64 %r7 to ptr
  %native.state.set.slot.6 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.6, i64 17
  %native.state.set.pack.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.set.pack.1 = insertvalue %kira.bridge.value %native.state.set.pack.1.0, i64 %r6, 2
  store %kira.bridge.value %native.state.set.pack.1, ptr %native.state.set.slot.6
  %r8 = load i64, ptr %local2
  %r9 = load i64, ptr %local3
  %native.state.set.ptr.8 = inttoptr i64 %r9 to ptr
  %native.state.set.slot.8 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.8, i64 18
  %native.state.set.pack.2.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.set.pack.2 = insertvalue %kira.bridge.value %native.state.set.pack.2.0, i64 %r8, 2
  store %kira.bridge.value %native.state.set.pack.2, ptr %native.state.set.slot.8
  %r10 = load i64, ptr %local3
  %native.state.get.ptr.11 = inttoptr i64 %r10 to ptr
  %native.state.get.slot.11 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.11, i64 2
  %native.state.get.val.3 = load %kira.bridge.value, ptr %native.state.get.slot.11
  %native.state.get.word.3 = extractvalue %kira.bridge.value %native.state.get.val.3, 2
  %r11 = trunc i64 %native.state.get.word.3 to i1
  br i1 %r11, label %kira_label_0, label %kira_label_1
kira_label_1:
  %r12 = add i1 0, 0
  store i1 %r12, ptr %local4
  br label %kira_label_2
kira_label_0:
  %r13 = load i64, ptr %local3
  %native.state.get.ptr.14 = inttoptr i64 %r13 to ptr
  %native.state.get.slot.14 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.14, i64 1
  %native.state.get.val.4 = load %kira.bridge.value, ptr %native.state.get.slot.14
  %native.state.get.word.4 = extractvalue %kira.bridge.value %native.state.get.val.4, 2
  %r14 = trunc i64 %native.state.get.word.4 to i1
  store i1 %r14, ptr %local4
  br label %kira_label_2
kira_label_2:
  %r15 = load i1, ptr %local4
  br i1 %r15, label %kira_label_3, label %kira_label_4
kira_label_4:
  %r16 = add i1 0, 0
  store i1 %r16, ptr %local5
  br label %kira_label_5
kira_label_3:
  %r17 = load i64, ptr %local3
  %native.state.get.ptr.18 = inttoptr i64 %r17 to ptr
  %native.state.get.slot.18 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.18, i64 0
  %native.state.get.val.5 = load %kira.bridge.value, ptr %native.state.get.slot.18
  %r18 = extractvalue %kira.bridge.value %native.state.get.val.5, 2
  %r19 = add i64 0, 0
  %r20 = icmp ne i64 %r18, %r19
  store i1 %r20, ptr %local5
  br label %kira_label_5
kira_label_5:
  %r21 = load i1, ptr %local5
  br i1 %r21, label %kira_label_6, label %kira_label_7
kira_label_6:
  %r22 = load i64, ptr %local3
  %native.state.get.ptr.23 = inttoptr i64 %r22 to ptr
  %native.state.get.slot.23 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.23, i64 0
  %native.state.get.val.6 = load %kira.bridge.value, ptr %native.state.get.slot.23
  %r23 = extractvalue %kira.bridge.value %native.state.get.val.6, 2
  %r24 = load i64, ptr %local3
  %native.state.get.ptr.25 = inttoptr i64 %r24 to ptr
  %native.state.get.slot.25 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.25, i64 3
  %native.state.get.val.7 = load %kira.bridge.value, ptr %native.state.get.slot.25
  %r25 = extractvalue %kira.bridge.value %native.state.get.val.7, 2
  %r26 = load i64, ptr %local3
  %native.state.get.ptr.27 = inttoptr i64 %r26 to ptr
  %native.state.get.slot.27 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.27, i64 4
  %native.state.get.val.8 = load %kira.bridge.value, ptr %native.state.get.slot.27
  %native.state.get.word.8 = extractvalue %kira.bridge.value %native.state.get.val.8, 2
  %r27 = trunc i64 %native.state.get.word.8 to i1
  br i1 %r27, label %kira_label_8, label %kira_label_9
kira_label_8:
  %r28 = add i64 0, 1
  store i64 %r28, ptr %local6
  br label %kira_label_10
kira_label_9:
  %r29 = add i64 0, 0
  store i64 %r29, ptr %local6
  br label %kira_label_10
kira_label_10:
  %r30 = load i64, ptr %local6
  %r31 = load i64, ptr %local3
  %native.state.get.ptr.32 = inttoptr i64 %r31 to ptr
  %native.state.get.slot.32 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.32, i64 5
  %native.state.get.val.9 = load %kira.bridge.value, ptr %native.state.get.slot.32
  %r32 = extractvalue %kira.bridge.value %native.state.get.val.9, 2
  %r33 = load i64, ptr %local3
  %native.state.get.ptr.34 = inttoptr i64 %r33 to ptr
  %native.state.get.slot.34 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.34, i64 6
  %native.state.get.val.10 = load %kira.bridge.value, ptr %native.state.get.slot.34
  %native.state.get.word.10 = extractvalue %kira.bridge.value %native.state.get.val.10, 2
  %r34 = trunc i64 %native.state.get.word.10 to i1
  br i1 %r34, label %kira_label_11, label %kira_label_12
kira_label_11:
  %r35 = add i64 0, 1
  store i64 %r35, ptr %local7
  br label %kira_label_13
kira_label_12:
  %r36 = add i64 0, 0
  store i64 %r36, ptr %local7
  br label %kira_label_13
kira_label_13:
  %r37 = load i64, ptr %local7
  %r38 = load i64, ptr %local3
  %native.state.get.ptr.39 = inttoptr i64 %r38 to ptr
  %native.state.get.slot.39 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.39, i64 8
  %native.state.get.val.11 = load %kira.bridge.value, ptr %native.state.get.slot.39
  %r39 = extractvalue %kira.bridge.value %native.state.get.val.11, 2
  %r40 = load i64, ptr %local3
  %native.state.get.ptr.41 = inttoptr i64 %r40 to ptr
  %native.state.get.slot.41 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.41, i64 9
  %native.state.get.val.12 = load %kira.bridge.value, ptr %native.state.get.slot.41
  %native.state.get.word.12 = extractvalue %kira.bridge.value %native.state.get.val.12, 2
  %r41 = trunc i64 %native.state.get.word.12 to i1
  br i1 %r41, label %kira_label_14, label %kira_label_15
kira_label_14:
  %r42 = add i64 0, 1
  store i64 %r42, ptr %local8
  br label %kira_label_16
kira_label_15:
  %r43 = add i64 0, 0
  store i64 %r43, ptr %local8
  br label %kira_label_16
kira_label_16:
  %r44 = load i64, ptr %local8
  %r45 = load i64, ptr %local3
  %native.state.get.ptr.46 = inttoptr i64 %r45 to ptr
  %native.state.get.slot.46 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.46, i64 10
  %native.state.get.val.13 = load %kira.bridge.value, ptr %native.state.get.slot.46
  %r46 = extractvalue %kira.bridge.value %native.state.get.val.13, 2
  %r47 = load i64, ptr %local3
  %native.state.get.ptr.48 = inttoptr i64 %r47 to ptr
  %native.state.get.slot.48 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.48, i64 11
  %native.state.get.val.14 = load %kira.bridge.value, ptr %native.state.get.slot.48
  %native.state.get.word.14 = extractvalue %kira.bridge.value %native.state.get.val.14, 2
  %r48 = trunc i64 %native.state.get.word.14 to i1
  br i1 %r48, label %kira_label_17, label %kira_label_18
kira_label_17:
  %r49 = add i64 0, 1
  store i64 %r49, ptr %local9
  br label %kira_label_19
kira_label_18:
  %r50 = add i64 0, 0
  store i64 %r50, ptr %local9
  br label %kira_label_19
kira_label_19:
  %r51 = load i64, ptr %local9
  %r52 = load i64, ptr %local3
  %native.state.get.ptr.53 = inttoptr i64 %r52 to ptr
  %native.state.get.slot.53 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.53, i64 12
  %native.state.get.val.15 = load %kira.bridge.value, ptr %native.state.get.slot.53
  %r53 = extractvalue %kira.bridge.value %native.state.get.val.15, 2
  %r54 = load i64, ptr %local3
  %native.state.get.ptr.55 = inttoptr i64 %r54 to ptr
  %native.state.get.slot.55 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.55, i64 13
  %native.state.get.val.16 = load %kira.bridge.value, ptr %native.state.get.slot.55
  %native.state.get.word.16 = extractvalue %kira.bridge.value %native.state.get.val.16, 2
  %r55 = trunc i64 %native.state.get.word.16 to i1
  br i1 %r55, label %kira_label_20, label %kira_label_21
kira_label_20:
  %r56 = add i64 0, 1
  store i64 %r56, ptr %local10
  br label %kira_label_22
kira_label_21:
  %r57 = add i64 0, 0
  store i64 %r57, ptr %local10
  br label %kira_label_22
kira_label_22:
  %r58 = load i64, ptr %local10
  %r59 = load i64, ptr %local3
  %native.state.get.ptr.60 = inttoptr i64 %r59 to ptr
  %native.state.get.slot.60 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.60, i64 14
  %native.state.get.val.17 = load %kira.bridge.value, ptr %native.state.get.slot.60
  %r60 = extractvalue %kira.bridge.value %native.state.get.val.17, 2
  %r61 = load i64, ptr %local3
  %native.state.get.ptr.62 = inttoptr i64 %r61 to ptr
  %native.state.get.slot.62 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.62, i64 15
  %native.state.get.val.18 = load %kira.bridge.value, ptr %native.state.get.slot.62
  %native.state.get.word.18 = extractvalue %kira.bridge.value %native.state.get.val.18, 2
  %r62 = trunc i64 %native.state.get.word.18 to i1
  br i1 %r62, label %kira_label_23, label %kira_label_24
kira_label_23:
  %r63 = add i64 0, 1
  store i64 %r63, ptr %local11
  br label %kira_label_25
kira_label_24:
  %r64 = add i64 0, 0
  store i64 %r64, ptr %local11
  br label %kira_label_25
kira_label_25:
  %r65 = load i64, ptr %local11
  %r66 = load i64, ptr %local3
  %native.state.get.ptr.67 = inttoptr i64 %r66 to ptr
  %native.state.get.slot.67 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.67, i64 16
  %native.state.get.val.19 = load %kira.bridge.value, ptr %native.state.get.slot.67
  %r67 = extractvalue %kira.bridge.value %native.state.get.val.19, 2
  %r68 = load i64, ptr %local3
  %native.state.get.ptr.69 = inttoptr i64 %r68 to ptr
  %native.state.get.slot.69 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.69, i64 17
  %native.state.get.val.20 = load %kira.bridge.value, ptr %native.state.get.slot.69
  %r69 = extractvalue %kira.bridge.value %native.state.get.val.20, 2
  %r70 = load i64, ptr %local3
  %native.state.get.ptr.71 = inttoptr i64 %r70 to ptr
  %native.state.get.slot.71 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.71, i64 18
  %native.state.get.val.21 = load %kira.bridge.value, ptr %native.state.get.slot.71
  %r71 = extractvalue %kira.bridge.value %native.state.get.val.21, 2
  call i1 @"kira_fn_66_sokolApplyPipelineBindingsAndDrawFlat"(i64 %r23, i64 %r25, i64 %r30, i64 %r32, i64 %r37, i64 %r39, i64 %r44, i64 %r46, i64 %r51, i64 %r53, i64 %r58, i64 %r60, i64 %r65, i64 %r67, i64 %r69, i64 %r71)
  br label %kira_label_7
kira_label_7:
  ret void
}

define void @"kira_fn_438_RenderEncoder.drawIndexedInstanced"(i64 %arg0, i64 %arg1, i64 %arg2) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.RenderEncoder
  store %t.RenderEncoder zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local2 = alloca i64
  %local3 = alloca i64
  %local4 = alloca i1
  %local5 = alloca i1
  %local6 = alloca i64
  %local7 = alloca i64
  %local8 = alloca i64
  %local9 = alloca i64
  %local10 = alloca i64
  %local11 = alloca i64
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  store i64 %arg2, ptr %local2
  %r0 = load i64, ptr %local0
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.RenderEncoder, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.rawptr.2 = load ptr, ptr %load.ptr.2
  %r2 = ptrtoint ptr %load.rawptr.2 to i64
  %native.recover.state.3 = inttoptr i64 %r2 to ptr
  %native.recover.payload.3 = call ptr @"kira_native_state_recover"(ptr %native.recover.state.3, i64 8245922201398611848)
  %r3 = ptrtoint ptr %native.recover.payload.3 to i64
  store i64 %r3, ptr %local3
  %r4 = load i64, ptr %local1
  %r5 = load i64, ptr %local3
  %native.state.set.ptr.4 = inttoptr i64 %r5 to ptr
  %native.state.set.slot.4 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.4, i64 17
  %native.state.set.pack.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.set.pack.0 = insertvalue %kira.bridge.value %native.state.set.pack.0.0, i64 %r4, 2
  store %kira.bridge.value %native.state.set.pack.0, ptr %native.state.set.slot.4
  %r6 = add i64 0, 0
  %r7 = load i64, ptr %local3
  %native.state.set.ptr.6 = inttoptr i64 %r7 to ptr
  %native.state.set.slot.6 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.6, i64 16
  %native.state.set.pack.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.set.pack.1 = insertvalue %kira.bridge.value %native.state.set.pack.1.0, i64 %r6, 2
  store %kira.bridge.value %native.state.set.pack.1, ptr %native.state.set.slot.6
  %r8 = load i64, ptr %local2
  %r9 = load i64, ptr %local3
  %native.state.set.ptr.8 = inttoptr i64 %r9 to ptr
  %native.state.set.slot.8 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.8, i64 18
  %native.state.set.pack.2.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.set.pack.2 = insertvalue %kira.bridge.value %native.state.set.pack.2.0, i64 %r8, 2
  store %kira.bridge.value %native.state.set.pack.2, ptr %native.state.set.slot.8
  %r10 = load i64, ptr %local3
  %native.state.get.ptr.11 = inttoptr i64 %r10 to ptr
  %native.state.get.slot.11 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.11, i64 2
  %native.state.get.val.3 = load %kira.bridge.value, ptr %native.state.get.slot.11
  %native.state.get.word.3 = extractvalue %kira.bridge.value %native.state.get.val.3, 2
  %r11 = trunc i64 %native.state.get.word.3 to i1
  br i1 %r11, label %kira_label_0, label %kira_label_1
kira_label_1:
  %r12 = add i1 0, 0
  store i1 %r12, ptr %local4
  br label %kira_label_2
kira_label_0:
  %r13 = load i64, ptr %local3
  %native.state.get.ptr.14 = inttoptr i64 %r13 to ptr
  %native.state.get.slot.14 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.14, i64 1
  %native.state.get.val.4 = load %kira.bridge.value, ptr %native.state.get.slot.14
  %native.state.get.word.4 = extractvalue %kira.bridge.value %native.state.get.val.4, 2
  %r14 = trunc i64 %native.state.get.word.4 to i1
  store i1 %r14, ptr %local4
  br label %kira_label_2
kira_label_2:
  %r15 = load i1, ptr %local4
  br i1 %r15, label %kira_label_3, label %kira_label_4
kira_label_4:
  %r16 = add i1 0, 0
  store i1 %r16, ptr %local5
  br label %kira_label_5
kira_label_3:
  %r17 = load i64, ptr %local3
  %native.state.get.ptr.18 = inttoptr i64 %r17 to ptr
  %native.state.get.slot.18 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.18, i64 0
  %native.state.get.val.5 = load %kira.bridge.value, ptr %native.state.get.slot.18
  %r18 = extractvalue %kira.bridge.value %native.state.get.val.5, 2
  %r19 = add i64 0, 0
  %r20 = icmp ne i64 %r18, %r19
  store i1 %r20, ptr %local5
  br label %kira_label_5
kira_label_5:
  %r21 = load i1, ptr %local5
  br i1 %r21, label %kira_label_6, label %kira_label_7
kira_label_6:
  %r22 = load i64, ptr %local3
  %native.state.get.ptr.23 = inttoptr i64 %r22 to ptr
  %native.state.get.slot.23 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.23, i64 0
  %native.state.get.val.6 = load %kira.bridge.value, ptr %native.state.get.slot.23
  %r23 = extractvalue %kira.bridge.value %native.state.get.val.6, 2
  %r24 = load i64, ptr %local3
  %native.state.get.ptr.25 = inttoptr i64 %r24 to ptr
  %native.state.get.slot.25 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.25, i64 3
  %native.state.get.val.7 = load %kira.bridge.value, ptr %native.state.get.slot.25
  %r25 = extractvalue %kira.bridge.value %native.state.get.val.7, 2
  %r26 = load i64, ptr %local3
  %native.state.get.ptr.27 = inttoptr i64 %r26 to ptr
  %native.state.get.slot.27 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.27, i64 4
  %native.state.get.val.8 = load %kira.bridge.value, ptr %native.state.get.slot.27
  %native.state.get.word.8 = extractvalue %kira.bridge.value %native.state.get.val.8, 2
  %r27 = trunc i64 %native.state.get.word.8 to i1
  br i1 %r27, label %kira_label_8, label %kira_label_9
kira_label_8:
  %r28 = add i64 0, 1
  store i64 %r28, ptr %local6
  br label %kira_label_10
kira_label_9:
  %r29 = add i64 0, 0
  store i64 %r29, ptr %local6
  br label %kira_label_10
kira_label_10:
  %r30 = load i64, ptr %local6
  %r31 = load i64, ptr %local3
  %native.state.get.ptr.32 = inttoptr i64 %r31 to ptr
  %native.state.get.slot.32 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.32, i64 5
  %native.state.get.val.9 = load %kira.bridge.value, ptr %native.state.get.slot.32
  %r32 = extractvalue %kira.bridge.value %native.state.get.val.9, 2
  %r33 = load i64, ptr %local3
  %native.state.get.ptr.34 = inttoptr i64 %r33 to ptr
  %native.state.get.slot.34 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.34, i64 6
  %native.state.get.val.10 = load %kira.bridge.value, ptr %native.state.get.slot.34
  %native.state.get.word.10 = extractvalue %kira.bridge.value %native.state.get.val.10, 2
  %r34 = trunc i64 %native.state.get.word.10 to i1
  br i1 %r34, label %kira_label_11, label %kira_label_12
kira_label_11:
  %r35 = add i64 0, 1
  store i64 %r35, ptr %local7
  br label %kira_label_13
kira_label_12:
  %r36 = add i64 0, 0
  store i64 %r36, ptr %local7
  br label %kira_label_13
kira_label_13:
  %r37 = load i64, ptr %local7
  %r38 = load i64, ptr %local3
  %native.state.get.ptr.39 = inttoptr i64 %r38 to ptr
  %native.state.get.slot.39 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.39, i64 8
  %native.state.get.val.11 = load %kira.bridge.value, ptr %native.state.get.slot.39
  %r39 = extractvalue %kira.bridge.value %native.state.get.val.11, 2
  %r40 = load i64, ptr %local3
  %native.state.get.ptr.41 = inttoptr i64 %r40 to ptr
  %native.state.get.slot.41 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.41, i64 9
  %native.state.get.val.12 = load %kira.bridge.value, ptr %native.state.get.slot.41
  %native.state.get.word.12 = extractvalue %kira.bridge.value %native.state.get.val.12, 2
  %r41 = trunc i64 %native.state.get.word.12 to i1
  br i1 %r41, label %kira_label_14, label %kira_label_15
kira_label_14:
  %r42 = add i64 0, 1
  store i64 %r42, ptr %local8
  br label %kira_label_16
kira_label_15:
  %r43 = add i64 0, 0
  store i64 %r43, ptr %local8
  br label %kira_label_16
kira_label_16:
  %r44 = load i64, ptr %local8
  %r45 = load i64, ptr %local3
  %native.state.get.ptr.46 = inttoptr i64 %r45 to ptr
  %native.state.get.slot.46 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.46, i64 10
  %native.state.get.val.13 = load %kira.bridge.value, ptr %native.state.get.slot.46
  %r46 = extractvalue %kira.bridge.value %native.state.get.val.13, 2
  %r47 = load i64, ptr %local3
  %native.state.get.ptr.48 = inttoptr i64 %r47 to ptr
  %native.state.get.slot.48 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.48, i64 11
  %native.state.get.val.14 = load %kira.bridge.value, ptr %native.state.get.slot.48
  %native.state.get.word.14 = extractvalue %kira.bridge.value %native.state.get.val.14, 2
  %r48 = trunc i64 %native.state.get.word.14 to i1
  br i1 %r48, label %kira_label_17, label %kira_label_18
kira_label_17:
  %r49 = add i64 0, 1
  store i64 %r49, ptr %local9
  br label %kira_label_19
kira_label_18:
  %r50 = add i64 0, 0
  store i64 %r50, ptr %local9
  br label %kira_label_19
kira_label_19:
  %r51 = load i64, ptr %local9
  %r52 = load i64, ptr %local3
  %native.state.get.ptr.53 = inttoptr i64 %r52 to ptr
  %native.state.get.slot.53 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.53, i64 12
  %native.state.get.val.15 = load %kira.bridge.value, ptr %native.state.get.slot.53
  %r53 = extractvalue %kira.bridge.value %native.state.get.val.15, 2
  %r54 = load i64, ptr %local3
  %native.state.get.ptr.55 = inttoptr i64 %r54 to ptr
  %native.state.get.slot.55 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.55, i64 13
  %native.state.get.val.16 = load %kira.bridge.value, ptr %native.state.get.slot.55
  %native.state.get.word.16 = extractvalue %kira.bridge.value %native.state.get.val.16, 2
  %r55 = trunc i64 %native.state.get.word.16 to i1
  br i1 %r55, label %kira_label_20, label %kira_label_21
kira_label_20:
  %r56 = add i64 0, 1
  store i64 %r56, ptr %local10
  br label %kira_label_22
kira_label_21:
  %r57 = add i64 0, 0
  store i64 %r57, ptr %local10
  br label %kira_label_22
kira_label_22:
  %r58 = load i64, ptr %local10
  %r59 = load i64, ptr %local3
  %native.state.get.ptr.60 = inttoptr i64 %r59 to ptr
  %native.state.get.slot.60 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.60, i64 14
  %native.state.get.val.17 = load %kira.bridge.value, ptr %native.state.get.slot.60
  %r60 = extractvalue %kira.bridge.value %native.state.get.val.17, 2
  %r61 = load i64, ptr %local3
  %native.state.get.ptr.62 = inttoptr i64 %r61 to ptr
  %native.state.get.slot.62 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.62, i64 15
  %native.state.get.val.18 = load %kira.bridge.value, ptr %native.state.get.slot.62
  %native.state.get.word.18 = extractvalue %kira.bridge.value %native.state.get.val.18, 2
  %r62 = trunc i64 %native.state.get.word.18 to i1
  br i1 %r62, label %kira_label_23, label %kira_label_24
kira_label_23:
  %r63 = add i64 0, 1
  store i64 %r63, ptr %local11
  br label %kira_label_25
kira_label_24:
  %r64 = add i64 0, 0
  store i64 %r64, ptr %local11
  br label %kira_label_25
kira_label_25:
  %r65 = load i64, ptr %local11
  %r66 = load i64, ptr %local3
  %native.state.get.ptr.67 = inttoptr i64 %r66 to ptr
  %native.state.get.slot.67 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.67, i64 16
  %native.state.get.val.19 = load %kira.bridge.value, ptr %native.state.get.slot.67
  %r67 = extractvalue %kira.bridge.value %native.state.get.val.19, 2
  %r68 = load i64, ptr %local3
  %native.state.get.ptr.69 = inttoptr i64 %r68 to ptr
  %native.state.get.slot.69 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.69, i64 17
  %native.state.get.val.20 = load %kira.bridge.value, ptr %native.state.get.slot.69
  %r69 = extractvalue %kira.bridge.value %native.state.get.val.20, 2
  %r70 = load i64, ptr %local3
  %native.state.get.ptr.71 = inttoptr i64 %r70 to ptr
  %native.state.get.slot.71 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.71, i64 18
  %native.state.get.val.21 = load %kira.bridge.value, ptr %native.state.get.slot.71
  %r71 = extractvalue %kira.bridge.value %native.state.get.val.21, 2
  call i1 @"kira_fn_66_sokolApplyPipelineBindingsAndDrawFlat"(i64 %r23, i64 %r25, i64 %r30, i64 %r32, i64 %r37, i64 %r39, i64 %r44, i64 %r46, i64 %r51, i64 %r53, i64 %r58, i64 %r60, i64 %r65, i64 %r67, i64 %r69, i64 %r71)
  br label %kira_label_7
kira_label_7:
  ret void
}

define void @"kira_fn_439_RenderEncoder.pushClip"(i64 %arg0, i64 %arg1, double %arg2) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.RenderEncoder
  store %t.RenderEncoder zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.GraphicsRect
  store %t.GraphicsRect zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %local2 = alloca double
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.3 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.3
  %cleanup.heap.slot.6 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.6
  %cleanup.heap.slot.9 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.9
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  store double %arg2, ptr %local2
  %r0 = load i64, ptr %local1
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.GraphicsRect, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.raw.float.2 = load double, ptr %load.ptr.2
  %r2 = fadd double %load.raw.float.2, 0.0
  %r3 = load i64, ptr %local1
  %field.base.4 = inttoptr i64 %r3 to ptr
  %field.ptr.4 = getelementptr inbounds %t.GraphicsRect, ptr %field.base.4, i32 0, i32 1
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %load.ptr.5 = inttoptr i64 %r4 to ptr
  %load.raw.float.5 = load double, ptr %load.ptr.5
  %r5 = fadd double %load.raw.float.5, 0.0
  %r6 = load i64, ptr %local1
  %field.base.7 = inttoptr i64 %r6 to ptr
  %field.ptr.7 = getelementptr inbounds %t.GraphicsRect, ptr %field.base.7, i32 0, i32 2
  %r7 = ptrtoint ptr %field.ptr.7 to i64
  %load.ptr.8 = inttoptr i64 %r7 to ptr
  %load.raw.float.8 = load double, ptr %load.ptr.8
  %r8 = fadd double %load.raw.float.8, 0.0
  %r9 = load i64, ptr %local1
  %field.base.10 = inttoptr i64 %r9 to ptr
  %field.ptr.10 = getelementptr inbounds %t.GraphicsRect, ptr %field.base.10, i32 0, i32 3
  %r10 = ptrtoint ptr %field.ptr.10 to i64
  %load.ptr.11 = inttoptr i64 %r10 to ptr
  %load.raw.float.11 = load double, ptr %load.ptr.11
  %r11 = fadd double %load.raw.float.11, 0.0
  %r12 = load double, ptr %local2
  call void @"kira_fn_169_sokolUiPushClip"(double %r2, double %r5, double %r8, double %r11, double %r12)
  ret void
}

define void @"kira_fn_440_RenderEncoder.popClip"(i64 %arg0) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.RenderEncoder
  store %t.RenderEncoder zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  store i64 %arg0, ptr %local0
  call void @"kira_fn_170_sokolUiPopClip"()
  ret void
}

define void @"kira_fn_441_RenderEncoder.drawSurface"(i64 %arg0, i64 %arg1, i64 %arg2, i64 %arg3, double %arg4, double %arg5) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.RenderEncoder
  store %t.RenderEncoder zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.GraphicsRect
  store %t.GraphicsRect zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %local2 = alloca i64
  %local.storage.2 = alloca %t.Color
  store %t.Color zeroinitializer, ptr %local.storage.2
  %local.storage.int.2 = ptrtoint ptr %local.storage.2 to i64
  store i64 %local.storage.int.2, ptr %local2
  %local3 = alloca i64
  %local.storage.3 = alloca %t.Color
  store %t.Color zeroinitializer, ptr %local.storage.3
  %local.storage.int.3 = ptrtoint ptr %local.storage.3 to i64
  store i64 %local.storage.int.3, ptr %local3
  %local4 = alloca double
  %local5 = alloca double
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.3 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.3
  %cleanup.heap.slot.6 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.6
  %cleanup.heap.slot.9 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.9
  %cleanup.heap.slot.12 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.12
  %cleanup.heap.slot.15 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.15
  %cleanup.heap.slot.18 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.18
  %cleanup.heap.slot.21 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.21
  %cleanup.heap.slot.24 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.24
  %cleanup.heap.slot.27 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.27
  %cleanup.heap.slot.30 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.30
  %cleanup.heap.slot.33 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.33
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  store i64 %arg2, ptr %local2
  store i64 %arg3, ptr %local3
  store double %arg4, ptr %local4
  store double %arg5, ptr %local5
  %r0 = load i64, ptr %local1
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.GraphicsRect, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.raw.float.2 = load double, ptr %load.ptr.2
  %r2 = fadd double %load.raw.float.2, 0.0
  %r3 = load i64, ptr %local1
  %field.base.4 = inttoptr i64 %r3 to ptr
  %field.ptr.4 = getelementptr inbounds %t.GraphicsRect, ptr %field.base.4, i32 0, i32 1
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %load.ptr.5 = inttoptr i64 %r4 to ptr
  %load.raw.float.5 = load double, ptr %load.ptr.5
  %r5 = fadd double %load.raw.float.5, 0.0
  %r6 = load i64, ptr %local1
  %field.base.7 = inttoptr i64 %r6 to ptr
  %field.ptr.7 = getelementptr inbounds %t.GraphicsRect, ptr %field.base.7, i32 0, i32 2
  %r7 = ptrtoint ptr %field.ptr.7 to i64
  %load.ptr.8 = inttoptr i64 %r7 to ptr
  %load.raw.float.8 = load double, ptr %load.ptr.8
  %r8 = fadd double %load.raw.float.8, 0.0
  %r9 = load i64, ptr %local1
  %field.base.10 = inttoptr i64 %r9 to ptr
  %field.ptr.10 = getelementptr inbounds %t.GraphicsRect, ptr %field.base.10, i32 0, i32 3
  %r10 = ptrtoint ptr %field.ptr.10 to i64
  %load.ptr.11 = inttoptr i64 %r10 to ptr
  %load.raw.float.11 = load double, ptr %load.ptr.11
  %r11 = fadd double %load.raw.float.11, 0.0
  %r12 = load i64, ptr %local2
  %field.base.13 = inttoptr i64 %r12 to ptr
  %field.ptr.13 = getelementptr inbounds %t.Color, ptr %field.base.13, i32 0, i32 0
  %r13 = ptrtoint ptr %field.ptr.13 to i64
  %load.ptr.14 = inttoptr i64 %r13 to ptr
  %load.raw.float.14 = load double, ptr %load.ptr.14
  %r14 = fadd double %load.raw.float.14, 0.0
  %r15 = load i64, ptr %local2
  %field.base.16 = inttoptr i64 %r15 to ptr
  %field.ptr.16 = getelementptr inbounds %t.Color, ptr %field.base.16, i32 0, i32 1
  %r16 = ptrtoint ptr %field.ptr.16 to i64
  %load.ptr.17 = inttoptr i64 %r16 to ptr
  %load.raw.float.17 = load double, ptr %load.ptr.17
  %r17 = fadd double %load.raw.float.17, 0.0
  %r18 = load i64, ptr %local2
  %field.base.19 = inttoptr i64 %r18 to ptr
  %field.ptr.19 = getelementptr inbounds %t.Color, ptr %field.base.19, i32 0, i32 2
  %r19 = ptrtoint ptr %field.ptr.19 to i64
  %load.ptr.20 = inttoptr i64 %r19 to ptr
  %load.raw.float.20 = load double, ptr %load.ptr.20
  %r20 = fadd double %load.raw.float.20, 0.0
  %r21 = load i64, ptr %local2
  %field.base.22 = inttoptr i64 %r21 to ptr
  %field.ptr.22 = getelementptr inbounds %t.Color, ptr %field.base.22, i32 0, i32 3
  %r22 = ptrtoint ptr %field.ptr.22 to i64
  %load.ptr.23 = inttoptr i64 %r22 to ptr
  %load.raw.float.23 = load double, ptr %load.ptr.23
  %r23 = fadd double %load.raw.float.23, 0.0
  %r24 = load i64, ptr %local3
  %field.base.25 = inttoptr i64 %r24 to ptr
  %field.ptr.25 = getelementptr inbounds %t.Color, ptr %field.base.25, i32 0, i32 0
  %r25 = ptrtoint ptr %field.ptr.25 to i64
  %load.ptr.26 = inttoptr i64 %r25 to ptr
  %load.raw.float.26 = load double, ptr %load.ptr.26
  %r26 = fadd double %load.raw.float.26, 0.0
  %r27 = load i64, ptr %local3
  %field.base.28 = inttoptr i64 %r27 to ptr
  %field.ptr.28 = getelementptr inbounds %t.Color, ptr %field.base.28, i32 0, i32 1
  %r28 = ptrtoint ptr %field.ptr.28 to i64
  %load.ptr.29 = inttoptr i64 %r28 to ptr
  %load.raw.float.29 = load double, ptr %load.ptr.29
  %r29 = fadd double %load.raw.float.29, 0.0
  %r30 = load i64, ptr %local3
  %field.base.31 = inttoptr i64 %r30 to ptr
  %field.ptr.31 = getelementptr inbounds %t.Color, ptr %field.base.31, i32 0, i32 2
  %r31 = ptrtoint ptr %field.ptr.31 to i64
  %load.ptr.32 = inttoptr i64 %r31 to ptr
  %load.raw.float.32 = load double, ptr %load.ptr.32
  %r32 = fadd double %load.raw.float.32, 0.0
  %r33 = load i64, ptr %local3
  %field.base.34 = inttoptr i64 %r33 to ptr
  %field.ptr.34 = getelementptr inbounds %t.Color, ptr %field.base.34, i32 0, i32 3
  %r34 = ptrtoint ptr %field.ptr.34 to i64
  %load.ptr.35 = inttoptr i64 %r34 to ptr
  %load.raw.float.35 = load double, ptr %load.ptr.35
  %r35 = fadd double %load.raw.float.35, 0.0
  %r36 = load double, ptr %local4
  %r37 = load double, ptr %local5
  call void @"kira_fn_171_sokolUiDrawSurface"(double %r2, double %r5, double %r8, double %r11, double %r14, double %r17, double %r20, double %r23, double %r26, double %r29, double %r32, double %r35, double %r36, double %r37)
  ret void
}

define void @"kira_fn_442_RenderEncoder.drawSquircleSurface"(i64 %arg0, i64 %arg1, i64 %arg2, i64 %arg3, double %arg4, double %arg5) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.RenderEncoder
  store %t.RenderEncoder zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.GraphicsRect
  store %t.GraphicsRect zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %local2 = alloca i64
  %local.storage.2 = alloca %t.Color
  store %t.Color zeroinitializer, ptr %local.storage.2
  %local.storage.int.2 = ptrtoint ptr %local.storage.2 to i64
  store i64 %local.storage.int.2, ptr %local2
  %local3 = alloca i64
  %local.storage.3 = alloca %t.Color
  store %t.Color zeroinitializer, ptr %local.storage.3
  %local.storage.int.3 = ptrtoint ptr %local.storage.3 to i64
  store i64 %local.storage.int.3, ptr %local3
  %local4 = alloca double
  %local5 = alloca double
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.3 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.3
  %cleanup.heap.slot.6 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.6
  %cleanup.heap.slot.9 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.9
  %cleanup.heap.slot.12 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.12
  %cleanup.heap.slot.15 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.15
  %cleanup.heap.slot.18 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.18
  %cleanup.heap.slot.21 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.21
  %cleanup.heap.slot.24 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.24
  %cleanup.heap.slot.27 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.27
  %cleanup.heap.slot.30 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.30
  %cleanup.heap.slot.33 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.33
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  store i64 %arg2, ptr %local2
  store i64 %arg3, ptr %local3
  store double %arg4, ptr %local4
  store double %arg5, ptr %local5
  %r0 = load i64, ptr %local1
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.GraphicsRect, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.raw.float.2 = load double, ptr %load.ptr.2
  %r2 = fadd double %load.raw.float.2, 0.0
  %r3 = load i64, ptr %local1
  %field.base.4 = inttoptr i64 %r3 to ptr
  %field.ptr.4 = getelementptr inbounds %t.GraphicsRect, ptr %field.base.4, i32 0, i32 1
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %load.ptr.5 = inttoptr i64 %r4 to ptr
  %load.raw.float.5 = load double, ptr %load.ptr.5
  %r5 = fadd double %load.raw.float.5, 0.0
  %r6 = load i64, ptr %local1
  %field.base.7 = inttoptr i64 %r6 to ptr
  %field.ptr.7 = getelementptr inbounds %t.GraphicsRect, ptr %field.base.7, i32 0, i32 2
  %r7 = ptrtoint ptr %field.ptr.7 to i64
  %load.ptr.8 = inttoptr i64 %r7 to ptr
  %load.raw.float.8 = load double, ptr %load.ptr.8
  %r8 = fadd double %load.raw.float.8, 0.0
  %r9 = load i64, ptr %local1
  %field.base.10 = inttoptr i64 %r9 to ptr
  %field.ptr.10 = getelementptr inbounds %t.GraphicsRect, ptr %field.base.10, i32 0, i32 3
  %r10 = ptrtoint ptr %field.ptr.10 to i64
  %load.ptr.11 = inttoptr i64 %r10 to ptr
  %load.raw.float.11 = load double, ptr %load.ptr.11
  %r11 = fadd double %load.raw.float.11, 0.0
  %r12 = load i64, ptr %local2
  %field.base.13 = inttoptr i64 %r12 to ptr
  %field.ptr.13 = getelementptr inbounds %t.Color, ptr %field.base.13, i32 0, i32 0
  %r13 = ptrtoint ptr %field.ptr.13 to i64
  %load.ptr.14 = inttoptr i64 %r13 to ptr
  %load.raw.float.14 = load double, ptr %load.ptr.14
  %r14 = fadd double %load.raw.float.14, 0.0
  %r15 = load i64, ptr %local2
  %field.base.16 = inttoptr i64 %r15 to ptr
  %field.ptr.16 = getelementptr inbounds %t.Color, ptr %field.base.16, i32 0, i32 1
  %r16 = ptrtoint ptr %field.ptr.16 to i64
  %load.ptr.17 = inttoptr i64 %r16 to ptr
  %load.raw.float.17 = load double, ptr %load.ptr.17
  %r17 = fadd double %load.raw.float.17, 0.0
  %r18 = load i64, ptr %local2
  %field.base.19 = inttoptr i64 %r18 to ptr
  %field.ptr.19 = getelementptr inbounds %t.Color, ptr %field.base.19, i32 0, i32 2
  %r19 = ptrtoint ptr %field.ptr.19 to i64
  %load.ptr.20 = inttoptr i64 %r19 to ptr
  %load.raw.float.20 = load double, ptr %load.ptr.20
  %r20 = fadd double %load.raw.float.20, 0.0
  %r21 = load i64, ptr %local2
  %field.base.22 = inttoptr i64 %r21 to ptr
  %field.ptr.22 = getelementptr inbounds %t.Color, ptr %field.base.22, i32 0, i32 3
  %r22 = ptrtoint ptr %field.ptr.22 to i64
  %load.ptr.23 = inttoptr i64 %r22 to ptr
  %load.raw.float.23 = load double, ptr %load.ptr.23
  %r23 = fadd double %load.raw.float.23, 0.0
  %r24 = load i64, ptr %local3
  %field.base.25 = inttoptr i64 %r24 to ptr
  %field.ptr.25 = getelementptr inbounds %t.Color, ptr %field.base.25, i32 0, i32 0
  %r25 = ptrtoint ptr %field.ptr.25 to i64
  %load.ptr.26 = inttoptr i64 %r25 to ptr
  %load.raw.float.26 = load double, ptr %load.ptr.26
  %r26 = fadd double %load.raw.float.26, 0.0
  %r27 = load i64, ptr %local3
  %field.base.28 = inttoptr i64 %r27 to ptr
  %field.ptr.28 = getelementptr inbounds %t.Color, ptr %field.base.28, i32 0, i32 1
  %r28 = ptrtoint ptr %field.ptr.28 to i64
  %load.ptr.29 = inttoptr i64 %r28 to ptr
  %load.raw.float.29 = load double, ptr %load.ptr.29
  %r29 = fadd double %load.raw.float.29, 0.0
  %r30 = load i64, ptr %local3
  %field.base.31 = inttoptr i64 %r30 to ptr
  %field.ptr.31 = getelementptr inbounds %t.Color, ptr %field.base.31, i32 0, i32 2
  %r31 = ptrtoint ptr %field.ptr.31 to i64
  %load.ptr.32 = inttoptr i64 %r31 to ptr
  %load.raw.float.32 = load double, ptr %load.ptr.32
  %r32 = fadd double %load.raw.float.32, 0.0
  %r33 = load i64, ptr %local3
  %field.base.34 = inttoptr i64 %r33 to ptr
  %field.ptr.34 = getelementptr inbounds %t.Color, ptr %field.base.34, i32 0, i32 3
  %r34 = ptrtoint ptr %field.ptr.34 to i64
  %load.ptr.35 = inttoptr i64 %r34 to ptr
  %load.raw.float.35 = load double, ptr %load.ptr.35
  %r35 = fadd double %load.raw.float.35, 0.0
  %r36 = load double, ptr %local4
  %r37 = load double, ptr %local5
  call void @"kira_fn_172_sokolUiDrawSquircleSurface"(double %r2, double %r5, double %r8, double %r11, double %r14, double %r17, double %r20, double %r23, double %r26, double %r29, double %r32, double %r35, double %r36, double %r37)
  ret void
}

define void @"kira_fn_443_RenderEncoder.drawText"(i64 %arg0, i64 %arg1, %kira.string %arg2, i64 %arg3, double %arg4) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.RenderEncoder
  store %t.RenderEncoder zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.GraphicsRect
  store %t.GraphicsRect zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %local2 = alloca %kira.string
  %local3 = alloca i64
  %local.storage.3 = alloca %t.Color
  store %t.Color zeroinitializer, ptr %local.storage.3
  %local.storage.int.3 = ptrtoint ptr %local.storage.3 to i64
  store i64 %local.storage.int.3, ptr %local3
  %local4 = alloca double
  %cleanup.heap.slot.1 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.1
  %cleanup.heap.slot.4 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.4
  %cleanup.heap.slot.7 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.7
  %cleanup.heap.slot.10 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.10
  %cleanup.heap.slot.13 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.13
  %cleanup.heap.slot.16 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.16
  %cleanup.heap.slot.19 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.19
  %cleanup.heap.slot.22 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.22
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  store %kira.string %arg2, ptr %local2
  store i64 %arg3, ptr %local3
  store double %arg4, ptr %local4
  %r0 = load %kira.string, ptr %local2
  %r1 = load i64, ptr %local1
  %field.base.2 = inttoptr i64 %r1 to ptr
  %field.ptr.2 = getelementptr inbounds %t.GraphicsRect, ptr %field.base.2, i32 0, i32 0
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %load.ptr.3 = inttoptr i64 %r2 to ptr
  %load.raw.float.3 = load double, ptr %load.ptr.3
  %r3 = fadd double %load.raw.float.3, 0.0
  %r4 = load i64, ptr %local1
  %field.base.5 = inttoptr i64 %r4 to ptr
  %field.ptr.5 = getelementptr inbounds %t.GraphicsRect, ptr %field.base.5, i32 0, i32 1
  %r5 = ptrtoint ptr %field.ptr.5 to i64
  %load.ptr.6 = inttoptr i64 %r5 to ptr
  %load.raw.float.6 = load double, ptr %load.ptr.6
  %r6 = fadd double %load.raw.float.6, 0.0
  %r7 = load i64, ptr %local1
  %field.base.8 = inttoptr i64 %r7 to ptr
  %field.ptr.8 = getelementptr inbounds %t.GraphicsRect, ptr %field.base.8, i32 0, i32 2
  %r8 = ptrtoint ptr %field.ptr.8 to i64
  %load.ptr.9 = inttoptr i64 %r8 to ptr
  %load.raw.float.9 = load double, ptr %load.ptr.9
  %r9 = fadd double %load.raw.float.9, 0.0
  %r10 = load i64, ptr %local1
  %field.base.11 = inttoptr i64 %r10 to ptr
  %field.ptr.11 = getelementptr inbounds %t.GraphicsRect, ptr %field.base.11, i32 0, i32 3
  %r11 = ptrtoint ptr %field.ptr.11 to i64
  %load.ptr.12 = inttoptr i64 %r11 to ptr
  %load.raw.float.12 = load double, ptr %load.ptr.12
  %r12 = fadd double %load.raw.float.12, 0.0
  %r13 = load i64, ptr %local3
  %field.base.14 = inttoptr i64 %r13 to ptr
  %field.ptr.14 = getelementptr inbounds %t.Color, ptr %field.base.14, i32 0, i32 0
  %r14 = ptrtoint ptr %field.ptr.14 to i64
  %load.ptr.15 = inttoptr i64 %r14 to ptr
  %load.raw.float.15 = load double, ptr %load.ptr.15
  %r15 = fadd double %load.raw.float.15, 0.0
  %r16 = load i64, ptr %local3
  %field.base.17 = inttoptr i64 %r16 to ptr
  %field.ptr.17 = getelementptr inbounds %t.Color, ptr %field.base.17, i32 0, i32 1
  %r17 = ptrtoint ptr %field.ptr.17 to i64
  %load.ptr.18 = inttoptr i64 %r17 to ptr
  %load.raw.float.18 = load double, ptr %load.ptr.18
  %r18 = fadd double %load.raw.float.18, 0.0
  %r19 = load i64, ptr %local3
  %field.base.20 = inttoptr i64 %r19 to ptr
  %field.ptr.20 = getelementptr inbounds %t.Color, ptr %field.base.20, i32 0, i32 2
  %r20 = ptrtoint ptr %field.ptr.20 to i64
  %load.ptr.21 = inttoptr i64 %r20 to ptr
  %load.raw.float.21 = load double, ptr %load.ptr.21
  %r21 = fadd double %load.raw.float.21, 0.0
  %r22 = load i64, ptr %local3
  %field.base.23 = inttoptr i64 %r22 to ptr
  %field.ptr.23 = getelementptr inbounds %t.Color, ptr %field.base.23, i32 0, i32 3
  %r23 = ptrtoint ptr %field.ptr.23 to i64
  %load.ptr.24 = inttoptr i64 %r23 to ptr
  %load.raw.float.24 = load double, ptr %load.ptr.24
  %r24 = fadd double %load.raw.float.24, 0.0
  %r25 = load double, ptr %local4
  call void @"kira_fn_174_sokolUiDrawText"(%kira.string %r0, double %r3, double %r6, double %r9, double %r12, double %r15, double %r18, double %r21, double %r24, double %r25)
  ret void
}

define void @"kira_fn_444_RenderEncoder.drawGlow"(i64 %arg0, i64 %arg1, i64 %arg2, double %arg3, double %arg4) {
entry:
  %local0 = alloca i64
  %local.storage.0 = alloca %t.RenderEncoder
  store %t.RenderEncoder zeroinitializer, ptr %local.storage.0
  %local.storage.int.0 = ptrtoint ptr %local.storage.0 to i64
  store i64 %local.storage.int.0, ptr %local0
  %local1 = alloca i64
  %local.storage.1 = alloca %t.GraphicsRect
  store %t.GraphicsRect zeroinitializer, ptr %local.storage.1
  %local.storage.int.1 = ptrtoint ptr %local.storage.1 to i64
  store i64 %local.storage.int.1, ptr %local1
  %local2 = alloca i64
  %local.storage.2 = alloca %t.Color
  store %t.Color zeroinitializer, ptr %local.storage.2
  %local.storage.int.2 = ptrtoint ptr %local.storage.2 to i64
  store i64 %local.storage.int.2, ptr %local2
  %local3 = alloca double
  %local4 = alloca double
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.3 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.3
  %cleanup.heap.slot.6 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.6
  %cleanup.heap.slot.9 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.9
  %cleanup.heap.slot.12 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.12
  %cleanup.heap.slot.15 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.15
  %cleanup.heap.slot.18 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.18
  %cleanup.heap.slot.21 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.21
  store i64 %arg0, ptr %local0
  store i64 %arg1, ptr %local1
  store i64 %arg2, ptr %local2
  store double %arg3, ptr %local3
  store double %arg4, ptr %local4
  %r0 = load i64, ptr %local1
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.GraphicsRect, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.raw.float.2 = load double, ptr %load.ptr.2
  %r2 = fadd double %load.raw.float.2, 0.0
  %r3 = load i64, ptr %local1
  %field.base.4 = inttoptr i64 %r3 to ptr
  %field.ptr.4 = getelementptr inbounds %t.GraphicsRect, ptr %field.base.4, i32 0, i32 1
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %load.ptr.5 = inttoptr i64 %r4 to ptr
  %load.raw.float.5 = load double, ptr %load.ptr.5
  %r5 = fadd double %load.raw.float.5, 0.0
  %r6 = load i64, ptr %local1
  %field.base.7 = inttoptr i64 %r6 to ptr
  %field.ptr.7 = getelementptr inbounds %t.GraphicsRect, ptr %field.base.7, i32 0, i32 2
  %r7 = ptrtoint ptr %field.ptr.7 to i64
  %load.ptr.8 = inttoptr i64 %r7 to ptr
  %load.raw.float.8 = load double, ptr %load.ptr.8
  %r8 = fadd double %load.raw.float.8, 0.0
  %r9 = load i64, ptr %local1
  %field.base.10 = inttoptr i64 %r9 to ptr
  %field.ptr.10 = getelementptr inbounds %t.GraphicsRect, ptr %field.base.10, i32 0, i32 3
  %r10 = ptrtoint ptr %field.ptr.10 to i64
  %load.ptr.11 = inttoptr i64 %r10 to ptr
  %load.raw.float.11 = load double, ptr %load.ptr.11
  %r11 = fadd double %load.raw.float.11, 0.0
  %r12 = load i64, ptr %local2
  %field.base.13 = inttoptr i64 %r12 to ptr
  %field.ptr.13 = getelementptr inbounds %t.Color, ptr %field.base.13, i32 0, i32 0
  %r13 = ptrtoint ptr %field.ptr.13 to i64
  %load.ptr.14 = inttoptr i64 %r13 to ptr
  %load.raw.float.14 = load double, ptr %load.ptr.14
  %r14 = fadd double %load.raw.float.14, 0.0
  %r15 = load i64, ptr %local2
  %field.base.16 = inttoptr i64 %r15 to ptr
  %field.ptr.16 = getelementptr inbounds %t.Color, ptr %field.base.16, i32 0, i32 1
  %r16 = ptrtoint ptr %field.ptr.16 to i64
  %load.ptr.17 = inttoptr i64 %r16 to ptr
  %load.raw.float.17 = load double, ptr %load.ptr.17
  %r17 = fadd double %load.raw.float.17, 0.0
  %r18 = load i64, ptr %local2
  %field.base.19 = inttoptr i64 %r18 to ptr
  %field.ptr.19 = getelementptr inbounds %t.Color, ptr %field.base.19, i32 0, i32 2
  %r19 = ptrtoint ptr %field.ptr.19 to i64
  %load.ptr.20 = inttoptr i64 %r19 to ptr
  %load.raw.float.20 = load double, ptr %load.ptr.20
  %r20 = fadd double %load.raw.float.20, 0.0
  %r21 = load i64, ptr %local2
  %field.base.22 = inttoptr i64 %r21 to ptr
  %field.ptr.22 = getelementptr inbounds %t.Color, ptr %field.base.22, i32 0, i32 3
  %r22 = ptrtoint ptr %field.ptr.22 to i64
  %load.ptr.23 = inttoptr i64 %r22 to ptr
  %load.raw.float.23 = load double, ptr %load.ptr.23
  %r23 = fadd double %load.raw.float.23, 0.0
  %r24 = load double, ptr %local3
  %r25 = load double, ptr %local4
  call void @"kira_fn_173_sokolUiDrawGlow"(double %r2, double %r5, double %r8, double %r11, double %r14, double %r17, double %r20, double %r23, double %r24, double %r25)
  ret void
}

define void @"kira_fn_169_sokolUiPushClip"(double %arg0, double %arg1, double %arg2, double %arg3, double %arg4) {
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

define void @"kira_fn_170_sokolUiPopClip"() {
entry:
  call void @"kg_ui_pop_clip"()
  ret void
}

define void @"kira_fn_171_sokolUiDrawSurface"(double %arg0, double %arg1, double %arg2, double %arg3, double %arg4, double %arg5, double %arg6, double %arg7, double %arg8, double %arg9, double %arg10, double %arg11, double %arg12, double %arg13) {
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

define void @"kira_fn_172_sokolUiDrawSquircleSurface"(double %arg0, double %arg1, double %arg2, double %arg3, double %arg4, double %arg5, double %arg6, double %arg7, double %arg8, double %arg9, double %arg10, double %arg11, double %arg12, double %arg13) {
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

define void @"kira_fn_173_sokolUiDrawGlow"(double %arg0, double %arg1, double %arg2, double %arg3, double %arg4, double %arg5, double %arg6, double %arg7, double %arg8, double %arg9) {
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

define void @"kira_fn_174_sokolUiDrawText"(%kira.string %arg0, double %arg1, double %arg2, double %arg3, double %arg4, double %arg5, double %arg6, double %arg7, double %arg8, double %arg9) {
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

define i64 @"kira_fn_175_makeRenderEncoder"() {
entry:
  %cleanup.heap.slot.1 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.1
  %r0 = add i1 0, 0
  %r1 = call i64 @"kira_fn_176_makeRenderEncoderWithPassActive"(i1 %r0)
  %cleanup.call.ptr.1 = inttoptr i64 %r1 to ptr
  store ptr %cleanup.call.ptr.1, ptr %cleanup.heap.slot.1
  ret i64 %r1
}

define i64 @"kira_fn_176_makeRenderEncoderWithPassActive"(i1 %arg0) {
entry:
  %local0 = alloca i1
  %local1 = alloca i64
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.40 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.40
  store i1 %arg0, ptr %local0
  %alloc.size.ptr.0 = getelementptr %t.RenderEncoderState, ptr null, i32 1
  %alloc.size.0 = ptrtoint ptr %alloc.size.ptr.0 to i64
  %alloc.empty.0 = icmp eq i64 %alloc.size.0, 0
  %alloc.bytes.0 = select i1 %alloc.empty.0, i64 1, i64 %alloc.size.0
  %alloc.ptr.0 = call ptr @malloc(i64 %alloc.bytes.0)
  store %t.RenderEncoderState zeroinitializer, ptr %alloc.ptr.0
  %r0 = ptrtoint ptr %alloc.ptr.0 to i64
  store ptr %alloc.ptr.0, ptr %cleanup.heap.slot.0
  %r1 = add i64 0, 0
  %field.base.2 = inttoptr i64 %r0 to ptr
  %field.ptr.2 = getelementptr inbounds %t.RenderEncoderState, ptr %field.base.2, i32 0, i32 0
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %store.ptr.1 = inttoptr i64 %r2 to ptr
  %store.cast.1 = trunc i64 %r1 to i32
  store i32 %store.cast.1, ptr %store.ptr.1
  %r3 = add i1 0, 0
  %field.base.4 = inttoptr i64 %r0 to ptr
  %field.ptr.4 = getelementptr inbounds %t.RenderEncoderState, ptr %field.base.4, i32 0, i32 1
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %store.ptr.3 = inttoptr i64 %r4 to ptr
  %store.bool.3 = zext i1 %r3 to i8
  store i8 %store.bool.3, ptr %store.ptr.3
  %r5 = load i1, ptr %local0
  %field.base.6 = inttoptr i64 %r0 to ptr
  %field.ptr.6 = getelementptr inbounds %t.RenderEncoderState, ptr %field.base.6, i32 0, i32 2
  %r6 = ptrtoint ptr %field.ptr.6 to i64
  %store.ptr.5 = inttoptr i64 %r6 to ptr
  %store.bool.5 = zext i1 %r5 to i8
  store i8 %store.bool.5, ptr %store.ptr.5
  %r7 = add i64 0, 0
  %field.base.8 = inttoptr i64 %r0 to ptr
  %field.ptr.8 = getelementptr inbounds %t.RenderEncoderState, ptr %field.base.8, i32 0, i32 3
  %r8 = ptrtoint ptr %field.ptr.8 to i64
  %store.ptr.7 = inttoptr i64 %r8 to ptr
  %store.cast.7 = trunc i64 %r7 to i32
  store i32 %store.cast.7, ptr %store.ptr.7
  %r9 = add i1 0, 0
  %field.base.10 = inttoptr i64 %r0 to ptr
  %field.ptr.10 = getelementptr inbounds %t.RenderEncoderState, ptr %field.base.10, i32 0, i32 4
  %r10 = ptrtoint ptr %field.ptr.10 to i64
  %store.ptr.9 = inttoptr i64 %r10 to ptr
  %store.bool.9 = zext i1 %r9 to i8
  store i8 %store.bool.9, ptr %store.ptr.9
  %r11 = add i64 0, 0
  %field.base.12 = inttoptr i64 %r0 to ptr
  %field.ptr.12 = getelementptr inbounds %t.RenderEncoderState, ptr %field.base.12, i32 0, i32 5
  %r12 = ptrtoint ptr %field.ptr.12 to i64
  %store.ptr.11 = inttoptr i64 %r12 to ptr
  %store.cast.11 = trunc i64 %r11 to i32
  store i32 %store.cast.11, ptr %store.ptr.11
  %r13 = add i1 0, 0
  %field.base.14 = inttoptr i64 %r0 to ptr
  %field.ptr.14 = getelementptr inbounds %t.RenderEncoderState, ptr %field.base.14, i32 0, i32 6
  %r14 = ptrtoint ptr %field.ptr.14 to i64
  %store.ptr.13 = inttoptr i64 %r14 to ptr
  %store.bool.13 = zext i1 %r13 to i8
  store i8 %store.bool.13, ptr %store.ptr.13
  %r15 = call i64 @"kira_fn_121_indexFormatUint32"()
  %field.base.16 = inttoptr i64 %r0 to ptr
  %field.ptr.16 = getelementptr inbounds %t.RenderEncoderState, ptr %field.base.16, i32 0, i32 7
  %r16 = ptrtoint ptr %field.ptr.16 to i64
  %store.ptr.15 = inttoptr i64 %r16 to ptr
  store i64 %r15, ptr %store.ptr.15
  %r17 = add i64 0, 0
  %field.base.18 = inttoptr i64 %r0 to ptr
  %field.ptr.18 = getelementptr inbounds %t.RenderEncoderState, ptr %field.base.18, i32 0, i32 8
  %r18 = ptrtoint ptr %field.ptr.18 to i64
  %store.ptr.17 = inttoptr i64 %r18 to ptr
  %store.cast.17 = trunc i64 %r17 to i32
  store i32 %store.cast.17, ptr %store.ptr.17
  %r19 = add i1 0, 0
  %field.base.20 = inttoptr i64 %r0 to ptr
  %field.ptr.20 = getelementptr inbounds %t.RenderEncoderState, ptr %field.base.20, i32 0, i32 9
  %r20 = ptrtoint ptr %field.ptr.20 to i64
  %store.ptr.19 = inttoptr i64 %r20 to ptr
  %store.bool.19 = zext i1 %r19 to i8
  store i8 %store.bool.19, ptr %store.ptr.19
  %r21 = add i64 0, 0
  %field.base.22 = inttoptr i64 %r0 to ptr
  %field.ptr.22 = getelementptr inbounds %t.RenderEncoderState, ptr %field.base.22, i32 0, i32 10
  %r22 = ptrtoint ptr %field.ptr.22 to i64
  %store.ptr.21 = inttoptr i64 %r22 to ptr
  %store.cast.21 = trunc i64 %r21 to i32
  store i32 %store.cast.21, ptr %store.ptr.21
  %r23 = add i1 0, 0
  %field.base.24 = inttoptr i64 %r0 to ptr
  %field.ptr.24 = getelementptr inbounds %t.RenderEncoderState, ptr %field.base.24, i32 0, i32 11
  %r24 = ptrtoint ptr %field.ptr.24 to i64
  %store.ptr.23 = inttoptr i64 %r24 to ptr
  %store.bool.23 = zext i1 %r23 to i8
  store i8 %store.bool.23, ptr %store.ptr.23
  %r25 = add i64 0, 0
  %field.base.26 = inttoptr i64 %r0 to ptr
  %field.ptr.26 = getelementptr inbounds %t.RenderEncoderState, ptr %field.base.26, i32 0, i32 12
  %r26 = ptrtoint ptr %field.ptr.26 to i64
  %store.ptr.25 = inttoptr i64 %r26 to ptr
  %store.cast.25 = trunc i64 %r25 to i32
  store i32 %store.cast.25, ptr %store.ptr.25
  %r27 = add i1 0, 0
  %field.base.28 = inttoptr i64 %r0 to ptr
  %field.ptr.28 = getelementptr inbounds %t.RenderEncoderState, ptr %field.base.28, i32 0, i32 13
  %r28 = ptrtoint ptr %field.ptr.28 to i64
  %store.ptr.27 = inttoptr i64 %r28 to ptr
  %store.bool.27 = zext i1 %r27 to i8
  store i8 %store.bool.27, ptr %store.ptr.27
  %r29 = add i64 0, 0
  %field.base.30 = inttoptr i64 %r0 to ptr
  %field.ptr.30 = getelementptr inbounds %t.RenderEncoderState, ptr %field.base.30, i32 0, i32 14
  %r30 = ptrtoint ptr %field.ptr.30 to i64
  %store.ptr.29 = inttoptr i64 %r30 to ptr
  %store.cast.29 = trunc i64 %r29 to i32
  store i32 %store.cast.29, ptr %store.ptr.29
  %r31 = add i1 0, 0
  %field.base.32 = inttoptr i64 %r0 to ptr
  %field.ptr.32 = getelementptr inbounds %t.RenderEncoderState, ptr %field.base.32, i32 0, i32 15
  %r32 = ptrtoint ptr %field.ptr.32 to i64
  %store.ptr.31 = inttoptr i64 %r32 to ptr
  %store.bool.31 = zext i1 %r31 to i8
  store i8 %store.bool.31, ptr %store.ptr.31
  %r33 = add i64 0, 0
  %field.base.34 = inttoptr i64 %r0 to ptr
  %field.ptr.34 = getelementptr inbounds %t.RenderEncoderState, ptr %field.base.34, i32 0, i32 16
  %r34 = ptrtoint ptr %field.ptr.34 to i64
  %store.ptr.33 = inttoptr i64 %r34 to ptr
  store i64 %r33, ptr %store.ptr.33
  %r35 = add i64 0, 0
  %field.base.36 = inttoptr i64 %r0 to ptr
  %field.ptr.36 = getelementptr inbounds %t.RenderEncoderState, ptr %field.base.36, i32 0, i32 17
  %r36 = ptrtoint ptr %field.ptr.36 to i64
  %store.ptr.35 = inttoptr i64 %r36 to ptr
  store i64 %r35, ptr %store.ptr.35
  %r37 = add i64 0, 1
  %field.base.38 = inttoptr i64 %r0 to ptr
  %field.ptr.38 = getelementptr inbounds %t.RenderEncoderState, ptr %field.base.38, i32 0, i32 18
  %r38 = ptrtoint ptr %field.ptr.38 to i64
  %store.ptr.37 = inttoptr i64 %r38 to ptr
  store i64 %r37, ptr %store.ptr.37
  %native.state.size.ptr.39 = getelementptr [19 x %kira.bridge.value], ptr null, i32 1
  %native.state.size.39 = ptrtoint ptr %native.state.size.ptr.39 to i64
  %native.state.box.39 = call ptr @"kira_native_state_alloc"(i64 8245922201398611848, i64 %native.state.size.39)
  %native.state.payload.39 = call ptr @"kira_native_state_payload"(ptr %native.state.box.39)
  %native.state.src.39 = inttoptr i64 %r0 to ptr
  %native.state.src.field.ptr.39.0 = getelementptr inbounds %t.RenderEncoderState, ptr %native.state.src.39, i32 0, i32 0
  %native.state.slot.ptr.39.0 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.39, i64 0
  %native.state.pack.39.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.load.int.39.0 = load i32, ptr %native.state.src.field.ptr.39.0
  %native.state.load.int.ext.39.0 = sext i32 %native.state.load.int.39.0 to i64
  %native.state.pack.39.0 = insertvalue %kira.bridge.value %native.state.pack.39.0.0, i64 %native.state.load.int.ext.39.0, 2
  store %kira.bridge.value %native.state.pack.39.0, ptr %native.state.slot.ptr.39.0
  %native.state.src.field.ptr.39.1 = getelementptr inbounds %t.RenderEncoderState, ptr %native.state.src.39, i32 0, i32 1
  %native.state.slot.ptr.39.1 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.39, i64 1
  %native.state.pack.39.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 4, 0
  %native.state.load.bool.39.1 = load i8, ptr %native.state.src.field.ptr.39.1
  %native.state.load.bool.word.39.1 = zext i8 %native.state.load.bool.39.1 to i64
  %native.state.pack.39.1 = insertvalue %kira.bridge.value %native.state.pack.39.1.0, i64 %native.state.load.bool.word.39.1, 2
  store %kira.bridge.value %native.state.pack.39.1, ptr %native.state.slot.ptr.39.1
  %native.state.src.field.ptr.39.2 = getelementptr inbounds %t.RenderEncoderState, ptr %native.state.src.39, i32 0, i32 2
  %native.state.slot.ptr.39.2 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.39, i64 2
  %native.state.pack.39.2.0 = insertvalue %kira.bridge.value zeroinitializer, i8 4, 0
  %native.state.load.bool.39.2 = load i8, ptr %native.state.src.field.ptr.39.2
  %native.state.load.bool.word.39.2 = zext i8 %native.state.load.bool.39.2 to i64
  %native.state.pack.39.2 = insertvalue %kira.bridge.value %native.state.pack.39.2.0, i64 %native.state.load.bool.word.39.2, 2
  store %kira.bridge.value %native.state.pack.39.2, ptr %native.state.slot.ptr.39.2
  %native.state.src.field.ptr.39.3 = getelementptr inbounds %t.RenderEncoderState, ptr %native.state.src.39, i32 0, i32 3
  %native.state.slot.ptr.39.3 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.39, i64 3
  %native.state.pack.39.3.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.load.int.39.3 = load i32, ptr %native.state.src.field.ptr.39.3
  %native.state.load.int.ext.39.3 = sext i32 %native.state.load.int.39.3 to i64
  %native.state.pack.39.3 = insertvalue %kira.bridge.value %native.state.pack.39.3.0, i64 %native.state.load.int.ext.39.3, 2
  store %kira.bridge.value %native.state.pack.39.3, ptr %native.state.slot.ptr.39.3
  %native.state.src.field.ptr.39.4 = getelementptr inbounds %t.RenderEncoderState, ptr %native.state.src.39, i32 0, i32 4
  %native.state.slot.ptr.39.4 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.39, i64 4
  %native.state.pack.39.4.0 = insertvalue %kira.bridge.value zeroinitializer, i8 4, 0
  %native.state.load.bool.39.4 = load i8, ptr %native.state.src.field.ptr.39.4
  %native.state.load.bool.word.39.4 = zext i8 %native.state.load.bool.39.4 to i64
  %native.state.pack.39.4 = insertvalue %kira.bridge.value %native.state.pack.39.4.0, i64 %native.state.load.bool.word.39.4, 2
  store %kira.bridge.value %native.state.pack.39.4, ptr %native.state.slot.ptr.39.4
  %native.state.src.field.ptr.39.5 = getelementptr inbounds %t.RenderEncoderState, ptr %native.state.src.39, i32 0, i32 5
  %native.state.slot.ptr.39.5 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.39, i64 5
  %native.state.pack.39.5.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.load.int.39.5 = load i32, ptr %native.state.src.field.ptr.39.5
  %native.state.load.int.ext.39.5 = sext i32 %native.state.load.int.39.5 to i64
  %native.state.pack.39.5 = insertvalue %kira.bridge.value %native.state.pack.39.5.0, i64 %native.state.load.int.ext.39.5, 2
  store %kira.bridge.value %native.state.pack.39.5, ptr %native.state.slot.ptr.39.5
  %native.state.src.field.ptr.39.6 = getelementptr inbounds %t.RenderEncoderState, ptr %native.state.src.39, i32 0, i32 6
  %native.state.slot.ptr.39.6 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.39, i64 6
  %native.state.pack.39.6.0 = insertvalue %kira.bridge.value zeroinitializer, i8 4, 0
  %native.state.load.bool.39.6 = load i8, ptr %native.state.src.field.ptr.39.6
  %native.state.load.bool.word.39.6 = zext i8 %native.state.load.bool.39.6 to i64
  %native.state.pack.39.6 = insertvalue %kira.bridge.value %native.state.pack.39.6.0, i64 %native.state.load.bool.word.39.6, 2
  store %kira.bridge.value %native.state.pack.39.6, ptr %native.state.slot.ptr.39.6
  %native.state.src.field.ptr.39.7 = getelementptr inbounds %t.RenderEncoderState, ptr %native.state.src.39, i32 0, i32 7
  %native.state.slot.ptr.39.7 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.39, i64 7
  %native.state.pack.39.7.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.load.int.39.7 = load i64, ptr %native.state.src.field.ptr.39.7
  %native.state.pack.39.7 = insertvalue %kira.bridge.value %native.state.pack.39.7.0, i64 %native.state.load.int.39.7, 2
  store %kira.bridge.value %native.state.pack.39.7, ptr %native.state.slot.ptr.39.7
  %native.state.src.field.ptr.39.8 = getelementptr inbounds %t.RenderEncoderState, ptr %native.state.src.39, i32 0, i32 8
  %native.state.slot.ptr.39.8 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.39, i64 8
  %native.state.pack.39.8.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.load.int.39.8 = load i32, ptr %native.state.src.field.ptr.39.8
  %native.state.load.int.ext.39.8 = sext i32 %native.state.load.int.39.8 to i64
  %native.state.pack.39.8 = insertvalue %kira.bridge.value %native.state.pack.39.8.0, i64 %native.state.load.int.ext.39.8, 2
  store %kira.bridge.value %native.state.pack.39.8, ptr %native.state.slot.ptr.39.8
  %native.state.src.field.ptr.39.9 = getelementptr inbounds %t.RenderEncoderState, ptr %native.state.src.39, i32 0, i32 9
  %native.state.slot.ptr.39.9 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.39, i64 9
  %native.state.pack.39.9.0 = insertvalue %kira.bridge.value zeroinitializer, i8 4, 0
  %native.state.load.bool.39.9 = load i8, ptr %native.state.src.field.ptr.39.9
  %native.state.load.bool.word.39.9 = zext i8 %native.state.load.bool.39.9 to i64
  %native.state.pack.39.9 = insertvalue %kira.bridge.value %native.state.pack.39.9.0, i64 %native.state.load.bool.word.39.9, 2
  store %kira.bridge.value %native.state.pack.39.9, ptr %native.state.slot.ptr.39.9
  %native.state.src.field.ptr.39.10 = getelementptr inbounds %t.RenderEncoderState, ptr %native.state.src.39, i32 0, i32 10
  %native.state.slot.ptr.39.10 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.39, i64 10
  %native.state.pack.39.10.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.load.int.39.10 = load i32, ptr %native.state.src.field.ptr.39.10
  %native.state.load.int.ext.39.10 = sext i32 %native.state.load.int.39.10 to i64
  %native.state.pack.39.10 = insertvalue %kira.bridge.value %native.state.pack.39.10.0, i64 %native.state.load.int.ext.39.10, 2
  store %kira.bridge.value %native.state.pack.39.10, ptr %native.state.slot.ptr.39.10
  %native.state.src.field.ptr.39.11 = getelementptr inbounds %t.RenderEncoderState, ptr %native.state.src.39, i32 0, i32 11
  %native.state.slot.ptr.39.11 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.39, i64 11
  %native.state.pack.39.11.0 = insertvalue %kira.bridge.value zeroinitializer, i8 4, 0
  %native.state.load.bool.39.11 = load i8, ptr %native.state.src.field.ptr.39.11
  %native.state.load.bool.word.39.11 = zext i8 %native.state.load.bool.39.11 to i64
  %native.state.pack.39.11 = insertvalue %kira.bridge.value %native.state.pack.39.11.0, i64 %native.state.load.bool.word.39.11, 2
  store %kira.bridge.value %native.state.pack.39.11, ptr %native.state.slot.ptr.39.11
  %native.state.src.field.ptr.39.12 = getelementptr inbounds %t.RenderEncoderState, ptr %native.state.src.39, i32 0, i32 12
  %native.state.slot.ptr.39.12 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.39, i64 12
  %native.state.pack.39.12.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.load.int.39.12 = load i32, ptr %native.state.src.field.ptr.39.12
  %native.state.load.int.ext.39.12 = sext i32 %native.state.load.int.39.12 to i64
  %native.state.pack.39.12 = insertvalue %kira.bridge.value %native.state.pack.39.12.0, i64 %native.state.load.int.ext.39.12, 2
  store %kira.bridge.value %native.state.pack.39.12, ptr %native.state.slot.ptr.39.12
  %native.state.src.field.ptr.39.13 = getelementptr inbounds %t.RenderEncoderState, ptr %native.state.src.39, i32 0, i32 13
  %native.state.slot.ptr.39.13 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.39, i64 13
  %native.state.pack.39.13.0 = insertvalue %kira.bridge.value zeroinitializer, i8 4, 0
  %native.state.load.bool.39.13 = load i8, ptr %native.state.src.field.ptr.39.13
  %native.state.load.bool.word.39.13 = zext i8 %native.state.load.bool.39.13 to i64
  %native.state.pack.39.13 = insertvalue %kira.bridge.value %native.state.pack.39.13.0, i64 %native.state.load.bool.word.39.13, 2
  store %kira.bridge.value %native.state.pack.39.13, ptr %native.state.slot.ptr.39.13
  %native.state.src.field.ptr.39.14 = getelementptr inbounds %t.RenderEncoderState, ptr %native.state.src.39, i32 0, i32 14
  %native.state.slot.ptr.39.14 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.39, i64 14
  %native.state.pack.39.14.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.load.int.39.14 = load i32, ptr %native.state.src.field.ptr.39.14
  %native.state.load.int.ext.39.14 = sext i32 %native.state.load.int.39.14 to i64
  %native.state.pack.39.14 = insertvalue %kira.bridge.value %native.state.pack.39.14.0, i64 %native.state.load.int.ext.39.14, 2
  store %kira.bridge.value %native.state.pack.39.14, ptr %native.state.slot.ptr.39.14
  %native.state.src.field.ptr.39.15 = getelementptr inbounds %t.RenderEncoderState, ptr %native.state.src.39, i32 0, i32 15
  %native.state.slot.ptr.39.15 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.39, i64 15
  %native.state.pack.39.15.0 = insertvalue %kira.bridge.value zeroinitializer, i8 4, 0
  %native.state.load.bool.39.15 = load i8, ptr %native.state.src.field.ptr.39.15
  %native.state.load.bool.word.39.15 = zext i8 %native.state.load.bool.39.15 to i64
  %native.state.pack.39.15 = insertvalue %kira.bridge.value %native.state.pack.39.15.0, i64 %native.state.load.bool.word.39.15, 2
  store %kira.bridge.value %native.state.pack.39.15, ptr %native.state.slot.ptr.39.15
  %native.state.src.field.ptr.39.16 = getelementptr inbounds %t.RenderEncoderState, ptr %native.state.src.39, i32 0, i32 16
  %native.state.slot.ptr.39.16 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.39, i64 16
  %native.state.pack.39.16.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.load.int.39.16 = load i64, ptr %native.state.src.field.ptr.39.16
  %native.state.pack.39.16 = insertvalue %kira.bridge.value %native.state.pack.39.16.0, i64 %native.state.load.int.39.16, 2
  store %kira.bridge.value %native.state.pack.39.16, ptr %native.state.slot.ptr.39.16
  %native.state.src.field.ptr.39.17 = getelementptr inbounds %t.RenderEncoderState, ptr %native.state.src.39, i32 0, i32 17
  %native.state.slot.ptr.39.17 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.39, i64 17
  %native.state.pack.39.17.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.load.int.39.17 = load i64, ptr %native.state.src.field.ptr.39.17
  %native.state.pack.39.17 = insertvalue %kira.bridge.value %native.state.pack.39.17.0, i64 %native.state.load.int.39.17, 2
  store %kira.bridge.value %native.state.pack.39.17, ptr %native.state.slot.ptr.39.17
  %native.state.src.field.ptr.39.18 = getelementptr inbounds %t.RenderEncoderState, ptr %native.state.src.39, i32 0, i32 18
  %native.state.slot.ptr.39.18 = getelementptr inbounds %kira.bridge.value, ptr %native.state.payload.39, i64 18
  %native.state.pack.39.18.0 = insertvalue %kira.bridge.value zeroinitializer, i8 1, 0
  %native.state.load.int.39.18 = load i64, ptr %native.state.src.field.ptr.39.18
  %native.state.pack.39.18 = insertvalue %kira.bridge.value %native.state.pack.39.18.0, i64 %native.state.load.int.39.18, 2
  store %kira.bridge.value %native.state.pack.39.18, ptr %native.state.slot.ptr.39.18
  %r39 = ptrtoint ptr %native.state.box.39 to i64
  store i64 %r39, ptr %local1
  %alloc.size.ptr.40 = getelementptr %t.RenderEncoder, ptr null, i32 1
  %alloc.size.40 = ptrtoint ptr %alloc.size.ptr.40 to i64
  %alloc.empty.40 = icmp eq i64 %alloc.size.40, 0
  %alloc.bytes.40 = select i1 %alloc.empty.40, i64 1, i64 %alloc.size.40
  %alloc.ptr.40 = call ptr @malloc(i64 %alloc.bytes.40)
  store %t.RenderEncoder zeroinitializer, ptr %alloc.ptr.40
  %r40 = ptrtoint ptr %alloc.ptr.40 to i64
  store ptr %alloc.ptr.40, ptr %cleanup.heap.slot.40
  %r41 = load i64, ptr %local1
  %field.base.42 = inttoptr i64 %r40 to ptr
  %field.ptr.42 = getelementptr inbounds %t.RenderEncoder, ptr %field.base.42, i32 0, i32 0
  %r42 = ptrtoint ptr %field.ptr.42 to i64
  %store.ptr.41 = inttoptr i64 %r42 to ptr
  %store.rawptr.41 = inttoptr i64 %r41 to ptr
  store ptr %store.rawptr.41, ptr %store.ptr.41
  %cleanup.heap.ptr.0 = load ptr, ptr %cleanup.heap.slot.0
  call void @free(ptr %cleanup.heap.ptr.0)
  ret i64 %r40
}

define i64 @"kira_fn_178_emptyGraphicsShader"() {
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

define i64 @"kira_fn_179_emptyGraphicsTexture"() {
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

define i64 @"kira_fn_181_sokolCreateUniformId"(%kira.string %arg0, i64 %arg1) {
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

define void @"kira_fn_182_updateGraphicsUniform"(i64 %arg0, i64 %arg1) {
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

define void @"kira_fn_183_sokolDestroyUniformId"(i64 %arg0) {
entry:
  %local0 = alloca i64
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %call.arg.24.0 = trunc i64 %r0 to i32
  call void @"kg_destroy_uniform_id"(i32 %call.arg.24.0)
  ret void
}

define i64 @"kira_fn_184_sokolCreateBindGroupId"(%kira.string %arg0) {
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

define void @"kira_fn_185_sokolSetBindGroupUniform"(i64 %arg0, i64 %arg1, i64 %arg2, i64 %arg3) {
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

define void @"kira_fn_186_sokolDestroyBindGroupId"(i64 %arg0) {
entry:
  %local0 = alloca i64
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %call.arg.27.0 = trunc i64 %r0 to i32
  call void @"kg_destroy_bind_group_id"(i32 %call.arg.27.0)
  ret void
}

define i64 @"kira_fn_187_emptyRenderTarget"() {
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
  %r1 = call i64 @"kira_fn_127_renderTargetKindSwapchain"()
  %field.base.2 = inttoptr i64 %r0 to ptr
  %field.ptr.2 = getelementptr inbounds %t.RenderTarget, ptr %field.base.2, i32 0, i32 0
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %store.ptr.1 = inttoptr i64 %r2 to ptr
  store i64 %r1, ptr %store.ptr.1
  %r3 = call i64 @"kira_fn_179_emptyGraphicsTexture"()
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

define i64 @"kira_fn_188_emptyDepthAttachment"() {
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
  %r1 = call i64 @"kira_fn_179_emptyGraphicsTexture"()
  %cleanup.call.ptr.1 = inttoptr i64 %r1 to ptr
  store ptr %cleanup.call.ptr.1, ptr %cleanup.heap.slot.1
  %field.base.2 = inttoptr i64 %r0 to ptr
  %field.ptr.2 = getelementptr inbounds %t.DepthAttachment, ptr %field.base.2, i32 0, i32 0
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %copy.dst.2 = inttoptr i64 %r2 to ptr
  %copy.src.1 = inttoptr i64 %r1 to ptr
  %copy.val.2 = load %t.GraphicsTexture, ptr %copy.src.1
  store %t.GraphicsTexture %copy.val.2, ptr %copy.dst.2
  %r3 = call i64 @"kira_fn_122_loadActionClear"()
  %field.base.4 = inttoptr i64 %r0 to ptr
  %field.ptr.4 = getelementptr inbounds %t.DepthAttachment, ptr %field.base.4, i32 0, i32 1
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %store.ptr.3 = inttoptr i64 %r4 to ptr
  store i64 %r3, ptr %store.ptr.3
  %r5 = call i64 @"kira_fn_125_storeActionStore"()
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

define i64 @"kira_fn_190_emptyStencilAttachment"() {
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
  %r1 = call i64 @"kira_fn_179_emptyGraphicsTexture"()
  %cleanup.call.ptr.1 = inttoptr i64 %r1 to ptr
  store ptr %cleanup.call.ptr.1, ptr %cleanup.heap.slot.1
  %field.base.2 = inttoptr i64 %r0 to ptr
  %field.ptr.2 = getelementptr inbounds %t.StencilAttachment, ptr %field.base.2, i32 0, i32 0
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %copy.dst.2 = inttoptr i64 %r2 to ptr
  %copy.src.1 = inttoptr i64 %r1 to ptr
  %copy.val.2 = load %t.GraphicsTexture, ptr %copy.src.1
  store %t.GraphicsTexture %copy.val.2, ptr %copy.dst.2
  %r3 = call i64 @"kira_fn_122_loadActionClear"()
  %field.base.4 = inttoptr i64 %r0 to ptr
  %field.ptr.4 = getelementptr inbounds %t.StencilAttachment, ptr %field.base.4, i32 0, i32 1
  %r4 = ptrtoint ptr %field.ptr.4 to i64
  %store.ptr.3 = inttoptr i64 %r4 to ptr
  store i64 %r3, ptr %store.ptr.3
  %r5 = call i64 @"kira_fn_125_storeActionStore"()
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

define i64 @"kira_fn_191_swapchainRenderTarget"() {
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
  %r1 = call i64 @"kira_fn_127_renderTargetKindSwapchain"()
  %field.base.2 = inttoptr i64 %r0 to ptr
  %field.ptr.2 = getelementptr inbounds %t.RenderTarget, ptr %field.base.2, i32 0, i32 0
  %r2 = ptrtoint ptr %field.ptr.2 to i64
  %store.ptr.1 = inttoptr i64 %r2 to ptr
  store i64 %r1, ptr %store.ptr.1
  %r3 = call i64 @"kira_fn_179_emptyGraphicsTexture"()
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

define i64 @"kira_fn_192_clearSwapchainRenderPass"(i64 %arg0) {
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
  %r1 = load %kira.string, ptr @kira_str_14
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
  %r7 = call i64 @"kira_fn_191_swapchainRenderTarget"()
  %cleanup.call.ptr.7 = inttoptr i64 %r7 to ptr
  store ptr %cleanup.call.ptr.7, ptr %cleanup.heap.slot.7
  %field.base.8 = inttoptr i64 %r6 to ptr
  %field.ptr.8 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.8, i32 0, i32 0
  %r8 = ptrtoint ptr %field.ptr.8 to i64
  %copy.dst.8 = inttoptr i64 %r8 to ptr
  %copy.src.7 = inttoptr i64 %r7 to ptr
  %copy.val.8 = load %t.RenderTarget, ptr %copy.src.7
  store %t.RenderTarget %copy.val.8, ptr %copy.dst.8
  %r9 = call i64 @"kira_fn_122_loadActionClear"()
  %field.base.10 = inttoptr i64 %r6 to ptr
  %field.ptr.10 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.10, i32 0, i32 1
  %r10 = ptrtoint ptr %field.ptr.10 to i64
  %store.ptr.9 = inttoptr i64 %r10 to ptr
  store i64 %r9, ptr %store.ptr.9
  %r11 = call i64 @"kira_fn_125_storeActionStore"()
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
  %r15 = call i64 @"kira_fn_187_emptyRenderTarget"()
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
  %r21 = call i64 @"kira_fn_191_swapchainRenderTarget"()
  %cleanup.call.ptr.21 = inttoptr i64 %r21 to ptr
  store ptr %cleanup.call.ptr.21, ptr %cleanup.heap.slot.21
  %field.base.22 = inttoptr i64 %r20 to ptr
  %field.ptr.22 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.22, i32 0, i32 0
  %r22 = ptrtoint ptr %field.ptr.22 to i64
  %copy.dst.22 = inttoptr i64 %r22 to ptr
  %copy.src.21 = inttoptr i64 %r21 to ptr
  %copy.val.22 = load %t.RenderTarget, ptr %copy.src.21
  store %t.RenderTarget %copy.val.22, ptr %copy.dst.22
  %r23 = call i64 @"kira_fn_122_loadActionClear"()
  %field.base.24 = inttoptr i64 %r20 to ptr
  %field.ptr.24 = getelementptr inbounds %t.ColorAttachment, ptr %field.base.24, i32 0, i32 1
  %r24 = ptrtoint ptr %field.ptr.24 to i64
  %store.ptr.23 = inttoptr i64 %r24 to ptr
  store i64 %r23, ptr %store.ptr.23
  %r25 = call i64 @"kira_fn_125_storeActionStore"()
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
  %r29 = call i64 @"kira_fn_187_emptyRenderTarget"()
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
  %r36 = call i64 @"kira_fn_188_emptyDepthAttachment"()
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
  %r40 = call i64 @"kira_fn_190_emptyStencilAttachment"()
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

define void @"kira_fn_445_main$callback_445"(i64 %arg0) {
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
  %cleanup.heap.slot.43 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.43
  %cleanup.heap.slot.57 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.57
  %cleanup.heap.slot.60 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.60
  %cleanup.heap.slot.67 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.67
  %cleanup.heap.slot.77 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.77
  %cleanup.heap.slot.83 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.83
  %cleanup.heap.slot.87 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.87
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.Graphics, ptr %field.base.1, i32 0, i32 0
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.rawptr.2 = load ptr, ptr %load.ptr.2
  %r2 = ptrtoint ptr %load.rawptr.2 to i64
  %native.recover.state.3 = inttoptr i64 %r2 to ptr
  %native.recover.payload.3 = call ptr @"kira_native_state_recover"(ptr %native.recover.state.3, i64 8458404067835574923)
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
  %r6 = load %kira.string, ptr @kira_str_15
  %field.base.7 = inttoptr i64 %r5 to ptr
  %field.ptr.7 = getelementptr inbounds %t.ShaderDescriptor, ptr %field.base.7, i32 0, i32 0
  %r7 = ptrtoint ptr %field.ptr.7 to i64
  %store.ptr.6 = inttoptr i64 %r7 to ptr
  store %kira.string %r6, ptr %store.ptr.6
  %r8 = call %kira.string @"kira_fn_0_frameTriangleVertexSource"()
  %field.base.9 = inttoptr i64 %r5 to ptr
  %field.ptr.9 = getelementptr inbounds %t.ShaderDescriptor, ptr %field.base.9, i32 0, i32 1
  %r9 = ptrtoint ptr %field.ptr.9 to i64
  %store.ptr.8 = inttoptr i64 %r9 to ptr
  store %kira.string %r8, ptr %store.ptr.8
  %r10 = call %kira.string @"kira_fn_1_frameTriangleFragmentSource"()
  %field.base.11 = inttoptr i64 %r5 to ptr
  %field.ptr.11 = getelementptr inbounds %t.ShaderDescriptor, ptr %field.base.11, i32 0, i32 2
  %r11 = ptrtoint ptr %field.ptr.11 to i64
  %store.ptr.10 = inttoptr i64 %r11 to ptr
  store %kira.string %r10, ptr %store.ptr.10
  %r12 = load %kira.string, ptr @kira_str_16
  %field.base.13 = inttoptr i64 %r5 to ptr
  %field.ptr.13 = getelementptr inbounds %t.ShaderDescriptor, ptr %field.base.13, i32 0, i32 3
  %r13 = ptrtoint ptr %field.ptr.13 to i64
  %store.ptr.12 = inttoptr i64 %r13 to ptr
  store %kira.string %r12, ptr %store.ptr.12
  %r14 = load %kira.string, ptr @kira_str_17
  %field.base.15 = inttoptr i64 %r5 to ptr
  %field.ptr.15 = getelementptr inbounds %t.ShaderDescriptor, ptr %field.base.15, i32 0, i32 4
  %r15 = ptrtoint ptr %field.ptr.15 to i64
  %store.ptr.14 = inttoptr i64 %r15 to ptr
  store %kira.string %r14, ptr %store.ptr.14
  %r16 = call i64 @"kira_fn_412_Graphics.createShader"(i64 %r4, i64 %r5)
  %cleanup.call.ptr.16 = inttoptr i64 %r16 to ptr
  store ptr %cleanup.call.ptr.16, ptr %cleanup.heap.slot.16
  %r17 = load i64, ptr %local1
  %native.state.set.ptr.16 = inttoptr i64 %r17 to ptr
  %native.state.set.slot.16 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.16, i64 0
  %native.state.set.pack.0.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %native.state.set.struct.src.0 = inttoptr i64 %r16 to ptr
  %native.state.set.struct.value.0 = load %t.GraphicsShader, ptr %native.state.set.struct.src.0
  %native.state.set.struct.size.ptr.0 = getelementptr %t.GraphicsShader, ptr null, i32 1
  %native.state.set.struct.size.0 = ptrtoint ptr %native.state.set.struct.size.ptr.0 to i64
  %native.state.set.struct.copy.0 = call ptr @malloc(i64 %native.state.set.struct.size.0)
  store %t.GraphicsShader %native.state.set.struct.value.0, ptr %native.state.set.struct.copy.0
  %native.state.set.struct.ptrint.0 = ptrtoint ptr %native.state.set.struct.copy.0 to i64
  %native.state.set.pack.0 = insertvalue %kira.bridge.value %native.state.set.pack.0.0, i64 %native.state.set.struct.ptrint.0, 2
  store %kira.bridge.value %native.state.set.pack.0, ptr %native.state.set.slot.16
  %r18 = load i64, ptr %local0
  %alloc.size.ptr.19 = getelementptr %t.BufferDescriptor, ptr null, i32 1
  %alloc.size.19 = ptrtoint ptr %alloc.size.ptr.19 to i64
  %alloc.empty.19 = icmp eq i64 %alloc.size.19, 0
  %alloc.bytes.19 = select i1 %alloc.empty.19, i64 1, i64 %alloc.size.19
  %alloc.ptr.19 = call ptr @malloc(i64 %alloc.bytes.19)
  store %t.BufferDescriptor zeroinitializer, ptr %alloc.ptr.19
  %r19 = ptrtoint ptr %alloc.ptr.19 to i64
  store ptr %alloc.ptr.19, ptr %cleanup.heap.slot.19
  %r20 = load %kira.string, ptr @kira_str_18
  %field.base.21 = inttoptr i64 %r19 to ptr
  %field.ptr.21 = getelementptr inbounds %t.BufferDescriptor, ptr %field.base.21, i32 0, i32 0
  %r21 = ptrtoint ptr %field.ptr.21 to i64
  %store.ptr.20 = inttoptr i64 %r21 to ptr
  store %kira.string %r20, ptr %store.ptr.20
  %r22 = call i64 @"kira_fn_89_bufferUsageVertex"()
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
  %r26 = call i64 @"kira_fn_2_frameTriangleVertices"()
  %field.base.27 = inttoptr i64 %r19 to ptr
  %field.ptr.27 = getelementptr inbounds %t.BufferDescriptor, ptr %field.base.27, i32 0, i32 3
  %r27 = ptrtoint ptr %field.ptr.27 to i64
  %store.ptr.26 = inttoptr i64 %r27 to ptr
  %store.arrayptr.26 = inttoptr i64 %r26 to ptr
  store ptr %store.arrayptr.26, ptr %store.ptr.26
  %r28 = call i64 @"kira_fn_418_Graphics.createBuffer"(i64 %r18, i64 %r19)
  %cleanup.call.ptr.28 = inttoptr i64 %r28 to ptr
  store ptr %cleanup.call.ptr.28, ptr %cleanup.heap.slot.28
  %r29 = load i64, ptr %local1
  %native.state.set.ptr.28 = inttoptr i64 %r29 to ptr
  %native.state.set.slot.28 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.28, i64 2
  %native.state.set.pack.1.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %native.state.set.struct.src.1 = inttoptr i64 %r28 to ptr
  %native.state.set.struct.value.1 = load %t.GraphicsBuffer, ptr %native.state.set.struct.src.1
  %native.state.set.struct.size.ptr.1 = getelementptr %t.GraphicsBuffer, ptr null, i32 1
  %native.state.set.struct.size.1 = ptrtoint ptr %native.state.set.struct.size.ptr.1 to i64
  %native.state.set.struct.copy.1 = call ptr @malloc(i64 %native.state.set.struct.size.1)
  store %t.GraphicsBuffer %native.state.set.struct.value.1, ptr %native.state.set.struct.copy.1
  %native.state.set.struct.ptrint.1 = ptrtoint ptr %native.state.set.struct.copy.1 to i64
  %native.state.set.pack.1 = insertvalue %kira.bridge.value %native.state.set.pack.1.0, i64 %native.state.set.struct.ptrint.1, 2
  store %kira.bridge.value %native.state.set.pack.1, ptr %native.state.set.slot.28
  %r30 = load i64, ptr %local0
  %alloc.size.ptr.31 = getelementptr %t.RenderPipelineDescriptor, ptr null, i32 1
  %alloc.size.31 = ptrtoint ptr %alloc.size.ptr.31 to i64
  %alloc.empty.31 = icmp eq i64 %alloc.size.31, 0
  %alloc.bytes.31 = select i1 %alloc.empty.31, i64 1, i64 %alloc.size.31
  %alloc.ptr.31 = call ptr @malloc(i64 %alloc.bytes.31)
  store %t.RenderPipelineDescriptor zeroinitializer, ptr %alloc.ptr.31
  %r31 = ptrtoint ptr %alloc.ptr.31 to i64
  store ptr %alloc.ptr.31, ptr %cleanup.heap.slot.31
  %r32 = load %kira.string, ptr @kira_str_19
  %field.base.33 = inttoptr i64 %r31 to ptr
  %field.ptr.33 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.33, i32 0, i32 0
  %r33 = ptrtoint ptr %field.ptr.33 to i64
  %store.ptr.32 = inttoptr i64 %r33 to ptr
  store %kira.string %r32, ptr %store.ptr.32
  %r34 = load i64, ptr %local1
  %native.state.get.ptr.35 = inttoptr i64 %r34 to ptr
  %native.state.get.slot.35 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.35, i64 0
  %native.state.get.val.2 = load %kira.bridge.value, ptr %native.state.get.slot.35
  %r35 = extractvalue %kira.bridge.value %native.state.get.val.2, 2
  %field.base.36 = inttoptr i64 %r31 to ptr
  %field.ptr.36 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.36, i32 0, i32 1
  %r36 = ptrtoint ptr %field.ptr.36 to i64
  %copy.dst.36 = inttoptr i64 %r36 to ptr
  %copy.src.35 = inttoptr i64 %r35 to ptr
  %copy.val.36 = load %t.GraphicsShader, ptr %copy.src.35
  store %t.GraphicsShader %copy.val.36, ptr %copy.dst.36
  %alloc.size.ptr.37 = getelementptr %t.VertexLayout, ptr null, i32 1
  %alloc.size.37 = ptrtoint ptr %alloc.size.ptr.37 to i64
  %alloc.empty.37 = icmp eq i64 %alloc.size.37, 0
  %alloc.bytes.37 = select i1 %alloc.empty.37, i64 1, i64 %alloc.size.37
  %alloc.ptr.37 = call ptr @malloc(i64 %alloc.bytes.37)
  store %t.VertexLayout zeroinitializer, ptr %alloc.ptr.37
  %r37 = ptrtoint ptr %alloc.ptr.37 to i64
  store ptr %alloc.ptr.37, ptr %cleanup.heap.slot.37
  %r38 = add i64 0, 8
  %field.base.39 = inttoptr i64 %r37 to ptr
  %field.ptr.39 = getelementptr inbounds %t.VertexLayout, ptr %field.base.39, i32 0, i32 0
  %r39 = ptrtoint ptr %field.ptr.39 to i64
  %store.ptr.38 = inttoptr i64 %r39 to ptr
  store i64 %r38, ptr %store.ptr.38
  %r40 = add i64 0, 1
  %alloc.array.ptr.41 = call ptr @"kira_array_alloc"(i64 %r40)
  %r41 = ptrtoint ptr %alloc.array.ptr.41 to i64
  %r42 = add i64 0, 0
  %alloc.size.ptr.43 = getelementptr %t.VertexAttribute, ptr null, i32 1
  %alloc.size.43 = ptrtoint ptr %alloc.size.ptr.43 to i64
  %alloc.empty.43 = icmp eq i64 %alloc.size.43, 0
  %alloc.bytes.43 = select i1 %alloc.empty.43, i64 1, i64 %alloc.size.43
  %alloc.ptr.43 = call ptr @malloc(i64 %alloc.bytes.43)
  store %t.VertexAttribute zeroinitializer, ptr %alloc.ptr.43
  %r43 = ptrtoint ptr %alloc.ptr.43 to i64
  store ptr %alloc.ptr.43, ptr %cleanup.heap.slot.43
  %r44 = load %kira.string, ptr @kira_str_20
  %field.base.45 = inttoptr i64 %r43 to ptr
  %field.ptr.45 = getelementptr inbounds %t.VertexAttribute, ptr %field.base.45, i32 0, i32 0
  %r45 = ptrtoint ptr %field.ptr.45 to i64
  %store.ptr.44 = inttoptr i64 %r45 to ptr
  store %kira.string %r44, ptr %store.ptr.44
  %r46 = add i64 0, 0
  %field.base.47 = inttoptr i64 %r43 to ptr
  %field.ptr.47 = getelementptr inbounds %t.VertexAttribute, ptr %field.base.47, i32 0, i32 1
  %r47 = ptrtoint ptr %field.ptr.47 to i64
  %store.ptr.46 = inttoptr i64 %r47 to ptr
  store i64 %r46, ptr %store.ptr.46
  %r48 = call i64 @"kira_fn_95_vertexFormatFloat2"()
  %field.base.49 = inttoptr i64 %r43 to ptr
  %field.ptr.49 = getelementptr inbounds %t.VertexAttribute, ptr %field.base.49, i32 0, i32 2
  %r49 = ptrtoint ptr %field.ptr.49 to i64
  %store.ptr.48 = inttoptr i64 %r49 to ptr
  store i64 %r48, ptr %store.ptr.48
  %r50 = add i64 0, 0
  %field.base.51 = inttoptr i64 %r43 to ptr
  %field.ptr.51 = getelementptr inbounds %t.VertexAttribute, ptr %field.base.51, i32 0, i32 3
  %r51 = ptrtoint ptr %field.ptr.51 to i64
  %store.ptr.50 = inttoptr i64 %r51 to ptr
  store i64 %r50, ptr %store.ptr.50
  %array.set.ptr.43 = inttoptr i64 %r41 to ptr
  %array.set.pack.3.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %array.set.struct.src.3 = inttoptr i64 %r43 to ptr
  %array.set.struct.value.3 = load %t.VertexAttribute, ptr %array.set.struct.src.3
  %array.set.struct.size.ptr.3 = getelementptr %t.VertexAttribute, ptr null, i32 1
  %array.set.struct.size.3 = ptrtoint ptr %array.set.struct.size.ptr.3 to i64
  %array.set.struct.copy.3 = call ptr @malloc(i64 %array.set.struct.size.3)
  store %t.VertexAttribute %array.set.struct.value.3, ptr %array.set.struct.copy.3
  %array.set.struct.ptrint.3 = ptrtoint ptr %array.set.struct.copy.3 to i64
  %array.set.pack.3 = insertvalue %kira.bridge.value %array.set.pack.3.0, i64 %array.set.struct.ptrint.3, 2
  %array.set.pack.ptr.3 = alloca %kira.bridge.value
  store %kira.bridge.value %array.set.pack.3, ptr %array.set.pack.ptr.3
  call void @"kira_array_store"(ptr %array.set.ptr.43, i64 %r42, ptr %array.set.pack.ptr.3)
  %field.base.52 = inttoptr i64 %r37 to ptr
  %field.ptr.52 = getelementptr inbounds %t.VertexLayout, ptr %field.base.52, i32 0, i32 1
  %r52 = ptrtoint ptr %field.ptr.52 to i64
  %store.ptr.41 = inttoptr i64 %r52 to ptr
  %store.arrayptr.41 = inttoptr i64 %r41 to ptr
  store ptr %store.arrayptr.41, ptr %store.ptr.41
  %field.base.53 = inttoptr i64 %r31 to ptr
  %field.ptr.53 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.53, i32 0, i32 2
  %r53 = ptrtoint ptr %field.ptr.53 to i64
  %copy.dst.53 = inttoptr i64 %r53 to ptr
  %copy.src.37 = inttoptr i64 %r37 to ptr
  %copy.val.53 = load %t.VertexLayout, ptr %copy.src.37
  store %t.VertexLayout %copy.val.53, ptr %copy.dst.53
  %r54 = add i64 0, 1
  %alloc.array.ptr.55 = call ptr @"kira_array_alloc"(i64 %r54)
  %r55 = ptrtoint ptr %alloc.array.ptr.55 to i64
  %r56 = add i64 0, 0
  %alloc.size.ptr.57 = getelementptr %t.ColorTargetDescriptor, ptr null, i32 1
  %alloc.size.57 = ptrtoint ptr %alloc.size.ptr.57 to i64
  %alloc.empty.57 = icmp eq i64 %alloc.size.57, 0
  %alloc.bytes.57 = select i1 %alloc.empty.57, i64 1, i64 %alloc.size.57
  %alloc.ptr.57 = call ptr @malloc(i64 %alloc.bytes.57)
  store %t.ColorTargetDescriptor zeroinitializer, ptr %alloc.ptr.57
  %r57 = ptrtoint ptr %alloc.ptr.57 to i64
  store ptr %alloc.ptr.57, ptr %cleanup.heap.slot.57
  %r58 = call i64 @"kira_fn_98_textureFormatRgba8Unorm"()
  %field.base.59 = inttoptr i64 %r57 to ptr
  %field.ptr.59 = getelementptr inbounds %t.ColorTargetDescriptor, ptr %field.base.59, i32 0, i32 0
  %r59 = ptrtoint ptr %field.ptr.59 to i64
  %store.ptr.58 = inttoptr i64 %r59 to ptr
  store i64 %r58, ptr %store.ptr.58
  %alloc.size.ptr.60 = getelementptr %t.BlendState, ptr null, i32 1
  %alloc.size.60 = ptrtoint ptr %alloc.size.ptr.60 to i64
  %alloc.empty.60 = icmp eq i64 %alloc.size.60, 0
  %alloc.bytes.60 = select i1 %alloc.empty.60, i64 1, i64 %alloc.size.60
  %alloc.ptr.60 = call ptr @malloc(i64 %alloc.bytes.60)
  store %t.BlendState zeroinitializer, ptr %alloc.ptr.60
  %r60 = ptrtoint ptr %alloc.ptr.60 to i64
  store ptr %alloc.ptr.60, ptr %cleanup.heap.slot.60
  %r61 = add i1 0, 0
  %field.base.62 = inttoptr i64 %r60 to ptr
  %field.ptr.62 = getelementptr inbounds %t.BlendState, ptr %field.base.62, i32 0, i32 0
  %r62 = ptrtoint ptr %field.ptr.62 to i64
  %store.ptr.61 = inttoptr i64 %r62 to ptr
  %store.bool.61 = zext i1 %r61 to i8
  store i8 %store.bool.61, ptr %store.ptr.61
  %r63 = call i64 @"kira_fn_104_blendPresetReplace"()
  %field.base.64 = inttoptr i64 %r60 to ptr
  %field.ptr.64 = getelementptr inbounds %t.BlendState, ptr %field.base.64, i32 0, i32 1
  %r64 = ptrtoint ptr %field.ptr.64 to i64
  %store.ptr.63 = inttoptr i64 %r64 to ptr
  store i64 %r63, ptr %store.ptr.63
  %field.base.65 = inttoptr i64 %r57 to ptr
  %field.ptr.65 = getelementptr inbounds %t.ColorTargetDescriptor, ptr %field.base.65, i32 0, i32 1
  %r65 = ptrtoint ptr %field.ptr.65 to i64
  %copy.dst.65 = inttoptr i64 %r65 to ptr
  %copy.src.60 = inttoptr i64 %r60 to ptr
  %copy.val.65 = load %t.BlendState, ptr %copy.src.60
  store %t.BlendState %copy.val.65, ptr %copy.dst.65
  %array.set.ptr.57 = inttoptr i64 %r55 to ptr
  %array.set.pack.4.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %array.set.struct.src.4 = inttoptr i64 %r57 to ptr
  %array.set.struct.value.4 = load %t.ColorTargetDescriptor, ptr %array.set.struct.src.4
  %array.set.struct.size.ptr.4 = getelementptr %t.ColorTargetDescriptor, ptr null, i32 1
  %array.set.struct.size.4 = ptrtoint ptr %array.set.struct.size.ptr.4 to i64
  %array.set.struct.copy.4 = call ptr @malloc(i64 %array.set.struct.size.4)
  store %t.ColorTargetDescriptor %array.set.struct.value.4, ptr %array.set.struct.copy.4
  %array.set.struct.ptrint.4 = ptrtoint ptr %array.set.struct.copy.4 to i64
  %array.set.pack.4 = insertvalue %kira.bridge.value %array.set.pack.4.0, i64 %array.set.struct.ptrint.4, 2
  %array.set.pack.ptr.4 = alloca %kira.bridge.value
  store %kira.bridge.value %array.set.pack.4, ptr %array.set.pack.ptr.4
  call void @"kira_array_store"(ptr %array.set.ptr.57, i64 %r56, ptr %array.set.pack.ptr.4)
  %field.base.66 = inttoptr i64 %r31 to ptr
  %field.ptr.66 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.66, i32 0, i32 3
  %r66 = ptrtoint ptr %field.ptr.66 to i64
  %store.ptr.55 = inttoptr i64 %r66 to ptr
  %store.arrayptr.55 = inttoptr i64 %r55 to ptr
  store ptr %store.arrayptr.55, ptr %store.ptr.55
  %alloc.size.ptr.67 = getelementptr %t.DepthStencilDescriptor, ptr null, i32 1
  %alloc.size.67 = ptrtoint ptr %alloc.size.ptr.67 to i64
  %alloc.empty.67 = icmp eq i64 %alloc.size.67, 0
  %alloc.bytes.67 = select i1 %alloc.empty.67, i64 1, i64 %alloc.size.67
  %alloc.ptr.67 = call ptr @malloc(i64 %alloc.bytes.67)
  store %t.DepthStencilDescriptor zeroinitializer, ptr %alloc.ptr.67
  %r67 = ptrtoint ptr %alloc.ptr.67 to i64
  store ptr %alloc.ptr.67, ptr %cleanup.heap.slot.67
  %r68 = add i1 0, 0
  %field.base.69 = inttoptr i64 %r67 to ptr
  %field.ptr.69 = getelementptr inbounds %t.DepthStencilDescriptor, ptr %field.base.69, i32 0, i32 0
  %r69 = ptrtoint ptr %field.ptr.69 to i64
  %store.ptr.68 = inttoptr i64 %r69 to ptr
  %store.bool.68 = zext i1 %r68 to i8
  store i8 %store.bool.68, ptr %store.ptr.68
  %r70 = add i1 0, 0
  %field.base.71 = inttoptr i64 %r67 to ptr
  %field.ptr.71 = getelementptr inbounds %t.DepthStencilDescriptor, ptr %field.base.71, i32 0, i32 1
  %r71 = ptrtoint ptr %field.ptr.71 to i64
  %store.ptr.70 = inttoptr i64 %r71 to ptr
  %store.bool.70 = zext i1 %r70 to i8
  store i8 %store.bool.70, ptr %store.ptr.70
  %r72 = call i64 @"kira_fn_114_compareFunctionAlways"()
  %field.base.73 = inttoptr i64 %r67 to ptr
  %field.ptr.73 = getelementptr inbounds %t.DepthStencilDescriptor, ptr %field.base.73, i32 0, i32 2
  %r73 = ptrtoint ptr %field.ptr.73 to i64
  %store.ptr.72 = inttoptr i64 %r73 to ptr
  store i64 %r72, ptr %store.ptr.72
  %r74 = call i64 @"kira_fn_100_textureFormatDepth24Stencil8"()
  %field.base.75 = inttoptr i64 %r67 to ptr
  %field.ptr.75 = getelementptr inbounds %t.DepthStencilDescriptor, ptr %field.base.75, i32 0, i32 3
  %r75 = ptrtoint ptr %field.ptr.75 to i64
  %store.ptr.74 = inttoptr i64 %r75 to ptr
  store i64 %r74, ptr %store.ptr.74
  %field.base.76 = inttoptr i64 %r31 to ptr
  %field.ptr.76 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.76, i32 0, i32 4
  %r76 = ptrtoint ptr %field.ptr.76 to i64
  %copy.dst.76 = inttoptr i64 %r76 to ptr
  %copy.src.67 = inttoptr i64 %r67 to ptr
  %copy.val.76 = load %t.DepthStencilDescriptor, ptr %copy.src.67
  store %t.DepthStencilDescriptor %copy.val.76, ptr %copy.dst.76
  %alloc.size.ptr.77 = getelementptr %t.RasterizationDescriptor, ptr null, i32 1
  %alloc.size.77 = ptrtoint ptr %alloc.size.ptr.77 to i64
  %alloc.empty.77 = icmp eq i64 %alloc.size.77, 0
  %alloc.bytes.77 = select i1 %alloc.empty.77, i64 1, i64 %alloc.size.77
  %alloc.ptr.77 = call ptr @malloc(i64 %alloc.bytes.77)
  store %t.RasterizationDescriptor zeroinitializer, ptr %alloc.ptr.77
  %r77 = ptrtoint ptr %alloc.ptr.77 to i64
  store ptr %alloc.ptr.77, ptr %cleanup.heap.slot.77
  %r78 = call i64 @"kira_fn_115_cullModeNone"()
  %field.base.79 = inttoptr i64 %r77 to ptr
  %field.ptr.79 = getelementptr inbounds %t.RasterizationDescriptor, ptr %field.base.79, i32 0, i32 0
  %r79 = ptrtoint ptr %field.ptr.79 to i64
  %store.ptr.78 = inttoptr i64 %r79 to ptr
  store i64 %r78, ptr %store.ptr.78
  %r80 = call i64 @"kira_fn_118_frontFaceCounterClockwise"()
  %field.base.81 = inttoptr i64 %r77 to ptr
  %field.ptr.81 = getelementptr inbounds %t.RasterizationDescriptor, ptr %field.base.81, i32 0, i32 1
  %r81 = ptrtoint ptr %field.ptr.81 to i64
  %store.ptr.80 = inttoptr i64 %r81 to ptr
  store i64 %r80, ptr %store.ptr.80
  %field.base.82 = inttoptr i64 %r31 to ptr
  %field.ptr.82 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.82, i32 0, i32 5
  %r82 = ptrtoint ptr %field.ptr.82 to i64
  %copy.dst.82 = inttoptr i64 %r82 to ptr
  %copy.src.77 = inttoptr i64 %r77 to ptr
  %copy.val.82 = load %t.RasterizationDescriptor, ptr %copy.src.77
  store %t.RasterizationDescriptor %copy.val.82, ptr %copy.dst.82
  %alloc.size.ptr.83 = getelementptr %t.PrimitiveDescriptor, ptr null, i32 1
  %alloc.size.83 = ptrtoint ptr %alloc.size.ptr.83 to i64
  %alloc.empty.83 = icmp eq i64 %alloc.size.83, 0
  %alloc.bytes.83 = select i1 %alloc.empty.83, i64 1, i64 %alloc.size.83
  %alloc.ptr.83 = call ptr @malloc(i64 %alloc.bytes.83)
  store %t.PrimitiveDescriptor zeroinitializer, ptr %alloc.ptr.83
  %r83 = ptrtoint ptr %alloc.ptr.83 to i64
  store ptr %alloc.ptr.83, ptr %cleanup.heap.slot.83
  %r84 = call i64 @"kira_fn_101_primitiveTopologyTriangleList"()
  %field.base.85 = inttoptr i64 %r83 to ptr
  %field.ptr.85 = getelementptr inbounds %t.PrimitiveDescriptor, ptr %field.base.85, i32 0, i32 0
  %r85 = ptrtoint ptr %field.ptr.85 to i64
  %store.ptr.84 = inttoptr i64 %r85 to ptr
  store i64 %r84, ptr %store.ptr.84
  %field.base.86 = inttoptr i64 %r31 to ptr
  %field.ptr.86 = getelementptr inbounds %t.RenderPipelineDescriptor, ptr %field.base.86, i32 0, i32 6
  %r86 = ptrtoint ptr %field.ptr.86 to i64
  %copy.dst.86 = inttoptr i64 %r86 to ptr
  %copy.src.83 = inttoptr i64 %r83 to ptr
  %copy.val.86 = load %t.PrimitiveDescriptor, ptr %copy.src.83
  store %t.PrimitiveDescriptor %copy.val.86, ptr %copy.dst.86
  %r87 = call i64 @"kira_fn_415_Graphics.createRenderPipeline"(i64 %r30, i64 %r31)
  %cleanup.call.ptr.87 = inttoptr i64 %r87 to ptr
  store ptr %cleanup.call.ptr.87, ptr %cleanup.heap.slot.87
  %r88 = load i64, ptr %local1
  %native.state.set.ptr.87 = inttoptr i64 %r88 to ptr
  %native.state.set.slot.87 = getelementptr inbounds %kira.bridge.value, ptr %native.state.set.ptr.87, i64 1
  %native.state.set.pack.5.0 = insertvalue %kira.bridge.value zeroinitializer, i8 5, 0
  %native.state.set.struct.src.5 = inttoptr i64 %r87 to ptr
  %native.state.set.struct.value.5 = load %t.RenderPipeline, ptr %native.state.set.struct.src.5
  %native.state.set.struct.size.ptr.5 = getelementptr %t.RenderPipeline, ptr null, i32 1
  %native.state.set.struct.size.5 = ptrtoint ptr %native.state.set.struct.size.ptr.5 to i64
  %native.state.set.struct.copy.5 = call ptr @malloc(i64 %native.state.set.struct.size.5)
  store %t.RenderPipeline %native.state.set.struct.value.5, ptr %native.state.set.struct.copy.5
  %native.state.set.struct.ptrint.5 = ptrtoint ptr %native.state.set.struct.copy.5 to i64
  %native.state.set.pack.5 = insertvalue %kira.bridge.value %native.state.set.pack.5.0, i64 %native.state.set.struct.ptrint.5, 2
  store %kira.bridge.value %native.state.set.pack.5, ptr %native.state.set.slot.87
  %cleanup.heap.ptr.6 = load ptr, ptr %cleanup.heap.slot.5
  call void @free(ptr %cleanup.heap.ptr.6)
  %cleanup.heap.ptr.7 = load ptr, ptr %cleanup.heap.slot.16
  call void @free(ptr %cleanup.heap.ptr.7)
  %cleanup.heap.ptr.8 = load ptr, ptr %cleanup.heap.slot.19
  call void @free(ptr %cleanup.heap.ptr.8)
  %cleanup.heap.ptr.9 = load ptr, ptr %cleanup.heap.slot.28
  call void @free(ptr %cleanup.heap.ptr.9)
  %cleanup.heap.ptr.10 = load ptr, ptr %cleanup.heap.slot.31
  call void @free(ptr %cleanup.heap.ptr.10)
  %cleanup.heap.ptr.11 = load ptr, ptr %cleanup.heap.slot.37
  call void @free(ptr %cleanup.heap.ptr.11)
  %cleanup.heap.ptr.12 = load ptr, ptr %cleanup.heap.slot.43
  call void @free(ptr %cleanup.heap.ptr.12)
  %cleanup.heap.ptr.13 = load ptr, ptr %cleanup.heap.slot.57
  call void @free(ptr %cleanup.heap.ptr.13)
  %cleanup.heap.ptr.14 = load ptr, ptr %cleanup.heap.slot.60
  call void @free(ptr %cleanup.heap.ptr.14)
  %cleanup.heap.ptr.15 = load ptr, ptr %cleanup.heap.slot.67
  call void @free(ptr %cleanup.heap.ptr.15)
  %cleanup.heap.ptr.16 = load ptr, ptr %cleanup.heap.slot.77
  call void @free(ptr %cleanup.heap.ptr.16)
  %cleanup.heap.ptr.17 = load ptr, ptr %cleanup.heap.slot.83
  call void @free(ptr %cleanup.heap.ptr.17)
  %cleanup.heap.ptr.18 = load ptr, ptr %cleanup.heap.slot.87
  call void @free(ptr %cleanup.heap.ptr.18)
  ret void
}

define void @"kira_fn_446_main$callback_446"(i64 %arg0) {
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
  %local5 = alloca i64
  %local.storage.5 = alloca %t.RenderEncoder
  store %t.RenderEncoder zeroinitializer, ptr %local.storage.5
  %local.storage.int.5 = ptrtoint ptr %local.storage.5 to i64
  store i64 %local.storage.int.5, ptr %local5
  %cleanup.heap.slot.0 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.0
  %cleanup.heap.slot.4 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.4
  %cleanup.heap.slot.13 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.13
  %cleanup.heap.slot.14 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.14
  %cleanup.heap.slot.16 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.16
  %cleanup.heap.slot.17 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.17
  %cleanup.heap.slot.19 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.19
  %cleanup.heap.slot.20 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.20
  %cleanup.heap.slot.21 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.21
  %cleanup.heap.slot.22 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.22
  %cleanup.heap.slot.23 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.23
  %cleanup.heap.slot.24 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.24
  %cleanup.heap.slot.25 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.25
  %cleanup.heap.slot.26 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.26
  %cleanup.heap.slot.27 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.27
  %cleanup.heap.slot.28 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.28
  %cleanup.heap.slot.29 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.29
  %cleanup.heap.slot.31 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.31
  %cleanup.heap.slot.32 = alloca ptr
  store ptr null, ptr %cleanup.heap.slot.32
  store i64 %arg0, ptr %local0
  %r0 = load i64, ptr %local0
  %field.base.1 = inttoptr i64 %r0 to ptr
  %field.ptr.1 = getelementptr inbounds %t.GraphicsFrame, ptr %field.base.1, i32 0, i32 43
  %r1 = ptrtoint ptr %field.ptr.1 to i64
  %load.ptr.2 = inttoptr i64 %r1 to ptr
  %load.rawptr.2 = load ptr, ptr %load.ptr.2
  %r2 = ptrtoint ptr %load.rawptr.2 to i64
  %native.recover.state.3 = inttoptr i64 %r2 to ptr
  %native.recover.payload.3 = call ptr @"kira_native_state_recover"(ptr %native.recover.state.3, i64 8458404067835574923)
  %r3 = ptrtoint ptr %native.recover.payload.3 to i64
  store i64 %r3, ptr %local1
  %alloc.size.ptr.4 = getelementptr %t.Color, ptr null, i32 1
  %alloc.size.4 = ptrtoint ptr %alloc.size.ptr.4 to i64
  %alloc.empty.4 = icmp eq i64 %alloc.size.4, 0
  %alloc.bytes.4 = select i1 %alloc.empty.4, i64 1, i64 %alloc.size.4
  %alloc.ptr.4 = call ptr @malloc(i64 %alloc.bytes.4)
  store %t.Color zeroinitializer, ptr %alloc.ptr.4
  %r4 = ptrtoint ptr %alloc.ptr.4 to i64
  store ptr %alloc.ptr.4, ptr %cleanup.heap.slot.4
  %r5 = fadd double 0.0, 0.05
  %field.base.6 = inttoptr i64 %r4 to ptr
  %field.ptr.6 = getelementptr inbounds %t.Color, ptr %field.base.6, i32 0, i32 0
  %r6 = ptrtoint ptr %field.ptr.6 to i64
  %store.ptr.5 = inttoptr i64 %r6 to ptr
  store double %r5, ptr %store.ptr.5
  %r7 = fadd double 0.0, 0.07
  %field.base.8 = inttoptr i64 %r4 to ptr
  %field.ptr.8 = getelementptr inbounds %t.Color, ptr %field.base.8, i32 0, i32 1
  %r8 = ptrtoint ptr %field.ptr.8 to i64
  %store.ptr.7 = inttoptr i64 %r8 to ptr
  store double %r7, ptr %store.ptr.7
  %r9 = fadd double 0.0, 0.1
  %field.base.10 = inttoptr i64 %r4 to ptr
  %field.ptr.10 = getelementptr inbounds %t.Color, ptr %field.base.10, i32 0, i32 2
  %r10 = ptrtoint ptr %field.ptr.10 to i64
  %store.ptr.9 = inttoptr i64 %r10 to ptr
  store double %r9, ptr %store.ptr.9
  %r11 = fadd double 0.0, 1.0
  %field.base.12 = inttoptr i64 %r4 to ptr
  %field.ptr.12 = getelementptr inbounds %t.Color, ptr %field.base.12, i32 0, i32 3
  %r12 = ptrtoint ptr %field.ptr.12 to i64
  %store.ptr.11 = inttoptr i64 %r12 to ptr
  store double %r11, ptr %store.ptr.11
  %r13 = call i64 @"kira_fn_192_clearSwapchainRenderPass"(i64 %r4)
  %cleanup.call.ptr.13 = inttoptr i64 %r13 to ptr
  store ptr %cleanup.call.ptr.13, ptr %cleanup.heap.slot.13
  %r14 = load i64, ptr %local2
  %copy.dst.14 = inttoptr i64 %r14 to ptr
  %copy.src.13 = inttoptr i64 %r13 to ptr
  %copy.val.14 = load %t.RenderPassDescriptor, ptr %copy.src.13
  store %t.RenderPassDescriptor %copy.val.14, ptr %copy.dst.14
  %r15 = load i64, ptr %local1
  %native.state.get.ptr.16 = inttoptr i64 %r15 to ptr
  %native.state.get.slot.16 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.16, i64 1
  %native.state.get.val.0 = load %kira.bridge.value, ptr %native.state.get.slot.16
  %r16 = extractvalue %kira.bridge.value %native.state.get.val.0, 2
  %r17 = load i64, ptr %local3
  %copy.dst.17 = inttoptr i64 %r17 to ptr
  %copy.src.16 = inttoptr i64 %r16 to ptr
  %copy.val.17 = load %t.RenderPipeline, ptr %copy.src.16
  store %t.RenderPipeline %copy.val.17, ptr %copy.dst.17
  %r18 = load i64, ptr %local1
  %native.state.get.ptr.19 = inttoptr i64 %r18 to ptr
  %native.state.get.slot.19 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.19, i64 2
  %native.state.get.val.1 = load %kira.bridge.value, ptr %native.state.get.slot.19
  %r19 = extractvalue %kira.bridge.value %native.state.get.val.1, 2
  %r20 = load i64, ptr %local4
  %copy.dst.20 = inttoptr i64 %r20 to ptr
  %copy.src.19 = inttoptr i64 %r19 to ptr
  %copy.val.20 = load %t.GraphicsBuffer, ptr %copy.src.19
  store %t.GraphicsBuffer %copy.val.20, ptr %copy.dst.20
  %r21 = load i64, ptr %local0
  %r22 = load i64, ptr %local2
  %r23 = call i64 @"kira_fn_406_GraphicsFrame.beginRenderPass"(i64 %r21, i64 %r22)
  %cleanup.call.ptr.23 = inttoptr i64 %r23 to ptr
  store ptr %cleanup.call.ptr.23, ptr %cleanup.heap.slot.23
  %r24 = load i64, ptr %local5
  %copy.dst.24 = inttoptr i64 %r24 to ptr
  %copy.src.23 = inttoptr i64 %r23 to ptr
  %copy.val.24 = load %t.RenderEncoder, ptr %copy.src.23
  store %t.RenderEncoder %copy.val.24, ptr %copy.dst.24
  %r25 = load i64, ptr %local5
  %r26 = load i64, ptr %local3
  call void @"kira_fn_431_RenderEncoder.setPipeline"(i64 %r25, i64 %r26)
  %r27 = load i64, ptr %local5
  %r28 = load i64, ptr %local4
  call void @"kira_fn_432_RenderEncoder.setVertexBuffer"(i64 %r27, i64 %r28)
  %r29 = load i64, ptr %local5
  %r30 = add i64 0, 3
  call void @"kira_fn_435_RenderEncoder.draw"(i64 %r29, i64 %r30)
  %r31 = load i64, ptr %local0
  call void @"kira_fn_407_GraphicsFrame.endPass"(i64 %r31)
  %r32 = load i64, ptr %local0
  call void @"kira_fn_411_GraphicsFrame.requestQuit"(i64 %r32)
  %cleanup.heap.ptr.2 = load ptr, ptr %cleanup.heap.slot.4
  call void @free(ptr %cleanup.heap.ptr.2)
  %cleanup.heap.ptr.3 = load ptr, ptr %cleanup.heap.slot.13
  call void @free(ptr %cleanup.heap.ptr.3)
  %cleanup.heap.ptr.4 = load ptr, ptr %cleanup.heap.slot.23
  call void @free(ptr %cleanup.heap.ptr.4)
  call void @"kira_release_contents_RenderPassDescriptor"(ptr %local.storage.2)
  call void @"kira_release_contents_RenderEncoder"(ptr %local.storage.5)
  ret void
}

define void @"kira_fn_447_main$callback_447"(i64 %arg0) {
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
  %native.recover.payload.3 = call ptr @"kira_native_state_recover"(ptr %native.recover.state.3, i64 8458404067835574923)
  %r3 = ptrtoint ptr %native.recover.payload.3 to i64
  store i64 %r3, ptr %local1
  %r4 = load i64, ptr %local0
  %r5 = load i64, ptr %local1
  %native.state.get.ptr.6 = inttoptr i64 %r5 to ptr
  %native.state.get.slot.6 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.6, i64 2
  %native.state.get.val.0 = load %kira.bridge.value, ptr %native.state.get.slot.6
  %r6 = extractvalue %kira.bridge.value %native.state.get.val.0, 2
  call void @"kira_fn_420_Graphics.destroyBuffer"(i64 %r4, i64 %r6)
  %r7 = load i64, ptr %local0
  %r8 = load i64, ptr %local1
  %native.state.get.ptr.9 = inttoptr i64 %r8 to ptr
  %native.state.get.slot.9 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.9, i64 1
  %native.state.get.val.1 = load %kira.bridge.value, ptr %native.state.get.slot.9
  %r9 = extractvalue %kira.bridge.value %native.state.get.val.1, 2
  call void @"kira_fn_417_Graphics.destroyRenderPipeline"(i64 %r7, i64 %r9)
  %r10 = load i64, ptr %local0
  %r11 = load i64, ptr %local1
  %native.state.get.ptr.12 = inttoptr i64 %r11 to ptr
  %native.state.get.slot.12 = getelementptr inbounds %kira.bridge.value, ptr %native.state.get.ptr.12, i64 0
  %native.state.get.val.2 = load %kira.bridge.value, ptr %native.state.get.slot.12
  %r12 = extractvalue %kira.bridge.value %native.state.get.val.2, 2
  call void @"kira_fn_414_Graphics.destroyShader"(i64 %r10, i64 %r12)
  ret void
}

define i32 @main() {
entry:
  call void @"kira_fn_3_main"()
  ret i32 0
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
    i64 447, label %dispatch.case.3
  ]
dispatch.case.0:
  call void @"kira_fn_4_graphicsApplicationDefaultInit"(i64 %arg0)
  ret void
dispatch.case.1:
  call void @"kira_fn_6_graphicsApplicationDefaultCleanup"(i64 %arg0)
  ret void
dispatch.case.2:
  call void @"kira_fn_445_main$callback_445"(i64 %arg0)
  ret void
dispatch.case.3:
  call void @"kira_fn_447_main$callback_447"(i64 %arg0)
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
  call void @"kira_fn_414_Graphics.destroyShader"(i64 %arg0, i64 %closure.arg.0.0)
  ret void
dispatch.closure.case.1:
  %closure.slot.1.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.1.0 = load %kira.bridge.value, ptr %closure.slot.1.0
  %closure.arg.1.0 = extractvalue %kira.bridge.value %closure.value.1.0, 2
  call void @"kira_fn_416_Graphics.destroyPipeline"(i64 %arg0, i64 %closure.arg.1.0)
  ret void
dispatch.closure.case.2:
  %closure.slot.2.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.2.0 = load %kira.bridge.value, ptr %closure.slot.2.0
  %closure.arg.2.0 = extractvalue %kira.bridge.value %closure.value.2.0, 2
  call void @"kira_fn_417_Graphics.destroyRenderPipeline"(i64 %arg0, i64 %closure.arg.2.0)
  ret void
dispatch.closure.case.3:
  %closure.slot.3.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.3.0 = load %kira.bridge.value, ptr %closure.slot.3.0
  %closure.arg.3.0 = extractvalue %kira.bridge.value %closure.value.3.0, 2
  call void @"kira_fn_420_Graphics.destroyBuffer"(i64 %arg0, i64 %closure.arg.3.0)
  ret void
dispatch.closure.case.4:
  %closure.slot.4.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.4.0 = load %kira.bridge.value, ptr %closure.slot.4.0
  %closure.arg.4.0 = extractvalue %kira.bridge.value %closure.value.4.0, 2
  %closure.slot.4.1 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 1
  %closure.value.4.1 = load %kira.bridge.value, ptr %closure.slot.4.1
  %closure.arg.4.1 = extractvalue %kira.bridge.value %closure.value.4.1, 2
  call void @"kira_fn_422_Graphics.updateUniform"(i64 %arg0, i64 %closure.arg.4.0, i64 %closure.arg.4.1)
  ret void
dispatch.closure.case.5:
  %closure.slot.5.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.5.0 = load %kira.bridge.value, ptr %closure.slot.5.0
  %closure.arg.5.0 = extractvalue %kira.bridge.value %closure.value.5.0, 2
  call void @"kira_fn_423_Graphics.destroyUniform"(i64 %arg0, i64 %closure.arg.5.0)
  ret void
dispatch.closure.case.6:
  %closure.slot.6.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.6.0 = load %kira.bridge.value, ptr %closure.slot.6.0
  %closure.arg.6.0 = extractvalue %kira.bridge.value %closure.value.6.0, 2
  call void @"kira_fn_426_Graphics.destroyBindGroup"(i64 %arg0, i64 %closure.arg.6.0)
  ret void
dispatch.closure.case.7:
  %closure.slot.7.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.7.0 = load %kira.bridge.value, ptr %closure.slot.7.0
  %closure.arg.7.0 = extractvalue %kira.bridge.value %closure.value.7.0, 2
  call void @"kira_fn_428_Graphics.destroyTexture"(i64 %arg0, i64 %closure.arg.7.0)
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
  call void @"kira_fn_5_graphicsApplicationDefaultFrame"(i64 %arg0)
  ret void
dispatch.case.1:
  call void @"kira_fn_64_sokolSubmitFrame"(i64 %arg0)
  ret void
dispatch.case.2:
  call void @"kira_fn_79_graphicsSubmitFrame"(i64 %arg0)
  ret void
dispatch.case.3:
  call void @"kira_fn_407_GraphicsFrame.endPass"(i64 %arg0)
  ret void
dispatch.case.4:
  call void @"kira_fn_411_GraphicsFrame.requestQuit"(i64 %arg0)
  ret void
dispatch.case.5:
  call void @"kira_fn_446_main$callback_446"(i64 %arg0)
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
  call void @"kira_fn_408_GraphicsFrame.renderPass"(i64 %arg0, i64 %closure.arg.0.0, i64 %closure.arg.0.1)
  ret void
dispatch.closure.case.1:
  %closure.slot.1.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.1.0 = load %kira.bridge.value, ptr %closure.slot.1.0
  %closure.arg.1.0 = extractvalue %kira.bridge.value %closure.value.1.0, 2
  %closure.slot.1.1 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 1
  %closure.value.1.1 = load %kira.bridge.value, ptr %closure.slot.1.1
  %closure.arg.1.1 = extractvalue %kira.bridge.value %closure.value.1.1, 2
  call void @"kira_fn_410_GraphicsFrame.pass"(i64 %arg0, i64 %closure.arg.1.0, i64 %closure.arg.1.1)
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
  call void @"kira_fn_440_RenderEncoder.popClip"(i64 %arg0)
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
  ]
dispatch.closure.case.0:
  %closure.slot.0.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.0.0 = load %kira.bridge.value, ptr %closure.slot.0.0
  %closure.arg.0.0 = extractvalue %kira.bridge.value %closure.value.0.0, 2
  call void @"kira_fn_431_RenderEncoder.setPipeline"(i64 %arg0, i64 %closure.arg.0.0)
  ret void
dispatch.closure.case.1:
  %closure.slot.1.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.1.0 = load %kira.bridge.value, ptr %closure.slot.1.0
  %closure.arg.1.0 = extractvalue %kira.bridge.value %closure.value.1.0, 2
  call void @"kira_fn_432_RenderEncoder.setVertexBuffer"(i64 %arg0, i64 %closure.arg.1.0)
  ret void
dispatch.closure.case.2:
  %closure.slot.2.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.2.0 = load %kira.bridge.value, ptr %closure.slot.2.0
  %closure.arg.2.0 = extractvalue %kira.bridge.value %closure.value.2.0, 2
  %closure.slot.2.1 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 1
  %closure.value.2.1 = load %kira.bridge.value, ptr %closure.slot.2.1
  %closure.arg.2.1 = extractvalue %kira.bridge.value %closure.value.2.1, 2
  call void @"kira_fn_433_RenderEncoder.setIndexBuffer"(i64 %arg0, i64 %closure.arg.2.0, i64 %closure.arg.2.1)
  ret void
dispatch.closure.case.3:
  %closure.slot.3.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.3.0 = load %kira.bridge.value, ptr %closure.slot.3.0
  %closure.arg.3.0 = extractvalue %kira.bridge.value %closure.value.3.0, 2
  %closure.slot.3.1 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 1
  %closure.value.3.1 = load %kira.bridge.value, ptr %closure.slot.3.1
  %closure.arg.3.1 = extractvalue %kira.bridge.value %closure.value.3.1, 2
  call void @"kira_fn_434_RenderEncoder.setBindGroup"(i64 %arg0, i64 %closure.arg.3.0, i64 %closure.arg.3.1)
  ret void
dispatch.closure.case.4:
  %closure.slot.4.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.4.0 = load %kira.bridge.value, ptr %closure.slot.4.0
  %closure.arg.4.0 = extractvalue %kira.bridge.value %closure.value.4.0, 2
  call void @"kira_fn_435_RenderEncoder.draw"(i64 %arg0, i64 %closure.arg.4.0)
  ret void
dispatch.closure.case.5:
  %closure.slot.5.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.5.0 = load %kira.bridge.value, ptr %closure.slot.5.0
  %closure.arg.5.0 = extractvalue %kira.bridge.value %closure.value.5.0, 2
  call void @"kira_fn_436_RenderEncoder.drawIndexed"(i64 %arg0, i64 %closure.arg.5.0)
  ret void
dispatch.closure.case.6:
  %closure.slot.6.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.6.0 = load %kira.bridge.value, ptr %closure.slot.6.0
  %closure.arg.6.0 = extractvalue %kira.bridge.value %closure.value.6.0, 2
  %closure.slot.6.1 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 1
  %closure.value.6.1 = load %kira.bridge.value, ptr %closure.slot.6.1
  %closure.arg.6.1 = extractvalue %kira.bridge.value %closure.value.6.1, 2
  call void @"kira_fn_437_RenderEncoder.drawInstanced"(i64 %arg0, i64 %closure.arg.6.0, i64 %closure.arg.6.1)
  ret void
dispatch.closure.case.7:
  %closure.slot.7.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.7.0 = load %kira.bridge.value, ptr %closure.slot.7.0
  %closure.arg.7.0 = extractvalue %kira.bridge.value %closure.value.7.0, 2
  %closure.slot.7.1 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 1
  %closure.value.7.1 = load %kira.bridge.value, ptr %closure.slot.7.1
  %closure.arg.7.1 = extractvalue %kira.bridge.value %closure.value.7.1, 2
  call void @"kira_fn_438_RenderEncoder.drawIndexedInstanced"(i64 %arg0, i64 %closure.arg.7.0, i64 %closure.arg.7.1)
  ret void
dispatch.closure.case.8:
  %closure.slot.8.0 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 0
  %closure.value.8.0 = load %kira.bridge.value, ptr %closure.slot.8.0
  %closure.arg.8.0 = extractvalue %kira.bridge.value %closure.value.8.0, 2
  %closure.slot.8.1 = getelementptr inbounds %kira.bridge.value, ptr %closure.slots, i64 1
  %closure.value.8.1 = load %kira.bridge.value, ptr %closure.slot.8.1
  %closure.bits.8.1 = extractvalue %kira.bridge.value %closure.value.8.1, 2
  %closure.arg.8.1 = bitcast i64 %closure.bits.8.1 to double
  call void @"kira_fn_439_RenderEncoder.pushClip"(i64 %arg0, i64 %closure.arg.8.0, double %closure.arg.8.1)
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
  call void @"kira_fn_441_RenderEncoder.drawSurface"(i64 %arg0, i64 %closure.arg.9.0, i64 %closure.arg.9.1, i64 %closure.arg.9.2, double %closure.arg.9.3, double %closure.arg.9.4)
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
  call void @"kira_fn_442_RenderEncoder.drawSquircleSurface"(i64 %arg0, i64 %closure.arg.10.0, i64 %closure.arg.10.1, i64 %closure.arg.10.2, double %closure.arg.10.3, double %closure.arg.10.4)
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
  call void @"kira_fn_443_RenderEncoder.drawText"(i64 %arg0, i64 %closure.arg.11.0, %kira.string %closure.arg.11.1, i64 %closure.arg.11.2, double %closure.arg.11.3)
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
  call void @"kira_fn_444_RenderEncoder.drawGlow"(i64 %arg0, i64 %closure.arg.12.0, i64 %closure.arg.12.1, double %closure.arg.12.2, double %closure.arg.12.3)
  ret void
dispatch.default:
  unreachable
}

