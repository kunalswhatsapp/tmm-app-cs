; ModuleID = 'environment.armeabi-v7a.ll'
source_filename = "environment.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.ApplicationConfig = type {
	i8, ; bool uses_mono_llvm
	i8, ; bool uses_mono_aot
	i8, ; bool aot_lazy_load
	i8, ; bool uses_assembly_preload
	i8, ; bool broken_exception_transitions
	i8, ; bool instant_run_enabled
	i8, ; bool jni_add_native_method_registration_attribute_present
	i8, ; bool have_runtime_config_blob
	i8, ; bool have_assemblies_blob
	i8, ; bool marshal_methods_enabled
	i8, ; uint8_t bound_stream_io_exception_type
	i32, ; uint32_t package_naming_policy
	i32, ; uint32_t environment_variable_count
	i32, ; uint32_t system_property_count
	i32, ; uint32_t number_of_assemblies_in_apk
	i32, ; uint32_t bundled_assembly_name_width
	i32, ; uint32_t number_of_assembly_store_files
	i32, ; uint32_t number_of_dso_cache_entries
	i32, ; uint32_t android_runtime_jnienv_class_token
	i32, ; uint32_t jnienv_initialize_method_token
	i32, ; uint32_t jnienv_registerjninatives_method_token
	i32, ; uint32_t jni_remapping_replacement_type_count
	i32, ; uint32_t jni_remapping_replacement_method_index_entry_count
	i32, ; uint32_t mono_components_mask
	ptr ; char* android_package_name
}

%struct.AssemblyStoreAssemblyDescriptor = type {
	i32, ; uint32_t data_offset
	i32, ; uint32_t data_size
	i32, ; uint32_t debug_data_offset
	i32, ; uint32_t debug_data_size
	i32, ; uint32_t config_data_offset
	i32 ; uint32_t config_data_size
}

%struct.AssemblyStoreRuntimeData = type {
	ptr, ; uint8_t data_start
	i32, ; uint32_t assembly_count
	ptr ; AssemblyStoreAssemblyDescriptor assemblies
}

%struct.AssemblyStoreSingleAssemblyRuntimeData = type {
	ptr, ; uint8_t image_data
	ptr, ; uint8_t debug_info_data
	ptr, ; uint8_t config_data
	ptr ; AssemblyStoreAssemblyDescriptor descriptor
}

%struct.DSOCacheEntry = type {
	i64, ; uint64_t hash
	i8, ; bool ignore
	ptr, ; char* name
	ptr ; void* handle
}

%struct.XamarinAndroidBundledAssembly = type {
	i32, ; int32_t apk_fd
	i32, ; uint32_t data_offset
	i32, ; uint32_t data_size
	ptr, ; uint8_t data
	i32, ; uint32_t name_length
	ptr ; char* name
}

; 0x15e6972616d58
@format_tag = dso_local local_unnamed_addr constant i64 385281960275288, align 8

@mono_aot_mode_name = dso_local local_unnamed_addr constant ptr @.str.0, align 4

; Application environment variables array, name:value
@app_environment_variables = dso_local local_unnamed_addr constant [8 x ptr] [
	ptr @.env.0, ; 0
	ptr @.env.1, ; 1
	ptr @.env.2, ; 2
	ptr @.env.3, ; 3
	ptr @.env.4, ; 4
	ptr @.env.5, ; 5
	ptr @.env.6, ; 6
	ptr @.env.7 ; 7
], align 4

; System properties defined by the application
@app_system_properties = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@application_config = dso_local local_unnamed_addr constant %struct.ApplicationConfig {
	i8 0, ; bool uses_mono_llvm
	i8 1, ; bool uses_mono_aot
	i8 1, ; bool aot_lazy_load
	i8 0, ; bool uses_assembly_preload
	i8 0, ; bool broken_exception_transitions
	i8 0, ; bool instant_run_enabled
	i8 0, ; bool jni_add_native_method_registration_attribute_present
	i8 1, ; bool have_runtime_config_blob
	i8 1, ; bool have_assemblies_blob
	i8 0, ; bool marshal_methods_enabled
	i8 0, ; uint8_t bound_stream_io_exception_type (0x0)
	i32 3, ; uint32_t package_naming_policy (0x3)
	i32 8, ; uint32_t environment_variable_count (0x8)
	i32 0, ; uint32_t system_property_count (0x0)
	i32 93, ; uint32_t number_of_assemblies_in_apk (0x5d)
	i32 0, ; uint32_t bundled_assembly_name_width (0x0)
	i32 2, ; uint32_t number_of_assembly_store_files (0x2)
	i32 670, ; uint32_t number_of_dso_cache_entries (0x29e)
	i32 33554954, ; uint32_t android_runtime_jnienv_class_token (0x200020a)
	i32 100668099, ; uint32_t jnienv_initialize_method_token (0x60012c3)
	i32 100668098, ; uint32_t jnienv_registerjninatives_method_token (0x60012c2)
	i32 0, ; uint32_t jni_remapping_replacement_type_count (0x0)
	i32 0, ; uint32_t jni_remapping_replacement_method_index_entry_count (0x0)
	i32 0, ; uint32_t mono_components_mask (0x0)
	ptr @.ApplicationConfig.0_android_package_name; char* android_package_name
}, align 4

