; ModuleID = 'environment.x86_64.ll'
source_filename = "environment.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

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

@mono_aot_mode_name = dso_local local_unnamed_addr constant ptr @.str.0, align 8

; Application environment variables array, name:value
@app_environment_variables = dso_local local_unnamed_addr constant [12 x ptr] [
	ptr @.env.0, ; 0
	ptr @.env.1, ; 1
	ptr @.env.2, ; 2
	ptr @.env.3, ; 3
	ptr @.env.4, ; 4
	ptr @.env.5, ; 5
	ptr @.env.6, ; 6
	ptr @.env.7, ; 7
	ptr @.env.8, ; 8
	ptr @.env.9, ; 9
	ptr @.env.10, ; 10
	ptr @.env.11 ; 11
], align 16

; System properties defined by the application
@app_system_properties = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@application_config = dso_local local_unnamed_addr constant %struct.ApplicationConfig {
	i8 0, ; bool uses_mono_llvm
	i8 1, ; bool uses_mono_aot
	i8 0, ; bool aot_lazy_load
	i8 0, ; bool uses_assembly_preload
	i8 0, ; bool broken_exception_transitions
	i8 0, ; bool instant_run_enabled
	i8 0, ; bool jni_add_native_method_registration_attribute_present
	i8 1, ; bool have_runtime_config_blob
	i8 0, ; bool have_assemblies_blob
	i8 0, ; bool marshal_methods_enabled
	i8 0, ; uint8_t bound_stream_io_exception_type (0x0)
	i32 3, ; uint32_t package_naming_policy (0x3)
	i32 12, ; uint32_t environment_variable_count (0xc)
	i32 0, ; uint32_t system_property_count (0x0)
	i32 217, ; uint32_t number_of_assemblies_in_apk (0xd9)
	i32 83, ; uint32_t bundled_assembly_name_width (0x53)
	i32 2, ; uint32_t number_of_assembly_store_files (0x2)
	i32 124, ; uint32_t number_of_dso_cache_entries (0x7c)
	i32 33560135, ; uint32_t android_runtime_jnienv_class_token (0x2001647)
	i32 100757451, ; uint32_t jnienv_initialize_method_token (0x6016fcb)
	i32 100757450, ; uint32_t jnienv_registerjninatives_method_token (0x6016fca)
	i32 0, ; uint32_t jni_remapping_replacement_type_count (0x0)
	i32 0, ; uint32_t jni_remapping_replacement_method_index_entry_count (0x0)
	i32 3, ; uint32_t mono_components_mask (0x3)
	ptr @.ApplicationConfig.0_android_package_name; char* android_package_name
}, align 16

