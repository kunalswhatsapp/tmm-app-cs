; ModuleID = 'typemaps.x86.ll'
source_filename = "typemaps.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.TypeMapJava = type {
	i32, ; uint32_t module_index
	i32, ; uint32_t type_token_id
	i32 ; uint32_t java_name_index
}

%struct.TypeMapModule = type {
	[16 x i8], ; uint8_t module_uuid[16]
	i32, ; uint32_t entry_count
	i32, ; uint32_t duplicate_count
	ptr, ; TypeMapModuleEntry map
	ptr, ; TypeMapModuleEntry duplicate_map
	ptr, ; char* assembly_name
	ptr, ; MonoImage image
	i32, ; uint32_t java_name_width
	ptr ; uint8_t java_map
}

%struct.TypeMapModuleEntry = type {
	i32, ; uint32_t type_token_id
	i32 ; uint32_t java_map_index
}

@map_module_count = dso_local local_unnamed_addr constant i32 14, align 4

@java_type_count = dso_local local_unnamed_addr constant i32 530, align 4

; Managed modules map
@map_modules = dso_local local_unnamed_addr global [14 x %struct.TypeMapModule] [
	%struct.TypeMapModule {
		[16 x i8] c"\14\05\F7\EA\F5|\9DK\8B\90r:\C1]\01\9D", ; module_uuid: eaf70514-7cf5-4b9d-8b90-723ac15d019d
		i32 60, ; uint32_t entry_count (0x3c)
		i32 11, ; uint32_t duplicate_count (0xb)
		ptr @module0_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module0_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.0_assembly_name, ; assembly_name: Trimble.EMPOWER.JavaBinding.Droid
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	}, ; 0
	%struct.TypeMapModule {
		[16 x i8] c"L\8EY\C43OEA\8A\F7\EAc\02j \DB", ; module_uuid: c4598e4c-4f33-4145-8af7-ea63026a20db
		i32 5, ; uint32_t entry_count (0x5)
		i32 4, ; uint32_t duplicate_count (0x4)
		ptr @module1_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module1_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.1_assembly_name, ; assembly_name: Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.JavaBindings
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	}, ; 1
	%struct.TypeMapModule {
		[16 x i8] c"\5C\FD\0F8\DF\98\88E\9C\AE5u\C7H\04\E8", ; module_uuid: 380ffd5c-98df-4588-9cae-3575c74804e8
		i32 374, ; uint32_t entry_count (0x176)
		i32 122, ; uint32_t duplicate_count (0x7a)
		ptr @module2_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module2_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.2_assembly_name, ; assembly_name: Mono.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	}, ; 2
	%struct.TypeMapModule {
		[16 x i8] c"a\17\9DE\A2d\C2B\A7\8CG\01\99\B0\C5g", ; module_uuid: 459d1761-64a2-42c2-a78c-470199b0c567
		i32 5, ; uint32_t entry_count (0x5)
		i32 1, ; uint32_t duplicate_count (0x1)
		ptr @module3_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module3_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.3_assembly_name, ; assembly_name: AIDLService
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	}, ; 3
	%struct.TypeMapModule {
		[16 x i8] c"oo\DD[\FD\82\E1C\97/\AD4\0B\82Y\A2", ; module_uuid: 5bdd6f6f-82fd-43e1-972f-ad340b8259a2
		i32 2, ; uint32_t entry_count (0x2)
		i32 0, ; uint32_t duplicate_count (0x0)
		ptr @module4_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.4_assembly_name, ; assembly_name: Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	}, ; 4
	%struct.TypeMapModule {
		[16 x i8] c"w\92\9E\1D96bH\82\A5\F0gC\CD\EC\0C", ; module_uuid: 1d9e9277-3639-4862-82a5-f06743cdec0c
		i32 2, ; uint32_t entry_count (0x2)
		i32 0, ; uint32_t duplicate_count (0x0)
		ptr @module5_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.5_assembly_name, ; assembly_name: Trimble.EMPOWER.Manager.Droid
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	}, ; 5
	%struct.TypeMapModule {
		[16 x i8] c"w\C4\B4\C3\84$\CDN\B0\83\83:`T\E6\86", ; module_uuid: c3b4c477-2484-4ecd-b083-833a6054e686
		i32 19, ; uint32_t entry_count (0x13)
		i32 0, ; uint32_t duplicate_count (0x0)
		ptr @module6_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.6_assembly_name, ; assembly_name: Xamarin.Essentials
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	}, ; 6
	%struct.TypeMapModule {
		[16 x i8] c"\83\08\E0\C3\AF\C7\EDN\8A\07_\EA4Si\F8", ; module_uuid: c3e00883-c7af-4eed-8a07-5fea345369f8
		i32 28, ; uint32_t entry_count (0x1c)
		i32 14, ; uint32_t duplicate_count (0xe)
		ptr @module7_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module7_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.7_assembly_name, ; assembly_name: EM940Lib-Mono-Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	}, ; 7
	%struct.TypeMapModule {
		[16 x i8] c"\8F\02,{$\FD\07J\94Z=A\0A=\1A\92", ; module_uuid: 7b2c028f-fd24-4a07-945a-3d410a3d1a92
		i32 2, ; uint32_t entry_count (0x2)
		i32 0, ; uint32_t duplicate_count (0x0)
		ptr @module8_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.8_assembly_name, ; assembly_name: CatalystFacade.NET.Droid
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	}, ; 8
	%struct.TypeMapModule {
		[16 x i8] c"\8F\80c\890\B5\90\A8T\13M\91q\D8\E9\FB", ; module_uuid: 8963808f-b530-a890-5413-4d9171d8e9fb
		i32 1, ; uint32_t entry_count (0x1)
		i32 0, ; uint32_t duplicate_count (0x0)
		ptr @module9_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.9_assembly_name, ; assembly_name: Trimble.Ssi.DriverManagement.NET
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	}, ; 9
	%struct.TypeMapModule {
		[16 x i8] c"\90\AA\E4\F2\B5\14\C1D\B62\A1?\D9n\894", ; module_uuid: f2e4aa90-14b5-44c1-b632-a13fd96e8934
		i32 10, ; uint32_t entry_count (0xa)
		i32 1, ; uint32_t duplicate_count (0x1)
		ptr @module10_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module10_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.10_assembly_name, ; assembly_name: Xamarin.AndroidX.Browser
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	}, ; 10
	%struct.TypeMapModule {
		[16 x i8] c"\B8\06M\CEP\A6\CFO\B3j:\EFyl\83\E9", ; module_uuid: ce4d06b8-a650-4fcf-b36a-3aef796c83e9
		i32 6, ; uint32_t entry_count (0x6)
		i32 0, ; uint32_t duplicate_count (0x0)
		ptr @module11_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.11_assembly_name, ; assembly_name: AltGeoRelayService.Droid
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	}, ; 11
	%struct.TypeMapModule {
		[16 x i8] c"\D9cb\17\B2\B8I\A9+\97\A0\F1_\93\A2\FE", ; module_uuid: 176263d9-b8b2-a949-2b97-a0f15f93a2fe
		i32 7, ; uint32_t entry_count (0x7)
		i32 0, ; uint32_t duplicate_count (0x0)
		ptr @module12_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.12_assembly_name, ; assembly_name: Trimble.LicensingV2.NET
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	}, ; 12
	%struct.TypeMapModule {
		[16 x i8] c"\DE\B4\E7Q\87\03\00@\88H\CBP\A6\F4\F2\92", ; module_uuid: 51e7b4de-0387-4000-8848-cb50a6f4f292
		i32 9, ; uint32_t entry_count (0x9)
		i32 3, ; uint32_t duplicate_count (0x3)
		ptr @module13_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module13_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.13_assembly_name, ; assembly_name: Xamarin.AndroidX.Core
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	} ; 13
], align 4

; Java types name hashes
@map_java_hashes = dso_local local_unnamed_addr constant [530 x i32] [
	i32 9160146, ; 0: 0x8bc5d2 => android/provider/Settings$Secure
	i32 12341354, ; 1: 0xbc506a => java/lang/Object
	i32 27872140, ; 2: 0x1a94b8c => com/trimble/empower/ModuleManager$PowerExtensionRelay
	i32 29653966, ; 3: 0x1c47bce => android/widget/ListAdapter
	i32 32078366, ; 4: 0x1e97a1e => java/security/cert/Certificate
	i32 34115578, ; 5: 0x2088ffa => android/content/pm/PackageItemInfo
	i32 38531447, ; 6: 0x24bf177 => java/security/KeyPairGeneratorSpi
	i32 48217455, ; 7: 0x2dfbd6f => android/provider/Settings$Global
	i32 59967517, ; 8: 0x393081d => android/provider/ContactsContract$CommonDataKinds$Phone
	i32 69100292, ; 9: 0x41e6304 => com/trimble/empower/em940/internal/IEM940Device
	i32 74282880, ; 10: 0x46d7780 => android/view/ViewGroup
	i32 90644496, ; 11: 0x5672010 => java/io/FileNotFoundException
	i32 113187374, ; 12: 0x6bf1a2e => android/util/Size
	i32 116809330, ; 13: 0x6f65e72 => com/trimble/empower/internal/ITestAgentControl$Stub
	i32 118977103, ; 14: 0x717724f => android/util/DisplayMetrics
	i32 134418891, ; 15: 0x80311cb => com/trimble/empower/em940/EM940Exception
	i32 136240016, ; 16: 0x81edb90 => com/trimble/empower/internal/IScioHostPin
	i32 138171443, ; 17: 0x83c5433 => javax/net/ssl/SSLSessionContext
	i32 139280357, ; 18: 0x84d3fe5 => android/view/KeyEvent
	i32 148505617, ; 19: 0x8da0411 => android/text/GetChars
	i32 174681889, ; 20: 0xa696f21 => javax/crypto/spec/IvParameterSpec
	i32 176697843, ; 21: 0xa8831f3 => java/lang/IllegalArgumentException
	i32 183151336, ; 22: 0xaeaaae8 => android/view/OrientationEventListener
	i32 218024944, ; 23: 0xcfecbf0 => com/trimble/empower/ModuleManager$EmpowerHardware
	i32 225378520, ; 24: 0xd6f00d8 => com/trimble/empower/ModulePowerExtension
	i32 254910058, ; 25: 0xf319e6a => crc64a0e0a82d0db9a07d/ConnectivityBroadcastReceiver
	i32 262602588, ; 26: 0xfa6ff5c => android/provider/MediaStore
	i32 268012316, ; 27: 0xff98b1c => com/trimble/empower/em940/internal/IEM940EventListener$Stub
	i32 269199815, ; 28: 0x100ba9c7 => javax/security/cert/X509Certificate
	i32 269540587, ; 29: 0x1010dceb => com/trimble/empower/OvercurrentListener
	i32 273019192, ; 30: 0x1045f138 => com/trimble/empower/internal/IAgentAdapter
	i32 278863854, ; 31: 0x109f1fee => crc64a0e0a82d0db9a07d/SingleLocationListener
	i32 279693177, ; 32: 0x10abc779 => android/content/SharedPreferences$Editor
	i32 283019569, ; 33: 0x10de8931 => android/widget/ToggleButton
	i32 287381321, ; 34: 0x11211749 => com/trimble/empower/internal/IModuleListener$Stub$Proxy
	i32 299085994, ; 35: 0x11d3b0aa => com/trimble/empower/internal/IScioConfigurationListener
	i32 304387875, ; 36: 0x12249723 => com/trimble/timservice/BuildConfig
	i32 305203798, ; 37: 0x12310a56 => com/trimble/empower/internal/IModuleListener
	i32 307048059, ; 38: 0x124d2e7b => android/view/MenuItem$OnActionExpandListener
	i32 311211767, ; 39: 0x128cb6f7 => android/hardware/camera2/CameraMetadata
	i32 334029822, ; 40: 0x13e8e3fe => java/security/PublicKey
	i32 350446512, ; 41: 0x14e363b0 => javax/crypto/BadPaddingException
	i32 359488535, ; 42: 0x156d5c17 => com/trimble/empower/internal/IAgentAdapter$Stub$Proxy
	i32 366534601, ; 43: 0x15d8dfc9 => android/view/ViewGroup$LayoutParams
	i32 367588125, ; 44: 0x15e8f31d => crc64a0e0a82d0db9a07d/EnergySaverBroadcastReceiver
	i32 378342888, ; 45: 0x168d0de8 => android/bluetooth/BluetoothManager
	i32 382050820, ; 46: 0x16c5a204 => crc64a0e0a82d0db9a07d/MagnetometerListener
	i32 393371378, ; 47: 0x17725ef2 => mono/java/lang/RunnableImplementor
	i32 398599711, ; 48: 0x17c2261f => android/content/pm/ResolveInfo
	i32 409823472, ; 49: 0x186d68f0 => androidx/browser/customtabs/CustomTabsCallback
	i32 412395228, ; 50: 0x1894a6dc => java/security/KeyStore$LoadStoreParameter
	i32 412771173, ; 51: 0x189a6365 => java/lang/Long
	i32 419359493, ; 52: 0x18feeb05 => java/util/Iterator
	i32 420482824, ; 53: 0x19100f08 => java/net/ConnectException
	i32 426419005, ; 54: 0x196aa33d => com/trimble/empower/internal/IModuleManagerService$Stub$Proxy
	i32 427209000, ; 55: 0x1976b128 => xamarin/essentials/fileProvider
	i32 434958167, ; 56: 0x19ecef57 => android/runtime/XmlReaderPullParser
	i32 437664463, ; 57: 0x1a163acf => android/app/UiModeManager
	i32 443233435, ; 58: 0x1a6b349b => java/lang/LinkageError
	i32 467220734, ; 59: 0x1bd938fe => android/widget/AbsSpinner
	i32 500125258, ; 60: 0x1dcf4e4a => android/provider/DocumentsContract
	i32 501733478, ; 61: 0x1de7d866 => android/view/ViewGroup$MarginLayoutParams
	i32 511734837, ; 62: 0x1e807435 => crc6445b87d7bcfab1150/BBServiceConnection
	i32 517668398, ; 63: 0x1edafe2e => android/os/Parcel
	i32 519737682, ; 64: 0x1efa9152 => java/security/InvalidKeyException
	i32 530621972, ; 65: 0x1fa0a614 => com/trimble/empower/internal/IScioLevelListener$Stub$Proxy
	i32 531198748, ; 66: 0x1fa9731c => mono/android/runtime/OutputStreamAdapter
	i32 535638622, ; 67: 0x1fed325e => crc6454360aa41b8b940b/BTSelectActivity_BthDevListAdapter
	i32 542997721, ; 68: 0x205d7cd9 => com/trimble/empower/internal/IScioConfigurationListener$Stub$Proxy
	i32 549488702, ; 69: 0x20c0883e => com/trimble/empower/internal/IScioConfigurationListener$Stub
	i32 559312850, ; 70: 0x21566fd2 => com/trimble/empower/internal/IModulePowerExtension$Stub
	i32 559754593, ; 71: 0x215d2d61 => com/trimble/empower/em940/internal/IAvailabilityCallback$Stub
	i32 581097368, ; 72: 0x22a2d798 => java/nio/channels/FileChannel
	i32 584231583, ; 73: 0x22d2aa9f => java/lang/IllegalStateException
	i32 584848637, ; 74: 0x22dc14fd => android/hardware/camera2/CameraCharacteristics$Key
	i32 587341233, ; 75: 0x23021db1 => android/bluetooth/BluetoothDevice
	i32 591810476, ; 76: 0x23464fac => android/os/Bundle
	i32 592832694, ; 77: 0x2355e8b6 => androidx/browser/customtabs/CustomTabsClient
	i32 599432462, ; 78: 0x23ba9d0e => com/trimble/empower/internal/ITestAgentControl$Stub$Proxy
	i32 603469517, ; 79: 0x23f836cd => android/provider/ContactsContract
	i32 606085292, ; 80: 0x242020ac => java/io/Serializable
	i32 619060219, ; 81: 0x24e61bfb => java/net/URL
	i32 619202217, ; 82: 0x24e846a9 => com/trimble/empower/em940/internal/IEM940Device$Stub
	i32 627942191, ; 83: 0x256da32f => android/telephony/PhoneNumberUtils
	i32 631020402, ; 84: 0x259c9b72 => com/trimble/empower/AgentAdapter
	i32 638344030, ; 85: 0x260c5b5e => com/trimble/empower/ModuleStatus
	i32 641614977, ; 86: 0x263e4481 => android/hardware/camera2/CameraManager
	i32 657696663, ; 87: 0x2733a797 => androidx/core/app/SharedElementCallback$OnSharedElementsReadyListener
	i32 659147580, ; 88: 0x2749cb3c => com/trimble/empower/internal/ITestAgentControl
	i32 663703567, ; 89: 0x278f500f => crc640eda0984e46970d1/ITMMServiceStub_Proxy
	i32 673806054, ; 90: 0x282976e6 => mono/android/widget/AdapterView_OnItemSelectedListenerImplementor
	i32 692638611, ; 91: 0x2948d393 => android/app/Service
	i32 692920175, ; 92: 0x294d1f6f => java/util/ArrayList
	i32 699867921, ; 93: 0x29b72311 => android/content/res/AssetFileDescriptor
	i32 780408360, ; 94: 0x2e841628 => java/lang/CharSequence
	i32 780987551, ; 95: 0x2e8cec9f => java/io/PrintWriter
	i32 782252353, ; 96: 0x2ea03941 => com/trimble/empower/ModuleManager$MMConnectionCallback
	i32 787894236, ; 97: 0x2ef64fdc => com/trimble/timservice/ITimService$Stub
	i32 793918146, ; 98: 0x2f523ac2 => java/lang/Integer
	i32 802926847, ; 99: 0x2fdbb0ff => java/security/cert/CertificateEncodingException
	i32 805498755, ; 100: 0x3002ef83 => android/os/IBinder$DeathRecipient
	i32 806800039, ; 101: 0x3016caa7 => java/lang/Thread
	i32 809301681, ; 102: 0x303cf6b1 => android/provider/ContactsContract$CommonDataKinds
	i32 809332619, ; 103: 0x303d6f8b => java/lang/UnsatisfiedLinkError
	i32 827461610, ; 104: 0x31520fea => android/provider/MediaStore$Images
	i32 829003290, ; 105: 0x3169961a => com/trimble/bluebottle/remoteapi/IBlueBottleCallback$Stub
	i32 838682992, ; 106: 0x31fd4970 => java/lang/NullPointerException
	i32 845998566, ; 107: 0x326ce9e6 => android/widget/RemoteViews
	i32 857458217, ; 108: 0x331bc629 => android/content/res/AssetManager
	i32 864882745, ; 109: 0x338d1039 => android/graphics/Bitmap$Config
	i32 876646173, ; 110: 0x34408f1d => javax/net/ssl/TrustManager
	i32 883855573, ; 111: 0x34ae90d5 => android/provider/MediaStore$Images$Media
	i32 885223365, ; 112: 0x34c36fc5 => android/content/ContentResolver
	i32 885491371, ; 113: 0x34c786ab => com/trimble/empower/ModuleManagerStatusCallback
	i32 887403171, ; 114: 0x34e4b2a3 => crc640eda0984e46970d1/ITMMServiceStub
	i32 893363610, ; 115: 0x353fa59a => java/lang/Short
	i32 899478241, ; 116: 0x359cf2e1 => androidx/core/content/FileProvider
	i32 906034180, ; 117: 0x3600fc04 => android/database/Cursor
	i32 911641942, ; 118: 0x36568d56 => com/trimble/empower/internal/IModulePowerExtension$Stub$Proxy
	i32 924972967, ; 119: 0x3721f7a7 => androidx/core/app/ActivityCompat$PermissionCompatDelegate
	i32 954160213, ; 120: 0x38df5455 => crc64a0e0a82d0db9a07d/ActivityLifecycleContextListener
	i32 984605620, ; 121: 0x3aafe3b4 => android/graphics/PointF
	i32 986059584, ; 122: 0x3ac61340 => androidx/core/content/ContextCompat
	i32 996699600, ; 123: 0x3b686dd0 => java/io/FileDescriptor
	i32 1007618603, ; 124: 0x3c0f0a2b => android/location/Location
	i32 1008962460, ; 125: 0x3c238b9c => android/graphics/Color
	i32 1016604757, ; 126: 0x3c982855 => com/trimble/timservice/ITimService
	i32 1018791985, ; 127: 0x3cb98831 => android/widget/EditText
	i32 1026417919, ; 128: 0x3d2de4ff => android/view/WindowMetrics
	i32 1026507328, ; 129: 0x3d2f4240 => java/net/SocketAddress
	i32 1030707578, ; 130: 0x3d6f597a => android/database/DataSetObserver
	i32 1032957525, ; 131: 0x3d91ae55 => java/util/UUID
	i32 1035992969, ; 132: 0x3dbfff89 => android/content/res/Resources
	i32 1055138080, ; 133: 0x3ee42120 => crc649aea178664f9314c/k
	i32 1057971530, ; 134: 0x3f0f5d4a => com/trimble/empower/em940/EM940DeviceInfo
	i32 1062235695, ; 135: 0x3f506e2f => java/security/KeyStore$ProtectionParameter
	i32 1066067142, ; 136: 0x3f8ae4c6 => com/trimble/empower/internal/IOvercurrentListener$Stub
	i32 1070459310, ; 137: 0x3fcde9ae => android/database/ContentObserver
	i32 1077629184, ; 138: 0x403b5100 => java/util/function/Consumer
	i32 1084296731, ; 139: 0x40a10e1b => android/hardware/Sensor
	i32 1087236105, ; 140: 0x40cde809 => com/trimble/empower/em940/internal/IEM940EventListener$Default
	i32 1090939588, ; 141: 0x41066ac4 => javax/net/ssl/KeyManagerFactory
	i32 1097102249, ; 142: 0x416473a9 => android/hardware/SensorManager
	i32 1102556300, ; 143: 0x41b7ac8c => android/provider/Settings$NameValueTable
	i32 1104642368, ; 144: 0x41d78140 => androidx/browser/customtabs/CustomTabsServiceConnection
	i32 1109635166, ; 145: 0x4223b05e => crc64a0e0a82d0db9a07d/GyroscopeListener
	i32 1120939605, ; 146: 0x42d02e55 => com/trimble/empower/internal/RemoteCallResult
	i32 1133901542, ; 147: 0x4395f6e6 => com/trimble/empower/ModuleStatus$DetailedState
	i32 1134409266, ; 148: 0x439db632 => com/trimble/empower/ScioHostPin
	i32 1134776195, ; 149: 0x43a34f83 => mono/com/trimble/empower/ScioLevelListenerImplementor
	i32 1142011573, ; 150: 0x4411b6b5 => java/util/Enumeration
	i32 1172217576, ; 151: 0x45de9ee8 => android/net/wifi/WifiManager
	i32 1185273701, ; 152: 0x46a5d765 => android/view/SubMenu
	i32 1185864189, ; 153: 0x46aed9fd => crc64a0e0a82d0db9a07d/ClipboardChangeListener
	i32 1195821077, ; 154: 0x4746c815 => android/net/Network
	i32 1196063310, ; 155: 0x474a7a4e => java/lang/Appendable
	i32 1196093578, ; 156: 0x474af08a => android/provider/Settings$System
	i32 1201226558, ; 157: 0x4799433e => android/net/NetworkInfo
	i32 1212354072, ; 158: 0x48430e18 => crc6454360aa41b8b940b/AltGeoRelayService
	i32 1227075600, ; 159: 0x4923b010 => javax/security/cert/Certificate
	i32 1229698105, ; 160: 0x494bb439 => javax/crypto/KeyGenerator
	i32 1267415633, ; 161: 0x4b8b3a51 => android/os/Vibrator
	i32 1270561450, ; 162: 0x4bbb3aaa => java/net/SocketTimeoutException
	i32 1287185695, ; 163: 0x4cb8e51f => com/trimble/empower/ScioConfiguration$ScioPinType
	i32 1287751596, ; 164: 0x4cc187ac => android/net/NetworkRequest
	i32 1293037607, ; 165: 0x4d123027 => com/trimble/empower/em940/EM940Device$PurgeType
	i32 1298454265, ; 166: 0x4d64d6f9 => java/lang/Throwable
	i32 1305328156, ; 167: 0x4dcdba1c => com/trimble/empower/abstractmsp/AbstractAgent
	i32 1307354973, ; 168: 0x4deca75d => android/os/Binder
	i32 1309304208, ; 169: 0x4e0a6590 => crc64a0e0a82d0db9a07d/IntermediateActivity
	i32 1322335863, ; 170: 0x4ed13e77 => crc640eda0984e46970d1/ITMMService
	i32 1323697755, ; 171: 0x4ee6065b => javax/net/ssl/SSLContext
	i32 1326847599, ; 172: 0x4f16166f => com/trimble/empower/em940/internal/IEM940Device$Default
	i32 1335098580, ; 173: 0x4f93fcd4 => java/util/Collection
	i32 1348172419, ; 174: 0x505b7a83 => android/app/ActionBar
	i32 1366794259, ; 175: 0x5177a013 => com/trimble/empower/em940/em940lib/BuildConfig
	i32 1368421702, ; 176: 0x51907546 => java/lang/ClassCastException
	i32 1370891736, ; 177: 0x51b625d8 => android/graphics/PorterDuff$Mode
	i32 1373631042, ; 178: 0x51dff242 => javax/net/ssl/KeyManager
	i32 1386191149, ; 179: 0x529f992d => crc64a0e0a82d0db9a07d/SensorListener
	i32 1386757446, ; 180: 0x52a83d46 => android/content/ComponentName
	i32 1404913674, ; 181: 0x53bd480a => java/util/Locale$Category
	i32 1411882691, ; 182: 0x54279ec3 => com/trimble/bluebottle/remoteapi/IBlueBottleService$Stub
	i32 1415978247, ; 183: 0x54661d07 => android/content/pm/ApplicationInfo
	i32 1425790689, ; 184: 0x54fbd6e1 => java/lang/SecurityException
	i32 1427956626, ; 185: 0x551ce392 => com/trimble/timservice/LicenseState
	i32 1428048664, ; 186: 0x551e4b18 => java/net/HttpURLConnection
	i32 1429796945, ; 187: 0x5538f851 => android/graphics/RectF
	i32 1433059198, ; 188: 0x556abf7e => android/view/ViewManager
	i32 1447309214, ; 189: 0x56442f9e => android/widget/LinearLayout$LayoutParams
	i32 1459844378, ; 190: 0x5703751a => android/widget/ProgressBar
	i32 1468926840, ; 191: 0x578e0b78 => javax/crypto/IllegalBlockSizeException
	i32 1471825111, ; 192: 0x57ba44d7 => java/io/FilterOutputStream
	i32 1472468295, ; 193: 0x57c41547 => androidx/core/app/ActivityCompat
	i32 1475682991, ; 194: 0x57f522af => java/util/HashMap
	i32 1476293262, ; 195: 0x57fe728e => javax/security/auth/Subject
	i32 1477518586, ; 196: 0x581124fa => android/net/NetworkRequest$Builder
	i32 1489594546, ; 197: 0x58c968b2 => java/nio/channels/spi/AbstractInterruptibleChannel
	i32 1492815417, ; 198: 0x58fa8e39 => java/util/concurrent/Executor
	i32 1493177788, ; 199: 0x590015bc => android/content/ClipboardManager$OnPrimaryClipChangedListener
	i32 1494526648, ; 200: 0x5914aab8 => android/provider/ContactsContract$CommonDataKinds$Email
	i32 1506774891, ; 201: 0x59cf8f6b => android/widget/Button
	i32 1518406749, ; 202: 0x5a810c5d => android/provider/MediaStore$Audio$Media
	i32 1521791924, ; 203: 0x5ab4b3b4 => java/math/BigInteger
	i32 1525458417, ; 204: 0x5aeca5f1 => java/security/PrivateKey
	i32 1536774344, ; 205: 0x5b9950c8 => android/provider/MediaStore$Audio
	i32 1540303371, ; 206: 0x5bcf2a0b => androidx/browser/customtabs/CustomTabsClient_CustomTabsCallbackImpl
	i32 1544613420, ; 207: 0x5c10ee2c => java/io/File
	i32 1548306256, ; 208: 0x5c494750 => android/view/WindowManager$LayoutParams
	i32 1550531333, ; 209: 0x5c6b3b05 => android/content/ContentProvider
	i32 1573833883, ; 210: 0x5dcecc9b => android/app/AlertDialog
	i32 1584672329, ; 211: 0x5e742e49 => android/view/Display
	i32 1586851388, ; 212: 0x5e956e3c => android/os/Handler
	i32 1592623669, ; 213: 0x5eed8235 => android/content/pm/FeatureInfo
	i32 1619788079, ; 214: 0x608c012f => android/net/LinkProperties
	i32 1636409781, ; 215: 0x6189a1b5 => androidx/core/content/PermissionChecker
	i32 1636972976, ; 216: 0x619239b0 => com/trimble/empower/ModuleManager
	i32 1637959351, ; 217: 0x61a146b7 => java/security/Principal
	i32 1642333393, ; 218: 0x61e404d1 => crc64a0e0a82d0db9a07d/Connectivity_EssentialsNetworkCallback
	i32 1644876130, ; 219: 0x620ad162 => android/graphics/Matrix
	i32 1646348278, ; 220: 0x622147f6 => android/view/View
	i32 1649695927, ; 221: 0x62545cb7 => java/lang/RuntimeException
	i32 1650608735, ; 222: 0x62624a5f => android/hardware/Camera
	i32 1653006350, ; 223: 0x6286e00e => com/trimble/empower/em940/internal/IAvailabilityCallback$Default
	i32 1657134862, ; 224: 0x62c5df0e => java/lang/IndexOutOfBoundsException
	i32 1667745763, ; 225: 0x6367c7e3 => javax/crypto/Cipher
	i32 1680835779, ; 226: 0x642f84c3 => java/lang/Byte
	i32 1685899294, ; 227: 0x647cc81e => com/trimble/empower/internal/HashMapWrapper
	i32 1699467861, ; 228: 0x654bd255 => android/widget/CompoundButton
	i32 1718265030, ; 229: 0x666aa4c6 => java/lang/Character
	i32 1729659134, ; 230: 0x671880fe => android/view/MenuInflater
	i32 1733881762, ; 231: 0x6758efa2 => android/content/ClipData$Item
	i32 1734262932, ; 232: 0x675ec094 => android/os/RemoteException
	i32 1740929322, ; 233: 0x67c4792a => android/os/IInterface
	i32 1746572858, ; 234: 0x681a963a => android/app/Application$ActivityLifecycleCallbacks
	i32 1755285137, ; 235: 0x689f8691 => java/util/Random
	i32 1758490869, ; 236: 0x68d070f5 => android/os/BaseBundle
	i32 1761245836, ; 237: 0x68fa7a8c => android/content/ClipData
	i32 1766913108, ; 238: 0x6950f454 => android/location/Address
	i32 1772705556, ; 239: 0x69a95714 => android/graphics/Point
	i32 1775207376, ; 240: 0x69cf83d0 => com/trimble/empower/internal/IScioHostPin$Stub$Proxy
	i32 1775355160, ; 241: 0x69d1c518 => android/content/res/ColorStateList
	i32 1779533588, ; 242: 0x6a118714 => android/provider/MediaStore$Video$Media
	i32 1789590532, ; 243: 0x6aaafc04 => androidx/browser/customtabs/CustomTabsSession$PendingSession
	i32 1790236887, ; 244: 0x6ab4d8d7 => android/text/Spanned
	i32 1807220671, ; 245: 0x6bb7ffbf => android/view/View$OnClickListener
	i32 1816453522, ; 246: 0x6c44e192 => crc64a0e0a82d0db9a07d/BatteryBroadcastReceiver
	i32 1817676547, ; 247: 0x6c578b03 => android/net/ConnectivityManager$NetworkCallback
	i32 1828773851, ; 248: 0x6d00dfdb => java/security/cert/CertificateFactory
	i32 1847790017, ; 249: 0x6e2309c1 => crc64775202d62a505530/c
	i32 1851730788, ; 250: 0x6e5f2b64 => java/lang/Runnable
	i32 1855628473, ; 251: 0x6e9aa4b9 => mono/android/text/TextWatcherImplementor
	i32 1859010077, ; 252: 0x6ece3e1d => android/widget/LinearLayout
	i32 1869790738, ; 253: 0x6f72be12 => android/location/Criteria
	i32 1878373007, ; 254: 0x6ff5b28f => com/trimble/empower/internal/IModuleManagerService$Stub
	i32 1882901398, ; 255: 0x703acb96 => com/trimble/empower/em940/internal/IEM940Manager$Default
	i32 1884841200, ; 256: 0x705864f0 => android/os/PowerManager
	i32 1923639542, ; 257: 0x72a868f6 => android/content/pm/ComponentInfo
	i32 1943778051, ; 258: 0x73dbb303 => android/widget/AdapterView$OnItemSelectedListener
	i32 1944129628, ; 259: 0x73e1105c => java/io/OutputStream
	i32 1946636996, ; 260: 0x740752c4 => android/bluetooth/BluetoothAdapter
	i32 1962126435, ; 261: 0x74f3ac63 => android/content/BroadcastReceiver
	i32 1974195834, ; 262: 0x75abd67a => java/security/InvalidAlgorithmParameterException
	i32 1980671790, ; 263: 0x760ea72e => com/trimble/empower/internal/IScioLevelListener
	i32 1985929388, ; 264: 0x765ee0ac => android/app/Activity
	i32 1987841337, ; 265: 0x767c0d39 => java/lang/Boolean
	i32 1990610968, ; 266: 0x76a65018 => android/widget/AdapterView$OnItemClickListener
	i32 1997394156, ; 267: 0x770dd0ec => java/security/MessageDigest
	i32 2008064836, ; 268: 0x77b0a344 => android/content/Intent
	i32 2027782872, ; 269: 0x78dd82d8 => android/view/ContextThemeWrapper
	i32 2031450615, ; 270: 0x791579f7 => android/widget/AdapterView
	i32 2036556174, ; 271: 0x7963618e => android/content/DialogInterface
	i32 2037245082, ; 272: 0x796de49a => com/trimble/empower/abstractmsp/AbstractManagerService$ModListener
	i32 2043030513, ; 273: 0x79c62bf1 => android/os/Parcelable$Creator
	i32 2046574810, ; 274: 0x79fc40da => java/util/Locale
	i32 2061721420, ; 275: 0x7ae35f4c => android/database/CharArrayBuffer
	i32 2064723667, ; 276: 0x7b112ed3 => android/widget/SpinnerAdapter
	i32 2073337312, ; 277: 0x7b949de0 => android/app/AlertDialog$Builder
	i32 2079753938, ; 278: 0x7bf686d2 => android/content/IntentSender
	i32 2080685156, ; 279: 0x7c04bc64 => java/security/SecureRandom
	i32 2085131557, ; 280: 0x7c489525 => android/location/Geocoder
	i32 2090823071, ; 281: 0x7c9f6d9f => android/os/Environment
	i32 2104284586, ; 282: 0x7d6cd5aa => android/content/ClipboardManager
	i32 2112852309, ; 283: 0x7def9155 => com/trimble/empower/ModuleStatus$ErrorCode
	i32 2114237978, ; 284: 0x7e04b61a => android/content/res/Configuration
	i32 2123880745, ; 285: 0x7e97d929 => android/content/ContentValues
	i32 2134618419, ; 286: 0x7f3bb133 => com/trimble/empower/em940/EM940Device$EM940DeviceStatusCallback
	i32 2137058741, ; 287: 0x7f60edb5 => com/trimble/empower/em940/EM940ApiStatusCallback
	i32 2161054107, ; 288: 0x80cf119b => android/hardware/usb/UsbDevice
	i32 2170257597, ; 289: 0x815b80bd => com/trimble/empower/em940/internal/IEM940DeviceStatusCallback$Default
	i32 2183290666, ; 290: 0x82225f2a => mono/android/widget/CompoundButton_OnCheckedChangeListenerImplementor
	i32 2189999902, ; 291: 0x8288bf1e => com/trimble/empower/abstractmsp/VidPid
	i32 2190244522, ; 292: 0x828c7aaa => java/security/Key
	i32 2204262174, ; 293: 0x83625f1e => org/xmlpull/v1/XmlPullParser
	i32 2222318230, ; 294: 0x8475e296 => android/provider/MediaStore$Video
	i32 2269094561, ; 295: 0x873fa2a1 => java/net/UnknownServiceException
	i32 2270923754, ; 296: 0x875b8bea => java/net/Proxy$Type
	i32 2277023780, ; 297: 0x87b8a024 => android/content/pm/ServiceInfo
	i32 2284656609, ; 298: 0x882d17e1 => android/app/Application
	i32 2295186970, ; 299: 0x88cdc61a => android/speech/tts/TextToSpeech$OnUtteranceCompletedListener
	i32 2296411383, ; 300: 0x88e074f7 => android/content/IntentFilter
	i32 2319694352, ; 301: 0x8a43ba10 => com/trimble/empower/em940/internal/IEM940EventListener
	i32 2321359384, ; 302: 0x8a5d2218 => com/trimble/bluebottle/remoteapi/IBlueBottleCallback
	i32 2341035285, ; 303: 0x8b895d15 => crc6454360aa41b8b940b/BTSelectActivity
	i32 2346390435, ; 304: 0x8bdb13a3 => android/content/pm/ActivityInfo
	i32 2347399792, ; 305: 0x8bea7a70 => android/net/ConnectivityManager
	i32 2347881370, ; 306: 0x8bf1d39a => com/trimble/empower/em940/EM940Manager$AvailabilityCallback
	i32 2363729366, ; 307: 0x8ce3a5d6 => java/lang/Enum
	i32 2371350972, ; 308: 0x8d57f1bc => android/widget/Switch
	i32 2374362468, ; 309: 0x8d85e564 => java/lang/Math
	i32 2379689298, ; 310: 0x8dd72d52 => crc64a0e0a82d0db9a07d/OrientationSensorListener
	i32 2391098046, ; 311: 0x8e8542be => androidx/browser/customtabs/CustomTabsIntent$Builder
	i32 2403095485, ; 312: 0x8f3c53bd => com/trimble/empower/em940/EM940Device$FlowControl
	i32 2404057846, ; 313: 0x8f4b02f6 => android/app/PendingIntent
	i32 2411404453, ; 314: 0x8fbb1ca5 => java/lang/UnsupportedOperationException
	i32 2425506506, ; 315: 0x90924aca => java/security/KeyException
	i32 2442189280, ; 316: 0x9190d9e0 => android/util/AndroidException
	i32 2443438835, ; 317: 0x91a3eaf3 => java/net/SocketException
	i32 2445685880, ; 318: 0x91c63478 => com/trimble/empower/internal/IScioLevelListener$Stub
	i32 2458007569, ; 319: 0x92823811 => android/os/Process
	i32 2461273673, ; 320: 0x92b40e49 => org/xmlpull/v1/XmlPullParserException
	i32 2473649529, ; 321: 0x9370e579 => android/os/DeadObjectException
	i32 2492907271, ; 322: 0x9496bf07 => crc640e50ecb54de2b5d2/CatalystFacadeActivity
	i32 2502314358, ; 323: 0x95264976 => mono/android/view/View_OnLongClickListenerImplementor
	i32 2515615324, ; 324: 0x95f13e5c => mono/com/trimble/empower/em940/EM940EventListenerImplementor
	i32 2519843785, ; 325: 0x9631c3c9 => crc640eda0984e46970d1/LicenseFeatureInfoParcelable
	i32 2529775446, ; 326: 0x96c94f56 => android/speech/tts/TextToSpeech$OnInitListener
	i32 2532846927, ; 327: 0x96f82d4f => android/content/SharedPreferences$OnSharedPreferenceChangeListener
	i32 2541780716, ; 328: 0x97807eec => android/view/ContextMenu$ContextMenuInfo
	i32 2543995195, ; 329: 0x97a2493b => crc64a0e0a82d0db9a07d/Listener
	i32 2551407745, ; 330: 0x98136481 => android/widget/Toolbar
	i32 2555007104, ; 331: 0x984a5080 => android/view/View$OnLongClickListener
	i32 2556636347, ; 332: 0x98632cbb => androidx/browser/customtabs/CustomTabColorSchemeParams
	i32 2558143838, ; 333: 0x987a2d5e => java/io/FileInputStream
	i32 2558637264, ; 334: 0x9881b4d0 => android/graphics/drawable/Icon
	i32 2561967928, ; 335: 0x98b48738 => java/security/cert/X509Certificate
	i32 2568863697, ; 336: 0x991dbfd1 => android/runtime/XmlReaderResourceParser
	i32 2580434793, ; 337: 0x99ce4f69 => javax/crypto/spec/GCMParameterSpec
	i32 2594241228, ; 338: 0x9aa0facc => android/widget/BaseAdapter
	i32 2598778621, ; 339: 0x9ae636fd => java/util/Date
	i32 2624466893, ; 340: 0x9c6e2fcd => android/provider/ContactsContract$Contacts
	i32 2637159311, ; 341: 0x9d2fdb8f => android/content/pm/PackageManager
	i32 2641760479, ; 342: 0x9d7610df => java/security/GeneralSecurityException
	i32 2642404316, ; 343: 0x9d7fe3dc => android/content/pm/Signature
	i32 2654672461, ; 344: 0x9e3b164d => java/io/InterruptedIOException
	i32 2663321095, ; 345: 0x9ebf0e07 => mono/java/lang/Runnable
	i32 2664928003, ; 346: 0x9ed79303 => javax/net/ssl/HostnameVerifier
	i32 2679036415, ; 347: 0x9faed9ff => com/trimble/empower/internal/IScioHostPin$Stub
	i32 2681209703, ; 348: 0x9fd00367 => android/widget/Adapter
	i32 2682228845, ; 349: 0x9fdf906d => com/trimble/empower/em940/EM940Device$State
	i32 2687704771, ; 350: 0xa0331ec3 => com/trimble/empower/abstractmsp/AbstractAgent$ModPowerExt
	i32 2687778660, ; 351: 0xa0343f64 => android/widget/TextView
	i32 2692535938, ; 352: 0xa07cd682 => android/util/Log
	i32 2706693369, ; 353: 0xa154dcf9 => crc64f64ae6bbda7f4685/ModuleListener
	i32 2721599187, ; 354: 0xa2384ed3 => android/graphics/drawable/Drawable
	i32 2736049755, ; 355: 0xa314ce5b => javax/crypto/SecretKey
	i32 2754035778, ; 356: 0xa4274042 => android/content/pm/SigningInfo
	i32 2755748727, ; 357: 0xa4416377 => android/text/Spannable
	i32 2762684487, ; 358: 0xa4ab3847 => java/lang/Float
	i32 2784866525, ; 359: 0xa5fdb0dd => com/trimble/empower/internal/IOvercurrentListener$Stub$Proxy
	i32 2797926825, ; 360: 0xa6c4f9a9 => android/security/keystore/KeyGenParameterSpec$Builder
	i32 2815615939, ; 361: 0xa7d2e3c3 => android/os/Build
	i32 2821384185, ; 362: 0xa82ae7f9 => java/security/spec/AlgorithmParameterSpec
	i32 2837435745, ; 363: 0xa91fd561 => android/view/DragEvent
	i32 2837524074, ; 364: 0xa9212e6a => javax/crypto/AEADBadTagException
	i32 2867111512, ; 365: 0xaae4a658 => com/trimble/bluebottle/remoteapi/ApplicationId
	i32 2872704101, ; 366: 0xab39fc65 => java/lang/System
	i32 2873107855, ; 367: 0xab40258f => android/content/pm/PackageInfo
	i32 2874673969, ; 368: 0xab580b31 => java/lang/StackTraceElement
	i32 2875134118, ; 369: 0xab5f10a6 => com/trimble/empower/BuildConfig
	i32 2881547880, ; 370: 0xabc0ee68 => com/trimble/empower/internal/IOvercurrentListener
	i32 2895048388, ; 371: 0xac8eeec4 => android/content/ServiceConnection
	i32 2895960761, ; 372: 0xac9cdab9 => java/io/FileOutputStream
	i32 2918613155, ; 373: 0xadf680a3 => android/content/DialogInterface$OnClickListener
	i32 2920661627, ; 374: 0xae15c27b => crc6454360aa41b8b940b/BTSelectActivity_BluetoothReceiver
	i32 2922690929, ; 375: 0xae34b971 => android/graphics/BlendMode
	i32 2932874700, ; 376: 0xaed01dcc => android/view/InputEvent
	i32 2933762856, ; 377: 0xaeddab28 => android/util/AttributeSet
	i32 2942792700, ; 378: 0xaf6773fc => java/lang/Exception
	i32 2944806563, ; 379: 0xaf862ea3 => android/widget/ListView
	i32 2967081662, ; 380: 0xb0da12be => com/trimble/empower/abstractmsp/AbstractManagerService
	i32 2970355137, ; 381: 0xb10c05c1 => com/trimble/empower/em940/internal/IAvailabilityCallback
	i32 2980510762, ; 382: 0xb1a6fc2a => mono/android/runtime/JavaArray
	i32 2983720033, ; 383: 0xb1d7f461 => mono/android/TypeManager
	i32 2983793634, ; 384: 0xb1d913e2 => android/widget/Spinner
	i32 2986283990, ; 385: 0xb1ff13d6 => java/util/zip/ZipEntry
	i32 2986931092, ; 386: 0xb208f394 => com/trimble/empower/ModuleManagerException
	i32 3007288156, ; 387: 0xb33f935c => java/security/cert/CertificateException
	i32 3024871371, ; 388: 0xb44bdfcb => com/trimble/empower/em940/EM940EventListener
	i32 3032808825, ; 389: 0xb4c4fd79 => java/io/StringWriter
	i32 3045789494, ; 390: 0xb58b0f36 => android/provider/ContactsContract$Data
	i32 3087255038, ; 391: 0xb803c5fe => android/preference/PreferenceManager
	i32 3118217559, ; 392: 0xb9dc3957 => android/net/Uri$Builder
	i32 3123140711, ; 393: 0xba275867 => com/trimble/empower/em940/EM940Device
	i32 3140434966, ; 394: 0xbb2f3c16 => android/hardware/camera2/CameraCharacteristics
	i32 3146139385, ; 395: 0xbb8646f9 => android/speech/tts/TextToSpeech
	i32 3147069248, ; 396: 0xbb947740 => android/hardware/Camera$Parameters
	i32 3173193659, ; 397: 0xbd2317bb => android/content/pm/ShortcutInfo
	i32 3173395525, ; 398: 0xbd262c45 => android/os/IBinder
	i32 3206222374, ; 399: 0xbf1b1226 => java/util/zip/DeflaterOutputStream
	i32 3207746877, ; 400: 0xbf32553d => android/os/LocaleList
	i32 3214744068, ; 401: 0xbf9d1a04 => android/view/WindowManager
	i32 3226652610, ; 402: 0xc052cfc2 => crc64a0e0a82d0db9a07d/WebAuthenticatorCallbackActivity
	i32 3228132969, ; 403: 0xc0696669 => com/trimble/empower/internal/IModuleListener$Stub
	i32 3233813704, ; 404: 0xc0c014c8 => crc64a0e0a82d0db9a07d/TextToSpeechImplementation
	i32 3262224811, ; 405: 0xc27199ab => crc6454360aa41b8b940b/MainActivity
	i32 3263691200, ; 406: 0xc287f9c0 => java/security/KeyPairGenerator
	i32 3264984574, ; 407: 0xc29bb5fe => android/provider/Telephony$Sms
	i32 3268587150, ; 408: 0xc2d2ae8e => android/location/LocationListener
	i32 3281925794, ; 409: 0xc39e36a2 => android/view/MenuItem
	i32 3300906352, ; 410: 0xc4bfd570 => javax/net/ssl/SSLSession
	i32 3309339282, ; 411: 0xc5408292 => crc64a0e0a82d0db9a07d/WebAuthenticatorIntermediateActivity
	i32 3319735188, ; 412: 0xc5df2394 => java/net/Proxy
	i32 3337648896, ; 413: 0xc6f07b00 => com/trimble/empower/ModuleManager$ClientAgentAdapterImpl
	i32 3347970767, ; 414: 0xc78dfacf => com/trimble/empower/ModuleManager$ScioHostPinImpl
	i32 3360783986, ; 415: 0xc8517e72 => javax/security/auth/x500/X500Principal
	i32 3369471981, ; 416: 0xc8d60fed => android/os/ParcelFileDescriptor
	i32 3379688415, ; 417: 0xc971f3df => android/text/Editable
	i32 3386853318, ; 418: 0xc9df47c6 => androidx/core/content/pm/PackageInfoCompat
	i32 3397817114, ; 419: 0xca86931a => android/widget/ArrayAdapter
	i32 3402676880, ; 420: 0xcad0ba90 => android/graphics/SurfaceTexture
	i32 3407837353, ; 421: 0xcb1f78a9 => java/security/MessageDigestSpi
	i32 3409419575, ; 422: 0xcb379d37 => javax/net/ssl/HttpsURLConnection
	i32 3411937235, ; 423: 0xcb5e07d3 => mono/com/trimble/empower/OvercurrentListenerImplementor
	i32 3414007398, ; 424: 0xcb7d9e66 => android/bluetooth/BluetoothSocket
	i32 3418132667, ; 425: 0xcbbc90bb => android/security/KeyPairGeneratorSpec$Builder
	i32 3419469423, ; 426: 0xcbd0f66f => com/trimble/empower/internal/IModulePowerExtension
	i32 3423467887, ; 427: 0xcc0df96f => java/lang/Number
	i32 3429171913, ; 428: 0xcc6502c9 => com/trimble/empower/ModuleListener
	i32 3430868172, ; 429: 0xcc7ee4cc => android/content/SharedPreferences
	i32 3438281240, ; 430: 0xccf00218 => crc6405db95066ba03620/GenericParcelableCreator_1
	i32 3438615635, ; 431: 0xccf51c53 => com/trimble/empower/ScioLevelListener
	i32 3502767550, ; 432: 0xd0c7fdbe => java/security/KeyPair
	i32 3515974447, ; 433: 0xd191832f => java/util/function/IntConsumer
	i32 3519931621, ; 434: 0xd1cde4e5 => java/net/URLConnection
	i32 3521426112, ; 435: 0xd1e4b2c0 => crc64f64ae6bbda7f4685/ModuleManagerListener
	i32 3536376748, ; 436: 0xd2c8d3ac => crc640947112d00c027ad/k
	i32 3539819542, ; 437: 0xd2fd5c16 => androidx/browser/customtabs/CustomTabsIntent
	i32 3548818744, ; 438: 0xd386ad38 => crc64396a3fe5f8138e3f/CustomTabsServiceConnectionImpl
	i32 3549151004, ; 439: 0xd38bbf1c => android/provider/Settings
	i32 3551751493, ; 440: 0xd3b36d45 => android/content/pm/PackageManager$NameNotFoundException
	i32 3557984104, ; 441: 0xd4128768 => android/util/SizeF
	i32 3560988018, ; 442: 0xd4405d72 => android/security/KeyPairGeneratorSpec
	i32 3564799261, ; 443: 0xd47a851d => java/security/NoSuchAlgorithmException
	i32 3570179016, ; 444: 0xd4cc9bc8 => android/content/ActivityNotFoundException
	i32 3576242387, ; 445: 0xd52920d3 => android/runtime/JavaProxyThrowable
	i32 3579986674, ; 446: 0xd56242f2 => crc6454360aa41b8b940b/Configuration
	i32 3597654493, ; 447: 0xd66fd9dd => android/widget/AbsListView
	i32 3665774669, ; 448: 0xda7f484d => android/view/LayoutInflater
	i32 3666243682, ; 449: 0xda867062 => java/lang/String
	i32 3669061717, ; 450: 0xdab17055 => java/net/InetSocketAddress
	i32 3683323802, ; 451: 0xdb8b0f9a => mono/android/runtime/JavaObject
	i32 3684070586, ; 452: 0xdb9674ba => android/view/ActionProvider
	i32 3702230909, ; 453: 0xdcab8f7d => java/lang/Double
	i32 3715861037, ; 454: 0xdd7b8a2d => android/os/Build$VERSION
	i32 3721088312, ; 455: 0xddcb4d38 => android/text/NoCopySpan
	i32 3722843854, ; 456: 0xdde616ce => javax/net/SocketFactory
	i32 3726680736, ; 457: 0xde20a2a0 => java/net/ProtocolException
	i32 3727100099, ; 458: 0xde2708c3 => mono/com/trimble/empower/ModuleListenerImplementor
	i32 3742276719, ; 459: 0xdf0e9c6f => org/json/JSONArray
	i32 3759929762, ; 460: 0xe01bf9a2 => android/graphics/Bitmap
	i32 3763853270, ; 461: 0xe057d7d6 => android/view/Window
	i32 3773018956, ; 462: 0xe0e3b34c => crc64a0e0a82d0db9a07d/AccelerometerListener
	i32 3823421666, ; 463: 0xe3e4c8e2 => android/net/Uri
	i32 3823448248, ; 464: 0xe3e530b8 => com/trimble/empower/em940/internal/IEM940DeviceStatusCallback$Stub
	i32 3834671610, ; 465: 0xe49071fa => com/trimble/timservice/ITimService$Stub$Proxy
	i32 3865571169, ; 466: 0xe667ef61 => android/content/res/XmlResourceParser
	i32 3865852090, ; 467: 0xe66c38ba => com/trimble/empower/em940/internal/IEM940Manager
	i32 3882570516, ; 468: 0xe76b5314 => java/lang/Class
	i32 3883392581, ; 469: 0xe777de45 => org/json/JSONObject
	i32 3884639814, ; 470: 0xe78ae646 => android/text/Html
	i32 3895425567, ; 471: 0xe82f7a1f => androidx/core/app/SharedElementCallback
	i32 3900581163, ; 472: 0xe87e252b => java/io/InputStream
	i32 3901837667, ; 473: 0xe8915163 => android/text/InputFilter
	i32 3912451735, ; 474: 0xe9334697 => java/security/KeyStore
	i32 3920921908, ; 475: 0xe9b48534 => android/net/NetworkCapabilities
	i32 3931120197, ; 476: 0xea502245 => mono/android/content/DialogInterface_OnClickListenerImplementor
	i32 3933245259, ; 477: 0xea708f4b => android/graphics/Rect
	i32 3943749965, ; 478: 0xeb10d94d => android/content/pm/ShortcutManager
	i32 3953842627, ; 479: 0xebaad9c3 => java/net/URLEncoder
	i32 3960999444, ; 480: 0xec180e14 => android/widget/Toast
	i32 3969984744, ; 481: 0xeca128e8 => mono/android/runtime/InputStreamAdapter
	i32 3975001277, ; 482: 0xecedb4bd => javax/net/ssl/SSLSocketFactory
	i32 3975543734, ; 483: 0xecf5fbb6 => android/security/keystore/KeyGenParameterSpec
	i32 3982019694, ; 484: 0xed58cc6e => com/trimble/empower/ScioConfiguration
	i32 3990476291, ; 485: 0xedd9d603 => java/util/Properties
	i32 3993327007, ; 486: 0xee05559f => android/content/ContextWrapper
	i32 3994276571, ; 487: 0xee13d2db => com/trimble/bluebottle/remoteapi/IBlueBottleService
	i32 3995406185, ; 488: 0xee250f69 => android/graphics/Canvas
	i32 4005528696, ; 489: 0xeebf8478 => com/trimble/empower/em940/EM940Manager
	i32 4020308495, ; 490: 0xefa10a0f => java/lang/Error
	i32 4025067947, ; 491: 0xefe9a9ab => android/webkit/MimeTypeMap
	i32 4026153166, ; 492: 0xeffa38ce => androidx/core/view/DragAndDropPermissionsCompat
	i32 4030673356, ; 493: 0xf03f31cc => android/app/Dialog
	i32 4033491269, ; 494: 0xf06a3145 => com/trimble/empower/internal/IAgentAdapter$Stub
	i32 4051772911, ; 495: 0xf18125ef => android/content/Context
	i32 4067718448, ; 496: 0xf2747530 => com/trimble/empower/abstractmsp/AbstractManagerService$ModManCallback
	i32 4088038176, ; 497: 0xf3aa8320 => java/io/Reader
	i32 4098107575, ; 498: 0xf44428b7 => mono/android/view/View_OnClickListenerImplementor
	i32 4101363546, ; 499: 0xf475d75a => java/io/Writer
	i32 4111994550, ; 500: 0xf5180eb6 => mono/com/trimble/empower/ScioConfigurationListenerImplementor
	i32 4114585087, ; 501: 0xf53f95ff => com/trimble/empower/em940/internal/IEM940Manager$Stub
	i32 4118878202, ; 502: 0xf58117fa => android/os/Looper
	i32 4127266501, ; 503: 0xf60116c5 => mono/android/widget/AdapterView_OnItemClickListenerImplementor
	i32 4134503627, ; 504: 0xf66f84cb => android/provider/Telephony
	i32 4136260101, ; 505: 0xf68a5205 => android/text/ClipboardManager
	i32 4137330413, ; 506: 0xf69aa6ed => android/content/pm/ShortcutInfo$Builder
	i32 4148593869, ; 507: 0xf74684cd => javax/net/ssl/TrustManagerFactory
	i32 4157808693, ; 508: 0xf7d32035 => java/io/IOException
	i32 4166165970, ; 509: 0xf852a5d2 => android/text/TextWatcher
	i32 4180256392, ; 510: 0xf929a688 => com/trimble/empower/ScioConfigurationListener
	i32 4197701793, ; 511: 0xfa33d8a1 => java/util/zip/ZipOutputStream
	i32 4203502565, ; 512: 0xfa8c5be5 => android/graphics/Bitmap$CompressFormat
	i32 4232707919, ; 513: 0xfc49ff4f => java/util/HashSet
	i32 4235633546, ; 514: 0xfc76a38a => android/os/VibrationEffect
	i32 4236724582, ; 515: 0xfc874966 => android/os/Parcelable
	i32 4237386260, ; 516: 0xfc916214 => android/view/MenuItem$OnMenuItemClickListener
	i32 4238854579, ; 517: 0xfca7c9b3 => androidx/browser/customtabs/CustomTabsSession
	i32 4241054514, ; 518: 0xfcc95b32 => crc640eda0984e46970d1/LicenseGroupParcelable
	i32 4246685161, ; 519: 0xfd1f45e9 => android/hardware/SensorEventListener
	i32 4248811056, ; 520: 0xfd3fb630 => android/view/Menu
	i32 4255863715, ; 521: 0xfdab53a3 => com/trimble/empower/em940/internal/IEM940DeviceStatusCallback
	i32 4260664886, ; 522: 0xfdf49636 => android/hardware/SensorEvent
	i32 4268805981, ; 523: 0xfe70cf5d => android/location/LocationManager
	i32 4271127433, ; 524: 0xfe943b89 => android/graphics/PorterDuff
	i32 4277523103, ; 525: 0xfef5d29f => java/io/Closeable
	i32 4278949669, ; 526: 0xff0b9725 => android/widget/CompoundButton$OnCheckedChangeListener
	i32 4281582266, ; 527: 0xff33c2ba => crc640e50ecb54de2b5d2/TCPCommunicator_NetworkCallback
	i32 4283771740, ; 528: 0xff552b5c => crc64a0e0a82d0db9a07d/BarometerListener
	i32 4284762998 ; 529: 0xff644b76 => com/trimble/empower/internal/IModuleManagerService
], align 4

@module0_managed_to_java = internal dso_local constant [60 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554435, ; uint32_t type_token_id (0x2000003)
		i32 369; uint32_t java_map_index (0x171)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554437, ; uint32_t type_token_id (0x2000005)
		i32 84; uint32_t java_map_index (0x54)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554439, ; uint32_t type_token_id (0x2000007)
		i32 428; uint32_t java_map_index (0x1ac)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554442, ; uint32_t type_token_id (0x200000a)
		i32 458; uint32_t java_map_index (0x1ca)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554444, ; uint32_t type_token_id (0x200000c)
		i32 113; uint32_t java_map_index (0x71)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554446, ; uint32_t type_token_id (0x200000e)
		i32 24; uint32_t java_map_index (0x18)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554448, ; uint32_t type_token_id (0x2000010)
		i32 29; uint32_t java_map_index (0x1d)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554450, ; uint32_t type_token_id (0x2000012)
		i32 423; uint32_t java_map_index (0x1a7)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554452, ; uint32_t type_token_id (0x2000014)
		i32 510; uint32_t java_map_index (0x1fe)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554455, ; uint32_t type_token_id (0x2000017)
		i32 500; uint32_t java_map_index (0x1f4)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554457, ; uint32_t type_token_id (0x2000019)
		i32 148; uint32_t java_map_index (0x94)
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 33554459, ; uint32_t type_token_id (0x200001b)
		i32 431; uint32_t java_map_index (0x1af)
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 33554461, ; uint32_t type_token_id (0x200001d)
		i32 149; uint32_t java_map_index (0x95)
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 33554462, ; uint32_t type_token_id (0x200001e)
		i32 216; uint32_t java_map_index (0xd8)
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 33554463, ; uint32_t type_token_id (0x200001f)
		i32 413; uint32_t java_map_index (0x19d)
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 33554464, ; uint32_t type_token_id (0x2000020)
		i32 23; uint32_t java_map_index (0x17)
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 33554465, ; uint32_t type_token_id (0x2000021)
		i32 96; uint32_t java_map_index (0x60)
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 33554466, ; uint32_t type_token_id (0x2000022)
		i32 2; uint32_t java_map_index (0x2)
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 33554467, ; uint32_t type_token_id (0x2000023)
		i32 414; uint32_t java_map_index (0x19e)
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 33554468, ; uint32_t type_token_id (0x2000024)
		i32 386; uint32_t java_map_index (0x182)
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 33554469, ; uint32_t type_token_id (0x2000025)
		i32 85; uint32_t java_map_index (0x55)
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 33554470, ; uint32_t type_token_id (0x2000026)
		i32 147; uint32_t java_map_index (0x93)
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 33554471, ; uint32_t type_token_id (0x2000027)
		i32 283; uint32_t java_map_index (0x11b)
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 33554472, ; uint32_t type_token_id (0x2000028)
		i32 484; uint32_t java_map_index (0x1e4)
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 33554473, ; uint32_t type_token_id (0x2000029)
		i32 163; uint32_t java_map_index (0xa3)
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 33554474, ; uint32_t type_token_id (0x200002a)
		i32 227; uint32_t java_map_index (0xe3)
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 33554475, ; uint32_t type_token_id (0x200002b)
		i32 494; uint32_t java_map_index (0x1ee)
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 33554476, ; uint32_t type_token_id (0x200002c)
		i32 42; uint32_t java_map_index (0x2a)
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 33554479, ; uint32_t type_token_id (0x200002f)
		i32 30; uint32_t java_map_index (0x1e)
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 33554480, ; uint32_t type_token_id (0x2000030)
		i32 403; uint32_t java_map_index (0x193)
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 33554481, ; uint32_t type_token_id (0x2000031)
		i32 34; uint32_t java_map_index (0x22)
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 33554484, ; uint32_t type_token_id (0x2000034)
		i32 37; uint32_t java_map_index (0x25)
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 33554485, ; uint32_t type_token_id (0x2000035)
		i32 254; uint32_t java_map_index (0xfe)
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 33554486, ; uint32_t type_token_id (0x2000036)
		i32 54; uint32_t java_map_index (0x36)
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 33554489, ; uint32_t type_token_id (0x2000039)
		i32 529; uint32_t java_map_index (0x211)
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 33554490, ; uint32_t type_token_id (0x200003a)
		i32 70; uint32_t java_map_index (0x46)
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 33554491, ; uint32_t type_token_id (0x200003b)
		i32 118; uint32_t java_map_index (0x76)
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 33554494, ; uint32_t type_token_id (0x200003e)
		i32 426; uint32_t java_map_index (0x1aa)
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 33554495, ; uint32_t type_token_id (0x200003f)
		i32 136; uint32_t java_map_index (0x88)
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 33554496, ; uint32_t type_token_id (0x2000040)
		i32 359; uint32_t java_map_index (0x167)
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 33554499, ; uint32_t type_token_id (0x2000043)
		i32 370; uint32_t java_map_index (0x172)
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 33554500, ; uint32_t type_token_id (0x2000044)
		i32 69; uint32_t java_map_index (0x45)
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 33554501, ; uint32_t type_token_id (0x2000045)
		i32 68; uint32_t java_map_index (0x44)
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 33554504, ; uint32_t type_token_id (0x2000048)
		i32 35; uint32_t java_map_index (0x23)
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 33554505, ; uint32_t type_token_id (0x2000049)
		i32 347; uint32_t java_map_index (0x15b)
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 33554506, ; uint32_t type_token_id (0x200004a)
		i32 240; uint32_t java_map_index (0xf0)
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 33554509, ; uint32_t type_token_id (0x200004d)
		i32 16; uint32_t java_map_index (0x10)
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 33554510, ; uint32_t type_token_id (0x200004e)
		i32 318; uint32_t java_map_index (0x13e)
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 33554511, ; uint32_t type_token_id (0x200004f)
		i32 65; uint32_t java_map_index (0x41)
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 33554514, ; uint32_t type_token_id (0x2000052)
		i32 263; uint32_t java_map_index (0x107)
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 33554515, ; uint32_t type_token_id (0x2000053)
		i32 13; uint32_t java_map_index (0xd)
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 33554516, ; uint32_t type_token_id (0x2000054)
		i32 78; uint32_t java_map_index (0x4e)
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 33554519, ; uint32_t type_token_id (0x2000057)
		i32 88; uint32_t java_map_index (0x58)
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 33554520, ; uint32_t type_token_id (0x2000058)
		i32 146; uint32_t java_map_index (0x92)
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 33554521, ; uint32_t type_token_id (0x2000059)
		i32 167; uint32_t java_map_index (0xa7)
	}, ; 54
	%struct.TypeMapModuleEntry {
		i32 33554522, ; uint32_t type_token_id (0x200005a)
		i32 350; uint32_t java_map_index (0x15e)
	}, ; 55
	%struct.TypeMapModuleEntry {
		i32 33554524, ; uint32_t type_token_id (0x200005c)
		i32 380; uint32_t java_map_index (0x17c)
	}, ; 56
	%struct.TypeMapModuleEntry {
		i32 33554525, ; uint32_t type_token_id (0x200005d)
		i32 272; uint32_t java_map_index (0x110)
	}, ; 57
	%struct.TypeMapModuleEntry {
		i32 33554526, ; uint32_t type_token_id (0x200005e)
		i32 496; uint32_t java_map_index (0x1f0)
	}, ; 58
	%struct.TypeMapModuleEntry {
		i32 33554528, ; uint32_t type_token_id (0x2000060)
		i32 291; uint32_t java_map_index (0x123)
	} ; 59
], align 4

@module0_managed_to_java_duplicates = internal dso_local constant [11 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554477, ; uint32_t type_token_id (0x200002d)
		i32 494; uint32_t java_map_index (0x1ee)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554482, ; uint32_t type_token_id (0x2000032)
		i32 403; uint32_t java_map_index (0x193)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554487, ; uint32_t type_token_id (0x2000037)
		i32 254; uint32_t java_map_index (0xfe)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554492, ; uint32_t type_token_id (0x200003c)
		i32 70; uint32_t java_map_index (0x46)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554497, ; uint32_t type_token_id (0x2000041)
		i32 136; uint32_t java_map_index (0x88)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554502, ; uint32_t type_token_id (0x2000046)
		i32 69; uint32_t java_map_index (0x45)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554507, ; uint32_t type_token_id (0x200004b)
		i32 347; uint32_t java_map_index (0x15b)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554512, ; uint32_t type_token_id (0x2000050)
		i32 318; uint32_t java_map_index (0x13e)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554517, ; uint32_t type_token_id (0x2000055)
		i32 13; uint32_t java_map_index (0xd)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554523, ; uint32_t type_token_id (0x200005b)
		i32 167; uint32_t java_map_index (0xa7)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554527, ; uint32_t type_token_id (0x200005f)
		i32 380; uint32_t java_map_index (0x17c)
	} ; 10
], align 4

@module1_managed_to_java = internal dso_local constant [5 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554442, ; uint32_t type_token_id (0x200000a)
		i32 365; uint32_t java_map_index (0x16d)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554443, ; uint32_t type_token_id (0x200000b)
		i32 302; uint32_t java_map_index (0x12e)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554445, ; uint32_t type_token_id (0x200000d)
		i32 487; uint32_t java_map_index (0x1e7)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554448, ; uint32_t type_token_id (0x2000010)
		i32 105; uint32_t java_map_index (0x69)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554450, ; uint32_t type_token_id (0x2000012)
		i32 182; uint32_t java_map_index (0xb6)
	} ; 4
], align 4

@module1_managed_to_java_duplicates = internal dso_local constant [4 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554444, ; uint32_t type_token_id (0x200000c)
		i32 302; uint32_t java_map_index (0x12e)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554446, ; uint32_t type_token_id (0x200000e)
		i32 487; uint32_t java_map_index (0x1e7)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554449, ; uint32_t type_token_id (0x2000011)
		i32 105; uint32_t java_map_index (0x69)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554451, ; uint32_t type_token_id (0x2000013)
		i32 182; uint32_t java_map_index (0xb6)
	} ; 3
], align 4

@module2_managed_to_java = internal dso_local constant [374 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554569, ; uint32_t type_token_id (0x2000089)
		i32 293; uint32_t java_map_index (0x125)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554571, ; uint32_t type_token_id (0x200008b)
		i32 320; uint32_t java_map_index (0x140)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554573, ; uint32_t type_token_id (0x200008d)
		i32 459; uint32_t java_map_index (0x1cb)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554574, ; uint32_t type_token_id (0x200008e)
		i32 469; uint32_t java_map_index (0x1d5)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554575, ; uint32_t type_token_id (0x200008f)
		i32 159; uint32_t java_map_index (0x9f)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554577, ; uint32_t type_token_id (0x2000091)
		i32 28; uint32_t java_map_index (0x1c)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554579, ; uint32_t type_token_id (0x2000093)
		i32 195; uint32_t java_map_index (0xc3)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554580, ; uint32_t type_token_id (0x2000094)
		i32 415; uint32_t java_map_index (0x19f)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554581, ; uint32_t type_token_id (0x2000095)
		i32 456; uint32_t java_map_index (0x1c8)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554583, ; uint32_t type_token_id (0x2000097)
		i32 422; uint32_t java_map_index (0x1a6)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554585, ; uint32_t type_token_id (0x2000099)
		i32 346; uint32_t java_map_index (0x15a)
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 33554587, ; uint32_t type_token_id (0x200009b)
		i32 178; uint32_t java_map_index (0xb2)
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 33554589, ; uint32_t type_token_id (0x200009d)
		i32 410; uint32_t java_map_index (0x19a)
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 33554591, ; uint32_t type_token_id (0x200009f)
		i32 17; uint32_t java_map_index (0x11)
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 33554593, ; uint32_t type_token_id (0x20000a1)
		i32 110; uint32_t java_map_index (0x6e)
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 33554595, ; uint32_t type_token_id (0x20000a3)
		i32 141; uint32_t java_map_index (0x8d)
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 33554596, ; uint32_t type_token_id (0x20000a4)
		i32 171; uint32_t java_map_index (0xab)
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 33554597, ; uint32_t type_token_id (0x20000a5)
		i32 482; uint32_t java_map_index (0x1e2)
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 33554599, ; uint32_t type_token_id (0x20000a7)
		i32 507; uint32_t java_map_index (0x1fb)
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 33554600, ; uint32_t type_token_id (0x20000a8)
		i32 364; uint32_t java_map_index (0x16c)
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 33554601, ; uint32_t type_token_id (0x20000a9)
		i32 41; uint32_t java_map_index (0x29)
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 33554602, ; uint32_t type_token_id (0x20000aa)
		i32 225; uint32_t java_map_index (0xe1)
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 33554603, ; uint32_t type_token_id (0x20000ab)
		i32 191; uint32_t java_map_index (0xbf)
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 33554604, ; uint32_t type_token_id (0x20000ac)
		i32 355; uint32_t java_map_index (0x163)
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 33554606, ; uint32_t type_token_id (0x20000ae)
		i32 160; uint32_t java_map_index (0xa0)
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 33554609, ; uint32_t type_token_id (0x20000b1)
		i32 337; uint32_t java_map_index (0x151)
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 33554610, ; uint32_t type_token_id (0x20000b2)
		i32 20; uint32_t java_map_index (0x14)
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 33554612, ; uint32_t type_token_id (0x20000b4)
		i32 447; uint32_t java_map_index (0x1bf)
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 33554615, ; uint32_t type_token_id (0x20000b7)
		i32 59; uint32_t java_map_index (0x3b)
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 33554617, ; uint32_t type_token_id (0x20000b9)
		i32 270; uint32_t java_map_index (0x10e)
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 33554618, ; uint32_t type_token_id (0x20000ba)
		i32 266; uint32_t java_map_index (0x10a)
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 33554621, ; uint32_t type_token_id (0x20000bd)
		i32 503; uint32_t java_map_index (0x1f7)
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 33554622, ; uint32_t type_token_id (0x20000be)
		i32 258; uint32_t java_map_index (0x102)
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 33554626, ; uint32_t type_token_id (0x20000c2)
		i32 90; uint32_t java_map_index (0x5a)
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 33554633, ; uint32_t type_token_id (0x20000c9)
		i32 419; uint32_t java_map_index (0x1a3)
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 33554634, ; uint32_t type_token_id (0x20000ca)
		i32 338; uint32_t java_map_index (0x152)
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 33554636, ; uint32_t type_token_id (0x20000cc)
		i32 201; uint32_t java_map_index (0xc9)
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 33554637, ; uint32_t type_token_id (0x20000cd)
		i32 228; uint32_t java_map_index (0xe4)
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 33554638, ; uint32_t type_token_id (0x20000ce)
		i32 526; uint32_t java_map_index (0x20e)
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 33554641, ; uint32_t type_token_id (0x20000d1)
		i32 290; uint32_t java_map_index (0x122)
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 33554646, ; uint32_t type_token_id (0x20000d6)
		i32 127; uint32_t java_map_index (0x7f)
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 33554647, ; uint32_t type_token_id (0x20000d7)
		i32 348; uint32_t java_map_index (0x15c)
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 33554649, ; uint32_t type_token_id (0x20000d9)
		i32 3; uint32_t java_map_index (0x3)
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 33554651, ; uint32_t type_token_id (0x20000db)
		i32 276; uint32_t java_map_index (0x114)
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 33554653, ; uint32_t type_token_id (0x20000dd)
		i32 252; uint32_t java_map_index (0xfc)
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 33554654, ; uint32_t type_token_id (0x20000de)
		i32 189; uint32_t java_map_index (0xbd)
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 33554655, ; uint32_t type_token_id (0x20000df)
		i32 379; uint32_t java_map_index (0x17b)
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 33554656, ; uint32_t type_token_id (0x20000e0)
		i32 190; uint32_t java_map_index (0xbe)
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 33554657, ; uint32_t type_token_id (0x20000e1)
		i32 107; uint32_t java_map_index (0x6b)
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 33554658, ; uint32_t type_token_id (0x20000e2)
		i32 384; uint32_t java_map_index (0x180)
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 33554659, ; uint32_t type_token_id (0x20000e3)
		i32 308; uint32_t java_map_index (0x134)
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 33554660, ; uint32_t type_token_id (0x20000e4)
		i32 351; uint32_t java_map_index (0x15f)
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 33554661, ; uint32_t type_token_id (0x20000e5)
		i32 480; uint32_t java_map_index (0x1e0)
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 33554662, ; uint32_t type_token_id (0x20000e6)
		i32 33; uint32_t java_map_index (0x21)
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 33554663, ; uint32_t type_token_id (0x20000e7)
		i32 330; uint32_t java_map_index (0x14a)
	}, ; 54
	%struct.TypeMapModuleEntry {
		i32 33554668, ; uint32_t type_token_id (0x20000ec)
		i32 491; uint32_t java_map_index (0x1eb)
	}, ; 55
	%struct.TypeMapModuleEntry {
		i32 33554669, ; uint32_t type_token_id (0x20000ed)
		i32 316; uint32_t java_map_index (0x13c)
	}, ; 56
	%struct.TypeMapModuleEntry {
		i32 33554670, ; uint32_t type_token_id (0x20000ee)
		i32 14; uint32_t java_map_index (0xe)
	}, ; 57
	%struct.TypeMapModuleEntry {
		i32 33554671, ; uint32_t type_token_id (0x20000ef)
		i32 377; uint32_t java_map_index (0x179)
	}, ; 58
	%struct.TypeMapModuleEntry {
		i32 33554673, ; uint32_t type_token_id (0x20000f1)
		i32 352; uint32_t java_map_index (0x160)
	}, ; 59
	%struct.TypeMapModuleEntry {
		i32 33554674, ; uint32_t type_token_id (0x20000f2)
		i32 12; uint32_t java_map_index (0xc)
	}, ; 60
	%struct.TypeMapModuleEntry {
		i32 33554675, ; uint32_t type_token_id (0x20000f3)
		i32 441; uint32_t java_map_index (0x1b9)
	}, ; 61
	%struct.TypeMapModuleEntry {
		i32 33554676, ; uint32_t type_token_id (0x20000f4)
		i32 505; uint32_t java_map_index (0x1f9)
	}, ; 62
	%struct.TypeMapModuleEntry {
		i32 33554678, ; uint32_t type_token_id (0x20000f6)
		i32 470; uint32_t java_map_index (0x1d6)
	}, ; 63
	%struct.TypeMapModuleEntry {
		i32 33554679, ; uint32_t type_token_id (0x20000f7)
		i32 417; uint32_t java_map_index (0x1a1)
	}, ; 64
	%struct.TypeMapModuleEntry {
		i32 33554682, ; uint32_t type_token_id (0x20000fa)
		i32 19; uint32_t java_map_index (0x13)
	}, ; 65
	%struct.TypeMapModuleEntry {
		i32 33554685, ; uint32_t type_token_id (0x20000fd)
		i32 473; uint32_t java_map_index (0x1d9)
	}, ; 66
	%struct.TypeMapModuleEntry {
		i32 33554687, ; uint32_t type_token_id (0x20000ff)
		i32 455; uint32_t java_map_index (0x1c7)
	}, ; 67
	%struct.TypeMapModuleEntry {
		i32 33554689, ; uint32_t type_token_id (0x2000101)
		i32 357; uint32_t java_map_index (0x165)
	}, ; 68
	%struct.TypeMapModuleEntry {
		i32 33554692, ; uint32_t type_token_id (0x2000104)
		i32 244; uint32_t java_map_index (0xf4)
	}, ; 69
	%struct.TypeMapModuleEntry {
		i32 33554695, ; uint32_t type_token_id (0x2000107)
		i32 509; uint32_t java_map_index (0x1fd)
	}, ; 70
	%struct.TypeMapModuleEntry {
		i32 33554702, ; uint32_t type_token_id (0x200010e)
		i32 251; uint32_t java_map_index (0xfb)
	}, ; 71
	%struct.TypeMapModuleEntry {
		i32 33554703, ; uint32_t type_token_id (0x200010f)
		i32 83; uint32_t java_map_index (0x53)
	}, ; 72
	%struct.TypeMapModuleEntry {
		i32 33554704, ; uint32_t type_token_id (0x2000110)
		i32 395; uint32_t java_map_index (0x18b)
	}, ; 73
	%struct.TypeMapModuleEntry {
		i32 33554705, ; uint32_t type_token_id (0x2000111)
		i32 326; uint32_t java_map_index (0x146)
	}, ; 74
	%struct.TypeMapModuleEntry {
		i32 33554707, ; uint32_t type_token_id (0x2000113)
		i32 299; uint32_t java_map_index (0x12b)
	}, ; 75
	%struct.TypeMapModuleEntry {
		i32 33554712, ; uint32_t type_token_id (0x2000118)
		i32 442; uint32_t java_map_index (0x1ba)
	}, ; 76
	%struct.TypeMapModuleEntry {
		i32 33554713, ; uint32_t type_token_id (0x2000119)
		i32 425; uint32_t java_map_index (0x1a9)
	}, ; 77
	%struct.TypeMapModuleEntry {
		i32 33554714, ; uint32_t type_token_id (0x200011a)
		i32 483; uint32_t java_map_index (0x1e3)
	}, ; 78
	%struct.TypeMapModuleEntry {
		i32 33554715, ; uint32_t type_token_id (0x200011b)
		i32 360; uint32_t java_map_index (0x168)
	}, ; 79
	%struct.TypeMapModuleEntry {
		i32 33554717, ; uint32_t type_token_id (0x200011d)
		i32 79; uint32_t java_map_index (0x4f)
	}, ; 80
	%struct.TypeMapModuleEntry {
		i32 33554718, ; uint32_t type_token_id (0x200011e)
		i32 102; uint32_t java_map_index (0x66)
	}, ; 81
	%struct.TypeMapModuleEntry {
		i32 33554719, ; uint32_t type_token_id (0x200011f)
		i32 200; uint32_t java_map_index (0xc8)
	}, ; 82
	%struct.TypeMapModuleEntry {
		i32 33554720, ; uint32_t type_token_id (0x2000120)
		i32 8; uint32_t java_map_index (0x8)
	}, ; 83
	%struct.TypeMapModuleEntry {
		i32 33554721, ; uint32_t type_token_id (0x2000121)
		i32 340; uint32_t java_map_index (0x154)
	}, ; 84
	%struct.TypeMapModuleEntry {
		i32 33554722, ; uint32_t type_token_id (0x2000122)
		i32 390; uint32_t java_map_index (0x186)
	}, ; 85
	%struct.TypeMapModuleEntry {
		i32 33554723, ; uint32_t type_token_id (0x2000123)
		i32 60; uint32_t java_map_index (0x3c)
	}, ; 86
	%struct.TypeMapModuleEntry {
		i32 33554724, ; uint32_t type_token_id (0x2000124)
		i32 26; uint32_t java_map_index (0x1a)
	}, ; 87
	%struct.TypeMapModuleEntry {
		i32 33554725, ; uint32_t type_token_id (0x2000125)
		i32 205; uint32_t java_map_index (0xcd)
	}, ; 88
	%struct.TypeMapModuleEntry {
		i32 33554726, ; uint32_t type_token_id (0x2000126)
		i32 202; uint32_t java_map_index (0xca)
	}, ; 89
	%struct.TypeMapModuleEntry {
		i32 33554727, ; uint32_t type_token_id (0x2000127)
		i32 104; uint32_t java_map_index (0x68)
	}, ; 90
	%struct.TypeMapModuleEntry {
		i32 33554728, ; uint32_t type_token_id (0x2000128)
		i32 111; uint32_t java_map_index (0x6f)
	}, ; 91
	%struct.TypeMapModuleEntry {
		i32 33554729, ; uint32_t type_token_id (0x2000129)
		i32 294; uint32_t java_map_index (0x126)
	}, ; 92
	%struct.TypeMapModuleEntry {
		i32 33554730, ; uint32_t type_token_id (0x200012a)
		i32 242; uint32_t java_map_index (0xf2)
	}, ; 93
	%struct.TypeMapModuleEntry {
		i32 33554731, ; uint32_t type_token_id (0x200012b)
		i32 439; uint32_t java_map_index (0x1b7)
	}, ; 94
	%struct.TypeMapModuleEntry {
		i32 33554732, ; uint32_t type_token_id (0x200012c)
		i32 7; uint32_t java_map_index (0x7)
	}, ; 95
	%struct.TypeMapModuleEntry {
		i32 33554733, ; uint32_t type_token_id (0x200012d)
		i32 143; uint32_t java_map_index (0x8f)
	}, ; 96
	%struct.TypeMapModuleEntry {
		i32 33554734, ; uint32_t type_token_id (0x200012e)
		i32 0; uint32_t java_map_index (0x0)
	}, ; 97
	%struct.TypeMapModuleEntry {
		i32 33554735, ; uint32_t type_token_id (0x200012f)
		i32 156; uint32_t java_map_index (0x9c)
	}, ; 98
	%struct.TypeMapModuleEntry {
		i32 33554736, ; uint32_t type_token_id (0x2000130)
		i32 504; uint32_t java_map_index (0x1f8)
	}, ; 99
	%struct.TypeMapModuleEntry {
		i32 33554737, ; uint32_t type_token_id (0x2000131)
		i32 407; uint32_t java_map_index (0x197)
	}, ; 100
	%struct.TypeMapModuleEntry {
		i32 33554739, ; uint32_t type_token_id (0x2000133)
		i32 391; uint32_t java_map_index (0x187)
	}, ; 101
	%struct.TypeMapModuleEntry {
		i32 33554740, ; uint32_t type_token_id (0x2000134)
		i32 236; uint32_t java_map_index (0xec)
	}, ; 102
	%struct.TypeMapModuleEntry {
		i32 33554741, ; uint32_t type_token_id (0x2000135)
		i32 168; uint32_t java_map_index (0xa8)
	}, ; 103
	%struct.TypeMapModuleEntry {
		i32 33554742, ; uint32_t type_token_id (0x2000136)
		i32 361; uint32_t java_map_index (0x169)
	}, ; 104
	%struct.TypeMapModuleEntry {
		i32 33554743, ; uint32_t type_token_id (0x2000137)
		i32 454; uint32_t java_map_index (0x1c6)
	}, ; 105
	%struct.TypeMapModuleEntry {
		i32 33554744, ; uint32_t type_token_id (0x2000138)
		i32 76; uint32_t java_map_index (0x4c)
	}, ; 106
	%struct.TypeMapModuleEntry {
		i32 33554745, ; uint32_t type_token_id (0x2000139)
		i32 321; uint32_t java_map_index (0x141)
	}, ; 107
	%struct.TypeMapModuleEntry {
		i32 33554746, ; uint32_t type_token_id (0x200013a)
		i32 281; uint32_t java_map_index (0x119)
	}, ; 108
	%struct.TypeMapModuleEntry {
		i32 33554747, ; uint32_t type_token_id (0x200013b)
		i32 212; uint32_t java_map_index (0xd4)
	}, ; 109
	%struct.TypeMapModuleEntry {
		i32 33554748, ; uint32_t type_token_id (0x200013c)
		i32 100; uint32_t java_map_index (0x64)
	}, ; 110
	%struct.TypeMapModuleEntry {
		i32 33554750, ; uint32_t type_token_id (0x200013e)
		i32 398; uint32_t java_map_index (0x18e)
	}, ; 111
	%struct.TypeMapModuleEntry {
		i32 33554752, ; uint32_t type_token_id (0x2000140)
		i32 233; uint32_t java_map_index (0xe9)
	}, ; 112
	%struct.TypeMapModuleEntry {
		i32 33554754, ; uint32_t type_token_id (0x2000142)
		i32 273; uint32_t java_map_index (0x111)
	}, ; 113
	%struct.TypeMapModuleEntry {
		i32 33554756, ; uint32_t type_token_id (0x2000144)
		i32 515; uint32_t java_map_index (0x203)
	}, ; 114
	%struct.TypeMapModuleEntry {
		i32 33554758, ; uint32_t type_token_id (0x2000146)
		i32 400; uint32_t java_map_index (0x190)
	}, ; 115
	%struct.TypeMapModuleEntry {
		i32 33554759, ; uint32_t type_token_id (0x2000147)
		i32 502; uint32_t java_map_index (0x1f6)
	}, ; 116
	%struct.TypeMapModuleEntry {
		i32 33554760, ; uint32_t type_token_id (0x2000148)
		i32 63; uint32_t java_map_index (0x3f)
	}, ; 117
	%struct.TypeMapModuleEntry {
		i32 33554761, ; uint32_t type_token_id (0x2000149)
		i32 416; uint32_t java_map_index (0x1a0)
	}, ; 118
	%struct.TypeMapModuleEntry {
		i32 33554762, ; uint32_t type_token_id (0x200014a)
		i32 256; uint32_t java_map_index (0x100)
	}, ; 119
	%struct.TypeMapModuleEntry {
		i32 33554763, ; uint32_t type_token_id (0x200014b)
		i32 319; uint32_t java_map_index (0x13f)
	}, ; 120
	%struct.TypeMapModuleEntry {
		i32 33554764, ; uint32_t type_token_id (0x200014c)
		i32 232; uint32_t java_map_index (0xe8)
	}, ; 121
	%struct.TypeMapModuleEntry {
		i32 33554765, ; uint32_t type_token_id (0x200014d)
		i32 514; uint32_t java_map_index (0x202)
	}, ; 122
	%struct.TypeMapModuleEntry {
		i32 33554767, ; uint32_t type_token_id (0x200014f)
		i32 161; uint32_t java_map_index (0xa1)
	}, ; 123
	%struct.TypeMapModuleEntry {
		i32 33554772, ; uint32_t type_token_id (0x2000154)
		i32 305; uint32_t java_map_index (0x131)
	}, ; 124
	%struct.TypeMapModuleEntry {
		i32 33554773, ; uint32_t type_token_id (0x2000155)
		i32 247; uint32_t java_map_index (0xf7)
	}, ; 125
	%struct.TypeMapModuleEntry {
		i32 33554774, ; uint32_t type_token_id (0x2000156)
		i32 214; uint32_t java_map_index (0xd6)
	}, ; 126
	%struct.TypeMapModuleEntry {
		i32 33554775, ; uint32_t type_token_id (0x2000157)
		i32 154; uint32_t java_map_index (0x9a)
	}, ; 127
	%struct.TypeMapModuleEntry {
		i32 33554776, ; uint32_t type_token_id (0x2000158)
		i32 475; uint32_t java_map_index (0x1db)
	}, ; 128
	%struct.TypeMapModuleEntry {
		i32 33554777, ; uint32_t type_token_id (0x2000159)
		i32 157; uint32_t java_map_index (0x9d)
	}, ; 129
	%struct.TypeMapModuleEntry {
		i32 33554778, ; uint32_t type_token_id (0x200015a)
		i32 164; uint32_t java_map_index (0xa4)
	}, ; 130
	%struct.TypeMapModuleEntry {
		i32 33554779, ; uint32_t type_token_id (0x200015b)
		i32 196; uint32_t java_map_index (0xc4)
	}, ; 131
	%struct.TypeMapModuleEntry {
		i32 33554780, ; uint32_t type_token_id (0x200015c)
		i32 463; uint32_t java_map_index (0x1cf)
	}, ; 132
	%struct.TypeMapModuleEntry {
		i32 33554781, ; uint32_t type_token_id (0x200015d)
		i32 392; uint32_t java_map_index (0x188)
	}, ; 133
	%struct.TypeMapModuleEntry {
		i32 33554786, ; uint32_t type_token_id (0x2000162)
		i32 151; uint32_t java_map_index (0x97)
	}, ; 134
	%struct.TypeMapModuleEntry {
		i32 33554787, ; uint32_t type_token_id (0x2000163)
		i32 238; uint32_t java_map_index (0xee)
	}, ; 135
	%struct.TypeMapModuleEntry {
		i32 33554788, ; uint32_t type_token_id (0x2000164)
		i32 253; uint32_t java_map_index (0xfd)
	}, ; 136
	%struct.TypeMapModuleEntry {
		i32 33554789, ; uint32_t type_token_id (0x2000165)
		i32 280; uint32_t java_map_index (0x118)
	}, ; 137
	%struct.TypeMapModuleEntry {
		i32 33554792, ; uint32_t type_token_id (0x2000168)
		i32 408; uint32_t java_map_index (0x198)
	}, ; 138
	%struct.TypeMapModuleEntry {
		i32 33554794, ; uint32_t type_token_id (0x200016a)
		i32 124; uint32_t java_map_index (0x7c)
	}, ; 139
	%struct.TypeMapModuleEntry {
		i32 33554795, ; uint32_t type_token_id (0x200016b)
		i32 523; uint32_t java_map_index (0x20b)
	}, ; 140
	%struct.TypeMapModuleEntry {
		i32 33554799, ; uint32_t type_token_id (0x200016f)
		i32 222; uint32_t java_map_index (0xde)
	}, ; 141
	%struct.TypeMapModuleEntry {
		i32 33554800, ; uint32_t type_token_id (0x2000170)
		i32 396; uint32_t java_map_index (0x18c)
	}, ; 142
	%struct.TypeMapModuleEntry {
		i32 33554801, ; uint32_t type_token_id (0x2000171)
		i32 519; uint32_t java_map_index (0x207)
	}, ; 143
	%struct.TypeMapModuleEntry {
		i32 33554803, ; uint32_t type_token_id (0x2000173)
		i32 139; uint32_t java_map_index (0x8b)
	}, ; 144
	%struct.TypeMapModuleEntry {
		i32 33554804, ; uint32_t type_token_id (0x2000174)
		i32 522; uint32_t java_map_index (0x20a)
	}, ; 145
	%struct.TypeMapModuleEntry {
		i32 33554805, ; uint32_t type_token_id (0x2000175)
		i32 142; uint32_t java_map_index (0x8e)
	}, ; 146
	%struct.TypeMapModuleEntry {
		i32 33554810, ; uint32_t type_token_id (0x200017a)
		i32 288; uint32_t java_map_index (0x120)
	}, ; 147
	%struct.TypeMapModuleEntry {
		i32 33554811, ; uint32_t type_token_id (0x200017b)
		i32 394; uint32_t java_map_index (0x18a)
	}, ; 148
	%struct.TypeMapModuleEntry {
		i32 33554812, ; uint32_t type_token_id (0x200017c)
		i32 74; uint32_t java_map_index (0x4a)
	}, ; 149
	%struct.TypeMapModuleEntry {
		i32 33554813, ; uint32_t type_token_id (0x200017d)
		i32 86; uint32_t java_map_index (0x56)
	}, ; 150
	%struct.TypeMapModuleEntry {
		i32 33554814, ; uint32_t type_token_id (0x200017e)
		i32 39; uint32_t java_map_index (0x27)
	}, ; 151
	%struct.TypeMapModuleEntry {
		i32 33554816, ; uint32_t type_token_id (0x2000180)
		i32 275; uint32_t java_map_index (0x113)
	}, ; 152
	%struct.TypeMapModuleEntry {
		i32 33554817, ; uint32_t type_token_id (0x2000181)
		i32 137; uint32_t java_map_index (0x89)
	}, ; 153
	%struct.TypeMapModuleEntry {
		i32 33554819, ; uint32_t type_token_id (0x2000183)
		i32 130; uint32_t java_map_index (0x82)
	}, ; 154
	%struct.TypeMapModuleEntry {
		i32 33554821, ; uint32_t type_token_id (0x2000185)
		i32 117; uint32_t java_map_index (0x75)
	}, ; 155
	%struct.TypeMapModuleEntry {
		i32 33554824, ; uint32_t type_token_id (0x2000188)
		i32 260; uint32_t java_map_index (0x104)
	}, ; 156
	%struct.TypeMapModuleEntry {
		i32 33554825, ; uint32_t type_token_id (0x2000189)
		i32 75; uint32_t java_map_index (0x4b)
	}, ; 157
	%struct.TypeMapModuleEntry {
		i32 33554826, ; uint32_t type_token_id (0x200018a)
		i32 45; uint32_t java_map_index (0x2d)
	}, ; 158
	%struct.TypeMapModuleEntry {
		i32 33554827, ; uint32_t type_token_id (0x200018b)
		i32 424; uint32_t java_map_index (0x1a8)
	}, ; 159
	%struct.TypeMapModuleEntry {
		i32 33554830, ; uint32_t type_token_id (0x200018e)
		i32 174; uint32_t java_map_index (0xae)
	}, ; 160
	%struct.TypeMapModuleEntry {
		i32 33554832, ; uint32_t type_token_id (0x2000190)
		i32 264; uint32_t java_map_index (0x108)
	}, ; 161
	%struct.TypeMapModuleEntry {
		i32 33554833, ; uint32_t type_token_id (0x2000191)
		i32 210; uint32_t java_map_index (0xd2)
	}, ; 162
	%struct.TypeMapModuleEntry {
		i32 33554834, ; uint32_t type_token_id (0x2000192)
		i32 277; uint32_t java_map_index (0x115)
	}, ; 163
	%struct.TypeMapModuleEntry {
		i32 33554835, ; uint32_t type_token_id (0x2000193)
		i32 298; uint32_t java_map_index (0x12a)
	}, ; 164
	%struct.TypeMapModuleEntry {
		i32 33554836, ; uint32_t type_token_id (0x2000194)
		i32 234; uint32_t java_map_index (0xea)
	}, ; 165
	%struct.TypeMapModuleEntry {
		i32 33554838, ; uint32_t type_token_id (0x2000196)
		i32 493; uint32_t java_map_index (0x1ed)
	}, ; 166
	%struct.TypeMapModuleEntry {
		i32 33554839, ; uint32_t type_token_id (0x2000197)
		i32 313; uint32_t java_map_index (0x139)
	}, ; 167
	%struct.TypeMapModuleEntry {
		i32 33554840, ; uint32_t type_token_id (0x2000198)
		i32 91; uint32_t java_map_index (0x5b)
	}, ; 168
	%struct.TypeMapModuleEntry {
		i32 33554842, ; uint32_t type_token_id (0x200019a)
		i32 57; uint32_t java_map_index (0x39)
	}, ; 169
	%struct.TypeMapModuleEntry {
		i32 33554848, ; uint32_t type_token_id (0x20001a0)
		i32 208; uint32_t java_map_index (0xd0)
	}, ; 170
	%struct.TypeMapModuleEntry {
		i32 33554849, ; uint32_t type_token_id (0x20001a1)
		i32 452; uint32_t java_map_index (0x1c4)
	}, ; 171
	%struct.TypeMapModuleEntry {
		i32 33554851, ; uint32_t type_token_id (0x20001a3)
		i32 269; uint32_t java_map_index (0x10d)
	}, ; 172
	%struct.TypeMapModuleEntry {
		i32 33554852, ; uint32_t type_token_id (0x20001a4)
		i32 211; uint32_t java_map_index (0xd3)
	}, ; 173
	%struct.TypeMapModuleEntry {
		i32 33554853, ; uint32_t type_token_id (0x20001a5)
		i32 363; uint32_t java_map_index (0x16b)
	}, ; 174
	%struct.TypeMapModuleEntry {
		i32 33554854, ; uint32_t type_token_id (0x20001a6)
		i32 328; uint32_t java_map_index (0x148)
	}, ; 175
	%struct.TypeMapModuleEntry {
		i32 33554856, ; uint32_t type_token_id (0x20001a8)
		i32 520; uint32_t java_map_index (0x208)
	}, ; 176
	%struct.TypeMapModuleEntry {
		i32 33554858, ; uint32_t type_token_id (0x20001aa)
		i32 38; uint32_t java_map_index (0x26)
	}, ; 177
	%struct.TypeMapModuleEntry {
		i32 33554860, ; uint32_t type_token_id (0x20001ac)
		i32 516; uint32_t java_map_index (0x204)
	}, ; 178
	%struct.TypeMapModuleEntry {
		i32 33554862, ; uint32_t type_token_id (0x20001ae)
		i32 409; uint32_t java_map_index (0x199)
	}, ; 179
	%struct.TypeMapModuleEntry {
		i32 33554864, ; uint32_t type_token_id (0x20001b0)
		i32 376; uint32_t java_map_index (0x178)
	}, ; 180
	%struct.TypeMapModuleEntry {
		i32 33554866, ; uint32_t type_token_id (0x20001b2)
		i32 152; uint32_t java_map_index (0x98)
	}, ; 181
	%struct.TypeMapModuleEntry {
		i32 33554868, ; uint32_t type_token_id (0x20001b4)
		i32 188; uint32_t java_map_index (0xbc)
	}, ; 182
	%struct.TypeMapModuleEntry {
		i32 33554870, ; uint32_t type_token_id (0x20001b6)
		i32 401; uint32_t java_map_index (0x191)
	}, ; 183
	%struct.TypeMapModuleEntry {
		i32 33554872, ; uint32_t type_token_id (0x20001b8)
		i32 18; uint32_t java_map_index (0x12)
	}, ; 184
	%struct.TypeMapModuleEntry {
		i32 33554873, ; uint32_t type_token_id (0x20001b9)
		i32 448; uint32_t java_map_index (0x1c0)
	}, ; 185
	%struct.TypeMapModuleEntry {
		i32 33554875, ; uint32_t type_token_id (0x20001bb)
		i32 230; uint32_t java_map_index (0xe6)
	}, ; 186
	%struct.TypeMapModuleEntry {
		i32 33554876, ; uint32_t type_token_id (0x20001bc)
		i32 22; uint32_t java_map_index (0x16)
	}, ; 187
	%struct.TypeMapModuleEntry {
		i32 33554878, ; uint32_t type_token_id (0x20001be)
		i32 220; uint32_t java_map_index (0xdc)
	}, ; 188
	%struct.TypeMapModuleEntry {
		i32 33554879, ; uint32_t type_token_id (0x20001bf)
		i32 245; uint32_t java_map_index (0xf5)
	}, ; 189
	%struct.TypeMapModuleEntry {
		i32 33554881, ; uint32_t type_token_id (0x20001c1)
		i32 498; uint32_t java_map_index (0x1f2)
	}, ; 190
	%struct.TypeMapModuleEntry {
		i32 33554882, ; uint32_t type_token_id (0x20001c2)
		i32 331; uint32_t java_map_index (0x14b)
	}, ; 191
	%struct.TypeMapModuleEntry {
		i32 33554886, ; uint32_t type_token_id (0x20001c6)
		i32 323; uint32_t java_map_index (0x143)
	}, ; 192
	%struct.TypeMapModuleEntry {
		i32 33554892, ; uint32_t type_token_id (0x20001cc)
		i32 10; uint32_t java_map_index (0xa)
	}, ; 193
	%struct.TypeMapModuleEntry {
		i32 33554893, ; uint32_t type_token_id (0x20001cd)
		i32 43; uint32_t java_map_index (0x2b)
	}, ; 194
	%struct.TypeMapModuleEntry {
		i32 33554894, ; uint32_t type_token_id (0x20001ce)
		i32 61; uint32_t java_map_index (0x3d)
	}, ; 195
	%struct.TypeMapModuleEntry {
		i32 33554896, ; uint32_t type_token_id (0x20001d0)
		i32 461; uint32_t java_map_index (0x1cd)
	}, ; 196
	%struct.TypeMapModuleEntry {
		i32 33554898, ; uint32_t type_token_id (0x20001d2)
		i32 128; uint32_t java_map_index (0x80)
	}, ; 197
	%struct.TypeMapModuleEntry {
		i32 33554930, ; uint32_t type_token_id (0x20001f2)
		i32 481; uint32_t java_map_index (0x1e1)
	}, ; 198
	%struct.TypeMapModuleEntry {
		i32 33554932, ; uint32_t type_token_id (0x20001f4)
		i32 382; uint32_t java_map_index (0x17e)
	}, ; 199
	%struct.TypeMapModuleEntry {
		i32 33554934, ; uint32_t type_token_id (0x20001f6)
		i32 173; uint32_t java_map_index (0xad)
	}, ; 200
	%struct.TypeMapModuleEntry {
		i32 33554936, ; uint32_t type_token_id (0x20001f8)
		i32 194; uint32_t java_map_index (0xc2)
	}, ; 201
	%struct.TypeMapModuleEntry {
		i32 33554945, ; uint32_t type_token_id (0x2000201)
		i32 92; uint32_t java_map_index (0x5c)
	}, ; 202
	%struct.TypeMapModuleEntry {
		i32 33554947, ; uint32_t type_token_id (0x2000203)
		i32 451; uint32_t java_map_index (0x1c3)
	}, ; 203
	%struct.TypeMapModuleEntry {
		i32 33554948, ; uint32_t type_token_id (0x2000204)
		i32 445; uint32_t java_map_index (0x1bd)
	}, ; 204
	%struct.TypeMapModuleEntry {
		i32 33554949, ; uint32_t type_token_id (0x2000205)
		i32 513; uint32_t java_map_index (0x201)
	}, ; 205
	%struct.TypeMapModuleEntry {
		i32 33554962, ; uint32_t type_token_id (0x2000212)
		i32 66; uint32_t java_map_index (0x42)
	}, ; 206
	%struct.TypeMapModuleEntry {
		i32 33554975, ; uint32_t type_token_id (0x200021f)
		i32 336; uint32_t java_map_index (0x150)
	}, ; 207
	%struct.TypeMapModuleEntry {
		i32 33554976, ; uint32_t type_token_id (0x2000220)
		i32 56; uint32_t java_map_index (0x38)
	}, ; 208
	%struct.TypeMapModuleEntry {
		i32 33554977, ; uint32_t type_token_id (0x2000221)
		i32 460; uint32_t java_map_index (0x1cc)
	}, ; 209
	%struct.TypeMapModuleEntry {
		i32 33554978, ; uint32_t type_token_id (0x2000222)
		i32 512; uint32_t java_map_index (0x200)
	}, ; 210
	%struct.TypeMapModuleEntry {
		i32 33554979, ; uint32_t type_token_id (0x2000223)
		i32 109; uint32_t java_map_index (0x6d)
	}, ; 211
	%struct.TypeMapModuleEntry {
		i32 33554981, ; uint32_t type_token_id (0x2000225)
		i32 375; uint32_t java_map_index (0x177)
	}, ; 212
	%struct.TypeMapModuleEntry {
		i32 33554982, ; uint32_t type_token_id (0x2000226)
		i32 488; uint32_t java_map_index (0x1e8)
	}, ; 213
	%struct.TypeMapModuleEntry {
		i32 33554983, ; uint32_t type_token_id (0x2000227)
		i32 125; uint32_t java_map_index (0x7d)
	}, ; 214
	%struct.TypeMapModuleEntry {
		i32 33554984, ; uint32_t type_token_id (0x2000228)
		i32 219; uint32_t java_map_index (0xdb)
	}, ; 215
	%struct.TypeMapModuleEntry {
		i32 33554985, ; uint32_t type_token_id (0x2000229)
		i32 239; uint32_t java_map_index (0xef)
	}, ; 216
	%struct.TypeMapModuleEntry {
		i32 33554986, ; uint32_t type_token_id (0x200022a)
		i32 121; uint32_t java_map_index (0x79)
	}, ; 217
	%struct.TypeMapModuleEntry {
		i32 33554987, ; uint32_t type_token_id (0x200022b)
		i32 524; uint32_t java_map_index (0x20c)
	}, ; 218
	%struct.TypeMapModuleEntry {
		i32 33554988, ; uint32_t type_token_id (0x200022c)
		i32 177; uint32_t java_map_index (0xb1)
	}, ; 219
	%struct.TypeMapModuleEntry {
		i32 33554989, ; uint32_t type_token_id (0x200022d)
		i32 477; uint32_t java_map_index (0x1dd)
	}, ; 220
	%struct.TypeMapModuleEntry {
		i32 33554990, ; uint32_t type_token_id (0x200022e)
		i32 187; uint32_t java_map_index (0xbb)
	}, ; 221
	%struct.TypeMapModuleEntry {
		i32 33554991, ; uint32_t type_token_id (0x200022f)
		i32 420; uint32_t java_map_index (0x1a4)
	}, ; 222
	%struct.TypeMapModuleEntry {
		i32 33554994, ; uint32_t type_token_id (0x2000232)
		i32 354; uint32_t java_map_index (0x162)
	}, ; 223
	%struct.TypeMapModuleEntry {
		i32 33554996, ; uint32_t type_token_id (0x2000234)
		i32 334; uint32_t java_map_index (0x14e)
	}, ; 224
	%struct.TypeMapModuleEntry {
		i32 33554999, ; uint32_t type_token_id (0x2000237)
		i32 444; uint32_t java_map_index (0x1bc)
	}, ; 225
	%struct.TypeMapModuleEntry {
		i32 33555000, ; uint32_t type_token_id (0x2000238)
		i32 261; uint32_t java_map_index (0x105)
	}, ; 226
	%struct.TypeMapModuleEntry {
		i32 33555002, ; uint32_t type_token_id (0x200023a)
		i32 282; uint32_t java_map_index (0x11a)
	}, ; 227
	%struct.TypeMapModuleEntry {
		i32 33555003, ; uint32_t type_token_id (0x200023b)
		i32 199; uint32_t java_map_index (0xc7)
	}, ; 228
	%struct.TypeMapModuleEntry {
		i32 33555005, ; uint32_t type_token_id (0x200023d)
		i32 237; uint32_t java_map_index (0xed)
	}, ; 229
	%struct.TypeMapModuleEntry {
		i32 33555006, ; uint32_t type_token_id (0x200023e)
		i32 231; uint32_t java_map_index (0xe7)
	}, ; 230
	%struct.TypeMapModuleEntry {
		i32 33555007, ; uint32_t type_token_id (0x200023f)
		i32 180; uint32_t java_map_index (0xb4)
	}, ; 231
	%struct.TypeMapModuleEntry {
		i32 33555008, ; uint32_t type_token_id (0x2000240)
		i32 209; uint32_t java_map_index (0xd1)
	}, ; 232
	%struct.TypeMapModuleEntry {
		i32 33555010, ; uint32_t type_token_id (0x2000242)
		i32 112; uint32_t java_map_index (0x70)
	}, ; 233
	%struct.TypeMapModuleEntry {
		i32 33555012, ; uint32_t type_token_id (0x2000244)
		i32 285; uint32_t java_map_index (0x11d)
	}, ; 234
	%struct.TypeMapModuleEntry {
		i32 33555013, ; uint32_t type_token_id (0x2000245)
		i32 495; uint32_t java_map_index (0x1ef)
	}, ; 235
	%struct.TypeMapModuleEntry {
		i32 33555015, ; uint32_t type_token_id (0x2000247)
		i32 486; uint32_t java_map_index (0x1e6)
	}, ; 236
	%struct.TypeMapModuleEntry {
		i32 33555016, ; uint32_t type_token_id (0x2000248)
		i32 373; uint32_t java_map_index (0x175)
	}, ; 237
	%struct.TypeMapModuleEntry {
		i32 33555019, ; uint32_t type_token_id (0x200024b)
		i32 476; uint32_t java_map_index (0x1dc)
	}, ; 238
	%struct.TypeMapModuleEntry {
		i32 33555020, ; uint32_t type_token_id (0x200024c)
		i32 271; uint32_t java_map_index (0x10f)
	}, ; 239
	%struct.TypeMapModuleEntry {
		i32 33555022, ; uint32_t type_token_id (0x200024e)
		i32 268; uint32_t java_map_index (0x10c)
	}, ; 240
	%struct.TypeMapModuleEntry {
		i32 33555023, ; uint32_t type_token_id (0x200024f)
		i32 300; uint32_t java_map_index (0x12c)
	}, ; 241
	%struct.TypeMapModuleEntry {
		i32 33555024, ; uint32_t type_token_id (0x2000250)
		i32 278; uint32_t java_map_index (0x116)
	}, ; 242
	%struct.TypeMapModuleEntry {
		i32 33555025, ; uint32_t type_token_id (0x2000251)
		i32 371; uint32_t java_map_index (0x173)
	}, ; 243
	%struct.TypeMapModuleEntry {
		i32 33555027, ; uint32_t type_token_id (0x2000253)
		i32 32; uint32_t java_map_index (0x20)
	}, ; 244
	%struct.TypeMapModuleEntry {
		i32 33555029, ; uint32_t type_token_id (0x2000255)
		i32 327; uint32_t java_map_index (0x147)
	}, ; 245
	%struct.TypeMapModuleEntry {
		i32 33555031, ; uint32_t type_token_id (0x2000257)
		i32 429; uint32_t java_map_index (0x1ad)
	}, ; 246
	%struct.TypeMapModuleEntry {
		i32 33555037, ; uint32_t type_token_id (0x200025d)
		i32 93; uint32_t java_map_index (0x5d)
	}, ; 247
	%struct.TypeMapModuleEntry {
		i32 33555038, ; uint32_t type_token_id (0x200025e)
		i32 108; uint32_t java_map_index (0x6c)
	}, ; 248
	%struct.TypeMapModuleEntry {
		i32 33555039, ; uint32_t type_token_id (0x200025f)
		i32 241; uint32_t java_map_index (0xf1)
	}, ; 249
	%struct.TypeMapModuleEntry {
		i32 33555040, ; uint32_t type_token_id (0x2000260)
		i32 284; uint32_t java_map_index (0x11c)
	}, ; 250
	%struct.TypeMapModuleEntry {
		i32 33555041, ; uint32_t type_token_id (0x2000261)
		i32 466; uint32_t java_map_index (0x1d2)
	}, ; 251
	%struct.TypeMapModuleEntry {
		i32 33555043, ; uint32_t type_token_id (0x2000263)
		i32 132; uint32_t java_map_index (0x84)
	}, ; 252
	%struct.TypeMapModuleEntry {
		i32 33555046, ; uint32_t type_token_id (0x2000266)
		i32 341; uint32_t java_map_index (0x155)
	}, ; 253
	%struct.TypeMapModuleEntry {
		i32 33555047, ; uint32_t type_token_id (0x2000267)
		i32 440; uint32_t java_map_index (0x1b8)
	}, ; 254
	%struct.TypeMapModuleEntry {
		i32 33555048, ; uint32_t type_token_id (0x2000268)
		i32 304; uint32_t java_map_index (0x130)
	}, ; 255
	%struct.TypeMapModuleEntry {
		i32 33555049, ; uint32_t type_token_id (0x2000269)
		i32 183; uint32_t java_map_index (0xb7)
	}, ; 256
	%struct.TypeMapModuleEntry {
		i32 33555050, ; uint32_t type_token_id (0x200026a)
		i32 257; uint32_t java_map_index (0x101)
	}, ; 257
	%struct.TypeMapModuleEntry {
		i32 33555051, ; uint32_t type_token_id (0x200026b)
		i32 213; uint32_t java_map_index (0xd5)
	}, ; 258
	%struct.TypeMapModuleEntry {
		i32 33555052, ; uint32_t type_token_id (0x200026c)
		i32 367; uint32_t java_map_index (0x16f)
	}, ; 259
	%struct.TypeMapModuleEntry {
		i32 33555053, ; uint32_t type_token_id (0x200026d)
		i32 5; uint32_t java_map_index (0x5)
	}, ; 260
	%struct.TypeMapModuleEntry {
		i32 33555055, ; uint32_t type_token_id (0x200026f)
		i32 48; uint32_t java_map_index (0x30)
	}, ; 261
	%struct.TypeMapModuleEntry {
		i32 33555056, ; uint32_t type_token_id (0x2000270)
		i32 297; uint32_t java_map_index (0x129)
	}, ; 262
	%struct.TypeMapModuleEntry {
		i32 33555057, ; uint32_t type_token_id (0x2000271)
		i32 397; uint32_t java_map_index (0x18d)
	}, ; 263
	%struct.TypeMapModuleEntry {
		i32 33555058, ; uint32_t type_token_id (0x2000272)
		i32 506; uint32_t java_map_index (0x1fa)
	}, ; 264
	%struct.TypeMapModuleEntry {
		i32 33555059, ; uint32_t type_token_id (0x2000273)
		i32 478; uint32_t java_map_index (0x1de)
	}, ; 265
	%struct.TypeMapModuleEntry {
		i32 33555060, ; uint32_t type_token_id (0x2000274)
		i32 343; uint32_t java_map_index (0x157)
	}, ; 266
	%struct.TypeMapModuleEntry {
		i32 33555061, ; uint32_t type_token_id (0x2000275)
		i32 356; uint32_t java_map_index (0x164)
	}, ; 267
	%struct.TypeMapModuleEntry {
		i32 33555066, ; uint32_t type_token_id (0x200027a)
		i32 339; uint32_t java_map_index (0x153)
	}, ; 268
	%struct.TypeMapModuleEntry {
		i32 33555067, ; uint32_t type_token_id (0x200027b)
		i32 150; uint32_t java_map_index (0x96)
	}, ; 269
	%struct.TypeMapModuleEntry {
		i32 33555069, ; uint32_t type_token_id (0x200027d)
		i32 52; uint32_t java_map_index (0x34)
	}, ; 270
	%struct.TypeMapModuleEntry {
		i32 33555071, ; uint32_t type_token_id (0x200027f)
		i32 274; uint32_t java_map_index (0x112)
	}, ; 271
	%struct.TypeMapModuleEntry {
		i32 33555072, ; uint32_t type_token_id (0x2000280)
		i32 181; uint32_t java_map_index (0xb5)
	}, ; 272
	%struct.TypeMapModuleEntry {
		i32 33555073, ; uint32_t type_token_id (0x2000281)
		i32 485; uint32_t java_map_index (0x1e5)
	}, ; 273
	%struct.TypeMapModuleEntry {
		i32 33555074, ; uint32_t type_token_id (0x2000282)
		i32 235; uint32_t java_map_index (0xeb)
	}, ; 274
	%struct.TypeMapModuleEntry {
		i32 33555075, ; uint32_t type_token_id (0x2000283)
		i32 131; uint32_t java_map_index (0x83)
	}, ; 275
	%struct.TypeMapModuleEntry {
		i32 33555076, ; uint32_t type_token_id (0x2000284)
		i32 399; uint32_t java_map_index (0x18f)
	}, ; 276
	%struct.TypeMapModuleEntry {
		i32 33555077, ; uint32_t type_token_id (0x2000285)
		i32 385; uint32_t java_map_index (0x181)
	}, ; 277
	%struct.TypeMapModuleEntry {
		i32 33555078, ; uint32_t type_token_id (0x2000286)
		i32 511; uint32_t java_map_index (0x1ff)
	}, ; 278
	%struct.TypeMapModuleEntry {
		i32 33555079, ; uint32_t type_token_id (0x2000287)
		i32 138; uint32_t java_map_index (0x8a)
	}, ; 279
	%struct.TypeMapModuleEntry {
		i32 33555081, ; uint32_t type_token_id (0x2000289)
		i32 433; uint32_t java_map_index (0x1b1)
	}, ; 280
	%struct.TypeMapModuleEntry {
		i32 33555083, ; uint32_t type_token_id (0x200028b)
		i32 198; uint32_t java_map_index (0xc6)
	}, ; 281
	%struct.TypeMapModuleEntry {
		i32 33555085, ; uint32_t type_token_id (0x200028d)
		i32 342; uint32_t java_map_index (0x156)
	}, ; 282
	%struct.TypeMapModuleEntry {
		i32 33555086, ; uint32_t type_token_id (0x200028e)
		i32 292; uint32_t java_map_index (0x124)
	}, ; 283
	%struct.TypeMapModuleEntry {
		i32 33555088, ; uint32_t type_token_id (0x2000290)
		i32 262; uint32_t java_map_index (0x106)
	}, ; 284
	%struct.TypeMapModuleEntry {
		i32 33555089, ; uint32_t type_token_id (0x2000291)
		i32 64; uint32_t java_map_index (0x40)
	}, ; 285
	%struct.TypeMapModuleEntry {
		i32 33555090, ; uint32_t type_token_id (0x2000292)
		i32 217; uint32_t java_map_index (0xd9)
	}, ; 286
	%struct.TypeMapModuleEntry {
		i32 33555092, ; uint32_t type_token_id (0x2000294)
		i32 204; uint32_t java_map_index (0xcc)
	}, ; 287
	%struct.TypeMapModuleEntry {
		i32 33555094, ; uint32_t type_token_id (0x2000296)
		i32 40; uint32_t java_map_index (0x28)
	}, ; 288
	%struct.TypeMapModuleEntry {
		i32 33555096, ; uint32_t type_token_id (0x2000298)
		i32 315; uint32_t java_map_index (0x13b)
	}, ; 289
	%struct.TypeMapModuleEntry {
		i32 33555097, ; uint32_t type_token_id (0x2000299)
		i32 432; uint32_t java_map_index (0x1b0)
	}, ; 290
	%struct.TypeMapModuleEntry {
		i32 33555098, ; uint32_t type_token_id (0x200029a)
		i32 406; uint32_t java_map_index (0x196)
	}, ; 291
	%struct.TypeMapModuleEntry {
		i32 33555100, ; uint32_t type_token_id (0x200029c)
		i32 6; uint32_t java_map_index (0x6)
	}, ; 292
	%struct.TypeMapModuleEntry {
		i32 33555102, ; uint32_t type_token_id (0x200029e)
		i32 474; uint32_t java_map_index (0x1da)
	}, ; 293
	%struct.TypeMapModuleEntry {
		i32 33555103, ; uint32_t type_token_id (0x200029f)
		i32 50; uint32_t java_map_index (0x32)
	}, ; 294
	%struct.TypeMapModuleEntry {
		i32 33555105, ; uint32_t type_token_id (0x20002a1)
		i32 135; uint32_t java_map_index (0x87)
	}, ; 295
	%struct.TypeMapModuleEntry {
		i32 33555107, ; uint32_t type_token_id (0x20002a3)
		i32 267; uint32_t java_map_index (0x10b)
	}, ; 296
	%struct.TypeMapModuleEntry {
		i32 33555109, ; uint32_t type_token_id (0x20002a5)
		i32 421; uint32_t java_map_index (0x1a5)
	}, ; 297
	%struct.TypeMapModuleEntry {
		i32 33555111, ; uint32_t type_token_id (0x20002a7)
		i32 443; uint32_t java_map_index (0x1bb)
	}, ; 298
	%struct.TypeMapModuleEntry {
		i32 33555112, ; uint32_t type_token_id (0x20002a8)
		i32 279; uint32_t java_map_index (0x117)
	}, ; 299
	%struct.TypeMapModuleEntry {
		i32 33555113, ; uint32_t type_token_id (0x20002a9)
		i32 362; uint32_t java_map_index (0x16a)
	}, ; 300
	%struct.TypeMapModuleEntry {
		i32 33555115, ; uint32_t type_token_id (0x20002ab)
		i32 4; uint32_t java_map_index (0x4)
	}, ; 301
	%struct.TypeMapModuleEntry {
		i32 33555117, ; uint32_t type_token_id (0x20002ad)
		i32 99; uint32_t java_map_index (0x63)
	}, ; 302
	%struct.TypeMapModuleEntry {
		i32 33555118, ; uint32_t type_token_id (0x20002ae)
		i32 387; uint32_t java_map_index (0x183)
	}, ; 303
	%struct.TypeMapModuleEntry {
		i32 33555119, ; uint32_t type_token_id (0x20002af)
		i32 248; uint32_t java_map_index (0xf8)
	}, ; 304
	%struct.TypeMapModuleEntry {
		i32 33555120, ; uint32_t type_token_id (0x20002b0)
		i32 335; uint32_t java_map_index (0x14f)
	}, ; 305
	%struct.TypeMapModuleEntry {
		i32 33555122, ; uint32_t type_token_id (0x20002b2)
		i32 72; uint32_t java_map_index (0x48)
	}, ; 306
	%struct.TypeMapModuleEntry {
		i32 33555124, ; uint32_t type_token_id (0x20002b4)
		i32 197; uint32_t java_map_index (0xc5)
	}, ; 307
	%struct.TypeMapModuleEntry {
		i32 33555126, ; uint32_t type_token_id (0x20002b6)
		i32 53; uint32_t java_map_index (0x35)
	}, ; 308
	%struct.TypeMapModuleEntry {
		i32 33555127, ; uint32_t type_token_id (0x20002b7)
		i32 186; uint32_t java_map_index (0xba)
	}, ; 309
	%struct.TypeMapModuleEntry {
		i32 33555129, ; uint32_t type_token_id (0x20002b9)
		i32 450; uint32_t java_map_index (0x1c2)
	}, ; 310
	%struct.TypeMapModuleEntry {
		i32 33555130, ; uint32_t type_token_id (0x20002ba)
		i32 457; uint32_t java_map_index (0x1c9)
	}, ; 311
	%struct.TypeMapModuleEntry {
		i32 33555131, ; uint32_t type_token_id (0x20002bb)
		i32 412; uint32_t java_map_index (0x19c)
	}, ; 312
	%struct.TypeMapModuleEntry {
		i32 33555132, ; uint32_t type_token_id (0x20002bc)
		i32 296; uint32_t java_map_index (0x128)
	}, ; 313
	%struct.TypeMapModuleEntry {
		i32 33555133, ; uint32_t type_token_id (0x20002bd)
		i32 129; uint32_t java_map_index (0x81)
	}, ; 314
	%struct.TypeMapModuleEntry {
		i32 33555135, ; uint32_t type_token_id (0x20002bf)
		i32 317; uint32_t java_map_index (0x13d)
	}, ; 315
	%struct.TypeMapModuleEntry {
		i32 33555136, ; uint32_t type_token_id (0x20002c0)
		i32 162; uint32_t java_map_index (0xa2)
	}, ; 316
	%struct.TypeMapModuleEntry {
		i32 33555137, ; uint32_t type_token_id (0x20002c1)
		i32 295; uint32_t java_map_index (0x127)
	}, ; 317
	%struct.TypeMapModuleEntry {
		i32 33555138, ; uint32_t type_token_id (0x20002c2)
		i32 81; uint32_t java_map_index (0x51)
	}, ; 318
	%struct.TypeMapModuleEntry {
		i32 33555139, ; uint32_t type_token_id (0x20002c3)
		i32 434; uint32_t java_map_index (0x1b2)
	}, ; 319
	%struct.TypeMapModuleEntry {
		i32 33555141, ; uint32_t type_token_id (0x20002c5)
		i32 479; uint32_t java_map_index (0x1df)
	}, ; 320
	%struct.TypeMapModuleEntry {
		i32 33555143, ; uint32_t type_token_id (0x20002c7)
		i32 203; uint32_t java_map_index (0xcb)
	}, ; 321
	%struct.TypeMapModuleEntry {
		i32 33555144, ; uint32_t type_token_id (0x20002c8)
		i32 207; uint32_t java_map_index (0xcf)
	}, ; 322
	%struct.TypeMapModuleEntry {
		i32 33555145, ; uint32_t type_token_id (0x20002c9)
		i32 123; uint32_t java_map_index (0x7b)
	}, ; 323
	%struct.TypeMapModuleEntry {
		i32 33555146, ; uint32_t type_token_id (0x20002ca)
		i32 333; uint32_t java_map_index (0x14d)
	}, ; 324
	%struct.TypeMapModuleEntry {
		i32 33555147, ; uint32_t type_token_id (0x20002cb)
		i32 11; uint32_t java_map_index (0xb)
	}, ; 325
	%struct.TypeMapModuleEntry {
		i32 33555148, ; uint32_t type_token_id (0x20002cc)
		i32 372; uint32_t java_map_index (0x174)
	}, ; 326
	%struct.TypeMapModuleEntry {
		i32 33555149, ; uint32_t type_token_id (0x20002cd)
		i32 192; uint32_t java_map_index (0xc0)
	}, ; 327
	%struct.TypeMapModuleEntry {
		i32 33555150, ; uint32_t type_token_id (0x20002ce)
		i32 525; uint32_t java_map_index (0x20d)
	}, ; 328
	%struct.TypeMapModuleEntry {
		i32 33555152, ; uint32_t type_token_id (0x20002d0)
		i32 472; uint32_t java_map_index (0x1d8)
	}, ; 329
	%struct.TypeMapModuleEntry {
		i32 33555154, ; uint32_t type_token_id (0x20002d2)
		i32 344; uint32_t java_map_index (0x158)
	}, ; 330
	%struct.TypeMapModuleEntry {
		i32 33555155, ; uint32_t type_token_id (0x20002d3)
		i32 508; uint32_t java_map_index (0x1fc)
	}, ; 331
	%struct.TypeMapModuleEntry {
		i32 33555156, ; uint32_t type_token_id (0x20002d4)
		i32 80; uint32_t java_map_index (0x50)
	}, ; 332
	%struct.TypeMapModuleEntry {
		i32 33555158, ; uint32_t type_token_id (0x20002d6)
		i32 259; uint32_t java_map_index (0x103)
	}, ; 333
	%struct.TypeMapModuleEntry {
		i32 33555160, ; uint32_t type_token_id (0x20002d8)
		i32 95; uint32_t java_map_index (0x5f)
	}, ; 334
	%struct.TypeMapModuleEntry {
		i32 33555161, ; uint32_t type_token_id (0x20002d9)
		i32 497; uint32_t java_map_index (0x1f1)
	}, ; 335
	%struct.TypeMapModuleEntry {
		i32 33555163, ; uint32_t type_token_id (0x20002db)
		i32 389; uint32_t java_map_index (0x185)
	}, ; 336
	%struct.TypeMapModuleEntry {
		i32 33555164, ; uint32_t type_token_id (0x20002dc)
		i32 499; uint32_t java_map_index (0x1f3)
	}, ; 337
	%struct.TypeMapModuleEntry {
		i32 33555166, ; uint32_t type_token_id (0x20002de)
		i32 265; uint32_t java_map_index (0x109)
	}, ; 338
	%struct.TypeMapModuleEntry {
		i32 33555167, ; uint32_t type_token_id (0x20002df)
		i32 226; uint32_t java_map_index (0xe2)
	}, ; 339
	%struct.TypeMapModuleEntry {
		i32 33555168, ; uint32_t type_token_id (0x20002e0)
		i32 229; uint32_t java_map_index (0xe5)
	}, ; 340
	%struct.TypeMapModuleEntry {
		i32 33555169, ; uint32_t type_token_id (0x20002e1)
		i32 468; uint32_t java_map_index (0x1d4)
	}, ; 341
	%struct.TypeMapModuleEntry {
		i32 33555170, ; uint32_t type_token_id (0x20002e2)
		i32 176; uint32_t java_map_index (0xb0)
	}, ; 342
	%struct.TypeMapModuleEntry {
		i32 33555171, ; uint32_t type_token_id (0x20002e3)
		i32 453; uint32_t java_map_index (0x1c5)
	}, ; 343
	%struct.TypeMapModuleEntry {
		i32 33555172, ; uint32_t type_token_id (0x20002e4)
		i32 307; uint32_t java_map_index (0x133)
	}, ; 344
	%struct.TypeMapModuleEntry {
		i32 33555174, ; uint32_t type_token_id (0x20002e6)
		i32 490; uint32_t java_map_index (0x1ea)
	}, ; 345
	%struct.TypeMapModuleEntry {
		i32 33555175, ; uint32_t type_token_id (0x20002e7)
		i32 378; uint32_t java_map_index (0x17a)
	}, ; 346
	%struct.TypeMapModuleEntry {
		i32 33555176, ; uint32_t type_token_id (0x20002e8)
		i32 358; uint32_t java_map_index (0x166)
	}, ; 347
	%struct.TypeMapModuleEntry {
		i32 33555177, ; uint32_t type_token_id (0x20002e9)
		i32 155; uint32_t java_map_index (0x9b)
	}, ; 348
	%struct.TypeMapModuleEntry {
		i32 33555179, ; uint32_t type_token_id (0x20002eb)
		i32 94; uint32_t java_map_index (0x5e)
	}, ; 349
	%struct.TypeMapModuleEntry {
		i32 33555182, ; uint32_t type_token_id (0x20002ee)
		i32 21; uint32_t java_map_index (0x15)
	}, ; 350
	%struct.TypeMapModuleEntry {
		i32 33555183, ; uint32_t type_token_id (0x20002ef)
		i32 73; uint32_t java_map_index (0x49)
	}, ; 351
	%struct.TypeMapModuleEntry {
		i32 33555184, ; uint32_t type_token_id (0x20002f0)
		i32 224; uint32_t java_map_index (0xe0)
	}, ; 352
	%struct.TypeMapModuleEntry {
		i32 33555185, ; uint32_t type_token_id (0x20002f1)
		i32 98; uint32_t java_map_index (0x62)
	}, ; 353
	%struct.TypeMapModuleEntry {
		i32 33555186, ; uint32_t type_token_id (0x20002f2)
		i32 250; uint32_t java_map_index (0xfa)
	}, ; 354
	%struct.TypeMapModuleEntry {
		i32 33555188, ; uint32_t type_token_id (0x20002f4)
		i32 366; uint32_t java_map_index (0x16e)
	}, ; 355
	%struct.TypeMapModuleEntry {
		i32 33555189, ; uint32_t type_token_id (0x20002f5)
		i32 58; uint32_t java_map_index (0x3a)
	}, ; 356
	%struct.TypeMapModuleEntry {
		i32 33555190, ; uint32_t type_token_id (0x20002f6)
		i32 51; uint32_t java_map_index (0x33)
	}, ; 357
	%struct.TypeMapModuleEntry {
		i32 33555191, ; uint32_t type_token_id (0x20002f7)
		i32 309; uint32_t java_map_index (0x135)
	}, ; 358
	%struct.TypeMapModuleEntry {
		i32 33555192, ; uint32_t type_token_id (0x20002f8)
		i32 106; uint32_t java_map_index (0x6a)
	}, ; 359
	%struct.TypeMapModuleEntry {
		i32 33555193, ; uint32_t type_token_id (0x20002f9)
		i32 427; uint32_t java_map_index (0x1ab)
	}, ; 360
	%struct.TypeMapModuleEntry {
		i32 33555195, ; uint32_t type_token_id (0x20002fb)
		i32 1; uint32_t java_map_index (0x1)
	}, ; 361
	%struct.TypeMapModuleEntry {
		i32 33555196, ; uint32_t type_token_id (0x20002fc)
		i32 221; uint32_t java_map_index (0xdd)
	}, ; 362
	%struct.TypeMapModuleEntry {
		i32 33555197, ; uint32_t type_token_id (0x20002fd)
		i32 184; uint32_t java_map_index (0xb8)
	}, ; 363
	%struct.TypeMapModuleEntry {
		i32 33555198, ; uint32_t type_token_id (0x20002fe)
		i32 115; uint32_t java_map_index (0x73)
	}, ; 364
	%struct.TypeMapModuleEntry {
		i32 33555199, ; uint32_t type_token_id (0x20002ff)
		i32 368; uint32_t java_map_index (0x170)
	}, ; 365
	%struct.TypeMapModuleEntry {
		i32 33555200, ; uint32_t type_token_id (0x2000300)
		i32 449; uint32_t java_map_index (0x1c1)
	}, ; 366
	%struct.TypeMapModuleEntry {
		i32 33555202, ; uint32_t type_token_id (0x2000302)
		i32 101; uint32_t java_map_index (0x65)
	}, ; 367
	%struct.TypeMapModuleEntry {
		i32 33555203, ; uint32_t type_token_id (0x2000303)
		i32 47; uint32_t java_map_index (0x2f)
	}, ; 368
	%struct.TypeMapModuleEntry {
		i32 33555204, ; uint32_t type_token_id (0x2000304)
		i32 166; uint32_t java_map_index (0xa6)
	}, ; 369
	%struct.TypeMapModuleEntry {
		i32 33555205, ; uint32_t type_token_id (0x2000305)
		i32 103; uint32_t java_map_index (0x67)
	}, ; 370
	%struct.TypeMapModuleEntry {
		i32 33555206, ; uint32_t type_token_id (0x2000306)
		i32 314; uint32_t java_map_index (0x13a)
	}, ; 371
	%struct.TypeMapModuleEntry {
		i32 33555207, ; uint32_t type_token_id (0x2000307)
		i32 345; uint32_t java_map_index (0x159)
	}, ; 372
	%struct.TypeMapModuleEntry {
		i32 33555223, ; uint32_t type_token_id (0x2000317)
		i32 383; uint32_t java_map_index (0x17f)
	} ; 373
], align 4

@module2_managed_to_java_duplicates = internal dso_local constant [122 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554570, ; uint32_t type_token_id (0x200008a)
		i32 293; uint32_t java_map_index (0x125)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554576, ; uint32_t type_token_id (0x2000090)
		i32 159; uint32_t java_map_index (0x9f)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554578, ; uint32_t type_token_id (0x2000092)
		i32 28; uint32_t java_map_index (0x1c)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554582, ; uint32_t type_token_id (0x2000096)
		i32 456; uint32_t java_map_index (0x1c8)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554584, ; uint32_t type_token_id (0x2000098)
		i32 422; uint32_t java_map_index (0x1a6)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554586, ; uint32_t type_token_id (0x200009a)
		i32 346; uint32_t java_map_index (0x15a)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554588, ; uint32_t type_token_id (0x200009c)
		i32 178; uint32_t java_map_index (0xb2)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554590, ; uint32_t type_token_id (0x200009e)
		i32 410; uint32_t java_map_index (0x19a)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554592, ; uint32_t type_token_id (0x20000a0)
		i32 17; uint32_t java_map_index (0x11)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554594, ; uint32_t type_token_id (0x20000a2)
		i32 110; uint32_t java_map_index (0x6e)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554598, ; uint32_t type_token_id (0x20000a6)
		i32 482; uint32_t java_map_index (0x1e2)
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 33554605, ; uint32_t type_token_id (0x20000ad)
		i32 355; uint32_t java_map_index (0x163)
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 33554614, ; uint32_t type_token_id (0x20000b6)
		i32 447; uint32_t java_map_index (0x1bf)
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 33554616, ; uint32_t type_token_id (0x20000b8)
		i32 59; uint32_t java_map_index (0x3b)
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 33554619, ; uint32_t type_token_id (0x20000bb)
		i32 266; uint32_t java_map_index (0x10a)
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 33554623, ; uint32_t type_token_id (0x20000bf)
		i32 258; uint32_t java_map_index (0x102)
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 33554632, ; uint32_t type_token_id (0x20000c8)
		i32 270; uint32_t java_map_index (0x10e)
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 33554635, ; uint32_t type_token_id (0x20000cb)
		i32 338; uint32_t java_map_index (0x152)
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 33554639, ; uint32_t type_token_id (0x20000cf)
		i32 526; uint32_t java_map_index (0x20e)
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 33554645, ; uint32_t type_token_id (0x20000d5)
		i32 228; uint32_t java_map_index (0xe4)
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 33554648, ; uint32_t type_token_id (0x20000d8)
		i32 348; uint32_t java_map_index (0x15c)
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 33554650, ; uint32_t type_token_id (0x20000da)
		i32 3; uint32_t java_map_index (0x3)
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 33554652, ; uint32_t type_token_id (0x20000dc)
		i32 276; uint32_t java_map_index (0x114)
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 33554666, ; uint32_t type_token_id (0x20000ea)
		i32 270; uint32_t java_map_index (0x10e)
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 33554667, ; uint32_t type_token_id (0x20000eb)
		i32 419; uint32_t java_map_index (0x1a3)
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 33554672, ; uint32_t type_token_id (0x20000f0)
		i32 377; uint32_t java_map_index (0x179)
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 33554677, ; uint32_t type_token_id (0x20000f5)
		i32 505; uint32_t java_map_index (0x1f9)
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 33554680, ; uint32_t type_token_id (0x20000f8)
		i32 417; uint32_t java_map_index (0x1a1)
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 33554683, ; uint32_t type_token_id (0x20000fb)
		i32 19; uint32_t java_map_index (0x13)
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 33554686, ; uint32_t type_token_id (0x20000fe)
		i32 473; uint32_t java_map_index (0x1d9)
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 33554688, ; uint32_t type_token_id (0x2000100)
		i32 455; uint32_t java_map_index (0x1c7)
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 33554690, ; uint32_t type_token_id (0x2000102)
		i32 357; uint32_t java_map_index (0x165)
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 33554693, ; uint32_t type_token_id (0x2000105)
		i32 244; uint32_t java_map_index (0xf4)
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 33554696, ; uint32_t type_token_id (0x2000108)
		i32 509; uint32_t java_map_index (0x1fd)
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 33554706, ; uint32_t type_token_id (0x2000112)
		i32 326; uint32_t java_map_index (0x146)
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 33554708, ; uint32_t type_token_id (0x2000114)
		i32 299; uint32_t java_map_index (0x12b)
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 33554749, ; uint32_t type_token_id (0x200013d)
		i32 100; uint32_t java_map_index (0x64)
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 33554751, ; uint32_t type_token_id (0x200013f)
		i32 398; uint32_t java_map_index (0x18e)
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 33554753, ; uint32_t type_token_id (0x2000141)
		i32 233; uint32_t java_map_index (0xe9)
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 33554755, ; uint32_t type_token_id (0x2000143)
		i32 273; uint32_t java_map_index (0x111)
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 33554757, ; uint32_t type_token_id (0x2000145)
		i32 515; uint32_t java_map_index (0x203)
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 33554766, ; uint32_t type_token_id (0x200014e)
		i32 514; uint32_t java_map_index (0x202)
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 33554768, ; uint32_t type_token_id (0x2000150)
		i32 161; uint32_t java_map_index (0xa1)
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 33554782, ; uint32_t type_token_id (0x200015e)
		i32 463; uint32_t java_map_index (0x1cf)
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 33554793, ; uint32_t type_token_id (0x2000169)
		i32 408; uint32_t java_map_index (0x198)
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 33554802, ; uint32_t type_token_id (0x2000172)
		i32 519; uint32_t java_map_index (0x207)
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 33554806, ; uint32_t type_token_id (0x2000176)
		i32 142; uint32_t java_map_index (0x8e)
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 33554815, ; uint32_t type_token_id (0x200017f)
		i32 39; uint32_t java_map_index (0x27)
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 33554818, ; uint32_t type_token_id (0x2000182)
		i32 137; uint32_t java_map_index (0x89)
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 33554820, ; uint32_t type_token_id (0x2000184)
		i32 130; uint32_t java_map_index (0x82)
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 33554822, ; uint32_t type_token_id (0x2000186)
		i32 117; uint32_t java_map_index (0x75)
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 33554831, ; uint32_t type_token_id (0x200018f)
		i32 174; uint32_t java_map_index (0xae)
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 33554837, ; uint32_t type_token_id (0x2000195)
		i32 234; uint32_t java_map_index (0xea)
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 33554841, ; uint32_t type_token_id (0x2000199)
		i32 91; uint32_t java_map_index (0x5b)
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 33554850, ; uint32_t type_token_id (0x20001a2)
		i32 452; uint32_t java_map_index (0x1c4)
	}, ; 54
	%struct.TypeMapModuleEntry {
		i32 33554855, ; uint32_t type_token_id (0x20001a7)
		i32 328; uint32_t java_map_index (0x148)
	}, ; 55
	%struct.TypeMapModuleEntry {
		i32 33554857, ; uint32_t type_token_id (0x20001a9)
		i32 520; uint32_t java_map_index (0x208)
	}, ; 56
	%struct.TypeMapModuleEntry {
		i32 33554859, ; uint32_t type_token_id (0x20001ab)
		i32 38; uint32_t java_map_index (0x26)
	}, ; 57
	%struct.TypeMapModuleEntry {
		i32 33554861, ; uint32_t type_token_id (0x20001ad)
		i32 516; uint32_t java_map_index (0x204)
	}, ; 58
	%struct.TypeMapModuleEntry {
		i32 33554863, ; uint32_t type_token_id (0x20001af)
		i32 409; uint32_t java_map_index (0x199)
	}, ; 59
	%struct.TypeMapModuleEntry {
		i32 33554865, ; uint32_t type_token_id (0x20001b1)
		i32 376; uint32_t java_map_index (0x178)
	}, ; 60
	%struct.TypeMapModuleEntry {
		i32 33554867, ; uint32_t type_token_id (0x20001b3)
		i32 152; uint32_t java_map_index (0x98)
	}, ; 61
	%struct.TypeMapModuleEntry {
		i32 33554869, ; uint32_t type_token_id (0x20001b5)
		i32 188; uint32_t java_map_index (0xbc)
	}, ; 62
	%struct.TypeMapModuleEntry {
		i32 33554871, ; uint32_t type_token_id (0x20001b7)
		i32 401; uint32_t java_map_index (0x191)
	}, ; 63
	%struct.TypeMapModuleEntry {
		i32 33554874, ; uint32_t type_token_id (0x20001ba)
		i32 448; uint32_t java_map_index (0x1c0)
	}, ; 64
	%struct.TypeMapModuleEntry {
		i32 33554877, ; uint32_t type_token_id (0x20001bd)
		i32 22; uint32_t java_map_index (0x16)
	}, ; 65
	%struct.TypeMapModuleEntry {
		i32 33554880, ; uint32_t type_token_id (0x20001c0)
		i32 245; uint32_t java_map_index (0xf5)
	}, ; 66
	%struct.TypeMapModuleEntry {
		i32 33554883, ; uint32_t type_token_id (0x20001c3)
		i32 331; uint32_t java_map_index (0x14b)
	}, ; 67
	%struct.TypeMapModuleEntry {
		i32 33554895, ; uint32_t type_token_id (0x20001cf)
		i32 10; uint32_t java_map_index (0xa)
	}, ; 68
	%struct.TypeMapModuleEntry {
		i32 33554897, ; uint32_t type_token_id (0x20001d1)
		i32 461; uint32_t java_map_index (0x1cd)
	}, ; 69
	%struct.TypeMapModuleEntry {
		i32 33554935, ; uint32_t type_token_id (0x20001f7)
		i32 173; uint32_t java_map_index (0xad)
	}, ; 70
	%struct.TypeMapModuleEntry {
		i32 33554941, ; uint32_t type_token_id (0x20001fd)
		i32 194; uint32_t java_map_index (0xc2)
	}, ; 71
	%struct.TypeMapModuleEntry {
		i32 33554946, ; uint32_t type_token_id (0x2000202)
		i32 92; uint32_t java_map_index (0x5c)
	}, ; 72
	%struct.TypeMapModuleEntry {
		i32 33554950, ; uint32_t type_token_id (0x2000206)
		i32 513; uint32_t java_map_index (0x201)
	}, ; 73
	%struct.TypeMapModuleEntry {
		i32 33554995, ; uint32_t type_token_id (0x2000233)
		i32 354; uint32_t java_map_index (0x162)
	}, ; 74
	%struct.TypeMapModuleEntry {
		i32 33555001, ; uint32_t type_token_id (0x2000239)
		i32 261; uint32_t java_map_index (0x105)
	}, ; 75
	%struct.TypeMapModuleEntry {
		i32 33555004, ; uint32_t type_token_id (0x200023c)
		i32 199; uint32_t java_map_index (0xc7)
	}, ; 76
	%struct.TypeMapModuleEntry {
		i32 33555009, ; uint32_t type_token_id (0x2000241)
		i32 209; uint32_t java_map_index (0xd1)
	}, ; 77
	%struct.TypeMapModuleEntry {
		i32 33555011, ; uint32_t type_token_id (0x2000243)
		i32 112; uint32_t java_map_index (0x70)
	}, ; 78
	%struct.TypeMapModuleEntry {
		i32 33555014, ; uint32_t type_token_id (0x2000246)
		i32 495; uint32_t java_map_index (0x1ef)
	}, ; 79
	%struct.TypeMapModuleEntry {
		i32 33555017, ; uint32_t type_token_id (0x2000249)
		i32 373; uint32_t java_map_index (0x175)
	}, ; 80
	%struct.TypeMapModuleEntry {
		i32 33555021, ; uint32_t type_token_id (0x200024d)
		i32 271; uint32_t java_map_index (0x10f)
	}, ; 81
	%struct.TypeMapModuleEntry {
		i32 33555026, ; uint32_t type_token_id (0x2000252)
		i32 371; uint32_t java_map_index (0x173)
	}, ; 82
	%struct.TypeMapModuleEntry {
		i32 33555028, ; uint32_t type_token_id (0x2000254)
		i32 32; uint32_t java_map_index (0x20)
	}, ; 83
	%struct.TypeMapModuleEntry {
		i32 33555030, ; uint32_t type_token_id (0x2000256)
		i32 327; uint32_t java_map_index (0x147)
	}, ; 84
	%struct.TypeMapModuleEntry {
		i32 33555032, ; uint32_t type_token_id (0x2000258)
		i32 429; uint32_t java_map_index (0x1ad)
	}, ; 85
	%struct.TypeMapModuleEntry {
		i32 33555042, ; uint32_t type_token_id (0x2000262)
		i32 466; uint32_t java_map_index (0x1d2)
	}, ; 86
	%struct.TypeMapModuleEntry {
		i32 33555054, ; uint32_t type_token_id (0x200026e)
		i32 341; uint32_t java_map_index (0x155)
	}, ; 87
	%struct.TypeMapModuleEntry {
		i32 33555068, ; uint32_t type_token_id (0x200027c)
		i32 150; uint32_t java_map_index (0x96)
	}, ; 88
	%struct.TypeMapModuleEntry {
		i32 33555070, ; uint32_t type_token_id (0x200027e)
		i32 52; uint32_t java_map_index (0x34)
	}, ; 89
	%struct.TypeMapModuleEntry {
		i32 33555080, ; uint32_t type_token_id (0x2000288)
		i32 138; uint32_t java_map_index (0x8a)
	}, ; 90
	%struct.TypeMapModuleEntry {
		i32 33555082, ; uint32_t type_token_id (0x200028a)
		i32 433; uint32_t java_map_index (0x1b1)
	}, ; 91
	%struct.TypeMapModuleEntry {
		i32 33555084, ; uint32_t type_token_id (0x200028c)
		i32 198; uint32_t java_map_index (0xc6)
	}, ; 92
	%struct.TypeMapModuleEntry {
		i32 33555087, ; uint32_t type_token_id (0x200028f)
		i32 292; uint32_t java_map_index (0x124)
	}, ; 93
	%struct.TypeMapModuleEntry {
		i32 33555091, ; uint32_t type_token_id (0x2000293)
		i32 217; uint32_t java_map_index (0xd9)
	}, ; 94
	%struct.TypeMapModuleEntry {
		i32 33555093, ; uint32_t type_token_id (0x2000295)
		i32 204; uint32_t java_map_index (0xcc)
	}, ; 95
	%struct.TypeMapModuleEntry {
		i32 33555095, ; uint32_t type_token_id (0x2000297)
		i32 40; uint32_t java_map_index (0x28)
	}, ; 96
	%struct.TypeMapModuleEntry {
		i32 33555099, ; uint32_t type_token_id (0x200029b)
		i32 406; uint32_t java_map_index (0x196)
	}, ; 97
	%struct.TypeMapModuleEntry {
		i32 33555101, ; uint32_t type_token_id (0x200029d)
		i32 6; uint32_t java_map_index (0x6)
	}, ; 98
	%struct.TypeMapModuleEntry {
		i32 33555104, ; uint32_t type_token_id (0x20002a0)
		i32 50; uint32_t java_map_index (0x32)
	}, ; 99
	%struct.TypeMapModuleEntry {
		i32 33555106, ; uint32_t type_token_id (0x20002a2)
		i32 135; uint32_t java_map_index (0x87)
	}, ; 100
	%struct.TypeMapModuleEntry {
		i32 33555108, ; uint32_t type_token_id (0x20002a4)
		i32 267; uint32_t java_map_index (0x10b)
	}, ; 101
	%struct.TypeMapModuleEntry {
		i32 33555110, ; uint32_t type_token_id (0x20002a6)
		i32 421; uint32_t java_map_index (0x1a5)
	}, ; 102
	%struct.TypeMapModuleEntry {
		i32 33555114, ; uint32_t type_token_id (0x20002aa)
		i32 362; uint32_t java_map_index (0x16a)
	}, ; 103
	%struct.TypeMapModuleEntry {
		i32 33555116, ; uint32_t type_token_id (0x20002ac)
		i32 4; uint32_t java_map_index (0x4)
	}, ; 104
	%struct.TypeMapModuleEntry {
		i32 33555121, ; uint32_t type_token_id (0x20002b1)
		i32 335; uint32_t java_map_index (0x14f)
	}, ; 105
	%struct.TypeMapModuleEntry {
		i32 33555123, ; uint32_t type_token_id (0x20002b3)
		i32 72; uint32_t java_map_index (0x48)
	}, ; 106
	%struct.TypeMapModuleEntry {
		i32 33555125, ; uint32_t type_token_id (0x20002b5)
		i32 197; uint32_t java_map_index (0xc5)
	}, ; 107
	%struct.TypeMapModuleEntry {
		i32 33555128, ; uint32_t type_token_id (0x20002b8)
		i32 186; uint32_t java_map_index (0xba)
	}, ; 108
	%struct.TypeMapModuleEntry {
		i32 33555134, ; uint32_t type_token_id (0x20002be)
		i32 129; uint32_t java_map_index (0x81)
	}, ; 109
	%struct.TypeMapModuleEntry {
		i32 33555140, ; uint32_t type_token_id (0x20002c4)
		i32 434; uint32_t java_map_index (0x1b2)
	}, ; 110
	%struct.TypeMapModuleEntry {
		i32 33555151, ; uint32_t type_token_id (0x20002cf)
		i32 525; uint32_t java_map_index (0x20d)
	}, ; 111
	%struct.TypeMapModuleEntry {
		i32 33555153, ; uint32_t type_token_id (0x20002d1)
		i32 472; uint32_t java_map_index (0x1d8)
	}, ; 112
	%struct.TypeMapModuleEntry {
		i32 33555157, ; uint32_t type_token_id (0x20002d5)
		i32 80; uint32_t java_map_index (0x50)
	}, ; 113
	%struct.TypeMapModuleEntry {
		i32 33555159, ; uint32_t type_token_id (0x20002d7)
		i32 259; uint32_t java_map_index (0x103)
	}, ; 114
	%struct.TypeMapModuleEntry {
		i32 33555162, ; uint32_t type_token_id (0x20002da)
		i32 497; uint32_t java_map_index (0x1f1)
	}, ; 115
	%struct.TypeMapModuleEntry {
		i32 33555165, ; uint32_t type_token_id (0x20002dd)
		i32 499; uint32_t java_map_index (0x1f3)
	}, ; 116
	%struct.TypeMapModuleEntry {
		i32 33555173, ; uint32_t type_token_id (0x20002e5)
		i32 307; uint32_t java_map_index (0x133)
	}, ; 117
	%struct.TypeMapModuleEntry {
		i32 33555178, ; uint32_t type_token_id (0x20002ea)
		i32 155; uint32_t java_map_index (0x9b)
	}, ; 118
	%struct.TypeMapModuleEntry {
		i32 33555180, ; uint32_t type_token_id (0x20002ec)
		i32 94; uint32_t java_map_index (0x5e)
	}, ; 119
	%struct.TypeMapModuleEntry {
		i32 33555187, ; uint32_t type_token_id (0x20002f3)
		i32 250; uint32_t java_map_index (0xfa)
	}, ; 120
	%struct.TypeMapModuleEntry {
		i32 33555194, ; uint32_t type_token_id (0x20002fa)
		i32 427; uint32_t java_map_index (0x1ab)
	} ; 121
], align 4

@module3_managed_to_java = internal dso_local constant [5 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554435, ; uint32_t type_token_id (0x2000003)
		i32 36; uint32_t java_map_index (0x24)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554436, ; uint32_t type_token_id (0x2000004)
		i32 97; uint32_t java_map_index (0x61)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554437, ; uint32_t type_token_id (0x2000005)
		i32 465; uint32_t java_map_index (0x1d1)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554440, ; uint32_t type_token_id (0x2000008)
		i32 126; uint32_t java_map_index (0x7e)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554441, ; uint32_t type_token_id (0x2000009)
		i32 185; uint32_t java_map_index (0xb9)
	} ; 4
], align 4

@module3_managed_to_java_duplicates = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554438, ; uint32_t type_token_id (0x2000006)
		i32 97; uint32_t java_map_index (0x61)
	} ; 0
], align 4

@module4_managed_to_java = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554704, ; uint32_t type_token_id (0x2000110)
		i32 249; uint32_t java_map_index (0xf9)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554765, ; uint32_t type_token_id (0x200014d)
		i32 62; uint32_t java_map_index (0x3e)
	} ; 1
], align 4

@module5_managed_to_java = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554437, ; uint32_t type_token_id (0x2000005)
		i32 353; uint32_t java_map_index (0x161)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554438, ; uint32_t type_token_id (0x2000006)
		i32 435; uint32_t java_map_index (0x1b3)
	} ; 1
], align 4

@module6_managed_to_java = internal dso_local constant [19 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554471, ; uint32_t type_token_id (0x2000027)
		i32 218; uint32_t java_map_index (0xda)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554662, ; uint32_t type_token_id (0x20000e6)
		i32 462; uint32_t java_map_index (0x1ce)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554663, ; uint32_t type_token_id (0x20000e7)
		i32 528; uint32_t java_map_index (0x210)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554664, ; uint32_t type_token_id (0x20000e8)
		i32 246; uint32_t java_map_index (0xf6)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554665, ; uint32_t type_token_id (0x20000e9)
		i32 44; uint32_t java_map_index (0x2c)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554666, ; uint32_t type_token_id (0x20000ea)
		i32 153; uint32_t java_map_index (0x99)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554667, ; uint32_t type_token_id (0x20000eb)
		i32 179; uint32_t java_map_index (0xb3)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554668, ; uint32_t type_token_id (0x20000ec)
		i32 25; uint32_t java_map_index (0x19)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554670, ; uint32_t type_token_id (0x20000ee)
		i32 329; uint32_t java_map_index (0x149)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554672, ; uint32_t type_token_id (0x20000f0)
		i32 31; uint32_t java_map_index (0x1f)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554673, ; uint32_t type_token_id (0x20000f1)
		i32 145; uint32_t java_map_index (0x91)
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 33554674, ; uint32_t type_token_id (0x20000f2)
		i32 46; uint32_t java_map_index (0x2e)
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 33554675, ; uint32_t type_token_id (0x20000f3)
		i32 310; uint32_t java_map_index (0x136)
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 33554678, ; uint32_t type_token_id (0x20000f6)
		i32 120; uint32_t java_map_index (0x78)
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 33554679, ; uint32_t type_token_id (0x20000f7)
		i32 169; uint32_t java_map_index (0xa9)
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 33554682, ; uint32_t type_token_id (0x20000fa)
		i32 404; uint32_t java_map_index (0x194)
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 33554686, ; uint32_t type_token_id (0x20000fe)
		i32 55; uint32_t java_map_index (0x37)
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 33554692, ; uint32_t type_token_id (0x2000104)
		i32 402; uint32_t java_map_index (0x192)
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 33554693, ; uint32_t type_token_id (0x2000105)
		i32 411; uint32_t java_map_index (0x19b)
	} ; 18
], align 4

@module7_managed_to_java = internal dso_local constant [28 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554454, ; uint32_t type_token_id (0x2000016)
		i32 393; uint32_t java_map_index (0x189)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554455, ; uint32_t type_token_id (0x2000017)
		i32 286; uint32_t java_map_index (0x11e)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554457, ; uint32_t type_token_id (0x2000019)
		i32 312; uint32_t java_map_index (0x138)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554458, ; uint32_t type_token_id (0x200001a)
		i32 165; uint32_t java_map_index (0xa5)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554459, ; uint32_t type_token_id (0x200001b)
		i32 349; uint32_t java_map_index (0x15d)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554460, ; uint32_t type_token_id (0x200001c)
		i32 134; uint32_t java_map_index (0x86)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554461, ; uint32_t type_token_id (0x200001d)
		i32 15; uint32_t java_map_index (0xf)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554462, ; uint32_t type_token_id (0x200001e)
		i32 489; uint32_t java_map_index (0x1e9)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554463, ; uint32_t type_token_id (0x200001f)
		i32 306; uint32_t java_map_index (0x132)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554465, ; uint32_t type_token_id (0x2000021)
		i32 287; uint32_t java_map_index (0x11f)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554467, ; uint32_t type_token_id (0x2000023)
		i32 388; uint32_t java_map_index (0x184)
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 33554472, ; uint32_t type_token_id (0x2000028)
		i32 324; uint32_t java_map_index (0x144)
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 33554473, ; uint32_t type_token_id (0x2000029)
		i32 223; uint32_t java_map_index (0xdf)
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 33554474, ; uint32_t type_token_id (0x200002a)
		i32 71; uint32_t java_map_index (0x47)
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 33554476, ; uint32_t type_token_id (0x200002c)
		i32 381; uint32_t java_map_index (0x17d)
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 33554478, ; uint32_t type_token_id (0x200002e)
		i32 172; uint32_t java_map_index (0xac)
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 33554479, ; uint32_t type_token_id (0x200002f)
		i32 82; uint32_t java_map_index (0x52)
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 33554481, ; uint32_t type_token_id (0x2000031)
		i32 9; uint32_t java_map_index (0x9)
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 33554483, ; uint32_t type_token_id (0x2000033)
		i32 289; uint32_t java_map_index (0x121)
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 33554484, ; uint32_t type_token_id (0x2000034)
		i32 464; uint32_t java_map_index (0x1d0)
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 33554486, ; uint32_t type_token_id (0x2000036)
		i32 521; uint32_t java_map_index (0x209)
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 33554488, ; uint32_t type_token_id (0x2000038)
		i32 140; uint32_t java_map_index (0x8c)
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 33554489, ; uint32_t type_token_id (0x2000039)
		i32 27; uint32_t java_map_index (0x1b)
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 33554491, ; uint32_t type_token_id (0x200003b)
		i32 301; uint32_t java_map_index (0x12d)
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 33554493, ; uint32_t type_token_id (0x200003d)
		i32 255; uint32_t java_map_index (0xff)
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 33554494, ; uint32_t type_token_id (0x200003e)
		i32 501; uint32_t java_map_index (0x1f5)
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 33554496, ; uint32_t type_token_id (0x2000040)
		i32 467; uint32_t java_map_index (0x1d3)
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 33554498, ; uint32_t type_token_id (0x2000042)
		i32 175; uint32_t java_map_index (0xaf)
	} ; 27
], align 4

@module7_managed_to_java_duplicates = internal dso_local constant [14 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554456, ; uint32_t type_token_id (0x2000018)
		i32 286; uint32_t java_map_index (0x11e)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554464, ; uint32_t type_token_id (0x2000020)
		i32 306; uint32_t java_map_index (0x132)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554466, ; uint32_t type_token_id (0x2000022)
		i32 287; uint32_t java_map_index (0x11f)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554468, ; uint32_t type_token_id (0x2000024)
		i32 388; uint32_t java_map_index (0x184)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554475, ; uint32_t type_token_id (0x200002b)
		i32 71; uint32_t java_map_index (0x47)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554477, ; uint32_t type_token_id (0x200002d)
		i32 381; uint32_t java_map_index (0x17d)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554480, ; uint32_t type_token_id (0x2000030)
		i32 82; uint32_t java_map_index (0x52)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554482, ; uint32_t type_token_id (0x2000032)
		i32 9; uint32_t java_map_index (0x9)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554485, ; uint32_t type_token_id (0x2000035)
		i32 464; uint32_t java_map_index (0x1d0)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554487, ; uint32_t type_token_id (0x2000037)
		i32 521; uint32_t java_map_index (0x209)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554490, ; uint32_t type_token_id (0x200003a)
		i32 27; uint32_t java_map_index (0x1b)
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 33554492, ; uint32_t type_token_id (0x200003c)
		i32 301; uint32_t java_map_index (0x12d)
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 33554495, ; uint32_t type_token_id (0x200003f)
		i32 501; uint32_t java_map_index (0x1f5)
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 33554497, ; uint32_t type_token_id (0x2000041)
		i32 467; uint32_t java_map_index (0x1d3)
	} ; 13
], align 4

@module8_managed_to_java = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554438, ; uint32_t type_token_id (0x2000006)
		i32 322; uint32_t java_map_index (0x142)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554446, ; uint32_t type_token_id (0x200000e)
		i32 527; uint32_t java_map_index (0x20f)
	} ; 1
], align 4

@module9_managed_to_java = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554478, ; uint32_t type_token_id (0x200002e)
		i32 133; uint32_t java_map_index (0x85)
	} ; 0
], align 4

@module10_managed_to_java = internal dso_local constant [10 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554442, ; uint32_t type_token_id (0x200000a)
		i32 77; uint32_t java_map_index (0x4d)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554445, ; uint32_t type_token_id (0x200000d)
		i32 206; uint32_t java_map_index (0xce)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554453, ; uint32_t type_token_id (0x2000015)
		i32 438; uint32_t java_map_index (0x1b6)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554454, ; uint32_t type_token_id (0x2000016)
		i32 332; uint32_t java_map_index (0x14c)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554455, ; uint32_t type_token_id (0x2000017)
		i32 49; uint32_t java_map_index (0x31)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554456, ; uint32_t type_token_id (0x2000018)
		i32 437; uint32_t java_map_index (0x1b5)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554457, ; uint32_t type_token_id (0x2000019)
		i32 311; uint32_t java_map_index (0x137)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554458, ; uint32_t type_token_id (0x200001a)
		i32 144; uint32_t java_map_index (0x90)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554460, ; uint32_t type_token_id (0x200001c)
		i32 517; uint32_t java_map_index (0x205)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554461, ; uint32_t type_token_id (0x200001d)
		i32 243; uint32_t java_map_index (0xf3)
	} ; 9
], align 4

@module10_managed_to_java_duplicates = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554459, ; uint32_t type_token_id (0x200001b)
		i32 144; uint32_t java_map_index (0x90)
	} ; 0
], align 4

@module11_managed_to_java = internal dso_local constant [6 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554436, ; uint32_t type_token_id (0x2000004)
		i32 158; uint32_t java_map_index (0x9e)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554437, ; uint32_t type_token_id (0x2000005)
		i32 303; uint32_t java_map_index (0x12f)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554438, ; uint32_t type_token_id (0x2000006)
		i32 446; uint32_t java_map_index (0x1be)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554441, ; uint32_t type_token_id (0x2000009)
		i32 405; uint32_t java_map_index (0x195)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554447, ; uint32_t type_token_id (0x200000f)
		i32 374; uint32_t java_map_index (0x176)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554448, ; uint32_t type_token_id (0x2000010)
		i32 67; uint32_t java_map_index (0x43)
	} ; 5
], align 4

@module12_managed_to_java = internal dso_local constant [7 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554434, ; uint32_t type_token_id (0x2000002)
		i32 430; uint32_t java_map_index (0x1ae)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554435, ; uint32_t type_token_id (0x2000003)
		i32 170; uint32_t java_map_index (0xaa)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554436, ; uint32_t type_token_id (0x2000004)
		i32 114; uint32_t java_map_index (0x72)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554437, ; uint32_t type_token_id (0x2000005)
		i32 89; uint32_t java_map_index (0x59)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554438, ; uint32_t type_token_id (0x2000006)
		i32 325; uint32_t java_map_index (0x145)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554440, ; uint32_t type_token_id (0x2000008)
		i32 518; uint32_t java_map_index (0x206)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554538, ; uint32_t type_token_id (0x200006a)
		i32 436; uint32_t java_map_index (0x1b4)
	} ; 6
], align 4

@module13_managed_to_java = internal dso_local constant [9 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554447, ; uint32_t type_token_id (0x200000f)
		i32 492; uint32_t java_map_index (0x1ec)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554448, ; uint32_t type_token_id (0x2000010)
		i32 122; uint32_t java_map_index (0x7a)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554449, ; uint32_t type_token_id (0x2000011)
		i32 116; uint32_t java_map_index (0x74)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554450, ; uint32_t type_token_id (0x2000012)
		i32 215; uint32_t java_map_index (0xd7)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554451, ; uint32_t type_token_id (0x2000013)
		i32 418; uint32_t java_map_index (0x1a2)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554452, ; uint32_t type_token_id (0x2000014)
		i32 193; uint32_t java_map_index (0xc1)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554453, ; uint32_t type_token_id (0x2000015)
		i32 119; uint32_t java_map_index (0x77)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554455, ; uint32_t type_token_id (0x2000017)
		i32 471; uint32_t java_map_index (0x1d7)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554456, ; uint32_t type_token_id (0x2000018)
		i32 87; uint32_t java_map_index (0x57)
	} ; 8
], align 4

@module13_managed_to_java_duplicates = internal dso_local constant [3 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554454, ; uint32_t type_token_id (0x2000016)
		i32 119; uint32_t java_map_index (0x77)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554457, ; uint32_t type_token_id (0x2000019)
		i32 87; uint32_t java_map_index (0x57)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554458, ; uint32_t type_token_id (0x200001a)
		i32 471; uint32_t java_map_index (0x1d7)
	} ; 2
], align 4

; Java to managed map
@map_java = dso_local local_unnamed_addr constant [530 x %struct.TypeMapJava] [
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554734, ; uint32_t type_token_id (0x200012e)
		i32 162; uint32_t java_name_index (0xa2)
	}, ; 0
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555195, ; uint32_t type_token_id (0x20002fb)
		i32 426; uint32_t java_name_index (0x1aa)
	}, ; 1
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554466, ; uint32_t type_token_id (0x2000022)
		i32 17; uint32_t java_name_index (0x11)
	}, ; 2
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 107; uint32_t java_name_index (0x6b)
	}, ; 3
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555115, ; uint32_t type_token_id (0x20002ab)
		i32 366; uint32_t java_name_index (0x16e)
	}, ; 4
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555053, ; uint32_t type_token_id (0x200026d)
		i32 325; uint32_t java_name_index (0x145)
	}, ; 5
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555100, ; uint32_t type_token_id (0x200029c)
		i32 357; uint32_t java_name_index (0x165)
	}, ; 6
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554732, ; uint32_t type_token_id (0x200012c)
		i32 160; uint32_t java_name_index (0xa0)
	}, ; 7
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554720, ; uint32_t type_token_id (0x2000120)
		i32 148; uint32_t java_name_index (0x94)
	}, ; 8
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 484; uint32_t java_name_index (0x1e4)
	}, ; 9
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554892, ; uint32_t type_token_id (0x20001cc)
		i32 258; uint32_t java_name_index (0x102)
	}, ; 10
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555147, ; uint32_t type_token_id (0x20002cb)
		i32 390; uint32_t java_name_index (0x186)
	}, ; 11
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554674, ; uint32_t type_token_id (0x20000f2)
		i32 125; uint32_t java_name_index (0x7d)
	}, ; 12
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554515, ; uint32_t type_token_id (0x2000053)
		i32 50; uint32_t java_name_index (0x32)
	}, ; 13
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554670, ; uint32_t type_token_id (0x20000ee)
		i32 122; uint32_t java_name_index (0x7a)
	}, ; 14
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554461, ; uint32_t type_token_id (0x200001d)
		i32 473; uint32_t java_name_index (0x1d9)
	}, ; 15
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554509, ; uint32_t type_token_id (0x200004d)
		i32 46; uint32_t java_name_index (0x2e)
	}, ; 16
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 78; uint32_t java_name_index (0x4e)
	}, ; 17
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554872, ; uint32_t type_token_id (0x20001b8)
		i32 249; uint32_t java_name_index (0xf9)
	}, ; 18
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 130; uint32_t java_name_index (0x82)
	}, ; 19
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554610, ; uint32_t type_token_id (0x20000b2)
		i32 91; uint32_t java_name_index (0x5b)
	}, ; 20
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555182, ; uint32_t type_token_id (0x20002ee)
		i32 415; uint32_t java_name_index (0x19f)
	}, ; 21
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554876, ; uint32_t type_token_id (0x20001bc)
		i32 252; uint32_t java_name_index (0xfc)
	}, ; 22
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554464, ; uint32_t type_token_id (0x2000020)
		i32 15; uint32_t java_name_index (0xf)
	}, ; 23
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554446, ; uint32_t type_token_id (0x200000e)
		i32 5; uint32_t java_name_index (0x5)
	}, ; 24
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554668, ; uint32_t type_token_id (0x20000ec)
		i32 455; uint32_t java_name_index (0x1c7)
	}, ; 25
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554724, ; uint32_t type_token_id (0x2000124)
		i32 152; uint32_t java_name_index (0x98)
	}, ; 26
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554489, ; uint32_t type_token_id (0x2000039)
		i32 489; uint32_t java_name_index (0x1e9)
	}, ; 27
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554577, ; uint32_t type_token_id (0x2000091)
		i32 70; uint32_t java_name_index (0x46)
	}, ; 28
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554448, ; uint32_t type_token_id (0x2000010)
		i32 6; uint32_t java_name_index (0x6)
	}, ; 29
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554479, ; uint32_t type_token_id (0x200002f)
		i32 28; uint32_t java_name_index (0x1c)
	}, ; 30
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554672, ; uint32_t type_token_id (0x20000f0)
		i32 457; uint32_t java_name_index (0x1c9)
	}, ; 31
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 309; uint32_t java_name_index (0x135)
	}, ; 32
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554662, ; uint32_t type_token_id (0x20000e6)
		i32 118; uint32_t java_name_index (0x76)
	}, ; 33
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554481, ; uint32_t type_token_id (0x2000031)
		i32 30; uint32_t java_name_index (0x1e)
	}, ; 34
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554504, ; uint32_t type_token_id (0x2000048)
		i32 43; uint32_t java_name_index (0x2b)
	}, ; 35
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index (0x3)
		i32 33554435, ; uint32_t type_token_id (0x2000003)
		i32 439; uint32_t java_name_index (0x1b7)
	}, ; 36
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554484, ; uint32_t type_token_id (0x2000034)
		i32 31; uint32_t java_name_index (0x1f)
	}, ; 37
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 242; uint32_t java_name_index (0xf2)
	}, ; 38
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554814, ; uint32_t type_token_id (0x200017e)
		i32 216; uint32_t java_name_index (0xd8)
	}, ; 39
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 353; uint32_t java_name_index (0x161)
	}, ; 40
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554601, ; uint32_t type_token_id (0x20000a9)
		i32 85; uint32_t java_name_index (0x55)
	}, ; 41
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554476, ; uint32_t type_token_id (0x200002c)
		i32 27; uint32_t java_name_index (0x1b)
	}, ; 42
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554893, ; uint32_t type_token_id (0x20001cd)
		i32 259; uint32_t java_name_index (0x103)
	}, ; 43
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554665, ; uint32_t type_token_id (0x20000e9)
		i32 452; uint32_t java_name_index (0x1c4)
	}, ; 44
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554826, ; uint32_t type_token_id (0x200018a)
		i32 223; uint32_t java_name_index (0xdf)
	}, ; 45
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554674, ; uint32_t type_token_id (0x20000f2)
		i32 459; uint32_t java_name_index (0x1cb)
	}, ; 46
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555203, ; uint32_t type_token_id (0x2000303)
		i32 433; uint32_t java_name_index (0x1b1)
	}, ; 47
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555055, ; uint32_t type_token_id (0x200026f)
		i32 326; uint32_t java_name_index (0x146)
	}, ; 48
	%struct.TypeMapJava {
		i32 10, ; uint32_t module_index (0xa)
		i32 33554455, ; uint32_t type_token_id (0x2000017)
		i32 502; uint32_t java_name_index (0x1f6)
	}, ; 49
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 359; uint32_t java_name_index (0x167)
	}, ; 50
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555190, ; uint32_t type_token_id (0x20002f6)
		i32 422; uint32_t java_name_index (0x1a6)
	}, ; 51
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 335; uint32_t java_name_index (0x14f)
	}, ; 52
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555126, ; uint32_t type_token_id (0x20002b6)
		i32 373; uint32_t java_name_index (0x175)
	}, ; 53
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554486, ; uint32_t type_token_id (0x2000036)
		i32 33; uint32_t java_name_index (0x21)
	}, ; 54
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554686, ; uint32_t type_token_id (0x20000fe)
		i32 464; uint32_t java_name_index (0x1d0)
	}, ; 55
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554976, ; uint32_t type_token_id (0x2000220)
		i32 273; uint32_t java_name_index (0x111)
	}, ; 56
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554842, ; uint32_t type_token_id (0x200019a)
		i32 234; uint32_t java_name_index (0xea)
	}, ; 57
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555189, ; uint32_t type_token_id (0x20002f5)
		i32 421; uint32_t java_name_index (0x1a5)
	}, ; 58
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554615, ; uint32_t type_token_id (0x20000b7)
		i32 93; uint32_t java_name_index (0x5d)
	}, ; 59
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554723, ; uint32_t type_token_id (0x2000123)
		i32 151; uint32_t java_name_index (0x97)
	}, ; 60
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554894, ; uint32_t type_token_id (0x20001ce)
		i32 260; uint32_t java_name_index (0x104)
	}, ; 61
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index (0x4)
		i32 33554765, ; uint32_t type_token_id (0x200014d)
		i32 445; uint32_t java_name_index (0x1bd)
	}, ; 62
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554760, ; uint32_t type_token_id (0x2000148)
		i32 182; uint32_t java_name_index (0xb6)
	}, ; 63
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555089, ; uint32_t type_token_id (0x2000291)
		i32 350; uint32_t java_name_index (0x15e)
	}, ; 64
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554511, ; uint32_t type_token_id (0x200004f)
		i32 48; uint32_t java_name_index (0x30)
	}, ; 65
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554962, ; uint32_t type_token_id (0x2000212)
		i32 271; uint32_t java_name_index (0x10f)
	}, ; 66
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index (0xb)
		i32 33554448, ; uint32_t type_token_id (0x2000010)
		i32 511; uint32_t java_name_index (0x1ff)
	}, ; 67
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554501, ; uint32_t type_token_id (0x2000045)
		i32 42; uint32_t java_name_index (0x2a)
	}, ; 68
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554500, ; uint32_t type_token_id (0x2000044)
		i32 41; uint32_t java_name_index (0x29)
	}, ; 69
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554490, ; uint32_t type_token_id (0x200003a)
		i32 35; uint32_t java_name_index (0x23)
	}, ; 70
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554474, ; uint32_t type_token_id (0x200002a)
		i32 480; uint32_t java_name_index (0x1e0)
	}, ; 71
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555122, ; uint32_t type_token_id (0x20002b2)
		i32 371; uint32_t java_name_index (0x173)
	}, ; 72
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555183, ; uint32_t type_token_id (0x20002ef)
		i32 416; uint32_t java_name_index (0x1a0)
	}, ; 73
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554812, ; uint32_t type_token_id (0x200017c)
		i32 214; uint32_t java_name_index (0xd6)
	}, ; 74
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554825, ; uint32_t type_token_id (0x2000189)
		i32 222; uint32_t java_name_index (0xde)
	}, ; 75
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554744, ; uint32_t type_token_id (0x2000138)
		i32 171; uint32_t java_name_index (0xab)
	}, ; 76
	%struct.TypeMapJava {
		i32 10, ; uint32_t module_index (0xa)
		i32 33554442, ; uint32_t type_token_id (0x200000a)
		i32 498; uint32_t java_name_index (0x1f2)
	}, ; 77
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554516, ; uint32_t type_token_id (0x2000054)
		i32 51; uint32_t java_name_index (0x33)
	}, ; 78
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554717, ; uint32_t type_token_id (0x200011d)
		i32 145; uint32_t java_name_index (0x91)
	}, ; 79
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 397; uint32_t java_name_index (0x18d)
	}, ; 80
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555138, ; uint32_t type_token_id (0x20002c2)
		i32 383; uint32_t java_name_index (0x17f)
	}, ; 81
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554479, ; uint32_t type_token_id (0x200002f)
		i32 483; uint32_t java_name_index (0x1e3)
	}, ; 82
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554703, ; uint32_t type_token_id (0x200010f)
		i32 137; uint32_t java_name_index (0x89)
	}, ; 83
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554437, ; uint32_t type_token_id (0x2000005)
		i32 1; uint32_t java_name_index (0x1)
	}, ; 84
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554469, ; uint32_t type_token_id (0x2000025)
		i32 20; uint32_t java_name_index (0x14)
	}, ; 85
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554813, ; uint32_t type_token_id (0x200017d)
		i32 215; uint32_t java_name_index (0xd7)
	}, ; 86
	%struct.TypeMapJava {
		i32 13, ; uint32_t module_index (0xd)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 529; uint32_t java_name_index (0x211)
	}, ; 87
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554519, ; uint32_t type_token_id (0x2000057)
		i32 52; uint32_t java_name_index (0x34)
	}, ; 88
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index (0xc)
		i32 33554437, ; uint32_t type_token_id (0x2000005)
		i32 517; uint32_t java_name_index (0x205)
	}, ; 89
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554626, ; uint32_t type_token_id (0x20000c2)
		i32 98; uint32_t java_name_index (0x62)
	}, ; 90
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554840, ; uint32_t type_token_id (0x2000198)
		i32 233; uint32_t java_name_index (0xe9)
	}, ; 91
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554945, ; uint32_t type_token_id (0x2000201)
		i32 267; uint32_t java_name_index (0x10b)
	}, ; 92
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555037, ; uint32_t type_token_id (0x200025d)
		i32 312; uint32_t java_name_index (0x138)
	}, ; 93
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 414; uint32_t java_name_index (0x19e)
	}, ; 94
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555160, ; uint32_t type_token_id (0x20002d8)
		i32 399; uint32_t java_name_index (0x18f)
	}, ; 95
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554465, ; uint32_t type_token_id (0x2000021)
		i32 16; uint32_t java_name_index (0x10)
	}, ; 96
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index (0x3)
		i32 33554436, ; uint32_t type_token_id (0x2000004)
		i32 440; uint32_t java_name_index (0x1b8)
	}, ; 97
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555185, ; uint32_t type_token_id (0x20002f1)
		i32 418; uint32_t java_name_index (0x1a2)
	}, ; 98
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555117, ; uint32_t type_token_id (0x20002ad)
		i32 367; uint32_t java_name_index (0x16f)
	}, ; 99
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 175; uint32_t java_name_index (0xaf)
	}, ; 100
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555202, ; uint32_t type_token_id (0x2000302)
		i32 432; uint32_t java_name_index (0x1b0)
	}, ; 101
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554718, ; uint32_t type_token_id (0x200011e)
		i32 146; uint32_t java_name_index (0x92)
	}, ; 102
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555205, ; uint32_t type_token_id (0x2000305)
		i32 435; uint32_t java_name_index (0x1b3)
	}, ; 103
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554727, ; uint32_t type_token_id (0x2000127)
		i32 155; uint32_t java_name_index (0x9b)
	}, ; 104
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554448, ; uint32_t type_token_id (0x2000010)
		i32 62; uint32_t java_name_index (0x3e)
	}, ; 105
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555192, ; uint32_t type_token_id (0x20002f8)
		i32 424; uint32_t java_name_index (0x1a8)
	}, ; 106
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554657, ; uint32_t type_token_id (0x20000e1)
		i32 113; uint32_t java_name_index (0x71)
	}, ; 107
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555038, ; uint32_t type_token_id (0x200025e)
		i32 313; uint32_t java_name_index (0x139)
	}, ; 108
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554979, ; uint32_t type_token_id (0x2000223)
		i32 276; uint32_t java_name_index (0x114)
	}, ; 109
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 79; uint32_t java_name_index (0x4f)
	}, ; 110
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554728, ; uint32_t type_token_id (0x2000128)
		i32 156; uint32_t java_name_index (0x9c)
	}, ; 111
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555010, ; uint32_t type_token_id (0x2000242)
		i32 298; uint32_t java_name_index (0x12a)
	}, ; 112
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554444, ; uint32_t type_token_id (0x200000c)
		i32 4; uint32_t java_name_index (0x4)
	}, ; 113
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index (0xc)
		i32 33554436, ; uint32_t type_token_id (0x2000004)
		i32 516; uint32_t java_name_index (0x204)
	}, ; 114
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555198, ; uint32_t type_token_id (0x20002fe)
		i32 429; uint32_t java_name_index (0x1ad)
	}, ; 115
	%struct.TypeMapJava {
		i32 13, ; uint32_t module_index (0xd)
		i32 33554449, ; uint32_t type_token_id (0x2000011)
		i32 523; uint32_t java_name_index (0x20b)
	}, ; 116
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 220; uint32_t java_name_index (0xdc)
	}, ; 117
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554491, ; uint32_t type_token_id (0x200003b)
		i32 36; uint32_t java_name_index (0x24)
	}, ; 118
	%struct.TypeMapJava {
		i32 13, ; uint32_t module_index (0xd)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 527; uint32_t java_name_index (0x20f)
	}, ; 119
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554678, ; uint32_t type_token_id (0x20000f6)
		i32 461; uint32_t java_name_index (0x1cd)
	}, ; 120
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554986, ; uint32_t type_token_id (0x200022a)
		i32 282; uint32_t java_name_index (0x11a)
	}, ; 121
	%struct.TypeMapJava {
		i32 13, ; uint32_t module_index (0xd)
		i32 33554448, ; uint32_t type_token_id (0x2000010)
		i32 522; uint32_t java_name_index (0x20a)
	}, ; 122
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555145, ; uint32_t type_token_id (0x20002c9)
		i32 388; uint32_t java_name_index (0x184)
	}, ; 123
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554794, ; uint32_t type_token_id (0x200016a)
		i32 204; uint32_t java_name_index (0xcc)
	}, ; 124
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554983, ; uint32_t type_token_id (0x2000227)
		i32 279; uint32_t java_name_index (0x117)
	}, ; 125
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index (0x3)
		i32 33554440, ; uint32_t type_token_id (0x2000008)
		i32 442; uint32_t java_name_index (0x1ba)
	}, ; 126
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554646, ; uint32_t type_token_id (0x20000d6)
		i32 105; uint32_t java_name_index (0x69)
	}, ; 127
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554898, ; uint32_t type_token_id (0x20001d2)
		i32 262; uint32_t java_name_index (0x106)
	}, ; 128
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555133, ; uint32_t type_token_id (0x20002bd)
		i32 379; uint32_t java_name_index (0x17b)
	}, ; 129
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554819, ; uint32_t type_token_id (0x2000183)
		i32 219; uint32_t java_name_index (0xdb)
	}, ; 130
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555075, ; uint32_t type_token_id (0x2000283)
		i32 340; uint32_t java_name_index (0x154)
	}, ; 131
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555043, ; uint32_t type_token_id (0x2000263)
		i32 317; uint32_t java_name_index (0x13d)
	}, ; 132
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index (0x9)
		i32 33554478, ; uint32_t type_token_id (0x200002e)
		i32 497; uint32_t java_name_index (0x1f1)
	}, ; 133
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554460, ; uint32_t type_token_id (0x200001c)
		i32 472; uint32_t java_name_index (0x1d8)
	}, ; 134
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 360; uint32_t java_name_index (0x168)
	}, ; 135
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554495, ; uint32_t type_token_id (0x200003f)
		i32 38; uint32_t java_name_index (0x26)
	}, ; 136
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554817, ; uint32_t type_token_id (0x2000181)
		i32 218; uint32_t java_name_index (0xda)
	}, ; 137
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 344; uint32_t java_name_index (0x158)
	}, ; 138
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554803, ; uint32_t type_token_id (0x2000173)
		i32 209; uint32_t java_name_index (0xd1)
	}, ; 139
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554488, ; uint32_t type_token_id (0x2000038)
		i32 488; uint32_t java_name_index (0x1e8)
	}, ; 140
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554595, ; uint32_t type_token_id (0x20000a3)
		i32 80; uint32_t java_name_index (0x50)
	}, ; 141
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554805, ; uint32_t type_token_id (0x2000175)
		i32 211; uint32_t java_name_index (0xd3)
	}, ; 142
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554733, ; uint32_t type_token_id (0x200012d)
		i32 161; uint32_t java_name_index (0xa1)
	}, ; 143
	%struct.TypeMapJava {
		i32 10, ; uint32_t module_index (0xa)
		i32 33554458, ; uint32_t type_token_id (0x200001a)
		i32 505; uint32_t java_name_index (0x1f9)
	}, ; 144
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554673, ; uint32_t type_token_id (0x20000f1)
		i32 458; uint32_t java_name_index (0x1ca)
	}, ; 145
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554520, ; uint32_t type_token_id (0x2000058)
		i32 53; uint32_t java_name_index (0x35)
	}, ; 146
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554470, ; uint32_t type_token_id (0x2000026)
		i32 21; uint32_t java_name_index (0x15)
	}, ; 147
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554457, ; uint32_t type_token_id (0x2000019)
		i32 10; uint32_t java_name_index (0xa)
	}, ; 148
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554461, ; uint32_t type_token_id (0x200001d)
		i32 12; uint32_t java_name_index (0xc)
	}, ; 149
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 334; uint32_t java_name_index (0x14e)
	}, ; 150
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554786, ; uint32_t type_token_id (0x2000162)
		i32 199; uint32_t java_name_index (0xc7)
	}, ; 151
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 246; uint32_t java_name_index (0xf6)
	}, ; 152
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554666, ; uint32_t type_token_id (0x20000ea)
		i32 453; uint32_t java_name_index (0x1c5)
	}, ; 153
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554775, ; uint32_t type_token_id (0x2000157)
		i32 192; uint32_t java_name_index (0xc0)
	}, ; 154
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 413; uint32_t java_name_index (0x19d)
	}, ; 155
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554735, ; uint32_t type_token_id (0x200012f)
		i32 163; uint32_t java_name_index (0xa3)
	}, ; 156
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554777, ; uint32_t type_token_id (0x2000159)
		i32 194; uint32_t java_name_index (0xc2)
	}, ; 157
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index (0xb)
		i32 33554436, ; uint32_t type_token_id (0x2000004)
		i32 508; uint32_t java_name_index (0x1fc)
	}, ; 158
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554575, ; uint32_t type_token_id (0x200008f)
		i32 69; uint32_t java_name_index (0x45)
	}, ; 159
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554606, ; uint32_t type_token_id (0x20000ae)
		i32 89; uint32_t java_name_index (0x59)
	}, ; 160
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554767, ; uint32_t type_token_id (0x200014f)
		i32 188; uint32_t java_name_index (0xbc)
	}, ; 161
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555136, ; uint32_t type_token_id (0x20002c0)
		i32 381; uint32_t java_name_index (0x17d)
	}, ; 162
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554473, ; uint32_t type_token_id (0x2000029)
		i32 24; uint32_t java_name_index (0x18)
	}, ; 163
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554778, ; uint32_t type_token_id (0x200015a)
		i32 195; uint32_t java_name_index (0xc3)
	}, ; 164
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554458, ; uint32_t type_token_id (0x200001a)
		i32 470; uint32_t java_name_index (0x1d6)
	}, ; 165
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555204, ; uint32_t type_token_id (0x2000304)
		i32 434; uint32_t java_name_index (0x1b2)
	}, ; 166
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554521, ; uint32_t type_token_id (0x2000059)
		i32 54; uint32_t java_name_index (0x36)
	}, ; 167
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554741, ; uint32_t type_token_id (0x2000135)
		i32 168; uint32_t java_name_index (0xa8)
	}, ; 168
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554679, ; uint32_t type_token_id (0x20000f7)
		i32 462; uint32_t java_name_index (0x1ce)
	}, ; 169
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index (0xc)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 515; uint32_t java_name_index (0x203)
	}, ; 170
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554596, ; uint32_t type_token_id (0x20000a4)
		i32 81; uint32_t java_name_index (0x51)
	}, ; 171
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554478, ; uint32_t type_token_id (0x200002e)
		i32 482; uint32_t java_name_index (0x1e2)
	}, ; 172
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554934, ; uint32_t type_token_id (0x20001f6)
		i32 265; uint32_t java_name_index (0x109)
	}, ; 173
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554830, ; uint32_t type_token_id (0x200018e)
		i32 225; uint32_t java_name_index (0xe1)
	}, ; 174
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554498, ; uint32_t type_token_id (0x2000042)
		i32 494; uint32_t java_name_index (0x1ee)
	}, ; 175
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555170, ; uint32_t type_token_id (0x20002e2)
		i32 407; uint32_t java_name_index (0x197)
	}, ; 176
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554988, ; uint32_t type_token_id (0x200022c)
		i32 284; uint32_t java_name_index (0x11c)
	}, ; 177
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 76; uint32_t java_name_index (0x4c)
	}, ; 178
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554667, ; uint32_t type_token_id (0x20000eb)
		i32 454; uint32_t java_name_index (0x1c6)
	}, ; 179
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555007, ; uint32_t type_token_id (0x200023f)
		i32 296; uint32_t java_name_index (0x128)
	}, ; 180
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555072, ; uint32_t type_token_id (0x2000280)
		i32 337; uint32_t java_name_index (0x151)
	}, ; 181
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554450, ; uint32_t type_token_id (0x2000012)
		i32 64; uint32_t java_name_index (0x40)
	}, ; 182
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555049, ; uint32_t type_token_id (0x2000269)
		i32 321; uint32_t java_name_index (0x141)
	}, ; 183
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555197, ; uint32_t type_token_id (0x20002fd)
		i32 428; uint32_t java_name_index (0x1ac)
	}, ; 184
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index (0x3)
		i32 33554441, ; uint32_t type_token_id (0x2000009)
		i32 443; uint32_t java_name_index (0x1bb)
	}, ; 185
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555127, ; uint32_t type_token_id (0x20002b7)
		i32 374; uint32_t java_name_index (0x176)
	}, ; 186
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554990, ; uint32_t type_token_id (0x200022e)
		i32 286; uint32_t java_name_index (0x11e)
	}, ; 187
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 247; uint32_t java_name_index (0xf7)
	}, ; 188
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554654, ; uint32_t type_token_id (0x20000de)
		i32 110; uint32_t java_name_index (0x6e)
	}, ; 189
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554656, ; uint32_t type_token_id (0x20000e0)
		i32 112; uint32_t java_name_index (0x70)
	}, ; 190
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554603, ; uint32_t type_token_id (0x20000ab)
		i32 87; uint32_t java_name_index (0x57)
	}, ; 191
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555149, ; uint32_t type_token_id (0x20002cd)
		i32 392; uint32_t java_name_index (0x188)
	}, ; 192
	%struct.TypeMapJava {
		i32 13, ; uint32_t module_index (0xd)
		i32 33554452, ; uint32_t type_token_id (0x2000014)
		i32 526; uint32_t java_name_index (0x20e)
	}, ; 193
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554936, ; uint32_t type_token_id (0x20001f8)
		i32 266; uint32_t java_name_index (0x10a)
	}, ; 194
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554579, ; uint32_t type_token_id (0x2000093)
		i32 71; uint32_t java_name_index (0x47)
	}, ; 195
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554779, ; uint32_t type_token_id (0x200015b)
		i32 196; uint32_t java_name_index (0xc4)
	}, ; 196
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555124, ; uint32_t type_token_id (0x20002b4)
		i32 372; uint32_t java_name_index (0x174)
	}, ; 197
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 346; uint32_t java_name_index (0x15a)
	}, ; 198
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 293; uint32_t java_name_index (0x125)
	}, ; 199
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554719, ; uint32_t type_token_id (0x200011f)
		i32 147; uint32_t java_name_index (0x93)
	}, ; 200
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554636, ; uint32_t type_token_id (0x20000cc)
		i32 101; uint32_t java_name_index (0x65)
	}, ; 201
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554726, ; uint32_t type_token_id (0x2000126)
		i32 154; uint32_t java_name_index (0x9a)
	}, ; 202
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555143, ; uint32_t type_token_id (0x20002c7)
		i32 386; uint32_t java_name_index (0x182)
	}, ; 203
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 352; uint32_t java_name_index (0x160)
	}, ; 204
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554725, ; uint32_t type_token_id (0x2000125)
		i32 153; uint32_t java_name_index (0x99)
	}, ; 205
	%struct.TypeMapJava {
		i32 10, ; uint32_t module_index (0xa)
		i32 33554445, ; uint32_t type_token_id (0x200000d)
		i32 499; uint32_t java_name_index (0x1f3)
	}, ; 206
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555144, ; uint32_t type_token_id (0x20002c8)
		i32 387; uint32_t java_name_index (0x183)
	}, ; 207
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554848, ; uint32_t type_token_id (0x20001a0)
		i32 235; uint32_t java_name_index (0xeb)
	}, ; 208
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555008, ; uint32_t type_token_id (0x2000240)
		i32 297; uint32_t java_name_index (0x129)
	}, ; 209
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554833, ; uint32_t type_token_id (0x2000191)
		i32 227; uint32_t java_name_index (0xe3)
	}, ; 210
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554852, ; uint32_t type_token_id (0x20001a4)
		i32 238; uint32_t java_name_index (0xee)
	}, ; 211
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554747, ; uint32_t type_token_id (0x200013b)
		i32 174; uint32_t java_name_index (0xae)
	}, ; 212
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555051, ; uint32_t type_token_id (0x200026b)
		i32 323; uint32_t java_name_index (0x143)
	}, ; 213
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554774, ; uint32_t type_token_id (0x2000156)
		i32 191; uint32_t java_name_index (0xbf)
	}, ; 214
	%struct.TypeMapJava {
		i32 13, ; uint32_t module_index (0xd)
		i32 33554450, ; uint32_t type_token_id (0x2000012)
		i32 524; uint32_t java_name_index (0x20c)
	}, ; 215
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554462, ; uint32_t type_token_id (0x200001e)
		i32 13; uint32_t java_name_index (0xd)
	}, ; 216
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 351; uint32_t java_name_index (0x15f)
	}, ; 217
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554471, ; uint32_t type_token_id (0x2000027)
		i32 448; uint32_t java_name_index (0x1c0)
	}, ; 218
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554984, ; uint32_t type_token_id (0x2000228)
		i32 280; uint32_t java_name_index (0x118)
	}, ; 219
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554878, ; uint32_t type_token_id (0x20001be)
		i32 253; uint32_t java_name_index (0xfd)
	}, ; 220
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555196, ; uint32_t type_token_id (0x20002fc)
		i32 427; uint32_t java_name_index (0x1ab)
	}, ; 221
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554799, ; uint32_t type_token_id (0x200016f)
		i32 206; uint32_t java_name_index (0xce)
	}, ; 222
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554473, ; uint32_t type_token_id (0x2000029)
		i32 479; uint32_t java_name_index (0x1df)
	}, ; 223
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555184, ; uint32_t type_token_id (0x20002f0)
		i32 417; uint32_t java_name_index (0x1a1)
	}, ; 224
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554602, ; uint32_t type_token_id (0x20000aa)
		i32 86; uint32_t java_name_index (0x56)
	}, ; 225
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555167, ; uint32_t type_token_id (0x20002df)
		i32 404; uint32_t java_name_index (0x194)
	}, ; 226
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554474, ; uint32_t type_token_id (0x200002a)
		i32 25; uint32_t java_name_index (0x19)
	}, ; 227
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554637, ; uint32_t type_token_id (0x20000cd)
		i32 102; uint32_t java_name_index (0x66)
	}, ; 228
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555168, ; uint32_t type_token_id (0x20002e0)
		i32 405; uint32_t java_name_index (0x195)
	}, ; 229
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554875, ; uint32_t type_token_id (0x20001bb)
		i32 251; uint32_t java_name_index (0xfb)
	}, ; 230
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555006, ; uint32_t type_token_id (0x200023e)
		i32 295; uint32_t java_name_index (0x127)
	}, ; 231
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554764, ; uint32_t type_token_id (0x200014c)
		i32 186; uint32_t java_name_index (0xba)
	}, ; 232
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 177; uint32_t java_name_index (0xb1)
	}, ; 233
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 230; uint32_t java_name_index (0xe6)
	}, ; 234
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555074, ; uint32_t type_token_id (0x2000282)
		i32 339; uint32_t java_name_index (0x153)
	}, ; 235
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554740, ; uint32_t type_token_id (0x2000134)
		i32 167; uint32_t java_name_index (0xa7)
	}, ; 236
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555005, ; uint32_t type_token_id (0x200023d)
		i32 294; uint32_t java_name_index (0x126)
	}, ; 237
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554787, ; uint32_t type_token_id (0x2000163)
		i32 200; uint32_t java_name_index (0xc8)
	}, ; 238
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554985, ; uint32_t type_token_id (0x2000229)
		i32 281; uint32_t java_name_index (0x119)
	}, ; 239
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554506, ; uint32_t type_token_id (0x200004a)
		i32 45; uint32_t java_name_index (0x2d)
	}, ; 240
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555039, ; uint32_t type_token_id (0x200025f)
		i32 314; uint32_t java_name_index (0x13a)
	}, ; 241
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554730, ; uint32_t type_token_id (0x200012a)
		i32 158; uint32_t java_name_index (0x9e)
	}, ; 242
	%struct.TypeMapJava {
		i32 10, ; uint32_t module_index (0xa)
		i32 33554461, ; uint32_t type_token_id (0x200001d)
		i32 507; uint32_t java_name_index (0x1fb)
	}, ; 243
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 134; uint32_t java_name_index (0x86)
	}, ; 244
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 254; uint32_t java_name_index (0xfe)
	}, ; 245
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554664, ; uint32_t type_token_id (0x20000e8)
		i32 451; uint32_t java_name_index (0x1c3)
	}, ; 246
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554773, ; uint32_t type_token_id (0x2000155)
		i32 190; uint32_t java_name_index (0xbe)
	}, ; 247
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555119, ; uint32_t type_token_id (0x20002af)
		i32 369; uint32_t java_name_index (0x171)
	}, ; 248
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index (0x4)
		i32 33554704, ; uint32_t type_token_id (0x2000110)
		i32 444; uint32_t java_name_index (0x1bc)
	}, ; 249
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 419; uint32_t java_name_index (0x1a3)
	}, ; 250
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554702, ; uint32_t type_token_id (0x200010e)
		i32 136; uint32_t java_name_index (0x88)
	}, ; 251
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554653, ; uint32_t type_token_id (0x20000dd)
		i32 109; uint32_t java_name_index (0x6d)
	}, ; 252
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554788, ; uint32_t type_token_id (0x2000164)
		i32 201; uint32_t java_name_index (0xc9)
	}, ; 253
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554485, ; uint32_t type_token_id (0x2000035)
		i32 32; uint32_t java_name_index (0x20)
	}, ; 254
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554493, ; uint32_t type_token_id (0x200003d)
		i32 491; uint32_t java_name_index (0x1eb)
	}, ; 255
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554762, ; uint32_t type_token_id (0x200014a)
		i32 184; uint32_t java_name_index (0xb8)
	}, ; 256
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555050, ; uint32_t type_token_id (0x200026a)
		i32 322; uint32_t java_name_index (0x142)
	}, ; 257
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 97; uint32_t java_name_index (0x61)
	}, ; 258
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555158, ; uint32_t type_token_id (0x20002d6)
		i32 398; uint32_t java_name_index (0x18e)
	}, ; 259
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554824, ; uint32_t type_token_id (0x2000188)
		i32 221; uint32_t java_name_index (0xdd)
	}, ; 260
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555000, ; uint32_t type_token_id (0x2000238)
		i32 291; uint32_t java_name_index (0x123)
	}, ; 261
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555088, ; uint32_t type_token_id (0x2000290)
		i32 349; uint32_t java_name_index (0x15d)
	}, ; 262
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554514, ; uint32_t type_token_id (0x2000052)
		i32 49; uint32_t java_name_index (0x31)
	}, ; 263
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554832, ; uint32_t type_token_id (0x2000190)
		i32 226; uint32_t java_name_index (0xe2)
	}, ; 264
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555166, ; uint32_t type_token_id (0x20002de)
		i32 403; uint32_t java_name_index (0x193)
	}, ; 265
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 95; uint32_t java_name_index (0x5f)
	}, ; 266
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555107, ; uint32_t type_token_id (0x20002a3)
		i32 361; uint32_t java_name_index (0x169)
	}, ; 267
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555022, ; uint32_t type_token_id (0x200024e)
		i32 305; uint32_t java_name_index (0x131)
	}, ; 268
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554851, ; uint32_t type_token_id (0x20001a3)
		i32 237; uint32_t java_name_index (0xed)
	}, ; 269
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554617, ; uint32_t type_token_id (0x20000b9)
		i32 94; uint32_t java_name_index (0x5e)
	}, ; 270
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 304; uint32_t java_name_index (0x130)
	}, ; 271
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554525, ; uint32_t type_token_id (0x200005d)
		i32 57; uint32_t java_name_index (0x39)
	}, ; 272
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 178; uint32_t java_name_index (0xb2)
	}, ; 273
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555071, ; uint32_t type_token_id (0x200027f)
		i32 336; uint32_t java_name_index (0x150)
	}, ; 274
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554816, ; uint32_t type_token_id (0x2000180)
		i32 217; uint32_t java_name_index (0xd9)
	}, ; 275
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 108; uint32_t java_name_index (0x6c)
	}, ; 276
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554834, ; uint32_t type_token_id (0x2000192)
		i32 228; uint32_t java_name_index (0xe4)
	}, ; 277
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555024, ; uint32_t type_token_id (0x2000250)
		i32 307; uint32_t java_name_index (0x133)
	}, ; 278
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555112, ; uint32_t type_token_id (0x20002a8)
		i32 364; uint32_t java_name_index (0x16c)
	}, ; 279
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554789, ; uint32_t type_token_id (0x2000165)
		i32 202; uint32_t java_name_index (0xca)
	}, ; 280
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554746, ; uint32_t type_token_id (0x200013a)
		i32 173; uint32_t java_name_index (0xad)
	}, ; 281
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555002, ; uint32_t type_token_id (0x200023a)
		i32 292; uint32_t java_name_index (0x124)
	}, ; 282
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554471, ; uint32_t type_token_id (0x2000027)
		i32 22; uint32_t java_name_index (0x16)
	}, ; 283
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555040, ; uint32_t type_token_id (0x2000260)
		i32 315; uint32_t java_name_index (0x13b)
	}, ; 284
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555012, ; uint32_t type_token_id (0x2000244)
		i32 299; uint32_t java_name_index (0x12b)
	}, ; 285
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 468; uint32_t java_name_index (0x1d4)
	}, ; 286
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 476; uint32_t java_name_index (0x1dc)
	}, ; 287
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554810, ; uint32_t type_token_id (0x200017a)
		i32 212; uint32_t java_name_index (0xd4)
	}, ; 288
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554483, ; uint32_t type_token_id (0x2000033)
		i32 485; uint32_t java_name_index (0x1e5)
	}, ; 289
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554641, ; uint32_t type_token_id (0x20000d1)
		i32 104; uint32_t java_name_index (0x68)
	}, ; 290
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554528, ; uint32_t type_token_id (0x2000060)
		i32 59; uint32_t java_name_index (0x3b)
	}, ; 291
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 348; uint32_t java_name_index (0x15c)
	}, ; 292
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 65; uint32_t java_name_index (0x41)
	}, ; 293
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554729, ; uint32_t type_token_id (0x2000129)
		i32 157; uint32_t java_name_index (0x9d)
	}, ; 294
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555137, ; uint32_t type_token_id (0x20002c1)
		i32 382; uint32_t java_name_index (0x17e)
	}, ; 295
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555132, ; uint32_t type_token_id (0x20002bc)
		i32 378; uint32_t java_name_index (0x17a)
	}, ; 296
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555056, ; uint32_t type_token_id (0x2000270)
		i32 327; uint32_t java_name_index (0x147)
	}, ; 297
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554835, ; uint32_t type_token_id (0x2000193)
		i32 229; uint32_t java_name_index (0xe5)
	}, ; 298
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 140; uint32_t java_name_index (0x8c)
	}, ; 299
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555023, ; uint32_t type_token_id (0x200024f)
		i32 306; uint32_t java_name_index (0x132)
	}, ; 300
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 490; uint32_t java_name_index (0x1ea)
	}, ; 301
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 61; uint32_t java_name_index (0x3d)
	}, ; 302
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index (0xb)
		i32 33554437, ; uint32_t type_token_id (0x2000005)
		i32 509; uint32_t java_name_index (0x1fd)
	}, ; 303
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555048, ; uint32_t type_token_id (0x2000268)
		i32 320; uint32_t java_name_index (0x140)
	}, ; 304
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554772, ; uint32_t type_token_id (0x2000154)
		i32 189; uint32_t java_name_index (0xbd)
	}, ; 305
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 475; uint32_t java_name_index (0x1db)
	}, ; 306
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555172, ; uint32_t type_token_id (0x20002e4)
		i32 409; uint32_t java_name_index (0x199)
	}, ; 307
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554659, ; uint32_t type_token_id (0x20000e3)
		i32 115; uint32_t java_name_index (0x73)
	}, ; 308
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555191, ; uint32_t type_token_id (0x20002f7)
		i32 423; uint32_t java_name_index (0x1a7)
	}, ; 309
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554675, ; uint32_t type_token_id (0x20000f3)
		i32 460; uint32_t java_name_index (0x1cc)
	}, ; 310
	%struct.TypeMapJava {
		i32 10, ; uint32_t module_index (0xa)
		i32 33554457, ; uint32_t type_token_id (0x2000019)
		i32 504; uint32_t java_name_index (0x1f8)
	}, ; 311
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554457, ; uint32_t type_token_id (0x2000019)
		i32 469; uint32_t java_name_index (0x1d5)
	}, ; 312
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554839, ; uint32_t type_token_id (0x2000197)
		i32 232; uint32_t java_name_index (0xe8)
	}, ; 313
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555206, ; uint32_t type_token_id (0x2000306)
		i32 436; uint32_t java_name_index (0x1b4)
	}, ; 314
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555096, ; uint32_t type_token_id (0x2000298)
		i32 354; uint32_t java_name_index (0x162)
	}, ; 315
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554669, ; uint32_t type_token_id (0x20000ed)
		i32 121; uint32_t java_name_index (0x79)
	}, ; 316
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555135, ; uint32_t type_token_id (0x20002bf)
		i32 380; uint32_t java_name_index (0x17c)
	}, ; 317
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554510, ; uint32_t type_token_id (0x200004e)
		i32 47; uint32_t java_name_index (0x2f)
	}, ; 318
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554763, ; uint32_t type_token_id (0x200014b)
		i32 185; uint32_t java_name_index (0xb9)
	}, ; 319
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554571, ; uint32_t type_token_id (0x200008b)
		i32 66; uint32_t java_name_index (0x42)
	}, ; 320
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554745, ; uint32_t type_token_id (0x2000139)
		i32 172; uint32_t java_name_index (0xac)
	}, ; 321
	%struct.TypeMapJava {
		i32 8, ; uint32_t module_index (0x8)
		i32 33554438, ; uint32_t type_token_id (0x2000006)
		i32 495; uint32_t java_name_index (0x1ef)
	}, ; 322
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554886, ; uint32_t type_token_id (0x20001c6)
		i32 257; uint32_t java_name_index (0x101)
	}, ; 323
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554472, ; uint32_t type_token_id (0x2000028)
		i32 478; uint32_t java_name_index (0x1de)
	}, ; 324
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index (0xc)
		i32 33554438, ; uint32_t type_token_id (0x2000006)
		i32 518; uint32_t java_name_index (0x206)
	}, ; 325
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 139; uint32_t java_name_index (0x8b)
	}, ; 326
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 310; uint32_t java_name_index (0x136)
	}, ; 327
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 240; uint32_t java_name_index (0xf0)
	}, ; 328
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554670, ; uint32_t type_token_id (0x20000ee)
		i32 456; uint32_t java_name_index (0x1c8)
	}, ; 329
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554663, ; uint32_t type_token_id (0x20000e7)
		i32 119; uint32_t java_name_index (0x77)
	}, ; 330
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 256; uint32_t java_name_index (0x100)
	}, ; 331
	%struct.TypeMapJava {
		i32 10, ; uint32_t module_index (0xa)
		i32 33554454, ; uint32_t type_token_id (0x2000016)
		i32 501; uint32_t java_name_index (0x1f5)
	}, ; 332
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555146, ; uint32_t type_token_id (0x20002ca)
		i32 389; uint32_t java_name_index (0x185)
	}, ; 333
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554996, ; uint32_t type_token_id (0x2000234)
		i32 289; uint32_t java_name_index (0x121)
	}, ; 334
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555120, ; uint32_t type_token_id (0x20002b0)
		i32 370; uint32_t java_name_index (0x172)
	}, ; 335
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554975, ; uint32_t type_token_id (0x200021f)
		i32 272; uint32_t java_name_index (0x110)
	}, ; 336
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554609, ; uint32_t type_token_id (0x20000b1)
		i32 90; uint32_t java_name_index (0x5a)
	}, ; 337
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554634, ; uint32_t type_token_id (0x20000ca)
		i32 100; uint32_t java_name_index (0x64)
	}, ; 338
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555066, ; uint32_t type_token_id (0x200027a)
		i32 333; uint32_t java_name_index (0x14d)
	}, ; 339
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554721, ; uint32_t type_token_id (0x2000121)
		i32 149; uint32_t java_name_index (0x95)
	}, ; 340
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555046, ; uint32_t type_token_id (0x2000266)
		i32 318; uint32_t java_name_index (0x13e)
	}, ; 341
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555085, ; uint32_t type_token_id (0x200028d)
		i32 347; uint32_t java_name_index (0x15b)
	}, ; 342
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555060, ; uint32_t type_token_id (0x2000274)
		i32 331; uint32_t java_name_index (0x14b)
	}, ; 343
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555154, ; uint32_t type_token_id (0x20002d2)
		i32 395; uint32_t java_name_index (0x18b)
	}, ; 344
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555207, ; uint32_t type_token_id (0x2000307)
		i32 437; uint32_t java_name_index (0x1b5)
	}, ; 345
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 75; uint32_t java_name_index (0x4b)
	}, ; 346
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554505, ; uint32_t type_token_id (0x2000049)
		i32 44; uint32_t java_name_index (0x2c)
	}, ; 347
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 106; uint32_t java_name_index (0x6a)
	}, ; 348
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554459, ; uint32_t type_token_id (0x200001b)
		i32 471; uint32_t java_name_index (0x1d7)
	}, ; 349
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554522, ; uint32_t type_token_id (0x200005a)
		i32 55; uint32_t java_name_index (0x37)
	}, ; 350
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554660, ; uint32_t type_token_id (0x20000e4)
		i32 116; uint32_t java_name_index (0x74)
	}, ; 351
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554673, ; uint32_t type_token_id (0x20000f1)
		i32 124; uint32_t java_name_index (0x7c)
	}, ; 352
	%struct.TypeMapJava {
		i32 5, ; uint32_t module_index (0x5)
		i32 33554437, ; uint32_t type_token_id (0x2000005)
		i32 446; uint32_t java_name_index (0x1be)
	}, ; 353
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554994, ; uint32_t type_token_id (0x2000232)
		i32 288; uint32_t java_name_index (0x120)
	}, ; 354
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 88; uint32_t java_name_index (0x58)
	}, ; 355
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555061, ; uint32_t type_token_id (0x2000275)
		i32 332; uint32_t java_name_index (0x14c)
	}, ; 356
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 133; uint32_t java_name_index (0x85)
	}, ; 357
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555176, ; uint32_t type_token_id (0x20002e8)
		i32 412; uint32_t java_name_index (0x19c)
	}, ; 358
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554496, ; uint32_t type_token_id (0x2000040)
		i32 39; uint32_t java_name_index (0x27)
	}, ; 359
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554715, ; uint32_t type_token_id (0x200011b)
		i32 144; uint32_t java_name_index (0x90)
	}, ; 360
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554742, ; uint32_t type_token_id (0x2000136)
		i32 169; uint32_t java_name_index (0xa9)
	}, ; 361
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 365; uint32_t java_name_index (0x16d)
	}, ; 362
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554853, ; uint32_t type_token_id (0x20001a5)
		i32 239; uint32_t java_name_index (0xef)
	}, ; 363
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554600, ; uint32_t type_token_id (0x20000a8)
		i32 84; uint32_t java_name_index (0x54)
	}, ; 364
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554442, ; uint32_t type_token_id (0x200000a)
		i32 60; uint32_t java_name_index (0x3c)
	}, ; 365
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555188, ; uint32_t type_token_id (0x20002f4)
		i32 420; uint32_t java_name_index (0x1a4)
	}, ; 366
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555052, ; uint32_t type_token_id (0x200026c)
		i32 324; uint32_t java_name_index (0x144)
	}, ; 367
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555199, ; uint32_t type_token_id (0x20002ff)
		i32 430; uint32_t java_name_index (0x1ae)
	}, ; 368
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554435, ; uint32_t type_token_id (0x2000003)
		i32 0; uint32_t java_name_index (0x0)
	}, ; 369
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554499, ; uint32_t type_token_id (0x2000043)
		i32 40; uint32_t java_name_index (0x28)
	}, ; 370
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 308; uint32_t java_name_index (0x134)
	}, ; 371
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555148, ; uint32_t type_token_id (0x20002cc)
		i32 391; uint32_t java_name_index (0x187)
	}, ; 372
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 302; uint32_t java_name_index (0x12e)
	}, ; 373
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index (0xb)
		i32 33554447, ; uint32_t type_token_id (0x200000f)
		i32 510; uint32_t java_name_index (0x1fe)
	}, ; 374
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554981, ; uint32_t type_token_id (0x2000225)
		i32 277; uint32_t java_name_index (0x115)
	}, ; 375
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554864, ; uint32_t type_token_id (0x20001b0)
		i32 245; uint32_t java_name_index (0xf5)
	}, ; 376
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 123; uint32_t java_name_index (0x7b)
	}, ; 377
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555175, ; uint32_t type_token_id (0x20002e7)
		i32 411; uint32_t java_name_index (0x19b)
	}, ; 378
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554655, ; uint32_t type_token_id (0x20000df)
		i32 111; uint32_t java_name_index (0x6f)
	}, ; 379
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554524, ; uint32_t type_token_id (0x200005c)
		i32 56; uint32_t java_name_index (0x38)
	}, ; 380
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 481; uint32_t java_name_index (0x1e1)
	}, ; 381
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 264; uint32_t java_name_index (0x108)
	}, ; 382
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555223, ; uint32_t type_token_id (0x2000317)
		i32 438; uint32_t java_name_index (0x1b6)
	}, ; 383
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554658, ; uint32_t type_token_id (0x20000e2)
		i32 114; uint32_t java_name_index (0x72)
	}, ; 384
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555077, ; uint32_t type_token_id (0x2000285)
		i32 342; uint32_t java_name_index (0x156)
	}, ; 385
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554468, ; uint32_t type_token_id (0x2000024)
		i32 19; uint32_t java_name_index (0x13)
	}, ; 386
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555118, ; uint32_t type_token_id (0x20002ae)
		i32 368; uint32_t java_name_index (0x170)
	}, ; 387
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 477; uint32_t java_name_index (0x1dd)
	}, ; 388
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555163, ; uint32_t type_token_id (0x20002db)
		i32 401; uint32_t java_name_index (0x191)
	}, ; 389
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554722, ; uint32_t type_token_id (0x2000122)
		i32 150; uint32_t java_name_index (0x96)
	}, ; 390
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554739, ; uint32_t type_token_id (0x2000133)
		i32 166; uint32_t java_name_index (0xa6)
	}, ; 391
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554781, ; uint32_t type_token_id (0x200015d)
		i32 198; uint32_t java_name_index (0xc6)
	}, ; 392
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554454, ; uint32_t type_token_id (0x2000016)
		i32 467; uint32_t java_name_index (0x1d3)
	}, ; 393
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554811, ; uint32_t type_token_id (0x200017b)
		i32 213; uint32_t java_name_index (0xd5)
	}, ; 394
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554704, ; uint32_t type_token_id (0x2000110)
		i32 138; uint32_t java_name_index (0x8a)
	}, ; 395
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554800, ; uint32_t type_token_id (0x2000170)
		i32 207; uint32_t java_name_index (0xcf)
	}, ; 396
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555057, ; uint32_t type_token_id (0x2000271)
		i32 328; uint32_t java_name_index (0x148)
	}, ; 397
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 176; uint32_t java_name_index (0xb0)
	}, ; 398
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555076, ; uint32_t type_token_id (0x2000284)
		i32 341; uint32_t java_name_index (0x155)
	}, ; 399
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554758, ; uint32_t type_token_id (0x2000146)
		i32 180; uint32_t java_name_index (0xb4)
	}, ; 400
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 248; uint32_t java_name_index (0xf8)
	}, ; 401
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554692, ; uint32_t type_token_id (0x2000104)
		i32 465; uint32_t java_name_index (0x1d1)
	}, ; 402
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554480, ; uint32_t type_token_id (0x2000030)
		i32 29; uint32_t java_name_index (0x1d)
	}, ; 403
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554682, ; uint32_t type_token_id (0x20000fa)
		i32 463; uint32_t java_name_index (0x1cf)
	}, ; 404
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index (0xb)
		i32 33554441, ; uint32_t type_token_id (0x2000009)
		i32 513; uint32_t java_name_index (0x201)
	}, ; 405
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555098, ; uint32_t type_token_id (0x200029a)
		i32 356; uint32_t java_name_index (0x164)
	}, ; 406
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554737, ; uint32_t type_token_id (0x2000131)
		i32 165; uint32_t java_name_index (0xa5)
	}, ; 407
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 203; uint32_t java_name_index (0xcb)
	}, ; 408
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 244; uint32_t java_name_index (0xf4)
	}, ; 409
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 77; uint32_t java_name_index (0x4d)
	}, ; 410
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554693, ; uint32_t type_token_id (0x2000105)
		i32 466; uint32_t java_name_index (0x1d2)
	}, ; 411
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555131, ; uint32_t type_token_id (0x20002bb)
		i32 377; uint32_t java_name_index (0x179)
	}, ; 412
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554463, ; uint32_t type_token_id (0x200001f)
		i32 14; uint32_t java_name_index (0xe)
	}, ; 413
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554467, ; uint32_t type_token_id (0x2000023)
		i32 18; uint32_t java_name_index (0x12)
	}, ; 414
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554580, ; uint32_t type_token_id (0x2000094)
		i32 72; uint32_t java_name_index (0x48)
	}, ; 415
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554761, ; uint32_t type_token_id (0x2000149)
		i32 183; uint32_t java_name_index (0xb7)
	}, ; 416
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 129; uint32_t java_name_index (0x81)
	}, ; 417
	%struct.TypeMapJava {
		i32 13, ; uint32_t module_index (0xd)
		i32 33554451, ; uint32_t type_token_id (0x2000013)
		i32 525; uint32_t java_name_index (0x20d)
	}, ; 418
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554633, ; uint32_t type_token_id (0x20000c9)
		i32 99; uint32_t java_name_index (0x63)
	}, ; 419
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554991, ; uint32_t type_token_id (0x200022f)
		i32 287; uint32_t java_name_index (0x11f)
	}, ; 420
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555109, ; uint32_t type_token_id (0x20002a5)
		i32 362; uint32_t java_name_index (0x16a)
	}, ; 421
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554583, ; uint32_t type_token_id (0x2000097)
		i32 74; uint32_t java_name_index (0x4a)
	}, ; 422
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554450, ; uint32_t type_token_id (0x2000012)
		i32 7; uint32_t java_name_index (0x7)
	}, ; 423
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554827, ; uint32_t type_token_id (0x200018b)
		i32 224; uint32_t java_name_index (0xe0)
	}, ; 424
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554713, ; uint32_t type_token_id (0x2000119)
		i32 142; uint32_t java_name_index (0x8e)
	}, ; 425
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554494, ; uint32_t type_token_id (0x200003e)
		i32 37; uint32_t java_name_index (0x25)
	}, ; 426
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555193, ; uint32_t type_token_id (0x20002f9)
		i32 425; uint32_t java_name_index (0x1a9)
	}, ; 427
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554439, ; uint32_t type_token_id (0x2000007)
		i32 2; uint32_t java_name_index (0x2)
	}, ; 428
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 311; uint32_t java_name_index (0x137)
	}, ; 429
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index (0xc)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 514; uint32_t java_name_index (0x202)
	}, ; 430
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554459, ; uint32_t type_token_id (0x200001b)
		i32 11; uint32_t java_name_index (0xb)
	}, ; 431
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555097, ; uint32_t type_token_id (0x2000299)
		i32 355; uint32_t java_name_index (0x163)
	}, ; 432
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 345; uint32_t java_name_index (0x159)
	}, ; 433
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555139, ; uint32_t type_token_id (0x20002c3)
		i32 384; uint32_t java_name_index (0x180)
	}, ; 434
	%struct.TypeMapJava {
		i32 5, ; uint32_t module_index (0x5)
		i32 33554438, ; uint32_t type_token_id (0x2000006)
		i32 447; uint32_t java_name_index (0x1bf)
	}, ; 435
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index (0xc)
		i32 33554538, ; uint32_t type_token_id (0x200006a)
		i32 520; uint32_t java_name_index (0x208)
	}, ; 436
	%struct.TypeMapJava {
		i32 10, ; uint32_t module_index (0xa)
		i32 33554456, ; uint32_t type_token_id (0x2000018)
		i32 503; uint32_t java_name_index (0x1f7)
	}, ; 437
	%struct.TypeMapJava {
		i32 10, ; uint32_t module_index (0xa)
		i32 33554453, ; uint32_t type_token_id (0x2000015)
		i32 500; uint32_t java_name_index (0x1f4)
	}, ; 438
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554731, ; uint32_t type_token_id (0x200012b)
		i32 159; uint32_t java_name_index (0x9f)
	}, ; 439
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555047, ; uint32_t type_token_id (0x2000267)
		i32 319; uint32_t java_name_index (0x13f)
	}, ; 440
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554675, ; uint32_t type_token_id (0x20000f3)
		i32 126; uint32_t java_name_index (0x7e)
	}, ; 441
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554712, ; uint32_t type_token_id (0x2000118)
		i32 141; uint32_t java_name_index (0x8d)
	}, ; 442
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555111, ; uint32_t type_token_id (0x20002a7)
		i32 363; uint32_t java_name_index (0x16b)
	}, ; 443
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554999, ; uint32_t type_token_id (0x2000237)
		i32 290; uint32_t java_name_index (0x122)
	}, ; 444
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554948, ; uint32_t type_token_id (0x2000204)
		i32 269; uint32_t java_name_index (0x10d)
	}, ; 445
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index (0xb)
		i32 33554438, ; uint32_t type_token_id (0x2000006)
		i32 512; uint32_t java_name_index (0x200)
	}, ; 446
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554612, ; uint32_t type_token_id (0x20000b4)
		i32 92; uint32_t java_name_index (0x5c)
	}, ; 447
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554873, ; uint32_t type_token_id (0x20001b9)
		i32 250; uint32_t java_name_index (0xfa)
	}, ; 448
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555200, ; uint32_t type_token_id (0x2000300)
		i32 431; uint32_t java_name_index (0x1af)
	}, ; 449
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555129, ; uint32_t type_token_id (0x20002b9)
		i32 375; uint32_t java_name_index (0x177)
	}, ; 450
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554947, ; uint32_t type_token_id (0x2000203)
		i32 268; uint32_t java_name_index (0x10c)
	}, ; 451
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554849, ; uint32_t type_token_id (0x20001a1)
		i32 236; uint32_t java_name_index (0xec)
	}, ; 452
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555171, ; uint32_t type_token_id (0x20002e3)
		i32 408; uint32_t java_name_index (0x198)
	}, ; 453
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554743, ; uint32_t type_token_id (0x2000137)
		i32 170; uint32_t java_name_index (0xaa)
	}, ; 454
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 132; uint32_t java_name_index (0x84)
	}, ; 455
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554581, ; uint32_t type_token_id (0x2000095)
		i32 73; uint32_t java_name_index (0x49)
	}, ; 456
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555130, ; uint32_t type_token_id (0x20002ba)
		i32 376; uint32_t java_name_index (0x178)
	}, ; 457
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554442, ; uint32_t type_token_id (0x200000a)
		i32 3; uint32_t java_name_index (0x3)
	}, ; 458
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554573, ; uint32_t type_token_id (0x200008d)
		i32 67; uint32_t java_name_index (0x43)
	}, ; 459
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554977, ; uint32_t type_token_id (0x2000221)
		i32 274; uint32_t java_name_index (0x112)
	}, ; 460
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554896, ; uint32_t type_token_id (0x20001d0)
		i32 261; uint32_t java_name_index (0x105)
	}, ; 461
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554662, ; uint32_t type_token_id (0x20000e6)
		i32 449; uint32_t java_name_index (0x1c1)
	}, ; 462
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554780, ; uint32_t type_token_id (0x200015c)
		i32 197; uint32_t java_name_index (0xc5)
	}, ; 463
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554484, ; uint32_t type_token_id (0x2000034)
		i32 486; uint32_t java_name_index (0x1e6)
	}, ; 464
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index (0x3)
		i32 33554437, ; uint32_t type_token_id (0x2000005)
		i32 441; uint32_t java_name_index (0x1b9)
	}, ; 465
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 316; uint32_t java_name_index (0x13c)
	}, ; 466
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 493; uint32_t java_name_index (0x1ed)
	}, ; 467
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555169, ; uint32_t type_token_id (0x20002e1)
		i32 406; uint32_t java_name_index (0x196)
	}, ; 468
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554574, ; uint32_t type_token_id (0x200008e)
		i32 68; uint32_t java_name_index (0x44)
	}, ; 469
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554678, ; uint32_t type_token_id (0x20000f6)
		i32 128; uint32_t java_name_index (0x80)
	}, ; 470
	%struct.TypeMapJava {
		i32 13, ; uint32_t module_index (0xd)
		i32 33554455, ; uint32_t type_token_id (0x2000017)
		i32 528; uint32_t java_name_index (0x210)
	}, ; 471
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555152, ; uint32_t type_token_id (0x20002d0)
		i32 394; uint32_t java_name_index (0x18a)
	}, ; 472
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 131; uint32_t java_name_index (0x83)
	}, ; 473
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555102, ; uint32_t type_token_id (0x200029e)
		i32 358; uint32_t java_name_index (0x166)
	}, ; 474
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554776, ; uint32_t type_token_id (0x2000158)
		i32 193; uint32_t java_name_index (0xc1)
	}, ; 475
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555019, ; uint32_t type_token_id (0x200024b)
		i32 303; uint32_t java_name_index (0x12f)
	}, ; 476
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554989, ; uint32_t type_token_id (0x200022d)
		i32 285; uint32_t java_name_index (0x11d)
	}, ; 477
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555059, ; uint32_t type_token_id (0x2000273)
		i32 330; uint32_t java_name_index (0x14a)
	}, ; 478
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555141, ; uint32_t type_token_id (0x20002c5)
		i32 385; uint32_t java_name_index (0x181)
	}, ; 479
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554661, ; uint32_t type_token_id (0x20000e5)
		i32 117; uint32_t java_name_index (0x75)
	}, ; 480
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554930, ; uint32_t type_token_id (0x20001f2)
		i32 263; uint32_t java_name_index (0x107)
	}, ; 481
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554597, ; uint32_t type_token_id (0x20000a5)
		i32 82; uint32_t java_name_index (0x52)
	}, ; 482
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554714, ; uint32_t type_token_id (0x200011a)
		i32 143; uint32_t java_name_index (0x8f)
	}, ; 483
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554472, ; uint32_t type_token_id (0x2000028)
		i32 23; uint32_t java_name_index (0x17)
	}, ; 484
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555073, ; uint32_t type_token_id (0x2000281)
		i32 338; uint32_t java_name_index (0x152)
	}, ; 485
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555015, ; uint32_t type_token_id (0x2000247)
		i32 301; uint32_t java_name_index (0x12d)
	}, ; 486
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 63; uint32_t java_name_index (0x3f)
	}, ; 487
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554982, ; uint32_t type_token_id (0x2000226)
		i32 278; uint32_t java_name_index (0x116)
	}, ; 488
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554462, ; uint32_t type_token_id (0x200001e)
		i32 474; uint32_t java_name_index (0x1da)
	}, ; 489
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555174, ; uint32_t type_token_id (0x20002e6)
		i32 410; uint32_t java_name_index (0x19a)
	}, ; 490
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554668, ; uint32_t type_token_id (0x20000ec)
		i32 120; uint32_t java_name_index (0x78)
	}, ; 491
	%struct.TypeMapJava {
		i32 13, ; uint32_t module_index (0xd)
		i32 33554447, ; uint32_t type_token_id (0x200000f)
		i32 521; uint32_t java_name_index (0x209)
	}, ; 492
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554838, ; uint32_t type_token_id (0x2000196)
		i32 231; uint32_t java_name_index (0xe7)
	}, ; 493
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554475, ; uint32_t type_token_id (0x200002b)
		i32 26; uint32_t java_name_index (0x1a)
	}, ; 494
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555013, ; uint32_t type_token_id (0x2000245)
		i32 300; uint32_t java_name_index (0x12c)
	}, ; 495
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554526, ; uint32_t type_token_id (0x200005e)
		i32 58; uint32_t java_name_index (0x3a)
	}, ; 496
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555161, ; uint32_t type_token_id (0x20002d9)
		i32 400; uint32_t java_name_index (0x190)
	}, ; 497
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554881, ; uint32_t type_token_id (0x20001c1)
		i32 255; uint32_t java_name_index (0xff)
	}, ; 498
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555164, ; uint32_t type_token_id (0x20002dc)
		i32 402; uint32_t java_name_index (0x192)
	}, ; 499
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554455, ; uint32_t type_token_id (0x2000017)
		i32 9; uint32_t java_name_index (0x9)
	}, ; 500
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554494, ; uint32_t type_token_id (0x200003e)
		i32 492; uint32_t java_name_index (0x1ec)
	}, ; 501
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554759, ; uint32_t type_token_id (0x2000147)
		i32 181; uint32_t java_name_index (0xb5)
	}, ; 502
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554621, ; uint32_t type_token_id (0x20000bd)
		i32 96; uint32_t java_name_index (0x60)
	}, ; 503
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554736, ; uint32_t type_token_id (0x2000130)
		i32 164; uint32_t java_name_index (0xa4)
	}, ; 504
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554676, ; uint32_t type_token_id (0x20000f4)
		i32 127; uint32_t java_name_index (0x7f)
	}, ; 505
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555058, ; uint32_t type_token_id (0x2000272)
		i32 329; uint32_t java_name_index (0x149)
	}, ; 506
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554599, ; uint32_t type_token_id (0x20000a7)
		i32 83; uint32_t java_name_index (0x53)
	}, ; 507
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555155, ; uint32_t type_token_id (0x20002d3)
		i32 396; uint32_t java_name_index (0x18c)
	}, ; 508
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 135; uint32_t java_name_index (0x87)
	}, ; 509
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554452, ; uint32_t type_token_id (0x2000014)
		i32 8; uint32_t java_name_index (0x8)
	}, ; 510
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33555078, ; uint32_t type_token_id (0x2000286)
		i32 343; uint32_t java_name_index (0x157)
	}, ; 511
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554978, ; uint32_t type_token_id (0x2000222)
		i32 275; uint32_t java_name_index (0x113)
	}, ; 512
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554949, ; uint32_t type_token_id (0x2000205)
		i32 270; uint32_t java_name_index (0x10e)
	}, ; 513
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554765, ; uint32_t type_token_id (0x200014d)
		i32 187; uint32_t java_name_index (0xbb)
	}, ; 514
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 179; uint32_t java_name_index (0xb3)
	}, ; 515
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 243; uint32_t java_name_index (0xf3)
	}, ; 516
	%struct.TypeMapJava {
		i32 10, ; uint32_t module_index (0xa)
		i32 33554460, ; uint32_t type_token_id (0x200001c)
		i32 506; uint32_t java_name_index (0x1fa)
	}, ; 517
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index (0xc)
		i32 33554440, ; uint32_t type_token_id (0x2000008)
		i32 519; uint32_t java_name_index (0x207)
	}, ; 518
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 208; uint32_t java_name_index (0xd0)
	}, ; 519
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 241; uint32_t java_name_index (0xf1)
	}, ; 520
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 487; uint32_t java_name_index (0x1e7)
	}, ; 521
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554804, ; uint32_t type_token_id (0x2000174)
		i32 210; uint32_t java_name_index (0xd2)
	}, ; 522
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554795, ; uint32_t type_token_id (0x200016b)
		i32 205; uint32_t java_name_index (0xcd)
	}, ; 523
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554987, ; uint32_t type_token_id (0x200022b)
		i32 283; uint32_t java_name_index (0x11b)
	}, ; 524
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 393; uint32_t java_name_index (0x189)
	}, ; 525
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 103; uint32_t java_name_index (0x67)
	}, ; 526
	%struct.TypeMapJava {
		i32 8, ; uint32_t module_index (0x8)
		i32 33554446, ; uint32_t type_token_id (0x200000e)
		i32 496; uint32_t java_name_index (0x1f0)
	}, ; 527
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554663, ; uint32_t type_token_id (0x20000e7)
		i32 450; uint32_t java_name_index (0x1c2)
	}, ; 528
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554489, ; uint32_t type_token_id (0x2000039)
		i32 34; uint32_t java_name_index (0x22)
	} ; 529
], align 4

; Java type names
@java_type_names = dso_local local_unnamed_addr constant [530 x ptr] [
	ptr @.str.0, ; 0
	ptr @.str.1, ; 1
	ptr @.str.2, ; 2
	ptr @.str.3, ; 3
	ptr @.str.4, ; 4
	ptr @.str.5, ; 5
	ptr @.str.6, ; 6
	ptr @.str.7, ; 7
	ptr @.str.8, ; 8
	ptr @.str.9, ; 9
	ptr @.str.10, ; 10
	ptr @.str.11, ; 11
	ptr @.str.12, ; 12
	ptr @.str.13, ; 13
	ptr @.str.14, ; 14
	ptr @.str.15, ; 15
	ptr @.str.16, ; 16
	ptr @.str.17, ; 17
	ptr @.str.18, ; 18
	ptr @.str.19, ; 19
	ptr @.str.20, ; 20
	ptr @.str.21, ; 21
	ptr @.str.22, ; 22
	ptr @.str.23, ; 23
	ptr @.str.24, ; 24
	ptr @.str.25, ; 25
	ptr @.str.26, ; 26
	ptr @.str.27, ; 27
	ptr @.str.28, ; 28
	ptr @.str.29, ; 29
	ptr @.str.30, ; 30
	ptr @.str.31, ; 31
	ptr @.str.32, ; 32
	ptr @.str.33, ; 33
	ptr @.str.34, ; 34
	ptr @.str.35, ; 35
	ptr @.str.36, ; 36
	ptr @.str.37, ; 37
	ptr @.str.38, ; 38
	ptr @.str.39, ; 39
	ptr @.str.40, ; 40
	ptr @.str.41, ; 41
	ptr @.str.42, ; 42
	ptr @.str.43, ; 43
	ptr @.str.44, ; 44
	ptr @.str.45, ; 45
	ptr @.str.46, ; 46
	ptr @.str.47, ; 47
	ptr @.str.48, ; 48
	ptr @.str.49, ; 49
	ptr @.str.50, ; 50
	ptr @.str.51, ; 51
	ptr @.str.52, ; 52
	ptr @.str.53, ; 53
	ptr @.str.54, ; 54
	ptr @.str.55, ; 55
	ptr @.str.56, ; 56
	ptr @.str.57, ; 57
	ptr @.str.58, ; 58
	ptr @.str.59, ; 59
	ptr @.str.60, ; 60
	ptr @.str.61, ; 61
	ptr @.str.62, ; 62
	ptr @.str.63, ; 63
	ptr @.str.64, ; 64
	ptr @.str.65, ; 65
	ptr @.str.66, ; 66
	ptr @.str.67, ; 67
	ptr @.str.68, ; 68
	ptr @.str.69, ; 69
	ptr @.str.70, ; 70
	ptr @.str.71, ; 71
	ptr @.str.72, ; 72
	ptr @.str.73, ; 73
	ptr @.str.74, ; 74
	ptr @.str.75, ; 75
	ptr @.str.76, ; 76
	ptr @.str.77, ; 77
	ptr @.str.78, ; 78
	ptr @.str.79, ; 79
	ptr @.str.80, ; 80
	ptr @.str.81, ; 81
	ptr @.str.82, ; 82
	ptr @.str.83, ; 83
	ptr @.str.84, ; 84
	ptr @.str.85, ; 85
	ptr @.str.86, ; 86
	ptr @.str.87, ; 87
	ptr @.str.88, ; 88
	ptr @.str.89, ; 89
	ptr @.str.90, ; 90
	ptr @.str.91, ; 91
	ptr @.str.92, ; 92
	ptr @.str.93, ; 93
	ptr @.str.94, ; 94
	ptr @.str.95, ; 95
	ptr @.str.96, ; 96
	ptr @.str.97, ; 97
	ptr @.str.98, ; 98
	ptr @.str.99, ; 99
	ptr @.str.100, ; 100
	ptr @.str.101, ; 101
	ptr @.str.102, ; 102
	ptr @.str.103, ; 103
	ptr @.str.104, ; 104
	ptr @.str.105, ; 105
	ptr @.str.106, ; 106
	ptr @.str.107, ; 107
	ptr @.str.108, ; 108
	ptr @.str.109, ; 109
	ptr @.str.110, ; 110
	ptr @.str.111, ; 111
	ptr @.str.112, ; 112
	ptr @.str.113, ; 113
	ptr @.str.114, ; 114
	ptr @.str.115, ; 115
	ptr @.str.116, ; 116
	ptr @.str.117, ; 117
	ptr @.str.118, ; 118
	ptr @.str.119, ; 119
	ptr @.str.120, ; 120
	ptr @.str.121, ; 121
	ptr @.str.122, ; 122
	ptr @.str.123, ; 123
	ptr @.str.124, ; 124
	ptr @.str.125, ; 125
	ptr @.str.126, ; 126
	ptr @.str.127, ; 127
	ptr @.str.128, ; 128
	ptr @.str.129, ; 129
	ptr @.str.130, ; 130
	ptr @.str.131, ; 131
	ptr @.str.132, ; 132
	ptr @.str.133, ; 133
	ptr @.str.134, ; 134
	ptr @.str.135, ; 135
	ptr @.str.136, ; 136
	ptr @.str.137, ; 137
	ptr @.str.138, ; 138
	ptr @.str.139, ; 139
	ptr @.str.140, ; 140
	ptr @.str.141, ; 141
	ptr @.str.142, ; 142
	ptr @.str.143, ; 143
	ptr @.str.144, ; 144
	ptr @.str.145, ; 145
	ptr @.str.146, ; 146
	ptr @.str.147, ; 147
	ptr @.str.148, ; 148
	ptr @.str.149, ; 149
	ptr @.str.150, ; 150
	ptr @.str.151, ; 151
	ptr @.str.152, ; 152
	ptr @.str.153, ; 153
	ptr @.str.154, ; 154
	ptr @.str.155, ; 155
	ptr @.str.156, ; 156
	ptr @.str.157, ; 157
	ptr @.str.158, ; 158
	ptr @.str.159, ; 159
	ptr @.str.160, ; 160
	ptr @.str.161, ; 161
	ptr @.str.162, ; 162
	ptr @.str.163, ; 163
	ptr @.str.164, ; 164
	ptr @.str.165, ; 165
	ptr @.str.166, ; 166
	ptr @.str.167, ; 167
	ptr @.str.168, ; 168
	ptr @.str.169, ; 169
	ptr @.str.170, ; 170
	ptr @.str.171, ; 171
	ptr @.str.172, ; 172
	ptr @.str.173, ; 173
	ptr @.str.174, ; 174
	ptr @.str.175, ; 175
	ptr @.str.176, ; 176
	ptr @.str.177, ; 177
	ptr @.str.178, ; 178
	ptr @.str.179, ; 179
	ptr @.str.180, ; 180
	ptr @.str.181, ; 181
	ptr @.str.182, ; 182
	ptr @.str.183, ; 183
	ptr @.str.184, ; 184
	ptr @.str.185, ; 185
	ptr @.str.186, ; 186
	ptr @.str.187, ; 187
	ptr @.str.188, ; 188
	ptr @.str.189, ; 189
	ptr @.str.190, ; 190
	ptr @.str.191, ; 191
	ptr @.str.192, ; 192
	ptr @.str.193, ; 193
	ptr @.str.194, ; 194
	ptr @.str.195, ; 195
	ptr @.str.196, ; 196
	ptr @.str.197, ; 197
	ptr @.str.198, ; 198
	ptr @.str.199, ; 199
	ptr @.str.200, ; 200
	ptr @.str.201, ; 201
	ptr @.str.202, ; 202
	ptr @.str.203, ; 203
	ptr @.str.204, ; 204
	ptr @.str.205, ; 205
	ptr @.str.206, ; 206
	ptr @.str.207, ; 207
	ptr @.str.208, ; 208
	ptr @.str.209, ; 209
	ptr @.str.210, ; 210
	ptr @.str.211, ; 211
	ptr @.str.212, ; 212
	ptr @.str.213, ; 213
	ptr @.str.214, ; 214
	ptr @.str.215, ; 215
	ptr @.str.216, ; 216
	ptr @.str.217, ; 217
	ptr @.str.218, ; 218
	ptr @.str.219, ; 219
	ptr @.str.220, ; 220
	ptr @.str.221, ; 221
	ptr @.str.222, ; 222
	ptr @.str.223, ; 223
	ptr @.str.224, ; 224
	ptr @.str.225, ; 225
	ptr @.str.226, ; 226
	ptr @.str.227, ; 227
	ptr @.str.228, ; 228
	ptr @.str.229, ; 229
	ptr @.str.230, ; 230
	ptr @.str.231, ; 231
	ptr @.str.232, ; 232
	ptr @.str.233, ; 233
	ptr @.str.234, ; 234
	ptr @.str.235, ; 235
	ptr @.str.236, ; 236
	ptr @.str.237, ; 237
	ptr @.str.238, ; 238
	ptr @.str.239, ; 239
	ptr @.str.240, ; 240
	ptr @.str.241, ; 241
	ptr @.str.242, ; 242
	ptr @.str.243, ; 243
	ptr @.str.244, ; 244
	ptr @.str.245, ; 245
	ptr @.str.246, ; 246
	ptr @.str.247, ; 247
	ptr @.str.248, ; 248
	ptr @.str.249, ; 249
	ptr @.str.250, ; 250
	ptr @.str.251, ; 251
	ptr @.str.252, ; 252
	ptr @.str.253, ; 253
	ptr @.str.254, ; 254
	ptr @.str.255, ; 255
	ptr @.str.256, ; 256
	ptr @.str.257, ; 257
	ptr @.str.258, ; 258
	ptr @.str.259, ; 259
	ptr @.str.260, ; 260
	ptr @.str.261, ; 261
	ptr @.str.262, ; 262
	ptr @.str.263, ; 263
	ptr @.str.264, ; 264
	ptr @.str.265, ; 265
	ptr @.str.266, ; 266
	ptr @.str.267, ; 267
	ptr @.str.268, ; 268
	ptr @.str.269, ; 269
	ptr @.str.270, ; 270
	ptr @.str.271, ; 271
	ptr @.str.272, ; 272
	ptr @.str.273, ; 273
	ptr @.str.274, ; 274
	ptr @.str.275, ; 275
	ptr @.str.276, ; 276
	ptr @.str.277, ; 277
	ptr @.str.278, ; 278
	ptr @.str.279, ; 279
	ptr @.str.280, ; 280
	ptr @.str.281, ; 281
	ptr @.str.282, ; 282
	ptr @.str.283, ; 283
	ptr @.str.284, ; 284
	ptr @.str.285, ; 285
	ptr @.str.286, ; 286
	ptr @.str.287, ; 287
	ptr @.str.288, ; 288
	ptr @.str.289, ; 289
	ptr @.str.290, ; 290
	ptr @.str.291, ; 291
	ptr @.str.292, ; 292
	ptr @.str.293, ; 293
	ptr @.str.294, ; 294
	ptr @.str.295, ; 295
	ptr @.str.296, ; 296
	ptr @.str.297, ; 297
	ptr @.str.298, ; 298
	ptr @.str.299, ; 299
	ptr @.str.300, ; 300
	ptr @.str.301, ; 301
	ptr @.str.302, ; 302
	ptr @.str.303, ; 303
	ptr @.str.304, ; 304
	ptr @.str.305, ; 305
	ptr @.str.306, ; 306
	ptr @.str.307, ; 307
	ptr @.str.308, ; 308
	ptr @.str.309, ; 309
	ptr @.str.310, ; 310
	ptr @.str.311, ; 311
	ptr @.str.312, ; 312
	ptr @.str.313, ; 313
	ptr @.str.314, ; 314
	ptr @.str.315, ; 315
	ptr @.str.316, ; 316
	ptr @.str.317, ; 317
	ptr @.str.318, ; 318
	ptr @.str.319, ; 319
	ptr @.str.320, ; 320
	ptr @.str.321, ; 321
	ptr @.str.322, ; 322
	ptr @.str.323, ; 323
	ptr @.str.324, ; 324
	ptr @.str.325, ; 325
	ptr @.str.326, ; 326
	ptr @.str.327, ; 327
	ptr @.str.328, ; 328
	ptr @.str.329, ; 329
	ptr @.str.330, ; 330
	ptr @.str.331, ; 331
	ptr @.str.332, ; 332
	ptr @.str.333, ; 333
	ptr @.str.334, ; 334
	ptr @.str.335, ; 335
	ptr @.str.336, ; 336
	ptr @.str.337, ; 337
	ptr @.str.338, ; 338
	ptr @.str.339, ; 339
	ptr @.str.340, ; 340
	ptr @.str.341, ; 341
	ptr @.str.342, ; 342
	ptr @.str.343, ; 343
	ptr @.str.344, ; 344
	ptr @.str.345, ; 345
	ptr @.str.346, ; 346
	ptr @.str.347, ; 347
	ptr @.str.348, ; 348
	ptr @.str.349, ; 349
	ptr @.str.350, ; 350
	ptr @.str.351, ; 351
	ptr @.str.352, ; 352
	ptr @.str.353, ; 353
	ptr @.str.354, ; 354
	ptr @.str.355, ; 355
	ptr @.str.356, ; 356
	ptr @.str.357, ; 357
	ptr @.str.358, ; 358
	ptr @.str.359, ; 359
	ptr @.str.360, ; 360
	ptr @.str.361, ; 361
	ptr @.str.362, ; 362
	ptr @.str.363, ; 363
	ptr @.str.364, ; 364
	ptr @.str.365, ; 365
	ptr @.str.366, ; 366
	ptr @.str.367, ; 367
	ptr @.str.368, ; 368
	ptr @.str.369, ; 369
	ptr @.str.370, ; 370
	ptr @.str.371, ; 371
	ptr @.str.372, ; 372
	ptr @.str.373, ; 373
	ptr @.str.374, ; 374
	ptr @.str.375, ; 375
	ptr @.str.376, ; 376
	ptr @.str.377, ; 377
	ptr @.str.378, ; 378
	ptr @.str.379, ; 379
	ptr @.str.380, ; 380
	ptr @.str.381, ; 381
	ptr @.str.382, ; 382
	ptr @.str.383, ; 383
	ptr @.str.384, ; 384
	ptr @.str.385, ; 385
	ptr @.str.386, ; 386
	ptr @.str.387, ; 387
	ptr @.str.388, ; 388
	ptr @.str.389, ; 389
	ptr @.str.390, ; 390
	ptr @.str.391, ; 391
	ptr @.str.392, ; 392
	ptr @.str.393, ; 393
	ptr @.str.394, ; 394
	ptr @.str.395, ; 395
	ptr @.str.396, ; 396
	ptr @.str.397, ; 397
	ptr @.str.398, ; 398
	ptr @.str.399, ; 399
	ptr @.str.400, ; 400
	ptr @.str.401, ; 401
	ptr @.str.402, ; 402
	ptr @.str.403, ; 403
	ptr @.str.404, ; 404
	ptr @.str.405, ; 405
	ptr @.str.406, ; 406
	ptr @.str.407, ; 407
	ptr @.str.408, ; 408
	ptr @.str.409, ; 409
	ptr @.str.410, ; 410
	ptr @.str.411, ; 411
	ptr @.str.412, ; 412
	ptr @.str.413, ; 413
	ptr @.str.414, ; 414
	ptr @.str.415, ; 415
	ptr @.str.416, ; 416
	ptr @.str.417, ; 417
	ptr @.str.418, ; 418
	ptr @.str.419, ; 419
	ptr @.str.420, ; 420
	ptr @.str.421, ; 421
	ptr @.str.422, ; 422
	ptr @.str.423, ; 423
	ptr @.str.424, ; 424
	ptr @.str.425, ; 425
	ptr @.str.426, ; 426
	ptr @.str.427, ; 427
	ptr @.str.428, ; 428
	ptr @.str.429, ; 429
	ptr @.str.430, ; 430
	ptr @.str.431, ; 431
	ptr @.str.432, ; 432
	ptr @.str.433, ; 433
	ptr @.str.434, ; 434
	ptr @.str.435, ; 435
	ptr @.str.436, ; 436
	ptr @.str.437, ; 437
	ptr @.str.438, ; 438
	ptr @.str.439, ; 439
	ptr @.str.440, ; 440
	ptr @.str.441, ; 441
	ptr @.str.442, ; 442
	ptr @.str.443, ; 443
	ptr @.str.444, ; 444
	ptr @.str.445, ; 445
	ptr @.str.446, ; 446
	ptr @.str.447, ; 447
	ptr @.str.448, ; 448
	ptr @.str.449, ; 449
	ptr @.str.450, ; 450
	ptr @.str.451, ; 451
	ptr @.str.452, ; 452
	ptr @.str.453, ; 453
	ptr @.str.454, ; 454
	ptr @.str.455, ; 455
	ptr @.str.456, ; 456
	ptr @.str.457, ; 457
	ptr @.str.458, ; 458
	ptr @.str.459, ; 459
	ptr @.str.460, ; 460
	ptr @.str.461, ; 461
	ptr @.str.462, ; 462
	ptr @.str.463, ; 463
	ptr @.str.464, ; 464
	ptr @.str.465, ; 465
	ptr @.str.466, ; 466
	ptr @.str.467, ; 467
	ptr @.str.468, ; 468
	ptr @.str.469, ; 469
	ptr @.str.470, ; 470
	ptr @.str.471, ; 471
	ptr @.str.472, ; 472
	ptr @.str.473, ; 473
	ptr @.str.474, ; 474
	ptr @.str.475, ; 475
	ptr @.str.476, ; 476
	ptr @.str.477, ; 477
	ptr @.str.478, ; 478
	ptr @.str.479, ; 479
	ptr @.str.480, ; 480
	ptr @.str.481, ; 481
	ptr @.str.482, ; 482
	ptr @.str.483, ; 483
	ptr @.str.484, ; 484
	ptr @.str.485, ; 485
	ptr @.str.486, ; 486
	ptr @.str.487, ; 487
	ptr @.str.488, ; 488
	ptr @.str.489, ; 489
	ptr @.str.490, ; 490
	ptr @.str.491, ; 491
	ptr @.str.492, ; 492
	ptr @.str.493, ; 493
	ptr @.str.494, ; 494
	ptr @.str.495, ; 495
	ptr @.str.496, ; 496
	ptr @.str.497, ; 497
	ptr @.str.498, ; 498
	ptr @.str.499, ; 499
	ptr @.str.500, ; 500
	ptr @.str.501, ; 501
	ptr @.str.502, ; 502
	ptr @.str.503, ; 503
	ptr @.str.504, ; 504
	ptr @.str.505, ; 505
	ptr @.str.506, ; 506
	ptr @.str.507, ; 507
	ptr @.str.508, ; 508
	ptr @.str.509, ; 509
	ptr @.str.510, ; 510
	ptr @.str.511, ; 511
	ptr @.str.512, ; 512
	ptr @.str.513, ; 513
	ptr @.str.514, ; 514
	ptr @.str.515, ; 515
	ptr @.str.516, ; 516
	ptr @.str.517, ; 517
	ptr @.str.518, ; 518
	ptr @.str.519, ; 519
	ptr @.str.520, ; 520
	ptr @.str.521, ; 521
	ptr @.str.522, ; 522
	ptr @.str.523, ; 523
	ptr @.str.524, ; 524
	ptr @.str.525, ; 525
	ptr @.str.526, ; 526
	ptr @.str.527, ; 527
	ptr @.str.528, ; 528
	ptr @.str.529 ; 529
], align 4

; Strings
@.str.0 = private unnamed_addr constant [32 x i8] c"com/trimble/empower/BuildConfig\00", align 1
@.str.1 = private unnamed_addr constant [33 x i8] c"com/trimble/empower/AgentAdapter\00", align 1
@.str.2 = private unnamed_addr constant [35 x i8] c"com/trimble/empower/ModuleListener\00", align 1
@.str.3 = private unnamed_addr constant [51 x i8] c"mono/com/trimble/empower/ModuleListenerImplementor\00", align 1
@.str.4 = private unnamed_addr constant [48 x i8] c"com/trimble/empower/ModuleManagerStatusCallback\00", align 1
@.str.5 = private unnamed_addr constant [41 x i8] c"com/trimble/empower/ModulePowerExtension\00", align 1
@.str.6 = private unnamed_addr constant [40 x i8] c"com/trimble/empower/OvercurrentListener\00", align 1
@.str.7 = private unnamed_addr constant [56 x i8] c"mono/com/trimble/empower/OvercurrentListenerImplementor\00", align 1
@.str.8 = private unnamed_addr constant [46 x i8] c"com/trimble/empower/ScioConfigurationListener\00", align 1
@.str.9 = private unnamed_addr constant [62 x i8] c"mono/com/trimble/empower/ScioConfigurationListenerImplementor\00", align 1
@.str.10 = private unnamed_addr constant [32 x i8] c"com/trimble/empower/ScioHostPin\00", align 1
@.str.11 = private unnamed_addr constant [38 x i8] c"com/trimble/empower/ScioLevelListener\00", align 1
@.str.12 = private unnamed_addr constant [54 x i8] c"mono/com/trimble/empower/ScioLevelListenerImplementor\00", align 1
@.str.13 = private unnamed_addr constant [34 x i8] c"com/trimble/empower/ModuleManager\00", align 1
@.str.14 = private unnamed_addr constant [57 x i8] c"com/trimble/empower/ModuleManager$ClientAgentAdapterImpl\00", align 1
@.str.15 = private unnamed_addr constant [50 x i8] c"com/trimble/empower/ModuleManager$EmpowerHardware\00", align 1
@.str.16 = private unnamed_addr constant [55 x i8] c"com/trimble/empower/ModuleManager$MMConnectionCallback\00", align 1
@.str.17 = private unnamed_addr constant [54 x i8] c"com/trimble/empower/ModuleManager$PowerExtensionRelay\00", align 1
@.str.18 = private unnamed_addr constant [50 x i8] c"com/trimble/empower/ModuleManager$ScioHostPinImpl\00", align 1
@.str.19 = private unnamed_addr constant [43 x i8] c"com/trimble/empower/ModuleManagerException\00", align 1
@.str.20 = private unnamed_addr constant [33 x i8] c"com/trimble/empower/ModuleStatus\00", align 1
@.str.21 = private unnamed_addr constant [47 x i8] c"com/trimble/empower/ModuleStatus$DetailedState\00", align 1
@.str.22 = private unnamed_addr constant [43 x i8] c"com/trimble/empower/ModuleStatus$ErrorCode\00", align 1
@.str.23 = private unnamed_addr constant [38 x i8] c"com/trimble/empower/ScioConfiguration\00", align 1
@.str.24 = private unnamed_addr constant [50 x i8] c"com/trimble/empower/ScioConfiguration$ScioPinType\00", align 1
@.str.25 = private unnamed_addr constant [44 x i8] c"com/trimble/empower/internal/HashMapWrapper\00", align 1
@.str.26 = private unnamed_addr constant [48 x i8] c"com/trimble/empower/internal/IAgentAdapter$Stub\00", align 1
@.str.27 = private unnamed_addr constant [54 x i8] c"com/trimble/empower/internal/IAgentAdapter$Stub$Proxy\00", align 1
@.str.28 = private unnamed_addr constant [43 x i8] c"com/trimble/empower/internal/IAgentAdapter\00", align 1
@.str.29 = private unnamed_addr constant [50 x i8] c"com/trimble/empower/internal/IModuleListener$Stub\00", align 1
@.str.30 = private unnamed_addr constant [56 x i8] c"com/trimble/empower/internal/IModuleListener$Stub$Proxy\00", align 1
@.str.31 = private unnamed_addr constant [45 x i8] c"com/trimble/empower/internal/IModuleListener\00", align 1
@.str.32 = private unnamed_addr constant [56 x i8] c"com/trimble/empower/internal/IModuleManagerService$Stub\00", align 1
@.str.33 = private unnamed_addr constant [62 x i8] c"com/trimble/empower/internal/IModuleManagerService$Stub$Proxy\00", align 1
@.str.34 = private unnamed_addr constant [51 x i8] c"com/trimble/empower/internal/IModuleManagerService\00", align 1
@.str.35 = private unnamed_addr constant [56 x i8] c"com/trimble/empower/internal/IModulePowerExtension$Stub\00", align 1
@.str.36 = private unnamed_addr constant [62 x i8] c"com/trimble/empower/internal/IModulePowerExtension$Stub$Proxy\00", align 1
@.str.37 = private unnamed_addr constant [51 x i8] c"com/trimble/empower/internal/IModulePowerExtension\00", align 1
@.str.38 = private unnamed_addr constant [55 x i8] c"com/trimble/empower/internal/IOvercurrentListener$Stub\00", align 1
@.str.39 = private unnamed_addr constant [61 x i8] c"com/trimble/empower/internal/IOvercurrentListener$Stub$Proxy\00", align 1
@.str.40 = private unnamed_addr constant [50 x i8] c"com/trimble/empower/internal/IOvercurrentListener\00", align 1
@.str.41 = private unnamed_addr constant [61 x i8] c"com/trimble/empower/internal/IScioConfigurationListener$Stub\00", align 1
@.str.42 = private unnamed_addr constant [67 x i8] c"com/trimble/empower/internal/IScioConfigurationListener$Stub$Proxy\00", align 1
@.str.43 = private unnamed_addr constant [56 x i8] c"com/trimble/empower/internal/IScioConfigurationListener\00", align 1
@.str.44 = private unnamed_addr constant [47 x i8] c"com/trimble/empower/internal/IScioHostPin$Stub\00", align 1
@.str.45 = private unnamed_addr constant [53 x i8] c"com/trimble/empower/internal/IScioHostPin$Stub$Proxy\00", align 1
@.str.46 = private unnamed_addr constant [42 x i8] c"com/trimble/empower/internal/IScioHostPin\00", align 1
@.str.47 = private unnamed_addr constant [53 x i8] c"com/trimble/empower/internal/IScioLevelListener$Stub\00", align 1
@.str.48 = private unnamed_addr constant [59 x i8] c"com/trimble/empower/internal/IScioLevelListener$Stub$Proxy\00", align 1
@.str.49 = private unnamed_addr constant [48 x i8] c"com/trimble/empower/internal/IScioLevelListener\00", align 1
@.str.50 = private unnamed_addr constant [52 x i8] c"com/trimble/empower/internal/ITestAgentControl$Stub\00", align 1
@.str.51 = private unnamed_addr constant [58 x i8] c"com/trimble/empower/internal/ITestAgentControl$Stub$Proxy\00", align 1
@.str.52 = private unnamed_addr constant [47 x i8] c"com/trimble/empower/internal/ITestAgentControl\00", align 1
@.str.53 = private unnamed_addr constant [46 x i8] c"com/trimble/empower/internal/RemoteCallResult\00", align 1
@.str.54 = private unnamed_addr constant [46 x i8] c"com/trimble/empower/abstractmsp/AbstractAgent\00", align 1
@.str.55 = private unnamed_addr constant [58 x i8] c"com/trimble/empower/abstractmsp/AbstractAgent$ModPowerExt\00", align 1
@.str.56 = private unnamed_addr constant [55 x i8] c"com/trimble/empower/abstractmsp/AbstractManagerService\00", align 1
@.str.57 = private unnamed_addr constant [67 x i8] c"com/trimble/empower/abstractmsp/AbstractManagerService$ModListener\00", align 1
@.str.58 = private unnamed_addr constant [70 x i8] c"com/trimble/empower/abstractmsp/AbstractManagerService$ModManCallback\00", align 1
@.str.59 = private unnamed_addr constant [39 x i8] c"com/trimble/empower/abstractmsp/VidPid\00", align 1
@.str.60 = private unnamed_addr constant [47 x i8] c"com/trimble/bluebottle/remoteapi/ApplicationId\00", align 1
@.str.61 = private unnamed_addr constant [53 x i8] c"com/trimble/bluebottle/remoteapi/IBlueBottleCallback\00", align 1
@.str.62 = private unnamed_addr constant [58 x i8] c"com/trimble/bluebottle/remoteapi/IBlueBottleCallback$Stub\00", align 1
@.str.63 = private unnamed_addr constant [52 x i8] c"com/trimble/bluebottle/remoteapi/IBlueBottleService\00", align 1
@.str.64 = private unnamed_addr constant [57 x i8] c"com/trimble/bluebottle/remoteapi/IBlueBottleService$Stub\00", align 1
@.str.65 = private unnamed_addr constant [29 x i8] c"org/xmlpull/v1/XmlPullParser\00", align 1
@.str.66 = private unnamed_addr constant [38 x i8] c"org/xmlpull/v1/XmlPullParserException\00", align 1
@.str.67 = private unnamed_addr constant [19 x i8] c"org/json/JSONArray\00", align 1
@.str.68 = private unnamed_addr constant [20 x i8] c"org/json/JSONObject\00", align 1
@.str.69 = private unnamed_addr constant [32 x i8] c"javax/security/cert/Certificate\00", align 1
@.str.70 = private unnamed_addr constant [36 x i8] c"javax/security/cert/X509Certificate\00", align 1
@.str.71 = private unnamed_addr constant [28 x i8] c"javax/security/auth/Subject\00", align 1
@.str.72 = private unnamed_addr constant [39 x i8] c"javax/security/auth/x500/X500Principal\00", align 1
@.str.73 = private unnamed_addr constant [24 x i8] c"javax/net/SocketFactory\00", align 1
@.str.74 = private unnamed_addr constant [33 x i8] c"javax/net/ssl/HttpsURLConnection\00", align 1
@.str.75 = private unnamed_addr constant [31 x i8] c"javax/net/ssl/HostnameVerifier\00", align 1
@.str.76 = private unnamed_addr constant [25 x i8] c"javax/net/ssl/KeyManager\00", align 1
@.str.77 = private unnamed_addr constant [25 x i8] c"javax/net/ssl/SSLSession\00", align 1
@.str.78 = private unnamed_addr constant [32 x i8] c"javax/net/ssl/SSLSessionContext\00", align 1
@.str.79 = private unnamed_addr constant [27 x i8] c"javax/net/ssl/TrustManager\00", align 1
@.str.80 = private unnamed_addr constant [32 x i8] c"javax/net/ssl/KeyManagerFactory\00", align 1
@.str.81 = private unnamed_addr constant [25 x i8] c"javax/net/ssl/SSLContext\00", align 1
@.str.82 = private unnamed_addr constant [31 x i8] c"javax/net/ssl/SSLSocketFactory\00", align 1
@.str.83 = private unnamed_addr constant [34 x i8] c"javax/net/ssl/TrustManagerFactory\00", align 1
@.str.84 = private unnamed_addr constant [33 x i8] c"javax/crypto/AEADBadTagException\00", align 1
@.str.85 = private unnamed_addr constant [33 x i8] c"javax/crypto/BadPaddingException\00", align 1
@.str.86 = private unnamed_addr constant [20 x i8] c"javax/crypto/Cipher\00", align 1
@.str.87 = private unnamed_addr constant [39 x i8] c"javax/crypto/IllegalBlockSizeException\00", align 1
@.str.88 = private unnamed_addr constant [23 x i8] c"javax/crypto/SecretKey\00", align 1
@.str.89 = private unnamed_addr constant [26 x i8] c"javax/crypto/KeyGenerator\00", align 1
@.str.90 = private unnamed_addr constant [35 x i8] c"javax/crypto/spec/GCMParameterSpec\00", align 1
@.str.91 = private unnamed_addr constant [34 x i8] c"javax/crypto/spec/IvParameterSpec\00", align 1
@.str.92 = private unnamed_addr constant [27 x i8] c"android/widget/AbsListView\00", align 1
@.str.93 = private unnamed_addr constant [26 x i8] c"android/widget/AbsSpinner\00", align 1
@.str.94 = private unnamed_addr constant [27 x i8] c"android/widget/AdapterView\00", align 1
@.str.95 = private unnamed_addr constant [47 x i8] c"android/widget/AdapterView$OnItemClickListener\00", align 1
@.str.96 = private unnamed_addr constant [63 x i8] c"mono/android/widget/AdapterView_OnItemClickListenerImplementor\00", align 1
@.str.97 = private unnamed_addr constant [50 x i8] c"android/widget/AdapterView$OnItemSelectedListener\00", align 1
@.str.98 = private unnamed_addr constant [66 x i8] c"mono/android/widget/AdapterView_OnItemSelectedListenerImplementor\00", align 1
@.str.99 = private unnamed_addr constant [28 x i8] c"android/widget/ArrayAdapter\00", align 1
@.str.100 = private unnamed_addr constant [27 x i8] c"android/widget/BaseAdapter\00", align 1
@.str.101 = private unnamed_addr constant [22 x i8] c"android/widget/Button\00", align 1
@.str.102 = private unnamed_addr constant [30 x i8] c"android/widget/CompoundButton\00", align 1
@.str.103 = private unnamed_addr constant [54 x i8] c"android/widget/CompoundButton$OnCheckedChangeListener\00", align 1
@.str.104 = private unnamed_addr constant [70 x i8] c"mono/android/widget/CompoundButton_OnCheckedChangeListenerImplementor\00", align 1
@.str.105 = private unnamed_addr constant [24 x i8] c"android/widget/EditText\00", align 1
@.str.106 = private unnamed_addr constant [23 x i8] c"android/widget/Adapter\00", align 1
@.str.107 = private unnamed_addr constant [27 x i8] c"android/widget/ListAdapter\00", align 1
@.str.108 = private unnamed_addr constant [30 x i8] c"android/widget/SpinnerAdapter\00", align 1
@.str.109 = private unnamed_addr constant [28 x i8] c"android/widget/LinearLayout\00", align 1
@.str.110 = private unnamed_addr constant [41 x i8] c"android/widget/LinearLayout$LayoutParams\00", align 1
@.str.111 = private unnamed_addr constant [24 x i8] c"android/widget/ListView\00", align 1
@.str.112 = private unnamed_addr constant [27 x i8] c"android/widget/ProgressBar\00", align 1
@.str.113 = private unnamed_addr constant [27 x i8] c"android/widget/RemoteViews\00", align 1
@.str.114 = private unnamed_addr constant [23 x i8] c"android/widget/Spinner\00", align 1
@.str.115 = private unnamed_addr constant [22 x i8] c"android/widget/Switch\00", align 1
@.str.116 = private unnamed_addr constant [24 x i8] c"android/widget/TextView\00", align 1
@.str.117 = private unnamed_addr constant [21 x i8] c"android/widget/Toast\00", align 1
@.str.118 = private unnamed_addr constant [28 x i8] c"android/widget/ToggleButton\00", align 1
@.str.119 = private unnamed_addr constant [23 x i8] c"android/widget/Toolbar\00", align 1
@.str.120 = private unnamed_addr constant [27 x i8] c"android/webkit/MimeTypeMap\00", align 1
@.str.121 = private unnamed_addr constant [30 x i8] c"android/util/AndroidException\00", align 1
@.str.122 = private unnamed_addr constant [28 x i8] c"android/util/DisplayMetrics\00", align 1
@.str.123 = private unnamed_addr constant [26 x i8] c"android/util/AttributeSet\00", align 1
@.str.124 = private unnamed_addr constant [17 x i8] c"android/util/Log\00", align 1
@.str.125 = private unnamed_addr constant [18 x i8] c"android/util/Size\00", align 1
@.str.126 = private unnamed_addr constant [19 x i8] c"android/util/SizeF\00", align 1
@.str.127 = private unnamed_addr constant [30 x i8] c"android/text/ClipboardManager\00", align 1
@.str.128 = private unnamed_addr constant [18 x i8] c"android/text/Html\00", align 1
@.str.129 = private unnamed_addr constant [22 x i8] c"android/text/Editable\00", align 1
@.str.130 = private unnamed_addr constant [22 x i8] c"android/text/GetChars\00", align 1
@.str.131 = private unnamed_addr constant [25 x i8] c"android/text/InputFilter\00", align 1
@.str.132 = private unnamed_addr constant [24 x i8] c"android/text/NoCopySpan\00", align 1
@.str.133 = private unnamed_addr constant [23 x i8] c"android/text/Spannable\00", align 1
@.str.134 = private unnamed_addr constant [21 x i8] c"android/text/Spanned\00", align 1
@.str.135 = private unnamed_addr constant [25 x i8] c"android/text/TextWatcher\00", align 1
@.str.136 = private unnamed_addr constant [41 x i8] c"mono/android/text/TextWatcherImplementor\00", align 1
@.str.137 = private unnamed_addr constant [35 x i8] c"android/telephony/PhoneNumberUtils\00", align 1
@.str.138 = private unnamed_addr constant [32 x i8] c"android/speech/tts/TextToSpeech\00", align 1
@.str.139 = private unnamed_addr constant [47 x i8] c"android/speech/tts/TextToSpeech$OnInitListener\00", align 1
@.str.140 = private unnamed_addr constant [61 x i8] c"android/speech/tts/TextToSpeech$OnUtteranceCompletedListener\00", align 1
@.str.141 = private unnamed_addr constant [38 x i8] c"android/security/KeyPairGeneratorSpec\00", align 1
@.str.142 = private unnamed_addr constant [46 x i8] c"android/security/KeyPairGeneratorSpec$Builder\00", align 1
@.str.143 = private unnamed_addr constant [46 x i8] c"android/security/keystore/KeyGenParameterSpec\00", align 1
@.str.144 = private unnamed_addr constant [54 x i8] c"android/security/keystore/KeyGenParameterSpec$Builder\00", align 1
@.str.145 = private unnamed_addr constant [34 x i8] c"android/provider/ContactsContract\00", align 1
@.str.146 = private unnamed_addr constant [50 x i8] c"android/provider/ContactsContract$CommonDataKinds\00", align 1
@.str.147 = private unnamed_addr constant [56 x i8] c"android/provider/ContactsContract$CommonDataKinds$Email\00", align 1
@.str.148 = private unnamed_addr constant [56 x i8] c"android/provider/ContactsContract$CommonDataKinds$Phone\00", align 1
@.str.149 = private unnamed_addr constant [43 x i8] c"android/provider/ContactsContract$Contacts\00", align 1
@.str.150 = private unnamed_addr constant [39 x i8] c"android/provider/ContactsContract$Data\00", align 1
@.str.151 = private unnamed_addr constant [35 x i8] c"android/provider/DocumentsContract\00", align 1
@.str.152 = private unnamed_addr constant [28 x i8] c"android/provider/MediaStore\00", align 1
@.str.153 = private unnamed_addr constant [34 x i8] c"android/provider/MediaStore$Audio\00", align 1
@.str.154 = private unnamed_addr constant [40 x i8] c"android/provider/MediaStore$Audio$Media\00", align 1
@.str.155 = private unnamed_addr constant [35 x i8] c"android/provider/MediaStore$Images\00", align 1
@.str.156 = private unnamed_addr constant [41 x i8] c"android/provider/MediaStore$Images$Media\00", align 1
@.str.157 = private unnamed_addr constant [34 x i8] c"android/provider/MediaStore$Video\00", align 1
@.str.158 = private unnamed_addr constant [40 x i8] c"android/provider/MediaStore$Video$Media\00", align 1
@.str.159 = private unnamed_addr constant [26 x i8] c"android/provider/Settings\00", align 1
@.str.160 = private unnamed_addr constant [33 x i8] c"android/provider/Settings$Global\00", align 1
@.str.161 = private unnamed_addr constant [41 x i8] c"android/provider/Settings$NameValueTable\00", align 1
@.str.162 = private unnamed_addr constant [33 x i8] c"android/provider/Settings$Secure\00", align 1
@.str.163 = private unnamed_addr constant [33 x i8] c"android/provider/Settings$System\00", align 1
@.str.164 = private unnamed_addr constant [27 x i8] c"android/provider/Telephony\00", align 1
@.str.165 = private unnamed_addr constant [31 x i8] c"android/provider/Telephony$Sms\00", align 1
@.str.166 = private unnamed_addr constant [37 x i8] c"android/preference/PreferenceManager\00", align 1
@.str.167 = private unnamed_addr constant [22 x i8] c"android/os/BaseBundle\00", align 1
@.str.168 = private unnamed_addr constant [18 x i8] c"android/os/Binder\00", align 1
@.str.169 = private unnamed_addr constant [17 x i8] c"android/os/Build\00", align 1
@.str.170 = private unnamed_addr constant [25 x i8] c"android/os/Build$VERSION\00", align 1
@.str.171 = private unnamed_addr constant [18 x i8] c"android/os/Bundle\00", align 1
@.str.172 = private unnamed_addr constant [31 x i8] c"android/os/DeadObjectException\00", align 1
@.str.173 = private unnamed_addr constant [23 x i8] c"android/os/Environment\00", align 1
@.str.174 = private unnamed_addr constant [19 x i8] c"android/os/Handler\00", align 1
@.str.175 = private unnamed_addr constant [34 x i8] c"android/os/IBinder$DeathRecipient\00", align 1
@.str.176 = private unnamed_addr constant [19 x i8] c"android/os/IBinder\00", align 1
@.str.177 = private unnamed_addr constant [22 x i8] c"android/os/IInterface\00", align 1
@.str.178 = private unnamed_addr constant [30 x i8] c"android/os/Parcelable$Creator\00", align 1
@.str.179 = private unnamed_addr constant [22 x i8] c"android/os/Parcelable\00", align 1
@.str.180 = private unnamed_addr constant [22 x i8] c"android/os/LocaleList\00", align 1
@.str.181 = private unnamed_addr constant [18 x i8] c"android/os/Looper\00", align 1
@.str.182 = private unnamed_addr constant [18 x i8] c"android/os/Parcel\00", align 1
@.str.183 = private unnamed_addr constant [32 x i8] c"android/os/ParcelFileDescriptor\00", align 1
@.str.184 = private unnamed_addr constant [24 x i8] c"android/os/PowerManager\00", align 1
@.str.185 = private unnamed_addr constant [19 x i8] c"android/os/Process\00", align 1
@.str.186 = private unnamed_addr constant [27 x i8] c"android/os/RemoteException\00", align 1
@.str.187 = private unnamed_addr constant [27 x i8] c"android/os/VibrationEffect\00", align 1
@.str.188 = private unnamed_addr constant [20 x i8] c"android/os/Vibrator\00", align 1
@.str.189 = private unnamed_addr constant [32 x i8] c"android/net/ConnectivityManager\00", align 1
@.str.190 = private unnamed_addr constant [48 x i8] c"android/net/ConnectivityManager$NetworkCallback\00", align 1
@.str.191 = private unnamed_addr constant [27 x i8] c"android/net/LinkProperties\00", align 1
@.str.192 = private unnamed_addr constant [20 x i8] c"android/net/Network\00", align 1
@.str.193 = private unnamed_addr constant [32 x i8] c"android/net/NetworkCapabilities\00", align 1
@.str.194 = private unnamed_addr constant [24 x i8] c"android/net/NetworkInfo\00", align 1
@.str.195 = private unnamed_addr constant [27 x i8] c"android/net/NetworkRequest\00", align 1
@.str.196 = private unnamed_addr constant [35 x i8] c"android/net/NetworkRequest$Builder\00", align 1
@.str.197 = private unnamed_addr constant [16 x i8] c"android/net/Uri\00", align 1
@.str.198 = private unnamed_addr constant [24 x i8] c"android/net/Uri$Builder\00", align 1
@.str.199 = private unnamed_addr constant [29 x i8] c"android/net/wifi/WifiManager\00", align 1
@.str.200 = private unnamed_addr constant [25 x i8] c"android/location/Address\00", align 1
@.str.201 = private unnamed_addr constant [26 x i8] c"android/location/Criteria\00", align 1
@.str.202 = private unnamed_addr constant [26 x i8] c"android/location/Geocoder\00", align 1
@.str.203 = private unnamed_addr constant [34 x i8] c"android/location/LocationListener\00", align 1
@.str.204 = private unnamed_addr constant [26 x i8] c"android/location/Location\00", align 1
@.str.205 = private unnamed_addr constant [33 x i8] c"android/location/LocationManager\00", align 1
@.str.206 = private unnamed_addr constant [24 x i8] c"android/hardware/Camera\00", align 1
@.str.207 = private unnamed_addr constant [35 x i8] c"android/hardware/Camera$Parameters\00", align 1
@.str.208 = private unnamed_addr constant [37 x i8] c"android/hardware/SensorEventListener\00", align 1
@.str.209 = private unnamed_addr constant [24 x i8] c"android/hardware/Sensor\00", align 1
@.str.210 = private unnamed_addr constant [29 x i8] c"android/hardware/SensorEvent\00", align 1
@.str.211 = private unnamed_addr constant [31 x i8] c"android/hardware/SensorManager\00", align 1
@.str.212 = private unnamed_addr constant [31 x i8] c"android/hardware/usb/UsbDevice\00", align 1
@.str.213 = private unnamed_addr constant [47 x i8] c"android/hardware/camera2/CameraCharacteristics\00", align 1
@.str.214 = private unnamed_addr constant [51 x i8] c"android/hardware/camera2/CameraCharacteristics$Key\00", align 1
@.str.215 = private unnamed_addr constant [39 x i8] c"android/hardware/camera2/CameraManager\00", align 1
@.str.216 = private unnamed_addr constant [40 x i8] c"android/hardware/camera2/CameraMetadata\00", align 1
@.str.217 = private unnamed_addr constant [33 x i8] c"android/database/CharArrayBuffer\00", align 1
@.str.218 = private unnamed_addr constant [33 x i8] c"android/database/ContentObserver\00", align 1
@.str.219 = private unnamed_addr constant [33 x i8] c"android/database/DataSetObserver\00", align 1
@.str.220 = private unnamed_addr constant [24 x i8] c"android/database/Cursor\00", align 1
@.str.221 = private unnamed_addr constant [35 x i8] c"android/bluetooth/BluetoothAdapter\00", align 1
@.str.222 = private unnamed_addr constant [34 x i8] c"android/bluetooth/BluetoothDevice\00", align 1
@.str.223 = private unnamed_addr constant [35 x i8] c"android/bluetooth/BluetoothManager\00", align 1
@.str.224 = private unnamed_addr constant [34 x i8] c"android/bluetooth/BluetoothSocket\00", align 1
@.str.225 = private unnamed_addr constant [22 x i8] c"android/app/ActionBar\00", align 1
@.str.226 = private unnamed_addr constant [21 x i8] c"android/app/Activity\00", align 1
@.str.227 = private unnamed_addr constant [24 x i8] c"android/app/AlertDialog\00", align 1
@.str.228 = private unnamed_addr constant [32 x i8] c"android/app/AlertDialog$Builder\00", align 1
@.str.229 = private unnamed_addr constant [24 x i8] c"android/app/Application\00", align 1
@.str.230 = private unnamed_addr constant [51 x i8] c"android/app/Application$ActivityLifecycleCallbacks\00", align 1
@.str.231 = private unnamed_addr constant [19 x i8] c"android/app/Dialog\00", align 1
@.str.232 = private unnamed_addr constant [26 x i8] c"android/app/PendingIntent\00", align 1
@.str.233 = private unnamed_addr constant [20 x i8] c"android/app/Service\00", align 1
@.str.234 = private unnamed_addr constant [26 x i8] c"android/app/UiModeManager\00", align 1
@.str.235 = private unnamed_addr constant [40 x i8] c"android/view/WindowManager$LayoutParams\00", align 1
@.str.236 = private unnamed_addr constant [28 x i8] c"android/view/ActionProvider\00", align 1
@.str.237 = private unnamed_addr constant [33 x i8] c"android/view/ContextThemeWrapper\00", align 1
@.str.238 = private unnamed_addr constant [21 x i8] c"android/view/Display\00", align 1
@.str.239 = private unnamed_addr constant [23 x i8] c"android/view/DragEvent\00", align 1
@.str.240 = private unnamed_addr constant [41 x i8] c"android/view/ContextMenu$ContextMenuInfo\00", align 1
@.str.241 = private unnamed_addr constant [18 x i8] c"android/view/Menu\00", align 1
@.str.242 = private unnamed_addr constant [45 x i8] c"android/view/MenuItem$OnActionExpandListener\00", align 1
@.str.243 = private unnamed_addr constant [46 x i8] c"android/view/MenuItem$OnMenuItemClickListener\00", align 1
@.str.244 = private unnamed_addr constant [22 x i8] c"android/view/MenuItem\00", align 1
@.str.245 = private unnamed_addr constant [24 x i8] c"android/view/InputEvent\00", align 1
@.str.246 = private unnamed_addr constant [21 x i8] c"android/view/SubMenu\00", align 1
@.str.247 = private unnamed_addr constant [25 x i8] c"android/view/ViewManager\00", align 1
@.str.248 = private unnamed_addr constant [27 x i8] c"android/view/WindowManager\00", align 1
@.str.249 = private unnamed_addr constant [22 x i8] c"android/view/KeyEvent\00", align 1
@.str.250 = private unnamed_addr constant [28 x i8] c"android/view/LayoutInflater\00", align 1
@.str.251 = private unnamed_addr constant [26 x i8] c"android/view/MenuInflater\00", align 1
@.str.252 = private unnamed_addr constant [38 x i8] c"android/view/OrientationEventListener\00", align 1
@.str.253 = private unnamed_addr constant [18 x i8] c"android/view/View\00", align 1
@.str.254 = private unnamed_addr constant [34 x i8] c"android/view/View$OnClickListener\00", align 1
@.str.255 = private unnamed_addr constant [50 x i8] c"mono/android/view/View_OnClickListenerImplementor\00", align 1
@.str.256 = private unnamed_addr constant [38 x i8] c"android/view/View$OnLongClickListener\00", align 1
@.str.257 = private unnamed_addr constant [54 x i8] c"mono/android/view/View_OnLongClickListenerImplementor\00", align 1
@.str.258 = private unnamed_addr constant [23 x i8] c"android/view/ViewGroup\00", align 1
@.str.259 = private unnamed_addr constant [36 x i8] c"android/view/ViewGroup$LayoutParams\00", align 1
@.str.260 = private unnamed_addr constant [42 x i8] c"android/view/ViewGroup$MarginLayoutParams\00", align 1
@.str.261 = private unnamed_addr constant [20 x i8] c"android/view/Window\00", align 1
@.str.262 = private unnamed_addr constant [27 x i8] c"android/view/WindowMetrics\00", align 1
@.str.263 = private unnamed_addr constant [40 x i8] c"mono/android/runtime/InputStreamAdapter\00", align 1
@.str.264 = private unnamed_addr constant [31 x i8] c"mono/android/runtime/JavaArray\00", align 1
@.str.265 = private unnamed_addr constant [21 x i8] c"java/util/Collection\00", align 1
@.str.266 = private unnamed_addr constant [18 x i8] c"java/util/HashMap\00", align 1
@.str.267 = private unnamed_addr constant [20 x i8] c"java/util/ArrayList\00", align 1
@.str.268 = private unnamed_addr constant [32 x i8] c"mono/android/runtime/JavaObject\00", align 1
@.str.269 = private unnamed_addr constant [35 x i8] c"android/runtime/JavaProxyThrowable\00", align 1
@.str.270 = private unnamed_addr constant [18 x i8] c"java/util/HashSet\00", align 1
@.str.271 = private unnamed_addr constant [41 x i8] c"mono/android/runtime/OutputStreamAdapter\00", align 1
@.str.272 = private unnamed_addr constant [40 x i8] c"android/runtime/XmlReaderResourceParser\00", align 1
@.str.273 = private unnamed_addr constant [36 x i8] c"android/runtime/XmlReaderPullParser\00", align 1
@.str.274 = private unnamed_addr constant [24 x i8] c"android/graphics/Bitmap\00", align 1
@.str.275 = private unnamed_addr constant [39 x i8] c"android/graphics/Bitmap$CompressFormat\00", align 1
@.str.276 = private unnamed_addr constant [31 x i8] c"android/graphics/Bitmap$Config\00", align 1
@.str.277 = private unnamed_addr constant [27 x i8] c"android/graphics/BlendMode\00", align 1
@.str.278 = private unnamed_addr constant [24 x i8] c"android/graphics/Canvas\00", align 1
@.str.279 = private unnamed_addr constant [23 x i8] c"android/graphics/Color\00", align 1
@.str.280 = private unnamed_addr constant [24 x i8] c"android/graphics/Matrix\00", align 1
@.str.281 = private unnamed_addr constant [23 x i8] c"android/graphics/Point\00", align 1
@.str.282 = private unnamed_addr constant [24 x i8] c"android/graphics/PointF\00", align 1
@.str.283 = private unnamed_addr constant [28 x i8] c"android/graphics/PorterDuff\00", align 1
@.str.284 = private unnamed_addr constant [33 x i8] c"android/graphics/PorterDuff$Mode\00", align 1
@.str.285 = private unnamed_addr constant [22 x i8] c"android/graphics/Rect\00", align 1
@.str.286 = private unnamed_addr constant [23 x i8] c"android/graphics/RectF\00", align 1
@.str.287 = private unnamed_addr constant [32 x i8] c"android/graphics/SurfaceTexture\00", align 1
@.str.288 = private unnamed_addr constant [35 x i8] c"android/graphics/drawable/Drawable\00", align 1
@.str.289 = private unnamed_addr constant [31 x i8] c"android/graphics/drawable/Icon\00", align 1
@.str.290 = private unnamed_addr constant [42 x i8] c"android/content/ActivityNotFoundException\00", align 1
@.str.291 = private unnamed_addr constant [34 x i8] c"android/content/BroadcastReceiver\00", align 1
@.str.292 = private unnamed_addr constant [33 x i8] c"android/content/ClipboardManager\00", align 1
@.str.293 = private unnamed_addr constant [62 x i8] c"android/content/ClipboardManager$OnPrimaryClipChangedListener\00", align 1
@.str.294 = private unnamed_addr constant [25 x i8] c"android/content/ClipData\00", align 1
@.str.295 = private unnamed_addr constant [30 x i8] c"android/content/ClipData$Item\00", align 1
@.str.296 = private unnamed_addr constant [30 x i8] c"android/content/ComponentName\00", align 1
@.str.297 = private unnamed_addr constant [32 x i8] c"android/content/ContentProvider\00", align 1
@.str.298 = private unnamed_addr constant [32 x i8] c"android/content/ContentResolver\00", align 1
@.str.299 = private unnamed_addr constant [30 x i8] c"android/content/ContentValues\00", align 1
@.str.300 = private unnamed_addr constant [24 x i8] c"android/content/Context\00", align 1
@.str.301 = private unnamed_addr constant [31 x i8] c"android/content/ContextWrapper\00", align 1
@.str.302 = private unnamed_addr constant [48 x i8] c"android/content/DialogInterface$OnClickListener\00", align 1
@.str.303 = private unnamed_addr constant [64 x i8] c"mono/android/content/DialogInterface_OnClickListenerImplementor\00", align 1
@.str.304 = private unnamed_addr constant [32 x i8] c"android/content/DialogInterface\00", align 1
@.str.305 = private unnamed_addr constant [23 x i8] c"android/content/Intent\00", align 1
@.str.306 = private unnamed_addr constant [29 x i8] c"android/content/IntentFilter\00", align 1
@.str.307 = private unnamed_addr constant [29 x i8] c"android/content/IntentSender\00", align 1
@.str.308 = private unnamed_addr constant [34 x i8] c"android/content/ServiceConnection\00", align 1
@.str.309 = private unnamed_addr constant [41 x i8] c"android/content/SharedPreferences$Editor\00", align 1
@.str.310 = private unnamed_addr constant [67 x i8] c"android/content/SharedPreferences$OnSharedPreferenceChangeListener\00", align 1
@.str.311 = private unnamed_addr constant [34 x i8] c"android/content/SharedPreferences\00", align 1
@.str.312 = private unnamed_addr constant [40 x i8] c"android/content/res/AssetFileDescriptor\00", align 1
@.str.313 = private unnamed_addr constant [33 x i8] c"android/content/res/AssetManager\00", align 1
@.str.314 = private unnamed_addr constant [35 x i8] c"android/content/res/ColorStateList\00", align 1
@.str.315 = private unnamed_addr constant [34 x i8] c"android/content/res/Configuration\00", align 1
@.str.316 = private unnamed_addr constant [38 x i8] c"android/content/res/XmlResourceParser\00", align 1
@.str.317 = private unnamed_addr constant [30 x i8] c"android/content/res/Resources\00", align 1
@.str.318 = private unnamed_addr constant [34 x i8] c"android/content/pm/PackageManager\00", align 1
@.str.319 = private unnamed_addr constant [56 x i8] c"android/content/pm/PackageManager$NameNotFoundException\00", align 1
@.str.320 = private unnamed_addr constant [32 x i8] c"android/content/pm/ActivityInfo\00", align 1
@.str.321 = private unnamed_addr constant [35 x i8] c"android/content/pm/ApplicationInfo\00", align 1
@.str.322 = private unnamed_addr constant [33 x i8] c"android/content/pm/ComponentInfo\00", align 1
@.str.323 = private unnamed_addr constant [31 x i8] c"android/content/pm/FeatureInfo\00", align 1
@.str.324 = private unnamed_addr constant [31 x i8] c"android/content/pm/PackageInfo\00", align 1
@.str.325 = private unnamed_addr constant [35 x i8] c"android/content/pm/PackageItemInfo\00", align 1
@.str.326 = private unnamed_addr constant [31 x i8] c"android/content/pm/ResolveInfo\00", align 1
@.str.327 = private unnamed_addr constant [31 x i8] c"android/content/pm/ServiceInfo\00", align 1
@.str.328 = private unnamed_addr constant [32 x i8] c"android/content/pm/ShortcutInfo\00", align 1
@.str.329 = private unnamed_addr constant [40 x i8] c"android/content/pm/ShortcutInfo$Builder\00", align 1
@.str.330 = private unnamed_addr constant [35 x i8] c"android/content/pm/ShortcutManager\00", align 1
@.str.331 = private unnamed_addr constant [29 x i8] c"android/content/pm/Signature\00", align 1
@.str.332 = private unnamed_addr constant [31 x i8] c"android/content/pm/SigningInfo\00", align 1
@.str.333 = private unnamed_addr constant [15 x i8] c"java/util/Date\00", align 1
@.str.334 = private unnamed_addr constant [22 x i8] c"java/util/Enumeration\00", align 1
@.str.335 = private unnamed_addr constant [19 x i8] c"java/util/Iterator\00", align 1
@.str.336 = private unnamed_addr constant [17 x i8] c"java/util/Locale\00", align 1
@.str.337 = private unnamed_addr constant [26 x i8] c"java/util/Locale$Category\00", align 1
@.str.338 = private unnamed_addr constant [21 x i8] c"java/util/Properties\00", align 1
@.str.339 = private unnamed_addr constant [17 x i8] c"java/util/Random\00", align 1
@.str.340 = private unnamed_addr constant [15 x i8] c"java/util/UUID\00", align 1
@.str.341 = private unnamed_addr constant [35 x i8] c"java/util/zip/DeflaterOutputStream\00", align 1
@.str.342 = private unnamed_addr constant [23 x i8] c"java/util/zip/ZipEntry\00", align 1
@.str.343 = private unnamed_addr constant [30 x i8] c"java/util/zip/ZipOutputStream\00", align 1
@.str.344 = private unnamed_addr constant [28 x i8] c"java/util/function/Consumer\00", align 1
@.str.345 = private unnamed_addr constant [31 x i8] c"java/util/function/IntConsumer\00", align 1
@.str.346 = private unnamed_addr constant [30 x i8] c"java/util/concurrent/Executor\00", align 1
@.str.347 = private unnamed_addr constant [39 x i8] c"java/security/GeneralSecurityException\00", align 1
@.str.348 = private unnamed_addr constant [18 x i8] c"java/security/Key\00", align 1
@.str.349 = private unnamed_addr constant [49 x i8] c"java/security/InvalidAlgorithmParameterException\00", align 1
@.str.350 = private unnamed_addr constant [34 x i8] c"java/security/InvalidKeyException\00", align 1
@.str.351 = private unnamed_addr constant [24 x i8] c"java/security/Principal\00", align 1
@.str.352 = private unnamed_addr constant [25 x i8] c"java/security/PrivateKey\00", align 1
@.str.353 = private unnamed_addr constant [24 x i8] c"java/security/PublicKey\00", align 1
@.str.354 = private unnamed_addr constant [27 x i8] c"java/security/KeyException\00", align 1
@.str.355 = private unnamed_addr constant [22 x i8] c"java/security/KeyPair\00", align 1
@.str.356 = private unnamed_addr constant [31 x i8] c"java/security/KeyPairGenerator\00", align 1
@.str.357 = private unnamed_addr constant [34 x i8] c"java/security/KeyPairGeneratorSpi\00", align 1
@.str.358 = private unnamed_addr constant [23 x i8] c"java/security/KeyStore\00", align 1
@.str.359 = private unnamed_addr constant [42 x i8] c"java/security/KeyStore$LoadStoreParameter\00", align 1
@.str.360 = private unnamed_addr constant [43 x i8] c"java/security/KeyStore$ProtectionParameter\00", align 1
@.str.361 = private unnamed_addr constant [28 x i8] c"java/security/MessageDigest\00", align 1
@.str.362 = private unnamed_addr constant [31 x i8] c"java/security/MessageDigestSpi\00", align 1
@.str.363 = private unnamed_addr constant [39 x i8] c"java/security/NoSuchAlgorithmException\00", align 1
@.str.364 = private unnamed_addr constant [27 x i8] c"java/security/SecureRandom\00", align 1
@.str.365 = private unnamed_addr constant [42 x i8] c"java/security/spec/AlgorithmParameterSpec\00", align 1
@.str.366 = private unnamed_addr constant [31 x i8] c"java/security/cert/Certificate\00", align 1
@.str.367 = private unnamed_addr constant [48 x i8] c"java/security/cert/CertificateEncodingException\00", align 1
@.str.368 = private unnamed_addr constant [40 x i8] c"java/security/cert/CertificateException\00", align 1
@.str.369 = private unnamed_addr constant [38 x i8] c"java/security/cert/CertificateFactory\00", align 1
@.str.370 = private unnamed_addr constant [35 x i8] c"java/security/cert/X509Certificate\00", align 1
@.str.371 = private unnamed_addr constant [30 x i8] c"java/nio/channels/FileChannel\00", align 1
@.str.372 = private unnamed_addr constant [51 x i8] c"java/nio/channels/spi/AbstractInterruptibleChannel\00", align 1
@.str.373 = private unnamed_addr constant [26 x i8] c"java/net/ConnectException\00", align 1
@.str.374 = private unnamed_addr constant [27 x i8] c"java/net/HttpURLConnection\00", align 1
@.str.375 = private unnamed_addr constant [27 x i8] c"java/net/InetSocketAddress\00", align 1
@.str.376 = private unnamed_addr constant [27 x i8] c"java/net/ProtocolException\00", align 1
@.str.377 = private unnamed_addr constant [15 x i8] c"java/net/Proxy\00", align 1
@.str.378 = private unnamed_addr constant [20 x i8] c"java/net/Proxy$Type\00", align 1
@.str.379 = private unnamed_addr constant [23 x i8] c"java/net/SocketAddress\00", align 1
@.str.380 = private unnamed_addr constant [25 x i8] c"java/net/SocketException\00", align 1
@.str.381 = private unnamed_addr constant [32 x i8] c"java/net/SocketTimeoutException\00", align 1
@.str.382 = private unnamed_addr constant [33 x i8] c"java/net/UnknownServiceException\00", align 1
@.str.383 = private unnamed_addr constant [13 x i8] c"java/net/URL\00", align 1
@.str.384 = private unnamed_addr constant [23 x i8] c"java/net/URLConnection\00", align 1
@.str.385 = private unnamed_addr constant [20 x i8] c"java/net/URLEncoder\00", align 1
@.str.386 = private unnamed_addr constant [21 x i8] c"java/math/BigInteger\00", align 1
@.str.387 = private unnamed_addr constant [13 x i8] c"java/io/File\00", align 1
@.str.388 = private unnamed_addr constant [23 x i8] c"java/io/FileDescriptor\00", align 1
@.str.389 = private unnamed_addr constant [24 x i8] c"java/io/FileInputStream\00", align 1
@.str.390 = private unnamed_addr constant [30 x i8] c"java/io/FileNotFoundException\00", align 1
@.str.391 = private unnamed_addr constant [25 x i8] c"java/io/FileOutputStream\00", align 1
@.str.392 = private unnamed_addr constant [27 x i8] c"java/io/FilterOutputStream\00", align 1
@.str.393 = private unnamed_addr constant [18 x i8] c"java/io/Closeable\00", align 1
@.str.394 = private unnamed_addr constant [20 x i8] c"java/io/InputStream\00", align 1
@.str.395 = private unnamed_addr constant [31 x i8] c"java/io/InterruptedIOException\00", align 1
@.str.396 = private unnamed_addr constant [20 x i8] c"java/io/IOException\00", align 1
@.str.397 = private unnamed_addr constant [21 x i8] c"java/io/Serializable\00", align 1
@.str.398 = private unnamed_addr constant [21 x i8] c"java/io/OutputStream\00", align 1
@.str.399 = private unnamed_addr constant [20 x i8] c"java/io/PrintWriter\00", align 1
@.str.400 = private unnamed_addr constant [15 x i8] c"java/io/Reader\00", align 1
@.str.401 = private unnamed_addr constant [21 x i8] c"java/io/StringWriter\00", align 1
@.str.402 = private unnamed_addr constant [15 x i8] c"java/io/Writer\00", align 1
@.str.403 = private unnamed_addr constant [18 x i8] c"java/lang/Boolean\00", align 1
@.str.404 = private unnamed_addr constant [15 x i8] c"java/lang/Byte\00", align 1
@.str.405 = private unnamed_addr constant [20 x i8] c"java/lang/Character\00", align 1
@.str.406 = private unnamed_addr constant [16 x i8] c"java/lang/Class\00", align 1
@.str.407 = private unnamed_addr constant [29 x i8] c"java/lang/ClassCastException\00", align 1
@.str.408 = private unnamed_addr constant [17 x i8] c"java/lang/Double\00", align 1
@.str.409 = private unnamed_addr constant [15 x i8] c"java/lang/Enum\00", align 1
@.str.410 = private unnamed_addr constant [16 x i8] c"java/lang/Error\00", align 1
@.str.411 = private unnamed_addr constant [20 x i8] c"java/lang/Exception\00", align 1
@.str.412 = private unnamed_addr constant [16 x i8] c"java/lang/Float\00", align 1
@.str.413 = private unnamed_addr constant [21 x i8] c"java/lang/Appendable\00", align 1
@.str.414 = private unnamed_addr constant [23 x i8] c"java/lang/CharSequence\00", align 1
@.str.415 = private unnamed_addr constant [35 x i8] c"java/lang/IllegalArgumentException\00", align 1
@.str.416 = private unnamed_addr constant [32 x i8] c"java/lang/IllegalStateException\00", align 1
@.str.417 = private unnamed_addr constant [36 x i8] c"java/lang/IndexOutOfBoundsException\00", align 1
@.str.418 = private unnamed_addr constant [18 x i8] c"java/lang/Integer\00", align 1
@.str.419 = private unnamed_addr constant [19 x i8] c"java/lang/Runnable\00", align 1
@.str.420 = private unnamed_addr constant [17 x i8] c"java/lang/System\00", align 1
@.str.421 = private unnamed_addr constant [23 x i8] c"java/lang/LinkageError\00", align 1
@.str.422 = private unnamed_addr constant [15 x i8] c"java/lang/Long\00", align 1
@.str.423 = private unnamed_addr constant [15 x i8] c"java/lang/Math\00", align 1
@.str.424 = private unnamed_addr constant [31 x i8] c"java/lang/NullPointerException\00", align 1
@.str.425 = private unnamed_addr constant [17 x i8] c"java/lang/Number\00", align 1
@.str.426 = private unnamed_addr constant [17 x i8] c"java/lang/Object\00", align 1
@.str.427 = private unnamed_addr constant [27 x i8] c"java/lang/RuntimeException\00", align 1
@.str.428 = private unnamed_addr constant [28 x i8] c"java/lang/SecurityException\00", align 1
@.str.429 = private unnamed_addr constant [16 x i8] c"java/lang/Short\00", align 1
@.str.430 = private unnamed_addr constant [28 x i8] c"java/lang/StackTraceElement\00", align 1
@.str.431 = private unnamed_addr constant [17 x i8] c"java/lang/String\00", align 1
@.str.432 = private unnamed_addr constant [17 x i8] c"java/lang/Thread\00", align 1
@.str.433 = private unnamed_addr constant [35 x i8] c"mono/java/lang/RunnableImplementor\00", align 1
@.str.434 = private unnamed_addr constant [20 x i8] c"java/lang/Throwable\00", align 1
@.str.435 = private unnamed_addr constant [31 x i8] c"java/lang/UnsatisfiedLinkError\00", align 1
@.str.436 = private unnamed_addr constant [40 x i8] c"java/lang/UnsupportedOperationException\00", align 1
@.str.437 = private unnamed_addr constant [24 x i8] c"mono/java/lang/Runnable\00", align 1
@.str.438 = private unnamed_addr constant [25 x i8] c"mono/android/TypeManager\00", align 1
@.str.439 = private unnamed_addr constant [35 x i8] c"com/trimble/timservice/BuildConfig\00", align 1
@.str.440 = private unnamed_addr constant [40 x i8] c"com/trimble/timservice/ITimService$Stub\00", align 1
@.str.441 = private unnamed_addr constant [46 x i8] c"com/trimble/timservice/ITimService$Stub$Proxy\00", align 1
@.str.442 = private unnamed_addr constant [35 x i8] c"com/trimble/timservice/ITimService\00", align 1
@.str.443 = private unnamed_addr constant [36 x i8] c"com/trimble/timservice/LicenseState\00", align 1
@.str.444 = private unnamed_addr constant [24 x i8] c"crc64775202d62a505530/c\00", align 1
@.str.445 = private unnamed_addr constant [42 x i8] c"crc6445b87d7bcfab1150/BBServiceConnection\00", align 1
@.str.446 = private unnamed_addr constant [37 x i8] c"crc64f64ae6bbda7f4685/ModuleListener\00", align 1
@.str.447 = private unnamed_addr constant [44 x i8] c"crc64f64ae6bbda7f4685/ModuleManagerListener\00", align 1
@.str.448 = private unnamed_addr constant [61 x i8] c"crc64a0e0a82d0db9a07d/Connectivity_EssentialsNetworkCallback\00", align 1
@.str.449 = private unnamed_addr constant [44 x i8] c"crc64a0e0a82d0db9a07d/AccelerometerListener\00", align 1
@.str.450 = private unnamed_addr constant [40 x i8] c"crc64a0e0a82d0db9a07d/BarometerListener\00", align 1
@.str.451 = private unnamed_addr constant [47 x i8] c"crc64a0e0a82d0db9a07d/BatteryBroadcastReceiver\00", align 1
@.str.452 = private unnamed_addr constant [51 x i8] c"crc64a0e0a82d0db9a07d/EnergySaverBroadcastReceiver\00", align 1
@.str.453 = private unnamed_addr constant [46 x i8] c"crc64a0e0a82d0db9a07d/ClipboardChangeListener\00", align 1
@.str.454 = private unnamed_addr constant [37 x i8] c"crc64a0e0a82d0db9a07d/SensorListener\00", align 1
@.str.455 = private unnamed_addr constant [52 x i8] c"crc64a0e0a82d0db9a07d/ConnectivityBroadcastReceiver\00", align 1
@.str.456 = private unnamed_addr constant [31 x i8] c"crc64a0e0a82d0db9a07d/Listener\00", align 1
@.str.457 = private unnamed_addr constant [45 x i8] c"crc64a0e0a82d0db9a07d/SingleLocationListener\00", align 1
@.str.458 = private unnamed_addr constant [40 x i8] c"crc64a0e0a82d0db9a07d/GyroscopeListener\00", align 1
@.str.459 = private unnamed_addr constant [43 x i8] c"crc64a0e0a82d0db9a07d/MagnetometerListener\00", align 1
@.str.460 = private unnamed_addr constant [48 x i8] c"crc64a0e0a82d0db9a07d/OrientationSensorListener\00", align 1
@.str.461 = private unnamed_addr constant [55 x i8] c"crc64a0e0a82d0db9a07d/ActivityLifecycleContextListener\00", align 1
@.str.462 = private unnamed_addr constant [43 x i8] c"crc64a0e0a82d0db9a07d/IntermediateActivity\00", align 1
@.str.463 = private unnamed_addr constant [49 x i8] c"crc64a0e0a82d0db9a07d/TextToSpeechImplementation\00", align 1
@.str.464 = private unnamed_addr constant [32 x i8] c"xamarin/essentials/fileProvider\00", align 1
@.str.465 = private unnamed_addr constant [55 x i8] c"crc64a0e0a82d0db9a07d/WebAuthenticatorCallbackActivity\00", align 1
@.str.466 = private unnamed_addr constant [59 x i8] c"crc64a0e0a82d0db9a07d/WebAuthenticatorIntermediateActivity\00", align 1
@.str.467 = private unnamed_addr constant [38 x i8] c"com/trimble/empower/em940/EM940Device\00", align 1
@.str.468 = private unnamed_addr constant [64 x i8] c"com/trimble/empower/em940/EM940Device$EM940DeviceStatusCallback\00", align 1
@.str.469 = private unnamed_addr constant [50 x i8] c"com/trimble/empower/em940/EM940Device$FlowControl\00", align 1
@.str.470 = private unnamed_addr constant [48 x i8] c"com/trimble/empower/em940/EM940Device$PurgeType\00", align 1
@.str.471 = private unnamed_addr constant [44 x i8] c"com/trimble/empower/em940/EM940Device$State\00", align 1
@.str.472 = private unnamed_addr constant [42 x i8] c"com/trimble/empower/em940/EM940DeviceInfo\00", align 1
@.str.473 = private unnamed_addr constant [41 x i8] c"com/trimble/empower/em940/EM940Exception\00", align 1
@.str.474 = private unnamed_addr constant [39 x i8] c"com/trimble/empower/em940/EM940Manager\00", align 1
@.str.475 = private unnamed_addr constant [60 x i8] c"com/trimble/empower/em940/EM940Manager$AvailabilityCallback\00", align 1
@.str.476 = private unnamed_addr constant [49 x i8] c"com/trimble/empower/em940/EM940ApiStatusCallback\00", align 1
@.str.477 = private unnamed_addr constant [45 x i8] c"com/trimble/empower/em940/EM940EventListener\00", align 1
@.str.478 = private unnamed_addr constant [61 x i8] c"mono/com/trimble/empower/em940/EM940EventListenerImplementor\00", align 1
@.str.479 = private unnamed_addr constant [65 x i8] c"com/trimble/empower/em940/internal/IAvailabilityCallback$Default\00", align 1
@.str.480 = private unnamed_addr constant [62 x i8] c"com/trimble/empower/em940/internal/IAvailabilityCallback$Stub\00", align 1
@.str.481 = private unnamed_addr constant [57 x i8] c"com/trimble/empower/em940/internal/IAvailabilityCallback\00", align 1
@.str.482 = private unnamed_addr constant [56 x i8] c"com/trimble/empower/em940/internal/IEM940Device$Default\00", align 1
@.str.483 = private unnamed_addr constant [53 x i8] c"com/trimble/empower/em940/internal/IEM940Device$Stub\00", align 1
@.str.484 = private unnamed_addr constant [48 x i8] c"com/trimble/empower/em940/internal/IEM940Device\00", align 1
@.str.485 = private unnamed_addr constant [70 x i8] c"com/trimble/empower/em940/internal/IEM940DeviceStatusCallback$Default\00", align 1
@.str.486 = private unnamed_addr constant [67 x i8] c"com/trimble/empower/em940/internal/IEM940DeviceStatusCallback$Stub\00", align 1
@.str.487 = private unnamed_addr constant [62 x i8] c"com/trimble/empower/em940/internal/IEM940DeviceStatusCallback\00", align 1
@.str.488 = private unnamed_addr constant [63 x i8] c"com/trimble/empower/em940/internal/IEM940EventListener$Default\00", align 1
@.str.489 = private unnamed_addr constant [60 x i8] c"com/trimble/empower/em940/internal/IEM940EventListener$Stub\00", align 1
@.str.490 = private unnamed_addr constant [55 x i8] c"com/trimble/empower/em940/internal/IEM940EventListener\00", align 1
@.str.491 = private unnamed_addr constant [57 x i8] c"com/trimble/empower/em940/internal/IEM940Manager$Default\00", align 1
@.str.492 = private unnamed_addr constant [54 x i8] c"com/trimble/empower/em940/internal/IEM940Manager$Stub\00", align 1
@.str.493 = private unnamed_addr constant [49 x i8] c"com/trimble/empower/em940/internal/IEM940Manager\00", align 1
@.str.494 = private unnamed_addr constant [47 x i8] c"com/trimble/empower/em940/em940lib/BuildConfig\00", align 1
@.str.495 = private unnamed_addr constant [45 x i8] c"crc640e50ecb54de2b5d2/CatalystFacadeActivity\00", align 1
@.str.496 = private unnamed_addr constant [54 x i8] c"crc640e50ecb54de2b5d2/TCPCommunicator_NetworkCallback\00", align 1
@.str.497 = private unnamed_addr constant [24 x i8] c"crc649aea178664f9314c/k\00", align 1
@.str.498 = private unnamed_addr constant [45 x i8] c"androidx/browser/customtabs/CustomTabsClient\00", align 1
@.str.499 = private unnamed_addr constant [68 x i8] c"androidx/browser/customtabs/CustomTabsClient_CustomTabsCallbackImpl\00", align 1
@.str.500 = private unnamed_addr constant [54 x i8] c"crc64396a3fe5f8138e3f/CustomTabsServiceConnectionImpl\00", align 1
@.str.501 = private unnamed_addr constant [55 x i8] c"androidx/browser/customtabs/CustomTabColorSchemeParams\00", align 1
@.str.502 = private unnamed_addr constant [47 x i8] c"androidx/browser/customtabs/CustomTabsCallback\00", align 1
@.str.503 = private unnamed_addr constant [45 x i8] c"androidx/browser/customtabs/CustomTabsIntent\00", align 1
@.str.504 = private unnamed_addr constant [53 x i8] c"androidx/browser/customtabs/CustomTabsIntent$Builder\00", align 1
@.str.505 = private unnamed_addr constant [56 x i8] c"androidx/browser/customtabs/CustomTabsServiceConnection\00", align 1
@.str.506 = private unnamed_addr constant [46 x i8] c"androidx/browser/customtabs/CustomTabsSession\00", align 1
@.str.507 = private unnamed_addr constant [61 x i8] c"androidx/browser/customtabs/CustomTabsSession$PendingSession\00", align 1
@.str.508 = private unnamed_addr constant [41 x i8] c"crc6454360aa41b8b940b/AltGeoRelayService\00", align 1
@.str.509 = private unnamed_addr constant [39 x i8] c"crc6454360aa41b8b940b/BTSelectActivity\00", align 1
@.str.510 = private unnamed_addr constant [57 x i8] c"crc6454360aa41b8b940b/BTSelectActivity_BluetoothReceiver\00", align 1
@.str.511 = private unnamed_addr constant [57 x i8] c"crc6454360aa41b8b940b/BTSelectActivity_BthDevListAdapter\00", align 1
@.str.512 = private unnamed_addr constant [36 x i8] c"crc6454360aa41b8b940b/Configuration\00", align 1
@.str.513 = private unnamed_addr constant [35 x i8] c"crc6454360aa41b8b940b/MainActivity\00", align 1
@.str.514 = private unnamed_addr constant [49 x i8] c"crc6405db95066ba03620/GenericParcelableCreator_1\00", align 1
@.str.515 = private unnamed_addr constant [34 x i8] c"crc640eda0984e46970d1/ITMMService\00", align 1
@.str.516 = private unnamed_addr constant [38 x i8] c"crc640eda0984e46970d1/ITMMServiceStub\00", align 1
@.str.517 = private unnamed_addr constant [44 x i8] c"crc640eda0984e46970d1/ITMMServiceStub_Proxy\00", align 1
@.str.518 = private unnamed_addr constant [51 x i8] c"crc640eda0984e46970d1/LicenseFeatureInfoParcelable\00", align 1
@.str.519 = private unnamed_addr constant [45 x i8] c"crc640eda0984e46970d1/LicenseGroupParcelable\00", align 1
@.str.520 = private unnamed_addr constant [24 x i8] c"crc640947112d00c027ad/k\00", align 1
@.str.521 = private unnamed_addr constant [48 x i8] c"androidx/core/view/DragAndDropPermissionsCompat\00", align 1
@.str.522 = private unnamed_addr constant [36 x i8] c"androidx/core/content/ContextCompat\00", align 1
@.str.523 = private unnamed_addr constant [35 x i8] c"androidx/core/content/FileProvider\00", align 1
@.str.524 = private unnamed_addr constant [40 x i8] c"androidx/core/content/PermissionChecker\00", align 1
@.str.525 = private unnamed_addr constant [43 x i8] c"androidx/core/content/pm/PackageInfoCompat\00", align 1
@.str.526 = private unnamed_addr constant [33 x i8] c"androidx/core/app/ActivityCompat\00", align 1
@.str.527 = private unnamed_addr constant [58 x i8] c"androidx/core/app/ActivityCompat$PermissionCompatDelegate\00", align 1
@.str.528 = private unnamed_addr constant [40 x i8] c"androidx/core/app/SharedElementCallback\00", align 1
@.str.529 = private unnamed_addr constant [70 x i8] c"androidx/core/app/SharedElementCallback$OnSharedElementsReadyListener\00", align 1

;TypeMapModule
@.TypeMapModule.0_assembly_name = private unnamed_addr constant [34 x i8] c"Trimble.EMPOWER.JavaBinding.Droid\00", align 1
@.TypeMapModule.1_assembly_name = private unnamed_addr constant [67 x i8] c"Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.JavaBindings\00", align 1
@.TypeMapModule.2_assembly_name = private unnamed_addr constant [13 x i8] c"Mono.Android\00", align 1
@.TypeMapModule.3_assembly_name = private unnamed_addr constant [12 x i8] c"AIDLService\00", align 1
@.TypeMapModule.4_assembly_name = private unnamed_addr constant [62 x i8] c"Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.Android\00", align 1
@.TypeMapModule.5_assembly_name = private unnamed_addr constant [30 x i8] c"Trimble.EMPOWER.Manager.Droid\00", align 1
@.TypeMapModule.6_assembly_name = private unnamed_addr constant [19 x i8] c"Xamarin.Essentials\00", align 1
@.TypeMapModule.7_assembly_name = private unnamed_addr constant [22 x i8] c"EM940Lib-Mono-Android\00", align 1
@.TypeMapModule.8_assembly_name = private unnamed_addr constant [25 x i8] c"CatalystFacade.NET.Droid\00", align 1
@.TypeMapModule.9_assembly_name = private unnamed_addr constant [33 x i8] c"Trimble.Ssi.DriverManagement.NET\00", align 1
@.TypeMapModule.10_assembly_name = private unnamed_addr constant [25 x i8] c"Xamarin.AndroidX.Browser\00", align 1
@.TypeMapModule.11_assembly_name = private unnamed_addr constant [25 x i8] c"AltGeoRelayService.Droid\00", align 1
@.TypeMapModule.12_assembly_name = private unnamed_addr constant [24 x i8] c"Trimble.LicensingV2.NET\00", align 1
@.TypeMapModule.13_assembly_name = private unnamed_addr constant [22 x i8] c"Xamarin.AndroidX.Core\00", align 1

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
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