; DSO cache entries
@dso_cache = dso_local local_unnamed_addr global [670 x %struct.DSOCacheEntry] [
	%struct.DSOCacheEntry {
		i64 1541521, ; hash 0x178591, from name: libaot-Newtonsoft.Json.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.34_name, ; name: libaot-Newtonsoft.Json.dll.so
		ptr null; void* handle (0x0)
	}, ; 0
	%struct.DSOCacheEntry {
		i64 10700447, ; hash 0xa3469f, from name: DRV_TrimbleCommon
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.5_name, ; name: libDRV_TrimbleCommon.so
		ptr null; void* handle (0x0)
	}, ; 1
	%struct.DSOCacheEntry {
		i64 14394078, ; hash 0xdba2de, from name: libaot-Google.Protobuf.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.33_name, ; name: libaot-Google.Protobuf.dll.so
		ptr null; void* handle (0x0)
	}, ; 2
	%struct.DSOCacheEntry {
		i64 20489825, ; hash 0x138a661, from name: aot-System.Collections.NonGeneric.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.64_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle (0x0)
	}, ; 3
	%struct.DSOCacheEntry {
		i64 21576729, ; hash 0x1493c19, from name: libaot-Trimble.EMPOWER.Common.Droid.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.46_name, ; name: libaot-Trimble.EMPOWER.Common.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 4
	%struct.DSOCacheEntry {
		i64 29424343, ; hash 0x1c0fad7, from name: libaot-Mono.Android.Runtime
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.118_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle (0x0)
	}, ; 5
	%struct.DSOCacheEntry {
		i64 33746111, ; hash 0x202ecbf, from name: libaot-CatalystFacade.NET.Droid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.30_name, ; name: libaot-CatalystFacade.NET.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 6
	%struct.DSOCacheEntry {
		i64 41533538, ; hash 0x279c062, from name: libaot-Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.Android.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.49_name, ; name: libaot-Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.Android.dll.so
		ptr null; void* handle (0x0)
	}, ; 7
	%struct.DSOCacheEntry {
		i64 42639949, ; hash 0x28aa24d, from name: System.Threading.Thread
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.107_name, ; name: libaot-System.Threading.Thread.dll.so
		ptr null; void* handle (0x0)
	}, ; 8
	%struct.DSOCacheEntry {
		i64 58302817, ; hash 0x379a161, from name: libc++_shared.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.0_name, ; name: libc++_shared.so
		ptr null; void* handle (0x0)
	}, ; 9
	%struct.DSOCacheEntry {
		i64 62384850, ; hash 0x3b7ead2, from name: libaot-Xamarin.AndroidX.Core.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.60_name, ; name: libaot-Xamarin.AndroidX.Core.dll.so
		ptr null; void* handle (0x0)
	}, ; 10
	%struct.DSOCacheEntry {
		i64 66541672, ; hash 0x3f75868, from name: System.Diagnostics.StackTrace
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.74_name, ; name: libaot-System.Diagnostics.StackTrace.dll.so
		ptr null; void* handle (0x0)
	}, ; 11
	%struct.DSOCacheEntry {
		i64 68258583, ; hash 0x4118b17, from name: libaot-System.Diagnostics.TraceSource.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.75_name, ; name: libaot-System.Diagnostics.TraceSource.dll.so
		ptr null; void* handle (0x0)
	}, ; 12
	%struct.DSOCacheEntry {
		i64 91228970, ; hash 0x5700b2a, from name: libaot-Trimble.LicensingV2.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.37_name, ; name: libaot-Trimble.LicensingV2.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 13
	%struct.DSOCacheEntry {
		i64 94467485, ; hash 0x5a1759d, from name: Trimble.Ssi.Drivers.Gnss.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.56_name, ; name: libaot-Trimble.Ssi.Drivers.Gnss.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 14
	%struct.DSOCacheEntry {
		i64 94620481, ; hash 0x5a3cb41, from name: aot-netstandard
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.115_name, ; name: libaot-netstandard.dll.so
		ptr null; void* handle (0x0)
	}, ; 15
	%struct.DSOCacheEntry {
		i64 104701530, ; hash 0x63d9e5a, from name: Trimble.Ssi.Driver.CarpoBased.Driver.RSeries
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.16_name, ; name: libTrimble.Ssi.Driver.CarpoBased.Driver.RSeries.so
		ptr null; void* handle (0x0)
	}, ; 16
	%struct.DSOCacheEntry {
		i64 106024512, ; hash 0x651ce40, from name: libaot-Xamarin.Essentials.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.61_name, ; name: libaot-Xamarin.Essentials.dll.so
		ptr null; void* handle (0x0)
	}, ; 17
	%struct.DSOCacheEntry {
		i64 117323195, ; hash 0x6fe35bb, from name: aot-Mono.Android.Export.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.117_name, ; name: libaot-Mono.Android.Export.dll.so
		ptr null; void* handle (0x0)
	}, ; 18
	%struct.DSOCacheEntry {
		i64 117431740, ; hash 0x6ffddbc, from name: System.Runtime.InteropServices
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.99_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle (0x0)
	}, ; 19
	%struct.DSOCacheEntry {
		i64 124387420, ; hash 0x76a005c, from name: libaot-Trimble.Ssi.Core.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.39_name, ; name: libaot-Trimble.Ssi.Core.dll.so
		ptr null; void* handle (0x0)
	}, ; 20
	%struct.DSOCacheEntry {
		i64 125400483, ; hash 0x77975a3, from name: Trimble.Ssi.DriverCommon.Interfaces.Gnss.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.54_name, ; name: libaot-Trimble.Ssi.DriverCommon.Interfaces.Gnss.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 21
	%struct.DSOCacheEntry {
		i64 131416302, ; hash 0x7d540ee, from name: aot-Trimble.Ssi.Components.Core
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.38_name, ; name: libaot-Trimble.Ssi.Components.Core.dll.so
		ptr null; void* handle (0x0)
	}, ; 22
	%struct.DSOCacheEntry {
		i64 135821890, ; hash 0x8187a42, from name: aot-mscorlib
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.114_name, ; name: libaot-mscorlib.dll.so
		ptr null; void* handle (0x0)
	}, ; 23
	%struct.DSOCacheEntry {
		i64 152360278, ; hash 0x914d556, from name: libaot-System.Runtime.Serialization.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.102_name, ; name: libaot-System.Runtime.Serialization.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 24
	%struct.DSOCacheEntry {
		i64 154543565, ; hash 0x93625cd, from name: libSystem.Security.Cryptography.Native.Android
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.24_name, ; name: libSystem.Security.Cryptography.Native.Android.so
		ptr null; void* handle (0x0)
	}, ; 25
	%struct.DSOCacheEntry {
		i64 155189489, ; hash 0x94000f1, from name: aot-System.Core
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.71_name, ; name: libaot-System.Core.dll.so
		ptr null; void* handle (0x0)
	}, ; 26
	%struct.DSOCacheEntry {
		i64 161692112, ; hash 0x9a339d0, from name: libaot-Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.JavaBindings
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.50_name, ; name: libaot-Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.JavaBindings.dll.so
		ptr null; void* handle (0x0)
	}, ; 27
	%struct.DSOCacheEntry {
		i64 162725860, ; hash 0x9b2ffe4, from name: libTrimble.Ssi.Interfaces.GNSS.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.21_name, ; name: libTrimble.Ssi.Interfaces.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 28
	%struct.DSOCacheEntry {
		i64 184306393, ; hash 0xafc4ad9, from name: TDDTransformationLibCS.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.3_name, ; name: libTDDTransformationLibCS.so
		ptr null; void* handle (0x0)
	}, ; 29
	%struct.DSOCacheEntry {
		i64 197501317, ; hash 0xbc5a185, from name: libaot-Microsoft.CSharp.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.62_name, ; name: libaot-Microsoft.CSharp.dll.so
		ptr null; void* handle (0x0)
	}, ; 30
	%struct.DSOCacheEntry {
		i64 205061960, ; hash 0xc38ff48, from name: System.ComponentModel
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.69_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle (0x0)
	}, ; 31
	%struct.DSOCacheEntry {
		i64 206071461, ; hash 0xc4866a5, from name: aot-System.Net.Requests
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.87_name, ; name: libaot-System.Net.Requests.dll.so
		ptr null; void* handle (0x0)
	}, ; 32
	%struct.DSOCacheEntry {
		i64 214688819, ; hash 0xccbe433, from name: Xamarin.Essentials.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.61_name, ; name: libaot-Xamarin.Essentials.dll.so
		ptr null; void* handle (0x0)
	}, ; 33
	%struct.DSOCacheEntry {
		i64 228961948, ; hash 0xda5ae9c, from name: libaot-CatalystFacade.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.29_name, ; name: libaot-CatalystFacade.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 34
	%struct.DSOCacheEntry {
		i64 229294244, ; hash 0xdaac0a4, from name: monodroid.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.27_name, ; name: libmonodroid.so
		ptr null; void* handle (0x0)
	}, ; 35
	%struct.DSOCacheEntry {
		i64 229750790, ; hash 0xdb1b806, from name: Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.Android.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.49_name, ; name: libaot-Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.Android.dll.so
		ptr null; void* handle (0x0)
	}, ; 36
	%struct.DSOCacheEntry {
		i64 231913179, ; hash 0xdd2b6db, from name: libaot-System.Collections.Concurrent
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.63_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle (0x0)
	}, ; 37
	%struct.DSOCacheEntry {
		i64 246610117, ; hash 0xeb2f8c5, from name: System.Reflection.Emit.Lightweight
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.97_name, ; name: libaot-System.Reflection.Emit.Lightweight.dll.so
		ptr null; void* handle (0x0)
	}, ; 38
	%struct.DSOCacheEntry {
		i64 246921316, ; hash 0xeb7b864, from name: libaot-System.Text.RegularExpressions.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.106_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle (0x0)
	}, ; 39
	%struct.DSOCacheEntry {
		i64 248712493, ; hash 0xed30d2d, from name: libaot-Trimble.EMPOWER.Common.Droid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.46_name, ; name: libaot-Trimble.EMPOWER.Common.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 40
	%struct.DSOCacheEntry {
		i64 263077002, ; hash 0xfae3c8a, from name: libaot-Xamarin.AndroidX.Browser.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.59_name, ; name: libaot-Xamarin.AndroidX.Browser.dll.so
		ptr null; void* handle (0x0)
	}, ; 41
	%struct.DSOCacheEntry {
		i64 270150149, ; hash 0x101a2a05, from name: System.Xml.ReaderWriter.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.111_name, ; name: libaot-System.Xml.ReaderWriter.dll.so
		ptr null; void* handle (0x0)
	}, ; 42
	%struct.DSOCacheEntry {
		i64 274845747, ; hash 0x1061d033, from name: System.Runtime.Serialization.Formatters.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.101_name, ; name: libaot-System.Runtime.Serialization.Formatters.dll.so
		ptr null; void* handle (0x0)
	}, ; 43
	%struct.DSOCacheEntry {
		i64 291348661, ; hash 0x115da0b5, from name: aot-System.Xml.ReaderWriter
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.111_name, ; name: libaot-System.Xml.ReaderWriter.dll.so
		ptr null; void* handle (0x0)
	}, ; 44
	%struct.DSOCacheEntry {
		i64 292529153, ; hash 0x116fa401, from name: libaot-Mono.Android.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.119_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle (0x0)
	}, ; 45
	%struct.DSOCacheEntry {
		i64 300158802, ; hash 0x11e40f52, from name: aot-System.Text.Encoding.Extensions
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.105_name, ; name: libaot-System.Text.Encoding.Extensions.dll.so
		ptr null; void* handle (0x0)
	}, ; 46
	%struct.DSOCacheEntry {
		i64 310443525, ; hash 0x1280fe05, from name: GeodeticX.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.2_name, ; name: libGeodeticX.so
		ptr null; void* handle (0x0)
	}, ; 47
	%struct.DSOCacheEntry {
		i64 321003452, ; hash 0x13221fbc, from name: libaot-System.ComponentModel.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.67_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 48
	%struct.DSOCacheEntry {
		i64 321597661, ; hash 0x132b30dd, from name: System.Numerics
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.91_name, ; name: libaot-System.Numerics.dll.so
		ptr null; void* handle (0x0)
	}, ; 49
	%struct.DSOCacheEntry {
		i64 323716037, ; hash 0x134b83c5, from name: libaot-System.Threading.ThreadPool
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.108_name, ; name: libaot-System.Threading.ThreadPool.dll.so
		ptr null; void* handle (0x0)
	}, ; 50
	%struct.DSOCacheEntry {
		i64 334172448, ; hash 0x13eb1120, from name: aot-System.ComponentModel.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.67_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 51
	%struct.DSOCacheEntry {
		i64 345067907, ; hash 0x14915183, from name: Trimble.Licensing.Interfaces
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.36_name, ; name: libaot-Trimble.Licensing.Interfaces.dll.so
		ptr null; void* handle (0x0)
	}, ; 52
	%struct.DSOCacheEntry {
		i64 356960019, ; hash 0x1546c713, from name: Trimble.Ssi.DriverManagement.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.42_name, ; name: libaot-Trimble.Ssi.DriverManagement.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 53
	%struct.DSOCacheEntry {
		i64 358687318, ; hash 0x15612256, from name: Trimble.Ssi.CSWrapped.GNSS
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.15_name, ; name: libTrimble.Ssi.CSWrapped.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 54
	%struct.DSOCacheEntry {
		i64 359463689, ; hash 0x156cfb09, from name: libaot-System.Collections
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.66_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle (0x0)
	}, ; 55
	%struct.DSOCacheEntry {
		i64 361772374, ; hash 0x15903556, from name: libaot-Trimble.Licensing.Interfaces
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.36_name, ; name: libaot-Trimble.Licensing.Interfaces.dll.so
		ptr null; void* handle (0x0)
	}, ; 56
	%struct.DSOCacheEntry {
		i64 369012355, ; hash 0x15feae83, from name: Trimble.Ssi.Driver.CarpoBased.Driver.SP80.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.52_name, ; name: libaot-Trimble.Ssi.Driver.CarpoBased.Driver.SP80.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 57
	%struct.DSOCacheEntry {
		i64 369872811, ; hash 0x160bcfab, from name: System.Memory.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.83_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle (0x0)
	}, ; 58
	%struct.DSOCacheEntry {
		i64 383289982, ; hash 0x16d88a7e, from name: Trimble.Ssi.Driver.DriverCommon.Common.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.8_name, ; name: libTrimble.Ssi.Driver.DriverCommon.Common.so
		ptr null; void* handle (0x0)
	}, ; 59
	%struct.DSOCacheEntry {
		i64 384416010, ; hash 0x16e9b90a, from name: Trimble.Ssi.Interfaces.Common.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.11_name, ; name: libTrimble.Ssi.Interfaces.Common.so
		ptr null; void* handle (0x0)
	}, ; 60
	%struct.DSOCacheEntry {
		i64 386848029, ; hash 0x170ed51d, from name: libTrimble.Ssi.Interfaces.GNSS
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.21_name, ; name: libTrimble.Ssi.Interfaces.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 61
	%struct.DSOCacheEntry {
		i64 391888984, ; hash 0x175bc058, from name: mono-component-marshal-ilgen.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.25_name, ; name: libmono-component-marshal-ilgen.so
		ptr null; void* handle (0x0)
	}, ; 62
	%struct.DSOCacheEntry {
		i64 392211733, ; hash 0x1760ad15, from name: CatalystFacade.NET.Droid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.30_name, ; name: libaot-CatalystFacade.NET.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 63
	%struct.DSOCacheEntry {
		i64 395744057, ; hash 0x17969339, from name: _Microsoft.Android.Resource.Designer
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.28_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle (0x0)
	}, ; 64
	%struct.DSOCacheEntry {
		i64 407227773, ; hash 0x1845cd7d, from name: System.Net.NameResolution.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.85_name, ; name: libaot-System.Net.NameResolution.dll.so
		ptr null; void* handle (0x0)
	}, ; 65
	%struct.DSOCacheEntry {
		i64 434424479, ; hash 0x19e4ca9f, from name: aot-Trimble.Ssi.Driver.MockGnss.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.53_name, ; name: libaot-Trimble.Ssi.Driver.MockGnss.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 66
	%struct.DSOCacheEntry {
		i64 436242105, ; hash 0x1a0086b9, from name: aot-AIDLService
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.35_name, ; name: libaot-AIDLService.dll.so
		ptr null; void* handle (0x0)
	}, ; 67
	%struct.DSOCacheEntry {
		i64 441461121, ; hash 0x1a502981, from name: libaot-Trimble.Ssi.DriverCommon.Interfaces.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.41_name, ; name: libaot-Trimble.Ssi.DriverCommon.Interfaces.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 68
	%struct.DSOCacheEntry {
		i64 442521989, ; hash 0x1a605985, from name: Xamarin.Essentials
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.61_name, ; name: libaot-Xamarin.Essentials.dll.so
		ptr null; void* handle (0x0)
	}, ; 69
	%struct.DSOCacheEntry {
		i64 442565967, ; hash 0x1a61054f, from name: System.Collections
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.66_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle (0x0)
	}, ; 70
	%struct.DSOCacheEntry {
		i64 445287286, ; hash 0x1a8a8b76, from name: Trimble.Ssi.DriverManagement
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.10_name, ; name: libTrimble.Ssi.DriverManagement.so
		ptr null; void* handle (0x0)
	}, ; 71
	%struct.DSOCacheEntry {
		i64 451696200, ; hash 0x1aec5648, from name: libaot-System.IO.Compression
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.80_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle (0x0)
	}, ; 72
	%struct.DSOCacheEntry {
		i64 457626699, ; hash 0x1b46d44b, from name: DRV_TrimCom
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.14_name, ; name: libDRV_TrimCom.so
		ptr null; void* handle (0x0)
	}, ; 73
	%struct.DSOCacheEntry {
		i64 463154707, ; hash 0x1b9b2e13, from name: aot-System.Memory.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.83_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle (0x0)
	}, ; 74
	%struct.DSOCacheEntry {
		i64 465846621, ; hash 0x1bc4415d, from name: mscorlib
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.114_name, ; name: libaot-mscorlib.dll.so
		ptr null; void* handle (0x0)
	}, ; 75
	%struct.DSOCacheEntry {
		i64 480839525, ; hash 0x1ca90765, from name: Trimble.Ssi.Driver.CarpoBased.Driver.RSeries.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.16_name, ; name: libTrimble.Ssi.Driver.CarpoBased.Driver.RSeries.so
		ptr null; void* handle (0x0)
	}, ; 76
	%struct.DSOCacheEntry {
		i64 498788369, ; hash 0x1dbae811, from name: System.ObjectModel
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.92_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle (0x0)
	}, ; 77
	%struct.DSOCacheEntry {
		i64 500609955, ; hash 0x1dd6b3a3, from name: System.Native.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.23_name, ; name: libSystem.Native.so
		ptr null; void* handle (0x0)
	}, ; 78
	%struct.DSOCacheEntry {
		i64 506375840, ; hash 0x1e2eaea0, from name: EM940Lib-Mono-Android
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.32_name, ; name: libaot-EM940Lib-Mono-Android.dll.so
		ptr null; void* handle (0x0)
	}, ; 79
	%struct.DSOCacheEntry {
		i64 523620955, ; hash 0x1f35d25b, from name: Trimble.Ssi.Driver.Mock.Common.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.9_name, ; name: libTrimble.Ssi.Driver.Mock.Common.so
		ptr null; void* handle (0x0)
	}, ; 80
	%struct.DSOCacheEntry {
		i64 526397549, ; hash 0x1f60306d, from name: Trimble.EMPOWER.Manager.Droid.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.48_name, ; name: libaot-Trimble.EMPOWER.Manager.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 81
	%struct.DSOCacheEntry {
		i64 536938861, ; hash 0x2001096d, from name: libaot-Trimble.Ssi.Drivers.Common.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.44_name, ; name: libaot-Trimble.Ssi.Drivers.Common.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 82
	%struct.DSOCacheEntry {
		i64 550368715, ; hash 0x20cdf5cb, from name: System.Core.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.71_name, ; name: libaot-System.Core.dll.so
		ptr null; void* handle (0x0)
	}, ; 83
	%struct.DSOCacheEntry {
		i64 553863972, ; hash 0x21034b24, from name: aot-System.Collections
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.66_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle (0x0)
	}, ; 84
	%struct.DSOCacheEntry {
		i64 554840301, ; hash 0x211230ed, from name: aot-System.Net.Requests.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.87_name, ; name: libaot-System.Net.Requests.dll.so
		ptr null; void* handle (0x0)
	}, ; 85
	%struct.DSOCacheEntry {
		i64 555344541, ; hash 0x2119e29d, from name: aot-Trimble.Licensing.Interfaces.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.36_name, ; name: libaot-Trimble.Licensing.Interfaces.dll.so
		ptr null; void* handle (0x0)
	}, ; 86
	%struct.DSOCacheEntry {
		i64 566504058, ; hash 0x21c42a7a, from name: Trimble.Ssi.Driver.CarpoBased.Driver.SP80.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.52_name, ; name: libaot-Trimble.Ssi.Driver.CarpoBased.Driver.SP80.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 87
	%struct.DSOCacheEntry {
		i64 581651430, ; hash 0x22ab4be6, from name: Trimble.Ssi.Interfaces.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.45_name, ; name: libaot-Trimble.Ssi.Interfaces.dll.so
		ptr null; void* handle (0x0)
	}, ; 88
	%struct.DSOCacheEntry {
		i64 584914887, ; hash 0x22dd17c7, from name: aot-System.Runtime.Numerics
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.100_name, ; name: libaot-System.Runtime.Numerics.dll.so
		ptr null; void* handle (0x0)
	}, ; 89
	%struct.DSOCacheEntry {
		i64 589614471, ; hash 0x2324cd87, from name: libaot-Mono.Android.Export.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.117_name, ; name: libaot-Mono.Android.Export.dll.so
		ptr null; void* handle (0x0)
	}, ; 90
	%struct.DSOCacheEntry {
		i64 592064594, ; hash 0x234a3052, from name: libaot-Trimble.Ssi.Driver.MockGnss.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.53_name, ; name: libaot-Trimble.Ssi.Driver.MockGnss.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 91
	%struct.DSOCacheEntry {
		i64 592143061, ; hash 0x234b62d5, from name: aot-Xamarin.Essentials.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.61_name, ; name: libaot-Xamarin.Essentials.dll.so
		ptr null; void* handle (0x0)
	}, ; 92
	%struct.DSOCacheEntry {
		i64 603308576, ; hash 0x23f5c220, from name: DRV_SP80.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.13_name, ; name: libDRV_SP80.so
		ptr null; void* handle (0x0)
	}, ; 93
	%struct.DSOCacheEntry {
		i64 610728866, ; hash 0x2466fba2, from name: libDRV_TrimbleCommon.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.5_name, ; name: libDRV_TrimbleCommon.so
		ptr null; void* handle (0x0)
	}, ; 94
	%struct.DSOCacheEntry {
		i64 619562232, ; hash 0x24edc4f8, from name: libTrimble.Ssi.CSWrapped.GNSS
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.15_name, ; name: libTrimble.Ssi.CSWrapped.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 95
	%struct.DSOCacheEntry {
		i64 622561209, ; hash 0x251b87b9, from name: aot-System.Drawing.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.76_name, ; name: libaot-System.Drawing.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 96
	%struct.DSOCacheEntry {
		i64 643988587, ; hash 0x26627c6b, from name: libaot-System.Reflection.Emit.ILGeneration
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.96_name, ; name: libaot-System.Reflection.Emit.ILGeneration.dll.so
		ptr null; void* handle (0x0)
	}, ; 97
	%struct.DSOCacheEntry {
		i64 657767393, ; hash 0x2734bbe1, from name: aot-System.Collections.Specialized
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.65_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle (0x0)
	}, ; 98
	%struct.DSOCacheEntry {
		i64 668577687, ; hash 0x27d9af97, from name: aot-System.Reflection.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.98_name, ; name: libaot-System.Reflection.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 99
	%struct.DSOCacheEntry {
		i64 672442732, ; hash 0x2814a96c, from name: System.Collections.Concurrent
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.63_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle (0x0)
	}, ; 100
	%struct.DSOCacheEntry {
		i64 674972701, ; hash 0x283b441d, from name: aot-AltGeoRelayService.Droid.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.31_name, ; name: libaot-AltGeoRelayService.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 101
	%struct.DSOCacheEntry {
		i64 675936804, ; hash 0x2849fa24, from name: System.Net.Requests.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.87_name, ; name: libaot-System.Net.Requests.dll.so
		ptr null; void* handle (0x0)
	}, ; 102
	%struct.DSOCacheEntry {
		i64 679655364, ; hash 0x2882b7c4, from name: aot-System.Runtime.InteropServices
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.99_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle (0x0)
	}, ; 103
	%struct.DSOCacheEntry {
		i64 683518922, ; hash 0x28bdabca, from name: System.Net.Security
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.88_name, ; name: libaot-System.Net.Security.dll.so
		ptr null; void* handle (0x0)
	}, ; 104
	%struct.DSOCacheEntry {
		i64 690760905, ; hash 0x292c2cc9, from name: aot-Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.JavaBindings
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.50_name, ; name: libaot-Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.JavaBindings.dll.so
		ptr null; void* handle (0x0)
	}, ; 105
	%struct.DSOCacheEntry {
		i64 698852761, ; hash 0x29a7a599, from name: Trimble.EMPOWER.Common.Droid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.46_name, ; name: libaot-Trimble.EMPOWER.Common.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 106
	%struct.DSOCacheEntry {
		i64 705503825, ; hash 0x2a0d2251, from name: CsdManagement
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.1_name, ; name: libCsdManagement.so
		ptr null; void* handle (0x0)
	}, ; 107
	%struct.DSOCacheEntry {
		i64 709134495, ; hash 0x2a44889f, from name: libaot-AltGeoRelayService.Droid.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.31_name, ; name: libaot-AltGeoRelayService.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 108
	%struct.DSOCacheEntry {
		i64 713144928, ; hash 0x2a81ba60, from name: libaot-System.Net.Sockets.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.90_name, ; name: libaot-System.Net.Sockets.dll.so
		ptr null; void* handle (0x0)
	}, ; 109
	%struct.DSOCacheEntry {
		i64 738487011, ; hash 0x2c046ae3, from name: aot-System.Memory
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.83_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle (0x0)
	}, ; 110
	%struct.DSOCacheEntry {
		i64 740429482, ; hash 0x2c220eaa, from name: aot-System.Net.Security
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.88_name, ; name: libaot-System.Net.Security.dll.so
		ptr null; void* handle (0x0)
	}, ; 111
	%struct.DSOCacheEntry {
		i64 748366034, ; hash 0x2c9b28d2, from name: monodroid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.27_name, ; name: libmonodroid.so
		ptr null; void* handle (0x0)
	}, ; 112
	%struct.DSOCacheEntry {
		i64 759196610, ; hash 0x2d406bc2, from name: aot-Trimble.Ssi.Driver.CarpoBased.Driver.RSeries.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.51_name, ; name: libaot-Trimble.Ssi.Driver.CarpoBased.Driver.RSeries.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 113
	%struct.DSOCacheEntry {
		i64 759454413, ; hash 0x2d445acd, from name: System.Net.Requests
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.87_name, ; name: libaot-System.Net.Requests.dll.so
		ptr null; void* handle (0x0)
	}, ; 114
	%struct.DSOCacheEntry {
		i64 763733819, ; hash 0x2d85a73b, from name: libaot-EM940Lib-Mono-Android.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.32_name, ; name: libaot-EM940Lib-Mono-Android.dll.so
		ptr null; void* handle (0x0)
	}, ; 115
	%struct.DSOCacheEntry {
		i64 772696399, ; hash 0x2e0e694f, from name: aot-System.Data.Common
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.72_name, ; name: libaot-System.Data.Common.dll.so
		ptr null; void* handle (0x0)
	}, ; 116
	%struct.DSOCacheEntry {
		i64 775507847, ; hash 0x2e394f87, from name: System.IO.Compression
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.80_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle (0x0)
	}, ; 117
	%struct.DSOCacheEntry {
		i64 776241880, ; hash 0x2e4482d8, from name: aot-System.Reflection.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.98_name, ; name: libaot-System.Reflection.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 118
	%struct.DSOCacheEntry {
		i64 789074706, ; hash 0x2f085312, from name: aot-System.Threading.Thread
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.107_name, ; name: libaot-System.Threading.Thread.dll.so
		ptr null; void* handle (0x0)
	}, ; 119
	%struct.DSOCacheEntry {
		i64 794521686, ; hash 0x2f5b7056, from name: libaot-Trimble.Ssi.Driver.CarpoBased.Driver.SP80.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.52_name, ; name: libaot-Trimble.Ssi.Driver.CarpoBased.Driver.SP80.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 120
	%struct.DSOCacheEntry {
		i64 803389241, ; hash 0x2fe2bf39, from name: c++_shared.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.0_name, ; name: libc++_shared.so
		ptr null; void* handle (0x0)
	}, ; 121
	%struct.DSOCacheEntry {
		i64 804715423, ; hash 0x2ff6fb9f, from name: System.Data.Common
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.72_name, ; name: libaot-System.Data.Common.dll.so
		ptr null; void* handle (0x0)
	}, ; 122
	%struct.DSOCacheEntry {
		i64 806746267, ; hash 0x3015f89b, from name: aot-System.Private.Xml.Linq
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.94_name, ; name: libaot-System.Private.Xml.Linq.dll.so
		ptr null; void* handle (0x0)
	}, ; 123
	%struct.DSOCacheEntry {
		i64 811095842, ; hash 0x30585722, from name: aot-_Microsoft.Android.Resource.Designer
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.28_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle (0x0)
	}, ; 124
	%struct.DSOCacheEntry {
		i64 826387615, ; hash 0x3141ac9f, from name: aot-Trimble.Ssi.Core.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.39_name, ; name: libaot-Trimble.Ssi.Core.dll.so
		ptr null; void* handle (0x0)
	}, ; 125
	%struct.DSOCacheEntry {
		i64 830298997, ; hash 0x317d5b75, from name: System.IO.Compression.Brotli
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.79_name, ; name: libaot-System.IO.Compression.Brotli.dll.so
		ptr null; void* handle (0x0)
	}, ; 126
	%struct.DSOCacheEntry {
		i64 837478634, ; hash 0x31eae8ea, from name: libaot-System.Linq.Expressions
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.81_name, ; name: libaot-System.Linq.Expressions.dll.so
		ptr null; void* handle (0x0)
	}, ; 127
	%struct.DSOCacheEntry {
		i64 845614355, ; hash 0x32670d13, from name: aot-System.Collections.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.66_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle (0x0)
	}, ; 128
	%struct.DSOCacheEntry {
		i64 846646212, ; hash 0x3276cbc4, from name: aot-System.Collections.Concurrent.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.63_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle (0x0)
	}, ; 129
	%struct.DSOCacheEntry {
		i64 854961858, ; hash 0x32f5aec2, from name: libaot-System.Reflection.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.98_name, ; name: libaot-System.Reflection.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 130
	%struct.DSOCacheEntry {
		i64 855129724, ; hash 0x32f83e7c, from name: libaot-System.Private.Xml.Linq.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.94_name, ; name: libaot-System.Private.Xml.Linq.dll.so
		ptr null; void* handle (0x0)
	}, ; 131
	%struct.DSOCacheEntry {
		i64 855910803, ; hash 0x33042993, from name: aot-System.Threading.Thread.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.107_name, ; name: libaot-System.Threading.Thread.dll.so
		ptr null; void* handle (0x0)
	}, ; 132
	%struct.DSOCacheEntry {
		i64 866894703, ; hash 0x33abc36f, from name: System.Net.Security.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.88_name, ; name: libaot-System.Net.Security.dll.so
		ptr null; void* handle (0x0)
	}, ; 133
	%struct.DSOCacheEntry {
		i64 870587408, ; hash 0x33e41c10, from name: System.Security.Cryptography.Native.Android.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.24_name, ; name: libSystem.Security.Cryptography.Native.Android.so
		ptr null; void* handle (0x0)
	}, ; 134
	%struct.DSOCacheEntry {
		i64 874318146, ; hash 0x341d0942, from name: libaot-System.IO.Compression.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.80_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle (0x0)
	}, ; 135
	%struct.DSOCacheEntry {
		i64 876853269, ; hash 0x3443b815, from name: libaot-System.Net.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.86_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 136
	%struct.DSOCacheEntry {
		i64 890621646, ; hash 0x3515cece, from name: aot-Trimble.Ssi.DriverProxy.Common.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.43_name, ; name: libaot-Trimble.Ssi.DriverProxy.Common.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 137
	%struct.DSOCacheEntry {
		i64 899961894, ; hash 0x35a45426, from name: aot-Trimble.EMPOWER.Common.Droid.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.46_name, ; name: libaot-Trimble.EMPOWER.Common.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 138
	%struct.DSOCacheEntry {
		i64 905680937, ; hash 0x35fb9829, from name: aot-mscorlib.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.114_name, ; name: libaot-mscorlib.dll.so
		ptr null; void* handle (0x0)
	}, ; 139
	%struct.DSOCacheEntry {
		i64 907069023, ; hash 0x3610c65f, from name: Trimble.Ssi.Core
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.39_name, ; name: libaot-Trimble.Ssi.Core.dll.so
		ptr null; void* handle (0x0)
	}, ; 140
	%struct.DSOCacheEntry {
		i64 907714710, ; hash 0x361aa096, from name: libaot-System.Security.Cryptography
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.104_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle (0x0)
	}, ; 141
	%struct.DSOCacheEntry {
		i64 910372842, ; hash 0x36432fea, from name: aot-CatalystFacade.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.29_name, ; name: libaot-CatalystFacade.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 142
	%struct.DSOCacheEntry {
		i64 926057315, ; hash 0x37328363, from name: Trimble.Ssi.Interfaces.GNSS
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.21_name, ; name: libTrimble.Ssi.Interfaces.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 143
	%struct.DSOCacheEntry {
		i64 940742254, ; hash 0x3812966e, from name: libaot-System.Linq.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.82_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle (0x0)
	}, ; 144
	%struct.DSOCacheEntry {
		i64 950134675, ; hash 0x38a1e793, from name: libaot-System.Drawing.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.77_name, ; name: libaot-System.Drawing.dll.so
		ptr null; void* handle (0x0)
	}, ; 145
	%struct.DSOCacheEntry {
		i64 955402788, ; hash 0x38f24a24, from name: Newtonsoft.Json
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.34_name, ; name: libaot-Newtonsoft.Json.dll.so
		ptr null; void* handle (0x0)
	}, ; 146
	%struct.DSOCacheEntry {
		i64 965570903, ; hash 0x398d7157, from name: libaot-System
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.113_name, ; name: libaot-System.dll.so
		ptr null; void* handle (0x0)
	}, ; 147
	%struct.DSOCacheEntry {
		i64 975874589, ; hash 0x3a2aaa1d, from name: System.Xml.XDocument
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.112_name, ; name: libaot-System.Xml.XDocument.dll.so
		ptr null; void* handle (0x0)
	}, ; 148
	%struct.DSOCacheEntry {
		i64 981249547, ; hash 0x3a7cae0b, from name: Xamarin.AndroidX.Browser.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.59_name, ; name: libaot-Xamarin.AndroidX.Browser.dll.so
		ptr null; void* handle (0x0)
	}, ; 149
	%struct.DSOCacheEntry {
		i64 983724495, ; hash 0x3aa271cf, from name: libaot-System.Private.Xml.Linq
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.94_name, ; name: libaot-System.Private.Xml.Linq.dll.so
		ptr null; void* handle (0x0)
	}, ; 150
	%struct.DSOCacheEntry {
		i64 991024368, ; hash 0x3b11d4f0, from name: aot-System.ComponentModel.TypeConverter
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.68_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle (0x0)
	}, ; 151
	%struct.DSOCacheEntry {
		i64 992239438, ; hash 0x3b245f4e, from name: aot-Newtonsoft.Json
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.34_name, ; name: libaot-Newtonsoft.Json.dll.so
		ptr null; void* handle (0x0)
	}, ; 152
	%struct.DSOCacheEntry {
		i64 1000172987, ; hash 0x3b9d6dbb, from name: libaot-System.Xml.ReaderWriter
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.111_name, ; name: libaot-System.Xml.ReaderWriter.dll.so
		ptr null; void* handle (0x0)
	}, ; 153
	%struct.DSOCacheEntry {
		i64 1000318620, ; hash 0x3b9fa69c, from name: libaot-System.Net.Http.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.84_name, ; name: libaot-System.Net.Http.dll.so
		ptr null; void* handle (0x0)
	}, ; 154
	%struct.DSOCacheEntry {
		i64 1007127721, ; hash 0x3c078ca9, from name: libTrimble.Ssi.Interfaces.Common
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.11_name, ; name: libTrimble.Ssi.Interfaces.Common.so
		ptr null; void* handle (0x0)
	}, ; 155
	%struct.DSOCacheEntry {
		i64 1018578900, ; hash 0x3cb647d4, from name: libaot-Trimble.EMPOWER.Manager.Droid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.48_name, ; name: libaot-Trimble.EMPOWER.Manager.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 156
	%struct.DSOCacheEntry {
		i64 1019214401, ; hash 0x3cbffa41, from name: System.Drawing
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.77_name, ; name: libaot-System.Drawing.dll.so
		ptr null; void* handle (0x0)
	}, ; 157
	%struct.DSOCacheEntry {
		i64 1034646685, ; hash 0x3dab749d, from name: Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.Android
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.49_name, ; name: libaot-Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.Android.dll.so
		ptr null; void* handle (0x0)
	}, ; 158
	%struct.DSOCacheEntry {
		i64 1059134792, ; hash 0x3f211d48, from name: libaot-Google.Protobuf
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.33_name, ; name: libaot-Google.Protobuf.dll.so
		ptr null; void* handle (0x0)
	}, ; 159
	%struct.DSOCacheEntry {
		i64 1076071578, ; hash 0x40238c9a, from name: libaot-Microsoft.CSharp
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.62_name, ; name: libaot-Microsoft.CSharp.dll.so
		ptr null; void* handle (0x0)
	}, ; 160
	%struct.DSOCacheEntry {
		i64 1082857460, ; hash 0x408b17f4, from name: System.ComponentModel.TypeConverter
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.68_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle (0x0)
	}, ; 161
	%struct.DSOCacheEntry {
		i64 1089644730, ; hash 0x40f2a8ba, from name: libaot-Trimble.Ssi.DriverCommon.Core.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.40_name, ; name: libaot-Trimble.Ssi.DriverCommon.Core.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 162
	%struct.DSOCacheEntry {
		i64 1092904634, ; hash 0x412466ba, from name: aot-Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.JavaBindings.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.50_name, ; name: libaot-Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.JavaBindings.dll.so
		ptr null; void* handle (0x0)
	}, ; 163
	%struct.DSOCacheEntry {
		i64 1098259244, ; hash 0x41761b2c, from name: System
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.113_name, ; name: libaot-System.dll.so
		ptr null; void* handle (0x0)
	}, ; 164
	%struct.DSOCacheEntry {
		i64 1098773455, ; hash 0x417df3cf, from name: aot-Trimble.Ssi.Driver.CarpoBased.Driver.SP80.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.52_name, ; name: libaot-Trimble.Ssi.Driver.CarpoBased.Driver.SP80.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 165
	%struct.DSOCacheEntry {
		i64 1107286201, ; hash 0x41ffd8b9, from name: libaot-System.Formats.Asn1
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.78_name, ; name: libaot-System.Formats.Asn1.dll.so
		ptr null; void* handle (0x0)
	}, ; 166
	%struct.DSOCacheEntry {
		i64 1121769208, ; hash 0x42dcd6f8, from name: CsdManagement.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.1_name, ; name: libCsdManagement.so
		ptr null; void* handle (0x0)
	}, ; 167
	%struct.DSOCacheEntry {
		i64 1139298538, ; hash 0x43e850ea, from name: libaot-Trimble.Ssi.DriverManagement.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.42_name, ; name: libaot-Trimble.Ssi.DriverManagement.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 168
	%struct.DSOCacheEntry {
		i64 1141279138, ; hash 0x440689a2, from name: libaot-System.Core
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.71_name, ; name: libaot-System.Core.dll.so
		ptr null; void* handle (0x0)
	}, ; 169
	%struct.DSOCacheEntry {
		i64 1142762167, ; hash 0x441d2ab7, from name: libaot-Trimble.Ssi.Core
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.39_name, ; name: libaot-Trimble.Ssi.Core.dll.so
		ptr null; void* handle (0x0)
	}, ; 170
	%struct.DSOCacheEntry {
		i64 1144657884, ; hash 0x443a17dc, from name: aot-System.Diagnostics.DiagnosticSource
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.73_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle (0x0)
	}, ; 171
	%struct.DSOCacheEntry {
		i64 1152604388, ; hash 0x44b358e4, from name: EM940Lib-Mono-Android.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.32_name, ; name: libaot-EM940Lib-Mono-Android.dll.so
		ptr null; void* handle (0x0)
	}, ; 172
	%struct.DSOCacheEntry {
		i64 1158083819, ; hash 0x4506f4eb, from name: libaot-System.Net.Requests.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.87_name, ; name: libaot-System.Net.Requests.dll.so
		ptr null; void* handle (0x0)
	}, ; 173
	%struct.DSOCacheEntry {
		i64 1163002600, ; hash 0x455202e8, from name: libaot-System.Collections.Specialized
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.65_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle (0x0)
	}, ; 174
	%struct.DSOCacheEntry {
		i64 1163599977, ; hash 0x455b2069, from name: aot-Trimble.Ssi.Driver.MockGnss.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.53_name, ; name: libaot-Trimble.Ssi.Driver.MockGnss.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 175
	%struct.DSOCacheEntry {
		i64 1166903420, ; hash 0x458d887c, from name: System.Collections.Concurrent.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.63_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle (0x0)
	}, ; 176
	%struct.DSOCacheEntry {
		i64 1166987620, ; hash 0x458ed164, from name: Trimble.Ssi.Drivers.Common.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.44_name, ; name: libaot-Trimble.Ssi.Drivers.Common.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 177
	%struct.DSOCacheEntry {
		i64 1168283859, ; hash 0x45a298d3, from name: libaot-System.Collections.NonGeneric.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.64_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle (0x0)
	}, ; 178
	%struct.DSOCacheEntry {
		i64 1169748878, ; hash 0x45b8f38e, from name: libaot-System.Net.Sockets
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.90_name, ; name: libaot-System.Net.Sockets.dll.so
		ptr null; void* handle (0x0)
	}, ; 179
	%struct.DSOCacheEntry {
		i64 1171294117, ; hash 0x45d087a5, from name: libTrimble.Ssi.CSWrapped.GNSS.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.15_name, ; name: libTrimble.Ssi.CSWrapped.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 180
	%struct.DSOCacheEntry {
		i64 1184428088, ; hash 0x4698f038, from name: Trimble.Ssi.DriverCommon.Core.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.40_name, ; name: libaot-Trimble.Ssi.DriverCommon.Core.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 181
	%struct.DSOCacheEntry {
		i64 1197858586, ; hash 0x4765df1a, from name: libaot-System.Drawing
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.77_name, ; name: libaot-System.Drawing.dll.so
		ptr null; void* handle (0x0)
	}, ; 182
	%struct.DSOCacheEntry {
		i64 1212723219, ; hash 0x4848b013, from name: Trimble.Licensing.Interfaces.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.36_name, ; name: libaot-Trimble.Licensing.Interfaces.dll.so
		ptr null; void* handle (0x0)
	}, ; 183
	%struct.DSOCacheEntry {
		i64 1221399229, ; hash 0x48cd12bd, from name: netstandard.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.115_name, ; name: libaot-netstandard.dll.so
		ptr null; void* handle (0x0)
	}, ; 184
	%struct.DSOCacheEntry {
		i64 1236931812, ; hash 0x49ba14e4, from name: libaot-Trimble.Ssi.DriverProxy.Common.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.43_name, ; name: libaot-Trimble.Ssi.DriverProxy.Common.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 185
	%struct.DSOCacheEntry {
		i64 1239876156, ; hash 0x49e7023c, from name: libaot-System.Reflection.Emit.Lightweight
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.97_name, ; name: libaot-System.Reflection.Emit.Lightweight.dll.so
		ptr null; void* handle (0x0)
	}, ; 186
	%struct.DSOCacheEntry {
		i64 1242664329, ; hash 0x4a118d89, from name: libaot-Trimble.Ssi.DriverCommon.Interfaces.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.41_name, ; name: libaot-Trimble.Ssi.DriverCommon.Interfaces.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 187
	%struct.DSOCacheEntry {
		i64 1248505390, ; hash 0x4a6aae2e, from name: libaot-System.Diagnostics.TraceSource
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.75_name, ; name: libaot-System.Diagnostics.TraceSource.dll.so
		ptr null; void* handle (0x0)
	}, ; 188
	%struct.DSOCacheEntry {
		i64 1251546541, ; hash 0x4a9915ad, from name: aot-Trimble.TDDTransformation.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.58_name, ; name: libaot-Trimble.TDDTransformation.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 189
	%struct.DSOCacheEntry {
		i64 1268771501, ; hash 0x4b9feaad, from name: aot-System.Diagnostics.DiagnosticSource.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.73_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle (0x0)
	}, ; 190
	%struct.DSOCacheEntry {
		i64 1270657563, ; hash 0x4bbcb21b, from name: System.Runtime.Serialization.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.102_name, ; name: libaot-System.Runtime.Serialization.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 191
	%struct.DSOCacheEntry {
		i64 1271389547, ; hash 0x4bc7dd6b, from name: aot-Google.Protobuf
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.33_name, ; name: libaot-Google.Protobuf.dll.so
		ptr null; void* handle (0x0)
	}, ; 192
	%struct.DSOCacheEntry {
		i64 1277412854, ; hash 0x4c23c5f6, from name: libaot-System.Core.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.71_name, ; name: libaot-System.Core.dll.so
		ptr null; void* handle (0x0)
	}, ; 193
	%struct.DSOCacheEntry {
		i64 1285465351, ; hash 0x4c9ea507, from name: aot-System.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.113_name, ; name: libaot-System.dll.so
		ptr null; void* handle (0x0)
	}, ; 194
	%struct.DSOCacheEntry {
		i64 1324164729, ; hash 0x4eed2679, from name: System.Linq
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.82_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle (0x0)
	}, ; 195
	%struct.DSOCacheEntry {
		i64 1326422064, ; hash 0x4f0f9830, from name: libaot-System.ObjectModel.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.92_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle (0x0)
	}, ; 196
	%struct.DSOCacheEntry {
		i64 1330538025, ; hash 0x4f4e6629, from name: libaot-System.ObjectModel
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.92_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle (0x0)
	}, ; 197
	%struct.DSOCacheEntry {
		i64 1351248141, ; hash 0x508a690d, from name: libaot-System.Drawing.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.76_name, ; name: libaot-System.Drawing.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 198
	%struct.DSOCacheEntry {
		i64 1356877886, ; hash 0x50e0503e, from name: aot-System.Threading.ThreadPool
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.108_name, ; name: libaot-System.Threading.ThreadPool.dll.so
		ptr null; void* handle (0x0)
	}, ; 199
	%struct.DSOCacheEntry {
		i64 1364629429, ; hash 0x515697b5, from name: System.Linq.Expressions.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.81_name, ; name: libaot-System.Linq.Expressions.dll.so
		ptr null; void* handle (0x0)
	}, ; 200
	%struct.DSOCacheEntry {
		i64 1369565496, ; hash 0x51a1e938, from name: System.Drawing.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.76_name, ; name: libaot-System.Drawing.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 201
	%struct.DSOCacheEntry {
		i64 1376113003, ; hash 0x5205d16b, from name: aot-Microsoft.CSharp.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.62_name, ; name: libaot-Microsoft.CSharp.dll.so
		ptr null; void* handle (0x0)
	}, ; 202
	%struct.DSOCacheEntry {
		i64 1376238345, ; hash 0x5207bb09, from name: aot-System.Private.CoreLib.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.120_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle (0x0)
	}, ; 203
	%struct.DSOCacheEntry {
		i64 1379827682, ; hash 0x523e7fe2, from name: aot-Trimble.EMPOWER.JavaBinding.Droid.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.47_name, ; name: libaot-Trimble.EMPOWER.JavaBinding.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 204
	%struct.DSOCacheEntry {
		i64 1383009688, ; hash 0x526f0d98, from name: aot-System.Net.Http.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.84_name, ; name: libaot-System.Net.Http.dll.so
		ptr null; void* handle (0x0)
	}, ; 205
	%struct.DSOCacheEntry {
		i64 1383267250, ; hash 0x5272fbb2, from name: aot-System.ObjectModel
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.92_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle (0x0)
	}, ; 206
	%struct.DSOCacheEntry {
		i64 1386166540, ; hash 0x529f390c, from name: libaot-System.Threading
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.109_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle (0x0)
	}, ; 207
	%struct.DSOCacheEntry {
		i64 1395919151, ; hash 0x5334092f, from name: libaot-System.ComponentModel.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.69_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle (0x0)
	}, ; 208
	%struct.DSOCacheEntry {
		i64 1397282299, ; hash 0x5348d5fb, from name: aot-Trimble.TDDTransformation.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.58_name, ; name: libaot-Trimble.TDDTransformation.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 209
	%struct.DSOCacheEntry {
		i64 1398864029, ; hash 0x5360f89d, from name: System.Security.Cryptography.Native.Android
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.24_name, ; name: libSystem.Security.Cryptography.Native.Android.so
		ptr null; void* handle (0x0)
	}, ; 210
	%struct.DSOCacheEntry {
		i64 1401968973, ; hash 0x5390594d, from name: System.Collections.Specialized.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.65_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle (0x0)
	}, ; 211
	%struct.DSOCacheEntry {
		i64 1411833736, ; hash 0x5426df88, from name: aot-Trimble.LicensingV2.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.37_name, ; name: libaot-Trimble.LicensingV2.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 212
	%struct.DSOCacheEntry {
		i64 1412515787, ; hash 0x543147cb, from name: ASerialPort
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.12_name, ; name: libASerialPort.so
		ptr null; void* handle (0x0)
	}, ; 213
	%struct.DSOCacheEntry {
		i64 1429933275, ; hash 0x553b0cdb, from name: libc++_shared
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.0_name, ; name: libc++_shared.so
		ptr null; void* handle (0x0)
	}, ; 214
	%struct.DSOCacheEntry {
		i64 1443565528, ; hash 0x560b0fd8, from name: aot-System.Drawing
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.77_name, ; name: libaot-System.Drawing.dll.so
		ptr null; void* handle (0x0)
	}, ; 215
	%struct.DSOCacheEntry {
		i64 1445980684, ; hash 0x562fea0c, from name: System.Reflection.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.98_name, ; name: libaot-System.Reflection.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 216
	%struct.DSOCacheEntry {
		i64 1450763449, ; hash 0x5678e4b9, from name: aot-System.Diagnostics.TraceSource.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.75_name, ; name: libaot-System.Diagnostics.TraceSource.dll.so
		ptr null; void* handle (0x0)
	}, ; 217
	%struct.DSOCacheEntry {
		i64 1457035958, ; hash 0x56d89ab6, from name: libaot-netstandard.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.115_name, ; name: libaot-netstandard.dll.so
		ptr null; void* handle (0x0)
	}, ; 218
	%struct.DSOCacheEntry {
		i64 1457202274, ; hash 0x56db2462, from name: aot-System.Collections.NonGeneric
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.64_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle (0x0)
	}, ; 219
	%struct.DSOCacheEntry {
		i64 1478410651, ; hash 0x581ec19b, from name: libaot-_Microsoft.Android.Resource.Designer
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.28_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle (0x0)
	}, ; 220
	%struct.DSOCacheEntry {
		i64 1478865992, ; hash 0x5825b448, from name: libmono-component-marshal-ilgen
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.25_name, ; name: libmono-component-marshal-ilgen.so
		ptr null; void* handle (0x0)
	}, ; 221
	%struct.DSOCacheEntry {
		i64 1482974588, ; hash 0x5864657c, from name: aot-System.Reflection.Emit.Lightweight.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.97_name, ; name: libaot-System.Reflection.Emit.Lightweight.dll.so
		ptr null; void* handle (0x0)
	}, ; 222
	%struct.DSOCacheEntry {
		i64 1483886350, ; hash 0x58724f0e, from name: System.Runtime.Numerics.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.100_name, ; name: libaot-System.Runtime.Numerics.dll.so
		ptr null; void* handle (0x0)
	}, ; 223
	%struct.DSOCacheEntry {
		i64 1486090293, ; hash 0x5893f035, from name: libTrimble.Ssi.Driver.CarpoBased.GNSS
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.18_name, ; name: libTrimble.Ssi.Driver.CarpoBased.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 224
	%struct.DSOCacheEntry {
		i64 1487037785, ; hash 0x58a26559, from name: libaot-Trimble.Licensing.Interfaces.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.36_name, ; name: libaot-Trimble.Licensing.Interfaces.dll.so
		ptr null; void* handle (0x0)
	}, ; 225
	%struct.DSOCacheEntry {
		i64 1503765866, ; hash 0x59a1a56a, from name: aot-System.Runtime
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.103_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle (0x0)
	}, ; 226
	%struct.DSOCacheEntry {
		i64 1504025360, ; hash 0x59a59b10, from name: libTrimble.Ssi.Driver.CarpoBased.Driver.RSeries
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.16_name, ; name: libTrimble.Ssi.Driver.CarpoBased.Driver.RSeries.so
		ptr null; void* handle (0x0)
	}, ; 227
	%struct.DSOCacheEntry {
		i64 1505467903, ; hash 0x59bb9dff, from name: aot-System.Xml.Linq
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.110_name, ; name: libaot-System.Xml.Linq.dll.so
		ptr null; void* handle (0x0)
	}, ; 228
	%struct.DSOCacheEntry {
		i64 1507595742, ; hash 0x59dc15de, from name: aot-Trimble.Licensing.Interfaces
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.36_name, ; name: libaot-Trimble.Licensing.Interfaces.dll.so
		ptr null; void* handle (0x0)
	}, ; 229
	%struct.DSOCacheEntry {
		i64 1518218766, ; hash 0x5a7e2e0e, from name: libaot-System.Collections.NonGeneric
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.64_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle (0x0)
	}, ; 230
	%struct.DSOCacheEntry {
		i64 1525880992, ; hash 0x5af318a0, from name: aot-System.Net.ServicePoint.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.89_name, ; name: libaot-System.Net.ServicePoint.dll.so
		ptr null; void* handle (0x0)
	}, ; 231
	%struct.DSOCacheEntry {
		i64 1536876128, ; hash 0x5b9ade60, from name: libSystem.Native
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.23_name, ; name: libSystem.Native.so
		ptr null; void* handle (0x0)
	}, ; 232
	%struct.DSOCacheEntry {
		i64 1540666863, ; hash 0x5bd4b5ef, from name: aot-System.Runtime.Serialization.Formatters
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.101_name, ; name: libaot-System.Runtime.Serialization.Formatters.dll.so
		ptr null; void* handle (0x0)
	}, ; 233
	%struct.DSOCacheEntry {
		i64 1566308565, ; hash 0x5d5bf8d5, from name: System.Xml.XDocument.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.112_name, ; name: libaot-System.Xml.XDocument.dll.so
		ptr null; void* handle (0x0)
	}, ; 234
	%struct.DSOCacheEntry {
		i64 1577700384, ; hash 0x5e09cc20, from name: libTrimble.Ssi.Driver.DriverCommon.GNSS
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.19_name, ; name: libTrimble.Ssi.Driver.DriverCommon.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 235
	%struct.DSOCacheEntry {
		i64 1609480766, ; hash 0x5feeba3e, from name: Google.Protobuf.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.33_name, ; name: libaot-Google.Protobuf.dll.so
		ptr null; void* handle (0x0)
	}, ; 236
	%struct.DSOCacheEntry {
		i64 1623681221, ; hash 0x60c768c5, from name: aot-Trimble.EMPOWER.Manager.Droid.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.48_name, ; name: libaot-Trimble.EMPOWER.Manager.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 237
	%struct.DSOCacheEntry {
		i64 1636331626, ; hash 0x6188706a, from name: System.Reflection.Emit.Lightweight.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.97_name, ; name: libaot-System.Reflection.Emit.Lightweight.dll.so
		ptr null; void* handle (0x0)
	}, ; 238
	%struct.DSOCacheEntry {
		i64 1636385547, ; hash 0x6189430b, from name: Mono.Android.Runtime.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.118_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle (0x0)
	}, ; 239
	%struct.DSOCacheEntry {
		i64 1637436415, ; hash 0x61994bff, from name: aot-System.Private.Xml.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.95_name, ; name: libaot-System.Private.Xml.dll.so
		ptr null; void* handle (0x0)
	}, ; 240
	%struct.DSOCacheEntry {
		i64 1639986890, ; hash 0x61c036ca, from name: System.Text.RegularExpressions
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.106_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle (0x0)
	}, ; 241
	%struct.DSOCacheEntry {
		i64 1640618341, ; hash 0x61c9d965, from name: libTrimble.Ssi.CSWrapped.Common
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.6_name, ; name: libTrimble.Ssi.CSWrapped.Common.so
		ptr null; void* handle (0x0)
	}, ; 242
	%struct.DSOCacheEntry {
		i64 1642466345, ; hash 0x61e60c29, from name: Trimble.EMPOWER.Manager.Droid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.48_name, ; name: libaot-Trimble.EMPOWER.Manager.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 243
	%struct.DSOCacheEntry {
		i64 1643369834, ; hash 0x61f3d56a, from name: aot-System.Linq.Expressions
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.81_name, ; name: libaot-System.Linq.Expressions.dll.so
		ptr null; void* handle (0x0)
	}, ; 244
	%struct.DSOCacheEntry {
		i64 1651622786, ; hash 0x6271c382, from name: aot-Xamarin.AndroidX.Core
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.60_name, ; name: libaot-Xamarin.AndroidX.Core.dll.so
		ptr null; void* handle (0x0)
	}, ; 245
	%struct.DSOCacheEntry {
		i64 1657153582, ; hash 0x62c6282e, from name: System.Runtime
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.103_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle (0x0)
	}, ; 246
	%struct.DSOCacheEntry {
		i64 1679769178, ; hash 0x641f3e5a, from name: System.Security.Cryptography
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.104_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle (0x0)
	}, ; 247
	%struct.DSOCacheEntry {
		i64 1695398585, ; hash 0x650dbab9, from name: DRV_TrimbleCommon.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.5_name, ; name: libDRV_TrimbleCommon.so
		ptr null; void* handle (0x0)
	}, ; 248
	%struct.DSOCacheEntry {
		i64 1696714898, ; hash 0x6521d092, from name: libaot-Trimble.Ssi.Interfaces.Gnss.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.57_name, ; name: libaot-Trimble.Ssi.Interfaces.Gnss.dll.so
		ptr null; void* handle (0x0)
	}, ; 249
	%struct.DSOCacheEntry {
		i64 1704313042, ; hash 0x6595c0d2, from name: Trimble.Ssi.Interfaces
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.45_name, ; name: libaot-Trimble.Ssi.Interfaces.dll.so
		ptr null; void* handle (0x0)
	}, ; 250
	%struct.DSOCacheEntry {
		i64 1707413231, ; hash 0x65c50eef, from name: aot-Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.Android.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.49_name, ; name: libaot-Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.Android.dll.so
		ptr null; void* handle (0x0)
	}, ; 251
	%struct.DSOCacheEntry {
		i64 1712141574, ; hash 0x660d3506, from name: aot-System.Diagnostics.StackTrace.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.74_name, ; name: libaot-System.Diagnostics.StackTrace.dll.so
		ptr null; void* handle (0x0)
	}, ; 252
	%struct.DSOCacheEntry {
		i64 1719268936, ; hash 0x6679f648, from name: aot-Trimble.Ssi.DriverCommon.Core.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.40_name, ; name: libaot-Trimble.Ssi.DriverCommon.Core.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 253
	%struct.DSOCacheEntry {
		i64 1724865103, ; hash 0x66cf5a4f, from name: aot-Trimble.Ssi.Interfaces
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.45_name, ; name: libaot-Trimble.Ssi.Interfaces.dll.so
		ptr null; void* handle (0x0)
	}, ; 254
	%struct.DSOCacheEntry {
		i64 1739160976, ; hash 0x67a97d90, from name: libaot-System.Diagnostics.StackTrace
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.74_name, ; name: libaot-System.Diagnostics.StackTrace.dll.so
		ptr null; void* handle (0x0)
	}, ; 255
	%struct.DSOCacheEntry {
		i64 1739531330, ; hash 0x67af2442, from name: libTrimble.Ssi.Driver.DriverCommon.Common.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.8_name, ; name: libTrimble.Ssi.Driver.DriverCommon.Common.so
		ptr null; void* handle (0x0)
	}, ; 256
	%struct.DSOCacheEntry {
		i64 1740020094, ; hash 0x67b6997e, from name: System.Xml.Linq.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.110_name, ; name: libaot-System.Xml.Linq.dll.so
		ptr null; void* handle (0x0)
	}, ; 257
	%struct.DSOCacheEntry {
		i64 1740244022, ; hash 0x67ba0436, from name: Trimble.Ssi.Driver.CarpoBased.Common.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.7_name, ; name: libTrimble.Ssi.Driver.CarpoBased.Common.so
		ptr null; void* handle (0x0)
	}, ; 258
	%struct.DSOCacheEntry {
		i64 1746316138, ; hash 0x6816ab6a, from name: Mono.Android.Export
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.117_name, ; name: libaot-Mono.Android.Export.dll.so
		ptr null; void* handle (0x0)
	}, ; 259
	%struct.DSOCacheEntry {
		i64 1746885852, ; hash 0x681f5cdc, from name: libaot-System.Collections.Concurrent.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.63_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle (0x0)
	}, ; 260
	%struct.DSOCacheEntry {
		i64 1756251935, ; hash 0x68ae471f, from name: aot-System.Drawing.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.76_name, ; name: libaot-System.Drawing.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 261
	%struct.DSOCacheEntry {
		i64 1766888468, ; hash 0x69509414, from name: aot-AltGeoRelayService.Droid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.31_name, ; name: libaot-AltGeoRelayService.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 262
	%struct.DSOCacheEntry {
		i64 1770694025, ; hash 0x698aa589, from name: libaot-System.Text.Encoding.Extensions
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.105_name, ; name: libaot-System.Text.Encoding.Extensions.dll.so
		ptr null; void* handle (0x0)
	}, ; 263
	%struct.DSOCacheEntry {
		i64 1780104889, ; hash 0x6a1a3eb9, from name: Trimble.Ssi.Driver.DriverCommon.GNSS
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.19_name, ; name: libTrimble.Ssi.Driver.DriverCommon.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 264
	%struct.DSOCacheEntry {
		i64 1780824582, ; hash 0x6a253a06, from name: libaot-System.Diagnostics.StackTrace.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.74_name, ; name: libaot-System.Diagnostics.StackTrace.dll.so
		ptr null; void* handle (0x0)
	}, ; 265
	%struct.DSOCacheEntry {
		i64 1786790806, ; hash 0x6a804396, from name: libaot-System.Reflection.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.98_name, ; name: libaot-System.Reflection.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 266
	%struct.DSOCacheEntry {
		i64 1795527004, ; hash 0x6b05915c, from name: libTrimble.Ssi.Interfaces.Common.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.11_name, ; name: libTrimble.Ssi.Interfaces.Common.so
		ptr null; void* handle (0x0)
	}, ; 267
	%struct.DSOCacheEntry {
		i64 1812000443, ; hash 0x6c00eebb, from name: libaot-Trimble.Ssi.Interfaces.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.45_name, ; name: libaot-Trimble.Ssi.Interfaces.dll.so
		ptr null; void* handle (0x0)
	}, ; 268
	%struct.DSOCacheEntry {
		i64 1815941555, ; hash 0x6c3d11b3, from name: libGeodeticX
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.2_name, ; name: libGeodeticX.so
		ptr null; void* handle (0x0)
	}, ; 269
	%struct.DSOCacheEntry {
		i64 1824175904, ; hash 0x6cbab720, from name: System.Text.Encoding.Extensions
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.105_name, ; name: libaot-System.Text.Encoding.Extensions.dll.so
		ptr null; void* handle (0x0)
	}, ; 270
	%struct.DSOCacheEntry {
		i64 1824722060, ; hash 0x6cc30c8c, from name: System.Runtime.Serialization.Formatters
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.101_name, ; name: libaot-System.Runtime.Serialization.Formatters.dll.so
		ptr null; void* handle (0x0)
	}, ; 271
	%struct.DSOCacheEntry {
		i64 1856510251, ; hash 0x6ea8192b, from name: libaot-System.Runtime.Serialization.Formatters.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.101_name, ; name: libaot-System.Runtime.Serialization.Formatters.dll.so
		ptr null; void* handle (0x0)
	}, ; 272
	%struct.DSOCacheEntry {
		i64 1858542181, ; hash 0x6ec71a65, from name: System.Linq.Expressions
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.81_name, ; name: libaot-System.Linq.Expressions.dll.so
		ptr null; void* handle (0x0)
	}, ; 273
	%struct.DSOCacheEntry {
		i64 1870277092, ; hash 0x6f7a29e4, from name: System.Reflection.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.98_name, ; name: libaot-System.Reflection.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 274
	%struct.DSOCacheEntry {
		i64 1871505641, ; hash 0x6f8ce8e9, from name: libaot-Trimble.Ssi.DriverCommon.Core.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.40_name, ; name: libaot-Trimble.Ssi.DriverCommon.Core.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 275
	%struct.DSOCacheEntry {
		i64 1883618565, ; hash 0x7045bd05, from name: aot-System.Runtime.Serialization.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.102_name, ; name: libaot-System.Runtime.Serialization.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 276
	%struct.DSOCacheEntry {
		i64 1887748499, ; hash 0x7084c193, from name: Trimble.Ssi.Driver.CarpoBased.Driver.SP80
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.17_name, ; name: libTrimble.Ssi.Driver.CarpoBased.Driver.SP80.so
		ptr null; void* handle (0x0)
	}, ; 277
	%struct.DSOCacheEntry {
		i64 1896169914, ; hash 0x710541ba, from name: aot-System.IO.Compression.Brotli.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.79_name, ; name: libaot-System.IO.Compression.Brotli.dll.so
		ptr null; void* handle (0x0)
	}, ; 278
	%struct.DSOCacheEntry {
		i64 1900739026, ; hash 0x714af9d2, from name: libaot-System.Net.Http
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.84_name, ; name: libaot-System.Net.Http.dll.so
		ptr null; void* handle (0x0)
	}, ; 279
	%struct.DSOCacheEntry {
		i64 1902824622, ; hash 0x716accae, from name: libaot-System.Xml.ReaderWriter.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.111_name, ; name: libaot-System.Xml.ReaderWriter.dll.so
		ptr null; void* handle (0x0)
	}, ; 280
	%struct.DSOCacheEntry {
		i64 1911147258, ; hash 0x71e9cafa, from name: aot-System.Security.Cryptography.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.104_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle (0x0)
	}, ; 281
	%struct.DSOCacheEntry {
		i64 1915179509, ; hash 0x722751f5, from name: System.Data.Common.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.72_name, ; name: libaot-System.Data.Common.dll.so
		ptr null; void* handle (0x0)
	}, ; 282
	%struct.DSOCacheEntry {
		i64 1917270479, ; hash 0x724739cf, from name: libaot-System.ComponentModel.TypeConverter
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.68_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle (0x0)
	}, ; 283
	%struct.DSOCacheEntry {
		i64 1939226026, ; hash 0x73963daa, from name: aot-System.Console
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.70_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle (0x0)
	}, ; 284
	%struct.DSOCacheEntry {
		i64 1939592360, ; hash 0x739bd4a8, from name: System.Private.Xml.Linq
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.94_name, ; name: libaot-System.Private.Xml.Linq.dll.so
		ptr null; void* handle (0x0)
	}, ; 285
	%struct.DSOCacheEntry {
		i64 1944918660, ; hash 0x73ed1a84, from name: Trimble.Ssi.DriverCommon.Core.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.40_name, ; name: libaot-Trimble.Ssi.DriverCommon.Core.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 286
	%struct.DSOCacheEntry {
		i64 1953900240, ; hash 0x747626d0, from name: aot-System.Private.Uri.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.93_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle (0x0)
	}, ; 287
	%struct.DSOCacheEntry {
		i64 1954803200, ; hash 0x7483ee00, from name: libaot-System.Console
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.70_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle (0x0)
	}, ; 288
	%struct.DSOCacheEntry {
		i64 1959705688, ; hash 0x74cebc58, from name: System.IO.Compression.Native
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.22_name, ; name: libSystem.IO.Compression.Native.so
		ptr null; void* handle (0x0)
	}, ; 289
	%struct.DSOCacheEntry {
		i64 1961541945, ; hash 0x74eac139, from name: aot-System.ComponentModel
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.69_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle (0x0)
	}, ; 290
	%struct.DSOCacheEntry {
		i64 1970157169, ; hash 0x756e3671, from name: System.ComponentModel.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.67_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 291
	%struct.DSOCacheEntry {
		i64 1971847110, ; hash 0x7587ffc6, from name: aot-System.Linq.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.82_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle (0x0)
	}, ; 292
	%struct.DSOCacheEntry {
		i64 1975492760, ; hash 0x75bfa098, from name: libaot-Java.Interop
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.116_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle (0x0)
	}, ; 293
	%struct.DSOCacheEntry {
		i64 1977177567, ; hash 0x75d955df, from name: libaot-Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.JavaBindings.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.50_name, ; name: libaot-Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.JavaBindings.dll.so
		ptr null; void* handle (0x0)
	}, ; 294
	%struct.DSOCacheEntry {
		i64 1998620087, ; hash 0x772085b7, from name: libaot-System.Runtime.Serialization.Formatters
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.101_name, ; name: libaot-System.Runtime.Serialization.Formatters.dll.so
		ptr null; void* handle (0x0)
	}, ; 295
	%struct.DSOCacheEntry {
		i64 2009026942, ; hash 0x77bf517e, from name: DRV_SP80
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.13_name, ; name: libDRV_SP80.so
		ptr null; void* handle (0x0)
	}, ; 296
	%struct.DSOCacheEntry {
		i64 2009571110, ; hash 0x77c79f26, from name: System.Diagnostics.DiagnosticSource.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.73_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle (0x0)
	}, ; 297
	%struct.DSOCacheEntry {
		i64 2014753083, ; hash 0x7816b13b, from name: aot-_Microsoft.Android.Resource.Designer.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.28_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle (0x0)
	}, ; 298
	%struct.DSOCacheEntry {
		i64 2018703865, ; hash 0x7852f9f9, from name: Trimble.Ssi.Driver.CarpoBased.Common
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.7_name, ; name: libTrimble.Ssi.Driver.CarpoBased.Common.so
		ptr null; void* handle (0x0)
	}, ; 299
	%struct.DSOCacheEntry {
		i64 2043472270, ; hash 0x79cce98e, from name: aot-System.ComponentModel.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.69_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle (0x0)
	}, ; 300
	%struct.DSOCacheEntry {
		i64 2044108986, ; hash 0x79d6a0ba, from name: libSystem.Native.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.23_name, ; name: libSystem.Native.so
		ptr null; void* handle (0x0)
	}, ; 301
	%struct.DSOCacheEntry {
		i64 2045470958, ; hash 0x79eb68ee, from name: System.Private.Xml
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.95_name, ; name: libaot-System.Private.Xml.dll.so
		ptr null; void* handle (0x0)
	}, ; 302
	%struct.DSOCacheEntry {
		i64 2046194820, ; hash 0x79f67484, from name: libaot-System.Xml.XDocument.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.112_name, ; name: libaot-System.Xml.XDocument.dll.so
		ptr null; void* handle (0x0)
	}, ; 303
	%struct.DSOCacheEntry {
		i64 2054923148, ; hash 0x7a7ba38c, from name: aot-System.Reflection.Emit.ILGeneration.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.96_name, ; name: libaot-System.Reflection.Emit.ILGeneration.dll.so
		ptr null; void* handle (0x0)
	}, ; 304
	%struct.DSOCacheEntry {
		i64 2058803265, ; hash 0x7ab6d841, from name: libaot-Trimble.Ssi.DriverProxy.Gnss.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.55_name, ; name: libaot-Trimble.Ssi.DriverProxy.Gnss.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 305
	%struct.DSOCacheEntry {
		i64 2062437509, ; hash 0x7aee4c85, from name: aot-Trimble.Ssi.DriverProxy.Common.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.43_name, ; name: libaot-Trimble.Ssi.DriverProxy.Common.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 306
	%struct.DSOCacheEntry {
		i64 2065818172, ; hash 0x7b21e23c, from name: libaot-System.Net.Security.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.88_name, ; name: libaot-System.Net.Security.dll.so
		ptr null; void* handle (0x0)
	}, ; 307
	%struct.DSOCacheEntry {
		i64 2070888862, ; hash 0x7b6f419e, from name: System.Diagnostics.TraceSource
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.75_name, ; name: libaot-System.Diagnostics.TraceSource.dll.so
		ptr null; void* handle (0x0)
	}, ; 308
	%struct.DSOCacheEntry {
		i64 2072777569, ; hash 0x7b8c1361, from name: System.IO.Compression.Native.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.22_name, ; name: libSystem.IO.Compression.Native.so
		ptr null; void* handle (0x0)
	}, ; 309
	%struct.DSOCacheEntry {
		i64 2078610628, ; hash 0x7be514c4, from name: libmono-component-marshal-ilgen.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.25_name, ; name: libmono-component-marshal-ilgen.so
		ptr null; void* handle (0x0)
	}, ; 310
	%struct.DSOCacheEntry {
		i64 2082659839, ; hash 0x7c22ddff, from name: Microsoft.CSharp.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.62_name, ; name: libaot-Microsoft.CSharp.dll.so
		ptr null; void* handle (0x0)
	}, ; 311
	%struct.DSOCacheEntry {
		i64 2083657637, ; hash 0x7c3217a5, from name: Trimble.Ssi.Components.Core
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.38_name, ; name: libaot-Trimble.Ssi.Components.Core.dll.so
		ptr null; void* handle (0x0)
	}, ; 312
	%struct.DSOCacheEntry {
		i64 2094311079, ; hash 0x7cd4a6a7, from name: aot-System.Runtime.Serialization.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.102_name, ; name: libaot-System.Runtime.Serialization.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 313
	%struct.DSOCacheEntry {
		i64 2099204676, ; hash 0x7d1f5244, from name: Trimble.Ssi.Driver.CarpoBased.GNSS
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.18_name, ; name: libTrimble.Ssi.Driver.CarpoBased.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 314
	%struct.DSOCacheEntry {
		i64 2100120213, ; hash 0x7d2d4a95, from name: aot-System.Runtime.Serialization.Formatters.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.101_name, ; name: libaot-System.Runtime.Serialization.Formatters.dll.so
		ptr null; void* handle (0x0)
	}, ; 315
	%struct.DSOCacheEntry {
		i64 2101192894, ; hash 0x7d3da8be, from name: libSystem.Security.Cryptography.Native.Android.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.24_name, ; name: libSystem.Security.Cryptography.Native.Android.so
		ptr null; void* handle (0x0)
	}, ; 316
	%struct.DSOCacheEntry {
		i64 2102860745, ; hash 0x7d571bc9, from name: Trimble.Ssi.DriverCommon.Interfaces.Gnss.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.54_name, ; name: libaot-Trimble.Ssi.DriverCommon.Interfaces.Gnss.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 317
	%struct.DSOCacheEntry {
		i64 2115272055, ; hash 0x7e147d77, from name: Trimble.Ssi.Driver.CarpoBased.Driver.RSeries.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.51_name, ; name: libaot-Trimble.Ssi.Driver.CarpoBased.Driver.RSeries.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 318
	%struct.DSOCacheEntry {
		i64 2115594265, ; hash 0x7e196819, from name: aot-System.Collections.Concurrent
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.63_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle (0x0)
	}, ; 319
	%struct.DSOCacheEntry {
		i64 2119570579, ; hash 0x7e561493, from name: libaot-Java.Interop.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.116_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle (0x0)
	}, ; 320
	%struct.DSOCacheEntry {
		i64 2127167465, ; hash 0x7ec9ffe9, from name: System.Console
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.70_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle (0x0)
	}, ; 321
	%struct.DSOCacheEntry {
		i64 2139998343, ; hash 0x7f8dc887, from name: libTrimble.Ssi.Driver.Mock.GNSS.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.20_name, ; name: libTrimble.Ssi.Driver.Mock.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 322
	%struct.DSOCacheEntry {
		i64 2142473426, ; hash 0x7fb38cd2, from name: System.Collections.Specialized
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.65_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle (0x0)
	}, ; 323
	%struct.DSOCacheEntry {
		i64 2142730349, ; hash 0x7fb7786d, from name: libaot-Trimble.EMPOWER.Manager.Droid.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.48_name, ; name: libaot-Trimble.EMPOWER.Manager.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 324
	%struct.DSOCacheEntry {
		i64 2149461079, ; hash 0x801e2c57, from name: aot-System.Threading.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.109_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle (0x0)
	}, ; 325
	%struct.DSOCacheEntry {
		i64 2165234468, ; hash 0x810edb24, from name: Trimble.Ssi.Driver.DriverCommon.Common
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.8_name, ; name: libTrimble.Ssi.Driver.DriverCommon.Common.so
		ptr null; void* handle (0x0)
	}, ; 326
	%struct.DSOCacheEntry {
		i64 2167720450, ; hash 0x8134ca02, from name: aot-System.Data.Common.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.72_name, ; name: libaot-System.Data.Common.dll.so
		ptr null; void* handle (0x0)
	}, ; 327
	%struct.DSOCacheEntry {
		i64 2170173082, ; hash 0x815a369a, from name: libaot-System.Private.Xml
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.95_name, ; name: libaot-System.Private.Xml.dll.so
		ptr null; void* handle (0x0)
	}, ; 328
	%struct.DSOCacheEntry {
		i64 2172943413, ; hash 0x81847c35, from name: libaot-System.ComponentModel.TypeConverter.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.68_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle (0x0)
	}, ; 329
	%struct.DSOCacheEntry {
		i64 2192436256, ; hash 0x82adec20, from name: Mono.Android.Export.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.117_name, ; name: libaot-Mono.Android.Export.dll.so
		ptr null; void* handle (0x0)
	}, ; 330
	%struct.DSOCacheEntry {
		i64 2201231467, ; hash 0x8334206b, from name: System.Net.Http
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.84_name, ; name: libaot-System.Net.Http.dll.so
		ptr null; void* handle (0x0)
	}, ; 331
	%struct.DSOCacheEntry {
		i64 2205126090, ; hash 0x836f8dca, from name: aot-CatalystFacade.NET.Droid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.30_name, ; name: libaot-CatalystFacade.NET.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 332
	%struct.DSOCacheEntry {
		i64 2205684377, ; hash 0x83781299, from name: aot-Google.Protobuf.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.33_name, ; name: libaot-Google.Protobuf.dll.so
		ptr null; void* handle (0x0)
	}, ; 333
	%struct.DSOCacheEntry {
		i64 2212031953, ; hash 0x83d8edd1, from name: libaot-System.Xml.Linq
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.110_name, ; name: libaot-System.Xml.Linq.dll.so
		ptr null; void* handle (0x0)
	}, ; 334
	%struct.DSOCacheEntry {
		i64 2217426333, ; hash 0x842b3d9d, from name: aot-System.Diagnostics.StackTrace
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.74_name, ; name: libaot-System.Diagnostics.StackTrace.dll.so
		ptr null; void* handle (0x0)
	}, ; 335
	%struct.DSOCacheEntry {
		i64 2223531549, ; hash 0x8488661d, from name: libaot-System.ComponentModel.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.67_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 336
	%struct.DSOCacheEntry {
		i64 2226594010, ; hash 0x84b720da, from name: Trimble.TDDTransformation.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.58_name, ; name: libaot-Trimble.TDDTransformation.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 337
	%struct.DSOCacheEntry {
		i64 2234028433, ; hash 0x85289191, from name: System.Reflection.Emit.ILGeneration.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.96_name, ; name: libaot-System.Reflection.Emit.ILGeneration.dll.so
		ptr null; void* handle (0x0)
	}, ; 338
	%struct.DSOCacheEntry {
		i64 2254027380, ; hash 0x8659ba74, from name: libaot-System.Xml.Linq.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.110_name, ; name: libaot-System.Xml.Linq.dll.so
		ptr null; void* handle (0x0)
	}, ; 339
	%struct.DSOCacheEntry {
		i64 2255628053, ; hash 0x86722715, from name: Trimble.Ssi.Driver.Mock.Common
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.9_name, ; name: libTrimble.Ssi.Driver.Mock.Common.so
		ptr null; void* handle (0x0)
	}, ; 340
	%struct.DSOCacheEntry {
		i64 2262974896, ; hash 0x86e241b0, from name: libaot-System.Runtime.Serialization.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.102_name, ; name: libaot-System.Runtime.Serialization.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 341
	%struct.DSOCacheEntry {
		i64 2272382800, ; hash 0x8771cf50, from name: System.Net.Sockets.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.90_name, ; name: libaot-System.Net.Sockets.dll.so
		ptr null; void* handle (0x0)
	}, ; 342
	%struct.DSOCacheEntry {
		i64 2279498149, ; hash 0x87de61a5, from name: libaot-System.Runtime.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.103_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle (0x0)
	}, ; 343
	%struct.DSOCacheEntry {
		i64 2295393955, ; hash 0x88d0eea3, from name: libDRV_TrimCom.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.14_name, ; name: libDRV_TrimCom.so
		ptr null; void* handle (0x0)
	}, ; 344
	%struct.DSOCacheEntry {
		i64 2295906218, ; hash 0x88d8bfaa, from name: System.Net.Sockets
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.90_name, ; name: libaot-System.Net.Sockets.dll.so
		ptr null; void* handle (0x0)
	}, ; 345
	%struct.DSOCacheEntry {
		i64 2300115772, ; hash 0x8918fb3c, from name: aot-Java.Interop.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.116_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle (0x0)
	}, ; 346
	%struct.DSOCacheEntry {
		i64 2313455944, ; hash 0x89e48948, from name: Trimble.Ssi.Driver.DriverCommon.GNSS.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.19_name, ; name: libTrimble.Ssi.Driver.DriverCommon.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 347
	%struct.DSOCacheEntry {
		i64 2315984125, ; hash 0x8a0b1cfd, from name: aot-System.Reflection.Emit.ILGeneration
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.96_name, ; name: libaot-System.Reflection.Emit.ILGeneration.dll.so
		ptr null; void* handle (0x0)
	}, ; 348
	%struct.DSOCacheEntry {
		i64 2323018821, ; hash 0x8a767445, from name: libDRV_SP80.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.13_name, ; name: libDRV_SP80.so
		ptr null; void* handle (0x0)
	}, ; 349
	%struct.DSOCacheEntry {
		i64 2323667891, ; hash 0x8a805bb3, from name: libaot-System.Data.Common
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.72_name, ; name: libaot-System.Data.Common.dll.so
		ptr null; void* handle (0x0)
	}, ; 350
	%struct.DSOCacheEntry {
		i64 2324192264, ; hash 0x8a885c08, from name: libTrimble.Ssi.Driver.CarpoBased.Common.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.7_name, ; name: libTrimble.Ssi.Driver.CarpoBased.Common.so
		ptr null; void* handle (0x0)
	}, ; 351
	%struct.DSOCacheEntry {
		i64 2327830411, ; hash 0x8abfdf8b, from name: System.Private.Xml.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.95_name, ; name: libaot-System.Private.Xml.dll.so
		ptr null; void* handle (0x0)
	}, ; 352
	%struct.DSOCacheEntry {
		i64 2344356833, ; hash 0x8bbc0be1, from name: libaot-System.Runtime.InteropServices.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.99_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle (0x0)
	}, ; 353
	%struct.DSOCacheEntry {
		i64 2353062107, ; hash 0x8c40e0db, from name: System.Net.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.86_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 354
	%struct.DSOCacheEntry {
		i64 2362663635, ; hash 0x8cd362d3, from name: libaot-netstandard
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.115_name, ; name: libaot-netstandard.dll.so
		ptr null; void* handle (0x0)
	}, ; 355
	%struct.DSOCacheEntry {
		i64 2384197275, ; hash 0x8e1bf69b, from name: libaot-System.Net.ServicePoint.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.89_name, ; name: libaot-System.Net.ServicePoint.dll.so
		ptr null; void* handle (0x0)
	}, ; 356
	%struct.DSOCacheEntry {
		i64 2389733863, ; hash 0x8e7071e7, from name: aot-System.Private.Xml
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.95_name, ; name: libaot-System.Private.Xml.dll.so
		ptr null; void* handle (0x0)
	}, ; 357
	%struct.DSOCacheEntry {
		i64 2403908980, ; hash 0x8f48bd74, from name: libaot-AIDLService.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.35_name, ; name: libaot-AIDLService.dll.so
		ptr null; void* handle (0x0)
	}, ; 358
	%struct.DSOCacheEntry {
		i64 2406593473, ; hash 0x8f71b3c1, from name: libaot-System.Runtime
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.103_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle (0x0)
	}, ; 359
	%struct.DSOCacheEntry {
		i64 2406870559, ; hash 0x8f75ee1f, from name: aot-System.Net.NameResolution
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.85_name, ; name: libaot-System.Net.NameResolution.dll.so
		ptr null; void* handle (0x0)
	}, ; 360
	%struct.DSOCacheEntry {
		i64 2408375621, ; hash 0x8f8ce545, from name: System.Formats.Asn1.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.78_name, ; name: libaot-System.Formats.Asn1.dll.so
		ptr null; void* handle (0x0)
	}, ; 361
	%struct.DSOCacheEntry {
		i64 2408509849, ; hash 0x8f8ef199, from name: libASerialPort
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.12_name, ; name: libASerialPort.so
		ptr null; void* handle (0x0)
	}, ; 362
	%struct.DSOCacheEntry {
		i64 2426026431, ; hash 0x909a39bf, from name: System.IO.Compression.Brotli.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.79_name, ; name: libaot-System.IO.Compression.Brotli.dll.so
		ptr null; void* handle (0x0)
	}, ; 363
	%struct.DSOCacheEntry {
		i64 2430427323, ; hash 0x90dd60bb, from name: Trimble.Ssi.DriverManagement.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.42_name, ; name: libaot-Trimble.Ssi.DriverManagement.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 364
	%struct.DSOCacheEntry {
		i64 2432891663, ; hash 0x9102fb0f, from name: aot-System.Text.RegularExpressions
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.106_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle (0x0)
	}, ; 365
	%struct.DSOCacheEntry {
		i64 2448201744, ; hash 0x91ec9810, from name: System.Private.CoreLib.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.120_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle (0x0)
	}, ; 366
	%struct.DSOCacheEntry {
		i64 2448937778, ; hash 0x91f7d332, from name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.73_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle (0x0)
	}, ; 367
	%struct.DSOCacheEntry {
		i64 2452809944, ; hash 0x9232e8d8, from name: aot-System.Linq
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.82_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle (0x0)
	}, ; 368
	%struct.DSOCacheEntry {
		i64 2454868146, ; hash 0x925250b2, from name: System.Diagnostics.StackTrace.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.74_name, ; name: libaot-System.Diagnostics.StackTrace.dll.so
		ptr null; void* handle (0x0)
	}, ; 369
	%struct.DSOCacheEntry {
		i64 2458563039, ; hash 0x928ab1df, from name: System.Collections.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.66_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle (0x0)
	}, ; 370
	%struct.DSOCacheEntry {
		i64 2473124778, ; hash 0x9368e3aa, from name: System.Threading.Thread.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.107_name, ; name: libaot-System.Threading.Thread.dll.so
		ptr null; void* handle (0x0)
	}, ; 371
	%struct.DSOCacheEntry {
		i64 2476399389, ; hash 0x939adb1d, from name: libTrimble.Ssi.Driver.CarpoBased.GNSS.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.18_name, ; name: libTrimble.Ssi.Driver.CarpoBased.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 372
	%struct.DSOCacheEntry {
		i64 2477279789, ; hash 0x93a84a2d, from name: Newtonsoft.Json.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.34_name, ; name: libaot-Newtonsoft.Json.dll.so
		ptr null; void* handle (0x0)
	}, ; 373
	%struct.DSOCacheEntry {
		i64 2481271216, ; hash 0x93e531b0, from name: aot-Trimble.Ssi.DriverProxy.Gnss.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.55_name, ; name: libaot-Trimble.Ssi.DriverProxy.Gnss.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 374
	%struct.DSOCacheEntry {
		i64 2484371297, ; hash 0x94147f61, from name: System.Net.ServicePoint
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.89_name, ; name: libaot-System.Net.ServicePoint.dll.so
		ptr null; void* handle (0x0)
	}, ; 375
	%struct.DSOCacheEntry {
		i64 2485587657, ; hash 0x94270ec9, from name: aot-System.Reflection.Emit.Lightweight
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.97_name, ; name: libaot-System.Reflection.Emit.Lightweight.dll.so
		ptr null; void* handle (0x0)
	}, ; 376
	%struct.DSOCacheEntry {
		i64 2488852095, ; hash 0x9458de7f, from name: Trimble.Ssi.Driver.MockGnss.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.53_name, ; name: libaot-Trimble.Ssi.Driver.MockGnss.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 377
	%struct.DSOCacheEntry {
		i64 2492819826, ; hash 0x94956972, from name: libCsdManagement.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.1_name, ; name: libCsdManagement.so
		ptr null; void* handle (0x0)
	}, ; 378
	%struct.DSOCacheEntry {
		i64 2496112763, ; hash 0x94c7a87b, from name: libmonosgen-2.0
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.26_name, ; name: libmonosgen-2.0.so
		ptr null; void* handle (0x0)
	}, ; 379
	%struct.DSOCacheEntry {
		i64 2510900409, ; hash 0x95a94cb9, from name: Trimble.Ssi.Driver.CarpoBased.Driver.SP80.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.17_name, ; name: libTrimble.Ssi.Driver.CarpoBased.Driver.SP80.so
		ptr null; void* handle (0x0)
	}, ; 380
	%struct.DSOCacheEntry {
		i64 2511091162, ; hash 0x95ac35da, from name: aot-Trimble.LicensingV2.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.37_name, ; name: libaot-Trimble.LicensingV2.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 381
	%struct.DSOCacheEntry {
		i64 2531051056, ; hash 0x96dcc630, from name: libaot-System.Console.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.70_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle (0x0)
	}, ; 382
	%struct.DSOCacheEntry {
		i64 2535803033, ; hash 0x97254899, from name: aot-EM940Lib-Mono-Android
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.32_name, ; name: libaot-EM940Lib-Mono-Android.dll.so
		ptr null; void* handle (0x0)
	}, ; 383
	%struct.DSOCacheEntry {
		i64 2550858588, ; hash 0x980b035c, from name: libaot-System.Net.NameResolution.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.85_name, ; name: libaot-System.Net.NameResolution.dll.so
		ptr null; void* handle (0x0)
	}, ; 384
	%struct.DSOCacheEntry {
		i64 2552580572, ; hash 0x982549dc, from name: libaot-System.Diagnostics.DiagnosticSource
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.73_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle (0x0)
	}, ; 385
	%struct.DSOCacheEntry {
		i64 2562349572, ; hash 0x98ba5a04, from name: Microsoft.CSharp
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.62_name, ; name: libaot-Microsoft.CSharp.dll.so
		ptr null; void* handle (0x0)
	}, ; 386
	%struct.DSOCacheEntry {
		i64 2566983080, ; hash 0x99010da8, from name: libaot-Trimble.EMPOWER.JavaBinding.Droid.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.47_name, ; name: libaot-Trimble.EMPOWER.JavaBinding.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 387
	%struct.DSOCacheEntry {
		i64 2578174356, ; hash 0x99abd194, from name: System.Native
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.23_name, ; name: libSystem.Native.so
		ptr null; void* handle (0x0)
	}, ; 388
	%struct.DSOCacheEntry {
		i64 2579183305, ; hash 0x99bb36c9, from name: aot-System.Text.RegularExpressions.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.106_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle (0x0)
	}, ; 389
	%struct.DSOCacheEntry {
		i64 2580278470, ; hash 0x99cbecc6, from name: libaot-System.Private.Uri.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.93_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle (0x0)
	}, ; 390
	%struct.DSOCacheEntry {
		i64 2583342705, ; hash 0x99faae71, from name: System.IO.Compression.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.80_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle (0x0)
	}, ; 391
	%struct.DSOCacheEntry {
		i64 2584814180, ; hash 0x9a112264, from name: libaot-System.Text.RegularExpressions
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.106_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle (0x0)
	}, ; 392
	%struct.DSOCacheEntry {
		i64 2584994756, ; hash 0x9a13e3c4, from name: aot-Trimble.Ssi.Drivers.Common.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.44_name, ; name: libaot-Trimble.Ssi.Drivers.Common.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 393
	%struct.DSOCacheEntry {
		i64 2586467844, ; hash 0x9a2a5e04, from name: aot-System.Private.Uri
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.93_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle (0x0)
	}, ; 394
	%struct.DSOCacheEntry {
		i64 2589602615, ; hash 0x9a5a3337, from name: System.Threading.ThreadPool
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.108_name, ; name: libaot-System.Threading.ThreadPool.dll.so
		ptr null; void* handle (0x0)
	}, ; 395
	%struct.DSOCacheEntry {
		i64 2596751594, ; hash 0x9ac748ea, from name: aot-System.ComponentModel.TypeConverter.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.68_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle (0x0)
	}, ; 396
	%struct.DSOCacheEntry {
		i64 2609125694, ; hash 0x9b84193e, from name: libTrimble.Ssi.Driver.Mock.Common
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.9_name, ; name: libTrimble.Ssi.Driver.Mock.Common.so
		ptr null; void* handle (0x0)
	}, ; 397
	%struct.DSOCacheEntry {
		i64 2611931928, ; hash 0x9baeeb18, from name: libaot-Trimble.EMPOWER.JavaBinding.Droid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.47_name, ; name: libaot-Trimble.EMPOWER.JavaBinding.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 398
	%struct.DSOCacheEntry {
		i64 2620018659, ; hash 0x9c2a4fe3, from name: System.Private.Uri.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.93_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle (0x0)
	}, ; 399
	%struct.DSOCacheEntry {
		i64 2622580127, ; hash 0x9c51659f, from name: aot-Trimble.Ssi.Interfaces.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.45_name, ; name: libaot-Trimble.Ssi.Interfaces.dll.so
		ptr null; void* handle (0x0)
	}, ; 400
	%struct.DSOCacheEntry {
		i64 2630231106, ; hash 0x9cc62442, from name: System.Net.ServicePoint.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.89_name, ; name: libaot-System.Net.ServicePoint.dll.so
		ptr null; void* handle (0x0)
	}, ; 401
	%struct.DSOCacheEntry {
		i64 2633938609, ; hash 0x9cfeb6b1, from name: Trimble.EMPOWER.JavaBinding.Droid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.47_name, ; name: libaot-Trimble.EMPOWER.JavaBinding.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 402
	%struct.DSOCacheEntry {
		i64 2639209874, ; hash 0x9d4f2592, from name: System.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.113_name, ; name: libaot-System.dll.so
		ptr null; void* handle (0x0)
	}, ; 403
	%struct.DSOCacheEntry {
		i64 2646943518, ; hash 0x9dc5271e, from name: libaot-System.Net.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.86_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 404
	%struct.DSOCacheEntry {
		i64 2655247684, ; hash 0x9e43dd44, from name: libASerialPort.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.12_name, ; name: libASerialPort.so
		ptr null; void* handle (0x0)
	}, ; 405
	%struct.DSOCacheEntry {
		i64 2658598962, ; hash 0x9e770032, from name: monosgen-2.0.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.26_name, ; name: libmonosgen-2.0.so
		ptr null; void* handle (0x0)
	}, ; 406
	%struct.DSOCacheEntry {
		i64 2663219906, ; hash 0x9ebd82c2, from name: Java.Interop.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.116_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle (0x0)
	}, ; 407
	%struct.DSOCacheEntry {
		i64 2665622720, ; hash 0x9ee22cc0, from name: System.Drawing.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.76_name, ; name: libaot-System.Drawing.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 408
	%struct.DSOCacheEntry {
		i64 2672708872, ; hash 0x9f4e4d08, from name: libTrimble.Ssi.Driver.CarpoBased.Driver.SP80
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.17_name, ; name: libTrimble.Ssi.Driver.CarpoBased.Driver.SP80.so
		ptr null; void* handle (0x0)
	}, ; 409
	%struct.DSOCacheEntry {
		i64 2677175713, ; hash 0x9f9275a1, from name: libaot-Mono.Android.Runtime.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.118_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle (0x0)
	}, ; 410
	%struct.DSOCacheEntry {
		i64 2691735035, ; hash 0xa0709dfb, from name: aot-CatalystFacade.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.29_name, ; name: libaot-CatalystFacade.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 411
	%struct.DSOCacheEntry {
		i64 2705630008, ; hash 0xa144a338, from name: aot-System.Drawing.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.77_name, ; name: libaot-System.Drawing.dll.so
		ptr null; void* handle (0x0)
	}, ; 412
	%struct.DSOCacheEntry {
		i64 2705924889, ; hash 0xa1492319, from name: libaot-Trimble.Ssi.Driver.CarpoBased.Driver.RSeries.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.51_name, ; name: libaot-Trimble.Ssi.Driver.CarpoBased.Driver.RSeries.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 413
	%struct.DSOCacheEntry {
		i64 2709717763, ; hash 0xa1830303, from name: aot-Mono.Android
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.119_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle (0x0)
	}, ; 414
	%struct.DSOCacheEntry {
		i64 2727849096, ; hash 0xa297ac88, from name: aot-System.Formats.Asn1.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.78_name, ; name: libaot-System.Formats.Asn1.dll.so
		ptr null; void* handle (0x0)
	}, ; 415
	%struct.DSOCacheEntry {
		i64 2731618641, ; hash 0xa2d13151, from name: c++_shared
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.0_name, ; name: libc++_shared.so
		ptr null; void* handle (0x0)
	}, ; 416
	%struct.DSOCacheEntry {
		i64 2746397398, ; hash 0xa3b2b2d6, from name: libaot-Newtonsoft.Json
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.34_name, ; name: libaot-Newtonsoft.Json.dll.so
		ptr null; void* handle (0x0)
	}, ; 417
	%struct.DSOCacheEntry {
		i64 2747506649, ; hash 0xa3c39fd9, from name: Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.JavaBindings.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.50_name, ; name: libaot-Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.JavaBindings.dll.so
		ptr null; void* handle (0x0)
	}, ; 418
	%struct.DSOCacheEntry {
		i64 2762521767, ; hash 0xa4a8bca7, from name: AltGeoRelayService.Droid.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.31_name, ; name: libaot-AltGeoRelayService.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 419
	%struct.DSOCacheEntry {
		i64 2767247566, ; hash 0xa4f0d8ce, from name: libaot-System.Data.Common.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.72_name, ; name: libaot-System.Data.Common.dll.so
		ptr null; void* handle (0x0)
	}, ; 420
	%struct.DSOCacheEntry {
		i64 2774216710, ; hash 0xa55b3006, from name: libaot-Trimble.Ssi.Interfaces
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.45_name, ; name: libaot-Trimble.Ssi.Interfaces.dll.so
		ptr null; void* handle (0x0)
	}, ; 421
	%struct.DSOCacheEntry {
		i64 2781942327, ; hash 0xa5d11237, from name: aot-Trimble.Ssi.DriverManagement.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.42_name, ; name: libaot-Trimble.Ssi.DriverManagement.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 422
	%struct.DSOCacheEntry {
		i64 2794880664, ; hash 0xa6967e98, from name: libTDDTransformationLibCS
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.3_name, ; name: libTDDTransformationLibCS.so
		ptr null; void* handle (0x0)
	}, ; 423
	%struct.DSOCacheEntry {
		i64 2795189798, ; hash 0xa69b3626, from name: Trimble.Ssi.CSWrapped.Common.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.6_name, ; name: libTrimble.Ssi.CSWrapped.Common.so
		ptr null; void* handle (0x0)
	}, ; 424
	%struct.DSOCacheEntry {
		i64 2796964840, ; hash 0xa6b64be8, from name: Trimble.Ssi.Interfaces.Common
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.11_name, ; name: libTrimble.Ssi.Interfaces.Common.so
		ptr null; void* handle (0x0)
	}, ; 425
	%struct.DSOCacheEntry {
		i64 2819302179, ; hash 0xa80b2323, from name: aot-Trimble.Ssi.DriverCommon.Interfaces.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.41_name, ; name: libaot-Trimble.Ssi.DriverCommon.Interfaces.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 426
	%struct.DSOCacheEntry {
		i64 2831113488, ; hash 0xa8bf5d10, from name: libaot-System.Collections.Specialized.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.65_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle (0x0)
	}, ; 427
	%struct.DSOCacheEntry {
		i64 2832133647, ; hash 0xa8ceee0f, from name: aot-CatalystFacade.NET.Droid.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.30_name, ; name: libaot-CatalystFacade.NET.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 428
	%struct.DSOCacheEntry {
		i64 2838272159, ; hash 0xa92c989f, from name: Trimble.Licensing.CSWrapped
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.4_name, ; name: libTrimble.Licensing.CSWrapped.so
		ptr null; void* handle (0x0)
	}, ; 429
	%struct.DSOCacheEntry {
		i64 2843443372, ; hash 0xa97b80ac, from name: aot-System.Console.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.70_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle (0x0)
	}, ; 430
	%struct.DSOCacheEntry {
		i64 2882286914, ; hash 0xabcc3542, from name: libaot-EM940Lib-Mono-Android
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.32_name, ; name: libaot-EM940Lib-Mono-Android.dll.so
		ptr null; void* handle (0x0)
	}, ; 431
	%struct.DSOCacheEntry {
		i64 2882500561, ; hash 0xabcf77d1, from name: System.Security.Cryptography.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.104_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle (0x0)
	}, ; 432
	%struct.DSOCacheEntry {
		i64 2905256141, ; hash 0xad2ab0cd, from name: System.Threading.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.109_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle (0x0)
	}, ; 433
	%struct.DSOCacheEntry {
		i64 2909740682, ; hash 0xad6f1e8a, from name: System.Private.CoreLib
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.120_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle (0x0)
	}, ; 434
	%struct.DSOCacheEntry {
		i64 2910917575, ; hash 0xad8113c7, from name: aot-Trimble.Ssi.Interfaces.Gnss
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.57_name, ; name: libaot-Trimble.Ssi.Interfaces.Gnss.dll.so
		ptr null; void* handle (0x0)
	}, ; 435
	%struct.DSOCacheEntry {
		i64 2911927123, ; hash 0xad907b53, from name: libaot-System.Runtime.Numerics.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.100_name, ; name: libaot-System.Runtime.Numerics.dll.so
		ptr null; void* handle (0x0)
	}, ; 436
	%struct.DSOCacheEntry {
		i64 2919733441, ; hash 0xae0798c1, from name: libaot-Trimble.Ssi.DriverCommon.Interfaces.Gnss.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.54_name, ; name: libaot-Trimble.Ssi.DriverCommon.Interfaces.Gnss.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 437
	%struct.DSOCacheEntry {
		i64 2934179825, ; hash 0xaee407f1, from name: libaot-AltGeoRelayService.Droid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.31_name, ; name: libaot-AltGeoRelayService.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 438
	%struct.DSOCacheEntry {
		i64 2938562415, ; hash 0xaf26e76f, from name: Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.JavaBindings
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.50_name, ; name: libaot-Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.JavaBindings.dll.so
		ptr null; void* handle (0x0)
	}, ; 439
	%struct.DSOCacheEntry {
		i64 2938740861, ; hash 0xaf29a07d, from name: libSystem.IO.Compression.Native.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.22_name, ; name: libSystem.IO.Compression.Native.so
		ptr null; void* handle (0x0)
	}, ; 440
	%struct.DSOCacheEntry {
		i64 2945162751, ; hash 0xaf8b9dff, from name: System.Collections.NonGeneric.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.64_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle (0x0)
	}, ; 441
	%struct.DSOCacheEntry {
		i64 2950894636, ; hash 0xafe3142c, from name: libSystem.IO.Compression.Native
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.22_name, ; name: libSystem.IO.Compression.Native.so
		ptr null; void* handle (0x0)
	}, ; 442
	%struct.DSOCacheEntry {
		i64 2955414144, ; hash 0xb0280a80, from name: aot-System.Core.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.71_name, ; name: libaot-System.Core.dll.so
		ptr null; void* handle (0x0)
	}, ; 443
	%struct.DSOCacheEntry {
		i64 2969841788, ; hash 0xb104307c, from name: ASerialPort.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.12_name, ; name: libASerialPort.so
		ptr null; void* handle (0x0)
	}, ; 444
	%struct.DSOCacheEntry {
		i64 2985735645, ; hash 0xb1f6b5dd, from name: aot-System.Xml.ReaderWriter.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.111_name, ; name: libaot-System.Xml.ReaderWriter.dll.so
		ptr null; void* handle (0x0)
	}, ; 445
	%struct.DSOCacheEntry {
		i64 2988857390, ; hash 0xb226582e, from name: libaot-Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.Android
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.49_name, ; name: libaot-Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.Android.dll.so
		ptr null; void* handle (0x0)
	}, ; 446
	%struct.DSOCacheEntry {
		i64 2991614877, ; hash 0xb2506b9d, from name: libDRV_TrimCom
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.14_name, ; name: libDRV_TrimCom.so
		ptr null; void* handle (0x0)
	}, ; 447
	%struct.DSOCacheEntry {
		i64 2994111342, ; hash 0xb276836e, from name: aot-System.Xml.XDocument.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.112_name, ; name: libaot-System.Xml.XDocument.dll.so
		ptr null; void* handle (0x0)
	}, ; 448
	%struct.DSOCacheEntry {
		i64 2999950842, ; hash 0xb2cf9dfa, from name: aot-Xamarin.Essentials
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.61_name, ; name: libaot-Xamarin.Essentials.dll.so
		ptr null; void* handle (0x0)
	}, ; 449
	%struct.DSOCacheEntry {
		i64 3002033339, ; hash 0xb2ef64bb, from name: aot-Microsoft.CSharp
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.62_name, ; name: libaot-Microsoft.CSharp.dll.so
		ptr null; void* handle (0x0)
	}, ; 450
	%struct.DSOCacheEntry {
		i64 3003003043, ; hash 0xb2fe30a3, from name: libTrimble.Ssi.Driver.Mock.Common.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.9_name, ; name: libTrimble.Ssi.Driver.Mock.Common.so
		ptr null; void* handle (0x0)
	}, ; 451
	%struct.DSOCacheEntry {
		i64 3004330539, ; hash 0xb312722b, from name: libTrimble.Ssi.Driver.DriverCommon.GNSS.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.19_name, ; name: libTrimble.Ssi.Driver.DriverCommon.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 452
	%struct.DSOCacheEntry {
		i64 3006652848, ; hash 0xb335e1b0, from name: Trimble.Ssi.Drivers.Gnss.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.56_name, ; name: libaot-Trimble.Ssi.Drivers.Gnss.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 453
	%struct.DSOCacheEntry {
		i64 3024529297, ; hash 0xb446a791, from name: aot-System.Runtime.InteropServices.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.99_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle (0x0)
	}, ; 454
	%struct.DSOCacheEntry {
		i64 3039880711, ; hash 0xb530e607, from name: aot-System.Net.Security.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.88_name, ; name: libaot-System.Net.Security.dll.so
		ptr null; void* handle (0x0)
	}, ; 455
	%struct.DSOCacheEntry {
		i64 3045266179, ; hash 0xb5831303, from name: Trimble.Ssi.DriverCommon.Interfaces.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.41_name, ; name: libaot-Trimble.Ssi.DriverCommon.Interfaces.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 456
	%struct.DSOCacheEntry {
		i64 3051226419, ; hash 0xb5de0533, from name: System.Runtime.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.103_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle (0x0)
	}, ; 457
	%struct.DSOCacheEntry {
		i64 3056290812, ; hash 0xb62b4bfc, from name: aot-System.Net.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.86_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 458
	%struct.DSOCacheEntry {
		i64 3057718947, ; hash 0xb64116a3, from name: aot-System.Linq.Expressions.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.81_name, ; name: libaot-System.Linq.Expressions.dll.so
		ptr null; void* handle (0x0)
	}, ; 459
	%struct.DSOCacheEntry {
		i64 3058175140, ; hash 0xb6480ca4, from name: System.Text.RegularExpressions.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.106_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle (0x0)
	}, ; 460
	%struct.DSOCacheEntry {
		i64 3059408633, ; hash 0xb65adef9, from name: Mono.Android.Runtime
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.118_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle (0x0)
	}, ; 461
	%struct.DSOCacheEntry {
		i64 3059793426, ; hash 0xb660be12, from name: System.ComponentModel.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.67_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 462
	%struct.DSOCacheEntry {
		i64 3063185236, ; hash 0xb6947f54, from name: Trimble.EMPOWER.Common.Droid.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.46_name, ; name: libaot-Trimble.EMPOWER.Common.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 463
	%struct.DSOCacheEntry {
		i64 3069332668, ; hash 0xb6f24cbc, from name: libaot-Trimble.Ssi.DriverManagement.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.42_name, ; name: libaot-Trimble.Ssi.DriverManagement.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 464
	%struct.DSOCacheEntry {
		i64 3073434459, ; hash 0xb730e35b, from name: aot-System.Private.CoreLib
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.120_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle (0x0)
	}, ; 465
	%struct.DSOCacheEntry {
		i64 3097746105, ; hash 0xb8a3dab9, from name: System.Console.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.70_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle (0x0)
	}, ; 466
	%struct.DSOCacheEntry {
		i64 3103600923, ; hash 0xb8fd311b, from name: System.Formats.Asn1
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.78_name, ; name: libaot-System.Formats.Asn1.dll.so
		ptr null; void* handle (0x0)
	}, ; 467
	%struct.DSOCacheEntry {
		i64 3110894810, ; hash 0xb96c7cda, from name: Trimble.Ssi.DriverManagement.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.10_name, ; name: libTrimble.Ssi.DriverManagement.so
		ptr null; void* handle (0x0)
	}, ; 468
	%struct.DSOCacheEntry {
		i64 3111500708, ; hash 0xb975bba4, from name: libTrimble.Ssi.Driver.DriverCommon.Common
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.8_name, ; name: libTrimble.Ssi.Driver.DriverCommon.Common.so
		ptr null; void* handle (0x0)
	}, ; 469
	%struct.DSOCacheEntry {
		i64 3117793693, ; hash 0xb9d5c19d, from name: Trimble.Ssi.CSWrapped.GNSS.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.15_name, ; name: libTrimble.Ssi.CSWrapped.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 470
	%struct.DSOCacheEntry {
		i64 3119652235, ; hash 0xb9f21d8b, from name: Mono.Android.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.119_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle (0x0)
	}, ; 471
	%struct.DSOCacheEntry {
		i64 3122244214, ; hash 0xba19aa76, from name: aot-System.Diagnostics.TraceSource
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.75_name, ; name: libaot-System.Diagnostics.TraceSource.dll.so
		ptr null; void* handle (0x0)
	}, ; 472
	%struct.DSOCacheEntry {
		i64 3126763205, ; hash 0xba5e9ec5, from name: Trimble.Ssi.Drivers.Common.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.44_name, ; name: libaot-Trimble.Ssi.Drivers.Common.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 473
	%struct.DSOCacheEntry {
		i64 3127835167, ; hash 0xba6efa1f, from name: System.ObjectModel.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.92_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle (0x0)
	}, ; 474
	%struct.DSOCacheEntry {
		i64 3129695436, ; hash 0xba8b5ccc, from name: libaot-System.Private.Uri
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.93_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle (0x0)
	}, ; 475
	%struct.DSOCacheEntry {
		i64 3137986923, ; hash 0xbb09e16b, from name: libaot-System.Net.Requests
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.87_name, ; name: libaot-System.Net.Requests.dll.so
		ptr null; void* handle (0x0)
	}, ; 476
	%struct.DSOCacheEntry {
		i64 3146550704, ; hash 0xbb8c8db0, from name: Trimble.Ssi.Driver.Mock.GNSS
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.20_name, ; name: libTrimble.Ssi.Driver.Mock.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 477
	%struct.DSOCacheEntry {
		i64 3160673957, ; hash 0xbc640ea5, from name: Trimble.Ssi.Interfaces.Gnss.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.57_name, ; name: libaot-Trimble.Ssi.Interfaces.Gnss.dll.so
		ptr null; void* handle (0x0)
	}, ; 478
	%struct.DSOCacheEntry {
		i64 3188889127, ; hash 0xbe129627, from name: aot-System.Runtime.Numerics.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.100_name, ; name: libaot-System.Runtime.Numerics.dll.so
		ptr null; void* handle (0x0)
	}, ; 479
	%struct.DSOCacheEntry {
		i64 3198259232, ; hash 0xbea19020, from name: aot-Trimble.EMPOWER.JavaBinding.Droid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.47_name, ; name: libaot-Trimble.EMPOWER.JavaBinding.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 480
	%struct.DSOCacheEntry {
		i64 3212987759, ; hash 0xbf824d6f, from name: aot-System.Net.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.86_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 481
	%struct.DSOCacheEntry {
		i64 3220365878, ; hash 0xbff2e236, from name: System.Threading
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.109_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle (0x0)
	}, ; 482
	%struct.DSOCacheEntry {
		i64 3234506695, ; hash 0xc0caa7c7, from name: aot-System.Net.Sockets
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.90_name, ; name: libaot-System.Net.Sockets.dll.so
		ptr null; void* handle (0x0)
	}, ; 483
	%struct.DSOCacheEntry {
		i64 3234742231, ; hash 0xc0ce3fd7, from name: aot-Trimble.Ssi.Interfaces.Gnss.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.57_name, ; name: libaot-Trimble.Ssi.Interfaces.Gnss.dll.so
		ptr null; void* handle (0x0)
	}, ; 484
	%struct.DSOCacheEntry {
		i64 3240981972, ; hash 0xc12d75d4, from name: aot-System.Threading
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.109_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle (0x0)
	}, ; 485
	%struct.DSOCacheEntry {
		i64 3243272429, ; hash 0xc15068ed, from name: aot-System.Xml.Linq.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.110_name, ; name: libaot-System.Xml.Linq.dll.so
		ptr null; void* handle (0x0)
	}, ; 486
	%struct.DSOCacheEntry {
		i64 3258636379, ; hash 0xc23ad85b, from name: libTrimble.Ssi.Driver.CarpoBased.Driver.RSeries.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.16_name, ; name: libTrimble.Ssi.Driver.CarpoBased.Driver.RSeries.so
		ptr null; void* handle (0x0)
	}, ; 487
	%struct.DSOCacheEntry {
		i64 3259652464, ; hash 0xc24a5970, from name: libaot-System.Private.Xml.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.95_name, ; name: libaot-System.Private.Xml.dll.so
		ptr null; void* handle (0x0)
	}, ; 488
	%struct.DSOCacheEntry {
		i64 3271438092, ; hash 0xc2fe2f0c, from name: libaot-mscorlib.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.114_name, ; name: libaot-mscorlib.dll.so
		ptr null; void* handle (0x0)
	}, ; 489
	%struct.DSOCacheEntry {
		i64 3274854694, ; hash 0xc3325126, from name: libaot-System.Formats.Asn1.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.78_name, ; name: libaot-System.Formats.Asn1.dll.so
		ptr null; void* handle (0x0)
	}, ; 490
	%struct.DSOCacheEntry {
		i64 3275660490, ; hash 0xc33e9cca, from name: System.Net.Http.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.84_name, ; name: libaot-System.Net.Http.dll.so
		ptr null; void* handle (0x0)
	}, ; 491
	%struct.DSOCacheEntry {
		i64 3285013104, ; hash 0xc3cd5270, from name: libTDDTransformationLibCS.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.3_name, ; name: libTDDTransformationLibCS.so
		ptr null; void* handle (0x0)
	}, ; 492
	%struct.DSOCacheEntry {
		i64 3285389007, ; hash 0xc3d30ecf, from name: Trimble.EMPOWER.JavaBinding.Droid.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.47_name, ; name: libaot-Trimble.EMPOWER.JavaBinding.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 493
	%struct.DSOCacheEntry {
		i64 3289557647, ; hash 0xc412aa8f, from name: libCsdManagement
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.1_name, ; name: libCsdManagement.so
		ptr null; void* handle (0x0)
	}, ; 494
	%struct.DSOCacheEntry {
		i64 3294137703, ; hash 0xc4588d67, from name: libaot-System.Linq.Expressions.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.81_name, ; name: libaot-System.Linq.Expressions.dll.so
		ptr null; void* handle (0x0)
	}, ; 495
	%struct.DSOCacheEntry {
		i64 3296490200, ; hash 0xc47c72d8, from name: libTrimble.Licensing.CSWrapped.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.4_name, ; name: libTrimble.Licensing.CSWrapped.so
		ptr null; void* handle (0x0)
	}, ; 496
	%struct.DSOCacheEntry {
		i64 3302458748, ; hash 0xc4d7857c, from name: Trimble.Ssi.DriverProxy.Gnss.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.55_name, ; name: libaot-Trimble.Ssi.DriverProxy.Gnss.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 497
	%struct.DSOCacheEntry {
		i64 3310036410, ; hash 0xc54b25ba, from name: System.Numerics.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.91_name, ; name: libaot-System.Numerics.dll.so
		ptr null; void* handle (0x0)
	}, ; 498
	%struct.DSOCacheEntry {
		i64 3310770342, ; hash 0xc55658a6, from name: aot-Trimble.Ssi.DriverCommon.Interfaces.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.41_name, ; name: libaot-Trimble.Ssi.DriverCommon.Interfaces.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 499
	%struct.DSOCacheEntry {
		i64 3320200080, ; hash 0xc5e63b90, from name: System.Linq.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.82_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle (0x0)
	}, ; 500
	%struct.DSOCacheEntry {
		i64 3321586081, ; hash 0xc5fb61a1, from name: libaot-Trimble.Ssi.Driver.CarpoBased.Driver.SP80.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.52_name, ; name: libaot-Trimble.Ssi.Driver.CarpoBased.Driver.SP80.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 501
	%struct.DSOCacheEntry {
		i64 3323143848, ; hash 0xc61326a8, from name: aot-Newtonsoft.Json.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.34_name, ; name: libaot-Newtonsoft.Json.dll.so
		ptr null; void* handle (0x0)
	}, ; 502
	%struct.DSOCacheEntry {
		i64 3353807653, ; hash 0xc7e70b25, from name: aot-Trimble.Ssi.Drivers.Gnss.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.56_name, ; name: libaot-Trimble.Ssi.Drivers.Gnss.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 503
	%struct.DSOCacheEntry {
		i64 3362522851, ; hash 0xc86c06e3, from name: Xamarin.AndroidX.Core
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.60_name, ; name: libaot-Xamarin.AndroidX.Core.dll.so
		ptr null; void* handle (0x0)
	}, ; 504
	%struct.DSOCacheEntry {
		i64 3366347497, ; hash 0xc8a662e9, from name: Java.Interop
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.116_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle (0x0)
	}, ; 505
	%struct.DSOCacheEntry {
		i64 3372141473, ; hash 0xc8fecba1, from name: TDDTransformationLibCS
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.3_name, ; name: libTDDTransformationLibCS.so
		ptr null; void* handle (0x0)
	}, ; 506
	%struct.DSOCacheEntry {
		i64 3378298534, ; hash 0xc95cbea6, from name: Trimble.Ssi.DriverProxy.Common.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.43_name, ; name: libaot-Trimble.Ssi.DriverProxy.Common.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 507
	%struct.DSOCacheEntry {
		i64 3382917508, ; hash 0xc9a33984, from name: CatalystFacade.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.29_name, ; name: libaot-CatalystFacade.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 508
	%struct.DSOCacheEntry {
		i64 3390663103, ; hash 0xca1969bf, from name: aot-System.Net.Sockets.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.90_name, ; name: libaot-System.Net.Sockets.dll.so
		ptr null; void* handle (0x0)
	}, ; 509
	%struct.DSOCacheEntry {
		i64 3396494892, ; hash 0xca72662c, from name: System.Net.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.86_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 510
	%struct.DSOCacheEntry {
		i64 3400462534, ; hash 0xcaaef0c6, from name: mscorlib.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.114_name, ; name: libaot-mscorlib.dll.so
		ptr null; void* handle (0x0)
	}, ; 511
	%struct.DSOCacheEntry {
		i64 3409284616, ; hash 0xcb358e08, from name: aot-Xamarin.AndroidX.Browser
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.59_name, ; name: libaot-Xamarin.AndroidX.Browser.dll.so
		ptr null; void* handle (0x0)
	}, ; 512
	%struct.DSOCacheEntry {
		i64 3415799033, ; hash 0xcb98f4f9, from name: libTrimble.Ssi.DriverManagement
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.10_name, ; name: libTrimble.Ssi.DriverManagement.so
		ptr null; void* handle (0x0)
	}, ; 513
	%struct.DSOCacheEntry {
		i64 3416727221, ; hash 0xcba71eb5, from name: libaot-System.Reflection.Emit.ILGeneration.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.96_name, ; name: libaot-System.Reflection.Emit.ILGeneration.dll.so
		ptr null; void* handle (0x0)
	}, ; 514
	%struct.DSOCacheEntry {
		i64 3422266863, ; hash 0xcbfba5ef, from name: libmonodroid.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.27_name, ; name: libmonodroid.so
		ptr null; void* handle (0x0)
	}, ; 515
	%struct.DSOCacheEntry {
		i64 3424644073, ; hash 0xcc1febe9, from name: Trimble.Ssi.Driver.CarpoBased.GNSS.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.18_name, ; name: libTrimble.Ssi.Driver.CarpoBased.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 516
	%struct.DSOCacheEntry {
		i64 3430777524, ; hash 0xcc7d82b4, from name: netstandard
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.115_name, ; name: libaot-netstandard.dll.so
		ptr null; void* handle (0x0)
	}, ; 517
	%struct.DSOCacheEntry {
		i64 3444538252, ; hash 0xcd4f7b8c, from name: libaot-AIDLService
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.35_name, ; name: libaot-AIDLService.dll.so
		ptr null; void* handle (0x0)
	}, ; 518
	%struct.DSOCacheEntry {
		i64 3445624513, ; hash 0xcd600ec1, from name: aot-System.ComponentModel.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.67_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 519
	%struct.DSOCacheEntry {
		i64 3447642345, ; hash 0xcd7ed8e9, from name: libaot-System.Net.Security
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.88_name, ; name: libaot-System.Net.Security.dll.so
		ptr null; void* handle (0x0)
	}, ; 520
	%struct.DSOCacheEntry {
		i64 3448212429, ; hash 0xcd878bcd, from name: aot-System.IO.Compression
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.80_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle (0x0)
	}, ; 521
	%struct.DSOCacheEntry {
		i64 3459426081, ; hash 0xce32a721, from name: aot-Trimble.EMPOWER.Manager.Droid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.48_name, ; name: libaot-Trimble.EMPOWER.Manager.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 522
	%struct.DSOCacheEntry {
		i64 3464801066, ; hash 0xce84ab2a, from name: libaot-Trimble.Ssi.Drivers.Gnss.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.56_name, ; name: libaot-Trimble.Ssi.Drivers.Gnss.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 523
	%struct.DSOCacheEntry {
		i64 3471140502, ; hash 0xcee56696, from name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.28_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle (0x0)
	}, ; 524
	%struct.DSOCacheEntry {
		i64 3471168856, ; hash 0xcee5d558, from name: libTrimble.Ssi.Driver.CarpoBased.Common
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.7_name, ; name: libTrimble.Ssi.Driver.CarpoBased.Common.so
		ptr null; void* handle (0x0)
	}, ; 525
	%struct.DSOCacheEntry {
		i64 3476120550, ; hash 0xcf3163e6, from name: Mono.Android
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.119_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle (0x0)
	}, ; 526
	%struct.DSOCacheEntry {
		i64 3490240475, ; hash 0xd008d7db, from name: aot-netstandard.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.115_name, ; name: libaot-netstandard.dll.so
		ptr null; void* handle (0x0)
	}, ; 527
	%struct.DSOCacheEntry {
		i64 3495482532, ; hash 0xd058d4a4, from name: GeodeticX
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.2_name, ; name: libGeodeticX.so
		ptr null; void* handle (0x0)
	}, ; 528
	%struct.DSOCacheEntry {
		i64 3495560389, ; hash 0xd05a04c5, from name: aot-System.Text.Encoding.Extensions.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.105_name, ; name: libaot-System.Text.Encoding.Extensions.dll.so
		ptr null; void* handle (0x0)
	}, ; 529
	%struct.DSOCacheEntry {
		i64 3502076383, ; hash 0xd0bd71df, from name: aot-Trimble.Ssi.DriverCommon.Interfaces.Gnss.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.54_name, ; name: libaot-Trimble.Ssi.DriverCommon.Interfaces.Gnss.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 530
	%struct.DSOCacheEntry {
		i64 3509114376, ; hash 0xd128d608, from name: System.Xml.Linq
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.110_name, ; name: libaot-System.Xml.Linq.dll.so
		ptr null; void* handle (0x0)
	}, ; 531
	%struct.DSOCacheEntry {
		i64 3540360104, ; hash 0xd3059ba8, from name: aot-System.Net.ServicePoint
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.89_name, ; name: libaot-System.Net.ServicePoint.dll.so
		ptr null; void* handle (0x0)
	}, ; 532
	%struct.DSOCacheEntry {
		i64 3547939516, ; hash 0xd37942bc, from name: System.Private.Xml.Linq.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.94_name, ; name: libaot-System.Private.Xml.Linq.dll.so
		ptr null; void* handle (0x0)
	}, ; 533
	%struct.DSOCacheEntry {
		i64 3548641934, ; hash 0xd383fa8e, from name: Trimble.Ssi.Driver.CarpoBased.Driver.RSeries.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.51_name, ; name: libaot-Trimble.Ssi.Driver.CarpoBased.Driver.RSeries.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 534
	%struct.DSOCacheEntry {
		i64 3548760182, ; hash 0xd385c876, from name: libaot-CatalystFacade.NET.Droid.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.30_name, ; name: libaot-CatalystFacade.NET.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 535
	%struct.DSOCacheEntry {
		i64 3554143940, ; hash 0xd3d7eec4, from name: libaot-System.Collections.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.66_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle (0x0)
	}, ; 536
	%struct.DSOCacheEntry {
		i64 3556361846, ; hash 0xd3f9c676, from name: libaot-Trimble.LicensingV2.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.37_name, ; name: libaot-Trimble.LicensingV2.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 537
	%struct.DSOCacheEntry {
		i64 3557632341, ; hash 0xd40d2955, from name: libTrimble.Licensing.CSWrapped
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.4_name, ; name: libTrimble.Licensing.CSWrapped.so
		ptr null; void* handle (0x0)
	}, ; 538
	%struct.DSOCacheEntry {
		i64 3557887367, ; hash 0xd4110d87, from name: libaot-System.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.113_name, ; name: libaot-System.dll.so
		ptr null; void* handle (0x0)
	}, ; 539
	%struct.DSOCacheEntry {
		i64 3565226175, ; hash 0xd48108bf, from name: libaot-System.Numerics
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.91_name, ; name: libaot-System.Numerics.dll.so
		ptr null; void* handle (0x0)
	}, ; 540
	%struct.DSOCacheEntry {
		i64 3568873538, ; hash 0xd4b8b042, from name: Trimble.Ssi.Core.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.39_name, ; name: libaot-Trimble.Ssi.Core.dll.so
		ptr null; void* handle (0x0)
	}, ; 541
	%struct.DSOCacheEntry {
		i64 3595485368, ; hash 0xd64ec0b8, from name: aot-Trimble.Ssi.Driver.CarpoBased.Driver.RSeries.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.51_name, ; name: libaot-Trimble.Ssi.Driver.CarpoBased.Driver.RSeries.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 542
	%struct.DSOCacheEntry {
		i64 3610022767, ; hash 0xd72c936f, from name: libaot-System.Security.Cryptography.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.104_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle (0x0)
	}, ; 543
	%struct.DSOCacheEntry {
		i64 3616174750, ; hash 0xd78a729e, from name: libaot-Xamarin.AndroidX.Browser
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.59_name, ; name: libaot-Xamarin.AndroidX.Browser.dll.so
		ptr null; void* handle (0x0)
	}, ; 544
	%struct.DSOCacheEntry {
		i64 3617535095, ; hash 0xd79f3477, from name: libaot-System.Xml.XDocument
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.112_name, ; name: libaot-System.Xml.XDocument.dll.so
		ptr null; void* handle (0x0)
	}, ; 545
	%struct.DSOCacheEntry {
		i64 3623194064, ; hash 0xd7f58dd0, from name: libaot-System.Linq
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.82_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle (0x0)
	}, ; 546
	%struct.DSOCacheEntry {
		i64 3625246508, ; hash 0xd814df2c, from name: libaot-Trimble.Ssi.DriverProxy.Common.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.43_name, ; name: libaot-Trimble.Ssi.DriverProxy.Common.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 547
	%struct.DSOCacheEntry {
		i64 3629173998, ; hash 0xd850ccee, from name: libaot-mscorlib
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.114_name, ; name: libaot-mscorlib.dll.so
		ptr null; void* handle (0x0)
	}, ; 548
	%struct.DSOCacheEntry {
		i64 3636393175, ; hash 0xd8bef4d7, from name: libmonodroid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.27_name, ; name: libmonodroid.so
		ptr null; void* handle (0x0)
	}, ; 549
	%struct.DSOCacheEntry {
		i64 3645630983, ; hash 0xd94bea07, from name: Google.Protobuf
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.33_name, ; name: libaot-Google.Protobuf.dll.so
		ptr null; void* handle (0x0)
	}, ; 550
	%struct.DSOCacheEntry {
		i64 3647597548, ; hash 0xd969ebec, from name: System.Runtime.InteropServices.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.99_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle (0x0)
	}, ; 551
	%struct.DSOCacheEntry {
		i64 3648098342, ; hash 0xd9719026, from name: libaot-System.Runtime.Numerics
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.100_name, ; name: libaot-System.Runtime.Numerics.dll.so
		ptr null; void* handle (0x0)
	}, ; 552
	%struct.DSOCacheEntry {
		i64 3653271801, ; hash 0xd9c080f9, from name: System.Threading.ThreadPool.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.108_name, ; name: libaot-System.Threading.ThreadPool.dll.so
		ptr null; void* handle (0x0)
	}, ; 553
	%struct.DSOCacheEntry {
		i64 3681624565, ; hash 0xdb7121f5, from name: CatalystFacade.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.29_name, ; name: libaot-CatalystFacade.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 554
	%struct.DSOCacheEntry {
		i64 3682565725, ; hash 0xdb7f7e5d, from name: Xamarin.AndroidX.Browser
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.59_name, ; name: libaot-Xamarin.AndroidX.Browser.dll.so
		ptr null; void* handle (0x0)
	}, ; 555
	%struct.DSOCacheEntry {
		i64 3682973436, ; hash 0xdb85b6fc, from name: Trimble.Ssi.Driver.MockGnss.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.53_name, ; name: libaot-Trimble.Ssi.Driver.MockGnss.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 556
	%struct.DSOCacheEntry {
		i64 3685223071, ; hash 0xdba80a9f, from name: libaot-System.IO.Compression.Brotli
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.79_name, ; name: libaot-System.IO.Compression.Brotli.dll.so
		ptr null; void* handle (0x0)
	}, ; 557
	%struct.DSOCacheEntry {
		i64 3689962629, ; hash 0xdbf05c85, from name: System.Diagnostics.TraceSource.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.75_name, ; name: libaot-System.Diagnostics.TraceSource.dll.so
		ptr null; void* handle (0x0)
	}, ; 558
	%struct.DSOCacheEntry {
		i64 3691770169, ; hash 0xdc0bf139, from name: Xamarin.AndroidX.Core.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.60_name, ; name: libaot-Xamarin.AndroidX.Core.dll.so
		ptr null; void* handle (0x0)
	}, ; 559
	%struct.DSOCacheEntry {
		i64 3705667778, ; hash 0xdce000c2, from name: libaot-System.Threading.Thread.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.107_name, ; name: libaot-System.Threading.Thread.dll.so
		ptr null; void* handle (0x0)
	}, ; 560
	%struct.DSOCacheEntry {
		i64 3708930120, ; hash 0xdd11c848, from name: libaot-System.Numerics.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.91_name, ; name: libaot-System.Numerics.dll.so
		ptr null; void* handle (0x0)
	}, ; 561
	%struct.DSOCacheEntry {
		i64 3710702400, ; hash 0xdd2cd340, from name: aot-Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.Android
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.49_name, ; name: libaot-Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.Android.dll.so
		ptr null; void* handle (0x0)
	}, ; 562
	%struct.DSOCacheEntry {
		i64 3712627230, ; hash 0xdd4a321e, from name: aot-System.Xml.XDocument
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.112_name, ; name: libaot-System.Xml.XDocument.dll.so
		ptr null; void* handle (0x0)
	}, ; 563
	%struct.DSOCacheEntry {
		i64 3720997800, ; hash 0xddc9eba8, from name: aot-System.IO.Compression.Brotli
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.79_name, ; name: libaot-System.IO.Compression.Brotli.dll.so
		ptr null; void* handle (0x0)
	}, ; 564
	%struct.DSOCacheEntry {
		i64 3723841562, ; hash 0xddf5501a, from name: libTrimble.Ssi.DriverManagement.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.10_name, ; name: libTrimble.Ssi.DriverManagement.so
		ptr null; void* handle (0x0)
	}, ; 565
	%struct.DSOCacheEntry {
		i64 3724787667, ; hash 0xde03bfd3, from name: Trimble.Ssi.Components.Core.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.38_name, ; name: libaot-Trimble.Ssi.Components.Core.dll.so
		ptr null; void* handle (0x0)
	}, ; 566
	%struct.DSOCacheEntry {
		i64 3726705804, ; hash 0xde21048c, from name: libaot-Trimble.TDDTransformation.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.58_name, ; name: libaot-Trimble.TDDTransformation.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 567
	%struct.DSOCacheEntry {
		i64 3728490873, ; hash 0xde3c4179, from name: libaot-CatalystFacade.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.29_name, ; name: libaot-CatalystFacade.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 568
	%struct.DSOCacheEntry {
		i64 3732100267, ; hash 0xde7354ab, from name: System.Net.NameResolution
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.85_name, ; name: libaot-System.Net.NameResolution.dll.so
		ptr null; void* handle (0x0)
	}, ; 569
	%struct.DSOCacheEntry {
		i64 3734123117, ; hash 0xde92326d, from name: libaot-System.Reflection.Emit.Lightweight.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.97_name, ; name: libaot-System.Reflection.Emit.Lightweight.dll.so
		ptr null; void* handle (0x0)
	}, ; 570
	%struct.DSOCacheEntry {
		i64 3737238990, ; hash 0xdec1bdce, from name: libaot-System.Threading.ThreadPool.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.108_name, ; name: libaot-System.Threading.ThreadPool.dll.so
		ptr null; void* handle (0x0)
	}, ; 571
	%struct.DSOCacheEntry {
		i64 3744678207, ; hash 0xdf33413f, from name: aot-Mono.Android.Export
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.117_name, ; name: libaot-Mono.Android.Export.dll.so
		ptr null; void* handle (0x0)
	}, ; 572
	%struct.DSOCacheEntry {
		i64 3748608112, ; hash 0xdf6f3870, from name: System.Diagnostics.DiagnosticSource
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.73_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle (0x0)
	}, ; 573
	%struct.DSOCacheEntry {
		i64 3755891045, ; hash 0xdfde5965, from name: Trimble.Ssi.Interfaces.GNSS.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.21_name, ; name: libTrimble.Ssi.Interfaces.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 574
	%struct.DSOCacheEntry {
		i64 3770307164, ; hash 0xe0ba525c, from name: Trimble.TDDTransformation.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.58_name, ; name: libaot-Trimble.TDDTransformation.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 575
	%struct.DSOCacheEntry {
		i64 3771716325, ; hash 0xe0cfd2e5, from name: libaot-Trimble.Ssi.Components.Core.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.38_name, ; name: libaot-Trimble.Ssi.Components.Core.dll.so
		ptr null; void* handle (0x0)
	}, ; 576
	%struct.DSOCacheEntry {
		i64 3773573141, ; hash 0xe0ec2815, from name: Trimble.Ssi.DriverCommon.Interfaces.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.41_name, ; name: libaot-Trimble.Ssi.DriverCommon.Interfaces.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 577
	%struct.DSOCacheEntry {
		i64 3778923633, ; hash 0xe13dcc71, from name: aot-Trimble.Ssi.Core
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.39_name, ; name: libaot-Trimble.Ssi.Core.dll.so
		ptr null; void* handle (0x0)
	}, ; 578
	%struct.DSOCacheEntry {
		i64 3783409177, ; hash 0xe1823e19, from name: AIDLService
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.35_name, ; name: libaot-AIDLService.dll.so
		ptr null; void* handle (0x0)
	}, ; 579
	%struct.DSOCacheEntry {
		i64 3788641884, ; hash 0xe1d2165c, from name: _Microsoft.Android.Resource.Designer.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.28_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle (0x0)
	}, ; 580
	%struct.DSOCacheEntry {
		i64 3789578385, ; hash 0xe1e06091, from name: Trimble.Ssi.Interfaces.Gnss
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.57_name, ; name: libaot-Trimble.Ssi.Interfaces.Gnss.dll.so
		ptr null; void* handle (0x0)
	}, ; 581
	%struct.DSOCacheEntry {
		i64 3790421216, ; hash 0xe1ed3ce0, from name: monosgen-2.0
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.26_name, ; name: libmonosgen-2.0.so
		ptr null; void* handle (0x0)
	}, ; 582
	%struct.DSOCacheEntry {
		i64 3792276235, ; hash 0xe2098b0b, from name: System.Collections.NonGeneric
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.64_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle (0x0)
	}, ; 583
	%struct.DSOCacheEntry {
		i64 3808105303, ; hash 0xe2fb1357, from name: libaot-System.Threading.Thread
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.107_name, ; name: libaot-System.Threading.Thread.dll.so
		ptr null; void* handle (0x0)
	}, ; 584
	%struct.DSOCacheEntry {
		i64 3817984437, ; hash 0xe391d1b5, from name: libmonosgen-2.0.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.26_name, ; name: libmonosgen-2.0.so
		ptr null; void* handle (0x0)
	}, ; 585
	%struct.DSOCacheEntry {
		i64 3824070419, ; hash 0xe3eeaf13, from name: aot-System.ObjectModel.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.92_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle (0x0)
	}, ; 586
	%struct.DSOCacheEntry {
		i64 3827730753, ; hash 0xe4268941, from name: libaot-System.Text.Encoding.Extensions.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.105_name, ; name: libaot-System.Text.Encoding.Extensions.dll.so
		ptr null; void* handle (0x0)
	}, ; 587
	%struct.DSOCacheEntry {
		i64 3827825693, ; hash 0xe427fc1d, from name: aot-Trimble.Ssi.DriverProxy.Gnss.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.55_name, ; name: libaot-Trimble.Ssi.DriverProxy.Gnss.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 588
	%struct.DSOCacheEntry {
		i64 3831263026, ; hash 0xe45c6f32, from name: System.ComponentModel.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.69_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle (0x0)
	}, ; 589
	%struct.DSOCacheEntry {
		i64 3840401364, ; hash 0xe4e7dfd4, from name: libaot-Trimble.Ssi.Driver.MockGnss.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.53_name, ; name: libaot-Trimble.Ssi.Driver.MockGnss.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 590
	%struct.DSOCacheEntry {
		i64 3853820507, ; hash 0xe5b4a25b, from name: Trimble.Ssi.CSWrapped.Common
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.6_name, ; name: libTrimble.Ssi.CSWrapped.Common.so
		ptr null; void* handle (0x0)
	}, ; 591
	%struct.DSOCacheEntry {
		i64 3859621037, ; hash 0xe60d24ad, from name: Trimble.Ssi.Driver.Mock.GNSS.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.20_name, ; name: libTrimble.Ssi.Driver.Mock.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 592
	%struct.DSOCacheEntry {
		i64 3877344043, ; hash 0xe71b932b, from name: libaot-Trimble.TDDTransformation.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.58_name, ; name: libaot-Trimble.TDDTransformation.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 593
	%struct.DSOCacheEntry {
		i64 3878636756, ; hash 0xe72f4cd4, from name: libaot-Trimble.Ssi.DriverProxy.Gnss.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.55_name, ; name: libaot-Trimble.Ssi.DriverProxy.Gnss.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 594
	%struct.DSOCacheEntry {
		i64 3879410527, ; hash 0xe73b1b5f, from name: libGeodeticX.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.2_name, ; name: libGeodeticX.so
		ptr null; void* handle (0x0)
	}, ; 595
	%struct.DSOCacheEntry {
		i64 3881546260, ; hash 0xe75bb214, from name: libaot-Mono.Android.Export
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.117_name, ; name: libaot-Mono.Android.Export.dll.so
		ptr null; void* handle (0x0)
	}, ; 596
	%struct.DSOCacheEntry {
		i64 3882710139, ; hash 0xe76d747b, from name: aot-Mono.Android.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.119_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle (0x0)
	}, ; 597
	%struct.DSOCacheEntry {
		i64 3891366301, ; hash 0xe7f1899d, from name: aot-System.Net.Http
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.84_name, ; name: libaot-System.Net.Http.dll.so
		ptr null; void* handle (0x0)
	}, ; 598
	%struct.DSOCacheEntry {
		i64 3909437042, ; hash 0xe9054672, from name: libaot-System.Memory
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.83_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle (0x0)
	}, ; 599
	%struct.DSOCacheEntry {
		i64 3914371708, ; hash 0xe950927c, from name: aot-Trimble.Ssi.DriverCommon.Interfaces.Gnss.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.54_name, ; name: libaot-Trimble.Ssi.DriverCommon.Interfaces.Gnss.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 600
	%struct.DSOCacheEntry {
		i64 3915264716, ; hash 0xe95e32cc, from name: aot-System.Security.Cryptography
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.104_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle (0x0)
	}, ; 601
	%struct.DSOCacheEntry {
		i64 3925077246, ; hash 0xe9f3ecfe, from name: libaot-System.IO.Compression.Brotli.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.79_name, ; name: libaot-System.IO.Compression.Brotli.dll.so
		ptr null; void* handle (0x0)
	}, ; 602
	%struct.DSOCacheEntry {
		i64 3928044579, ; hash 0xea213423, from name: System.Xml.ReaderWriter
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.111_name, ; name: libaot-System.Xml.ReaderWriter.dll.so
		ptr null; void* handle (0x0)
	}, ; 603
	%struct.DSOCacheEntry {
		i64 3930735626, ; hash 0xea4a440a, from name: aot-Trimble.Ssi.Components.Core.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.38_name, ; name: libaot-Trimble.Ssi.Components.Core.dll.so
		ptr null; void* handle (0x0)
	}, ; 604
	%struct.DSOCacheEntry {
		i64 3934808307, ; hash 0xea8868f3, from name: libaot-Mono.Android
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.119_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle (0x0)
	}, ; 605
	%struct.DSOCacheEntry {
		i64 3943572889, ; hash 0xeb0e2599, from name: Trimble.Ssi.DriverProxy.Common.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.43_name, ; name: libaot-Trimble.Ssi.DriverProxy.Common.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 606
	%struct.DSOCacheEntry {
		i64 3949469681, ; hash 0xeb681ff1, from name: aot-Mono.Android.Runtime.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.118_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle (0x0)
	}, ; 607
	%struct.DSOCacheEntry {
		i64 3953226629, ; hash 0xeba17385, from name: Trimble.Licensing.CSWrapped.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.4_name, ; name: libTrimble.Licensing.CSWrapped.so
		ptr null; void* handle (0x0)
	}, ; 608
	%struct.DSOCacheEntry {
		i64 3956193289, ; hash 0xebceb809, from name: libaot-System.Memory.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.83_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle (0x0)
	}, ; 609
	%struct.DSOCacheEntry {
		i64 3959351344, ; hash 0xebfee830, from name: libTrimble.Ssi.Driver.CarpoBased.Driver.SP80.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.17_name, ; name: libTrimble.Ssi.Driver.CarpoBased.Driver.SP80.so
		ptr null; void* handle (0x0)
	}, ; 610
	%struct.DSOCacheEntry {
		i64 3977122455, ; hash 0xed0e1297, from name: libaot-Xamarin.Essentials
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.61_name, ; name: libaot-Xamarin.Essentials.dll.so
		ptr null; void* handle (0x0)
	}, ; 611
	%struct.DSOCacheEntry {
		i64 3980510446, ; hash 0xed41c4ee, from name: aot-System.Formats.Asn1
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.78_name, ; name: libaot-System.Formats.Asn1.dll.so
		ptr null; void* handle (0x0)
	}, ; 612
	%struct.DSOCacheEntry {
		i64 3983604604, ; hash 0xed70fb7c, from name: aot-Java.Interop
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.116_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle (0x0)
	}, ; 613
	%struct.DSOCacheEntry {
		i64 3991557191, ; hash 0xedea5447, from name: aot-System.Numerics.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.91_name, ; name: libaot-System.Numerics.dll.so
		ptr null; void* handle (0x0)
	}, ; 614
	%struct.DSOCacheEntry {
		i64 3992412609, ; hash 0xedf761c1, from name: System.Text.Encoding.Extensions.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.105_name, ; name: libaot-System.Text.Encoding.Extensions.dll.so
		ptr null; void* handle (0x0)
	}, ; 615
	%struct.DSOCacheEntry {
		i64 3996561484, ; hash 0xee36b04c, from name: aot-System.Runtime.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.103_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle (0x0)
	}, ; 616
	%struct.DSOCacheEntry {
		i64 3996883099, ; hash 0xee3b989b, from name: libaot-System.Net.ServicePoint
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.89_name, ; name: libaot-System.Net.ServicePoint.dll.so
		ptr null; void* handle (0x0)
	}, ; 617
	%struct.DSOCacheEntry {
		i64 4000242969, ; hash 0xee6edd19, from name: libaot-Trimble.Ssi.Interfaces.Gnss
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.57_name, ; name: libaot-Trimble.Ssi.Interfaces.Gnss.dll.so
		ptr null; void* handle (0x0)
	}, ; 618
	%struct.DSOCacheEntry {
		i64 4012575120, ; hash 0xef2b0990, from name: aot-Trimble.Ssi.DriverCommon.Core.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.40_name, ; name: libaot-Trimble.Ssi.DriverCommon.Core.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 619
	%struct.DSOCacheEntry {
		i64 4023143291, ; hash 0xefcc4b7b, from name: libDRV_TrimbleCommon
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.5_name, ; name: libDRV_TrimbleCommon.so
		ptr null; void* handle (0x0)
	}, ; 620
	%struct.DSOCacheEntry {
		i64 4024005801, ; hash 0xefd974a9, from name: libaot-System.Drawing.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.76_name, ; name: libaot-System.Drawing.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 621
	%struct.DSOCacheEntry {
		i64 4025784931, ; hash 0xeff49a63, from name: System.Memory
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.83_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle (0x0)
	}, ; 622
	%struct.DSOCacheEntry {
		i64 4032579209, ; hash 0xf05c4689, from name: Trimble.LicensingV2.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.37_name, ; name: libaot-Trimble.LicensingV2.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 623
	%struct.DSOCacheEntry {
		i64 4037669366, ; hash 0xf0a9f1f6, from name: aot-Trimble.Ssi.Driver.CarpoBased.Driver.SP80.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.52_name, ; name: libaot-Trimble.Ssi.Driver.CarpoBased.Driver.SP80.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 624
	%struct.DSOCacheEntry {
		i64 4040652439, ; hash 0xf0d77697, from name: aot-Trimble.EMPOWER.Common.Droid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.46_name, ; name: libaot-Trimble.EMPOWER.Common.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 625
	%struct.DSOCacheEntry {
		i64 4042557652, ; hash 0xf0f488d4, from name: libaot-System.ComponentModel
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.69_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle (0x0)
	}, ; 626
	%struct.DSOCacheEntry {
		i64 4054681211, ; hash 0xf1ad867b, from name: System.Reflection.Emit.ILGeneration
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.96_name, ; name: libaot-System.Reflection.Emit.ILGeneration.dll.so
		ptr null; void* handle (0x0)
	}, ; 627
	%struct.DSOCacheEntry {
		i64 4062117632, ; hash 0xf21eff00, from name: libaot-Trimble.Ssi.DriverCommon.Interfaces.Gnss.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.54_name, ; name: libaot-Trimble.Ssi.DriverCommon.Interfaces.Gnss.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 628
	%struct.DSOCacheEntry {
		i64 4063454328, ; hash 0xf2336478, from name: aot-System.IO.Compression.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.80_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle (0x0)
	}, ; 629
	%struct.DSOCacheEntry {
		i64 4065847622, ; hash 0xf257e946, from name: libDRV_SP80
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.13_name, ; name: libDRV_SP80.so
		ptr null; void* handle (0x0)
	}, ; 630
	%struct.DSOCacheEntry {
		i64 4075906844, ; hash 0xf2f1671c, from name: libaot-Trimble.Ssi.Drivers.Common.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.44_name, ; name: libaot-Trimble.Ssi.Drivers.Common.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 631
	%struct.DSOCacheEntry {
		i64 4080047704, ; hash 0xf3309658, from name: aot-EM940Lib-Mono-Android.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.32_name, ; name: libaot-EM940Lib-Mono-Android.dll.so
		ptr null; void* handle (0x0)
	}, ; 632
	%struct.DSOCacheEntry {
		i64 4081785581, ; hash 0xf34b1aed, from name: CatalystFacade.NET.Droid.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.30_name, ; name: libaot-CatalystFacade.NET.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 633
	%struct.DSOCacheEntry {
		i64 4087202641, ; hash 0xf39dc351, from name: mono-component-marshal-ilgen
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.25_name, ; name: libmono-component-marshal-ilgen.so
		ptr null; void* handle (0x0)
	}, ; 634
	%struct.DSOCacheEntry {
		i64 4100113165, ; hash 0xf462c30d, from name: System.Private.Uri
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.93_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle (0x0)
	}, ; 635
	%struct.DSOCacheEntry {
		i64 4112220824, ; hash 0xf51b8298, from name: aot-Xamarin.AndroidX.Core.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.60_name, ; name: libaot-Xamarin.AndroidX.Core.dll.so
		ptr null; void* handle (0x0)
	}, ; 636
	%struct.DSOCacheEntry {
		i64 4118719100, ; hash 0xf57eaa7c, from name: aot-Trimble.Ssi.Drivers.Gnss.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.56_name, ; name: libaot-Trimble.Ssi.Drivers.Gnss.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 637
	%struct.DSOCacheEntry {
		i64 4120203235, ; hash 0xf5954fe3, from name: Trimble.LicensingV2.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.37_name, ; name: libaot-Trimble.LicensingV2.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 638
	%struct.DSOCacheEntry {
		i64 4124759570, ; hash 0xf5dad612, from name: libaot-System.Private.CoreLib.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.120_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle (0x0)
	}, ; 639
	%struct.DSOCacheEntry {
		i64 4124899949, ; hash 0xf5dcfa6d, from name: libaot-Trimble.Ssi.Drivers.Gnss.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.56_name, ; name: libaot-Trimble.Ssi.Drivers.Gnss.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 640
	%struct.DSOCacheEntry {
		i64 4125976845, ; hash 0xf5ed690d, from name: System.ComponentModel.TypeConverter.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.68_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle (0x0)
	}, ; 641
	%struct.DSOCacheEntry {
		i64 4126351916, ; hash 0xf5f3222c, from name: AIDLService.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.35_name, ; name: libaot-AIDLService.dll.so
		ptr null; void* handle (0x0)
	}, ; 642
	%struct.DSOCacheEntry {
		i64 4127599839, ; hash 0xf6062cdf, from name: aot-System.Net.NameResolution.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.85_name, ; name: libaot-System.Net.NameResolution.dll.so
		ptr null; void* handle (0x0)
	}, ; 643
	%struct.DSOCacheEntry {
		i64 4138783678, ; hash 0xf6b0d3be, from name: aot-Xamarin.AndroidX.Browser.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.59_name, ; name: libaot-Xamarin.AndroidX.Browser.dll.so
		ptr null; void* handle (0x0)
	}, ; 644
	%struct.DSOCacheEntry {
		i64 4151237749, ; hash 0xf76edc75, from name: System.Core
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.71_name, ; name: libaot-System.Core.dll.so
		ptr null; void* handle (0x0)
	}, ; 645
	%struct.DSOCacheEntry {
		i64 4154531413, ; hash 0xf7a11e55, from name: aot-System
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.113_name, ; name: libaot-System.dll.so
		ptr null; void* handle (0x0)
	}, ; 646
	%struct.DSOCacheEntry {
		i64 4157186855, ; hash 0xf7c9a327, from name: libTrimble.Ssi.CSWrapped.Common.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.6_name, ; name: libTrimble.Ssi.CSWrapped.Common.so
		ptr null; void* handle (0x0)
	}, ; 647
	%struct.DSOCacheEntry {
		i64 4161309507, ; hash 0xf8088b43, from name: libaot-System.Private.CoreLib
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.120_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle (0x0)
	}, ; 648
	%struct.DSOCacheEntry {
		i64 4169082996, ; hash 0xf87f2874, from name: libaot-Xamarin.AndroidX.Core
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.60_name, ; name: libaot-Xamarin.AndroidX.Core.dll.so
		ptr null; void* handle (0x0)
	}, ; 649
	%struct.DSOCacheEntry {
		i64 4173297316, ; hash 0xf8bf76a4, from name: libaot-System.Net.NameResolution
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.85_name, ; name: libaot-System.Net.NameResolution.dll.so
		ptr null; void* handle (0x0)
	}, ; 650
	%struct.DSOCacheEntry {
		i64 4174597548, ; hash 0xf8d34dac, from name: Trimble.Ssi.DriverProxy.Gnss.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.55_name, ; name: libaot-Trimble.Ssi.DriverProxy.Gnss.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 651
	%struct.DSOCacheEntry {
		i64 4181436372, ; hash 0xf93ba7d4, from name: System.Runtime.Serialization.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.102_name, ; name: libaot-System.Runtime.Serialization.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 652
	%struct.DSOCacheEntry {
		i64 4181738464, ; hash 0xf94043e0, from name: DRV_TrimCom.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.14_name, ; name: libDRV_TrimCom.so
		ptr null; void* handle (0x0)
	}, ; 653
	%struct.DSOCacheEntry {
		i64 4185748872, ; hash 0xf97d7588, from name: libaot-System.Threading.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.109_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle (0x0)
	}, ; 654
	%struct.DSOCacheEntry {
		i64 4194414906, ; hash 0xfa01b13a, from name: aot-System.Private.Xml.Linq.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.94_name, ; name: libaot-System.Private.Xml.Linq.dll.so
		ptr null; void* handle (0x0)
	}, ; 655
	%struct.DSOCacheEntry {
		i64 4208266895, ; hash 0xfad50e8f, from name: aot-Trimble.Ssi.Drivers.Common.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.44_name, ; name: libaot-Trimble.Ssi.Drivers.Common.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 656
	%struct.DSOCacheEntry {
		i64 4216688043, ; hash 0xfb558dab, from name: aot-System.Numerics
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.91_name, ; name: libaot-System.Numerics.dll.so
		ptr null; void* handle (0x0)
	}, ; 657
	%struct.DSOCacheEntry {
		i64 4220458675, ; hash 0xfb8f16b3, from name: aot-AIDLService.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.35_name, ; name: libaot-AIDLService.dll.so
		ptr null; void* handle (0x0)
	}, ; 658
	%struct.DSOCacheEntry {
		i64 4222517145, ; hash 0xfbae7f99, from name: libaot-Trimble.Ssi.Driver.CarpoBased.Driver.RSeries.NET
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.51_name, ; name: libaot-Trimble.Ssi.Driver.CarpoBased.Driver.RSeries.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 659
	%struct.DSOCacheEntry {
		i64 4224035530, ; hash 0xfbc5aaca, from name: aot-Mono.Android.Runtime
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.118_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle (0x0)
	}, ; 660
	%struct.DSOCacheEntry {
		i64 4224174827, ; hash 0xfbc7caeb, from name: aot-Trimble.Ssi.DriverManagement.NET.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.42_name, ; name: libaot-Trimble.Ssi.DriverManagement.NET.dll.so
		ptr null; void* handle (0x0)
	}, ; 661
	%struct.DSOCacheEntry {
		i64 4238303082, ; hash 0xfc9f5f6a, from name: aot-System.Threading.ThreadPool.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.108_name, ; name: libaot-System.Threading.ThreadPool.dll.so
		ptr null; void* handle (0x0)
	}, ; 662
	%struct.DSOCacheEntry {
		i64 4249087357, ; hash 0xfd43ed7d, from name: AltGeoRelayService.Droid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.31_name, ; name: libaot-AltGeoRelayService.Droid.dll.so
		ptr null; void* handle (0x0)
	}, ; 663
	%struct.DSOCacheEntry {
		i64 4254738242, ; hash 0xfd9a2742, from name: aot-System.Collections.Specialized.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.65_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle (0x0)
	}, ; 664
	%struct.DSOCacheEntry {
		i64 4264044254, ; hash 0xfe2826de, from name: libaot-System.Runtime.InteropServices
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.99_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle (0x0)
	}, ; 665
	%struct.DSOCacheEntry {
		i64 4272149871, ; hash 0xfea3d56f, from name: libaot-Trimble.Ssi.Components.Core
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.38_name, ; name: libaot-Trimble.Ssi.Components.Core.dll.so
		ptr null; void* handle (0x0)
	}, ; 666
	%struct.DSOCacheEntry {
		i64 4274976490, ; hash 0xfecef6ea, from name: System.Runtime.Numerics
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.100_name, ; name: libaot-System.Runtime.Numerics.dll.so
		ptr null; void* handle (0x0)
	}, ; 667
	%struct.DSOCacheEntry {
		i64 4279247117, ; hash 0xff10210d, from name: libTrimble.Ssi.Driver.Mock.GNSS
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.20_name, ; name: libTrimble.Ssi.Driver.Mock.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 668
	%struct.DSOCacheEntry {
		i64 4288835934, ; hash 0xffa2715e, from name: System.Drawing.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.77_name, ; name: libaot-System.Drawing.dll.so
		ptr null; void* handle (0x0)
	} ; 669
], align 8

; Bundled assembly name buffers, all empty (unused when assembly stores are enabled)
@bundled_assemblies = dso_local local_unnamed_addr global [0 x %struct.XamarinAndroidBundledAssembly] zeroinitializer, align 4

@assembly_store_bundled_assemblies = dso_local local_unnamed_addr global [93 x %struct.AssemblyStoreSingleAssemblyRuntimeData] zeroinitializer, align 4

@assembly_stores = dso_local local_unnamed_addr global [2 x %struct.AssemblyStoreRuntimeData] zeroinitializer, align 4

; Strings
@.str.0 = private unnamed_addr constant [7 x i8] c"normal\00", align 1

; Application environment variables name:value pairs
@.env.0 = private unnamed_addr constant [15 x i8] c"MONO_GC_PARAMS\00", align 1
@.env.1 = private unnamed_addr constant [21 x i8] c"major=marksweep-conc\00", align 1
@.env.2 = private unnamed_addr constant [17 x i8] c"XAMARIN_BUILD_ID\00", align 1
@.env.3 = private unnamed_addr constant [37 x i8] c"787413b5-b937-4833-8757-e225c90bebd3\00", align 1
@.env.4 = private unnamed_addr constant [28 x i8] c"XA_HTTP_CLIENT_HANDLER_TYPE\00", align 1
@.env.5 = private unnamed_addr constant [42 x i8] c"Xamarin.Android.Net.AndroidMessageHandler\00", align 1
@.env.6 = private unnamed_addr constant [29 x i8] c"__XA_PACKAGE_NAMING_POLICY__\00", align 1
@.env.7 = private unnamed_addr constant [15 x i8] c"LowercaseCrc64\00", align 1

;ApplicationConfig
@.ApplicationConfig.0_android_package_name = private unnamed_addr constant [20 x i8] c"altgeo.relayservice\00", align 1

;DSOCacheEntry
@.DSOCacheEntry.0_name = private unnamed_addr constant [17 x i8] c"libc++_shared.so\00", align 1
@.DSOCacheEntry.1_name = private unnamed_addr constant [20 x i8] c"libCsdManagement.so\00", align 1
@.DSOCacheEntry.2_name = private unnamed_addr constant [16 x i8] c"libGeodeticX.so\00", align 1
@.DSOCacheEntry.3_name = private unnamed_addr constant [29 x i8] c"libTDDTransformationLibCS.so\00", align 1
@.DSOCacheEntry.4_name = private unnamed_addr constant [34 x i8] c"libTrimble.Licensing.CSWrapped.so\00", align 1
@.DSOCacheEntry.5_name = private unnamed_addr constant [24 x i8] c"libDRV_TrimbleCommon.so\00", align 1
@.DSOCacheEntry.6_name = private unnamed_addr constant [35 x i8] c"libTrimble.Ssi.CSWrapped.Common.so\00", align 1
@.DSOCacheEntry.7_name = private unnamed_addr constant [43 x i8] c"libTrimble.Ssi.Driver.CarpoBased.Common.so\00", align 1
@.DSOCacheEntry.8_name = private unnamed_addr constant [45 x i8] c"libTrimble.Ssi.Driver.DriverCommon.Common.so\00", align 1
@.DSOCacheEntry.9_name = private unnamed_addr constant [37 x i8] c"libTrimble.Ssi.Driver.Mock.Common.so\00", align 1
@.DSOCacheEntry.10_name = private unnamed_addr constant [35 x i8] c"libTrimble.Ssi.DriverManagement.so\00", align 1
@.DSOCacheEntry.11_name = private unnamed_addr constant [36 x i8] c"libTrimble.Ssi.Interfaces.Common.so\00", align 1
@.DSOCacheEntry.12_name = private unnamed_addr constant [18 x i8] c"libASerialPort.so\00", align 1
@.DSOCacheEntry.13_name = private unnamed_addr constant [15 x i8] c"libDRV_SP80.so\00", align 1
@.DSOCacheEntry.14_name = private unnamed_addr constant [18 x i8] c"libDRV_TrimCom.so\00", align 1
@.DSOCacheEntry.15_name = private unnamed_addr constant [33 x i8] c"libTrimble.Ssi.CSWrapped.GNSS.so\00", align 1
@.DSOCacheEntry.16_name = private unnamed_addr constant [51 x i8] c"libTrimble.Ssi.Driver.CarpoBased.Driver.RSeries.so\00", align 1
@.DSOCacheEntry.17_name = private unnamed_addr constant [48 x i8] c"libTrimble.Ssi.Driver.CarpoBased.Driver.SP80.so\00", align 1
@.DSOCacheEntry.18_name = private unnamed_addr constant [41 x i8] c"libTrimble.Ssi.Driver.CarpoBased.GNSS.so\00", align 1
@.DSOCacheEntry.19_name = private unnamed_addr constant [43 x i8] c"libTrimble.Ssi.Driver.DriverCommon.GNSS.so\00", align 1
@.DSOCacheEntry.20_name = private unnamed_addr constant [35 x i8] c"libTrimble.Ssi.Driver.Mock.GNSS.so\00", align 1
@.DSOCacheEntry.21_name = private unnamed_addr constant [34 x i8] c"libTrimble.Ssi.Interfaces.GNSS.so\00", align 1
@.DSOCacheEntry.22_name = private unnamed_addr constant [35 x i8] c"libSystem.IO.Compression.Native.so\00", align 1
@.DSOCacheEntry.23_name = private unnamed_addr constant [20 x i8] c"libSystem.Native.so\00", align 1
@.DSOCacheEntry.24_name = private unnamed_addr constant [50 x i8] c"libSystem.Security.Cryptography.Native.Android.so\00", align 1
@.DSOCacheEntry.25_name = private unnamed_addr constant [35 x i8] c"libmono-component-marshal-ilgen.so\00", align 1
@.DSOCacheEntry.26_name = private unnamed_addr constant [19 x i8] c"libmonosgen-2.0.so\00", align 1
@.DSOCacheEntry.27_name = private unnamed_addr constant [16 x i8] c"libmonodroid.so\00", align 1
@.DSOCacheEntry.28_name = private unnamed_addr constant [51 x i8] c"libaot-_Microsoft.Android.Resource.Designer.dll.so\00", align 1
@.DSOCacheEntry.29_name = private unnamed_addr constant [33 x i8] c"libaot-CatalystFacade.NET.dll.so\00", align 1
@.DSOCacheEntry.30_name = private unnamed_addr constant [39 x i8] c"libaot-CatalystFacade.NET.Droid.dll.so\00", align 1
@.DSOCacheEntry.31_name = private unnamed_addr constant [39 x i8] c"libaot-AltGeoRelayService.Droid.dll.so\00", align 1
@.DSOCacheEntry.32_name = private unnamed_addr constant [36 x i8] c"libaot-EM940Lib-Mono-Android.dll.so\00", align 1
@.DSOCacheEntry.33_name = private unnamed_addr constant [30 x i8] c"libaot-Google.Protobuf.dll.so\00", align 1
@.DSOCacheEntry.34_name = private unnamed_addr constant [30 x i8] c"libaot-Newtonsoft.Json.dll.so\00", align 1
@.DSOCacheEntry.35_name = private unnamed_addr constant [26 x i8] c"libaot-AIDLService.dll.so\00", align 1
@.DSOCacheEntry.36_name = private unnamed_addr constant [43 x i8] c"libaot-Trimble.Licensing.Interfaces.dll.so\00", align 1
@.DSOCacheEntry.37_name = private unnamed_addr constant [38 x i8] c"libaot-Trimble.LicensingV2.NET.dll.so\00", align 1
@.DSOCacheEntry.38_name = private unnamed_addr constant [42 x i8] c"libaot-Trimble.Ssi.Components.Core.dll.so\00", align 1
@.DSOCacheEntry.39_name = private unnamed_addr constant [31 x i8] c"libaot-Trimble.Ssi.Core.dll.so\00", align 1
@.DSOCacheEntry.40_name = private unnamed_addr constant [48 x i8] c"libaot-Trimble.Ssi.DriverCommon.Core.NET.dll.so\00", align 1
@.DSOCacheEntry.41_name = private unnamed_addr constant [54 x i8] c"libaot-Trimble.Ssi.DriverCommon.Interfaces.NET.dll.so\00", align 1
@.DSOCacheEntry.42_name = private unnamed_addr constant [47 x i8] c"libaot-Trimble.Ssi.DriverManagement.NET.dll.so\00", align 1
@.DSOCacheEntry.43_name = private unnamed_addr constant [49 x i8] c"libaot-Trimble.Ssi.DriverProxy.Common.NET.dll.so\00", align 1
@.DSOCacheEntry.44_name = private unnamed_addr constant [45 x i8] c"libaot-Trimble.Ssi.Drivers.Common.NET.dll.so\00", align 1
@.DSOCacheEntry.45_name = private unnamed_addr constant [37 x i8] c"libaot-Trimble.Ssi.Interfaces.dll.so\00", align 1
@.DSOCacheEntry.46_name = private unnamed_addr constant [43 x i8] c"libaot-Trimble.EMPOWER.Common.Droid.dll.so\00", align 1
@.DSOCacheEntry.47_name = private unnamed_addr constant [48 x i8] c"libaot-Trimble.EMPOWER.JavaBinding.Droid.dll.so\00", align 1
@.DSOCacheEntry.48_name = private unnamed_addr constant [44 x i8] c"libaot-Trimble.EMPOWER.Manager.Droid.dll.so\00", align 1
@.DSOCacheEntry.49_name = private unnamed_addr constant [76 x i8] c"libaot-Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.Android.dll.so\00", align 1
@.DSOCacheEntry.50_name = private unnamed_addr constant [81 x i8] c"libaot-Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.JavaBindings.dll.so\00", align 1
@.DSOCacheEntry.51_name = private unnamed_addr constant [63 x i8] c"libaot-Trimble.Ssi.Driver.CarpoBased.Driver.RSeries.NET.dll.so\00", align 1
@.DSOCacheEntry.52_name = private unnamed_addr constant [60 x i8] c"libaot-Trimble.Ssi.Driver.CarpoBased.Driver.SP80.NET.dll.so\00", align 1
@.DSOCacheEntry.53_name = private unnamed_addr constant [46 x i8] c"libaot-Trimble.Ssi.Driver.MockGnss.NET.dll.so\00", align 1
@.DSOCacheEntry.54_name = private unnamed_addr constant [59 x i8] c"libaot-Trimble.Ssi.DriverCommon.Interfaces.Gnss.NET.dll.so\00", align 1
@.DSOCacheEntry.55_name = private unnamed_addr constant [47 x i8] c"libaot-Trimble.Ssi.DriverProxy.Gnss.NET.dll.so\00", align 1
@.DSOCacheEntry.56_name = private unnamed_addr constant [43 x i8] c"libaot-Trimble.Ssi.Drivers.Gnss.NET.dll.so\00", align 1
@.DSOCacheEntry.57_name = private unnamed_addr constant [42 x i8] c"libaot-Trimble.Ssi.Interfaces.Gnss.dll.so\00", align 1
@.DSOCacheEntry.58_name = private unnamed_addr constant [44 x i8] c"libaot-Trimble.TDDTransformation.NET.dll.so\00", align 1
@.DSOCacheEntry.59_name = private unnamed_addr constant [39 x i8] c"libaot-Xamarin.AndroidX.Browser.dll.so\00", align 1
@.DSOCacheEntry.60_name = private unnamed_addr constant [36 x i8] c"libaot-Xamarin.AndroidX.Core.dll.so\00", align 1
@.DSOCacheEntry.61_name = private unnamed_addr constant [33 x i8] c"libaot-Xamarin.Essentials.dll.so\00", align 1
@.DSOCacheEntry.62_name = private unnamed_addr constant [31 x i8] c"libaot-Microsoft.CSharp.dll.so\00", align 1
@.DSOCacheEntry.63_name = private unnamed_addr constant [44 x i8] c"libaot-System.Collections.Concurrent.dll.so\00", align 1
@.DSOCacheEntry.64_name = private unnamed_addr constant [44 x i8] c"libaot-System.Collections.NonGeneric.dll.so\00", align 1
@.DSOCacheEntry.65_name = private unnamed_addr constant [45 x i8] c"libaot-System.Collections.Specialized.dll.so\00", align 1
@.DSOCacheEntry.66_name = private unnamed_addr constant [33 x i8] c"libaot-System.Collections.dll.so\00", align 1
@.DSOCacheEntry.67_name = private unnamed_addr constant [47 x i8] c"libaot-System.ComponentModel.Primitives.dll.so\00", align 1
@.DSOCacheEntry.68_name = private unnamed_addr constant [50 x i8] c"libaot-System.ComponentModel.TypeConverter.dll.so\00", align 1
@.DSOCacheEntry.69_name = private unnamed_addr constant [36 x i8] c"libaot-System.ComponentModel.dll.so\00", align 1
@.DSOCacheEntry.70_name = private unnamed_addr constant [29 x i8] c"libaot-System.Console.dll.so\00", align 1
@.DSOCacheEntry.71_name = private unnamed_addr constant [26 x i8] c"libaot-System.Core.dll.so\00", align 1
@.DSOCacheEntry.72_name = private unnamed_addr constant [33 x i8] c"libaot-System.Data.Common.dll.so\00", align 1
@.DSOCacheEntry.73_name = private unnamed_addr constant [50 x i8] c"libaot-System.Diagnostics.DiagnosticSource.dll.so\00", align 1
@.DSOCacheEntry.74_name = private unnamed_addr constant [44 x i8] c"libaot-System.Diagnostics.StackTrace.dll.so\00", align 1
@.DSOCacheEntry.75_name = private unnamed_addr constant [45 x i8] c"libaot-System.Diagnostics.TraceSource.dll.so\00", align 1
@.DSOCacheEntry.76_name = private unnamed_addr constant [40 x i8] c"libaot-System.Drawing.Primitives.dll.so\00", align 1
@.DSOCacheEntry.77_name = private unnamed_addr constant [29 x i8] c"libaot-System.Drawing.dll.so\00", align 1
@.DSOCacheEntry.78_name = private unnamed_addr constant [34 x i8] c"libaot-System.Formats.Asn1.dll.so\00", align 1
@.DSOCacheEntry.79_name = private unnamed_addr constant [43 x i8] c"libaot-System.IO.Compression.Brotli.dll.so\00", align 1
@.DSOCacheEntry.80_name = private unnamed_addr constant [36 x i8] c"libaot-System.IO.Compression.dll.so\00", align 1
@.DSOCacheEntry.81_name = private unnamed_addr constant [38 x i8] c"libaot-System.Linq.Expressions.dll.so\00", align 1
@.DSOCacheEntry.82_name = private unnamed_addr constant [26 x i8] c"libaot-System.Linq.dll.so\00", align 1
@.DSOCacheEntry.83_name = private unnamed_addr constant [28 x i8] c"libaot-System.Memory.dll.so\00", align 1
@.DSOCacheEntry.84_name = private unnamed_addr constant [30 x i8] c"libaot-System.Net.Http.dll.so\00", align 1
@.DSOCacheEntry.85_name = private unnamed_addr constant [40 x i8] c"libaot-System.Net.NameResolution.dll.so\00", align 1
@.DSOCacheEntry.86_name = private unnamed_addr constant [36 x i8] c"libaot-System.Net.Primitives.dll.so\00", align 1
@.DSOCacheEntry.87_name = private unnamed_addr constant [34 x i8] c"libaot-System.Net.Requests.dll.so\00", align 1
@.DSOCacheEntry.88_name = private unnamed_addr constant [34 x i8] c"libaot-System.Net.Security.dll.so\00", align 1
@.DSOCacheEntry.89_name = private unnamed_addr constant [38 x i8] c"libaot-System.Net.ServicePoint.dll.so\00", align 1
@.DSOCacheEntry.90_name = private unnamed_addr constant [33 x i8] c"libaot-System.Net.Sockets.dll.so\00", align 1
@.DSOCacheEntry.91_name = private unnamed_addr constant [30 x i8] c"libaot-System.Numerics.dll.so\00", align 1
@.DSOCacheEntry.92_name = private unnamed_addr constant [33 x i8] c"libaot-System.ObjectModel.dll.so\00", align 1
@.DSOCacheEntry.93_name = private unnamed_addr constant [33 x i8] c"libaot-System.Private.Uri.dll.so\00", align 1
@.DSOCacheEntry.94_name = private unnamed_addr constant [38 x i8] c"libaot-System.Private.Xml.Linq.dll.so\00", align 1
@.DSOCacheEntry.95_name = private unnamed_addr constant [33 x i8] c"libaot-System.Private.Xml.dll.so\00", align 1
@.DSOCacheEntry.96_name = private unnamed_addr constant [50 x i8] c"libaot-System.Reflection.Emit.ILGeneration.dll.so\00", align 1
@.DSOCacheEntry.97_name = private unnamed_addr constant [49 x i8] c"libaot-System.Reflection.Emit.Lightweight.dll.so\00", align 1
@.DSOCacheEntry.98_name = private unnamed_addr constant [43 x i8] c"libaot-System.Reflection.Primitives.dll.so\00", align 1
@.DSOCacheEntry.99_name = private unnamed_addr constant [45 x i8] c"libaot-System.Runtime.InteropServices.dll.so\00", align 1
@.DSOCacheEntry.100_name = private unnamed_addr constant [38 x i8] c"libaot-System.Runtime.Numerics.dll.so\00", align 1
@.DSOCacheEntry.101_name = private unnamed_addr constant [54 x i8] c"libaot-System.Runtime.Serialization.Formatters.dll.so\00", align 1
@.DSOCacheEntry.102_name = private unnamed_addr constant [54 x i8] c"libaot-System.Runtime.Serialization.Primitives.dll.so\00", align 1
@.DSOCacheEntry.103_name = private unnamed_addr constant [29 x i8] c"libaot-System.Runtime.dll.so\00", align 1
@.DSOCacheEntry.104_name = private unnamed_addr constant [43 x i8] c"libaot-System.Security.Cryptography.dll.so\00", align 1
@.DSOCacheEntry.105_name = private unnamed_addr constant [46 x i8] c"libaot-System.Text.Encoding.Extensions.dll.so\00", align 1
@.DSOCacheEntry.106_name = private unnamed_addr constant [45 x i8] c"libaot-System.Text.RegularExpressions.dll.so\00", align 1
@.DSOCacheEntry.107_name = private unnamed_addr constant [38 x i8] c"libaot-System.Threading.Thread.dll.so\00", align 1
@.DSOCacheEntry.108_name = private unnamed_addr constant [42 x i8] c"libaot-System.Threading.ThreadPool.dll.so\00", align 1
@.DSOCacheEntry.109_name = private unnamed_addr constant [31 x i8] c"libaot-System.Threading.dll.so\00", align 1
@.DSOCacheEntry.110_name = private unnamed_addr constant [30 x i8] c"libaot-System.Xml.Linq.dll.so\00", align 1
@.DSOCacheEntry.111_name = private unnamed_addr constant [38 x i8] c"libaot-System.Xml.ReaderWriter.dll.so\00", align 1
@.DSOCacheEntry.112_name = private unnamed_addr constant [35 x i8] c"libaot-System.Xml.XDocument.dll.so\00", align 1
@.DSOCacheEntry.113_name = private unnamed_addr constant [21 x i8] c"libaot-System.dll.so\00", align 1
@.DSOCacheEntry.114_name = private unnamed_addr constant [23 x i8] c"libaot-mscorlib.dll.so\00", align 1
@.DSOCacheEntry.115_name = private unnamed_addr constant [26 x i8] c"libaot-netstandard.dll.so\00", align 1
@.DSOCacheEntry.116_name = private unnamed_addr constant [27 x i8] c"libaot-Java.Interop.dll.so\00", align 1
@.DSOCacheEntry.117_name = private unnamed_addr constant [34 x i8] c"libaot-Mono.Android.Export.dll.so\00", align 1
@.DSOCacheEntry.118_name = private unnamed_addr constant [35 x i8] c"libaot-Mono.Android.Runtime.dll.so\00", align 1
@.DSOCacheEntry.119_name = private unnamed_addr constant [27 x i8] c"libaot-Mono.Android.dll.so\00", align 1
@.DSOCacheEntry.120_name = private unnamed_addr constant [37 x i8] c"libaot-System.Private.CoreLib.dll.so\00", align 1

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