; DSO cache entries
@dso_cache = dso_local local_unnamed_addr global [124 x %struct.DSOCacheEntry] [
	%struct.DSOCacheEntry {
		i64 347497657448058749, ; hash 0x4d28f474078cf7d, from name: Trimble.Licensing.CSWrapped
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.4_name, ; name: libTrimble.Licensing.CSWrapped.so
		ptr null; void* handle (0x0)
	}, ; 0
	%struct.DSOCacheEntry {
		i64 421191950900359696, ; hash 0x5d85fd907ab7210, from name: libTrimble.Ssi.Interfaces.GNSS.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.21_name, ; name: libTrimble.Ssi.Interfaces.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 1
	%struct.DSOCacheEntry {
		i64 716574749169539573, ; hash 0x9f1c8f01343d9f5, from name: mono-component-debugger
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.25_name, ; name: libmono-component-debugger.so
		ptr null; void* handle (0x0)
	}, ; 2
	%struct.DSOCacheEntry {
		i64 900827901967744002, ; hash 0xc8062343c8c3c02, from name: libTrimble.Ssi.Interfaces.Common.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.11_name, ; name: libTrimble.Ssi.Interfaces.Common.so
		ptr null; void* handle (0x0)
	}, ; 3
	%struct.DSOCacheEntry {
		i64 1323381466224809628, ; hash 0x125d986e94aa569c, from name: Trimble.Ssi.Interfaces.Common.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.11_name, ; name: libTrimble.Ssi.Interfaces.Common.so
		ptr null; void* handle (0x0)
	}, ; 4
	%struct.DSOCacheEntry {
		i64 1499327756876432029, ; hash 0x14ceaea6ae80c29d, from name: libSystem.Security.Cryptography.Native.Android
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.24_name, ; name: libSystem.Security.Cryptography.Native.Android.so
		ptr null; void* handle (0x0)
	}, ; 5
	%struct.DSOCacheEntry {
		i64 1540646851709506810, ; hash 0x15617a26207814fa, from name: libTrimble.Ssi.DriverManagement.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.10_name, ; name: libTrimble.Ssi.DriverManagement.so
		ptr null; void* handle (0x0)
	}, ; 6
	%struct.DSOCacheEntry {
		i64 1593048907800094904, ; hash 0x161ba58a933fa8b8, from name: libTrimble.Ssi.Interfaces.GNSS
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.21_name, ; name: libTrimble.Ssi.Interfaces.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 7
	%struct.DSOCacheEntry {
		i64 1836157511240954908, ; hash 0x197b5787312eb41c, from name: Trimble.Ssi.Driver.DriverCommon.GNSS
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.19_name, ; name: libTrimble.Ssi.Driver.DriverCommon.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 8
	%struct.DSOCacheEntry {
		i64 1910901547840497261, ; hash 0x1a84e2d557c6e66d, from name: Trimble.Ssi.Driver.CarpoBased.Common
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.7_name, ; name: libTrimble.Ssi.Driver.CarpoBased.Common.so
		ptr null; void* handle (0x0)
	}, ; 9
	%struct.DSOCacheEntry {
		i64 2110379766782019134, ; hash 0x1d4993377436c63e, from name: c++_shared.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.0_name, ; name: libc++_shared.so
		ptr null; void* handle (0x0)
	}, ; 10
	%struct.DSOCacheEntry {
		i64 2226064664651161910, ; hash 0x1ee49204af94e136, from name: Trimble.Ssi.Driver.DriverCommon.GNSS.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.19_name, ; name: libTrimble.Ssi.Driver.DriverCommon.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 11
	%struct.DSOCacheEntry {
		i64 2273024343426284947, ; hash 0x1f8b6798ebbd3d93, from name: libTrimble.Ssi.Driver.DriverCommon.GNSS.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.19_name, ; name: libTrimble.Ssi.Driver.DriverCommon.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 12
	%struct.DSOCacheEntry {
		i64 2613290965474876856, ; hash 0x244446498bde1db8, from name: libTrimble.Ssi.Driver.CarpoBased.Driver.RSeries.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.16_name, ; name: libTrimble.Ssi.Driver.CarpoBased.Driver.RSeries.so
		ptr null; void* handle (0x0)
	}, ; 13
	%struct.DSOCacheEntry {
		i64 2676598929141056664, ; hash 0x2525308b79a4c498, from name: xamarin-debug-app-helper.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.30_name, ; name: libxamarin-debug-app-helper.so
		ptr null; void* handle (0x0)
	}, ; 14
	%struct.DSOCacheEntry {
		i64 2874548472262303625, ; hash 0x27e4729b02d61f89, from name: libCsdManagement
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.1_name, ; name: libCsdManagement.so
		ptr null; void* handle (0x0)
	}, ; 15
	%struct.DSOCacheEntry {
		i64 2936479864511649409, ; hash 0x28c078e0ee4dd681, from name: Trimble.Ssi.Driver.Mock.Common.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.9_name, ; name: libTrimble.Ssi.Driver.Mock.Common.so
		ptr null; void* handle (0x0)
	}, ; 16
	%struct.DSOCacheEntry {
		i64 3197983406552962318, ; hash 0x2c6184f6f12ed50e, from name: libc++_shared
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.0_name, ; name: libc++_shared.so
		ptr null; void* handle (0x0)
	}, ; 17
	%struct.DSOCacheEntry {
		i64 3569692625789698928, ; hash 0x318a1887b586c370, from name: libmono-component-hot_reload
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.26_name, ; name: libmono-component-hot_reload.so
		ptr null; void* handle (0x0)
	}, ; 18
	%struct.DSOCacheEntry {
		i64 3714643818034126690, ; hash 0x338d10df19065f62, from name: libTrimble.Ssi.Driver.CarpoBased.GNSS.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.18_name, ; name: libTrimble.Ssi.Driver.CarpoBased.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 19
	%struct.DSOCacheEntry {
		i64 3733113624843110650, ; hash 0x33ceaf101af1c8fa, from name: libTDDTransformationLibCS
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.3_name, ; name: libTDDTransformationLibCS.so
		ptr null; void* handle (0x0)
	}, ; 20
	%struct.DSOCacheEntry {
		i64 4127010257322504965, ; hash 0x394615f69419f305, from name: libTrimble.Ssi.Driver.Mock.Common.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.9_name, ; name: libTrimble.Ssi.Driver.Mock.Common.so
		ptr null; void* handle (0x0)
	}, ; 21
	%struct.DSOCacheEntry {
		i64 4426302792580356764, ; hash 0x3d6d62f034125a9c, from name: libc++_shared.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.0_name, ; name: libc++_shared.so
		ptr null; void* handle (0x0)
	}, ; 22
	%struct.DSOCacheEntry {
		i64 4904088815151503267, ; hash 0x440ed2cb5e1257a3, from name: libTrimble.Ssi.CSWrapped.Common.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.6_name, ; name: libTrimble.Ssi.CSWrapped.Common.so
		ptr null; void* handle (0x0)
	}, ; 23
	%struct.DSOCacheEntry {
		i64 5095478816399000775, ; hash 0x46b6c6fc8bfd84c7, from name: DRV_TrimCom
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.14_name, ; name: libDRV_TrimCom.so
		ptr null; void* handle (0x0)
	}, ; 24
	%struct.DSOCacheEntry {
		i64 5449495136202380799, ; hash 0x4ba07ef4268fd5ff, from name: libDRV_TrimbleCommon
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.5_name, ; name: libDRV_TrimbleCommon.so
		ptr null; void* handle (0x0)
	}, ; 25
	%struct.DSOCacheEntry {
		i64 5450519528561288992, ; hash 0x4ba422a21539a720, from name: ASerialPort
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.12_name, ; name: libASerialPort.so
		ptr null; void* handle (0x0)
	}, ; 26
	%struct.DSOCacheEntry {
		i64 5642869431399447073, ; hash 0x4e4f7fd9c4797a21, from name: libmono-component-hot_reload.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.26_name, ; name: libmono-component-hot_reload.so
		ptr null; void* handle (0x0)
	}, ; 27
	%struct.DSOCacheEntry {
		i64 5647632537601878794, ; hash 0x4e606bded9b2ab0a, from name: Trimble.Ssi.CSWrapped.GNSS.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.15_name, ; name: libTrimble.Ssi.CSWrapped.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 28
	%struct.DSOCacheEntry {
		i64 5900900230463535802, ; hash 0x51e4357ecbccbaba, from name: System.Security.Cryptography.Native.Android.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.24_name, ; name: libSystem.Security.Cryptography.Native.Android.so
		ptr null; void* handle (0x0)
	}, ; 29
	%struct.DSOCacheEntry {
		i64 5948985717485083712, ; hash 0x528f0afdb0921c40, from name: libSystem.Native.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.23_name, ; name: libSystem.Native.so
		ptr null; void* handle (0x0)
	}, ; 30
	%struct.DSOCacheEntry {
		i64 6073268355799849528, ; hash 0x544895645d121a38, from name: libmono-component-debugger
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.25_name, ; name: libmono-component-debugger.so
		ptr null; void* handle (0x0)
	}, ; 31
	%struct.DSOCacheEntry {
		i64 6308061292769401015, ; hash 0x578abc5300e958b7, from name: libSystem.Native
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.23_name, ; name: libSystem.Native.so
		ptr null; void* handle (0x0)
	}, ; 32
	%struct.DSOCacheEntry {
		i64 6396556681935993707, ; hash 0x58c522696c723b6b, from name: libDRV_TrimCom
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.14_name, ; name: libDRV_TrimCom.so
		ptr null; void* handle (0x0)
	}, ; 33
	%struct.DSOCacheEntry {
		i64 6558713382764477133, ; hash 0x5b053b127346facd, from name: mono-component-marshal-ilgen.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.27_name, ; name: libmono-component-marshal-ilgen.so
		ptr null; void* handle (0x0)
	}, ; 34
	%struct.DSOCacheEntry {
		i64 6635387966917840004, ; hash 0x5c15a2333b0a0c84, from name: libxamarin-debug-app-helper.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.30_name, ; name: libxamarin-debug-app-helper.so
		ptr null; void* handle (0x0)
	}, ; 35
	%struct.DSOCacheEntry {
		i64 6738024108209336664, ; hash 0x5d82453a11d5f158, from name: libTrimble.Ssi.Driver.Mock.GNSS.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.20_name, ; name: libTrimble.Ssi.Driver.Mock.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 36
	%struct.DSOCacheEntry {
		i64 6913716284728566067, ; hash 0x5ff274549d146133, from name: System.IO.Compression.Native.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.22_name, ; name: libSystem.IO.Compression.Native.so
		ptr null; void* handle (0x0)
	}, ; 37
	%struct.DSOCacheEntry {
		i64 6960793896336070451, ; hash 0x6099b52b39d19733, from name: Trimble.Ssi.CSWrapped.Common.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.6_name, ; name: libTrimble.Ssi.CSWrapped.Common.so
		ptr null; void* handle (0x0)
	}, ; 38
	%struct.DSOCacheEntry {
		i64 7039314899695020382, ; hash 0x61b0ab9afa6fa95e, from name: c++_shared
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.0_name, ; name: libc++_shared.so
		ptr null; void* handle (0x0)
	}, ; 39
	%struct.DSOCacheEntry {
		i64 7261221715196233582, ; hash 0x64c50aada99fc76e, from name: Trimble.Ssi.Driver.CarpoBased.Driver.SP80
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.17_name, ; name: libTrimble.Ssi.Driver.CarpoBased.Driver.SP80.so
		ptr null; void* handle (0x0)
	}, ; 40
	%struct.DSOCacheEntry {
		i64 7338982286544642983, ; hash 0x65d94d818a60a3a7, from name: monodroid.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.29_name, ; name: libmonodroid.so
		ptr null; void* handle (0x0)
	}, ; 41
	%struct.DSOCacheEntry {
		i64 7415347135721941512, ; hash 0x66e89aee86eaaa08, from name: libmono-component-marshal-ilgen
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.27_name, ; name: libmono-component-marshal-ilgen.so
		ptr null; void* handle (0x0)
	}, ; 42
	%struct.DSOCacheEntry {
		i64 7616134622292017529, ; hash 0x69b1f21643450179, from name: libTrimble.Ssi.Driver.CarpoBased.Driver.SP80
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.17_name, ; name: libTrimble.Ssi.Driver.CarpoBased.Driver.SP80.so
		ptr null; void* handle (0x0)
	}, ; 43
	%struct.DSOCacheEntry {
		i64 7639941140308737920, ; hash 0x6a0685fd2cfebf80, from name: libSystem.IO.Compression.Native.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.22_name, ; name: libSystem.IO.Compression.Native.so
		ptr null; void* handle (0x0)
	}, ; 44
	%struct.DSOCacheEntry {
		i64 7740286304433625072, ; hash 0x6b6b0562539657f0, from name: libmonosgen-2.0
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.28_name, ; name: libmonosgen-2.0.so
		ptr null; void* handle (0x0)
	}, ; 45
	%struct.DSOCacheEntry {
		i64 7784014794966635893, ; hash 0x6c066036ec5f1575, from name: libTrimble.Ssi.Driver.CarpoBased.Driver.RSeries
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.16_name, ; name: libTrimble.Ssi.Driver.CarpoBased.Driver.RSeries.so
		ptr null; void* handle (0x0)
	}, ; 46
	%struct.DSOCacheEntry {
		i64 7852346557833039773, ; hash 0x6cf9239740e64f9d, from name: libxamarin-debug-app-helper
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.30_name, ; name: libxamarin-debug-app-helper.so
		ptr null; void* handle (0x0)
	}, ; 47
	%struct.DSOCacheEntry {
		i64 7917171287837054379, ; hash 0x6ddf7156dd7315ab, from name: libTrimble.Ssi.Driver.CarpoBased.Common
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.7_name, ; name: libTrimble.Ssi.Driver.CarpoBased.Common.so
		ptr null; void* handle (0x0)
	}, ; 48
	%struct.DSOCacheEntry {
		i64 7934080795233611724, ; hash 0x6e1b84725b25efcc, from name: libTrimble.Ssi.Driver.DriverCommon.GNSS
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.19_name, ; name: libTrimble.Ssi.Driver.DriverCommon.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 49
	%struct.DSOCacheEntry {
		i64 8020246306314470114, ; hash 0x6f4da385c30342e2, from name: GeodeticX.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.2_name, ; name: libGeodeticX.so
		ptr null; void* handle (0x0)
	}, ; 50
	%struct.DSOCacheEntry {
		i64 8021998485596973268, ; hash 0x6f53dd1ecabaa8d4, from name: libTrimble.Ssi.CSWrapped.Common
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.6_name, ; name: libTrimble.Ssi.CSWrapped.Common.so
		ptr null; void* handle (0x0)
	}, ; 51
	%struct.DSOCacheEntry {
		i64 8089635853565069400, ; hash 0x704428f2b6028858, from name: Trimble.Ssi.Driver.DriverCommon.Common
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.8_name, ; name: libTrimble.Ssi.Driver.DriverCommon.Common.so
		ptr null; void* handle (0x0)
	}, ; 52
	%struct.DSOCacheEntry {
		i64 8129154283138605531, ; hash 0x70d08ec01ad261db, from name: mono-component-marshal-ilgen
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.27_name, ; name: libmono-component-marshal-ilgen.so
		ptr null; void* handle (0x0)
	}, ; 53
	%struct.DSOCacheEntry {
		i64 8392333777418328833, ; hash 0x74778f1b27881b01, from name: libmonodroid.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.29_name, ; name: libmonodroid.so
		ptr null; void* handle (0x0)
	}, ; 54
	%struct.DSOCacheEntry {
		i64 8436667257416186758, ; hash 0x7515102bd675fb86, from name: DRV_SP80.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.13_name, ; name: libDRV_SP80.so
		ptr null; void* handle (0x0)
	}, ; 55
	%struct.DSOCacheEntry {
		i64 8626645781824515032, ; hash 0x77b800a1f4c5abd8, from name: System.Native
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.23_name, ; name: libSystem.Native.so
		ptr null; void* handle (0x0)
	}, ; 56
	%struct.DSOCacheEntry {
		i64 8674882734415906853, ; hash 0x78635fe2ad078825, from name: DRV_SP80
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.13_name, ; name: libDRV_SP80.so
		ptr null; void* handle (0x0)
	}, ; 57
	%struct.DSOCacheEntry {
		i64 9055317871244365271, ; hash 0x7daaf3a073c44dd7, from name: monodroid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.29_name, ; name: libmonodroid.so
		ptr null; void* handle (0x0)
	}, ; 58
	%struct.DSOCacheEntry {
		i64 9244383015954987709, ; hash 0x804aa55fc9a6babd, from name: libGeodeticX
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.2_name, ; name: libGeodeticX.so
		ptr null; void* handle (0x0)
	}, ; 59
	%struct.DSOCacheEntry {
		i64 9504752236132030167, ; hash 0x83e7a9cce8bfd6d7, from name: libCsdManagement.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.1_name, ; name: libCsdManagement.so
		ptr null; void* handle (0x0)
	}, ; 60
	%struct.DSOCacheEntry {
		i64 9645975222191840301, ; hash 0x85dd635ba6f6dc2d, from name: Trimble.Ssi.CSWrapped.GNSS
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.15_name, ; name: libTrimble.Ssi.CSWrapped.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 61
	%struct.DSOCacheEntry {
		i64 9717776337463922659, ; hash 0x86dc7a17893bcfe3, from name: libDRV_SP80
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.13_name, ; name: libDRV_SP80.so
		ptr null; void* handle (0x0)
	}, ; 62
	%struct.DSOCacheEntry {
		i64 9720115089215186253, ; hash 0x86e4c92c9c95e54d, from name: libASerialPort
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.12_name, ; name: libASerialPort.so
		ptr null; void* handle (0x0)
	}, ; 63
	%struct.DSOCacheEntry {
		i64 9767790487795065972, ; hash 0x878e29b25976e474, from name: libTrimble.Ssi.DriverManagement
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.10_name, ; name: libTrimble.Ssi.DriverManagement.so
		ptr null; void* handle (0x0)
	}, ; 64
	%struct.DSOCacheEntry {
		i64 10403090626863083606, ; hash 0x905f33cea45eb056, from name: mono-component-debugger.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.25_name, ; name: libmono-component-debugger.so
		ptr null; void* handle (0x0)
	}, ; 65
	%struct.DSOCacheEntry {
		i64 10484826484908863027, ; hash 0x918196231499ae33, from name: xamarin-debug-app-helper
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.30_name, ; name: libxamarin-debug-app-helper.so
		ptr null; void* handle (0x0)
	}, ; 66
	%struct.DSOCacheEntry {
		i64 10613310425202394273, ; hash 0x934a0d99992384a1, from name: libTrimble.Ssi.Interfaces.Common
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.11_name, ; name: libTrimble.Ssi.Interfaces.Common.so
		ptr null; void* handle (0x0)
	}, ; 67
	%struct.DSOCacheEntry {
		i64 10679077350116994322, ; hash 0x9433b4450ea4ad12, from name: Trimble.Licensing.CSWrapped.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.4_name, ; name: libTrimble.Licensing.CSWrapped.so
		ptr null; void* handle (0x0)
	}, ; 68
	%struct.DSOCacheEntry {
		i64 10769191724218180712, ; hash 0x9573dad0c819e468, from name: Trimble.Ssi.Driver.CarpoBased.GNSS.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.18_name, ; name: libTrimble.Ssi.Driver.CarpoBased.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 69
	%struct.DSOCacheEntry {
		i64 10777933671465280325, ; hash 0x9592e991fc68e345, from name: libDRV_SP80.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.13_name, ; name: libDRV_SP80.so
		ptr null; void* handle (0x0)
	}, ; 70
	%struct.DSOCacheEntry {
		i64 10862897088901960474, ; hash 0x96c0c35927a0531a, from name: libTrimble.Ssi.Driver.Mock.Common
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.9_name, ; name: libTrimble.Ssi.Driver.Mock.Common.so
		ptr null; void* handle (0x0)
	}, ; 71
	%struct.DSOCacheEntry {
		i64 10950422377257229784, ; hash 0x97f7b72260e7ddd8, from name: Trimble.Ssi.Driver.DriverCommon.Common.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.8_name, ; name: libTrimble.Ssi.Driver.DriverCommon.Common.so
		ptr null; void* handle (0x0)
	}, ; 72
	%struct.DSOCacheEntry {
		i64 11070432461949832649, ; hash 0x99a213aba4790dc9, from name: CsdManagement
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.1_name, ; name: libCsdManagement.so
		ptr null; void* handle (0x0)
	}, ; 73
	%struct.DSOCacheEntry {
		i64 11164818937994912957, ; hash 0x9af167ab9cbda4bd, from name: System.Security.Cryptography.Native.Android
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.24_name, ; name: libSystem.Security.Cryptography.Native.Android.so
		ptr null; void* handle (0x0)
	}, ; 74
	%struct.DSOCacheEntry {
		i64 11407525871264664431, ; hash 0x9e4fac571acf0b6f, from name: TDDTransformationLibCS
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.3_name, ; name: libTDDTransformationLibCS.so
		ptr null; void* handle (0x0)
	}, ; 75
	%struct.DSOCacheEntry {
		i64 11428084344116330296, ; hash 0x9e98b6299241bf38, from name: Trimble.Ssi.Driver.Mock.GNSS.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.20_name, ; name: libTrimble.Ssi.Driver.Mock.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 76
	%struct.DSOCacheEntry {
		i64 11483396618107104992, ; hash 0x9f5d3861ed322ee0, from name: libTrimble.Ssi.Driver.DriverCommon.Common.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.8_name, ; name: libTrimble.Ssi.Driver.DriverCommon.Common.so
		ptr null; void* handle (0x0)
	}, ; 77
	%struct.DSOCacheEntry {
		i64 11521729796983092563, ; hash 0x9fe56834a335f553, from name: libmonodroid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.29_name, ; name: libmonodroid.so
		ptr null; void* handle (0x0)
	}, ; 78
	%struct.DSOCacheEntry {
		i64 11702501594431154994, ; hash 0xa267a3329782eb32, from name: Trimble.Ssi.Interfaces.GNSS
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.21_name, ; name: libTrimble.Ssi.Interfaces.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 79
	%struct.DSOCacheEntry {
		i64 11778859893737438328, ; hash 0xa376eaaa9150bc78, from name: libDRV_TrimbleCommon.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.5_name, ; name: libDRV_TrimbleCommon.so
		ptr null; void* handle (0x0)
	}, ; 80
	%struct.DSOCacheEntry {
		i64 12083221449047090456, ; hash 0xa7b039e364d52518, from name: Trimble.Ssi.Driver.CarpoBased.GNSS
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.18_name, ; name: libTrimble.Ssi.Driver.CarpoBased.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 81
	%struct.DSOCacheEntry {
		i64 12194118061065863132, ; hash 0xa93a35c4f3017fdc, from name: TDDTransformationLibCS.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.3_name, ; name: libTDDTransformationLibCS.so
		ptr null; void* handle (0x0)
	}, ; 82
	%struct.DSOCacheEntry {
		i64 12897043084991784744, ; hash 0xb2fb805ab5d7e728, from name: libGeodeticX.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.2_name, ; name: libGeodeticX.so
		ptr null; void* handle (0x0)
	}, ; 83
	%struct.DSOCacheEntry {
		i64 13062790803300872018, ; hash 0xb5485b06a5fcef52, from name: Trimble.Ssi.Driver.CarpoBased.Driver.RSeries
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.16_name, ; name: libTrimble.Ssi.Driver.CarpoBased.Driver.RSeries.so
		ptr null; void* handle (0x0)
	}, ; 84
	%struct.DSOCacheEntry {
		i64 13230338631094530285, ; hash 0xb79b9ae33c8470ed, from name: Trimble.Ssi.Driver.CarpoBased.Driver.RSeries.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.16_name, ; name: libTrimble.Ssi.Driver.CarpoBased.Driver.RSeries.so
		ptr null; void* handle (0x0)
	}, ; 85
	%struct.DSOCacheEntry {
		i64 13302812546283279650, ; hash 0xb89d15878ed31522, from name: libTrimble.Ssi.CSWrapped.GNSS
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.15_name, ; name: libTrimble.Ssi.CSWrapped.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 86
	%struct.DSOCacheEntry {
		i64 13577997958773824268, ; hash 0xbc6ebd3445b15b0c, from name: libTrimble.Ssi.Driver.CarpoBased.GNSS
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.18_name, ; name: libTrimble.Ssi.Driver.CarpoBased.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 87
	%struct.DSOCacheEntry {
		i64 13611447998151644514, ; hash 0xbce593d67887d562, from name: libTrimble.Licensing.CSWrapped
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.4_name, ; name: libTrimble.Licensing.CSWrapped.so
		ptr null; void* handle (0x0)
	}, ; 88
	%struct.DSOCacheEntry {
		i64 13631650493800673219, ; hash 0xbd2d59e689446fc3, from name: DRV_TrimCom.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.14_name, ; name: libDRV_TrimCom.so
		ptr null; void* handle (0x0)
	}, ; 89
	%struct.DSOCacheEntry {
		i64 13652871487153963516, ; hash 0xbd78be4813df01fc, from name: Trimble.Ssi.Interfaces.GNSS.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.21_name, ; name: libTrimble.Ssi.Interfaces.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 90
	%struct.DSOCacheEntry {
		i64 13716114777633951764, ; hash 0xbe596db81b5b9014, from name: libTrimble.Ssi.Driver.Mock.GNSS
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.20_name, ; name: libTrimble.Ssi.Driver.Mock.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 91
	%struct.DSOCacheEntry {
		i64 14192876635133500800, ; hash 0xc4f73a1a4212dd80, from name: Trimble.Ssi.Driver.CarpoBased.Common.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.7_name, ; name: libTrimble.Ssi.Driver.CarpoBased.Common.so
		ptr null; void* handle (0x0)
	}, ; 92
	%struct.DSOCacheEntry {
		i64 14236339877716276585, ; hash 0xc591a3b10101b569, from name: ASerialPort.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.12_name, ; name: libASerialPort.so
		ptr null; void* handle (0x0)
	}, ; 93
	%struct.DSOCacheEntry {
		i64 14424844866220670826, ; hash 0xc82f57facf333f6a, from name: monosgen-2.0.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.28_name, ; name: libmonosgen-2.0.so
		ptr null; void* handle (0x0)
	}, ; 94
	%struct.DSOCacheEntry {
		i64 14591746106929596334, ; hash 0xca804bc61c3a47ae, from name: Trimble.Ssi.Driver.Mock.GNSS
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.20_name, ; name: libTrimble.Ssi.Driver.Mock.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 95
	%struct.DSOCacheEntry {
		i64 14595267666863566738, ; hash 0xca8cce9d2d25af92, from name: libTrimble.Ssi.Driver.DriverCommon.Common
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.8_name, ; name: libTrimble.Ssi.Driver.DriverCommon.Common.so
		ptr null; void* handle (0x0)
	}, ; 96
	%struct.DSOCacheEntry {
		i64 14939551082710594120, ; hash 0xcf53f28e7cc47248, from name: mono-component-hot_reload
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.26_name, ; name: libmono-component-hot_reload.so
		ptr null; void* handle (0x0)
	}, ; 97
	%struct.DSOCacheEntry {
		i64 14967058001033661250, ; hash 0xcfb5abf3fc478b42, from name: DRV_TrimbleCommon.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.5_name, ; name: libDRV_TrimbleCommon.so
		ptr null; void* handle (0x0)
	}, ; 98
	%struct.DSOCacheEntry {
		i64 15114814827672475595, ; hash 0xd1c29c01093997cb, from name: libTDDTransformationLibCS.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.3_name, ; name: libTDDTransformationLibCS.so
		ptr null; void* handle (0x0)
	}, ; 99
	%struct.DSOCacheEntry {
		i64 15438217010802601769, ; hash 0xd63f90937e482f29, from name: Trimble.Ssi.Interfaces.Common
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.11_name, ; name: libTrimble.Ssi.Interfaces.Common.so
		ptr null; void* handle (0x0)
	}, ; 100
	%struct.DSOCacheEntry {
		i64 15451533191563440817, ; hash 0xd66edf926e4bf2b1, from name: libDRV_TrimCom.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.14_name, ; name: libDRV_TrimCom.so
		ptr null; void* handle (0x0)
	}, ; 101
	%struct.DSOCacheEntry {
		i64 15491964409583644687, ; hash 0xd6fe838cf23a300f, from name: Trimble.Ssi.DriverManagement
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.10_name, ; name: libTrimble.Ssi.DriverManagement.so
		ptr null; void* handle (0x0)
	}, ; 102
	%struct.DSOCacheEntry {
		i64 15643761492698923738, ; hash 0xd919ce31834102da, from name: libTrimble.Licensing.CSWrapped.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.4_name, ; name: libTrimble.Licensing.CSWrapped.so
		ptr null; void* handle (0x0)
	}, ; 103
	%struct.DSOCacheEntry {
		i64 15906125842213772583, ; hash 0xdcbde92de1d01d27, from name: Trimble.Ssi.Driver.CarpoBased.Driver.SP80.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.17_name, ; name: libTrimble.Ssi.Driver.CarpoBased.Driver.SP80.so
		ptr null; void* handle (0x0)
	}, ; 104
	%struct.DSOCacheEntry {
		i64 16217712076265891113, ; hash 0xe110e3354f642529, from name: libmono-component-marshal-ilgen.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.27_name, ; name: libmono-component-marshal-ilgen.so
		ptr null; void* handle (0x0)
	}, ; 105
	%struct.DSOCacheEntry {
		i64 16273606707797624453, ; hash 0xe1d7771458b10685, from name: System.Native.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.23_name, ; name: libSystem.Native.so
		ptr null; void* handle (0x0)
	}, ; 106
	%struct.DSOCacheEntry {
		i64 16430469962704608406, ; hash 0xe404c160f3bbdc96, from name: libTrimble.Ssi.CSWrapped.GNSS.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.15_name, ; name: libTrimble.Ssi.CSWrapped.GNSS.so
		ptr null; void* handle (0x0)
	}, ; 107
	%struct.DSOCacheEntry {
		i64 16617500845422875358, ; hash 0xe69d38f9c22f12de, from name: GeodeticX
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.2_name, ; name: libGeodeticX.so
		ptr null; void* handle (0x0)
	}, ; 108
	%struct.DSOCacheEntry {
		i64 16717189724135467099, ; hash 0xe7ff637b8de7a85b, from name: libmonosgen-2.0.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.28_name, ; name: libmonosgen-2.0.so
		ptr null; void* handle (0x0)
	}, ; 109
	%struct.DSOCacheEntry {
		i64 16804602679676381986, ; hash 0xe935f11a41b02b22, from name: monosgen-2.0
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.28_name, ; name: libmonosgen-2.0.so
		ptr null; void* handle (0x0)
	}, ; 110
	%struct.DSOCacheEntry {
		i64 16989526051800913850, ; hash 0xebc6ebee03d697ba, from name: libASerialPort.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.12_name, ; name: libASerialPort.so
		ptr null; void* handle (0x0)
	}, ; 111
	%struct.DSOCacheEntry {
		i64 17143334018203255050, ; hash 0xede95b75d4e0010a, from name: Trimble.Ssi.DriverManagement.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.10_name, ; name: libTrimble.Ssi.DriverManagement.so
		ptr null; void* handle (0x0)
	}, ; 112
	%struct.DSOCacheEntry {
		i64 17149263955875602364, ; hash 0xedfe6cb509601fbc, from name: libTrimble.Ssi.Driver.CarpoBased.Common.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.7_name, ; name: libTrimble.Ssi.Driver.CarpoBased.Common.so
		ptr null; void* handle (0x0)
	}, ; 113
	%struct.DSOCacheEntry {
		i64 17487121768860490889, ; hash 0xf2aebc9918ee1c89, from name: libTrimble.Ssi.Driver.CarpoBased.Driver.SP80.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.17_name, ; name: libTrimble.Ssi.Driver.CarpoBased.Driver.SP80.so
		ptr null; void* handle (0x0)
	}, ; 114
	%struct.DSOCacheEntry {
		i64 17577202782581072989, ; hash 0xf3eec4cd80c0a45d, from name: System.IO.Compression.Native
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.22_name, ; name: libSystem.IO.Compression.Native.so
		ptr null; void* handle (0x0)
	}, ; 115
	%struct.DSOCacheEntry {
		i64 17589502317878446341, ; hash 0xf41a772a390e0905, from name: Trimble.Ssi.Driver.Mock.Common
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.9_name, ; name: libTrimble.Ssi.Driver.Mock.Common.so
		ptr null; void* handle (0x0)
	}, ; 116
	%struct.DSOCacheEntry {
		i64 17609717394618092744, ; hash 0xf46248ab8d3a8cc8, from name: CsdManagement.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.1_name, ; name: libCsdManagement.so
		ptr null; void* handle (0x0)
	}, ; 117
	%struct.DSOCacheEntry {
		i64 17609916734342827229, ; hash 0xf462fdf7f2b60cdd, from name: DRV_TrimbleCommon
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.5_name, ; name: libDRV_TrimbleCommon.so
		ptr null; void* handle (0x0)
	}, ; 118
	%struct.DSOCacheEntry {
		i64 18001227312549183156, ; hash 0xf9d134ddbd8dbeb4, from name: mono-component-hot_reload.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.26_name, ; name: libmono-component-hot_reload.so
		ptr null; void* handle (0x0)
	}, ; 119
	%struct.DSOCacheEntry {
		i64 18037761627775429063, ; hash 0xfa5300a1deb9e9c7, from name: libmono-component-debugger.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.25_name, ; name: libmono-component-debugger.so
		ptr null; void* handle (0x0)
	}, ; 120
	%struct.DSOCacheEntry {
		i64 18145848498878603418, ; hash 0xfbd30111a3b6e09a, from name: libSystem.IO.Compression.Native
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.22_name, ; name: libSystem.IO.Compression.Native.so
		ptr null; void* handle (0x0)
	}, ; 121
	%struct.DSOCacheEntry {
		i64 18197248095186303175, ; hash 0xfc899cbabb3bb8c7, from name: Trimble.Ssi.CSWrapped.Common
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.6_name, ; name: libTrimble.Ssi.CSWrapped.Common.so
		ptr null; void* handle (0x0)
	}, ; 122
	%struct.DSOCacheEntry {
		i64 18257096356770733190, ; hash 0xfd5e3c67ff65dc86, from name: libSystem.Security.Cryptography.Native.Android.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.24_name, ; name: libSystem.Security.Cryptography.Native.Android.so
		ptr null; void* handle (0x0)
	} ; 123
], align 16

@_XamarinAndroidBundledAssembly_name_0_0 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_1_1 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_2_2 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_3_3 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_4_4 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_5_5 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_6_6 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_7_7 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_8_8 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_9_9 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_a_a = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_b_b = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_c_c = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_d_d = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_e_e = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_f_f = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_10_10 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_11_11 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_12_12 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_13_13 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_14_14 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_15_15 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_16_16 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_17_17 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_18_18 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_19_19 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_1a_1a = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_1b_1b = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_1c_1c = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_1d_1d = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_1e_1e = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_1f_1f = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_20_20 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_21_21 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_22_22 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_23_23 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_24_24 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_25_25 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_26_26 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_27_27 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_28_28 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_29_29 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_2a_2a = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_2b_2b = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_2c_2c = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_2d_2d = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_2e_2e = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_2f_2f = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_30_30 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_31_31 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_32_32 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_33_33 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_34_34 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_35_35 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_36_36 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_37_37 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_38_38 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_39_39 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_3a_3a = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_3b_3b = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_3c_3c = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_3d_3d = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_3e_3e = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_3f_3f = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_40_40 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_41_41 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_42_42 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_43_43 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_44_44 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_45_45 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_46_46 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_47_47 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_48_48 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_49_49 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_4a_4a = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_4b_4b = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_4c_4c = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_4d_4d = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_4e_4e = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_4f_4f = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_50_50 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_51_51 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_52_52 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_53_53 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_54_54 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_55_55 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_56_56 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_57_57 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_58_58 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_59_59 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_5a_5a = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_5b_5b = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_5c_5c = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_5d_5d = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_5e_5e = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_5f_5f = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_60_60 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_61_61 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_62_62 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_63_63 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_64_64 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_65_65 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_66_66 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_67_67 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_68_68 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_69_69 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_6a_6a = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_6b_6b = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_6c_6c = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_6d_6d = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_6e_6e = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_6f_6f = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_70_70 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_71_71 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_72_72 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_73_73 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_74_74 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_75_75 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_76_76 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_77_77 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_78_78 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_79_79 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_7a_7a = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_7b_7b = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_7c_7c = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_7d_7d = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_7e_7e = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_7f_7f = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_80_80 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_81_81 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_82_82 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_83_83 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_84_84 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_85_85 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_86_86 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_87_87 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_88_88 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_89_89 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_8a_8a = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_8b_8b = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_8c_8c = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_8d_8d = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_8e_8e = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_8f_8f = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_90_90 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_91_91 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_92_92 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_93_93 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_94_94 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_95_95 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_96_96 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_97_97 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_98_98 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_99_99 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_9a_9a = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_9b_9b = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_9c_9c = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_9d_9d = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_9e_9e = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_9f_9f = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_a0_a0 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_a1_a1 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_a2_a2 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_a3_a3 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_a4_a4 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_a5_a5 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_a6_a6 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_a7_a7 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_a8_a8 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_a9_a9 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_aa_aa = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_ab_ab = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_ac_ac = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_ad_ad = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_ae_ae = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_af_af = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_b0_b0 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_b1_b1 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_b2_b2 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_b3_b3 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_b4_b4 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_b5_b5 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_b6_b6 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_b7_b7 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_b8_b8 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_b9_b9 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_ba_ba = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_bb_bb = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_bc_bc = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_bd_bd = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_be_be = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_bf_bf = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_c0_c0 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_c1_c1 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_c2_c2 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_c3_c3 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_c4_c4 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_c5_c5 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_c6_c6 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_c7_c7 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_c8_c8 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_c9_c9 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_ca_ca = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_cb_cb = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_cc_cc = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_cd_cd = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_ce_ce = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_cf_cf = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_d0_d0 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_d1_d1 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_d2_d2 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_d3_d3 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_d4_d4 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_d5_d5 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_d6_d6 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_d7_d7 = internal dso_local global [83 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_d8_d8 = internal dso_local global [83 x i8] zeroinitializer, align 16

; Bundled assembly name buffers, all 83 bytes long
@bundled_assemblies = dso_local local_unnamed_addr global [217 x %struct.XamarinAndroidBundledAssembly] [
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_0_0; char* name
	}, ; 0
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_1_1; char* name
	}, ; 1
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_2_2; char* name
	}, ; 2
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_3_3; char* name
	}, ; 3
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_4_4; char* name
	}, ; 4
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_5_5; char* name
	}, ; 5
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_6_6; char* name
	}, ; 6
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_7_7; char* name
	}, ; 7
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_8_8; char* name
	}, ; 8
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_9_9; char* name
	}, ; 9
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_a_a; char* name
	}, ; 10
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_b_b; char* name
	}, ; 11
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_c_c; char* name
	}, ; 12
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_d_d; char* name
	}, ; 13
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_e_e; char* name
	}, ; 14
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_f_f; char* name
	}, ; 15
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_10_10; char* name
	}, ; 16
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_11_11; char* name
	}, ; 17
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_12_12; char* name
	}, ; 18
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_13_13; char* name
	}, ; 19
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_14_14; char* name
	}, ; 20
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_15_15; char* name
	}, ; 21
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_16_16; char* name
	}, ; 22
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_17_17; char* name
	}, ; 23
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_18_18; char* name
	}, ; 24
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_19_19; char* name
	}, ; 25
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_1a_1a; char* name
	}, ; 26
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_1b_1b; char* name
	}, ; 27
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_1c_1c; char* name
	}, ; 28
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_1d_1d; char* name
	}, ; 29
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_1e_1e; char* name
	}, ; 30
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_1f_1f; char* name
	}, ; 31
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_20_20; char* name
	}, ; 32
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_21_21; char* name
	}, ; 33
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_22_22; char* name
	}, ; 34
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_23_23; char* name
	}, ; 35
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_24_24; char* name
	}, ; 36
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_25_25; char* name
	}, ; 37
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_26_26; char* name
	}, ; 38
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_27_27; char* name
	}, ; 39
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_28_28; char* name
	}, ; 40
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_29_29; char* name
	}, ; 41
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_2a_2a; char* name
	}, ; 42
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_2b_2b; char* name
	}, ; 43
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_2c_2c; char* name
	}, ; 44
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_2d_2d; char* name
	}, ; 45
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_2e_2e; char* name
	}, ; 46
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_2f_2f; char* name
	}, ; 47
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_30_30; char* name
	}, ; 48
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_31_31; char* name
	}, ; 49
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_32_32; char* name
	}, ; 50
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_33_33; char* name
	}, ; 51
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_34_34; char* name
	}, ; 52
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_35_35; char* name
	}, ; 53
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_36_36; char* name
	}, ; 54
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_37_37; char* name
	}, ; 55
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_38_38; char* name
	}, ; 56
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_39_39; char* name
	}, ; 57
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_3a_3a; char* name
	}, ; 58
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_3b_3b; char* name
	}, ; 59
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_3c_3c; char* name
	}, ; 60
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_3d_3d; char* name
	}, ; 61
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_3e_3e; char* name
	}, ; 62
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_3f_3f; char* name
	}, ; 63
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_40_40; char* name
	}, ; 64
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_41_41; char* name
	}, ; 65
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_42_42; char* name
	}, ; 66
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_43_43; char* name
	}, ; 67
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_44_44; char* name
	}, ; 68
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_45_45; char* name
	}, ; 69
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_46_46; char* name
	}, ; 70
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_47_47; char* name
	}, ; 71
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_48_48; char* name
	}, ; 72
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_49_49; char* name
	}, ; 73
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_4a_4a; char* name
	}, ; 74
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_4b_4b; char* name
	}, ; 75
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_4c_4c; char* name
	}, ; 76
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_4d_4d; char* name
	}, ; 77
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_4e_4e; char* name
	}, ; 78
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_4f_4f; char* name
	}, ; 79
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_50_50; char* name
	}, ; 80
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_51_51; char* name
	}, ; 81
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_52_52; char* name
	}, ; 82
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_53_53; char* name
	}, ; 83
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_54_54; char* name
	}, ; 84
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_55_55; char* name
	}, ; 85
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_56_56; char* name
	}, ; 86
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_57_57; char* name
	}, ; 87
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_58_58; char* name
	}, ; 88
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_59_59; char* name
	}, ; 89
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_5a_5a; char* name
	}, ; 90
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_5b_5b; char* name
	}, ; 91
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_5c_5c; char* name
	}, ; 92
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_5d_5d; char* name
	}, ; 93
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_5e_5e; char* name
	}, ; 94
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_5f_5f; char* name
	}, ; 95
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_60_60; char* name
	}, ; 96
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_61_61; char* name
	}, ; 97
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_62_62; char* name
	}, ; 98
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_63_63; char* name
	}, ; 99
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_64_64; char* name
	}, ; 100
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_65_65; char* name
	}, ; 101
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_66_66; char* name
	}, ; 102
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_67_67; char* name
	}, ; 103
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_68_68; char* name
	}, ; 104
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_69_69; char* name
	}, ; 105
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_6a_6a; char* name
	}, ; 106
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_6b_6b; char* name
	}, ; 107
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_6c_6c; char* name
	}, ; 108
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_6d_6d; char* name
	}, ; 109
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_6e_6e; char* name
	}, ; 110
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_6f_6f; char* name
	}, ; 111
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_70_70; char* name
	}, ; 112
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_71_71; char* name
	}, ; 113
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_72_72; char* name
	}, ; 114
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_73_73; char* name
	}, ; 115
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_74_74; char* name
	}, ; 116
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_75_75; char* name
	}, ; 117
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_76_76; char* name
	}, ; 118
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_77_77; char* name
	}, ; 119
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_78_78; char* name
	}, ; 120
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_79_79; char* name
	}, ; 121
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_7a_7a; char* name
	}, ; 122
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_7b_7b; char* name
	}, ; 123
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_7c_7c; char* name
	}, ; 124
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_7d_7d; char* name
	}, ; 125
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_7e_7e; char* name
	}, ; 126
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_7f_7f; char* name
	}, ; 127
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_80_80; char* name
	}, ; 128
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_81_81; char* name
	}, ; 129
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_82_82; char* name
	}, ; 130
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_83_83; char* name
	}, ; 131
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_84_84; char* name
	}, ; 132
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_85_85; char* name
	}, ; 133
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_86_86; char* name
	}, ; 134
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_87_87; char* name
	}, ; 135
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_88_88; char* name
	}, ; 136
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_89_89; char* name
	}, ; 137
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_8a_8a; char* name
	}, ; 138
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_8b_8b; char* name
	}, ; 139
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_8c_8c; char* name
	}, ; 140
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_8d_8d; char* name
	}, ; 141
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_8e_8e; char* name
	}, ; 142
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_8f_8f; char* name
	}, ; 143
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_90_90; char* name
	}, ; 144
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_91_91; char* name
	}, ; 145
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_92_92; char* name
	}, ; 146
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_93_93; char* name
	}, ; 147
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_94_94; char* name
	}, ; 148
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_95_95; char* name
	}, ; 149
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_96_96; char* name
	}, ; 150
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_97_97; char* name
	}, ; 151
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_98_98; char* name
	}, ; 152
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_99_99; char* name
	}, ; 153
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_9a_9a; char* name
	}, ; 154
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_9b_9b; char* name
	}, ; 155
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_9c_9c; char* name
	}, ; 156
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_9d_9d; char* name
	}, ; 157
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_9e_9e; char* name
	}, ; 158
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_9f_9f; char* name
	}, ; 159
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_a0_a0; char* name
	}, ; 160
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_a1_a1; char* name
	}, ; 161
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_a2_a2; char* name
	}, ; 162
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_a3_a3; char* name
	}, ; 163
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_a4_a4; char* name
	}, ; 164
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_a5_a5; char* name
	}, ; 165
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_a6_a6; char* name
	}, ; 166
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_a7_a7; char* name
	}, ; 167
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_a8_a8; char* name
	}, ; 168
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_a9_a9; char* name
	}, ; 169
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_aa_aa; char* name
	}, ; 170
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_ab_ab; char* name
	}, ; 171
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_ac_ac; char* name
	}, ; 172
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_ad_ad; char* name
	}, ; 173
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_ae_ae; char* name
	}, ; 174
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_af_af; char* name
	}, ; 175
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_b0_b0; char* name
	}, ; 176
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_b1_b1; char* name
	}, ; 177
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_b2_b2; char* name
	}, ; 178
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_b3_b3; char* name
	}, ; 179
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_b4_b4; char* name
	}, ; 180
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_b5_b5; char* name
	}, ; 181
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_b6_b6; char* name
	}, ; 182
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_b7_b7; char* name
	}, ; 183
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_b8_b8; char* name
	}, ; 184
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_b9_b9; char* name
	}, ; 185
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_ba_ba; char* name
	}, ; 186
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_bb_bb; char* name
	}, ; 187
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_bc_bc; char* name
	}, ; 188
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_bd_bd; char* name
	}, ; 189
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_be_be; char* name
	}, ; 190
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_bf_bf; char* name
	}, ; 191
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_c0_c0; char* name
	}, ; 192
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_c1_c1; char* name
	}, ; 193
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_c2_c2; char* name
	}, ; 194
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_c3_c3; char* name
	}, ; 195
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_c4_c4; char* name
	}, ; 196
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_c5_c5; char* name
	}, ; 197
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_c6_c6; char* name
	}, ; 198
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_c7_c7; char* name
	}, ; 199
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_c8_c8; char* name
	}, ; 200
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_c9_c9; char* name
	}, ; 201
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_ca_ca; char* name
	}, ; 202
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_cb_cb; char* name
	}, ; 203
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_cc_cc; char* name
	}, ; 204
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_cd_cd; char* name
	}, ; 205
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_ce_ce; char* name
	}, ; 206
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_cf_cf; char* name
	}, ; 207
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_d0_d0; char* name
	}, ; 208
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_d1_d1; char* name
	}, ; 209
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_d2_d2; char* name
	}, ; 210
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_d3_d3; char* name
	}, ; 211
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_d4_d4; char* name
	}, ; 212
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_d5_d5; char* name
	}, ; 213
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_d6_d6; char* name
	}, ; 214
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_d7_d7; char* name
	}, ; 215
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 83, ; uint32_t name_length (0x53)
		ptr @_XamarinAndroidBundledAssembly_name_d8_d8; char* name
	} ; 216
], align 16

@assembly_store_bundled_assemblies = dso_local local_unnamed_addr global [0 x %struct.AssemblyStoreSingleAssemblyRuntimeData] zeroinitializer, align 8

@assembly_stores = dso_local local_unnamed_addr global [0 x %struct.AssemblyStoreRuntimeData] zeroinitializer, align 8

; Strings
@.str.0 = private unnamed_addr constant [7 x i8] c"interp\00", align 1

; Application environment variables name:value pairs
@.env.0 = private unnamed_addr constant [29 x i8] c"DOTNET_MODIFIABLE_ASSEMBLIES\00", align 16
@.env.1 = private unnamed_addr constant [6 x i8] c"Debug\00", align 1
@.env.2 = private unnamed_addr constant [15 x i8] c"MONO_GC_PARAMS\00", align 1
@.env.3 = private unnamed_addr constant [21 x i8] c"major=marksweep-conc\00", align 16
@.env.4 = private unnamed_addr constant [15 x i8] c"MONO_LOG_LEVEL\00", align 1
@.env.5 = private unnamed_addr constant [5 x i8] c"info\00", align 1
@.env.6 = private unnamed_addr constant [17 x i8] c"XAMARIN_BUILD_ID\00", align 16
@.env.7 = private unnamed_addr constant [37 x i8] c"2ab791ac-9789-4933-a970-f3e17b435fff\00", align 16
@.env.8 = private unnamed_addr constant [28 x i8] c"XA_HTTP_CLIENT_HANDLER_TYPE\00", align 16
@.env.9 = private unnamed_addr constant [42 x i8] c"Xamarin.Android.Net.AndroidMessageHandler\00", align 16
@.env.10 = private unnamed_addr constant [29 x i8] c"__XA_PACKAGE_NAMING_POLICY__\00", align 16
@.env.11 = private unnamed_addr constant [15 x i8] c"LowercaseCrc64\00", align 1

;ApplicationConfig
@.ApplicationConfig.0_android_package_name = private unnamed_addr constant [40 x i8] c"catalystfacade.droid.catalystfacadedemo\00", align 16

;DSOCacheEntry
@.DSOCacheEntry.0_name = private unnamed_addr constant [17 x i8] c"libc++_shared.so\00", align 16
@.DSOCacheEntry.1_name = private unnamed_addr constant [20 x i8] c"libCsdManagement.so\00", align 16
@.DSOCacheEntry.2_name = private unnamed_addr constant [16 x i8] c"libGeodeticX.so\00", align 16
@.DSOCacheEntry.3_name = private unnamed_addr constant [29 x i8] c"libTDDTransformationLibCS.so\00", align 16
@.DSOCacheEntry.4_name = private unnamed_addr constant [34 x i8] c"libTrimble.Licensing.CSWrapped.so\00", align 16
@.DSOCacheEntry.5_name = private unnamed_addr constant [24 x i8] c"libDRV_TrimbleCommon.so\00", align 16
@.DSOCacheEntry.6_name = private unnamed_addr constant [35 x i8] c"libTrimble.Ssi.CSWrapped.Common.so\00", align 16
@.DSOCacheEntry.7_name = private unnamed_addr constant [43 x i8] c"libTrimble.Ssi.Driver.CarpoBased.Common.so\00", align 16
@.DSOCacheEntry.8_name = private unnamed_addr constant [45 x i8] c"libTrimble.Ssi.Driver.DriverCommon.Common.so\00", align 16
@.DSOCacheEntry.9_name = private unnamed_addr constant [37 x i8] c"libTrimble.Ssi.Driver.Mock.Common.so\00", align 16
@.DSOCacheEntry.10_name = private unnamed_addr constant [35 x i8] c"libTrimble.Ssi.DriverManagement.so\00", align 16
@.DSOCacheEntry.11_name = private unnamed_addr constant [36 x i8] c"libTrimble.Ssi.Interfaces.Common.so\00", align 16
@.DSOCacheEntry.12_name = private unnamed_addr constant [18 x i8] c"libASerialPort.so\00", align 16
@.DSOCacheEntry.13_name = private unnamed_addr constant [15 x i8] c"libDRV_SP80.so\00", align 1
@.DSOCacheEntry.14_name = private unnamed_addr constant [18 x i8] c"libDRV_TrimCom.so\00", align 16
@.DSOCacheEntry.15_name = private unnamed_addr constant [33 x i8] c"libTrimble.Ssi.CSWrapped.GNSS.so\00", align 16
@.DSOCacheEntry.16_name = private unnamed_addr constant [51 x i8] c"libTrimble.Ssi.Driver.CarpoBased.Driver.RSeries.so\00", align 16
@.DSOCacheEntry.17_name = private unnamed_addr constant [48 x i8] c"libTrimble.Ssi.Driver.CarpoBased.Driver.SP80.so\00", align 16
@.DSOCacheEntry.18_name = private unnamed_addr constant [41 x i8] c"libTrimble.Ssi.Driver.CarpoBased.GNSS.so\00", align 16
@.DSOCacheEntry.19_name = private unnamed_addr constant [43 x i8] c"libTrimble.Ssi.Driver.DriverCommon.GNSS.so\00", align 16
@.DSOCacheEntry.20_name = private unnamed_addr constant [35 x i8] c"libTrimble.Ssi.Driver.Mock.GNSS.so\00", align 16
@.DSOCacheEntry.21_name = private unnamed_addr constant [34 x i8] c"libTrimble.Ssi.Interfaces.GNSS.so\00", align 16
@.DSOCacheEntry.22_name = private unnamed_addr constant [35 x i8] c"libSystem.IO.Compression.Native.so\00", align 16
@.DSOCacheEntry.23_name = private unnamed_addr constant [20 x i8] c"libSystem.Native.so\00", align 16
@.DSOCacheEntry.24_name = private unnamed_addr constant [50 x i8] c"libSystem.Security.Cryptography.Native.Android.so\00", align 16
@.DSOCacheEntry.25_name = private unnamed_addr constant [30 x i8] c"libmono-component-debugger.so\00", align 16
@.DSOCacheEntry.26_name = private unnamed_addr constant [32 x i8] c"libmono-component-hot_reload.so\00", align 16
@.DSOCacheEntry.27_name = private unnamed_addr constant [35 x i8] c"libmono-component-marshal-ilgen.so\00", align 16
@.DSOCacheEntry.28_name = private unnamed_addr constant [19 x i8] c"libmonosgen-2.0.so\00", align 16
@.DSOCacheEntry.29_name = private unnamed_addr constant [16 x i8] c"libmonodroid.so\00", align 16
@.DSOCacheEntry.30_name = private unnamed_addr constant [31 x i8] c"libxamarin-debug-app-helper.so\00", align 16

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
