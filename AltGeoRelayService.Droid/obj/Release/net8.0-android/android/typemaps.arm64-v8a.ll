; ModuleID = 'typemaps.arm64-v8a.ll'
source_filename = "typemaps.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

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

@java_type_count = dso_local local_unnamed_addr constant i32 529, align 4

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
		[16 x i8] c"Eh\9Dr\90 \E4C\AE\8E:\22\14\95\0Fp", ; module_uuid: 729d6845-2090-43e4-ae8e-3a2214950f70
		i32 373, ; uint32_t entry_count (0x175)
		i32 122, ; uint32_t duplicate_count (0x7a)
		ptr @module1_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module1_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.1_assembly_name, ; assembly_name: Mono.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	}, ; 1
	%struct.TypeMapModule {
		[16 x i8] c"L\8EY\C43OEA\8A\F7\EAc\02j \DB", ; module_uuid: c4598e4c-4f33-4145-8af7-ea63026a20db
		i32 5, ; uint32_t entry_count (0x5)
		i32 4, ; uint32_t duplicate_count (0x4)
		ptr @module2_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module2_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.2_assembly_name, ; assembly_name: Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.JavaBindings
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
		[16 x i8] c"\8B\05\ED\84\D2\B1PL\87\9F\E2\FE\82\C7\C0\A1", ; module_uuid: 84ed058b-b1d2-4c50-879f-e2fe82c7c0a1
		i32 6, ; uint32_t entry_count (0x6)
		i32 0, ; uint32_t duplicate_count (0x0)
		ptr @module8_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.8_assembly_name, ; assembly_name: AltGeoRelayService.Droid
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	}, ; 8
	%struct.TypeMapModule {
		[16 x i8] c"\8D\C3\C3\84\8D\F8\03N\8D\1Fh<\E2~0\12", ; module_uuid: 84c3c38d-f88d-4e03-8d1f-683ce27e3012
		i32 2, ; uint32_t entry_count (0x2)
		i32 0, ; uint32_t duplicate_count (0x0)
		ptr @module9_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.9_assembly_name, ; assembly_name: CatalystFacade.NET.Droid
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	}, ; 9
	%struct.TypeMapModule {
		[16 x i8] c"\8F\80c\890\B5\90\A8T\13M\91q\D8\E9\FB", ; module_uuid: 8963808f-b530-a890-5413-4d9171d8e9fb
		i32 1, ; uint32_t entry_count (0x1)
		i32 0, ; uint32_t duplicate_count (0x0)
		ptr @module10_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.10_assembly_name, ; assembly_name: Trimble.Ssi.DriverManagement.NET
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	}, ; 10
	%struct.TypeMapModule {
		[16 x i8] c"\90\AA\E4\F2\B5\14\C1D\B62\A1?\D9n\894", ; module_uuid: f2e4aa90-14b5-44c1-b632-a13fd96e8934
		i32 10, ; uint32_t entry_count (0xa)
		i32 1, ; uint32_t duplicate_count (0x1)
		ptr @module11_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module11_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.11_assembly_name, ; assembly_name: Xamarin.AndroidX.Browser
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
], align 8

; Java types name hashes
@map_java_hashes = dso_local local_unnamed_addr constant [529 x i64] [
	i64 128182020419974451, ; 0: 0x1c764de51b97533 => java/lang/String
	i64 146042335049966109, ; 1: 0x206d8baded2621d => java/util/concurrent/Executor
	i64 176627442730137433, ; 2: 0x27381b92d83f759 => android/content/pm/Signature
	i64 191318127108177865, ; 3: 0x2a7b2d2ad603fc9 => android/provider/Settings$NameValueTable
	i64 195155226339815014, ; 4: 0x2b554a4f60bae66 => android/net/LinkProperties
	i64 318564728890166633, ; 5: 0x46bc4eedf778d69 => android/widget/Button
	i64 361870449891484378, ; 6: 0x5059f41c47e22da => android/os/Bundle
	i64 363417747702605178, ; 7: 0x50b1e841ce2e57a => android/widget/TextView
	i64 416115916732990592, ; 8: 0x5c65738ba418480 => androidx/browser/customtabs/CustomTabsClient_CustomTabsCallbackImpl
	i64 492777694992991161, ; 9: 0x6d6b2b3e74b03b9 => crc64a0e0a82d0db9a07d/SensorListener
	i64 515082584359041590, ; 10: 0x725f0e1a6b5fa36 => com/trimble/empower/internal/IModuleListener
	i64 582128946798849863, ; 11: 0x81423315f6aef47 => android/view/ActionProvider
	i64 698692053645229055, ; 12: 0x9b240b890e97bff => javax/net/ssl/HttpsURLConnection
	i64 698738878519169148, ; 13: 0x9b26b4ed4e3d07c => mono/android/content/DialogInterface_OnClickListenerImplementor
	i64 716088225908459184, ; 14: 0x9f00e728d1d06b0 => crc6454360aa41b8b940b/BTSelectActivity_BluetoothReceiver
	i64 728015927939539070, ; 15: 0xa1a6ea117a9a07e => crc640eda0984e46970d1/LicenseGroupParcelable
	i64 728912258276791277, ; 16: 0xa1d9dd6430413ed => java/lang/UnsatisfiedLinkError
	i64 782647305593757341, ; 17: 0xadc8593ea551e9d => android/hardware/Camera
	i64 870874870088288028, ; 18: 0xc15f8148b6d471c => java/lang/Exception
	i64 892705726566656244, ; 19: 0xc638720e8f668f4 => com/trimble/empower/em940/EM940Device$EM940DeviceStatusCallback
	i64 903507330900750967, ; 20: 0xc89e721664cf277 => crc64a0e0a82d0db9a07d/BarometerListener
	i64 919594246224303621, ; 21: 0xcc30e183fb15605 => com/trimble/empower/internal/IModuleManagerService$Stub$Proxy
	i64 1014038817410261079, ; 22: 0xe1296ee8c322057 => com/trimble/empower/ModuleManager$ScioHostPinImpl
	i64 1022018314545883268, ; 23: 0xe2ef03e00736884 => android/content/ActivityNotFoundException
	i64 1043428532231245858, ; 24: 0xe7b00b8c4269022 => android/telephony/PhoneNumberUtils
	i64 1079586186822872943, ; 25: 0xefb75eac1feef6f => java/util/function/Consumer
	i64 1093289771861447773, ; 26: 0xf2c2541485e945d => android/text/Spanned
	i64 1154020126815121549, ; 27: 0x1003e730ea77708d => java/security/KeyPair
	i64 1205598257210265377, ; 28: 0x10bb253a36d90f21 => crc64a0e0a82d0db9a07d/MagnetometerListener
	i64 1217044833273073796, ; 29: 0x10e3cfd3e2f75084 => java/util/HashSet
	i64 1234313237573610993, ; 30: 0x1121295993232df1 => javax/security/auth/x500/X500Principal
	i64 1242899373009865189, ; 31: 0x113faa6503cf09e5 => com/trimble/empower/internal/IModuleListener$Stub$Proxy
	i64 1264118133047759527, ; 32: 0x118b0cbe927112a7 => android/provider/Settings
	i64 1283121375857603354, ; 33: 0x11ce9017d3b3f31a => java/net/ConnectException
	i64 1317579852464953526, ; 34: 0x1248fbe51d6298b6 => java/io/FileInputStream
	i64 1320822650197077237, ; 35: 0x12548133cc496cf5 => android/runtime/JavaProxyThrowable
	i64 1342384015859621074, ; 36: 0x12a11b2671799cd2 => crc64a0e0a82d0db9a07d/Connectivity_EssentialsNetworkCallback
	i64 1356236609822008698, ; 37: 0x12d25202cfd2257a => androidx/core/app/SharedElementCallback$OnSharedElementsReadyListener
	i64 1362770524300979611, ; 38: 0x12e9889253552d9b => java/util/Iterator
	i64 1445244439477417325, ; 39: 0x140e8a2914a8f56d => mono/com/trimble/empower/OvercurrentListenerImplementor
	i64 1462603570753627090, ; 40: 0x144c3632c9fce3d2 => java/util/UUID
	i64 1492675105327442280, ; 41: 0x14b70c198a1c6968 => crc64396a3fe5f8138e3f/CustomTabsServiceConnectionImpl
	i64 1514751409175707353, ; 42: 0x15057a6192f0bed9 => mono/com/trimble/empower/ModuleListenerImplementor
	i64 1550860884384862055, ; 43: 0x1585c3c1edcecf67 => java/net/ProtocolException
	i64 1554440221627438146, ; 44: 0x15927b2552aed442 => android/graphics/drawable/Icon
	i64 1571279173447993873, ; 45: 0x15ce4e1550564a11 => com/trimble/empower/ModuleManager$MMConnectionCallback
	i64 1589519536433163389, ; 46: 0x160f1b98c4a46c7d => android/content/ContentValues
	i64 1610464427476120569, ; 47: 0x165984dd3b1df3f9 => androidx/core/app/SharedElementCallback
	i64 1720050249815736403, ; 48: 0x17ded896c816c053 => com/trimble/timservice/ITimService$Stub
	i64 1747499027921055994, ; 49: 0x18405d1b749330fa => android/os/BaseBundle
	i64 1767810459255759121, ; 50: 0x1888863f1628e111 => android/bluetooth/BluetoothAdapter
	i64 1775924071686356395, ; 51: 0x18a55988b0ee3dab => androidx/browser/customtabs/CustomTabsCallback
	i64 1831728799718484971, ; 52: 0x196b9ba37012abeb => java/io/IOException
	i64 1877272793125324469, ; 53: 0x1a0d69a8bcbd86b5 => java/net/Proxy
	i64 1885389416169908981, ; 54: 0x1a2a3faf4e16aaf5 => android/provider/MediaStore$Images$Media
	i64 1891509142727870308, ; 55: 0x1a3ffd8b2db2c764 => android/database/Cursor
	i64 1909622422839066525, ; 56: 0x1a805779d8717f9d => com/trimble/empower/abstractmsp/VidPid
	i64 2091945087796016600, ; 57: 0x1d0814f947b475d8 => android/view/MenuInflater
	i64 2111352555338672611, ; 58: 0x1d4d07f6709329e3 => android/view/InputEvent
	i64 2157468975174833820, ; 59: 0x1df0de9a2738d69c => org/xmlpull/v1/XmlPullParserException
	i64 2164140653916027403, ; 60: 0x1e08927568a57a0b => java/io/InputStream
	i64 2220753489436966339, ; 61: 0x1ed1b38857997dc3 => mono/com/trimble/empower/ScioConfigurationListenerImplementor
	i64 2226060781910726129, ; 62: 0x1ee48e7caa3795f1 => android/widget/AbsListView
	i64 2266689907793747123, ; 63: 0x1f74e67632025cb3 => java/net/HttpURLConnection
	i64 2319268360137032813, ; 64: 0x202fb24918c5446d => java/security/SecureRandom
	i64 2323662007029289955, ; 65: 0x203f4e48bb0d53e3 => crc64a0e0a82d0db9a07d/Listener
	i64 2349580542494205303, ; 66: 0x209b630e06896577 => android/view/SubMenu
	i64 2357387754135176159, ; 67: 0x20b71fac231543df => java/io/File
	i64 2373817610115313634, ; 68: 0x20f17e8a147d6fe2 => android/content/pm/ServiceInfo
	i64 2375243497726607572, ; 69: 0x20f68f60690d00d4 => java/lang/System
	i64 2390467345448904872, ; 70: 0x212ca562aca728a8 => android/content/pm/ResolveInfo
	i64 2396758962924361177, ; 71: 0x2142ff94055715d9 => java/util/Properties
	i64 2400942736299160995, ; 72: 0x2151dcb2ab2a75a3 => com/trimble/empower/em940/EM940Exception
	i64 2425071951006172274, ; 73: 0x21a79617427c8472 => android/security/KeyPairGeneratorSpec
	i64 2498193693040474283, ; 74: 0x22ab5ded85cc78ab => crc64a0e0a82d0db9a07d/IntermediateActivity
	i64 2542726837267699812, ; 75: 0x2349949628319864 => android/view/Window
	i64 2579912624323326884, ; 76: 0x23cdb0dce45673a4 => com/trimble/empower/em940/internal/IEM940DeviceStatusCallback
	i64 2600674482769555637, ; 77: 0x241773a9c1e6f0b5 => android/os/PowerManager
	i64 2764176954197253237, ; 78: 0x265c544b6b3f9c75 => com/trimble/empower/em940/internal/IEM940DeviceStatusCallback$Default
	i64 2885364006830175112, ; 79: 0x280adf46e2cf7388 => android/content/IntentFilter
	i64 2899981626232285183, ; 80: 0x283ecdec9ebc27ff => com/trimble/empower/ScioLevelListener
	i64 2959318850150039604, ; 81: 0x29119cd0a84f8034 => org/json/JSONArray
	i64 2972252214977986258, ; 82: 0x293f8fa450a17ed2 => android/content/Intent
	i64 3020117961009214850, ; 83: 0x29e99d48c5bb3582 => android/net/NetworkInfo
	i64 3071747017624329461, ; 84: 0x2aa109a3415d1cf5 => android/os/Build
	i64 3093115516104055613, ; 85: 0x2aecf42c82a19b3d => android/content/pm/FeatureInfo
	i64 3093465012747984901, ; 86: 0x2aee320a09f16005 => android/app/Service
	i64 3107623337225989922, ; 87: 0x2b207ef5d711af22 => android/location/Location
	i64 3155261737265476761, ; 88: 0x2bc9bdd52f173499 => android/content/ClipData
	i64 3171452383522110633, ; 89: 0x2c034323c5e6bca9 => android/view/MenuItem
	i64 3275116541604857862, ; 90: 0x2d738d246c5d0806 => java/security/PublicKey
	i64 3276740057418439988, ; 91: 0x2d7951b8a7b81d34 => crc640eda0984e46970d1/LicenseFeatureInfoParcelable
	i64 3312753486604898190, ; 92: 0x2df943be8d858f8e => android/app/Dialog
	i64 3450875314776543418, ; 93: 0x2fe3f8d0b56b90ba => android/location/Geocoder
	i64 3476617847597562063, ; 94: 0x303f6d8331d5f8cf => java/io/PrintWriter
	i64 3492966660860961054, ; 95: 0x307982abe8e6611e => android/widget/AdapterView
	i64 3530631042196079534, ; 96: 0x30ff523a0f1083ae => android/content/DialogInterface
	i64 3531967851957559493, ; 97: 0x3104120c5607a0c5 => androidx/core/content/ContextCompat
	i64 3543026216636859001, ; 98: 0x312b5b9280894279 => com/trimble/bluebottle/remoteapi/ApplicationId
	i64 3560635333444528101, ; 99: 0x3169eaf880aa67e5 => android/os/Parcelable$Creator
	i64 3648679180818523925, ; 100: 0x32a2b662280d2715 => android/content/pm/PackageManager
	i64 3656396631051491790, ; 101: 0x32be215d0fc259ce => java/net/InetSocketAddress
	i64 3664445150084014760, ; 102: 0x32dab972eda922a8 => android/text/InputFilter
	i64 3668991680153232620, ; 103: 0x32eae07e7365a4ec => android/view/MenuItem$OnMenuItemClickListener
	i64 3714328686890093176, ; 104: 0x338bf242e9208a78 => java/security/cert/CertificateException
	i64 3715390174298437201, ; 105: 0x338fb7adb508f651 => android/graphics/BlendMode
	i64 3789674823796578482, ; 106: 0x3497a12c76a2d8b2 => crc640eda0984e46970d1/ITMMService
	i64 3880992763041431256, ; 107: 0x35dc0e5b08f23ed8 => android/widget/SpinnerAdapter
	i64 3900488950398013983, ; 108: 0x36215208e2cf521f => androidx/browser/customtabs/CustomTabsIntent
	i64 3904020371636272704, ; 109: 0x362dddd7f744be40 => android/hardware/SensorEventListener
	i64 3926755326194143409, ; 110: 0x367ea32a11acd0b1 => androidx/core/content/FileProvider
	i64 3936478700004404583, ; 111: 0x36a12e8573a76d67 => java/net/SocketAddress
	i64 3940353796168302121, ; 112: 0x36aef2e695f93e29 => android/graphics/Canvas
	i64 3953980159308751169, ; 113: 0x36df5c017c8a6141 => java/util/zip/DeflaterOutputStream
	i64 3957166361670620563, ; 114: 0x36eaadd708809593 => javax/security/cert/Certificate
	i64 4032644632170534830, ; 115: 0x37f6d4ed55e917ae => android/text/GetChars
	i64 4038713937505232984, ; 116: 0x380c64ed9a6b2858 => com/trimble/empower/ModuleManager$PowerExtensionRelay
	i64 4104154920565321793, ; 117: 0x38f4e327cf77b041 => android/preference/PreferenceManager
	i64 4118479384366631626, ; 118: 0x3927c72deff14aca => com/trimble/empower/ModuleManager$EmpowerHardware
	i64 4159151334517947946, ; 119: 0x39b8461a4508be2a => android/hardware/Sensor
	i64 4175515025192399737, ; 120: 0x39f268cae6e63379 => android/widget/ArrayAdapter
	i64 4216519898928517408, ; 121: 0x3a8416820c001120 => android/os/IInterface
	i64 4261613918288373116, ; 122: 0x3b244b479970657c => com/trimble/empower/ModuleManager$ClientAgentAdapterImpl
	i64 4305371449952891808, ; 123: 0x3bbfc085dc8cf3a0 => java/lang/Class
	i64 4328468547648071486, ; 124: 0x3c11cf35fc03a73e => android/net/Uri
	i64 4346110607894790856, ; 125: 0x3c507c923a2042c8 => java/security/KeyStore$ProtectionParameter
	i64 4406641945990788791, ; 126: 0x3d278980a31df6b7 => android/content/BroadcastReceiver
	i64 4413535772071861656, ; 127: 0x3d40076699d29d98 => android/provider/MediaStore
	i64 4439985565385926555, ; 128: 0x3d9dff5900b0a79b => android/os/DeadObjectException
	i64 4475302575305267438, ; 129: 0x3e1b77fb277618ee => crc64a0e0a82d0db9a07d/GyroscopeListener
	i64 4515736889328482736, ; 130: 0x3eab1ec6838d39b0 => android/hardware/SensorEvent
	i64 4556463402233948134, ; 131: 0x3f3bcf52ba38e7e6 => com/trimble/empower/internal/IScioHostPin$Stub$Proxy
	i64 4581005161547667481, ; 132: 0x3f92ffec58479819 => com/trimble/empower/em940/EM940Device$PurgeType
	i64 4590799101254748484, ; 133: 0x3fb5cb75a178c944 => javax/net/ssl/TrustManagerFactory
	i64 4599497986064276105, ; 134: 0x3fd4b30c947c5a89 => crc640eda0984e46970d1/ITMMServiceStub_Proxy
	i64 4617823626917232209, ; 135: 0x4015ce1f55cebe51 => com/trimble/empower/abstractmsp/AbstractAgent
	i64 4642866827801349258, ; 136: 0x406ec6c7ea8b4c8a => android/text/Spannable
	i64 4648583443530926917, ; 137: 0x408316033c6c4b45 => crc6454360aa41b8b940b/BTSelectActivity_BthDevListAdapter
	i64 4677279611890181644, ; 138: 0x40e9090695e4260c => com/trimble/empower/internal/IModulePowerExtension$Stub
	i64 4687695855700552132, ; 139: 0x410e0a8b561a29c4 => android/security/KeyPairGeneratorSpec$Builder
	i64 4697149848814993238, ; 140: 0x412fa0e6a365bf56 => android/os/Binder
	i64 4721440782757463965, ; 141: 0x4185ed606c4d079d => android/view/Menu
	i64 4740665257139828038, ; 142: 0x41ca39ef2adaf546 => android/widget/Switch
	i64 4756101769800025001, ; 143: 0x4201115c588983a9 => javax/net/SocketFactory
	i64 4811279033347842203, ; 144: 0x42c518ca21fba09b => android/provider/ContactsContract$Contacts
	i64 4854019663787142402, ; 145: 0x435cf12aa0cb2d02 => crc64f64ae6bbda7f4685/ModuleManagerListener
	i64 4918771301615745967, ; 146: 0x4442fc7024313baf => com/trimble/empower/em940/EM940DeviceInfo
	i64 5076052451502285058, ; 147: 0x4671c2cf810b6102 => com/trimble/empower/ScioConfiguration
	i64 5116482030920680450, ; 148: 0x4701654c80b24402 => crc6454360aa41b8b940b/Configuration
	i64 5121018397111246860, ; 149: 0x47118319900e600c => android/widget/RemoteViews
	i64 5214467817578676657, ; 150: 0x485d82da477bc1b1 => java/lang/Error
	i64 5298993295171134929, ; 151: 0x4989ce53a1da25d1 => android/runtime/XmlReaderResourceParser
	i64 5326324864094620200, ; 152: 0x49eae83e6ab0ca28 => com/trimble/empower/internal/IScioConfigurationListener
	i64 5472095928524367906, ; 153: 0x4bf0ca412c8e6822 => crc64a0e0a82d0db9a07d/OrientationSensorListener
	i64 5515811426609156210, ; 154: 0x4c8c1944bb145072 => androidx/browser/customtabs/CustomTabsIntent$Builder
	i64 5517358870160988903, ; 155: 0x4c9198a9024bdae7 => android/text/NoCopySpan
	i64 5602058331881754211, ; 156: 0x4dbe825f32d44e63 => android/location/LocationManager
	i64 5670033795804000816, ; 157: 0x4eb001b2375b7230 => android/net/ConnectivityManager$NetworkCallback
	i64 5681742043617578465, ; 158: 0x4ed99a49173a4de1 => android/location/LocationListener
	i64 5685459202890798236, ; 159: 0x4ee6cf05ad48149c => android/location/Address
	i64 5701820723754511198, ; 160: 0x4f20efbd1c592b5e => android/provider/MediaStore$Video$Media
	i64 5783656401282052287, ; 161: 0x5043acda9554b0bf => com/trimble/empower/em940/internal/IEM940Manager$Default
	i64 5793982059409158284, ; 162: 0x50685bfc3611b08c => java/net/URLConnection
	i64 5852026601208300108, ; 163: 0x513693303d28424c => android/util/Size
	i64 5854524328054243249, ; 164: 0x513f72db968e3fb1 => java/security/cert/CertificateFactory
	i64 5856031836516749579, ; 165: 0x5144cdedc0f5910b => com/trimble/empower/internal/IScioHostPin
	i64 5856823971975629766, ; 166: 0x51479e5f29998bc6 => android/widget/LinearLayout$LayoutParams
	i64 5863491579902581685, ; 167: 0x515f4e869b965bb5 => crc64a0e0a82d0db9a07d/ConnectivityBroadcastReceiver
	i64 5866051512250042973, ; 168: 0x516866c54dce8a5d => android/database/ContentObserver
	i64 5867829888083332969, ; 169: 0x516eb831b1a08f69 => com/trimble/bluebottle/remoteapi/IBlueBottleService$Stub
	i64 5876434783844580997, ; 170: 0x518d4a4d1cce3e85 => android/bluetooth/BluetoothSocket
	i64 5880236631793339455, ; 171: 0x519acc0fd1480c3f => android/content/pm/PackageInfo
	i64 5924904683093798928, ; 172: 0x52397d6af3dab010 => java/security/KeyException
	i64 5928119462157283979, ; 173: 0x5244e93e07f6f28b => android/widget/Adapter
	i64 5978512019848753073, ; 174: 0x52f7f101ac7cefb1 => com/trimble/empower/ModulePowerExtension
	i64 5991054489085362647, ; 175: 0x53248050dbf141d7 => javax/security/cert/X509Certificate
	i64 6000768439507874839, ; 176: 0x5347031a303df417 => java/lang/Enum
	i64 6088673160641438471, ; 177: 0x547f4ffafd7ce307 => android/bluetooth/BluetoothManager
	i64 6116679261601087867, ; 178: 0x54e2cf6180bb417b => android/widget/LinearLayout
	i64 6128820827426396531, ; 179: 0x550df21216c41973 => com/trimble/bluebottle/remoteapi/IBlueBottleService
	i64 6160296053631453721, ; 180: 0x557dc49f43f18a19 => android/graphics/PorterDuff
	i64 6195408243508216495, ; 181: 0x55fa82f908d582af => android/provider/ContactsContract$CommonDataKinds$Email
	i64 6204908697973250647, ; 182: 0x561c4395f66d5a57 => android/app/Application$ActivityLifecycleCallbacks
	i64 6280657915462399493, ; 183: 0x5729611906e1b605 => com/trimble/empower/abstractmsp/AbstractManagerService$ModManCallback
	i64 6325051803365548829, ; 184: 0x57c7191a858c231d => android/os/RemoteException
	i64 6354596669460838012, ; 185: 0x58301000b617f67c => com/trimble/empower/em940/EM940Device$FlowControl
	i64 6365828534254197788, ; 186: 0x5857f75305445c1c => com/trimble/empower/ModuleManagerException
	i64 6366861123726987836, ; 187: 0x585ba2757dfdd23c => com/trimble/timservice/LicenseState
	i64 6446708716262054708, ; 188: 0x59774f6bdb36db34 => android/text/Html
	i64 6485460119900587756, ; 189: 0x5a00fb9e1ba306ec => android/view/DragEvent
	i64 6587918786611775557, ; 190: 0x5b6cfd3b6d1e0845 => android/security/keystore/KeyGenParameterSpec$Builder
	i64 6624740775713829269, ; 191: 0x5befcea2d977f195 => android/net/Uri$Builder
	i64 6737402552719891314, ; 192: 0x5d800fece7addb72 => android/content/ClipData$Item
	i64 6740334783866200195, ; 193: 0x5d8a7ac62b8de083 => javax/net/ssl/SSLSession
	i64 6858276022125792626, ; 194: 0x5f2d7db496630d72 => com/trimble/empower/em940/EM940Device
	i64 6875961628645093091, ; 195: 0x5f6c52abbc9b6ee3 => android/content/ContentResolver
	i64 6904973862930569132, ; 196: 0x5fd36524eb5557ac => crc64a0e0a82d0db9a07d/BatteryBroadcastReceiver
	i64 6905076803820513308, ; 197: 0x5fd3c2c4b682e81c => crc64775202d62a505530/c
	i64 6911927173407313576, ; 198: 0x5fec1924ac500ea8 => android/hardware/camera2/CameraMetadata
	i64 7070193737319878644, ; 199: 0x621e5fbe9e248ff4 => com/trimble/empower/em940/internal/IEM940EventListener
	i64 7124724141366219156, ; 200: 0x62e01adbb0c89194 => android/content/pm/PackageManager$NameNotFoundException
	i64 7140410014939704476, ; 201: 0x6317d513bb1f6c9c => crc64a0e0a82d0db9a07d/ClipboardChangeListener
	i64 7234103110495206036, ; 202: 0x6464b273799d7a94 => android/graphics/Bitmap$Config
	i64 7282188369651690282, ; 203: 0x650f87bd5091eb2a => android/os/Parcelable
	i64 7291810569935423650, ; 204: 0x6531b714667088a2 => android/os/Build$VERSION
	i64 7358194978034168623, ; 205: 0x661d8f58ddca332f => java/security/spec/AlgorithmParameterSpec
	i64 7359209775714103835, ; 206: 0x66212a4cdd05721b => android/content/pm/PackageItemInfo
	i64 7437796681088239247, ; 207: 0x67385cac9fd8068f => java/io/FileDescriptor
	i64 7439749276368724828, ; 208: 0x673f4c8ca3ed635c => com/trimble/empower/em940/EM940Device$State
	i64 7439929985656340741, ; 209: 0x673ff0e74cd2c105 => com/trimble/timservice/BuildConfig
	i64 7458598184393886548, ; 210: 0x67824388072bcb54 => com/trimble/timservice/ITimService$Stub$Proxy
	i64 7538647566659605431, ; 211: 0x689ea805399bd3b7 => android/view/WindowManager$LayoutParams
	i64 7542712316008827805, ; 212: 0x68ad18e36eab8b9d => android/speech/tts/TextToSpeech
	i64 7620119821450638162, ; 213: 0x69c01a9abf7a7352 => java/io/InterruptedIOException
	i64 7638054611473051568, ; 214: 0x69ffd23373e2afb0 => com/trimble/empower/ModuleListener
	i64 7658195837123306865, ; 215: 0x6a476089fc1c2571 => java/lang/Character
	i64 7681872310366473403, ; 216: 0x6a9b7e2a7d4d8cbb => android/widget/ListAdapter
	i64 7933543037734065265, ; 217: 0x6e199b5bee699471 => java/util/HashMap
	i64 7977746367831656039, ; 218: 0x6eb6a60dbac4c667 => android/widget/ProgressBar
	i64 7999688050061220247, ; 219: 0x6f0499e5b9d61997 => android/security/keystore/KeyGenParameterSpec
	i64 8036780567483204039, ; 220: 0x6f8861586e9941c7 => com/trimble/empower/ModuleStatus$ErrorCode
	i64 8058145963905469793, ; 221: 0x6fd4490f6ed54d61 => android/view/ContextMenu$ContextMenuInfo
	i64 8142727811387609942, ; 222: 0x7100c7cd6c73d356 => android/net/NetworkRequest
	i64 8144228351163665852, ; 223: 0x71061c8910c68dbc => crc6454360aa41b8b940b/AltGeoRelayService
	i64 8190305621607579207, ; 224: 0x71a9cf9199cdfe47 => java/nio/channels/spi/AbstractInterruptibleChannel
	i64 8322082217133783459, ; 225: 0x737df9af27dab9a3 => crc640e50ecb54de2b5d2/TCPCommunicator_NetworkCallback
	i64 8359576044705692187, ; 226: 0x74032e1f298c3a1b => com/trimble/empower/em940/internal/IEM940Device
	i64 8416619862292774857, ; 227: 0x74cdd72bed753fc9 => java/lang/IllegalArgumentException
	i64 8427024478828076046, ; 228: 0x74f2ce1d7e119c0e => android/text/TextWatcher
	i64 8462361838522003613, ; 229: 0x75705941b1ecf09d => android/os/IBinder
	i64 8487642170263250902, ; 230: 0x75ca29959b2aa7d6 => android/content/ContextWrapper
	i64 8513468764914715166, ; 231: 0x7625eabc43200a1e => java/lang/Math
	i64 8518020215908693968, ; 232: 0x7636164186d577d0 => com/trimble/empower/em940/internal/IEM940Manager$Stub
	i64 8580317852860802106, ; 233: 0x771369a06fb5e43a => com/trimble/empower/internal/IOvercurrentListener$Stub$Proxy
	i64 8587172038193766563, ; 234: 0x772bc378d1b4e0a3 => java/lang/Runnable
	i64 8614596961941480999, ; 235: 0x778d324b77ae6627 => mono/android/view/View_OnLongClickListenerImplementor
	i64 8625055343724598723, ; 236: 0x77b25a233aca15c3 => android/provider/MediaStore$Audio$Media
	i64 8630554667390783235, ; 237: 0x77c5e3be4c6acf03 => crc64a0e0a82d0db9a07d/TextToSpeechImplementation
	i64 8653109817022454725, ; 238: 0x781605884e119bc5 => java/security/KeyPairGeneratorSpi
	i64 8691079820342712383, ; 239: 0x789ceb0c9e17d83f => com/trimble/empower/ModuleStatus
	i64 8712284566595978930, ; 240: 0x78e840a7561246b2 => android/view/MenuItem$OnActionExpandListener
	i64 8719122993390795943, ; 241: 0x79008c2aa5ffbca7 => android/view/OrientationEventListener
	i64 8720029361076671000, ; 242: 0x7903c480d1f39218 => android/provider/Settings$Secure
	i64 8722435519081898203, ; 243: 0x790c50e4232060db => android/app/PendingIntent
	i64 8745560176225840448, ; 244: 0x795e78a4f1be6d40 => com/trimble/empower/internal/IOvercurrentListener$Stub
	i64 8784751650103882924, ; 245: 0x79e9b5150877f4ac => android/content/res/Configuration
	i64 8791980071548815232, ; 246: 0x7a03634b0cfb0780 => com/trimble/empower/internal/IAgentAdapter$Stub$Proxy
	i64 8858660133152532381, ; 247: 0x7af04874b678a79d => com/trimble/empower/internal/IAgentAdapter
	i64 8950391188589719199, ; 248: 0x7c362d5d64ad2e9f => java/lang/Boolean
	i64 8972627133644507939, ; 249: 0x7c852cd6cae98b23 => android/view/LayoutInflater
	i64 8990278976005563532, ; 250: 0x7cc3e3189c79648c => mono/com/trimble/empower/ScioLevelListenerImplementor
	i64 9000742728442691829, ; 251: 0x7ce90fd2d381c0f5 => java/io/Reader
	i64 9037871014886754982, ; 252: 0x7d6cf7cda81fcaa6 => com/trimble/bluebottle/remoteapi/IBlueBottleCallback
	i64 9146179778865887055, ; 253: 0x7eedc20ce329774f => java/util/Date
	i64 9154019302997878316, ; 254: 0x7f099c0e5641e62c => javax/net/ssl/KeyManager
	i64 9187009981601112352, ; 255: 0x7f7ed0e7454d6120 => android/view/ViewGroup$MarginLayoutParams
	i64 9217569019755338609, ; 256: 0x7feb622fcb299b71 => java/security/Principal
	i64 9286063777946211584, ; 257: 0x80deb9ce6e1b1500 => android/content/res/AssetFileDescriptor
	i64 9332122854233971226, ; 258: 0x81825c4aceeb9a1a => android/net/NetworkRequest$Builder
	i64 9355021183435591253, ; 259: 0x81d3b63388eece55 => android/graphics/drawable/Drawable
	i64 9360306727378170850, ; 260: 0x81e67d60221333e2 => android/hardware/SensorManager
	i64 9374080444557732201, ; 261: 0x82176c7f91cca969 => android/os/IBinder$DeathRecipient
	i64 9396528877132255336, ; 262: 0x82672d3a932b1068 => com/trimble/empower/em940/internal/IEM940Device$Default
	i64 9441848742105134620, ; 263: 0x83082f67e825361c => crc6454360aa41b8b940b/MainActivity
	i64 9477720623975991619, ; 264: 0x8387a0b1407b8943 => android/net/Network
	i64 9478593896738967145, ; 265: 0x838abaede94fce69 => android/widget/Toast
	i64 9511079172725584519, ; 266: 0x83fe241da0ecb287 => com/trimble/empower/BuildConfig
	i64 9529213839512244707, ; 267: 0x843e917fc4dd11e3 => com/trimble/empower/em940/EM940EventListener
	i64 9598060678881466514, ; 268: 0x85332955b15fd892 => java/util/zip/ZipEntry
	i64 9655659318546054185, ; 269: 0x85ffcafe0a20bc29 => java/io/FileNotFoundException
	i64 9658692325343451885, ; 270: 0x860a917ef6e35aed => android/provider/ContactsContract$Data
	i64 9667515047141612341, ; 271: 0x8629e9b6f59e9b35 => java/lang/Thread
	i64 9717657584051666027, ; 272: 0x86dc0e161a47bc6b => javax/crypto/AEADBadTagException
	i64 9739462872476052734, ; 273: 0x872985e1710a6cfe => com/trimble/empower/internal/ITestAgentControl$Stub
	i64 9785570804745343508, ; 274: 0x87cd54ccfd479214 => java/net/URL
	i64 9828763907004879390, ; 275: 0x8866c8b2ca34d21e => com/trimble/empower/ModuleManagerStatusCallback
	i64 9866983915955550238, ; 276: 0x88ee91981305f81e => java/lang/SecurityException
	i64 9869939015140501507, ; 277: 0x88f9113db837e803 => android/app/Activity
	i64 9876731445431192163, ; 278: 0x891132eba2db4a63 => com/trimble/timservice/ITimService
	i64 9903613304640537389, ; 279: 0x8970b3d437ee832d => java/io/Serializable
	i64 9942049212981248440, ; 280: 0x89f941157f3301b8 => java/lang/LinkageError
	i64 9977296435420958008, ; 281: 0x8a767a3efc098d38 => java/lang/NullPointerException
	i64 9990404136610222553, ; 282: 0x8aa50ba17d3ed1d9 => android/content/ClipboardManager$OnPrimaryClipChangedListener
	i64 10007037822135323730, ; 283: 0x8ae023e132464c52 => java/net/URLEncoder
	i64 10266059374509936169, ; 284: 0x8e785e9bf4bbce29 => java/lang/Long
	i64 10292610542543943941, ; 285: 0x8ed6b2c17fc5b905 => com/trimble/empower/internal/IAgentAdapter$Stub
	i64 10300674889386243088, ; 286: 0x8ef3593c90a73410 => javax/crypto/Cipher
	i64 10354448552699118825, ; 287: 0x8fb2641934b044e9 => android/view/View$OnLongClickListener
	i64 10384735276959433997, ; 288: 0x901dfdb6b5a2850d => android/provider/ContactsContract$CommonDataKinds$Phone
	i64 10409300788867753510, ; 289: 0x907543eaa8a7e626 => android/bluetooth/BluetoothDevice
	i64 10499957734077086001, ; 290: 0x91b757ed9047b931 => android/view/ViewGroup$LayoutParams
	i64 10528560983360194325, ; 291: 0x921cf66e8138c715 => mono/android/widget/CompoundButton_OnCheckedChangeListenerImplementor
	i64 10556732314164660806, ; 292: 0x92810c1b96ac0a46 => android/view/WindowManager
	i64 10565471938346028939, ; 293: 0x92a018bfe9790f8b => android/content/pm/ShortcutInfo
	i64 10582806380718996879, ; 294: 0x92ddae55497e3d8f => android/provider/DocumentsContract
	i64 10589642565195629679, ; 295: 0x92f5f7ce84d7846f => java/lang/UnsupportedOperationException
	i64 10592155553304916737, ; 296: 0x92fee55b286bb301 => androidx/browser/customtabs/CustomTabColorSchemeParams
	i64 10641631056935965321, ; 297: 0x93aeab10836ed289 => javax/crypto/spec/GCMParameterSpec
	i64 10655658609895831411, ; 298: 0x93e0810cb2ac7773 => android/content/res/ColorStateList
	i64 10685348952360151677, ; 299: 0x9449fc423e84ea7d => android/provider/Telephony
	i64 10715635008700845527, ; 300: 0x94b595443c5a8dd7 => android/provider/Settings$Global
	i64 10722894652849872693, ; 301: 0x94cf5fdfdb0d5f35 => java/lang/Short
	i64 10806379644683279356, ; 302: 0x95f7f9083d5bdbfc => com/trimble/empower/internal/ITestAgentControl$Stub$Proxy
	i64 10808978037618020601, ; 303: 0x96013441bd3890f9 => android/database/DataSetObserver
	i64 10826777706761711076, ; 304: 0x964070f629a66de4 => com/trimble/empower/internal/ITestAgentControl
	i64 10877661291534526915, ; 305: 0x96f5374ff4eea9c3 => crc64a0e0a82d0db9a07d/WebAuthenticatorCallbackActivity
	i64 10947937810016399212, ; 306: 0x97eee36efd186f6c => android/content/pm/SigningInfo
	i64 11005920483369566278, ; 307: 0x98bce25e25704046 => java/util/Random
	i64 11083086269215938900, ; 308: 0x99cf083dbba01954 => crc64a0e0a82d0db9a07d/ActivityLifecycleContextListener
	i64 11098475641896463473, ; 309: 0x9a05b4cb47906c71 => crc64a0e0a82d0db9a07d/AccelerometerListener
	i64 11112718717483603117, ; 310: 0x9a384ecbbc71d4ad => android/os/Handler
	i64 11240308327273157113, ; 311: 0x9bfd98deb4fb51f9 => android/graphics/RectF
	i64 11269552841768111550, ; 312: 0x9c657e99d7150dbe => android/hardware/camera2/CameraCharacteristics
	i64 11280841333105678042, ; 313: 0x9c8d996c8b4ed6da => java/util/function/IntConsumer
	i64 11373498917253313136, ; 314: 0x9dd6c901802c7270 => android/graphics/Bitmap$CompressFormat
	i64 11377176476226929887, ; 315: 0x9de3d9b9ec6fc4df => crc6405db95066ba03620/GenericParcelableCreator_1
	i64 11393831178655295976, ; 316: 0x9e1f05170284e9e8 => javax/net/ssl/SSLContext
	i64 11477377788559355920, ; 317: 0x9f47d649f809f010 => org/json/JSONObject
	i64 11482682312365990619, ; 318: 0x9f5aaeb9a93c62db => android/content/ContentProvider
	i64 11535591933768018538, ; 319: 0xa016a7bede1aaa6a => android/widget/CompoundButton
	i64 11549904604889637347, ; 320: 0xa049810b4c1861e3 => java/math/BigInteger
	i64 11570212739527803312, ; 321: 0xa091a72f5b4101b0 => com/trimble/empower/em940/internal/IEM940Manager
	i64 11573301743732151818, ; 322: 0xa09ca09e3190560a => mono/java/lang/RunnableImplementor
	i64 11585998938245262039, ; 323: 0xa0c9bca62a296ad7 => mono/android/runtime/JavaArray
	i64 11642736392037688837, ; 324: 0xa1934f100ceb6605 => android/provider/ContactsContract
	i64 11712899692065226922, ; 325: 0xa28c94365b5480aa => java/util/ArrayList
	i64 11741422788644480083, ; 326: 0xa2f1e9d14ad4a453 => com/trimble/empower/abstractmsp/AbstractManagerService
	i64 11763058807128842702, ; 327: 0xa33ec7a966f1e1ce => java/security/cert/Certificate
	i64 11775281241770826836, ; 328: 0xa36a33e6ba121c54 => com/trimble/empower/em940/EM940ApiStatusCallback
	i64 11818122314447746285, ; 329: 0xa40267a140c674ed => mono/com/trimble/empower/em940/EM940EventListenerImplementor
	i64 11848256383762947534, ; 330: 0xa46d766801f1ddce => com/trimble/empower/em940/internal/IEM940Device$Stub
	i64 11954228872253987625, ; 331: 0xa5e5f3d2b66adb29 => android/view/View
	i64 11978683345021741925, ; 332: 0xa63cd50958e8ab65 => javax/crypto/BadPaddingException
	i64 11989433154782493969, ; 333: 0xa66305ee7919fd11 => java/security/MessageDigest
	i64 12010988764752805573, ; 334: 0xa6af9aa5044c7ec5 => android/provider/MediaStore$Images
	i64 12016049636675011370, ; 335: 0xa6c1957b1579c32a => android/widget/EditText
	i64 12144849849415441964, ; 336: 0xa88b2c9784dd1e2c => javax/crypto/IllegalBlockSizeException
	i64 12178551107760647509, ; 337: 0xa902e7b531036d55 => android/content/pm/ShortcutInfo$Builder
	i64 12228984007958404582, ; 338: 0xa9b61429ce4b1de6 => android/content/Context
	i64 12426529965699990912, ; 339: 0xac73e72a4c4b8580 => java/lang/IndexOutOfBoundsException
	i64 12458575303368155603, ; 340: 0xace5c03ae4b6a1d3 => android/content/res/Resources
	i64 12473096163495768810, ; 341: 0xad1956e01a73f2ea => android/provider/MediaStore$Video
	i64 12476375190645835422, ; 342: 0xad24fd221af1069e => android/os/Looper
	i64 12488842103917764438, ; 343: 0xad5147b98bf5df56 => java/lang/IllegalStateException
	i64 12495827432006275238, ; 344: 0xad6a18d7fb50d0a6 => com/trimble/empower/em940/internal/IAvailabilityCallback$Default
	i64 12532121860257401396, ; 345: 0xadeb0a6f128cca34 => java/lang/Number
	i64 12568075173813774169, ; 346: 0xae6ac5c835936759 => android/hardware/camera2/CameraCharacteristics$Key
	i64 12578078447456146011, ; 347: 0xae8e4fb4d99ed25b => crc640947112d00c027ad/k
	i64 12610567535961206755, ; 348: 0xaf01bc5c3d0a6fe3 => android/widget/AbsSpinner
	i64 12621328865392909801, ; 349: 0xaf27f7bb7f20dde9 => android/app/ActionBar
	i64 12630324550237912157, ; 350: 0xaf47ed4296d37c5d => android/os/ParcelFileDescriptor
	i64 12740368432395772516, ; 351: 0xb0cee196808ce264 => mono/android/widget/AdapterView_OnItemSelectedListenerImplementor
	i64 12751697412850589334, ; 352: 0xb0f7213c503a1e96 => android/provider/Settings$System
	i64 12774266387958735952, ; 353: 0xb1474f99507e2450 => androidx/core/content/pm/PackageInfoCompat
	i64 12806567541869262104, ; 354: 0xb1ba1153c52a3518 => java/lang/Integer
	i64 12882710959019299141, ; 355: 0xb2c8955c98609145 => java/net/SocketTimeoutException
	i64 12947682723200973819, ; 356: 0xb3af68d644db3bfb => com/trimble/bluebottle/remoteapi/IBlueBottleCallback$Stub
	i64 13046320909237610371, ; 357: 0xb50dd7be9cdbe783 => android/content/res/XmlResourceParser
	i64 13095297719287712405, ; 358: 0xb5bbd7e4d2208a95 => android/graphics/SurfaceTexture
	i64 13096165904162462397, ; 359: 0xb5beed80dd2f9abd => java/security/GeneralSecurityException
	i64 13120818853233679472, ; 360: 0xb616833add3ddc70 => android/widget/AdapterView$OnItemClickListener
	i64 13191394589072141775, ; 361: 0xb7113f7cdda7adcf => android/app/AlertDialog$Builder
	i64 13199876575826672100, ; 362: 0xb72f61cf4d25f9e4 => com/trimble/empower/em940/internal/IAvailabilityCallback$Stub
	i64 13220557694854227449, ; 363: 0xb778db2d8e57e5f9 => com/trimble/empower/internal/IScioLevelListener$Stub$Proxy
	i64 13254333049494154057, ; 364: 0xb7f0d9af1dd1ab49 => crc6454360aa41b8b940b/BTSelectActivity
	i64 13273174976752683068, ; 365: 0xb833ca512af2883c => java/security/PrivateKey
	i64 13291089739636035741, ; 366: 0xb8736fb2f0d8509d => android/content/ComponentName
	i64 13335777145830317192, ; 367: 0xb91232a87cfd1c88 => android/graphics/Point
	i64 13357265713547428435, ; 368: 0xb95e8a658a7fc253 => crc649aea178664f9314c/k
	i64 13402681668680117407, ; 369: 0xb9ffe3f79b516c9f => android/view/ViewManager
	i64 13402779434266666368, ; 370: 0xba003ce26e602580 => mono/android/TypeManager
	i64 13449523322638373729, ; 371: 0xbaa64e340c311361 => javax/crypto/KeyGenerator
	i64 13491848569179882038, ; 372: 0xbb3cacca71544236 => android/app/AlertDialog
	i64 13493236796125990997, ; 373: 0xbb419b603751d055 => android/graphics/Rect
	i64 13496867506895340302, ; 374: 0xbb4e817cf102430e => crc64f64ae6bbda7f4685/ModuleListener
	i64 13498507636192219868, ; 375: 0xbb54552d4d2292dc => com/trimble/empower/internal/IModuleListener$Stub
	i64 13499562364224885079, ; 376: 0xbb5814724edb5157 => java/security/cert/X509Certificate
	i64 13499711530549716207, ; 377: 0xbb589c1ccca924ef => com/trimble/empower/abstractmsp/AbstractAgent$ModPowerExt
	i64 13501119006686247638, ; 378: 0xbb5d9c345fcefad6 => android/content/IntentSender
	i64 13502560151794130917, ; 379: 0xbb62baeb1e089fe5 => javax/security/auth/Subject
	i64 13534840448197869273, ; 380: 0xbbd569ad4e6c3ed9 => com/trimble/empower/OvercurrentListener
	i64 13556576098032765635, ; 381: 0xbc22a222a5cb4ac3 => android/util/DisplayMetrics
	i64 13621987437238906744, ; 382: 0xbd0b0566db756f78 => com/trimble/empower/internal/IScioLevelListener
	i64 13693791080030832438, ; 383: 0xbe0a1e6f39a68736 => android/provider/Telephony$Sms
	i64 13770727111868296170, ; 384: 0xbf1b735909c02bea => java/io/StringWriter
	i64 13789203013919682202, ; 385: 0xbf5d1715346dae9a => java/lang/RuntimeException
	i64 13796771312740371676, ; 386: 0xbf77fa6917308cdc => com/trimble/empower/internal/IOvercurrentListener
	i64 13805562342397192842, ; 387: 0xbf9735ce2f182a8a => android/util/AttributeSet
	i64 13839449095658730598, ; 388: 0xc00f99a0c1d6f466 => java/io/FileOutputStream
	i64 13877554026709814142, ; 389: 0xc096f9dc61548b7e => android/view/View$OnClickListener
	i64 13959986462581077347, ; 390: 0xc1bbd5b97b683563 => java/net/UnknownServiceException
	i64 13964986975709854436, ; 391: 0xc1cd99aa2c247ae4 => java/security/cert/CertificateEncodingException
	i64 14008091590880237307, ; 392: 0xc266bd15778d96fb => android/os/Process
	i64 14011367646130965200, ; 393: 0xc27260a385098ad0 => com/trimble/empower/internal/RemoteCallResult
	i64 14015229251220480166, ; 394: 0xc28018bf84a920a6 => com/trimble/empower/ModuleStatus$DetailedState
	i64 14031640676547298208, ; 395: 0xc2ba66da3d8603a0 => java/nio/channels/FileChannel
	i64 14122621771724408359, ; 396: 0xc3fda1ad30d4c627 => android/util/AndroidException
	i64 14146902927644867185, ; 397: 0xc453e5425a34ba71 => android/widget/CompoundButton$OnCheckedChangeListener
	i64 14160925941038085484, ; 398: 0xc485b71d9630756c => javax/net/ssl/KeyManagerFactory
	i64 14167891754637755728, ; 399: 0xc49e767c735e8550 => java/lang/Object
	i64 14180814796703042768, ; 400: 0xc4cc5feca7168cd0 => java/lang/ClassCastException
	i64 14206023932851353817, ; 401: 0xc525ef800c4d78d9 => mono/android/runtime/OutputStreamAdapter
	i64 14254302629814136516, ; 402: 0xc5d174b822fceec4 => android/webkit/MimeTypeMap
	i64 14296237994325564878, ; 403: 0xc66670b60c37ddce => android/content/SharedPreferences
	i64 14361336093130752981, ; 404: 0xc74db7164b0e03d5 => android/speech/tts/TextToSpeech$OnUtteranceCompletedListener
	i64 14361620789319229198, ; 405: 0xc74eba044a3cdf0e => android/os/Parcel
	i64 14416689944606507093, ; 406: 0xc8125f1f29378055 => com/trimble/empower/internal/IScioConfigurationListener$Stub$Proxy
	i64 14444627984296249385, ; 407: 0xc875a09eeca50829 => com/trimble/empower/em940/internal/IEM940DeviceStatusCallback$Stub
	i64 14480243895569103343, ; 408: 0xc8f4291a786a39ef => androidx/core/app/ActivityCompat
	i64 14501341618205132561, ; 409: 0xc93f1d5ecfb48711 => java/lang/Byte
	i64 14541627820561044636, ; 410: 0xc9ce3d753c7a949c => com/trimble/empower/internal/IModulePowerExtension
	i64 14569564621816213537, ; 411: 0xca317dd4a7743021 => androidx/core/app/ActivityCompat$PermissionCompatDelegate
	i64 14649586819325063784, ; 412: 0xcb4dc998681d7268 => mono/android/view/View_OnClickListenerImplementor
	i64 14684559126920293129, ; 413: 0xcbca08b94b4deb09 => java/lang/CharSequence
	i64 14741636905378601209, ; 414: 0xcc94d0a930e158f9 => com/trimble/empower/internal/IModulePowerExtension$Stub$Proxy
	i64 14808640800227433603, ; 415: 0xcd82dc5927e99c83 => android/net/wifi/WifiManager
	i64 14830759644181035942, ; 416: 0xcdd17151d49bfba6 => android/content/res/AssetManager
	i64 14906421499435880646, ; 417: 0xcede3f604a1f10c6 => com/trimble/empower/em940/internal/IEM940EventListener$Default
	i64 14934812915918164505, ; 418: 0xcf431d381037d219 => android/net/ConnectivityManager
	i64 14940408132235664607, ; 419: 0xcf56fe09e1439cdf => java/lang/Throwable
	i64 14940704599466395126, ; 420: 0xcf580bac893d45f6 => android/util/Log
	i64 14958283146692506398, ; 421: 0xcf967f450051b31e => android/widget/ToggleButton
	i64 14999328625793830073, ; 422: 0xd02851ea51ca0cb9 => com/trimble/empower/em940/em940lib/BuildConfig
	i64 15102224934851433618, ; 423: 0xd195e1902fddd492 => android/graphics/PointF
	i64 15114515369987516226, ; 424: 0xd1c18ba61c49a742 => android/speech/tts/TextToSpeech$OnInitListener
	i64 15142650489578038267, ; 425: 0xd22580641d31a3fb => java/lang/StackTraceElement
	i64 15154413195907540292, ; 426: 0xd24f4a82998fa544 => com/trimble/empower/em940/EM940Manager$AvailabilityCallback
	i64 15173351290658902524, ; 427: 0xd292929b63f051fc => crc64a0e0a82d0db9a07d/WebAuthenticatorIntermediateActivity
	i64 15178898666151156562, ; 428: 0xd2a647ea65971b52 => javax/net/ssl/HostnameVerifier
	i64 15183122999177041308, ; 429: 0xd2b549ec9302d59c => org/xmlpull/v1/XmlPullParser
	i64 15187719665669744680, ; 430: 0xd2c59e916475a828 => androidx/browser/customtabs/CustomTabsServiceConnection
	i64 15218759190516972430, ; 431: 0xd333e4d9f0f9bb8e => com/trimble/empower/ModuleManager
	i64 15223859190564664402, ; 432: 0xd34603463c2c3452 => android/text/Editable
	i64 15227253633559603018, ; 433: 0xd35212809518a74a => android/widget/Spinner
	i64 15295416057057826855, ; 434: 0xd4443bdd84bcd827 => android/widget/AdapterView$OnItemSelectedListener
	i64 15298816789066891989, ; 435: 0xd45050d0241d42d5 => androidx/core/view/DragAndDropPermissionsCompat
	i64 15314479138388385801, ; 436: 0xd487f5a303c52009 => java/util/zip/ZipOutputStream
	i64 15372017254581008822, ; 437: 0xd554603fa479f9b6 => java/security/InvalidAlgorithmParameterException
	i64 15454418390339497104, ; 438: 0xd6791fa51e732c90 => java/security/InvalidKeyException
	i64 15462149522156220739, ; 439: 0xd69497118418f143 => java/security/NoSuchAlgorithmException
	i64 15491006674716798107, ; 440: 0xd6fb1c7eebb32c9b => androidx/browser/customtabs/CustomTabsClient
	i64 15529409965027140022, ; 441: 0xd7838c15b8daa1b6 => android/app/UiModeManager
	i64 15625622630723498443, ; 442: 0xd8d95cfe9a9431cb => mono/android/text/TextWatcherImplementor
	i64 15633873768898914415, ; 443: 0xd8f6ad5c6a84686f => java/io/Writer
	i64 15645438581444444576, ; 444: 0xd91fc37f2a3001a0 => java/lang/Appendable
	i64 15694161194160243941, ; 445: 0xd9ccdc7471a444e5 => androidx/core/content/PermissionChecker
	i64 15699556301161391558, ; 446: 0xd9e00746adf865c6 => android/view/WindowMetrics
	i64 15767615218119146656, ; 447: 0xdad1d2801f08fca0 => javax/net/ssl/SSLSessionContext
	i64 15773716038598610423, ; 448: 0xdae77f2a148d4df7 => java/security/KeyStore$LoadStoreParameter
	i64 15788118993200236606, ; 449: 0xdb1aaa93454c483e => javax/crypto/spec/IvParameterSpec
	i64 15799365448008084158, ; 450: 0xdb429f2a951a2abe => android/os/LocaleList
	i64 15821109769797920314, ; 451: 0xdb8fdf830544663a => com/trimble/empower/internal/IModuleManagerService$Stub
	i64 15844004444849296506, ; 452: 0xdbe13618f2f3d47a => android/widget/ListView
	i64 15888603495552893685, ; 453: 0xdc7fa8b2a175c2f5 => javax/net/ssl/TrustManager
	i64 15896143924811176167, ; 454: 0xdc9a72ada0da98e7 => java/net/SocketException
	i64 15958735587383603777, ; 455: 0xdd78d176b6627241 => java/security/KeyPairGenerator
	i64 15974014737617358851, ; 456: 0xddaf19c518899003 => com/trimble/empower/internal/IModuleManagerService
	i64 16002286839467779661, ; 457: 0xde138b18c462a64d => android/os/Environment
	i64 16003229482241506982, ; 458: 0xde16e46ce4103ea6 => android/graphics/Bitmap
	i64 16065782154202443679, ; 459: 0xdef51fbfc40bef9f => androidx/browser/customtabs/CustomTabsSession
	i64 16066423801151412293, ; 460: 0xdef76752d682d845 => android/runtime/XmlReaderPullParser
	i64 16114332120846746518, ; 461: 0xdfa19bafbfbcc396 => android/hardware/camera2/CameraManager
	i64 16118150644112224899, ; 462: 0xdfaf2c9cfa8af283 => java/util/Locale
	i64 16190485749137921007, ; 463: 0xe0b029020a63d3ef => android/content/ServiceConnection
	i64 16218544741485660249, ; 464: 0xe113d8834a084859 => android/os/Vibrator
	i64 16240055937653829839, ; 465: 0xe16044d4f05470cf => android/provider/ContactsContract$CommonDataKinds
	i64 16256324013830154471, ; 466: 0xe19a108f95ffa8e7 => com/trimble/empower/AgentAdapter
	i64 16281235200369999056, ; 467: 0xe1f291272ea3bcd0 => android/text/ClipboardManager
	i64 16296617486920550708, ; 468: 0xe2293742dc518934 => java/io/FilterOutputStream
	i64 16314168557433322311, ; 469: 0xe26791dde7a8fb47 => android/view/ContextThemeWrapper
	i64 16406390071788871345, ; 470: 0xe3af34d873789eb1 => com/trimble/empower/internal/IScioConfigurationListener$Stub
	i64 16410496677374749578, ; 471: 0xe3bdcbc812a66b8a => android/location/Criteria
	i64 16413651262945443612, ; 472: 0xe3c900dc43013f1c => android/content/DialogInterface$OnClickListener
	i64 16510466397656947047, ; 473: 0xe520f5b6645d9967 => android/provider/MediaStore$Audio
	i64 16542847110558016359, ; 474: 0xe593ffcc9e686367 => android/app/Application
	i64 16577015184339193001, ; 475: 0xe60d637b3acb4ca9 => com/trimble/empower/ScioHostPin
	i64 16603717322881265010, ; 476: 0xe66c40ef55566d72 => mono/android/runtime/JavaObject
	i64 16623515267007593274, ; 477: 0xe6b2970f68453b3a => com/trimble/empower/em940/internal/IEM940EventListener$Stub
	i64 16640446916514625925, ; 478: 0xe6eebe4e42993985 => java/util/Locale$Category
	i64 16644685935360006363, ; 479: 0xe6fdcdabbf12d8db => com/trimble/empower/internal/IScioLevelListener$Stub
	i64 16646452011251683774, ; 480: 0xe70413e8553e51be => android/content/pm/ComponentInfo
	i64 16723123314454325679, ; 481: 0xe814780d351a69af => mono/android/runtime/InputStreamAdapter
	i64 16732048506261937943, ; 482: 0xe8342d775c591f17 => android/graphics/PorterDuff$Mode
	i64 16820920459986807567, ; 483: 0xe96fea098c9d2b0f => com/trimble/empower/em940/EM940Manager
	i64 16832017439803262409, ; 484: 0xe99756ae80a745c9 => android/view/ViewGroup
	i64 16878061737430998064, ; 485: 0xea3aebb9f4afdc30 => android/content/SharedPreferences$Editor
	i64 16894727746734946765, ; 486: 0xea76215fa11279cd => androidx/browser/customtabs/CustomTabsSession$PendingSession
	i64 16901170452203573289, ; 487: 0xea8d04fae3ec1029 => crc64a0e0a82d0db9a07d/SingleLocationListener
	i64 16929297323090841527, ; 488: 0xeaf0f23857cd0fb7 => crc6445b87d7bcfab1150/BBServiceConnection
	i64 16950392789332311313, ; 489: 0xeb3be46f537ebd11 => android/content/pm/ShortcutManager
	i64 17057841802739383518, ; 490: 0xecb9a0be4716fcde => android/os/VibrationEffect
	i64 17064122633455698822, ; 491: 0xeccff12022d48386 => android/net/NetworkCapabilities
	i64 17068958298440960180, ; 492: 0xece11f23208788b4 => android/util/SizeF
	i64 17092281054178439282, ; 493: 0xed33fb0f5b71f072 => crc640eda0984e46970d1/ITMMServiceStub
	i64 17125416866214736517, ; 494: 0xeda9b3e7cd367285 => java/io/OutputStream
	i64 17148068341143545133, ; 495: 0xedfa2d4d49fba52d => com/trimble/empower/abstractmsp/AbstractManagerService$ModListener
	i64 17163176023095185573, ; 496: 0xee2fd9a89a1710a5 => android/graphics/Matrix
	i64 17238696279294372110, ; 497: 0xef3c26ee7630690e => xamarin/essentials/fileProvider
	i64 17250803327944390836, ; 498: 0xef672a3a644078b4 => android/widget/Toolbar
	i64 17264269287952196016, ; 499: 0xef9701728713a1b0 => crc64a0e0a82d0db9a07d/EnergySaverBroadcastReceiver
	i64 17274115370627879660, ; 500: 0xefb9fc684b63d2ec => com/trimble/empower/internal/HashMapWrapper
	i64 17296586735193580360, ; 501: 0xf009d1fe91f26348 => android/content/pm/ApplicationInfo
	i64 17312589003384955623, ; 502: 0xf042abf8f91822e7 => android/view/KeyEvent
	i64 17331727000568967805, ; 503: 0xf086a9e12cf5b27d => android/content/pm/ActivityInfo
	i64 17337702882535894412, ; 504: 0xf09be4e99ed16d8c => java/security/Key
	i64 17356379843024169959, ; 505: 0xf0de3f825a34abe7 => android/graphics/Color
	i64 17407046679165606066, ; 506: 0xf19240ba6c4f18b2 => mono/android/widget/AdapterView_OnItemClickListenerImplementor
	i64 17420831341480619603, ; 507: 0xf1c339ce38f1ae53 => com/trimble/empower/internal/IScioHostPin$Stub
	i64 17485531046532206351, ; 508: 0xf2a915d8319dcf0f => android/database/CharArrayBuffer
	i64 17490083481060646178, ; 509: 0xf2b94242748c1d22 => java/util/Enumeration
	i64 17498018958444438720, ; 510: 0xf2d57388c321a4c0 => java/lang/Double
	i64 17519581955836770800, ; 511: 0xf3220ef752fe79f0 => java/security/KeyStore
	i64 17542023464739623563, ; 512: 0xf371c966495f528b => android/view/Display
	i64 17605619666541934257, ; 513: 0xf453b9cee2dcf6b1 => java/net/Proxy$Type
	i64 17645817129531856090, ; 514: 0xf4e28930113fd4da => java/io/Closeable
	i64 17735351525224774696, ; 515: 0xf620a03f0bb47c28 => com/trimble/empower/em940/internal/IAvailabilityCallback
	i64 17826434765037567068, ; 516: 0xf76437f865bcfc5c => javax/crypto/SecretKey
	i64 17859888160793648683, ; 517: 0xf7db11a8104f5e2b => android/content/ClipboardManager
	i64 17887179733055676237, ; 518: 0xf83c073266599f4d => com/trimble/empower/ScioConfiguration$ScioPinType
	i64 17991732386849449663, ; 519: 0xf9af7948140d66bf => crc640e50ecb54de2b5d2/CatalystFacadeActivity
	i64 18001325595512914928, ; 520: 0xf9d18e4106b1c3f0 => android/hardware/Camera$Parameters
	i64 18213852175163534091, ; 521: 0xfcc49a0d5c192b0b => android/content/SharedPreferences$OnSharedPreferenceChangeListener
	i64 18216578448169670053, ; 522: 0xfcce4995423095a5 => javax/net/ssl/SSLSocketFactory
	i64 18252438040904317073, ; 523: 0xfd4dafb150edb891 => java/security/MessageDigestSpi
	i64 18323076787180290332, ; 524: 0xfe48a5421416411c => android/widget/BaseAdapter
	i64 18339760747756664167, ; 525: 0xfe83eb3b5bb03567 => com/trimble/empower/ScioConfigurationListener
	i64 18376227498216060055, ; 526: 0xff05798c56eef497 => android/hardware/usb/UsbDevice
	i64 18401512074820890716, ; 527: 0xff5f4dbc95c2b05c => java/lang/Float
	i64 18401692079723824300 ; 528: 0xff5ff1733e0ec4ac => java/util/Collection
], align 8

@module0_managed_to_java = internal dso_local constant [60 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554435, ; uint32_t type_token_id (0x2000003)
		i32 266; uint32_t java_map_index (0x10a)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554437, ; uint32_t type_token_id (0x2000005)
		i32 466; uint32_t java_map_index (0x1d2)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554439, ; uint32_t type_token_id (0x2000007)
		i32 214; uint32_t java_map_index (0xd6)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554442, ; uint32_t type_token_id (0x200000a)
		i32 42; uint32_t java_map_index (0x2a)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554444, ; uint32_t type_token_id (0x200000c)
		i32 275; uint32_t java_map_index (0x113)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554446, ; uint32_t type_token_id (0x200000e)
		i32 174; uint32_t java_map_index (0xae)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554448, ; uint32_t type_token_id (0x2000010)
		i32 380; uint32_t java_map_index (0x17c)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554450, ; uint32_t type_token_id (0x2000012)
		i32 39; uint32_t java_map_index (0x27)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554452, ; uint32_t type_token_id (0x2000014)
		i32 525; uint32_t java_map_index (0x20d)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554455, ; uint32_t type_token_id (0x2000017)
		i32 61; uint32_t java_map_index (0x3d)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554457, ; uint32_t type_token_id (0x2000019)
		i32 475; uint32_t java_map_index (0x1db)
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 33554459, ; uint32_t type_token_id (0x200001b)
		i32 80; uint32_t java_map_index (0x50)
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 33554461, ; uint32_t type_token_id (0x200001d)
		i32 250; uint32_t java_map_index (0xfa)
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 33554462, ; uint32_t type_token_id (0x200001e)
		i32 431; uint32_t java_map_index (0x1af)
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 33554463, ; uint32_t type_token_id (0x200001f)
		i32 122; uint32_t java_map_index (0x7a)
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 33554464, ; uint32_t type_token_id (0x2000020)
		i32 118; uint32_t java_map_index (0x76)
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 33554465, ; uint32_t type_token_id (0x2000021)
		i32 45; uint32_t java_map_index (0x2d)
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 33554466, ; uint32_t type_token_id (0x2000022)
		i32 116; uint32_t java_map_index (0x74)
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 33554467, ; uint32_t type_token_id (0x2000023)
		i32 22; uint32_t java_map_index (0x16)
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 33554468, ; uint32_t type_token_id (0x2000024)
		i32 186; uint32_t java_map_index (0xba)
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 33554469, ; uint32_t type_token_id (0x2000025)
		i32 239; uint32_t java_map_index (0xef)
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 33554470, ; uint32_t type_token_id (0x2000026)
		i32 394; uint32_t java_map_index (0x18a)
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 33554471, ; uint32_t type_token_id (0x2000027)
		i32 220; uint32_t java_map_index (0xdc)
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 33554472, ; uint32_t type_token_id (0x2000028)
		i32 147; uint32_t java_map_index (0x93)
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 33554473, ; uint32_t type_token_id (0x2000029)
		i32 518; uint32_t java_map_index (0x206)
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 33554474, ; uint32_t type_token_id (0x200002a)
		i32 500; uint32_t java_map_index (0x1f4)
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 33554475, ; uint32_t type_token_id (0x200002b)
		i32 285; uint32_t java_map_index (0x11d)
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 33554476, ; uint32_t type_token_id (0x200002c)
		i32 246; uint32_t java_map_index (0xf6)
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 33554479, ; uint32_t type_token_id (0x200002f)
		i32 247; uint32_t java_map_index (0xf7)
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 33554480, ; uint32_t type_token_id (0x2000030)
		i32 375; uint32_t java_map_index (0x177)
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 33554481, ; uint32_t type_token_id (0x2000031)
		i32 31; uint32_t java_map_index (0x1f)
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 33554484, ; uint32_t type_token_id (0x2000034)
		i32 10; uint32_t java_map_index (0xa)
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 33554485, ; uint32_t type_token_id (0x2000035)
		i32 451; uint32_t java_map_index (0x1c3)
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 33554486, ; uint32_t type_token_id (0x2000036)
		i32 21; uint32_t java_map_index (0x15)
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 33554489, ; uint32_t type_token_id (0x2000039)
		i32 456; uint32_t java_map_index (0x1c8)
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 33554490, ; uint32_t type_token_id (0x200003a)
		i32 138; uint32_t java_map_index (0x8a)
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 33554491, ; uint32_t type_token_id (0x200003b)
		i32 414; uint32_t java_map_index (0x19e)
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 33554494, ; uint32_t type_token_id (0x200003e)
		i32 410; uint32_t java_map_index (0x19a)
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 33554495, ; uint32_t type_token_id (0x200003f)
		i32 244; uint32_t java_map_index (0xf4)
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 33554496, ; uint32_t type_token_id (0x2000040)
		i32 233; uint32_t java_map_index (0xe9)
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 33554499, ; uint32_t type_token_id (0x2000043)
		i32 386; uint32_t java_map_index (0x182)
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 33554500, ; uint32_t type_token_id (0x2000044)
		i32 470; uint32_t java_map_index (0x1d6)
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 33554501, ; uint32_t type_token_id (0x2000045)
		i32 406; uint32_t java_map_index (0x196)
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 33554504, ; uint32_t type_token_id (0x2000048)
		i32 152; uint32_t java_map_index (0x98)
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 33554505, ; uint32_t type_token_id (0x2000049)
		i32 507; uint32_t java_map_index (0x1fb)
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 33554506, ; uint32_t type_token_id (0x200004a)
		i32 131; uint32_t java_map_index (0x83)
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 33554509, ; uint32_t type_token_id (0x200004d)
		i32 165; uint32_t java_map_index (0xa5)
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 33554510, ; uint32_t type_token_id (0x200004e)
		i32 479; uint32_t java_map_index (0x1df)
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 33554511, ; uint32_t type_token_id (0x200004f)
		i32 363; uint32_t java_map_index (0x16b)
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 33554514, ; uint32_t type_token_id (0x2000052)
		i32 382; uint32_t java_map_index (0x17e)
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 33554515, ; uint32_t type_token_id (0x2000053)
		i32 273; uint32_t java_map_index (0x111)
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 33554516, ; uint32_t type_token_id (0x2000054)
		i32 302; uint32_t java_map_index (0x12e)
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 33554519, ; uint32_t type_token_id (0x2000057)
		i32 304; uint32_t java_map_index (0x130)
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 33554520, ; uint32_t type_token_id (0x2000058)
		i32 393; uint32_t java_map_index (0x189)
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 33554521, ; uint32_t type_token_id (0x2000059)
		i32 135; uint32_t java_map_index (0x87)
	}, ; 54
	%struct.TypeMapModuleEntry {
		i32 33554522, ; uint32_t type_token_id (0x200005a)
		i32 377; uint32_t java_map_index (0x179)
	}, ; 55
	%struct.TypeMapModuleEntry {
		i32 33554524, ; uint32_t type_token_id (0x200005c)
		i32 326; uint32_t java_map_index (0x146)
	}, ; 56
	%struct.TypeMapModuleEntry {
		i32 33554525, ; uint32_t type_token_id (0x200005d)
		i32 495; uint32_t java_map_index (0x1ef)
	}, ; 57
	%struct.TypeMapModuleEntry {
		i32 33554526, ; uint32_t type_token_id (0x200005e)
		i32 183; uint32_t java_map_index (0xb7)
	}, ; 58
	%struct.TypeMapModuleEntry {
		i32 33554528, ; uint32_t type_token_id (0x2000060)
		i32 56; uint32_t java_map_index (0x38)
	} ; 59
], align 4

@module0_managed_to_java_duplicates = internal dso_local constant [11 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554477, ; uint32_t type_token_id (0x200002d)
		i32 285; uint32_t java_map_index (0x11d)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554482, ; uint32_t type_token_id (0x2000032)
		i32 375; uint32_t java_map_index (0x177)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554487, ; uint32_t type_token_id (0x2000037)
		i32 451; uint32_t java_map_index (0x1c3)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554492, ; uint32_t type_token_id (0x200003c)
		i32 138; uint32_t java_map_index (0x8a)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554497, ; uint32_t type_token_id (0x2000041)
		i32 244; uint32_t java_map_index (0xf4)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554502, ; uint32_t type_token_id (0x2000046)
		i32 470; uint32_t java_map_index (0x1d6)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554507, ; uint32_t type_token_id (0x200004b)
		i32 507; uint32_t java_map_index (0x1fb)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554512, ; uint32_t type_token_id (0x2000050)
		i32 479; uint32_t java_map_index (0x1df)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554517, ; uint32_t type_token_id (0x2000055)
		i32 273; uint32_t java_map_index (0x111)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554523, ; uint32_t type_token_id (0x200005b)
		i32 135; uint32_t java_map_index (0x87)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554527, ; uint32_t type_token_id (0x200005f)
		i32 326; uint32_t java_map_index (0x146)
	} ; 10
], align 4

@module1_managed_to_java = internal dso_local constant [373 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554569, ; uint32_t type_token_id (0x2000089)
		i32 429; uint32_t java_map_index (0x1ad)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554571, ; uint32_t type_token_id (0x200008b)
		i32 59; uint32_t java_map_index (0x3b)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554573, ; uint32_t type_token_id (0x200008d)
		i32 81; uint32_t java_map_index (0x51)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554574, ; uint32_t type_token_id (0x200008e)
		i32 317; uint32_t java_map_index (0x13d)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554575, ; uint32_t type_token_id (0x200008f)
		i32 114; uint32_t java_map_index (0x72)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554577, ; uint32_t type_token_id (0x2000091)
		i32 175; uint32_t java_map_index (0xaf)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554579, ; uint32_t type_token_id (0x2000093)
		i32 379; uint32_t java_map_index (0x17b)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554580, ; uint32_t type_token_id (0x2000094)
		i32 30; uint32_t java_map_index (0x1e)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554581, ; uint32_t type_token_id (0x2000095)
		i32 143; uint32_t java_map_index (0x8f)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554583, ; uint32_t type_token_id (0x2000097)
		i32 12; uint32_t java_map_index (0xc)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554585, ; uint32_t type_token_id (0x2000099)
		i32 428; uint32_t java_map_index (0x1ac)
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 33554587, ; uint32_t type_token_id (0x200009b)
		i32 254; uint32_t java_map_index (0xfe)
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 33554589, ; uint32_t type_token_id (0x200009d)
		i32 193; uint32_t java_map_index (0xc1)
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 33554591, ; uint32_t type_token_id (0x200009f)
		i32 447; uint32_t java_map_index (0x1bf)
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 33554593, ; uint32_t type_token_id (0x20000a1)
		i32 453; uint32_t java_map_index (0x1c5)
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 33554595, ; uint32_t type_token_id (0x20000a3)
		i32 398; uint32_t java_map_index (0x18e)
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 33554596, ; uint32_t type_token_id (0x20000a4)
		i32 316; uint32_t java_map_index (0x13c)
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 33554597, ; uint32_t type_token_id (0x20000a5)
		i32 522; uint32_t java_map_index (0x20a)
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 33554599, ; uint32_t type_token_id (0x20000a7)
		i32 133; uint32_t java_map_index (0x85)
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 33554600, ; uint32_t type_token_id (0x20000a8)
		i32 272; uint32_t java_map_index (0x110)
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 33554601, ; uint32_t type_token_id (0x20000a9)
		i32 332; uint32_t java_map_index (0x14c)
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 33554602, ; uint32_t type_token_id (0x20000aa)
		i32 286; uint32_t java_map_index (0x11e)
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 33554603, ; uint32_t type_token_id (0x20000ab)
		i32 336; uint32_t java_map_index (0x150)
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 33554604, ; uint32_t type_token_id (0x20000ac)
		i32 516; uint32_t java_map_index (0x204)
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 33554606, ; uint32_t type_token_id (0x20000ae)
		i32 371; uint32_t java_map_index (0x173)
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 33554609, ; uint32_t type_token_id (0x20000b1)
		i32 297; uint32_t java_map_index (0x129)
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 33554610, ; uint32_t type_token_id (0x20000b2)
		i32 449; uint32_t java_map_index (0x1c1)
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 33554612, ; uint32_t type_token_id (0x20000b4)
		i32 62; uint32_t java_map_index (0x3e)
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 33554615, ; uint32_t type_token_id (0x20000b7)
		i32 348; uint32_t java_map_index (0x15c)
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 33554617, ; uint32_t type_token_id (0x20000b9)
		i32 95; uint32_t java_map_index (0x5f)
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 33554618, ; uint32_t type_token_id (0x20000ba)
		i32 360; uint32_t java_map_index (0x168)
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 33554621, ; uint32_t type_token_id (0x20000bd)
		i32 506; uint32_t java_map_index (0x1fa)
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 33554622, ; uint32_t type_token_id (0x20000be)
		i32 434; uint32_t java_map_index (0x1b2)
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 33554626, ; uint32_t type_token_id (0x20000c2)
		i32 351; uint32_t java_map_index (0x15f)
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 33554633, ; uint32_t type_token_id (0x20000c9)
		i32 120; uint32_t java_map_index (0x78)
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 33554634, ; uint32_t type_token_id (0x20000ca)
		i32 524; uint32_t java_map_index (0x20c)
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 33554636, ; uint32_t type_token_id (0x20000cc)
		i32 5; uint32_t java_map_index (0x5)
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 33554637, ; uint32_t type_token_id (0x20000cd)
		i32 319; uint32_t java_map_index (0x13f)
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 33554638, ; uint32_t type_token_id (0x20000ce)
		i32 397; uint32_t java_map_index (0x18d)
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 33554641, ; uint32_t type_token_id (0x20000d1)
		i32 291; uint32_t java_map_index (0x123)
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 33554646, ; uint32_t type_token_id (0x20000d6)
		i32 335; uint32_t java_map_index (0x14f)
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 33554647, ; uint32_t type_token_id (0x20000d7)
		i32 173; uint32_t java_map_index (0xad)
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 33554649, ; uint32_t type_token_id (0x20000d9)
		i32 216; uint32_t java_map_index (0xd8)
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 33554651, ; uint32_t type_token_id (0x20000db)
		i32 107; uint32_t java_map_index (0x6b)
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 33554653, ; uint32_t type_token_id (0x20000dd)
		i32 178; uint32_t java_map_index (0xb2)
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 33554654, ; uint32_t type_token_id (0x20000de)
		i32 166; uint32_t java_map_index (0xa6)
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 33554655, ; uint32_t type_token_id (0x20000df)
		i32 452; uint32_t java_map_index (0x1c4)
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 33554656, ; uint32_t type_token_id (0x20000e0)
		i32 218; uint32_t java_map_index (0xda)
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 33554657, ; uint32_t type_token_id (0x20000e1)
		i32 149; uint32_t java_map_index (0x95)
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 33554658, ; uint32_t type_token_id (0x20000e2)
		i32 433; uint32_t java_map_index (0x1b1)
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 33554659, ; uint32_t type_token_id (0x20000e3)
		i32 142; uint32_t java_map_index (0x8e)
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 33554660, ; uint32_t type_token_id (0x20000e4)
		i32 7; uint32_t java_map_index (0x7)
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 33554661, ; uint32_t type_token_id (0x20000e5)
		i32 265; uint32_t java_map_index (0x109)
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 33554662, ; uint32_t type_token_id (0x20000e6)
		i32 421; uint32_t java_map_index (0x1a5)
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 33554663, ; uint32_t type_token_id (0x20000e7)
		i32 498; uint32_t java_map_index (0x1f2)
	}, ; 54
	%struct.TypeMapModuleEntry {
		i32 33554668, ; uint32_t type_token_id (0x20000ec)
		i32 402; uint32_t java_map_index (0x192)
	}, ; 55
	%struct.TypeMapModuleEntry {
		i32 33554669, ; uint32_t type_token_id (0x20000ed)
		i32 396; uint32_t java_map_index (0x18c)
	}, ; 56
	%struct.TypeMapModuleEntry {
		i32 33554670, ; uint32_t type_token_id (0x20000ee)
		i32 381; uint32_t java_map_index (0x17d)
	}, ; 57
	%struct.TypeMapModuleEntry {
		i32 33554671, ; uint32_t type_token_id (0x20000ef)
		i32 387; uint32_t java_map_index (0x183)
	}, ; 58
	%struct.TypeMapModuleEntry {
		i32 33554673, ; uint32_t type_token_id (0x20000f1)
		i32 420; uint32_t java_map_index (0x1a4)
	}, ; 59
	%struct.TypeMapModuleEntry {
		i32 33554674, ; uint32_t type_token_id (0x20000f2)
		i32 163; uint32_t java_map_index (0xa3)
	}, ; 60
	%struct.TypeMapModuleEntry {
		i32 33554675, ; uint32_t type_token_id (0x20000f3)
		i32 492; uint32_t java_map_index (0x1ec)
	}, ; 61
	%struct.TypeMapModuleEntry {
		i32 33554676, ; uint32_t type_token_id (0x20000f4)
		i32 467; uint32_t java_map_index (0x1d3)
	}, ; 62
	%struct.TypeMapModuleEntry {
		i32 33554678, ; uint32_t type_token_id (0x20000f6)
		i32 188; uint32_t java_map_index (0xbc)
	}, ; 63
	%struct.TypeMapModuleEntry {
		i32 33554679, ; uint32_t type_token_id (0x20000f7)
		i32 432; uint32_t java_map_index (0x1b0)
	}, ; 64
	%struct.TypeMapModuleEntry {
		i32 33554682, ; uint32_t type_token_id (0x20000fa)
		i32 115; uint32_t java_map_index (0x73)
	}, ; 65
	%struct.TypeMapModuleEntry {
		i32 33554685, ; uint32_t type_token_id (0x20000fd)
		i32 102; uint32_t java_map_index (0x66)
	}, ; 66
	%struct.TypeMapModuleEntry {
		i32 33554687, ; uint32_t type_token_id (0x20000ff)
		i32 155; uint32_t java_map_index (0x9b)
	}, ; 67
	%struct.TypeMapModuleEntry {
		i32 33554689, ; uint32_t type_token_id (0x2000101)
		i32 136; uint32_t java_map_index (0x88)
	}, ; 68
	%struct.TypeMapModuleEntry {
		i32 33554692, ; uint32_t type_token_id (0x2000104)
		i32 26; uint32_t java_map_index (0x1a)
	}, ; 69
	%struct.TypeMapModuleEntry {
		i32 33554695, ; uint32_t type_token_id (0x2000107)
		i32 228; uint32_t java_map_index (0xe4)
	}, ; 70
	%struct.TypeMapModuleEntry {
		i32 33554702, ; uint32_t type_token_id (0x200010e)
		i32 442; uint32_t java_map_index (0x1ba)
	}, ; 71
	%struct.TypeMapModuleEntry {
		i32 33554703, ; uint32_t type_token_id (0x200010f)
		i32 24; uint32_t java_map_index (0x18)
	}, ; 72
	%struct.TypeMapModuleEntry {
		i32 33554704, ; uint32_t type_token_id (0x2000110)
		i32 212; uint32_t java_map_index (0xd4)
	}, ; 73
	%struct.TypeMapModuleEntry {
		i32 33554705, ; uint32_t type_token_id (0x2000111)
		i32 424; uint32_t java_map_index (0x1a8)
	}, ; 74
	%struct.TypeMapModuleEntry {
		i32 33554707, ; uint32_t type_token_id (0x2000113)
		i32 404; uint32_t java_map_index (0x194)
	}, ; 75
	%struct.TypeMapModuleEntry {
		i32 33554712, ; uint32_t type_token_id (0x2000118)
		i32 73; uint32_t java_map_index (0x49)
	}, ; 76
	%struct.TypeMapModuleEntry {
		i32 33554713, ; uint32_t type_token_id (0x2000119)
		i32 139; uint32_t java_map_index (0x8b)
	}, ; 77
	%struct.TypeMapModuleEntry {
		i32 33554714, ; uint32_t type_token_id (0x200011a)
		i32 219; uint32_t java_map_index (0xdb)
	}, ; 78
	%struct.TypeMapModuleEntry {
		i32 33554715, ; uint32_t type_token_id (0x200011b)
		i32 190; uint32_t java_map_index (0xbe)
	}, ; 79
	%struct.TypeMapModuleEntry {
		i32 33554717, ; uint32_t type_token_id (0x200011d)
		i32 324; uint32_t java_map_index (0x144)
	}, ; 80
	%struct.TypeMapModuleEntry {
		i32 33554718, ; uint32_t type_token_id (0x200011e)
		i32 465; uint32_t java_map_index (0x1d1)
	}, ; 81
	%struct.TypeMapModuleEntry {
		i32 33554719, ; uint32_t type_token_id (0x200011f)
		i32 181; uint32_t java_map_index (0xb5)
	}, ; 82
	%struct.TypeMapModuleEntry {
		i32 33554720, ; uint32_t type_token_id (0x2000120)
		i32 288; uint32_t java_map_index (0x120)
	}, ; 83
	%struct.TypeMapModuleEntry {
		i32 33554721, ; uint32_t type_token_id (0x2000121)
		i32 144; uint32_t java_map_index (0x90)
	}, ; 84
	%struct.TypeMapModuleEntry {
		i32 33554722, ; uint32_t type_token_id (0x2000122)
		i32 270; uint32_t java_map_index (0x10e)
	}, ; 85
	%struct.TypeMapModuleEntry {
		i32 33554723, ; uint32_t type_token_id (0x2000123)
		i32 294; uint32_t java_map_index (0x126)
	}, ; 86
	%struct.TypeMapModuleEntry {
		i32 33554724, ; uint32_t type_token_id (0x2000124)
		i32 127; uint32_t java_map_index (0x7f)
	}, ; 87
	%struct.TypeMapModuleEntry {
		i32 33554725, ; uint32_t type_token_id (0x2000125)
		i32 473; uint32_t java_map_index (0x1d9)
	}, ; 88
	%struct.TypeMapModuleEntry {
		i32 33554726, ; uint32_t type_token_id (0x2000126)
		i32 236; uint32_t java_map_index (0xec)
	}, ; 89
	%struct.TypeMapModuleEntry {
		i32 33554727, ; uint32_t type_token_id (0x2000127)
		i32 334; uint32_t java_map_index (0x14e)
	}, ; 90
	%struct.TypeMapModuleEntry {
		i32 33554728, ; uint32_t type_token_id (0x2000128)
		i32 54; uint32_t java_map_index (0x36)
	}, ; 91
	%struct.TypeMapModuleEntry {
		i32 33554729, ; uint32_t type_token_id (0x2000129)
		i32 341; uint32_t java_map_index (0x155)
	}, ; 92
	%struct.TypeMapModuleEntry {
		i32 33554730, ; uint32_t type_token_id (0x200012a)
		i32 160; uint32_t java_map_index (0xa0)
	}, ; 93
	%struct.TypeMapModuleEntry {
		i32 33554731, ; uint32_t type_token_id (0x200012b)
		i32 32; uint32_t java_map_index (0x20)
	}, ; 94
	%struct.TypeMapModuleEntry {
		i32 33554732, ; uint32_t type_token_id (0x200012c)
		i32 300; uint32_t java_map_index (0x12c)
	}, ; 95
	%struct.TypeMapModuleEntry {
		i32 33554733, ; uint32_t type_token_id (0x200012d)
		i32 3; uint32_t java_map_index (0x3)
	}, ; 96
	%struct.TypeMapModuleEntry {
		i32 33554734, ; uint32_t type_token_id (0x200012e)
		i32 242; uint32_t java_map_index (0xf2)
	}, ; 97
	%struct.TypeMapModuleEntry {
		i32 33554735, ; uint32_t type_token_id (0x200012f)
		i32 352; uint32_t java_map_index (0x160)
	}, ; 98
	%struct.TypeMapModuleEntry {
		i32 33554736, ; uint32_t type_token_id (0x2000130)
		i32 299; uint32_t java_map_index (0x12b)
	}, ; 99
	%struct.TypeMapModuleEntry {
		i32 33554737, ; uint32_t type_token_id (0x2000131)
		i32 383; uint32_t java_map_index (0x17f)
	}, ; 100
	%struct.TypeMapModuleEntry {
		i32 33554739, ; uint32_t type_token_id (0x2000133)
		i32 117; uint32_t java_map_index (0x75)
	}, ; 101
	%struct.TypeMapModuleEntry {
		i32 33554740, ; uint32_t type_token_id (0x2000134)
		i32 49; uint32_t java_map_index (0x31)
	}, ; 102
	%struct.TypeMapModuleEntry {
		i32 33554741, ; uint32_t type_token_id (0x2000135)
		i32 140; uint32_t java_map_index (0x8c)
	}, ; 103
	%struct.TypeMapModuleEntry {
		i32 33554742, ; uint32_t type_token_id (0x2000136)
		i32 84; uint32_t java_map_index (0x54)
	}, ; 104
	%struct.TypeMapModuleEntry {
		i32 33554743, ; uint32_t type_token_id (0x2000137)
		i32 204; uint32_t java_map_index (0xcc)
	}, ; 105
	%struct.TypeMapModuleEntry {
		i32 33554744, ; uint32_t type_token_id (0x2000138)
		i32 6; uint32_t java_map_index (0x6)
	}, ; 106
	%struct.TypeMapModuleEntry {
		i32 33554745, ; uint32_t type_token_id (0x2000139)
		i32 128; uint32_t java_map_index (0x80)
	}, ; 107
	%struct.TypeMapModuleEntry {
		i32 33554746, ; uint32_t type_token_id (0x200013a)
		i32 457; uint32_t java_map_index (0x1c9)
	}, ; 108
	%struct.TypeMapModuleEntry {
		i32 33554747, ; uint32_t type_token_id (0x200013b)
		i32 310; uint32_t java_map_index (0x136)
	}, ; 109
	%struct.TypeMapModuleEntry {
		i32 33554748, ; uint32_t type_token_id (0x200013c)
		i32 261; uint32_t java_map_index (0x105)
	}, ; 110
	%struct.TypeMapModuleEntry {
		i32 33554750, ; uint32_t type_token_id (0x200013e)
		i32 229; uint32_t java_map_index (0xe5)
	}, ; 111
	%struct.TypeMapModuleEntry {
		i32 33554752, ; uint32_t type_token_id (0x2000140)
		i32 121; uint32_t java_map_index (0x79)
	}, ; 112
	%struct.TypeMapModuleEntry {
		i32 33554754, ; uint32_t type_token_id (0x2000142)
		i32 99; uint32_t java_map_index (0x63)
	}, ; 113
	%struct.TypeMapModuleEntry {
		i32 33554756, ; uint32_t type_token_id (0x2000144)
		i32 203; uint32_t java_map_index (0xcb)
	}, ; 114
	%struct.TypeMapModuleEntry {
		i32 33554758, ; uint32_t type_token_id (0x2000146)
		i32 450; uint32_t java_map_index (0x1c2)
	}, ; 115
	%struct.TypeMapModuleEntry {
		i32 33554759, ; uint32_t type_token_id (0x2000147)
		i32 342; uint32_t java_map_index (0x156)
	}, ; 116
	%struct.TypeMapModuleEntry {
		i32 33554760, ; uint32_t type_token_id (0x2000148)
		i32 405; uint32_t java_map_index (0x195)
	}, ; 117
	%struct.TypeMapModuleEntry {
		i32 33554761, ; uint32_t type_token_id (0x2000149)
		i32 350; uint32_t java_map_index (0x15e)
	}, ; 118
	%struct.TypeMapModuleEntry {
		i32 33554762, ; uint32_t type_token_id (0x200014a)
		i32 77; uint32_t java_map_index (0x4d)
	}, ; 119
	%struct.TypeMapModuleEntry {
		i32 33554763, ; uint32_t type_token_id (0x200014b)
		i32 392; uint32_t java_map_index (0x188)
	}, ; 120
	%struct.TypeMapModuleEntry {
		i32 33554764, ; uint32_t type_token_id (0x200014c)
		i32 184; uint32_t java_map_index (0xb8)
	}, ; 121
	%struct.TypeMapModuleEntry {
		i32 33554765, ; uint32_t type_token_id (0x200014d)
		i32 490; uint32_t java_map_index (0x1ea)
	}, ; 122
	%struct.TypeMapModuleEntry {
		i32 33554767, ; uint32_t type_token_id (0x200014f)
		i32 464; uint32_t java_map_index (0x1d0)
	}, ; 123
	%struct.TypeMapModuleEntry {
		i32 33554772, ; uint32_t type_token_id (0x2000154)
		i32 418; uint32_t java_map_index (0x1a2)
	}, ; 124
	%struct.TypeMapModuleEntry {
		i32 33554773, ; uint32_t type_token_id (0x2000155)
		i32 157; uint32_t java_map_index (0x9d)
	}, ; 125
	%struct.TypeMapModuleEntry {
		i32 33554774, ; uint32_t type_token_id (0x2000156)
		i32 4; uint32_t java_map_index (0x4)
	}, ; 126
	%struct.TypeMapModuleEntry {
		i32 33554775, ; uint32_t type_token_id (0x2000157)
		i32 264; uint32_t java_map_index (0x108)
	}, ; 127
	%struct.TypeMapModuleEntry {
		i32 33554776, ; uint32_t type_token_id (0x2000158)
		i32 491; uint32_t java_map_index (0x1eb)
	}, ; 128
	%struct.TypeMapModuleEntry {
		i32 33554777, ; uint32_t type_token_id (0x2000159)
		i32 83; uint32_t java_map_index (0x53)
	}, ; 129
	%struct.TypeMapModuleEntry {
		i32 33554778, ; uint32_t type_token_id (0x200015a)
		i32 222; uint32_t java_map_index (0xde)
	}, ; 130
	%struct.TypeMapModuleEntry {
		i32 33554779, ; uint32_t type_token_id (0x200015b)
		i32 258; uint32_t java_map_index (0x102)
	}, ; 131
	%struct.TypeMapModuleEntry {
		i32 33554780, ; uint32_t type_token_id (0x200015c)
		i32 124; uint32_t java_map_index (0x7c)
	}, ; 132
	%struct.TypeMapModuleEntry {
		i32 33554781, ; uint32_t type_token_id (0x200015d)
		i32 191; uint32_t java_map_index (0xbf)
	}, ; 133
	%struct.TypeMapModuleEntry {
		i32 33554786, ; uint32_t type_token_id (0x2000162)
		i32 415; uint32_t java_map_index (0x19f)
	}, ; 134
	%struct.TypeMapModuleEntry {
		i32 33554787, ; uint32_t type_token_id (0x2000163)
		i32 159; uint32_t java_map_index (0x9f)
	}, ; 135
	%struct.TypeMapModuleEntry {
		i32 33554788, ; uint32_t type_token_id (0x2000164)
		i32 471; uint32_t java_map_index (0x1d7)
	}, ; 136
	%struct.TypeMapModuleEntry {
		i32 33554789, ; uint32_t type_token_id (0x2000165)
		i32 93; uint32_t java_map_index (0x5d)
	}, ; 137
	%struct.TypeMapModuleEntry {
		i32 33554792, ; uint32_t type_token_id (0x2000168)
		i32 158; uint32_t java_map_index (0x9e)
	}, ; 138
	%struct.TypeMapModuleEntry {
		i32 33554794, ; uint32_t type_token_id (0x200016a)
		i32 87; uint32_t java_map_index (0x57)
	}, ; 139
	%struct.TypeMapModuleEntry {
		i32 33554795, ; uint32_t type_token_id (0x200016b)
		i32 156; uint32_t java_map_index (0x9c)
	}, ; 140
	%struct.TypeMapModuleEntry {
		i32 33554799, ; uint32_t type_token_id (0x200016f)
		i32 17; uint32_t java_map_index (0x11)
	}, ; 141
	%struct.TypeMapModuleEntry {
		i32 33554800, ; uint32_t type_token_id (0x2000170)
		i32 520; uint32_t java_map_index (0x208)
	}, ; 142
	%struct.TypeMapModuleEntry {
		i32 33554801, ; uint32_t type_token_id (0x2000171)
		i32 109; uint32_t java_map_index (0x6d)
	}, ; 143
	%struct.TypeMapModuleEntry {
		i32 33554803, ; uint32_t type_token_id (0x2000173)
		i32 119; uint32_t java_map_index (0x77)
	}, ; 144
	%struct.TypeMapModuleEntry {
		i32 33554804, ; uint32_t type_token_id (0x2000174)
		i32 130; uint32_t java_map_index (0x82)
	}, ; 145
	%struct.TypeMapModuleEntry {
		i32 33554805, ; uint32_t type_token_id (0x2000175)
		i32 260; uint32_t java_map_index (0x104)
	}, ; 146
	%struct.TypeMapModuleEntry {
		i32 33554810, ; uint32_t type_token_id (0x200017a)
		i32 526; uint32_t java_map_index (0x20e)
	}, ; 147
	%struct.TypeMapModuleEntry {
		i32 33554811, ; uint32_t type_token_id (0x200017b)
		i32 312; uint32_t java_map_index (0x138)
	}, ; 148
	%struct.TypeMapModuleEntry {
		i32 33554812, ; uint32_t type_token_id (0x200017c)
		i32 346; uint32_t java_map_index (0x15a)
	}, ; 149
	%struct.TypeMapModuleEntry {
		i32 33554813, ; uint32_t type_token_id (0x200017d)
		i32 461; uint32_t java_map_index (0x1cd)
	}, ; 150
	%struct.TypeMapModuleEntry {
		i32 33554814, ; uint32_t type_token_id (0x200017e)
		i32 198; uint32_t java_map_index (0xc6)
	}, ; 151
	%struct.TypeMapModuleEntry {
		i32 33554816, ; uint32_t type_token_id (0x2000180)
		i32 508; uint32_t java_map_index (0x1fc)
	}, ; 152
	%struct.TypeMapModuleEntry {
		i32 33554817, ; uint32_t type_token_id (0x2000181)
		i32 168; uint32_t java_map_index (0xa8)
	}, ; 153
	%struct.TypeMapModuleEntry {
		i32 33554819, ; uint32_t type_token_id (0x2000183)
		i32 303; uint32_t java_map_index (0x12f)
	}, ; 154
	%struct.TypeMapModuleEntry {
		i32 33554821, ; uint32_t type_token_id (0x2000185)
		i32 55; uint32_t java_map_index (0x37)
	}, ; 155
	%struct.TypeMapModuleEntry {
		i32 33554824, ; uint32_t type_token_id (0x2000188)
		i32 50; uint32_t java_map_index (0x32)
	}, ; 156
	%struct.TypeMapModuleEntry {
		i32 33554825, ; uint32_t type_token_id (0x2000189)
		i32 289; uint32_t java_map_index (0x121)
	}, ; 157
	%struct.TypeMapModuleEntry {
		i32 33554826, ; uint32_t type_token_id (0x200018a)
		i32 177; uint32_t java_map_index (0xb1)
	}, ; 158
	%struct.TypeMapModuleEntry {
		i32 33554827, ; uint32_t type_token_id (0x200018b)
		i32 170; uint32_t java_map_index (0xaa)
	}, ; 159
	%struct.TypeMapModuleEntry {
		i32 33554830, ; uint32_t type_token_id (0x200018e)
		i32 349; uint32_t java_map_index (0x15d)
	}, ; 160
	%struct.TypeMapModuleEntry {
		i32 33554832, ; uint32_t type_token_id (0x2000190)
		i32 277; uint32_t java_map_index (0x115)
	}, ; 161
	%struct.TypeMapModuleEntry {
		i32 33554833, ; uint32_t type_token_id (0x2000191)
		i32 372; uint32_t java_map_index (0x174)
	}, ; 162
	%struct.TypeMapModuleEntry {
		i32 33554834, ; uint32_t type_token_id (0x2000192)
		i32 361; uint32_t java_map_index (0x169)
	}, ; 163
	%struct.TypeMapModuleEntry {
		i32 33554835, ; uint32_t type_token_id (0x2000193)
		i32 474; uint32_t java_map_index (0x1da)
	}, ; 164
	%struct.TypeMapModuleEntry {
		i32 33554836, ; uint32_t type_token_id (0x2000194)
		i32 182; uint32_t java_map_index (0xb6)
	}, ; 165
	%struct.TypeMapModuleEntry {
		i32 33554838, ; uint32_t type_token_id (0x2000196)
		i32 92; uint32_t java_map_index (0x5c)
	}, ; 166
	%struct.TypeMapModuleEntry {
		i32 33554839, ; uint32_t type_token_id (0x2000197)
		i32 243; uint32_t java_map_index (0xf3)
	}, ; 167
	%struct.TypeMapModuleEntry {
		i32 33554840, ; uint32_t type_token_id (0x2000198)
		i32 86; uint32_t java_map_index (0x56)
	}, ; 168
	%struct.TypeMapModuleEntry {
		i32 33554842, ; uint32_t type_token_id (0x200019a)
		i32 441; uint32_t java_map_index (0x1b9)
	}, ; 169
	%struct.TypeMapModuleEntry {
		i32 33554848, ; uint32_t type_token_id (0x20001a0)
		i32 211; uint32_t java_map_index (0xd3)
	}, ; 170
	%struct.TypeMapModuleEntry {
		i32 33554849, ; uint32_t type_token_id (0x20001a1)
		i32 11; uint32_t java_map_index (0xb)
	}, ; 171
	%struct.TypeMapModuleEntry {
		i32 33554851, ; uint32_t type_token_id (0x20001a3)
		i32 469; uint32_t java_map_index (0x1d5)
	}, ; 172
	%struct.TypeMapModuleEntry {
		i32 33554852, ; uint32_t type_token_id (0x20001a4)
		i32 512; uint32_t java_map_index (0x200)
	}, ; 173
	%struct.TypeMapModuleEntry {
		i32 33554853, ; uint32_t type_token_id (0x20001a5)
		i32 189; uint32_t java_map_index (0xbd)
	}, ; 174
	%struct.TypeMapModuleEntry {
		i32 33554854, ; uint32_t type_token_id (0x20001a6)
		i32 221; uint32_t java_map_index (0xdd)
	}, ; 175
	%struct.TypeMapModuleEntry {
		i32 33554856, ; uint32_t type_token_id (0x20001a8)
		i32 141; uint32_t java_map_index (0x8d)
	}, ; 176
	%struct.TypeMapModuleEntry {
		i32 33554858, ; uint32_t type_token_id (0x20001aa)
		i32 240; uint32_t java_map_index (0xf0)
	}, ; 177
	%struct.TypeMapModuleEntry {
		i32 33554860, ; uint32_t type_token_id (0x20001ac)
		i32 103; uint32_t java_map_index (0x67)
	}, ; 178
	%struct.TypeMapModuleEntry {
		i32 33554862, ; uint32_t type_token_id (0x20001ae)
		i32 89; uint32_t java_map_index (0x59)
	}, ; 179
	%struct.TypeMapModuleEntry {
		i32 33554864, ; uint32_t type_token_id (0x20001b0)
		i32 58; uint32_t java_map_index (0x3a)
	}, ; 180
	%struct.TypeMapModuleEntry {
		i32 33554866, ; uint32_t type_token_id (0x20001b2)
		i32 66; uint32_t java_map_index (0x42)
	}, ; 181
	%struct.TypeMapModuleEntry {
		i32 33554868, ; uint32_t type_token_id (0x20001b4)
		i32 369; uint32_t java_map_index (0x171)
	}, ; 182
	%struct.TypeMapModuleEntry {
		i32 33554870, ; uint32_t type_token_id (0x20001b6)
		i32 292; uint32_t java_map_index (0x124)
	}, ; 183
	%struct.TypeMapModuleEntry {
		i32 33554872, ; uint32_t type_token_id (0x20001b8)
		i32 502; uint32_t java_map_index (0x1f6)
	}, ; 184
	%struct.TypeMapModuleEntry {
		i32 33554873, ; uint32_t type_token_id (0x20001b9)
		i32 249; uint32_t java_map_index (0xf9)
	}, ; 185
	%struct.TypeMapModuleEntry {
		i32 33554875, ; uint32_t type_token_id (0x20001bb)
		i32 57; uint32_t java_map_index (0x39)
	}, ; 186
	%struct.TypeMapModuleEntry {
		i32 33554876, ; uint32_t type_token_id (0x20001bc)
		i32 241; uint32_t java_map_index (0xf1)
	}, ; 187
	%struct.TypeMapModuleEntry {
		i32 33554878, ; uint32_t type_token_id (0x20001be)
		i32 331; uint32_t java_map_index (0x14b)
	}, ; 188
	%struct.TypeMapModuleEntry {
		i32 33554879, ; uint32_t type_token_id (0x20001bf)
		i32 389; uint32_t java_map_index (0x185)
	}, ; 189
	%struct.TypeMapModuleEntry {
		i32 33554881, ; uint32_t type_token_id (0x20001c1)
		i32 412; uint32_t java_map_index (0x19c)
	}, ; 190
	%struct.TypeMapModuleEntry {
		i32 33554882, ; uint32_t type_token_id (0x20001c2)
		i32 287; uint32_t java_map_index (0x11f)
	}, ; 191
	%struct.TypeMapModuleEntry {
		i32 33554886, ; uint32_t type_token_id (0x20001c6)
		i32 235; uint32_t java_map_index (0xeb)
	}, ; 192
	%struct.TypeMapModuleEntry {
		i32 33554892, ; uint32_t type_token_id (0x20001cc)
		i32 484; uint32_t java_map_index (0x1e4)
	}, ; 193
	%struct.TypeMapModuleEntry {
		i32 33554893, ; uint32_t type_token_id (0x20001cd)
		i32 290; uint32_t java_map_index (0x122)
	}, ; 194
	%struct.TypeMapModuleEntry {
		i32 33554894, ; uint32_t type_token_id (0x20001ce)
		i32 255; uint32_t java_map_index (0xff)
	}, ; 195
	%struct.TypeMapModuleEntry {
		i32 33554896, ; uint32_t type_token_id (0x20001d0)
		i32 75; uint32_t java_map_index (0x4b)
	}, ; 196
	%struct.TypeMapModuleEntry {
		i32 33554898, ; uint32_t type_token_id (0x20001d2)
		i32 446; uint32_t java_map_index (0x1be)
	}, ; 197
	%struct.TypeMapModuleEntry {
		i32 33554930, ; uint32_t type_token_id (0x20001f2)
		i32 481; uint32_t java_map_index (0x1e1)
	}, ; 198
	%struct.TypeMapModuleEntry {
		i32 33554932, ; uint32_t type_token_id (0x20001f4)
		i32 323; uint32_t java_map_index (0x143)
	}, ; 199
	%struct.TypeMapModuleEntry {
		i32 33554934, ; uint32_t type_token_id (0x20001f6)
		i32 528; uint32_t java_map_index (0x210)
	}, ; 200
	%struct.TypeMapModuleEntry {
		i32 33554936, ; uint32_t type_token_id (0x20001f8)
		i32 217; uint32_t java_map_index (0xd9)
	}, ; 201
	%struct.TypeMapModuleEntry {
		i32 33554945, ; uint32_t type_token_id (0x2000201)
		i32 325; uint32_t java_map_index (0x145)
	}, ; 202
	%struct.TypeMapModuleEntry {
		i32 33554947, ; uint32_t type_token_id (0x2000203)
		i32 476; uint32_t java_map_index (0x1dc)
	}, ; 203
	%struct.TypeMapModuleEntry {
		i32 33554948, ; uint32_t type_token_id (0x2000204)
		i32 35; uint32_t java_map_index (0x23)
	}, ; 204
	%struct.TypeMapModuleEntry {
		i32 33554949, ; uint32_t type_token_id (0x2000205)
		i32 29; uint32_t java_map_index (0x1d)
	}, ; 205
	%struct.TypeMapModuleEntry {
		i32 33554962, ; uint32_t type_token_id (0x2000212)
		i32 401; uint32_t java_map_index (0x191)
	}, ; 206
	%struct.TypeMapModuleEntry {
		i32 33554975, ; uint32_t type_token_id (0x200021f)
		i32 151; uint32_t java_map_index (0x97)
	}, ; 207
	%struct.TypeMapModuleEntry {
		i32 33554976, ; uint32_t type_token_id (0x2000220)
		i32 460; uint32_t java_map_index (0x1cc)
	}, ; 208
	%struct.TypeMapModuleEntry {
		i32 33554977, ; uint32_t type_token_id (0x2000221)
		i32 458; uint32_t java_map_index (0x1ca)
	}, ; 209
	%struct.TypeMapModuleEntry {
		i32 33554978, ; uint32_t type_token_id (0x2000222)
		i32 314; uint32_t java_map_index (0x13a)
	}, ; 210
	%struct.TypeMapModuleEntry {
		i32 33554979, ; uint32_t type_token_id (0x2000223)
		i32 202; uint32_t java_map_index (0xca)
	}, ; 211
	%struct.TypeMapModuleEntry {
		i32 33554981, ; uint32_t type_token_id (0x2000225)
		i32 105; uint32_t java_map_index (0x69)
	}, ; 212
	%struct.TypeMapModuleEntry {
		i32 33554982, ; uint32_t type_token_id (0x2000226)
		i32 112; uint32_t java_map_index (0x70)
	}, ; 213
	%struct.TypeMapModuleEntry {
		i32 33554983, ; uint32_t type_token_id (0x2000227)
		i32 505; uint32_t java_map_index (0x1f9)
	}, ; 214
	%struct.TypeMapModuleEntry {
		i32 33554984, ; uint32_t type_token_id (0x2000228)
		i32 496; uint32_t java_map_index (0x1f0)
	}, ; 215
	%struct.TypeMapModuleEntry {
		i32 33554985, ; uint32_t type_token_id (0x2000229)
		i32 367; uint32_t java_map_index (0x16f)
	}, ; 216
	%struct.TypeMapModuleEntry {
		i32 33554986, ; uint32_t type_token_id (0x200022a)
		i32 423; uint32_t java_map_index (0x1a7)
	}, ; 217
	%struct.TypeMapModuleEntry {
		i32 33554987, ; uint32_t type_token_id (0x200022b)
		i32 180; uint32_t java_map_index (0xb4)
	}, ; 218
	%struct.TypeMapModuleEntry {
		i32 33554988, ; uint32_t type_token_id (0x200022c)
		i32 482; uint32_t java_map_index (0x1e2)
	}, ; 219
	%struct.TypeMapModuleEntry {
		i32 33554989, ; uint32_t type_token_id (0x200022d)
		i32 373; uint32_t java_map_index (0x175)
	}, ; 220
	%struct.TypeMapModuleEntry {
		i32 33554990, ; uint32_t type_token_id (0x200022e)
		i32 311; uint32_t java_map_index (0x137)
	}, ; 221
	%struct.TypeMapModuleEntry {
		i32 33554991, ; uint32_t type_token_id (0x200022f)
		i32 358; uint32_t java_map_index (0x166)
	}, ; 222
	%struct.TypeMapModuleEntry {
		i32 33554994, ; uint32_t type_token_id (0x2000232)
		i32 259; uint32_t java_map_index (0x103)
	}, ; 223
	%struct.TypeMapModuleEntry {
		i32 33554996, ; uint32_t type_token_id (0x2000234)
		i32 44; uint32_t java_map_index (0x2c)
	}, ; 224
	%struct.TypeMapModuleEntry {
		i32 33554999, ; uint32_t type_token_id (0x2000237)
		i32 23; uint32_t java_map_index (0x17)
	}, ; 225
	%struct.TypeMapModuleEntry {
		i32 33555000, ; uint32_t type_token_id (0x2000238)
		i32 126; uint32_t java_map_index (0x7e)
	}, ; 226
	%struct.TypeMapModuleEntry {
		i32 33555002, ; uint32_t type_token_id (0x200023a)
		i32 517; uint32_t java_map_index (0x205)
	}, ; 227
	%struct.TypeMapModuleEntry {
		i32 33555003, ; uint32_t type_token_id (0x200023b)
		i32 282; uint32_t java_map_index (0x11a)
	}, ; 228
	%struct.TypeMapModuleEntry {
		i32 33555005, ; uint32_t type_token_id (0x200023d)
		i32 88; uint32_t java_map_index (0x58)
	}, ; 229
	%struct.TypeMapModuleEntry {
		i32 33555006, ; uint32_t type_token_id (0x200023e)
		i32 192; uint32_t java_map_index (0xc0)
	}, ; 230
	%struct.TypeMapModuleEntry {
		i32 33555007, ; uint32_t type_token_id (0x200023f)
		i32 366; uint32_t java_map_index (0x16e)
	}, ; 231
	%struct.TypeMapModuleEntry {
		i32 33555008, ; uint32_t type_token_id (0x2000240)
		i32 318; uint32_t java_map_index (0x13e)
	}, ; 232
	%struct.TypeMapModuleEntry {
		i32 33555010, ; uint32_t type_token_id (0x2000242)
		i32 195; uint32_t java_map_index (0xc3)
	}, ; 233
	%struct.TypeMapModuleEntry {
		i32 33555012, ; uint32_t type_token_id (0x2000244)
		i32 46; uint32_t java_map_index (0x2e)
	}, ; 234
	%struct.TypeMapModuleEntry {
		i32 33555013, ; uint32_t type_token_id (0x2000245)
		i32 338; uint32_t java_map_index (0x152)
	}, ; 235
	%struct.TypeMapModuleEntry {
		i32 33555015, ; uint32_t type_token_id (0x2000247)
		i32 230; uint32_t java_map_index (0xe6)
	}, ; 236
	%struct.TypeMapModuleEntry {
		i32 33555016, ; uint32_t type_token_id (0x2000248)
		i32 472; uint32_t java_map_index (0x1d8)
	}, ; 237
	%struct.TypeMapModuleEntry {
		i32 33555019, ; uint32_t type_token_id (0x200024b)
		i32 13; uint32_t java_map_index (0xd)
	}, ; 238
	%struct.TypeMapModuleEntry {
		i32 33555020, ; uint32_t type_token_id (0x200024c)
		i32 96; uint32_t java_map_index (0x60)
	}, ; 239
	%struct.TypeMapModuleEntry {
		i32 33555022, ; uint32_t type_token_id (0x200024e)
		i32 82; uint32_t java_map_index (0x52)
	}, ; 240
	%struct.TypeMapModuleEntry {
		i32 33555023, ; uint32_t type_token_id (0x200024f)
		i32 79; uint32_t java_map_index (0x4f)
	}, ; 241
	%struct.TypeMapModuleEntry {
		i32 33555024, ; uint32_t type_token_id (0x2000250)
		i32 378; uint32_t java_map_index (0x17a)
	}, ; 242
	%struct.TypeMapModuleEntry {
		i32 33555025, ; uint32_t type_token_id (0x2000251)
		i32 463; uint32_t java_map_index (0x1cf)
	}, ; 243
	%struct.TypeMapModuleEntry {
		i32 33555027, ; uint32_t type_token_id (0x2000253)
		i32 485; uint32_t java_map_index (0x1e5)
	}, ; 244
	%struct.TypeMapModuleEntry {
		i32 33555029, ; uint32_t type_token_id (0x2000255)
		i32 521; uint32_t java_map_index (0x209)
	}, ; 245
	%struct.TypeMapModuleEntry {
		i32 33555031, ; uint32_t type_token_id (0x2000257)
		i32 403; uint32_t java_map_index (0x193)
	}, ; 246
	%struct.TypeMapModuleEntry {
		i32 33555037, ; uint32_t type_token_id (0x200025d)
		i32 257; uint32_t java_map_index (0x101)
	}, ; 247
	%struct.TypeMapModuleEntry {
		i32 33555038, ; uint32_t type_token_id (0x200025e)
		i32 416; uint32_t java_map_index (0x1a0)
	}, ; 248
	%struct.TypeMapModuleEntry {
		i32 33555039, ; uint32_t type_token_id (0x200025f)
		i32 298; uint32_t java_map_index (0x12a)
	}, ; 249
	%struct.TypeMapModuleEntry {
		i32 33555040, ; uint32_t type_token_id (0x2000260)
		i32 245; uint32_t java_map_index (0xf5)
	}, ; 250
	%struct.TypeMapModuleEntry {
		i32 33555041, ; uint32_t type_token_id (0x2000261)
		i32 357; uint32_t java_map_index (0x165)
	}, ; 251
	%struct.TypeMapModuleEntry {
		i32 33555043, ; uint32_t type_token_id (0x2000263)
		i32 340; uint32_t java_map_index (0x154)
	}, ; 252
	%struct.TypeMapModuleEntry {
		i32 33555046, ; uint32_t type_token_id (0x2000266)
		i32 100; uint32_t java_map_index (0x64)
	}, ; 253
	%struct.TypeMapModuleEntry {
		i32 33555047, ; uint32_t type_token_id (0x2000267)
		i32 200; uint32_t java_map_index (0xc8)
	}, ; 254
	%struct.TypeMapModuleEntry {
		i32 33555048, ; uint32_t type_token_id (0x2000268)
		i32 503; uint32_t java_map_index (0x1f7)
	}, ; 255
	%struct.TypeMapModuleEntry {
		i32 33555049, ; uint32_t type_token_id (0x2000269)
		i32 501; uint32_t java_map_index (0x1f5)
	}, ; 256
	%struct.TypeMapModuleEntry {
		i32 33555050, ; uint32_t type_token_id (0x200026a)
		i32 480; uint32_t java_map_index (0x1e0)
	}, ; 257
	%struct.TypeMapModuleEntry {
		i32 33555051, ; uint32_t type_token_id (0x200026b)
		i32 85; uint32_t java_map_index (0x55)
	}, ; 258
	%struct.TypeMapModuleEntry {
		i32 33555052, ; uint32_t type_token_id (0x200026c)
		i32 171; uint32_t java_map_index (0xab)
	}, ; 259
	%struct.TypeMapModuleEntry {
		i32 33555053, ; uint32_t type_token_id (0x200026d)
		i32 206; uint32_t java_map_index (0xce)
	}, ; 260
	%struct.TypeMapModuleEntry {
		i32 33555055, ; uint32_t type_token_id (0x200026f)
		i32 70; uint32_t java_map_index (0x46)
	}, ; 261
	%struct.TypeMapModuleEntry {
		i32 33555056, ; uint32_t type_token_id (0x2000270)
		i32 68; uint32_t java_map_index (0x44)
	}, ; 262
	%struct.TypeMapModuleEntry {
		i32 33555057, ; uint32_t type_token_id (0x2000271)
		i32 293; uint32_t java_map_index (0x125)
	}, ; 263
	%struct.TypeMapModuleEntry {
		i32 33555058, ; uint32_t type_token_id (0x2000272)
		i32 337; uint32_t java_map_index (0x151)
	}, ; 264
	%struct.TypeMapModuleEntry {
		i32 33555059, ; uint32_t type_token_id (0x2000273)
		i32 489; uint32_t java_map_index (0x1e9)
	}, ; 265
	%struct.TypeMapModuleEntry {
		i32 33555060, ; uint32_t type_token_id (0x2000274)
		i32 2; uint32_t java_map_index (0x2)
	}, ; 266
	%struct.TypeMapModuleEntry {
		i32 33555061, ; uint32_t type_token_id (0x2000275)
		i32 306; uint32_t java_map_index (0x132)
	}, ; 267
	%struct.TypeMapModuleEntry {
		i32 33555066, ; uint32_t type_token_id (0x200027a)
		i32 253; uint32_t java_map_index (0xfd)
	}, ; 268
	%struct.TypeMapModuleEntry {
		i32 33555067, ; uint32_t type_token_id (0x200027b)
		i32 509; uint32_t java_map_index (0x1fd)
	}, ; 269
	%struct.TypeMapModuleEntry {
		i32 33555069, ; uint32_t type_token_id (0x200027d)
		i32 38; uint32_t java_map_index (0x26)
	}, ; 270
	%struct.TypeMapModuleEntry {
		i32 33555071, ; uint32_t type_token_id (0x200027f)
		i32 462; uint32_t java_map_index (0x1ce)
	}, ; 271
	%struct.TypeMapModuleEntry {
		i32 33555072, ; uint32_t type_token_id (0x2000280)
		i32 478; uint32_t java_map_index (0x1de)
	}, ; 272
	%struct.TypeMapModuleEntry {
		i32 33555073, ; uint32_t type_token_id (0x2000281)
		i32 71; uint32_t java_map_index (0x47)
	}, ; 273
	%struct.TypeMapModuleEntry {
		i32 33555074, ; uint32_t type_token_id (0x2000282)
		i32 307; uint32_t java_map_index (0x133)
	}, ; 274
	%struct.TypeMapModuleEntry {
		i32 33555075, ; uint32_t type_token_id (0x2000283)
		i32 40; uint32_t java_map_index (0x28)
	}, ; 275
	%struct.TypeMapModuleEntry {
		i32 33555076, ; uint32_t type_token_id (0x2000284)
		i32 113; uint32_t java_map_index (0x71)
	}, ; 276
	%struct.TypeMapModuleEntry {
		i32 33555077, ; uint32_t type_token_id (0x2000285)
		i32 268; uint32_t java_map_index (0x10c)
	}, ; 277
	%struct.TypeMapModuleEntry {
		i32 33555078, ; uint32_t type_token_id (0x2000286)
		i32 436; uint32_t java_map_index (0x1b4)
	}, ; 278
	%struct.TypeMapModuleEntry {
		i32 33555079, ; uint32_t type_token_id (0x2000287)
		i32 25; uint32_t java_map_index (0x19)
	}, ; 279
	%struct.TypeMapModuleEntry {
		i32 33555081, ; uint32_t type_token_id (0x2000289)
		i32 313; uint32_t java_map_index (0x139)
	}, ; 280
	%struct.TypeMapModuleEntry {
		i32 33555083, ; uint32_t type_token_id (0x200028b)
		i32 1; uint32_t java_map_index (0x1)
	}, ; 281
	%struct.TypeMapModuleEntry {
		i32 33555085, ; uint32_t type_token_id (0x200028d)
		i32 359; uint32_t java_map_index (0x167)
	}, ; 282
	%struct.TypeMapModuleEntry {
		i32 33555086, ; uint32_t type_token_id (0x200028e)
		i32 504; uint32_t java_map_index (0x1f8)
	}, ; 283
	%struct.TypeMapModuleEntry {
		i32 33555088, ; uint32_t type_token_id (0x2000290)
		i32 437; uint32_t java_map_index (0x1b5)
	}, ; 284
	%struct.TypeMapModuleEntry {
		i32 33555089, ; uint32_t type_token_id (0x2000291)
		i32 438; uint32_t java_map_index (0x1b6)
	}, ; 285
	%struct.TypeMapModuleEntry {
		i32 33555090, ; uint32_t type_token_id (0x2000292)
		i32 256; uint32_t java_map_index (0x100)
	}, ; 286
	%struct.TypeMapModuleEntry {
		i32 33555092, ; uint32_t type_token_id (0x2000294)
		i32 365; uint32_t java_map_index (0x16d)
	}, ; 287
	%struct.TypeMapModuleEntry {
		i32 33555094, ; uint32_t type_token_id (0x2000296)
		i32 90; uint32_t java_map_index (0x5a)
	}, ; 288
	%struct.TypeMapModuleEntry {
		i32 33555096, ; uint32_t type_token_id (0x2000298)
		i32 172; uint32_t java_map_index (0xac)
	}, ; 289
	%struct.TypeMapModuleEntry {
		i32 33555097, ; uint32_t type_token_id (0x2000299)
		i32 27; uint32_t java_map_index (0x1b)
	}, ; 290
	%struct.TypeMapModuleEntry {
		i32 33555098, ; uint32_t type_token_id (0x200029a)
		i32 455; uint32_t java_map_index (0x1c7)
	}, ; 291
	%struct.TypeMapModuleEntry {
		i32 33555100, ; uint32_t type_token_id (0x200029c)
		i32 238; uint32_t java_map_index (0xee)
	}, ; 292
	%struct.TypeMapModuleEntry {
		i32 33555102, ; uint32_t type_token_id (0x200029e)
		i32 511; uint32_t java_map_index (0x1ff)
	}, ; 293
	%struct.TypeMapModuleEntry {
		i32 33555103, ; uint32_t type_token_id (0x200029f)
		i32 448; uint32_t java_map_index (0x1c0)
	}, ; 294
	%struct.TypeMapModuleEntry {
		i32 33555105, ; uint32_t type_token_id (0x20002a1)
		i32 125; uint32_t java_map_index (0x7d)
	}, ; 295
	%struct.TypeMapModuleEntry {
		i32 33555107, ; uint32_t type_token_id (0x20002a3)
		i32 333; uint32_t java_map_index (0x14d)
	}, ; 296
	%struct.TypeMapModuleEntry {
		i32 33555109, ; uint32_t type_token_id (0x20002a5)
		i32 523; uint32_t java_map_index (0x20b)
	}, ; 297
	%struct.TypeMapModuleEntry {
		i32 33555111, ; uint32_t type_token_id (0x20002a7)
		i32 439; uint32_t java_map_index (0x1b7)
	}, ; 298
	%struct.TypeMapModuleEntry {
		i32 33555112, ; uint32_t type_token_id (0x20002a8)
		i32 64; uint32_t java_map_index (0x40)
	}, ; 299
	%struct.TypeMapModuleEntry {
		i32 33555113, ; uint32_t type_token_id (0x20002a9)
		i32 205; uint32_t java_map_index (0xcd)
	}, ; 300
	%struct.TypeMapModuleEntry {
		i32 33555115, ; uint32_t type_token_id (0x20002ab)
		i32 327; uint32_t java_map_index (0x147)
	}, ; 301
	%struct.TypeMapModuleEntry {
		i32 33555117, ; uint32_t type_token_id (0x20002ad)
		i32 391; uint32_t java_map_index (0x187)
	}, ; 302
	%struct.TypeMapModuleEntry {
		i32 33555118, ; uint32_t type_token_id (0x20002ae)
		i32 104; uint32_t java_map_index (0x68)
	}, ; 303
	%struct.TypeMapModuleEntry {
		i32 33555119, ; uint32_t type_token_id (0x20002af)
		i32 164; uint32_t java_map_index (0xa4)
	}, ; 304
	%struct.TypeMapModuleEntry {
		i32 33555120, ; uint32_t type_token_id (0x20002b0)
		i32 376; uint32_t java_map_index (0x178)
	}, ; 305
	%struct.TypeMapModuleEntry {
		i32 33555122, ; uint32_t type_token_id (0x20002b2)
		i32 395; uint32_t java_map_index (0x18b)
	}, ; 306
	%struct.TypeMapModuleEntry {
		i32 33555124, ; uint32_t type_token_id (0x20002b4)
		i32 224; uint32_t java_map_index (0xe0)
	}, ; 307
	%struct.TypeMapModuleEntry {
		i32 33555126, ; uint32_t type_token_id (0x20002b6)
		i32 33; uint32_t java_map_index (0x21)
	}, ; 308
	%struct.TypeMapModuleEntry {
		i32 33555127, ; uint32_t type_token_id (0x20002b7)
		i32 63; uint32_t java_map_index (0x3f)
	}, ; 309
	%struct.TypeMapModuleEntry {
		i32 33555129, ; uint32_t type_token_id (0x20002b9)
		i32 101; uint32_t java_map_index (0x65)
	}, ; 310
	%struct.TypeMapModuleEntry {
		i32 33555130, ; uint32_t type_token_id (0x20002ba)
		i32 43; uint32_t java_map_index (0x2b)
	}, ; 311
	%struct.TypeMapModuleEntry {
		i32 33555131, ; uint32_t type_token_id (0x20002bb)
		i32 53; uint32_t java_map_index (0x35)
	}, ; 312
	%struct.TypeMapModuleEntry {
		i32 33555132, ; uint32_t type_token_id (0x20002bc)
		i32 513; uint32_t java_map_index (0x201)
	}, ; 313
	%struct.TypeMapModuleEntry {
		i32 33555133, ; uint32_t type_token_id (0x20002bd)
		i32 111; uint32_t java_map_index (0x6f)
	}, ; 314
	%struct.TypeMapModuleEntry {
		i32 33555135, ; uint32_t type_token_id (0x20002bf)
		i32 454; uint32_t java_map_index (0x1c6)
	}, ; 315
	%struct.TypeMapModuleEntry {
		i32 33555136, ; uint32_t type_token_id (0x20002c0)
		i32 355; uint32_t java_map_index (0x163)
	}, ; 316
	%struct.TypeMapModuleEntry {
		i32 33555137, ; uint32_t type_token_id (0x20002c1)
		i32 390; uint32_t java_map_index (0x186)
	}, ; 317
	%struct.TypeMapModuleEntry {
		i32 33555138, ; uint32_t type_token_id (0x20002c2)
		i32 274; uint32_t java_map_index (0x112)
	}, ; 318
	%struct.TypeMapModuleEntry {
		i32 33555139, ; uint32_t type_token_id (0x20002c3)
		i32 162; uint32_t java_map_index (0xa2)
	}, ; 319
	%struct.TypeMapModuleEntry {
		i32 33555141, ; uint32_t type_token_id (0x20002c5)
		i32 283; uint32_t java_map_index (0x11b)
	}, ; 320
	%struct.TypeMapModuleEntry {
		i32 33555143, ; uint32_t type_token_id (0x20002c7)
		i32 320; uint32_t java_map_index (0x140)
	}, ; 321
	%struct.TypeMapModuleEntry {
		i32 33555144, ; uint32_t type_token_id (0x20002c8)
		i32 67; uint32_t java_map_index (0x43)
	}, ; 322
	%struct.TypeMapModuleEntry {
		i32 33555145, ; uint32_t type_token_id (0x20002c9)
		i32 207; uint32_t java_map_index (0xcf)
	}, ; 323
	%struct.TypeMapModuleEntry {
		i32 33555146, ; uint32_t type_token_id (0x20002ca)
		i32 34; uint32_t java_map_index (0x22)
	}, ; 324
	%struct.TypeMapModuleEntry {
		i32 33555147, ; uint32_t type_token_id (0x20002cb)
		i32 269; uint32_t java_map_index (0x10d)
	}, ; 325
	%struct.TypeMapModuleEntry {
		i32 33555148, ; uint32_t type_token_id (0x20002cc)
		i32 388; uint32_t java_map_index (0x184)
	}, ; 326
	%struct.TypeMapModuleEntry {
		i32 33555149, ; uint32_t type_token_id (0x20002cd)
		i32 468; uint32_t java_map_index (0x1d4)
	}, ; 327
	%struct.TypeMapModuleEntry {
		i32 33555150, ; uint32_t type_token_id (0x20002ce)
		i32 514; uint32_t java_map_index (0x202)
	}, ; 328
	%struct.TypeMapModuleEntry {
		i32 33555152, ; uint32_t type_token_id (0x20002d0)
		i32 60; uint32_t java_map_index (0x3c)
	}, ; 329
	%struct.TypeMapModuleEntry {
		i32 33555154, ; uint32_t type_token_id (0x20002d2)
		i32 213; uint32_t java_map_index (0xd5)
	}, ; 330
	%struct.TypeMapModuleEntry {
		i32 33555155, ; uint32_t type_token_id (0x20002d3)
		i32 52; uint32_t java_map_index (0x34)
	}, ; 331
	%struct.TypeMapModuleEntry {
		i32 33555156, ; uint32_t type_token_id (0x20002d4)
		i32 279; uint32_t java_map_index (0x117)
	}, ; 332
	%struct.TypeMapModuleEntry {
		i32 33555158, ; uint32_t type_token_id (0x20002d6)
		i32 494; uint32_t java_map_index (0x1ee)
	}, ; 333
	%struct.TypeMapModuleEntry {
		i32 33555160, ; uint32_t type_token_id (0x20002d8)
		i32 94; uint32_t java_map_index (0x5e)
	}, ; 334
	%struct.TypeMapModuleEntry {
		i32 33555161, ; uint32_t type_token_id (0x20002d9)
		i32 251; uint32_t java_map_index (0xfb)
	}, ; 335
	%struct.TypeMapModuleEntry {
		i32 33555163, ; uint32_t type_token_id (0x20002db)
		i32 384; uint32_t java_map_index (0x180)
	}, ; 336
	%struct.TypeMapModuleEntry {
		i32 33555164, ; uint32_t type_token_id (0x20002dc)
		i32 443; uint32_t java_map_index (0x1bb)
	}, ; 337
	%struct.TypeMapModuleEntry {
		i32 33555166, ; uint32_t type_token_id (0x20002de)
		i32 248; uint32_t java_map_index (0xf8)
	}, ; 338
	%struct.TypeMapModuleEntry {
		i32 33555167, ; uint32_t type_token_id (0x20002df)
		i32 409; uint32_t java_map_index (0x199)
	}, ; 339
	%struct.TypeMapModuleEntry {
		i32 33555168, ; uint32_t type_token_id (0x20002e0)
		i32 215; uint32_t java_map_index (0xd7)
	}, ; 340
	%struct.TypeMapModuleEntry {
		i32 33555169, ; uint32_t type_token_id (0x20002e1)
		i32 123; uint32_t java_map_index (0x7b)
	}, ; 341
	%struct.TypeMapModuleEntry {
		i32 33555170, ; uint32_t type_token_id (0x20002e2)
		i32 400; uint32_t java_map_index (0x190)
	}, ; 342
	%struct.TypeMapModuleEntry {
		i32 33555171, ; uint32_t type_token_id (0x20002e3)
		i32 510; uint32_t java_map_index (0x1fe)
	}, ; 343
	%struct.TypeMapModuleEntry {
		i32 33555172, ; uint32_t type_token_id (0x20002e4)
		i32 176; uint32_t java_map_index (0xb0)
	}, ; 344
	%struct.TypeMapModuleEntry {
		i32 33555174, ; uint32_t type_token_id (0x20002e6)
		i32 150; uint32_t java_map_index (0x96)
	}, ; 345
	%struct.TypeMapModuleEntry {
		i32 33555175, ; uint32_t type_token_id (0x20002e7)
		i32 18; uint32_t java_map_index (0x12)
	}, ; 346
	%struct.TypeMapModuleEntry {
		i32 33555176, ; uint32_t type_token_id (0x20002e8)
		i32 527; uint32_t java_map_index (0x20f)
	}, ; 347
	%struct.TypeMapModuleEntry {
		i32 33555177, ; uint32_t type_token_id (0x20002e9)
		i32 444; uint32_t java_map_index (0x1bc)
	}, ; 348
	%struct.TypeMapModuleEntry {
		i32 33555179, ; uint32_t type_token_id (0x20002eb)
		i32 413; uint32_t java_map_index (0x19d)
	}, ; 349
	%struct.TypeMapModuleEntry {
		i32 33555182, ; uint32_t type_token_id (0x20002ee)
		i32 227; uint32_t java_map_index (0xe3)
	}, ; 350
	%struct.TypeMapModuleEntry {
		i32 33555183, ; uint32_t type_token_id (0x20002ef)
		i32 343; uint32_t java_map_index (0x157)
	}, ; 351
	%struct.TypeMapModuleEntry {
		i32 33555184, ; uint32_t type_token_id (0x20002f0)
		i32 339; uint32_t java_map_index (0x153)
	}, ; 352
	%struct.TypeMapModuleEntry {
		i32 33555185, ; uint32_t type_token_id (0x20002f1)
		i32 354; uint32_t java_map_index (0x162)
	}, ; 353
	%struct.TypeMapModuleEntry {
		i32 33555186, ; uint32_t type_token_id (0x20002f2)
		i32 234; uint32_t java_map_index (0xea)
	}, ; 354
	%struct.TypeMapModuleEntry {
		i32 33555188, ; uint32_t type_token_id (0x20002f4)
		i32 69; uint32_t java_map_index (0x45)
	}, ; 355
	%struct.TypeMapModuleEntry {
		i32 33555189, ; uint32_t type_token_id (0x20002f5)
		i32 280; uint32_t java_map_index (0x118)
	}, ; 356
	%struct.TypeMapModuleEntry {
		i32 33555190, ; uint32_t type_token_id (0x20002f6)
		i32 284; uint32_t java_map_index (0x11c)
	}, ; 357
	%struct.TypeMapModuleEntry {
		i32 33555191, ; uint32_t type_token_id (0x20002f7)
		i32 231; uint32_t java_map_index (0xe7)
	}, ; 358
	%struct.TypeMapModuleEntry {
		i32 33555192, ; uint32_t type_token_id (0x20002f8)
		i32 281; uint32_t java_map_index (0x119)
	}, ; 359
	%struct.TypeMapModuleEntry {
		i32 33555193, ; uint32_t type_token_id (0x20002f9)
		i32 345; uint32_t java_map_index (0x159)
	}, ; 360
	%struct.TypeMapModuleEntry {
		i32 33555195, ; uint32_t type_token_id (0x20002fb)
		i32 399; uint32_t java_map_index (0x18f)
	}, ; 361
	%struct.TypeMapModuleEntry {
		i32 33555196, ; uint32_t type_token_id (0x20002fc)
		i32 385; uint32_t java_map_index (0x181)
	}, ; 362
	%struct.TypeMapModuleEntry {
		i32 33555197, ; uint32_t type_token_id (0x20002fd)
		i32 276; uint32_t java_map_index (0x114)
	}, ; 363
	%struct.TypeMapModuleEntry {
		i32 33555198, ; uint32_t type_token_id (0x20002fe)
		i32 301; uint32_t java_map_index (0x12d)
	}, ; 364
	%struct.TypeMapModuleEntry {
		i32 33555199, ; uint32_t type_token_id (0x20002ff)
		i32 425; uint32_t java_map_index (0x1a9)
	}, ; 365
	%struct.TypeMapModuleEntry {
		i32 33555200, ; uint32_t type_token_id (0x2000300)
		i32 0; uint32_t java_map_index (0x0)
	}, ; 366
	%struct.TypeMapModuleEntry {
		i32 33555202, ; uint32_t type_token_id (0x2000302)
		i32 271; uint32_t java_map_index (0x10f)
	}, ; 367
	%struct.TypeMapModuleEntry {
		i32 33555203, ; uint32_t type_token_id (0x2000303)
		i32 322; uint32_t java_map_index (0x142)
	}, ; 368
	%struct.TypeMapModuleEntry {
		i32 33555204, ; uint32_t type_token_id (0x2000304)
		i32 419; uint32_t java_map_index (0x1a3)
	}, ; 369
	%struct.TypeMapModuleEntry {
		i32 33555205, ; uint32_t type_token_id (0x2000305)
		i32 16; uint32_t java_map_index (0x10)
	}, ; 370
	%struct.TypeMapModuleEntry {
		i32 33555206, ; uint32_t type_token_id (0x2000306)
		i32 295; uint32_t java_map_index (0x127)
	}, ; 371
	%struct.TypeMapModuleEntry {
		i32 33555222, ; uint32_t type_token_id (0x2000316)
		i32 370; uint32_t java_map_index (0x172)
	} ; 372
], align 4

@module1_managed_to_java_duplicates = internal dso_local constant [122 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554570, ; uint32_t type_token_id (0x200008a)
		i32 429; uint32_t java_map_index (0x1ad)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554576, ; uint32_t type_token_id (0x2000090)
		i32 114; uint32_t java_map_index (0x72)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554578, ; uint32_t type_token_id (0x2000092)
		i32 175; uint32_t java_map_index (0xaf)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554582, ; uint32_t type_token_id (0x2000096)
		i32 143; uint32_t java_map_index (0x8f)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554584, ; uint32_t type_token_id (0x2000098)
		i32 12; uint32_t java_map_index (0xc)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554586, ; uint32_t type_token_id (0x200009a)
		i32 428; uint32_t java_map_index (0x1ac)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554588, ; uint32_t type_token_id (0x200009c)
		i32 254; uint32_t java_map_index (0xfe)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554590, ; uint32_t type_token_id (0x200009e)
		i32 193; uint32_t java_map_index (0xc1)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554592, ; uint32_t type_token_id (0x20000a0)
		i32 447; uint32_t java_map_index (0x1bf)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554594, ; uint32_t type_token_id (0x20000a2)
		i32 453; uint32_t java_map_index (0x1c5)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554598, ; uint32_t type_token_id (0x20000a6)
		i32 522; uint32_t java_map_index (0x20a)
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 33554605, ; uint32_t type_token_id (0x20000ad)
		i32 516; uint32_t java_map_index (0x204)
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 33554614, ; uint32_t type_token_id (0x20000b6)
		i32 62; uint32_t java_map_index (0x3e)
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 33554616, ; uint32_t type_token_id (0x20000b8)
		i32 348; uint32_t java_map_index (0x15c)
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 33554619, ; uint32_t type_token_id (0x20000bb)
		i32 360; uint32_t java_map_index (0x168)
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 33554623, ; uint32_t type_token_id (0x20000bf)
		i32 434; uint32_t java_map_index (0x1b2)
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 33554632, ; uint32_t type_token_id (0x20000c8)
		i32 95; uint32_t java_map_index (0x5f)
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 33554635, ; uint32_t type_token_id (0x20000cb)
		i32 524; uint32_t java_map_index (0x20c)
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 33554639, ; uint32_t type_token_id (0x20000cf)
		i32 397; uint32_t java_map_index (0x18d)
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 33554645, ; uint32_t type_token_id (0x20000d5)
		i32 319; uint32_t java_map_index (0x13f)
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 33554648, ; uint32_t type_token_id (0x20000d8)
		i32 173; uint32_t java_map_index (0xad)
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 33554650, ; uint32_t type_token_id (0x20000da)
		i32 216; uint32_t java_map_index (0xd8)
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 33554652, ; uint32_t type_token_id (0x20000dc)
		i32 107; uint32_t java_map_index (0x6b)
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 33554666, ; uint32_t type_token_id (0x20000ea)
		i32 95; uint32_t java_map_index (0x5f)
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 33554667, ; uint32_t type_token_id (0x20000eb)
		i32 120; uint32_t java_map_index (0x78)
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 33554672, ; uint32_t type_token_id (0x20000f0)
		i32 387; uint32_t java_map_index (0x183)
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 33554677, ; uint32_t type_token_id (0x20000f5)
		i32 467; uint32_t java_map_index (0x1d3)
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 33554680, ; uint32_t type_token_id (0x20000f8)
		i32 432; uint32_t java_map_index (0x1b0)
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 33554683, ; uint32_t type_token_id (0x20000fb)
		i32 115; uint32_t java_map_index (0x73)
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 33554686, ; uint32_t type_token_id (0x20000fe)
		i32 102; uint32_t java_map_index (0x66)
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 33554688, ; uint32_t type_token_id (0x2000100)
		i32 155; uint32_t java_map_index (0x9b)
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 33554690, ; uint32_t type_token_id (0x2000102)
		i32 136; uint32_t java_map_index (0x88)
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 33554693, ; uint32_t type_token_id (0x2000105)
		i32 26; uint32_t java_map_index (0x1a)
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 33554696, ; uint32_t type_token_id (0x2000108)
		i32 228; uint32_t java_map_index (0xe4)
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 33554706, ; uint32_t type_token_id (0x2000112)
		i32 424; uint32_t java_map_index (0x1a8)
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 33554708, ; uint32_t type_token_id (0x2000114)
		i32 404; uint32_t java_map_index (0x194)
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 33554749, ; uint32_t type_token_id (0x200013d)
		i32 261; uint32_t java_map_index (0x105)
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 33554751, ; uint32_t type_token_id (0x200013f)
		i32 229; uint32_t java_map_index (0xe5)
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 33554753, ; uint32_t type_token_id (0x2000141)
		i32 121; uint32_t java_map_index (0x79)
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 33554755, ; uint32_t type_token_id (0x2000143)
		i32 99; uint32_t java_map_index (0x63)
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 33554757, ; uint32_t type_token_id (0x2000145)
		i32 203; uint32_t java_map_index (0xcb)
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 33554766, ; uint32_t type_token_id (0x200014e)
		i32 490; uint32_t java_map_index (0x1ea)
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 33554768, ; uint32_t type_token_id (0x2000150)
		i32 464; uint32_t java_map_index (0x1d0)
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 33554782, ; uint32_t type_token_id (0x200015e)
		i32 124; uint32_t java_map_index (0x7c)
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 33554793, ; uint32_t type_token_id (0x2000169)
		i32 158; uint32_t java_map_index (0x9e)
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 33554802, ; uint32_t type_token_id (0x2000172)
		i32 109; uint32_t java_map_index (0x6d)
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 33554806, ; uint32_t type_token_id (0x2000176)
		i32 260; uint32_t java_map_index (0x104)
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 33554815, ; uint32_t type_token_id (0x200017f)
		i32 198; uint32_t java_map_index (0xc6)
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 33554818, ; uint32_t type_token_id (0x2000182)
		i32 168; uint32_t java_map_index (0xa8)
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 33554820, ; uint32_t type_token_id (0x2000184)
		i32 303; uint32_t java_map_index (0x12f)
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 33554822, ; uint32_t type_token_id (0x2000186)
		i32 55; uint32_t java_map_index (0x37)
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 33554831, ; uint32_t type_token_id (0x200018f)
		i32 349; uint32_t java_map_index (0x15d)
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 33554837, ; uint32_t type_token_id (0x2000195)
		i32 182; uint32_t java_map_index (0xb6)
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 33554841, ; uint32_t type_token_id (0x2000199)
		i32 86; uint32_t java_map_index (0x56)
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 33554850, ; uint32_t type_token_id (0x20001a2)
		i32 11; uint32_t java_map_index (0xb)
	}, ; 54
	%struct.TypeMapModuleEntry {
		i32 33554855, ; uint32_t type_token_id (0x20001a7)
		i32 221; uint32_t java_map_index (0xdd)
	}, ; 55
	%struct.TypeMapModuleEntry {
		i32 33554857, ; uint32_t type_token_id (0x20001a9)
		i32 141; uint32_t java_map_index (0x8d)
	}, ; 56
	%struct.TypeMapModuleEntry {
		i32 33554859, ; uint32_t type_token_id (0x20001ab)
		i32 240; uint32_t java_map_index (0xf0)
	}, ; 57
	%struct.TypeMapModuleEntry {
		i32 33554861, ; uint32_t type_token_id (0x20001ad)
		i32 103; uint32_t java_map_index (0x67)
	}, ; 58
	%struct.TypeMapModuleEntry {
		i32 33554863, ; uint32_t type_token_id (0x20001af)
		i32 89; uint32_t java_map_index (0x59)
	}, ; 59
	%struct.TypeMapModuleEntry {
		i32 33554865, ; uint32_t type_token_id (0x20001b1)
		i32 58; uint32_t java_map_index (0x3a)
	}, ; 60
	%struct.TypeMapModuleEntry {
		i32 33554867, ; uint32_t type_token_id (0x20001b3)
		i32 66; uint32_t java_map_index (0x42)
	}, ; 61
	%struct.TypeMapModuleEntry {
		i32 33554869, ; uint32_t type_token_id (0x20001b5)
		i32 369; uint32_t java_map_index (0x171)
	}, ; 62
	%struct.TypeMapModuleEntry {
		i32 33554871, ; uint32_t type_token_id (0x20001b7)
		i32 292; uint32_t java_map_index (0x124)
	}, ; 63
	%struct.TypeMapModuleEntry {
		i32 33554874, ; uint32_t type_token_id (0x20001ba)
		i32 249; uint32_t java_map_index (0xf9)
	}, ; 64
	%struct.TypeMapModuleEntry {
		i32 33554877, ; uint32_t type_token_id (0x20001bd)
		i32 241; uint32_t java_map_index (0xf1)
	}, ; 65
	%struct.TypeMapModuleEntry {
		i32 33554880, ; uint32_t type_token_id (0x20001c0)
		i32 389; uint32_t java_map_index (0x185)
	}, ; 66
	%struct.TypeMapModuleEntry {
		i32 33554883, ; uint32_t type_token_id (0x20001c3)
		i32 287; uint32_t java_map_index (0x11f)
	}, ; 67
	%struct.TypeMapModuleEntry {
		i32 33554895, ; uint32_t type_token_id (0x20001cf)
		i32 484; uint32_t java_map_index (0x1e4)
	}, ; 68
	%struct.TypeMapModuleEntry {
		i32 33554897, ; uint32_t type_token_id (0x20001d1)
		i32 75; uint32_t java_map_index (0x4b)
	}, ; 69
	%struct.TypeMapModuleEntry {
		i32 33554935, ; uint32_t type_token_id (0x20001f7)
		i32 528; uint32_t java_map_index (0x210)
	}, ; 70
	%struct.TypeMapModuleEntry {
		i32 33554941, ; uint32_t type_token_id (0x20001fd)
		i32 217; uint32_t java_map_index (0xd9)
	}, ; 71
	%struct.TypeMapModuleEntry {
		i32 33554946, ; uint32_t type_token_id (0x2000202)
		i32 325; uint32_t java_map_index (0x145)
	}, ; 72
	%struct.TypeMapModuleEntry {
		i32 33554950, ; uint32_t type_token_id (0x2000206)
		i32 29; uint32_t java_map_index (0x1d)
	}, ; 73
	%struct.TypeMapModuleEntry {
		i32 33554995, ; uint32_t type_token_id (0x2000233)
		i32 259; uint32_t java_map_index (0x103)
	}, ; 74
	%struct.TypeMapModuleEntry {
		i32 33555001, ; uint32_t type_token_id (0x2000239)
		i32 126; uint32_t java_map_index (0x7e)
	}, ; 75
	%struct.TypeMapModuleEntry {
		i32 33555004, ; uint32_t type_token_id (0x200023c)
		i32 282; uint32_t java_map_index (0x11a)
	}, ; 76
	%struct.TypeMapModuleEntry {
		i32 33555009, ; uint32_t type_token_id (0x2000241)
		i32 318; uint32_t java_map_index (0x13e)
	}, ; 77
	%struct.TypeMapModuleEntry {
		i32 33555011, ; uint32_t type_token_id (0x2000243)
		i32 195; uint32_t java_map_index (0xc3)
	}, ; 78
	%struct.TypeMapModuleEntry {
		i32 33555014, ; uint32_t type_token_id (0x2000246)
		i32 338; uint32_t java_map_index (0x152)
	}, ; 79
	%struct.TypeMapModuleEntry {
		i32 33555017, ; uint32_t type_token_id (0x2000249)
		i32 472; uint32_t java_map_index (0x1d8)
	}, ; 80
	%struct.TypeMapModuleEntry {
		i32 33555021, ; uint32_t type_token_id (0x200024d)
		i32 96; uint32_t java_map_index (0x60)
	}, ; 81
	%struct.TypeMapModuleEntry {
		i32 33555026, ; uint32_t type_token_id (0x2000252)
		i32 463; uint32_t java_map_index (0x1cf)
	}, ; 82
	%struct.TypeMapModuleEntry {
		i32 33555028, ; uint32_t type_token_id (0x2000254)
		i32 485; uint32_t java_map_index (0x1e5)
	}, ; 83
	%struct.TypeMapModuleEntry {
		i32 33555030, ; uint32_t type_token_id (0x2000256)
		i32 521; uint32_t java_map_index (0x209)
	}, ; 84
	%struct.TypeMapModuleEntry {
		i32 33555032, ; uint32_t type_token_id (0x2000258)
		i32 403; uint32_t java_map_index (0x193)
	}, ; 85
	%struct.TypeMapModuleEntry {
		i32 33555042, ; uint32_t type_token_id (0x2000262)
		i32 357; uint32_t java_map_index (0x165)
	}, ; 86
	%struct.TypeMapModuleEntry {
		i32 33555054, ; uint32_t type_token_id (0x200026e)
		i32 100; uint32_t java_map_index (0x64)
	}, ; 87
	%struct.TypeMapModuleEntry {
		i32 33555068, ; uint32_t type_token_id (0x200027c)
		i32 509; uint32_t java_map_index (0x1fd)
	}, ; 88
	%struct.TypeMapModuleEntry {
		i32 33555070, ; uint32_t type_token_id (0x200027e)
		i32 38; uint32_t java_map_index (0x26)
	}, ; 89
	%struct.TypeMapModuleEntry {
		i32 33555080, ; uint32_t type_token_id (0x2000288)
		i32 25; uint32_t java_map_index (0x19)
	}, ; 90
	%struct.TypeMapModuleEntry {
		i32 33555082, ; uint32_t type_token_id (0x200028a)
		i32 313; uint32_t java_map_index (0x139)
	}, ; 91
	%struct.TypeMapModuleEntry {
		i32 33555084, ; uint32_t type_token_id (0x200028c)
		i32 1; uint32_t java_map_index (0x1)
	}, ; 92
	%struct.TypeMapModuleEntry {
		i32 33555087, ; uint32_t type_token_id (0x200028f)
		i32 504; uint32_t java_map_index (0x1f8)
	}, ; 93
	%struct.TypeMapModuleEntry {
		i32 33555091, ; uint32_t type_token_id (0x2000293)
		i32 256; uint32_t java_map_index (0x100)
	}, ; 94
	%struct.TypeMapModuleEntry {
		i32 33555093, ; uint32_t type_token_id (0x2000295)
		i32 365; uint32_t java_map_index (0x16d)
	}, ; 95
	%struct.TypeMapModuleEntry {
		i32 33555095, ; uint32_t type_token_id (0x2000297)
		i32 90; uint32_t java_map_index (0x5a)
	}, ; 96
	%struct.TypeMapModuleEntry {
		i32 33555099, ; uint32_t type_token_id (0x200029b)
		i32 455; uint32_t java_map_index (0x1c7)
	}, ; 97
	%struct.TypeMapModuleEntry {
		i32 33555101, ; uint32_t type_token_id (0x200029d)
		i32 238; uint32_t java_map_index (0xee)
	}, ; 98
	%struct.TypeMapModuleEntry {
		i32 33555104, ; uint32_t type_token_id (0x20002a0)
		i32 448; uint32_t java_map_index (0x1c0)
	}, ; 99
	%struct.TypeMapModuleEntry {
		i32 33555106, ; uint32_t type_token_id (0x20002a2)
		i32 125; uint32_t java_map_index (0x7d)
	}, ; 100
	%struct.TypeMapModuleEntry {
		i32 33555108, ; uint32_t type_token_id (0x20002a4)
		i32 333; uint32_t java_map_index (0x14d)
	}, ; 101
	%struct.TypeMapModuleEntry {
		i32 33555110, ; uint32_t type_token_id (0x20002a6)
		i32 523; uint32_t java_map_index (0x20b)
	}, ; 102
	%struct.TypeMapModuleEntry {
		i32 33555114, ; uint32_t type_token_id (0x20002aa)
		i32 205; uint32_t java_map_index (0xcd)
	}, ; 103
	%struct.TypeMapModuleEntry {
		i32 33555116, ; uint32_t type_token_id (0x20002ac)
		i32 327; uint32_t java_map_index (0x147)
	}, ; 104
	%struct.TypeMapModuleEntry {
		i32 33555121, ; uint32_t type_token_id (0x20002b1)
		i32 376; uint32_t java_map_index (0x178)
	}, ; 105
	%struct.TypeMapModuleEntry {
		i32 33555123, ; uint32_t type_token_id (0x20002b3)
		i32 395; uint32_t java_map_index (0x18b)
	}, ; 106
	%struct.TypeMapModuleEntry {
		i32 33555125, ; uint32_t type_token_id (0x20002b5)
		i32 224; uint32_t java_map_index (0xe0)
	}, ; 107
	%struct.TypeMapModuleEntry {
		i32 33555128, ; uint32_t type_token_id (0x20002b8)
		i32 63; uint32_t java_map_index (0x3f)
	}, ; 108
	%struct.TypeMapModuleEntry {
		i32 33555134, ; uint32_t type_token_id (0x20002be)
		i32 111; uint32_t java_map_index (0x6f)
	}, ; 109
	%struct.TypeMapModuleEntry {
		i32 33555140, ; uint32_t type_token_id (0x20002c4)
		i32 162; uint32_t java_map_index (0xa2)
	}, ; 110
	%struct.TypeMapModuleEntry {
		i32 33555151, ; uint32_t type_token_id (0x20002cf)
		i32 514; uint32_t java_map_index (0x202)
	}, ; 111
	%struct.TypeMapModuleEntry {
		i32 33555153, ; uint32_t type_token_id (0x20002d1)
		i32 60; uint32_t java_map_index (0x3c)
	}, ; 112
	%struct.TypeMapModuleEntry {
		i32 33555157, ; uint32_t type_token_id (0x20002d5)
		i32 279; uint32_t java_map_index (0x117)
	}, ; 113
	%struct.TypeMapModuleEntry {
		i32 33555159, ; uint32_t type_token_id (0x20002d7)
		i32 494; uint32_t java_map_index (0x1ee)
	}, ; 114
	%struct.TypeMapModuleEntry {
		i32 33555162, ; uint32_t type_token_id (0x20002da)
		i32 251; uint32_t java_map_index (0xfb)
	}, ; 115
	%struct.TypeMapModuleEntry {
		i32 33555165, ; uint32_t type_token_id (0x20002dd)
		i32 443; uint32_t java_map_index (0x1bb)
	}, ; 116
	%struct.TypeMapModuleEntry {
		i32 33555173, ; uint32_t type_token_id (0x20002e5)
		i32 176; uint32_t java_map_index (0xb0)
	}, ; 117
	%struct.TypeMapModuleEntry {
		i32 33555178, ; uint32_t type_token_id (0x20002ea)
		i32 444; uint32_t java_map_index (0x1bc)
	}, ; 118
	%struct.TypeMapModuleEntry {
		i32 33555180, ; uint32_t type_token_id (0x20002ec)
		i32 413; uint32_t java_map_index (0x19d)
	}, ; 119
	%struct.TypeMapModuleEntry {
		i32 33555187, ; uint32_t type_token_id (0x20002f3)
		i32 234; uint32_t java_map_index (0xea)
	}, ; 120
	%struct.TypeMapModuleEntry {
		i32 33555194, ; uint32_t type_token_id (0x20002fa)
		i32 345; uint32_t java_map_index (0x159)
	} ; 121
], align 4

@module2_managed_to_java = internal dso_local constant [5 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554442, ; uint32_t type_token_id (0x200000a)
		i32 98; uint32_t java_map_index (0x62)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554443, ; uint32_t type_token_id (0x200000b)
		i32 252; uint32_t java_map_index (0xfc)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554445, ; uint32_t type_token_id (0x200000d)
		i32 179; uint32_t java_map_index (0xb3)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554448, ; uint32_t type_token_id (0x2000010)
		i32 356; uint32_t java_map_index (0x164)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554450, ; uint32_t type_token_id (0x2000012)
		i32 169; uint32_t java_map_index (0xa9)
	} ; 4
], align 4

@module2_managed_to_java_duplicates = internal dso_local constant [4 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554444, ; uint32_t type_token_id (0x200000c)
		i32 252; uint32_t java_map_index (0xfc)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554446, ; uint32_t type_token_id (0x200000e)
		i32 179; uint32_t java_map_index (0xb3)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554449, ; uint32_t type_token_id (0x2000011)
		i32 356; uint32_t java_map_index (0x164)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554451, ; uint32_t type_token_id (0x2000013)
		i32 169; uint32_t java_map_index (0xa9)
	} ; 3
], align 4

@module3_managed_to_java = internal dso_local constant [5 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554435, ; uint32_t type_token_id (0x2000003)
		i32 209; uint32_t java_map_index (0xd1)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554436, ; uint32_t type_token_id (0x2000004)
		i32 48; uint32_t java_map_index (0x30)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554437, ; uint32_t type_token_id (0x2000005)
		i32 210; uint32_t java_map_index (0xd2)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554440, ; uint32_t type_token_id (0x2000008)
		i32 278; uint32_t java_map_index (0x116)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554441, ; uint32_t type_token_id (0x2000009)
		i32 187; uint32_t java_map_index (0xbb)
	} ; 4
], align 4

@module3_managed_to_java_duplicates = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554438, ; uint32_t type_token_id (0x2000006)
		i32 48; uint32_t java_map_index (0x30)
	} ; 0
], align 4

@module4_managed_to_java = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554704, ; uint32_t type_token_id (0x2000110)
		i32 197; uint32_t java_map_index (0xc5)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554765, ; uint32_t type_token_id (0x200014d)
		i32 488; uint32_t java_map_index (0x1e8)
	} ; 1
], align 4

@module5_managed_to_java = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554437, ; uint32_t type_token_id (0x2000005)
		i32 374; uint32_t java_map_index (0x176)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554438, ; uint32_t type_token_id (0x2000006)
		i32 145; uint32_t java_map_index (0x91)
	} ; 1
], align 4

@module6_managed_to_java = internal dso_local constant [19 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554471, ; uint32_t type_token_id (0x2000027)
		i32 36; uint32_t java_map_index (0x24)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554662, ; uint32_t type_token_id (0x20000e6)
		i32 309; uint32_t java_map_index (0x135)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554663, ; uint32_t type_token_id (0x20000e7)
		i32 20; uint32_t java_map_index (0x14)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554664, ; uint32_t type_token_id (0x20000e8)
		i32 196; uint32_t java_map_index (0xc4)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554665, ; uint32_t type_token_id (0x20000e9)
		i32 499; uint32_t java_map_index (0x1f3)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554666, ; uint32_t type_token_id (0x20000ea)
		i32 201; uint32_t java_map_index (0xc9)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554667, ; uint32_t type_token_id (0x20000eb)
		i32 9; uint32_t java_map_index (0x9)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554668, ; uint32_t type_token_id (0x20000ec)
		i32 167; uint32_t java_map_index (0xa7)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554670, ; uint32_t type_token_id (0x20000ee)
		i32 65; uint32_t java_map_index (0x41)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554672, ; uint32_t type_token_id (0x20000f0)
		i32 487; uint32_t java_map_index (0x1e7)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554673, ; uint32_t type_token_id (0x20000f1)
		i32 129; uint32_t java_map_index (0x81)
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 33554674, ; uint32_t type_token_id (0x20000f2)
		i32 28; uint32_t java_map_index (0x1c)
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 33554675, ; uint32_t type_token_id (0x20000f3)
		i32 153; uint32_t java_map_index (0x99)
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 33554678, ; uint32_t type_token_id (0x20000f6)
		i32 308; uint32_t java_map_index (0x134)
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 33554679, ; uint32_t type_token_id (0x20000f7)
		i32 74; uint32_t java_map_index (0x4a)
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 33554682, ; uint32_t type_token_id (0x20000fa)
		i32 237; uint32_t java_map_index (0xed)
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 33554686, ; uint32_t type_token_id (0x20000fe)
		i32 497; uint32_t java_map_index (0x1f1)
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 33554692, ; uint32_t type_token_id (0x2000104)
		i32 305; uint32_t java_map_index (0x131)
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 33554693, ; uint32_t type_token_id (0x2000105)
		i32 427; uint32_t java_map_index (0x1ab)
	} ; 18
], align 4

@module7_managed_to_java = internal dso_local constant [28 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554454, ; uint32_t type_token_id (0x2000016)
		i32 194; uint32_t java_map_index (0xc2)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554455, ; uint32_t type_token_id (0x2000017)
		i32 19; uint32_t java_map_index (0x13)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554457, ; uint32_t type_token_id (0x2000019)
		i32 185; uint32_t java_map_index (0xb9)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554458, ; uint32_t type_token_id (0x200001a)
		i32 132; uint32_t java_map_index (0x84)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554459, ; uint32_t type_token_id (0x200001b)
		i32 208; uint32_t java_map_index (0xd0)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554460, ; uint32_t type_token_id (0x200001c)
		i32 146; uint32_t java_map_index (0x92)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554461, ; uint32_t type_token_id (0x200001d)
		i32 72; uint32_t java_map_index (0x48)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554462, ; uint32_t type_token_id (0x200001e)
		i32 483; uint32_t java_map_index (0x1e3)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554463, ; uint32_t type_token_id (0x200001f)
		i32 426; uint32_t java_map_index (0x1aa)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554465, ; uint32_t type_token_id (0x2000021)
		i32 328; uint32_t java_map_index (0x148)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554467, ; uint32_t type_token_id (0x2000023)
		i32 267; uint32_t java_map_index (0x10b)
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 33554472, ; uint32_t type_token_id (0x2000028)
		i32 329; uint32_t java_map_index (0x149)
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 33554473, ; uint32_t type_token_id (0x2000029)
		i32 344; uint32_t java_map_index (0x158)
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 33554474, ; uint32_t type_token_id (0x200002a)
		i32 362; uint32_t java_map_index (0x16a)
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 33554476, ; uint32_t type_token_id (0x200002c)
		i32 515; uint32_t java_map_index (0x203)
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 33554478, ; uint32_t type_token_id (0x200002e)
		i32 262; uint32_t java_map_index (0x106)
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 33554479, ; uint32_t type_token_id (0x200002f)
		i32 330; uint32_t java_map_index (0x14a)
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 33554481, ; uint32_t type_token_id (0x2000031)
		i32 226; uint32_t java_map_index (0xe2)
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 33554483, ; uint32_t type_token_id (0x2000033)
		i32 78; uint32_t java_map_index (0x4e)
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 33554484, ; uint32_t type_token_id (0x2000034)
		i32 407; uint32_t java_map_index (0x197)
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 33554486, ; uint32_t type_token_id (0x2000036)
		i32 76; uint32_t java_map_index (0x4c)
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 33554488, ; uint32_t type_token_id (0x2000038)
		i32 417; uint32_t java_map_index (0x1a1)
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 33554489, ; uint32_t type_token_id (0x2000039)
		i32 477; uint32_t java_map_index (0x1dd)
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 33554491, ; uint32_t type_token_id (0x200003b)
		i32 199; uint32_t java_map_index (0xc7)
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 33554493, ; uint32_t type_token_id (0x200003d)
		i32 161; uint32_t java_map_index (0xa1)
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 33554494, ; uint32_t type_token_id (0x200003e)
		i32 232; uint32_t java_map_index (0xe8)
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 33554496, ; uint32_t type_token_id (0x2000040)
		i32 321; uint32_t java_map_index (0x141)
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 33554498, ; uint32_t type_token_id (0x2000042)
		i32 422; uint32_t java_map_index (0x1a6)
	} ; 27
], align 4

@module7_managed_to_java_duplicates = internal dso_local constant [14 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554456, ; uint32_t type_token_id (0x2000018)
		i32 19; uint32_t java_map_index (0x13)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554464, ; uint32_t type_token_id (0x2000020)
		i32 426; uint32_t java_map_index (0x1aa)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554466, ; uint32_t type_token_id (0x2000022)
		i32 328; uint32_t java_map_index (0x148)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554468, ; uint32_t type_token_id (0x2000024)
		i32 267; uint32_t java_map_index (0x10b)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554475, ; uint32_t type_token_id (0x200002b)
		i32 362; uint32_t java_map_index (0x16a)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554477, ; uint32_t type_token_id (0x200002d)
		i32 515; uint32_t java_map_index (0x203)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554480, ; uint32_t type_token_id (0x2000030)
		i32 330; uint32_t java_map_index (0x14a)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554482, ; uint32_t type_token_id (0x2000032)
		i32 226; uint32_t java_map_index (0xe2)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554485, ; uint32_t type_token_id (0x2000035)
		i32 407; uint32_t java_map_index (0x197)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554487, ; uint32_t type_token_id (0x2000037)
		i32 76; uint32_t java_map_index (0x4c)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554490, ; uint32_t type_token_id (0x200003a)
		i32 477; uint32_t java_map_index (0x1dd)
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 33554492, ; uint32_t type_token_id (0x200003c)
		i32 199; uint32_t java_map_index (0xc7)
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 33554495, ; uint32_t type_token_id (0x200003f)
		i32 232; uint32_t java_map_index (0xe8)
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 33554497, ; uint32_t type_token_id (0x2000041)
		i32 321; uint32_t java_map_index (0x141)
	} ; 13
], align 4

@module8_managed_to_java = internal dso_local constant [6 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554436, ; uint32_t type_token_id (0x2000004)
		i32 223; uint32_t java_map_index (0xdf)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554437, ; uint32_t type_token_id (0x2000005)
		i32 364; uint32_t java_map_index (0x16c)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554438, ; uint32_t type_token_id (0x2000006)
		i32 148; uint32_t java_map_index (0x94)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554441, ; uint32_t type_token_id (0x2000009)
		i32 263; uint32_t java_map_index (0x107)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554447, ; uint32_t type_token_id (0x200000f)
		i32 14; uint32_t java_map_index (0xe)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554448, ; uint32_t type_token_id (0x2000010)
		i32 137; uint32_t java_map_index (0x89)
	} ; 5
], align 4

@module9_managed_to_java = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554438, ; uint32_t type_token_id (0x2000006)
		i32 519; uint32_t java_map_index (0x207)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554446, ; uint32_t type_token_id (0x200000e)
		i32 225; uint32_t java_map_index (0xe1)
	} ; 1
], align 4

@module10_managed_to_java = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554478, ; uint32_t type_token_id (0x200002e)
		i32 368; uint32_t java_map_index (0x170)
	} ; 0
], align 4

@module11_managed_to_java = internal dso_local constant [10 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554442, ; uint32_t type_token_id (0x200000a)
		i32 440; uint32_t java_map_index (0x1b8)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554445, ; uint32_t type_token_id (0x200000d)
		i32 8; uint32_t java_map_index (0x8)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554453, ; uint32_t type_token_id (0x2000015)
		i32 41; uint32_t java_map_index (0x29)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554454, ; uint32_t type_token_id (0x2000016)
		i32 296; uint32_t java_map_index (0x128)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554455, ; uint32_t type_token_id (0x2000017)
		i32 51; uint32_t java_map_index (0x33)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554456, ; uint32_t type_token_id (0x2000018)
		i32 108; uint32_t java_map_index (0x6c)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554457, ; uint32_t type_token_id (0x2000019)
		i32 154; uint32_t java_map_index (0x9a)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554458, ; uint32_t type_token_id (0x200001a)
		i32 430; uint32_t java_map_index (0x1ae)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554460, ; uint32_t type_token_id (0x200001c)
		i32 459; uint32_t java_map_index (0x1cb)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554461, ; uint32_t type_token_id (0x200001d)
		i32 486; uint32_t java_map_index (0x1e6)
	} ; 9
], align 4

@module11_managed_to_java_duplicates = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554459, ; uint32_t type_token_id (0x200001b)
		i32 430; uint32_t java_map_index (0x1ae)
	} ; 0
], align 4

@module12_managed_to_java = internal dso_local constant [7 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554434, ; uint32_t type_token_id (0x2000002)
		i32 315; uint32_t java_map_index (0x13b)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554435, ; uint32_t type_token_id (0x2000003)
		i32 106; uint32_t java_map_index (0x6a)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554436, ; uint32_t type_token_id (0x2000004)
		i32 493; uint32_t java_map_index (0x1ed)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554437, ; uint32_t type_token_id (0x2000005)
		i32 134; uint32_t java_map_index (0x86)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554438, ; uint32_t type_token_id (0x2000006)
		i32 91; uint32_t java_map_index (0x5b)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554440, ; uint32_t type_token_id (0x2000008)
		i32 15; uint32_t java_map_index (0xf)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554538, ; uint32_t type_token_id (0x200006a)
		i32 347; uint32_t java_map_index (0x15b)
	} ; 6
], align 4

@module13_managed_to_java = internal dso_local constant [9 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554447, ; uint32_t type_token_id (0x200000f)
		i32 435; uint32_t java_map_index (0x1b3)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554448, ; uint32_t type_token_id (0x2000010)
		i32 97; uint32_t java_map_index (0x61)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554449, ; uint32_t type_token_id (0x2000011)
		i32 110; uint32_t java_map_index (0x6e)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554450, ; uint32_t type_token_id (0x2000012)
		i32 445; uint32_t java_map_index (0x1bd)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554451, ; uint32_t type_token_id (0x2000013)
		i32 353; uint32_t java_map_index (0x161)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554452, ; uint32_t type_token_id (0x2000014)
		i32 408; uint32_t java_map_index (0x198)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554453, ; uint32_t type_token_id (0x2000015)
		i32 411; uint32_t java_map_index (0x19b)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554455, ; uint32_t type_token_id (0x2000017)
		i32 47; uint32_t java_map_index (0x2f)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554456, ; uint32_t type_token_id (0x2000018)
		i32 37; uint32_t java_map_index (0x25)
	} ; 8
], align 4

@module13_managed_to_java_duplicates = internal dso_local constant [3 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554454, ; uint32_t type_token_id (0x2000016)
		i32 411; uint32_t java_map_index (0x19b)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554457, ; uint32_t type_token_id (0x2000019)
		i32 37; uint32_t java_map_index (0x25)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554458, ; uint32_t type_token_id (0x200001a)
		i32 47; uint32_t java_map_index (0x2f)
	} ; 2
], align 4

; Java to managed map
@map_java = dso_local local_unnamed_addr constant [529 x %struct.TypeMapJava] [
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555200, ; uint32_t type_token_id (0x2000300)
		i32 426; uint32_t java_name_index (0x1aa)
	}, ; 0
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 341; uint32_t java_name_index (0x155)
	}, ; 1
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555060, ; uint32_t type_token_id (0x2000274)
		i32 326; uint32_t java_name_index (0x146)
	}, ; 2
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554733, ; uint32_t type_token_id (0x200012d)
		i32 156; uint32_t java_name_index (0x9c)
	}, ; 3
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554774, ; uint32_t type_token_id (0x2000156)
		i32 186; uint32_t java_name_index (0xba)
	}, ; 4
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554636, ; uint32_t type_token_id (0x20000cc)
		i32 96; uint32_t java_name_index (0x60)
	}, ; 5
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554744, ; uint32_t type_token_id (0x2000138)
		i32 166; uint32_t java_name_index (0xa6)
	}, ; 6
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554660, ; uint32_t type_token_id (0x20000e4)
		i32 111; uint32_t java_name_index (0x6f)
	}, ; 7
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index (0xb)
		i32 33554445, ; uint32_t type_token_id (0x200000d)
		i32 504; uint32_t java_name_index (0x1f8)
	}, ; 8
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554667, ; uint32_t type_token_id (0x20000eb)
		i32 453; uint32_t java_name_index (0x1c5)
	}, ; 9
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554484, ; uint32_t type_token_id (0x2000034)
		i32 31; uint32_t java_name_index (0x1f)
	}, ; 10
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554849, ; uint32_t type_token_id (0x20001a1)
		i32 231; uint32_t java_name_index (0xe7)
	}, ; 11
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554583, ; uint32_t type_token_id (0x2000097)
		i32 69; uint32_t java_name_index (0x45)
	}, ; 12
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555019, ; uint32_t type_token_id (0x200024b)
		i32 298; uint32_t java_name_index (0x12a)
	}, ; 13
	%struct.TypeMapJava {
		i32 8, ; uint32_t module_index (0x8)
		i32 33554447, ; uint32_t type_token_id (0x200000f)
		i32 496; uint32_t java_name_index (0x1f0)
	}, ; 14
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index (0xc)
		i32 33554440, ; uint32_t type_token_id (0x2000008)
		i32 518; uint32_t java_name_index (0x206)
	}, ; 15
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555205, ; uint32_t type_token_id (0x2000305)
		i32 430; uint32_t java_name_index (0x1ae)
	}, ; 16
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554799, ; uint32_t type_token_id (0x200016f)
		i32 201; uint32_t java_name_index (0xc9)
	}, ; 17
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555175, ; uint32_t type_token_id (0x20002e7)
		i32 406; uint32_t java_name_index (0x196)
	}, ; 18
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 467; uint32_t java_name_index (0x1d3)
	}, ; 19
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554663, ; uint32_t type_token_id (0x20000e7)
		i32 449; uint32_t java_name_index (0x1c1)
	}, ; 20
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554486, ; uint32_t type_token_id (0x2000036)
		i32 33; uint32_t java_name_index (0x21)
	}, ; 21
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554467, ; uint32_t type_token_id (0x2000023)
		i32 18; uint32_t java_name_index (0x12)
	}, ; 22
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554999, ; uint32_t type_token_id (0x2000237)
		i32 285; uint32_t java_name_index (0x11d)
	}, ; 23
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554703, ; uint32_t type_token_id (0x200010f)
		i32 132; uint32_t java_name_index (0x84)
	}, ; 24
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 339; uint32_t java_name_index (0x153)
	}, ; 25
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 129; uint32_t java_name_index (0x81)
	}, ; 26
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555097, ; uint32_t type_token_id (0x2000299)
		i32 350; uint32_t java_name_index (0x15e)
	}, ; 27
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554674, ; uint32_t type_token_id (0x20000f2)
		i32 458; uint32_t java_name_index (0x1ca)
	}, ; 28
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554949, ; uint32_t type_token_id (0x2000205)
		i32 265; uint32_t java_name_index (0x109)
	}, ; 29
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554580, ; uint32_t type_token_id (0x2000094)
		i32 67; uint32_t java_name_index (0x43)
	}, ; 30
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554481, ; uint32_t type_token_id (0x2000031)
		i32 30; uint32_t java_name_index (0x1e)
	}, ; 31
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554731, ; uint32_t type_token_id (0x200012b)
		i32 154; uint32_t java_name_index (0x9a)
	}, ; 32
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555126, ; uint32_t type_token_id (0x20002b6)
		i32 368; uint32_t java_name_index (0x170)
	}, ; 33
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555146, ; uint32_t type_token_id (0x20002ca)
		i32 384; uint32_t java_name_index (0x180)
	}, ; 34
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554948, ; uint32_t type_token_id (0x2000204)
		i32 264; uint32_t java_name_index (0x108)
	}, ; 35
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554471, ; uint32_t type_token_id (0x2000027)
		i32 447; uint32_t java_name_index (0x1bf)
	}, ; 36
	%struct.TypeMapJava {
		i32 13, ; uint32_t module_index (0xd)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 528; uint32_t java_name_index (0x210)
	}, ; 37
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 330; uint32_t java_name_index (0x14a)
	}, ; 38
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554450, ; uint32_t type_token_id (0x2000012)
		i32 7; uint32_t java_name_index (0x7)
	}, ; 39
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555075, ; uint32_t type_token_id (0x2000283)
		i32 335; uint32_t java_name_index (0x14f)
	}, ; 40
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index (0xb)
		i32 33554453, ; uint32_t type_token_id (0x2000015)
		i32 505; uint32_t java_name_index (0x1f9)
	}, ; 41
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554442, ; uint32_t type_token_id (0x200000a)
		i32 3; uint32_t java_name_index (0x3)
	}, ; 42
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555130, ; uint32_t type_token_id (0x20002ba)
		i32 371; uint32_t java_name_index (0x173)
	}, ; 43
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554996, ; uint32_t type_token_id (0x2000234)
		i32 284; uint32_t java_name_index (0x11c)
	}, ; 44
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554465, ; uint32_t type_token_id (0x2000021)
		i32 16; uint32_t java_name_index (0x10)
	}, ; 45
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555012, ; uint32_t type_token_id (0x2000244)
		i32 294; uint32_t java_name_index (0x126)
	}, ; 46
	%struct.TypeMapJava {
		i32 13, ; uint32_t module_index (0xd)
		i32 33554455, ; uint32_t type_token_id (0x2000017)
		i32 527; uint32_t java_name_index (0x20f)
	}, ; 47
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index (0x3)
		i32 33554436, ; uint32_t type_token_id (0x2000004)
		i32 439; uint32_t java_name_index (0x1b7)
	}, ; 48
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554740, ; uint32_t type_token_id (0x2000134)
		i32 162; uint32_t java_name_index (0xa2)
	}, ; 49
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554824, ; uint32_t type_token_id (0x2000188)
		i32 216; uint32_t java_name_index (0xd8)
	}, ; 50
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index (0xb)
		i32 33554455, ; uint32_t type_token_id (0x2000017)
		i32 507; uint32_t java_name_index (0x1fb)
	}, ; 51
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555155, ; uint32_t type_token_id (0x20002d3)
		i32 391; uint32_t java_name_index (0x187)
	}, ; 52
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555131, ; uint32_t type_token_id (0x20002bb)
		i32 372; uint32_t java_name_index (0x174)
	}, ; 53
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554728, ; uint32_t type_token_id (0x2000128)
		i32 151; uint32_t java_name_index (0x97)
	}, ; 54
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 215; uint32_t java_name_index (0xd7)
	}, ; 55
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554528, ; uint32_t type_token_id (0x2000060)
		i32 59; uint32_t java_name_index (0x3b)
	}, ; 56
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554875, ; uint32_t type_token_id (0x20001bb)
		i32 246; uint32_t java_name_index (0xf6)
	}, ; 57
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554864, ; uint32_t type_token_id (0x20001b0)
		i32 240; uint32_t java_name_index (0xf0)
	}, ; 58
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554571, ; uint32_t type_token_id (0x200008b)
		i32 61; uint32_t java_name_index (0x3d)
	}, ; 59
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555152, ; uint32_t type_token_id (0x20002d0)
		i32 389; uint32_t java_name_index (0x185)
	}, ; 60
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554455, ; uint32_t type_token_id (0x2000017)
		i32 9; uint32_t java_name_index (0x9)
	}, ; 61
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554612, ; uint32_t type_token_id (0x20000b4)
		i32 87; uint32_t java_name_index (0x57)
	}, ; 62
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555127, ; uint32_t type_token_id (0x20002b7)
		i32 369; uint32_t java_name_index (0x171)
	}, ; 63
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555112, ; uint32_t type_token_id (0x20002a8)
		i32 359; uint32_t java_name_index (0x167)
	}, ; 64
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554670, ; uint32_t type_token_id (0x20000ee)
		i32 455; uint32_t java_name_index (0x1c7)
	}, ; 65
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 241; uint32_t java_name_index (0xf1)
	}, ; 66
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555144, ; uint32_t type_token_id (0x20002c8)
		i32 382; uint32_t java_name_index (0x17e)
	}, ; 67
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555056, ; uint32_t type_token_id (0x2000270)
		i32 322; uint32_t java_name_index (0x142)
	}, ; 68
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555188, ; uint32_t type_token_id (0x20002f4)
		i32 415; uint32_t java_name_index (0x19f)
	}, ; 69
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555055, ; uint32_t type_token_id (0x200026f)
		i32 321; uint32_t java_name_index (0x141)
	}, ; 70
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555073, ; uint32_t type_token_id (0x2000281)
		i32 333; uint32_t java_name_index (0x14d)
	}, ; 71
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554461, ; uint32_t type_token_id (0x200001d)
		i32 472; uint32_t java_name_index (0x1d8)
	}, ; 72
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554712, ; uint32_t type_token_id (0x2000118)
		i32 136; uint32_t java_name_index (0x88)
	}, ; 73
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554679, ; uint32_t type_token_id (0x20000f7)
		i32 461; uint32_t java_name_index (0x1cd)
	}, ; 74
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554896, ; uint32_t type_token_id (0x20001d0)
		i32 256; uint32_t java_name_index (0x100)
	}, ; 75
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 486; uint32_t java_name_index (0x1e6)
	}, ; 76
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554762, ; uint32_t type_token_id (0x200014a)
		i32 179; uint32_t java_name_index (0xb3)
	}, ; 77
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554483, ; uint32_t type_token_id (0x2000033)
		i32 484; uint32_t java_name_index (0x1e4)
	}, ; 78
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555023, ; uint32_t type_token_id (0x200024f)
		i32 301; uint32_t java_name_index (0x12d)
	}, ; 79
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554459, ; uint32_t type_token_id (0x200001b)
		i32 11; uint32_t java_name_index (0xb)
	}, ; 80
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554573, ; uint32_t type_token_id (0x200008d)
		i32 62; uint32_t java_name_index (0x3e)
	}, ; 81
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555022, ; uint32_t type_token_id (0x200024e)
		i32 300; uint32_t java_name_index (0x12c)
	}, ; 82
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554777, ; uint32_t type_token_id (0x2000159)
		i32 189; uint32_t java_name_index (0xbd)
	}, ; 83
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554742, ; uint32_t type_token_id (0x2000136)
		i32 164; uint32_t java_name_index (0xa4)
	}, ; 84
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555051, ; uint32_t type_token_id (0x200026b)
		i32 318; uint32_t java_name_index (0x13e)
	}, ; 85
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554840, ; uint32_t type_token_id (0x2000198)
		i32 228; uint32_t java_name_index (0xe4)
	}, ; 86
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554794, ; uint32_t type_token_id (0x200016a)
		i32 199; uint32_t java_name_index (0xc7)
	}, ; 87
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555005, ; uint32_t type_token_id (0x200023d)
		i32 289; uint32_t java_name_index (0x121)
	}, ; 88
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 239; uint32_t java_name_index (0xef)
	}, ; 89
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 348; uint32_t java_name_index (0x15c)
	}, ; 90
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index (0xc)
		i32 33554438, ; uint32_t type_token_id (0x2000006)
		i32 517; uint32_t java_name_index (0x205)
	}, ; 91
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554838, ; uint32_t type_token_id (0x2000196)
		i32 226; uint32_t java_name_index (0xe2)
	}, ; 92
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554789, ; uint32_t type_token_id (0x2000165)
		i32 197; uint32_t java_name_index (0xc5)
	}, ; 93
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555160, ; uint32_t type_token_id (0x20002d8)
		i32 394; uint32_t java_name_index (0x18a)
	}, ; 94
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554617, ; uint32_t type_token_id (0x20000b9)
		i32 89; uint32_t java_name_index (0x59)
	}, ; 95
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 299; uint32_t java_name_index (0x12b)
	}, ; 96
	%struct.TypeMapJava {
		i32 13, ; uint32_t module_index (0xd)
		i32 33554448, ; uint32_t type_token_id (0x2000010)
		i32 521; uint32_t java_name_index (0x209)
	}, ; 97
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554442, ; uint32_t type_token_id (0x200000a)
		i32 433; uint32_t java_name_index (0x1b1)
	}, ; 98
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 173; uint32_t java_name_index (0xad)
	}, ; 99
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555046, ; uint32_t type_token_id (0x2000266)
		i32 313; uint32_t java_name_index (0x139)
	}, ; 100
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555129, ; uint32_t type_token_id (0x20002b9)
		i32 370; uint32_t java_name_index (0x172)
	}, ; 101
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 126; uint32_t java_name_index (0x7e)
	}, ; 102
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 238; uint32_t java_name_index (0xee)
	}, ; 103
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555118, ; uint32_t type_token_id (0x20002ae)
		i32 363; uint32_t java_name_index (0x16b)
	}, ; 104
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554981, ; uint32_t type_token_id (0x2000225)
		i32 272; uint32_t java_name_index (0x110)
	}, ; 105
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index (0xc)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 514; uint32_t java_name_index (0x202)
	}, ; 106
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 103; uint32_t java_name_index (0x67)
	}, ; 107
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index (0xb)
		i32 33554456, ; uint32_t type_token_id (0x2000018)
		i32 508; uint32_t java_name_index (0x1fc)
	}, ; 108
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 203; uint32_t java_name_index (0xcb)
	}, ; 109
	%struct.TypeMapJava {
		i32 13, ; uint32_t module_index (0xd)
		i32 33554449, ; uint32_t type_token_id (0x2000011)
		i32 522; uint32_t java_name_index (0x20a)
	}, ; 110
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555133, ; uint32_t type_token_id (0x20002bd)
		i32 374; uint32_t java_name_index (0x176)
	}, ; 111
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554982, ; uint32_t type_token_id (0x2000226)
		i32 273; uint32_t java_name_index (0x111)
	}, ; 112
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555076, ; uint32_t type_token_id (0x2000284)
		i32 336; uint32_t java_name_index (0x150)
	}, ; 113
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554575, ; uint32_t type_token_id (0x200008f)
		i32 64; uint32_t java_name_index (0x40)
	}, ; 114
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 125; uint32_t java_name_index (0x7d)
	}, ; 115
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554466, ; uint32_t type_token_id (0x2000022)
		i32 17; uint32_t java_name_index (0x11)
	}, ; 116
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554739, ; uint32_t type_token_id (0x2000133)
		i32 161; uint32_t java_name_index (0xa1)
	}, ; 117
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554464, ; uint32_t type_token_id (0x2000020)
		i32 15; uint32_t java_name_index (0xf)
	}, ; 118
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554803, ; uint32_t type_token_id (0x2000173)
		i32 204; uint32_t java_name_index (0xcc)
	}, ; 119
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554633, ; uint32_t type_token_id (0x20000c9)
		i32 94; uint32_t java_name_index (0x5e)
	}, ; 120
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 172; uint32_t java_name_index (0xac)
	}, ; 121
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554463, ; uint32_t type_token_id (0x200001f)
		i32 14; uint32_t java_name_index (0xe)
	}, ; 122
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555169, ; uint32_t type_token_id (0x20002e1)
		i32 401; uint32_t java_name_index (0x191)
	}, ; 123
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554780, ; uint32_t type_token_id (0x200015c)
		i32 192; uint32_t java_name_index (0xc0)
	}, ; 124
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 355; uint32_t java_name_index (0x163)
	}, ; 125
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555000, ; uint32_t type_token_id (0x2000238)
		i32 286; uint32_t java_name_index (0x11e)
	}, ; 126
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554724, ; uint32_t type_token_id (0x2000124)
		i32 147; uint32_t java_name_index (0x93)
	}, ; 127
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554745, ; uint32_t type_token_id (0x2000139)
		i32 167; uint32_t java_name_index (0xa7)
	}, ; 128
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554673, ; uint32_t type_token_id (0x20000f1)
		i32 457; uint32_t java_name_index (0x1c9)
	}, ; 129
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554804, ; uint32_t type_token_id (0x2000174)
		i32 205; uint32_t java_name_index (0xcd)
	}, ; 130
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554506, ; uint32_t type_token_id (0x200004a)
		i32 45; uint32_t java_name_index (0x2d)
	}, ; 131
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554458, ; uint32_t type_token_id (0x200001a)
		i32 469; uint32_t java_name_index (0x1d5)
	}, ; 132
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554599, ; uint32_t type_token_id (0x20000a7)
		i32 78; uint32_t java_name_index (0x4e)
	}, ; 133
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index (0xc)
		i32 33554437, ; uint32_t type_token_id (0x2000005)
		i32 516; uint32_t java_name_index (0x204)
	}, ; 134
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554521, ; uint32_t type_token_id (0x2000059)
		i32 54; uint32_t java_name_index (0x36)
	}, ; 135
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 128; uint32_t java_name_index (0x80)
	}, ; 136
	%struct.TypeMapJava {
		i32 8, ; uint32_t module_index (0x8)
		i32 33554448, ; uint32_t type_token_id (0x2000010)
		i32 497; uint32_t java_name_index (0x1f1)
	}, ; 137
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554490, ; uint32_t type_token_id (0x200003a)
		i32 35; uint32_t java_name_index (0x23)
	}, ; 138
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554713, ; uint32_t type_token_id (0x2000119)
		i32 137; uint32_t java_name_index (0x89)
	}, ; 139
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554741, ; uint32_t type_token_id (0x2000135)
		i32 163; uint32_t java_name_index (0xa3)
	}, ; 140
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 236; uint32_t java_name_index (0xec)
	}, ; 141
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554659, ; uint32_t type_token_id (0x20000e3)
		i32 110; uint32_t java_name_index (0x6e)
	}, ; 142
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554581, ; uint32_t type_token_id (0x2000095)
		i32 68; uint32_t java_name_index (0x44)
	}, ; 143
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554721, ; uint32_t type_token_id (0x2000121)
		i32 144; uint32_t java_name_index (0x90)
	}, ; 144
	%struct.TypeMapJava {
		i32 5, ; uint32_t module_index (0x5)
		i32 33554438, ; uint32_t type_token_id (0x2000006)
		i32 446; uint32_t java_name_index (0x1be)
	}, ; 145
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554460, ; uint32_t type_token_id (0x200001c)
		i32 471; uint32_t java_name_index (0x1d7)
	}, ; 146
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554472, ; uint32_t type_token_id (0x2000028)
		i32 23; uint32_t java_name_index (0x17)
	}, ; 147
	%struct.TypeMapJava {
		i32 8, ; uint32_t module_index (0x8)
		i32 33554438, ; uint32_t type_token_id (0x2000006)
		i32 498; uint32_t java_name_index (0x1f2)
	}, ; 148
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554657, ; uint32_t type_token_id (0x20000e1)
		i32 108; uint32_t java_name_index (0x6c)
	}, ; 149
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555174, ; uint32_t type_token_id (0x20002e6)
		i32 405; uint32_t java_name_index (0x195)
	}, ; 150
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554975, ; uint32_t type_token_id (0x200021f)
		i32 267; uint32_t java_name_index (0x10b)
	}, ; 151
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554504, ; uint32_t type_token_id (0x2000048)
		i32 43; uint32_t java_name_index (0x2b)
	}, ; 152
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554675, ; uint32_t type_token_id (0x20000f3)
		i32 459; uint32_t java_name_index (0x1cb)
	}, ; 153
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index (0xb)
		i32 33554457, ; uint32_t type_token_id (0x2000019)
		i32 509; uint32_t java_name_index (0x1fd)
	}, ; 154
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 127; uint32_t java_name_index (0x7f)
	}, ; 155
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554795, ; uint32_t type_token_id (0x200016b)
		i32 200; uint32_t java_name_index (0xc8)
	}, ; 156
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554773, ; uint32_t type_token_id (0x2000155)
		i32 185; uint32_t java_name_index (0xb9)
	}, ; 157
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 198; uint32_t java_name_index (0xc6)
	}, ; 158
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554787, ; uint32_t type_token_id (0x2000163)
		i32 195; uint32_t java_name_index (0xc3)
	}, ; 159
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554730, ; uint32_t type_token_id (0x200012a)
		i32 153; uint32_t java_name_index (0x99)
	}, ; 160
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554493, ; uint32_t type_token_id (0x200003d)
		i32 490; uint32_t java_name_index (0x1ea)
	}, ; 161
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555139, ; uint32_t type_token_id (0x20002c3)
		i32 379; uint32_t java_name_index (0x17b)
	}, ; 162
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554674, ; uint32_t type_token_id (0x20000f2)
		i32 120; uint32_t java_name_index (0x78)
	}, ; 163
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555119, ; uint32_t type_token_id (0x20002af)
		i32 364; uint32_t java_name_index (0x16c)
	}, ; 164
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554509, ; uint32_t type_token_id (0x200004d)
		i32 46; uint32_t java_name_index (0x2e)
	}, ; 165
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554654, ; uint32_t type_token_id (0x20000de)
		i32 105; uint32_t java_name_index (0x69)
	}, ; 166
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554668, ; uint32_t type_token_id (0x20000ec)
		i32 454; uint32_t java_name_index (0x1c6)
	}, ; 167
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554817, ; uint32_t type_token_id (0x2000181)
		i32 213; uint32_t java_name_index (0xd5)
	}, ; 168
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554450, ; uint32_t type_token_id (0x2000012)
		i32 437; uint32_t java_name_index (0x1b5)
	}, ; 169
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554827, ; uint32_t type_token_id (0x200018b)
		i32 219; uint32_t java_name_index (0xdb)
	}, ; 170
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555052, ; uint32_t type_token_id (0x200026c)
		i32 319; uint32_t java_name_index (0x13f)
	}, ; 171
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555096, ; uint32_t type_token_id (0x2000298)
		i32 349; uint32_t java_name_index (0x15d)
	}, ; 172
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 101; uint32_t java_name_index (0x65)
	}, ; 173
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554446, ; uint32_t type_token_id (0x200000e)
		i32 5; uint32_t java_name_index (0x5)
	}, ; 174
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554577, ; uint32_t type_token_id (0x2000091)
		i32 65; uint32_t java_name_index (0x41)
	}, ; 175
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555172, ; uint32_t type_token_id (0x20002e4)
		i32 404; uint32_t java_name_index (0x194)
	}, ; 176
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554826, ; uint32_t type_token_id (0x200018a)
		i32 218; uint32_t java_name_index (0xda)
	}, ; 177
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554653, ; uint32_t type_token_id (0x20000dd)
		i32 104; uint32_t java_name_index (0x68)
	}, ; 178
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 436; uint32_t java_name_index (0x1b4)
	}, ; 179
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554987, ; uint32_t type_token_id (0x200022b)
		i32 278; uint32_t java_name_index (0x116)
	}, ; 180
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554719, ; uint32_t type_token_id (0x200011f)
		i32 142; uint32_t java_name_index (0x8e)
	}, ; 181
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 225; uint32_t java_name_index (0xe1)
	}, ; 182
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554526, ; uint32_t type_token_id (0x200005e)
		i32 58; uint32_t java_name_index (0x3a)
	}, ; 183
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554764, ; uint32_t type_token_id (0x200014c)
		i32 181; uint32_t java_name_index (0xb5)
	}, ; 184
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554457, ; uint32_t type_token_id (0x2000019)
		i32 468; uint32_t java_name_index (0x1d4)
	}, ; 185
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554468, ; uint32_t type_token_id (0x2000024)
		i32 19; uint32_t java_name_index (0x13)
	}, ; 186
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index (0x3)
		i32 33554441, ; uint32_t type_token_id (0x2000009)
		i32 442; uint32_t java_name_index (0x1ba)
	}, ; 187
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554678, ; uint32_t type_token_id (0x20000f6)
		i32 123; uint32_t java_name_index (0x7b)
	}, ; 188
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554853, ; uint32_t type_token_id (0x20001a5)
		i32 234; uint32_t java_name_index (0xea)
	}, ; 189
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554715, ; uint32_t type_token_id (0x200011b)
		i32 139; uint32_t java_name_index (0x8b)
	}, ; 190
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554781, ; uint32_t type_token_id (0x200015d)
		i32 193; uint32_t java_name_index (0xc1)
	}, ; 191
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555006, ; uint32_t type_token_id (0x200023e)
		i32 290; uint32_t java_name_index (0x122)
	}, ; 192
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 72; uint32_t java_name_index (0x48)
	}, ; 193
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554454, ; uint32_t type_token_id (0x2000016)
		i32 466; uint32_t java_name_index (0x1d2)
	}, ; 194
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555010, ; uint32_t type_token_id (0x2000242)
		i32 293; uint32_t java_name_index (0x125)
	}, ; 195
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554664, ; uint32_t type_token_id (0x20000e8)
		i32 450; uint32_t java_name_index (0x1c2)
	}, ; 196
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index (0x4)
		i32 33554704, ; uint32_t type_token_id (0x2000110)
		i32 443; uint32_t java_name_index (0x1bb)
	}, ; 197
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554814, ; uint32_t type_token_id (0x200017e)
		i32 211; uint32_t java_name_index (0xd3)
	}, ; 198
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 489; uint32_t java_name_index (0x1e9)
	}, ; 199
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555047, ; uint32_t type_token_id (0x2000267)
		i32 314; uint32_t java_name_index (0x13a)
	}, ; 200
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554666, ; uint32_t type_token_id (0x20000ea)
		i32 452; uint32_t java_name_index (0x1c4)
	}, ; 201
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554979, ; uint32_t type_token_id (0x2000223)
		i32 271; uint32_t java_name_index (0x10f)
	}, ; 202
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 174; uint32_t java_name_index (0xae)
	}, ; 203
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554743, ; uint32_t type_token_id (0x2000137)
		i32 165; uint32_t java_name_index (0xa5)
	}, ; 204
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 360; uint32_t java_name_index (0x168)
	}, ; 205
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555053, ; uint32_t type_token_id (0x200026d)
		i32 320; uint32_t java_name_index (0x140)
	}, ; 206
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555145, ; uint32_t type_token_id (0x20002c9)
		i32 383; uint32_t java_name_index (0x17f)
	}, ; 207
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554459, ; uint32_t type_token_id (0x200001b)
		i32 470; uint32_t java_name_index (0x1d6)
	}, ; 208
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index (0x3)
		i32 33554435, ; uint32_t type_token_id (0x2000003)
		i32 438; uint32_t java_name_index (0x1b6)
	}, ; 209
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index (0x3)
		i32 33554437, ; uint32_t type_token_id (0x2000005)
		i32 440; uint32_t java_name_index (0x1b8)
	}, ; 210
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554848, ; uint32_t type_token_id (0x20001a0)
		i32 230; uint32_t java_name_index (0xe6)
	}, ; 211
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554704, ; uint32_t type_token_id (0x2000110)
		i32 133; uint32_t java_name_index (0x85)
	}, ; 212
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555154, ; uint32_t type_token_id (0x20002d2)
		i32 390; uint32_t java_name_index (0x186)
	}, ; 213
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554439, ; uint32_t type_token_id (0x2000007)
		i32 2; uint32_t java_name_index (0x2)
	}, ; 214
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555168, ; uint32_t type_token_id (0x20002e0)
		i32 400; uint32_t java_name_index (0x190)
	}, ; 215
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 102; uint32_t java_name_index (0x66)
	}, ; 216
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554936, ; uint32_t type_token_id (0x20001f8)
		i32 261; uint32_t java_name_index (0x105)
	}, ; 217
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554656, ; uint32_t type_token_id (0x20000e0)
		i32 107; uint32_t java_name_index (0x6b)
	}, ; 218
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554714, ; uint32_t type_token_id (0x200011a)
		i32 138; uint32_t java_name_index (0x8a)
	}, ; 219
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554471, ; uint32_t type_token_id (0x2000027)
		i32 22; uint32_t java_name_index (0x16)
	}, ; 220
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 235; uint32_t java_name_index (0xeb)
	}, ; 221
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554778, ; uint32_t type_token_id (0x200015a)
		i32 190; uint32_t java_name_index (0xbe)
	}, ; 222
	%struct.TypeMapJava {
		i32 8, ; uint32_t module_index (0x8)
		i32 33554436, ; uint32_t type_token_id (0x2000004)
		i32 494; uint32_t java_name_index (0x1ee)
	}, ; 223
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555124, ; uint32_t type_token_id (0x20002b4)
		i32 367; uint32_t java_name_index (0x16f)
	}, ; 224
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index (0x9)
		i32 33554446, ; uint32_t type_token_id (0x200000e)
		i32 501; uint32_t java_name_index (0x1f5)
	}, ; 225
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 483; uint32_t java_name_index (0x1e3)
	}, ; 226
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555182, ; uint32_t type_token_id (0x20002ee)
		i32 410; uint32_t java_name_index (0x19a)
	}, ; 227
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 130; uint32_t java_name_index (0x82)
	}, ; 228
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 171; uint32_t java_name_index (0xab)
	}, ; 229
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555015, ; uint32_t type_token_id (0x2000247)
		i32 296; uint32_t java_name_index (0x128)
	}, ; 230
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555191, ; uint32_t type_token_id (0x20002f7)
		i32 418; uint32_t java_name_index (0x1a2)
	}, ; 231
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554494, ; uint32_t type_token_id (0x200003e)
		i32 491; uint32_t java_name_index (0x1eb)
	}, ; 232
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554496, ; uint32_t type_token_id (0x2000040)
		i32 39; uint32_t java_name_index (0x27)
	}, ; 233
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 414; uint32_t java_name_index (0x19e)
	}, ; 234
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554886, ; uint32_t type_token_id (0x20001c6)
		i32 252; uint32_t java_name_index (0xfc)
	}, ; 235
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554726, ; uint32_t type_token_id (0x2000126)
		i32 149; uint32_t java_name_index (0x95)
	}, ; 236
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554682, ; uint32_t type_token_id (0x20000fa)
		i32 462; uint32_t java_name_index (0x1ce)
	}, ; 237
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555100, ; uint32_t type_token_id (0x200029c)
		i32 352; uint32_t java_name_index (0x160)
	}, ; 238
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554469, ; uint32_t type_token_id (0x2000025)
		i32 20; uint32_t java_name_index (0x14)
	}, ; 239
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 237; uint32_t java_name_index (0xed)
	}, ; 240
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554876, ; uint32_t type_token_id (0x20001bc)
		i32 247; uint32_t java_name_index (0xf7)
	}, ; 241
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554734, ; uint32_t type_token_id (0x200012e)
		i32 157; uint32_t java_name_index (0x9d)
	}, ; 242
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554839, ; uint32_t type_token_id (0x2000197)
		i32 227; uint32_t java_name_index (0xe3)
	}, ; 243
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554495, ; uint32_t type_token_id (0x200003f)
		i32 38; uint32_t java_name_index (0x26)
	}, ; 244
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555040, ; uint32_t type_token_id (0x2000260)
		i32 310; uint32_t java_name_index (0x136)
	}, ; 245
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554476, ; uint32_t type_token_id (0x200002c)
		i32 27; uint32_t java_name_index (0x1b)
	}, ; 246
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554479, ; uint32_t type_token_id (0x200002f)
		i32 28; uint32_t java_name_index (0x1c)
	}, ; 247
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555166, ; uint32_t type_token_id (0x20002de)
		i32 398; uint32_t java_name_index (0x18e)
	}, ; 248
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554873, ; uint32_t type_token_id (0x20001b9)
		i32 245; uint32_t java_name_index (0xf5)
	}, ; 249
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554461, ; uint32_t type_token_id (0x200001d)
		i32 12; uint32_t java_name_index (0xc)
	}, ; 250
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555161, ; uint32_t type_token_id (0x20002d9)
		i32 395; uint32_t java_name_index (0x18b)
	}, ; 251
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 434; uint32_t java_name_index (0x1b2)
	}, ; 252
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555066, ; uint32_t type_token_id (0x200027a)
		i32 328; uint32_t java_name_index (0x148)
	}, ; 253
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 71; uint32_t java_name_index (0x47)
	}, ; 254
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554894, ; uint32_t type_token_id (0x20001ce)
		i32 255; uint32_t java_name_index (0xff)
	}, ; 255
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 346; uint32_t java_name_index (0x15a)
	}, ; 256
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555037, ; uint32_t type_token_id (0x200025d)
		i32 307; uint32_t java_name_index (0x133)
	}, ; 257
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554779, ; uint32_t type_token_id (0x200015b)
		i32 191; uint32_t java_name_index (0xbf)
	}, ; 258
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554994, ; uint32_t type_token_id (0x2000232)
		i32 283; uint32_t java_name_index (0x11b)
	}, ; 259
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554805, ; uint32_t type_token_id (0x2000175)
		i32 206; uint32_t java_name_index (0xce)
	}, ; 260
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 170; uint32_t java_name_index (0xaa)
	}, ; 261
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554478, ; uint32_t type_token_id (0x200002e)
		i32 481; uint32_t java_name_index (0x1e1)
	}, ; 262
	%struct.TypeMapJava {
		i32 8, ; uint32_t module_index (0x8)
		i32 33554441, ; uint32_t type_token_id (0x2000009)
		i32 499; uint32_t java_name_index (0x1f3)
	}, ; 263
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554775, ; uint32_t type_token_id (0x2000157)
		i32 187; uint32_t java_name_index (0xbb)
	}, ; 264
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554661, ; uint32_t type_token_id (0x20000e5)
		i32 112; uint32_t java_name_index (0x70)
	}, ; 265
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554435, ; uint32_t type_token_id (0x2000003)
		i32 0; uint32_t java_name_index (0x0)
	}, ; 266
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 476; uint32_t java_name_index (0x1dc)
	}, ; 267
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555077, ; uint32_t type_token_id (0x2000285)
		i32 337; uint32_t java_name_index (0x151)
	}, ; 268
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555147, ; uint32_t type_token_id (0x20002cb)
		i32 385; uint32_t java_name_index (0x181)
	}, ; 269
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554722, ; uint32_t type_token_id (0x2000122)
		i32 145; uint32_t java_name_index (0x91)
	}, ; 270
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555202, ; uint32_t type_token_id (0x2000302)
		i32 427; uint32_t java_name_index (0x1ab)
	}, ; 271
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554600, ; uint32_t type_token_id (0x20000a8)
		i32 79; uint32_t java_name_index (0x4f)
	}, ; 272
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554515, ; uint32_t type_token_id (0x2000053)
		i32 50; uint32_t java_name_index (0x32)
	}, ; 273
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555138, ; uint32_t type_token_id (0x20002c2)
		i32 378; uint32_t java_name_index (0x17a)
	}, ; 274
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554444, ; uint32_t type_token_id (0x200000c)
		i32 4; uint32_t java_name_index (0x4)
	}, ; 275
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555197, ; uint32_t type_token_id (0x20002fd)
		i32 423; uint32_t java_name_index (0x1a7)
	}, ; 276
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554832, ; uint32_t type_token_id (0x2000190)
		i32 221; uint32_t java_name_index (0xdd)
	}, ; 277
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index (0x3)
		i32 33554440, ; uint32_t type_token_id (0x2000008)
		i32 441; uint32_t java_name_index (0x1b9)
	}, ; 278
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 392; uint32_t java_name_index (0x188)
	}, ; 279
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555189, ; uint32_t type_token_id (0x20002f5)
		i32 416; uint32_t java_name_index (0x1a0)
	}, ; 280
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555192, ; uint32_t type_token_id (0x20002f8)
		i32 419; uint32_t java_name_index (0x1a3)
	}, ; 281
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 288; uint32_t java_name_index (0x120)
	}, ; 282
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555141, ; uint32_t type_token_id (0x20002c5)
		i32 380; uint32_t java_name_index (0x17c)
	}, ; 283
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555190, ; uint32_t type_token_id (0x20002f6)
		i32 417; uint32_t java_name_index (0x1a1)
	}, ; 284
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554475, ; uint32_t type_token_id (0x200002b)
		i32 26; uint32_t java_name_index (0x1a)
	}, ; 285
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554602, ; uint32_t type_token_id (0x20000aa)
		i32 81; uint32_t java_name_index (0x51)
	}, ; 286
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 251; uint32_t java_name_index (0xfb)
	}, ; 287
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554720, ; uint32_t type_token_id (0x2000120)
		i32 143; uint32_t java_name_index (0x8f)
	}, ; 288
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554825, ; uint32_t type_token_id (0x2000189)
		i32 217; uint32_t java_name_index (0xd9)
	}, ; 289
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554893, ; uint32_t type_token_id (0x20001cd)
		i32 254; uint32_t java_name_index (0xfe)
	}, ; 290
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554641, ; uint32_t type_token_id (0x20000d1)
		i32 99; uint32_t java_name_index (0x63)
	}, ; 291
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 243; uint32_t java_name_index (0xf3)
	}, ; 292
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555057, ; uint32_t type_token_id (0x2000271)
		i32 323; uint32_t java_name_index (0x143)
	}, ; 293
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554723, ; uint32_t type_token_id (0x2000123)
		i32 146; uint32_t java_name_index (0x92)
	}, ; 294
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555206, ; uint32_t type_token_id (0x2000306)
		i32 431; uint32_t java_name_index (0x1af)
	}, ; 295
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index (0xb)
		i32 33554454, ; uint32_t type_token_id (0x2000016)
		i32 506; uint32_t java_name_index (0x1fa)
	}, ; 296
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554609, ; uint32_t type_token_id (0x20000b1)
		i32 85; uint32_t java_name_index (0x55)
	}, ; 297
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555039, ; uint32_t type_token_id (0x200025f)
		i32 309; uint32_t java_name_index (0x135)
	}, ; 298
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554736, ; uint32_t type_token_id (0x2000130)
		i32 159; uint32_t java_name_index (0x9f)
	}, ; 299
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554732, ; uint32_t type_token_id (0x200012c)
		i32 155; uint32_t java_name_index (0x9b)
	}, ; 300
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555198, ; uint32_t type_token_id (0x20002fe)
		i32 424; uint32_t java_name_index (0x1a8)
	}, ; 301
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554516, ; uint32_t type_token_id (0x2000054)
		i32 51; uint32_t java_name_index (0x33)
	}, ; 302
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554819, ; uint32_t type_token_id (0x2000183)
		i32 214; uint32_t java_name_index (0xd6)
	}, ; 303
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554519, ; uint32_t type_token_id (0x2000057)
		i32 52; uint32_t java_name_index (0x34)
	}, ; 304
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554692, ; uint32_t type_token_id (0x2000104)
		i32 464; uint32_t java_name_index (0x1d0)
	}, ; 305
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555061, ; uint32_t type_token_id (0x2000275)
		i32 327; uint32_t java_name_index (0x147)
	}, ; 306
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555074, ; uint32_t type_token_id (0x2000282)
		i32 334; uint32_t java_name_index (0x14e)
	}, ; 307
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554678, ; uint32_t type_token_id (0x20000f6)
		i32 460; uint32_t java_name_index (0x1cc)
	}, ; 308
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554662, ; uint32_t type_token_id (0x20000e6)
		i32 448; uint32_t java_name_index (0x1c0)
	}, ; 309
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554747, ; uint32_t type_token_id (0x200013b)
		i32 169; uint32_t java_name_index (0xa9)
	}, ; 310
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554990, ; uint32_t type_token_id (0x200022e)
		i32 281; uint32_t java_name_index (0x119)
	}, ; 311
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554811, ; uint32_t type_token_id (0x200017b)
		i32 208; uint32_t java_name_index (0xd0)
	}, ; 312
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 340; uint32_t java_name_index (0x154)
	}, ; 313
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554978, ; uint32_t type_token_id (0x2000222)
		i32 270; uint32_t java_name_index (0x10e)
	}, ; 314
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index (0xc)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 513; uint32_t java_name_index (0x201)
	}, ; 315
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554596, ; uint32_t type_token_id (0x20000a4)
		i32 76; uint32_t java_name_index (0x4c)
	}, ; 316
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554574, ; uint32_t type_token_id (0x200008e)
		i32 63; uint32_t java_name_index (0x3f)
	}, ; 317
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555008, ; uint32_t type_token_id (0x2000240)
		i32 292; uint32_t java_name_index (0x124)
	}, ; 318
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554637, ; uint32_t type_token_id (0x20000cd)
		i32 97; uint32_t java_name_index (0x61)
	}, ; 319
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555143, ; uint32_t type_token_id (0x20002c7)
		i32 381; uint32_t java_name_index (0x17d)
	}, ; 320
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 492; uint32_t java_name_index (0x1ec)
	}, ; 321
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555203, ; uint32_t type_token_id (0x2000303)
		i32 428; uint32_t java_name_index (0x1ac)
	}, ; 322
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 259; uint32_t java_name_index (0x103)
	}, ; 323
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554717, ; uint32_t type_token_id (0x200011d)
		i32 140; uint32_t java_name_index (0x8c)
	}, ; 324
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554945, ; uint32_t type_token_id (0x2000201)
		i32 262; uint32_t java_name_index (0x106)
	}, ; 325
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554524, ; uint32_t type_token_id (0x200005c)
		i32 56; uint32_t java_name_index (0x38)
	}, ; 326
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555115, ; uint32_t type_token_id (0x20002ab)
		i32 361; uint32_t java_name_index (0x169)
	}, ; 327
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 475; uint32_t java_name_index (0x1db)
	}, ; 328
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554472, ; uint32_t type_token_id (0x2000028)
		i32 477; uint32_t java_name_index (0x1dd)
	}, ; 329
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554479, ; uint32_t type_token_id (0x200002f)
		i32 482; uint32_t java_name_index (0x1e2)
	}, ; 330
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554878, ; uint32_t type_token_id (0x20001be)
		i32 248; uint32_t java_name_index (0xf8)
	}, ; 331
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554601, ; uint32_t type_token_id (0x20000a9)
		i32 80; uint32_t java_name_index (0x50)
	}, ; 332
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555107, ; uint32_t type_token_id (0x20002a3)
		i32 356; uint32_t java_name_index (0x164)
	}, ; 333
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554727, ; uint32_t type_token_id (0x2000127)
		i32 150; uint32_t java_name_index (0x96)
	}, ; 334
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554646, ; uint32_t type_token_id (0x20000d6)
		i32 100; uint32_t java_name_index (0x64)
	}, ; 335
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554603, ; uint32_t type_token_id (0x20000ab)
		i32 82; uint32_t java_name_index (0x52)
	}, ; 336
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555058, ; uint32_t type_token_id (0x2000272)
		i32 324; uint32_t java_name_index (0x144)
	}, ; 337
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555013, ; uint32_t type_token_id (0x2000245)
		i32 295; uint32_t java_name_index (0x127)
	}, ; 338
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555184, ; uint32_t type_token_id (0x20002f0)
		i32 412; uint32_t java_name_index (0x19c)
	}, ; 339
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555043, ; uint32_t type_token_id (0x2000263)
		i32 312; uint32_t java_name_index (0x138)
	}, ; 340
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554729, ; uint32_t type_token_id (0x2000129)
		i32 152; uint32_t java_name_index (0x98)
	}, ; 341
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554759, ; uint32_t type_token_id (0x2000147)
		i32 176; uint32_t java_name_index (0xb0)
	}, ; 342
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555183, ; uint32_t type_token_id (0x20002ef)
		i32 411; uint32_t java_name_index (0x19b)
	}, ; 343
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554473, ; uint32_t type_token_id (0x2000029)
		i32 478; uint32_t java_name_index (0x1de)
	}, ; 344
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555193, ; uint32_t type_token_id (0x20002f9)
		i32 420; uint32_t java_name_index (0x1a4)
	}, ; 345
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554812, ; uint32_t type_token_id (0x200017c)
		i32 209; uint32_t java_name_index (0xd1)
	}, ; 346
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index (0xc)
		i32 33554538, ; uint32_t type_token_id (0x200006a)
		i32 519; uint32_t java_name_index (0x207)
	}, ; 347
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554615, ; uint32_t type_token_id (0x20000b7)
		i32 88; uint32_t java_name_index (0x58)
	}, ; 348
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554830, ; uint32_t type_token_id (0x200018e)
		i32 220; uint32_t java_name_index (0xdc)
	}, ; 349
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554761, ; uint32_t type_token_id (0x2000149)
		i32 178; uint32_t java_name_index (0xb2)
	}, ; 350
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554626, ; uint32_t type_token_id (0x20000c2)
		i32 93; uint32_t java_name_index (0x5d)
	}, ; 351
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554735, ; uint32_t type_token_id (0x200012f)
		i32 158; uint32_t java_name_index (0x9e)
	}, ; 352
	%struct.TypeMapJava {
		i32 13, ; uint32_t module_index (0xd)
		i32 33554451, ; uint32_t type_token_id (0x2000013)
		i32 524; uint32_t java_name_index (0x20c)
	}, ; 353
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555185, ; uint32_t type_token_id (0x20002f1)
		i32 413; uint32_t java_name_index (0x19d)
	}, ; 354
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555136, ; uint32_t type_token_id (0x20002c0)
		i32 376; uint32_t java_name_index (0x178)
	}, ; 355
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554448, ; uint32_t type_token_id (0x2000010)
		i32 435; uint32_t java_name_index (0x1b3)
	}, ; 356
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 311; uint32_t java_name_index (0x137)
	}, ; 357
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554991, ; uint32_t type_token_id (0x200022f)
		i32 282; uint32_t java_name_index (0x11a)
	}, ; 358
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555085, ; uint32_t type_token_id (0x200028d)
		i32 342; uint32_t java_name_index (0x156)
	}, ; 359
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 90; uint32_t java_name_index (0x5a)
	}, ; 360
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554834, ; uint32_t type_token_id (0x2000192)
		i32 223; uint32_t java_name_index (0xdf)
	}, ; 361
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554474, ; uint32_t type_token_id (0x200002a)
		i32 479; uint32_t java_name_index (0x1df)
	}, ; 362
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554511, ; uint32_t type_token_id (0x200004f)
		i32 48; uint32_t java_name_index (0x30)
	}, ; 363
	%struct.TypeMapJava {
		i32 8, ; uint32_t module_index (0x8)
		i32 33554437, ; uint32_t type_token_id (0x2000005)
		i32 495; uint32_t java_name_index (0x1ef)
	}, ; 364
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 347; uint32_t java_name_index (0x15b)
	}, ; 365
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555007, ; uint32_t type_token_id (0x200023f)
		i32 291; uint32_t java_name_index (0x123)
	}, ; 366
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554985, ; uint32_t type_token_id (0x2000229)
		i32 276; uint32_t java_name_index (0x114)
	}, ; 367
	%struct.TypeMapJava {
		i32 10, ; uint32_t module_index (0xa)
		i32 33554478, ; uint32_t type_token_id (0x200002e)
		i32 502; uint32_t java_name_index (0x1f6)
	}, ; 368
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 242; uint32_t java_name_index (0xf2)
	}, ; 369
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555222, ; uint32_t type_token_id (0x2000316)
		i32 432; uint32_t java_name_index (0x1b0)
	}, ; 370
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554606, ; uint32_t type_token_id (0x20000ae)
		i32 84; uint32_t java_name_index (0x54)
	}, ; 371
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554833, ; uint32_t type_token_id (0x2000191)
		i32 222; uint32_t java_name_index (0xde)
	}, ; 372
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554989, ; uint32_t type_token_id (0x200022d)
		i32 280; uint32_t java_name_index (0x118)
	}, ; 373
	%struct.TypeMapJava {
		i32 5, ; uint32_t module_index (0x5)
		i32 33554437, ; uint32_t type_token_id (0x2000005)
		i32 445; uint32_t java_name_index (0x1bd)
	}, ; 374
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554480, ; uint32_t type_token_id (0x2000030)
		i32 29; uint32_t java_name_index (0x1d)
	}, ; 375
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555120, ; uint32_t type_token_id (0x20002b0)
		i32 365; uint32_t java_name_index (0x16d)
	}, ; 376
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554522, ; uint32_t type_token_id (0x200005a)
		i32 55; uint32_t java_name_index (0x37)
	}, ; 377
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555024, ; uint32_t type_token_id (0x2000250)
		i32 302; uint32_t java_name_index (0x12e)
	}, ; 378
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554579, ; uint32_t type_token_id (0x2000093)
		i32 66; uint32_t java_name_index (0x42)
	}, ; 379
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554448, ; uint32_t type_token_id (0x2000010)
		i32 6; uint32_t java_name_index (0x6)
	}, ; 380
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554670, ; uint32_t type_token_id (0x20000ee)
		i32 117; uint32_t java_name_index (0x75)
	}, ; 381
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554514, ; uint32_t type_token_id (0x2000052)
		i32 49; uint32_t java_name_index (0x31)
	}, ; 382
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554737, ; uint32_t type_token_id (0x2000131)
		i32 160; uint32_t java_name_index (0xa0)
	}, ; 383
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555163, ; uint32_t type_token_id (0x20002db)
		i32 396; uint32_t java_name_index (0x18c)
	}, ; 384
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555196, ; uint32_t type_token_id (0x20002fc)
		i32 422; uint32_t java_name_index (0x1a6)
	}, ; 385
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554499, ; uint32_t type_token_id (0x2000043)
		i32 40; uint32_t java_name_index (0x28)
	}, ; 386
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 118; uint32_t java_name_index (0x76)
	}, ; 387
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555148, ; uint32_t type_token_id (0x20002cc)
		i32 386; uint32_t java_name_index (0x182)
	}, ; 388
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 249; uint32_t java_name_index (0xf9)
	}, ; 389
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555137, ; uint32_t type_token_id (0x20002c1)
		i32 377; uint32_t java_name_index (0x179)
	}, ; 390
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555117, ; uint32_t type_token_id (0x20002ad)
		i32 362; uint32_t java_name_index (0x16a)
	}, ; 391
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554763, ; uint32_t type_token_id (0x200014b)
		i32 180; uint32_t java_name_index (0xb4)
	}, ; 392
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554520, ; uint32_t type_token_id (0x2000058)
		i32 53; uint32_t java_name_index (0x35)
	}, ; 393
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554470, ; uint32_t type_token_id (0x2000026)
		i32 21; uint32_t java_name_index (0x15)
	}, ; 394
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555122, ; uint32_t type_token_id (0x20002b2)
		i32 366; uint32_t java_name_index (0x16e)
	}, ; 395
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554669, ; uint32_t type_token_id (0x20000ed)
		i32 116; uint32_t java_name_index (0x74)
	}, ; 396
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 98; uint32_t java_name_index (0x62)
	}, ; 397
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554595, ; uint32_t type_token_id (0x20000a3)
		i32 75; uint32_t java_name_index (0x4b)
	}, ; 398
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555195, ; uint32_t type_token_id (0x20002fb)
		i32 421; uint32_t java_name_index (0x1a5)
	}, ; 399
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555170, ; uint32_t type_token_id (0x20002e2)
		i32 402; uint32_t java_name_index (0x192)
	}, ; 400
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554962, ; uint32_t type_token_id (0x2000212)
		i32 266; uint32_t java_name_index (0x10a)
	}, ; 401
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554668, ; uint32_t type_token_id (0x20000ec)
		i32 115; uint32_t java_name_index (0x73)
	}, ; 402
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 306; uint32_t java_name_index (0x132)
	}, ; 403
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 135; uint32_t java_name_index (0x87)
	}, ; 404
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554760, ; uint32_t type_token_id (0x2000148)
		i32 177; uint32_t java_name_index (0xb1)
	}, ; 405
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554501, ; uint32_t type_token_id (0x2000045)
		i32 42; uint32_t java_name_index (0x2a)
	}, ; 406
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554484, ; uint32_t type_token_id (0x2000034)
		i32 485; uint32_t java_name_index (0x1e5)
	}, ; 407
	%struct.TypeMapJava {
		i32 13, ; uint32_t module_index (0xd)
		i32 33554452, ; uint32_t type_token_id (0x2000014)
		i32 525; uint32_t java_name_index (0x20d)
	}, ; 408
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555167, ; uint32_t type_token_id (0x20002df)
		i32 399; uint32_t java_name_index (0x18f)
	}, ; 409
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554494, ; uint32_t type_token_id (0x200003e)
		i32 37; uint32_t java_name_index (0x25)
	}, ; 410
	%struct.TypeMapJava {
		i32 13, ; uint32_t module_index (0xd)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 526; uint32_t java_name_index (0x20e)
	}, ; 411
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554881, ; uint32_t type_token_id (0x20001c1)
		i32 250; uint32_t java_name_index (0xfa)
	}, ; 412
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 409; uint32_t java_name_index (0x199)
	}, ; 413
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554491, ; uint32_t type_token_id (0x200003b)
		i32 36; uint32_t java_name_index (0x24)
	}, ; 414
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554786, ; uint32_t type_token_id (0x2000162)
		i32 194; uint32_t java_name_index (0xc2)
	}, ; 415
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555038, ; uint32_t type_token_id (0x200025e)
		i32 308; uint32_t java_name_index (0x134)
	}, ; 416
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554488, ; uint32_t type_token_id (0x2000038)
		i32 487; uint32_t java_name_index (0x1e7)
	}, ; 417
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554772, ; uint32_t type_token_id (0x2000154)
		i32 184; uint32_t java_name_index (0xb8)
	}, ; 418
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555204, ; uint32_t type_token_id (0x2000304)
		i32 429; uint32_t java_name_index (0x1ad)
	}, ; 419
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554673, ; uint32_t type_token_id (0x20000f1)
		i32 119; uint32_t java_name_index (0x77)
	}, ; 420
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554662, ; uint32_t type_token_id (0x20000e6)
		i32 113; uint32_t java_name_index (0x71)
	}, ; 421
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554498, ; uint32_t type_token_id (0x2000042)
		i32 493; uint32_t java_name_index (0x1ed)
	}, ; 422
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554986, ; uint32_t type_token_id (0x200022a)
		i32 277; uint32_t java_name_index (0x115)
	}, ; 423
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 134; uint32_t java_name_index (0x86)
	}, ; 424
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555199, ; uint32_t type_token_id (0x20002ff)
		i32 425; uint32_t java_name_index (0x1a9)
	}, ; 425
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 474; uint32_t java_name_index (0x1da)
	}, ; 426
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554693, ; uint32_t type_token_id (0x2000105)
		i32 465; uint32_t java_name_index (0x1d1)
	}, ; 427
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 70; uint32_t java_name_index (0x46)
	}, ; 428
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 60; uint32_t java_name_index (0x3c)
	}, ; 429
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index (0xb)
		i32 33554458, ; uint32_t type_token_id (0x200001a)
		i32 510; uint32_t java_name_index (0x1fe)
	}, ; 430
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554462, ; uint32_t type_token_id (0x200001e)
		i32 13; uint32_t java_name_index (0xd)
	}, ; 431
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 124; uint32_t java_name_index (0x7c)
	}, ; 432
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554658, ; uint32_t type_token_id (0x20000e2)
		i32 109; uint32_t java_name_index (0x6d)
	}, ; 433
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 92; uint32_t java_name_index (0x5c)
	}, ; 434
	%struct.TypeMapJava {
		i32 13, ; uint32_t module_index (0xd)
		i32 33554447, ; uint32_t type_token_id (0x200000f)
		i32 520; uint32_t java_name_index (0x208)
	}, ; 435
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555078, ; uint32_t type_token_id (0x2000286)
		i32 338; uint32_t java_name_index (0x152)
	}, ; 436
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555088, ; uint32_t type_token_id (0x2000290)
		i32 344; uint32_t java_name_index (0x158)
	}, ; 437
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555089, ; uint32_t type_token_id (0x2000291)
		i32 345; uint32_t java_name_index (0x159)
	}, ; 438
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555111, ; uint32_t type_token_id (0x20002a7)
		i32 358; uint32_t java_name_index (0x166)
	}, ; 439
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index (0xb)
		i32 33554442, ; uint32_t type_token_id (0x200000a)
		i32 503; uint32_t java_name_index (0x1f7)
	}, ; 440
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554842, ; uint32_t type_token_id (0x200019a)
		i32 229; uint32_t java_name_index (0xe5)
	}, ; 441
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554702, ; uint32_t type_token_id (0x200010e)
		i32 131; uint32_t java_name_index (0x83)
	}, ; 442
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555164, ; uint32_t type_token_id (0x20002dc)
		i32 397; uint32_t java_name_index (0x18d)
	}, ; 443
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 408; uint32_t java_name_index (0x198)
	}, ; 444
	%struct.TypeMapJava {
		i32 13, ; uint32_t module_index (0xd)
		i32 33554450, ; uint32_t type_token_id (0x2000012)
		i32 523; uint32_t java_name_index (0x20b)
	}, ; 445
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554898, ; uint32_t type_token_id (0x20001d2)
		i32 257; uint32_t java_name_index (0x101)
	}, ; 446
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 73; uint32_t java_name_index (0x49)
	}, ; 447
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 354; uint32_t java_name_index (0x162)
	}, ; 448
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554610, ; uint32_t type_token_id (0x20000b2)
		i32 86; uint32_t java_name_index (0x56)
	}, ; 449
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554758, ; uint32_t type_token_id (0x2000146)
		i32 175; uint32_t java_name_index (0xaf)
	}, ; 450
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554485, ; uint32_t type_token_id (0x2000035)
		i32 32; uint32_t java_name_index (0x20)
	}, ; 451
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554655, ; uint32_t type_token_id (0x20000df)
		i32 106; uint32_t java_name_index (0x6a)
	}, ; 452
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 74; uint32_t java_name_index (0x4a)
	}, ; 453
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555135, ; uint32_t type_token_id (0x20002bf)
		i32 375; uint32_t java_name_index (0x177)
	}, ; 454
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555098, ; uint32_t type_token_id (0x200029a)
		i32 351; uint32_t java_name_index (0x15f)
	}, ; 455
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554489, ; uint32_t type_token_id (0x2000039)
		i32 34; uint32_t java_name_index (0x22)
	}, ; 456
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554746, ; uint32_t type_token_id (0x200013a)
		i32 168; uint32_t java_name_index (0xa8)
	}, ; 457
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554977, ; uint32_t type_token_id (0x2000221)
		i32 269; uint32_t java_name_index (0x10d)
	}, ; 458
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index (0xb)
		i32 33554460, ; uint32_t type_token_id (0x200001c)
		i32 511; uint32_t java_name_index (0x1ff)
	}, ; 459
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554976, ; uint32_t type_token_id (0x2000220)
		i32 268; uint32_t java_name_index (0x10c)
	}, ; 460
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554813, ; uint32_t type_token_id (0x200017d)
		i32 210; uint32_t java_name_index (0xd2)
	}, ; 461
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555071, ; uint32_t type_token_id (0x200027f)
		i32 331; uint32_t java_name_index (0x14b)
	}, ; 462
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 303; uint32_t java_name_index (0x12f)
	}, ; 463
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554767, ; uint32_t type_token_id (0x200014f)
		i32 183; uint32_t java_name_index (0xb7)
	}, ; 464
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554718, ; uint32_t type_token_id (0x200011e)
		i32 141; uint32_t java_name_index (0x8d)
	}, ; 465
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554437, ; uint32_t type_token_id (0x2000005)
		i32 1; uint32_t java_name_index (0x1)
	}, ; 466
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554676, ; uint32_t type_token_id (0x20000f4)
		i32 122; uint32_t java_name_index (0x7a)
	}, ; 467
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555149, ; uint32_t type_token_id (0x20002cd)
		i32 387; uint32_t java_name_index (0x183)
	}, ; 468
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554851, ; uint32_t type_token_id (0x20001a3)
		i32 232; uint32_t java_name_index (0xe8)
	}, ; 469
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554500, ; uint32_t type_token_id (0x2000044)
		i32 41; uint32_t java_name_index (0x29)
	}, ; 470
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554788, ; uint32_t type_token_id (0x2000164)
		i32 196; uint32_t java_name_index (0xc4)
	}, ; 471
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 297; uint32_t java_name_index (0x129)
	}, ; 472
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554725, ; uint32_t type_token_id (0x2000125)
		i32 148; uint32_t java_name_index (0x94)
	}, ; 473
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554835, ; uint32_t type_token_id (0x2000193)
		i32 224; uint32_t java_name_index (0xe0)
	}, ; 474
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554457, ; uint32_t type_token_id (0x2000019)
		i32 10; uint32_t java_name_index (0xa)
	}, ; 475
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554947, ; uint32_t type_token_id (0x2000203)
		i32 263; uint32_t java_name_index (0x107)
	}, ; 476
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554489, ; uint32_t type_token_id (0x2000039)
		i32 488; uint32_t java_name_index (0x1e8)
	}, ; 477
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555072, ; uint32_t type_token_id (0x2000280)
		i32 332; uint32_t java_name_index (0x14c)
	}, ; 478
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554510, ; uint32_t type_token_id (0x200004e)
		i32 47; uint32_t java_name_index (0x2f)
	}, ; 479
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555050, ; uint32_t type_token_id (0x200026a)
		i32 317; uint32_t java_name_index (0x13d)
	}, ; 480
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554930, ; uint32_t type_token_id (0x20001f2)
		i32 258; uint32_t java_name_index (0x102)
	}, ; 481
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554988, ; uint32_t type_token_id (0x200022c)
		i32 279; uint32_t java_name_index (0x117)
	}, ; 482
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 33554462, ; uint32_t type_token_id (0x200001e)
		i32 473; uint32_t java_name_index (0x1d9)
	}, ; 483
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554892, ; uint32_t type_token_id (0x20001cc)
		i32 253; uint32_t java_name_index (0xfd)
	}, ; 484
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 304; uint32_t java_name_index (0x130)
	}, ; 485
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index (0xb)
		i32 33554461, ; uint32_t type_token_id (0x200001d)
		i32 512; uint32_t java_name_index (0x200)
	}, ; 486
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554672, ; uint32_t type_token_id (0x20000f0)
		i32 456; uint32_t java_name_index (0x1c8)
	}, ; 487
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index (0x4)
		i32 33554765, ; uint32_t type_token_id (0x200014d)
		i32 444; uint32_t java_name_index (0x1bc)
	}, ; 488
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555059, ; uint32_t type_token_id (0x2000273)
		i32 325; uint32_t java_name_index (0x145)
	}, ; 489
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554765, ; uint32_t type_token_id (0x200014d)
		i32 182; uint32_t java_name_index (0xb6)
	}, ; 490
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554776, ; uint32_t type_token_id (0x2000158)
		i32 188; uint32_t java_name_index (0xbc)
	}, ; 491
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554675, ; uint32_t type_token_id (0x20000f3)
		i32 121; uint32_t java_name_index (0x79)
	}, ; 492
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index (0xc)
		i32 33554436, ; uint32_t type_token_id (0x2000004)
		i32 515; uint32_t java_name_index (0x203)
	}, ; 493
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555158, ; uint32_t type_token_id (0x20002d6)
		i32 393; uint32_t java_name_index (0x189)
	}, ; 494
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554525, ; uint32_t type_token_id (0x200005d)
		i32 57; uint32_t java_name_index (0x39)
	}, ; 495
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554984, ; uint32_t type_token_id (0x2000228)
		i32 275; uint32_t java_name_index (0x113)
	}, ; 496
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554686, ; uint32_t type_token_id (0x20000fe)
		i32 463; uint32_t java_name_index (0x1cf)
	}, ; 497
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554663, ; uint32_t type_token_id (0x20000e7)
		i32 114; uint32_t java_name_index (0x72)
	}, ; 498
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index (0x6)
		i32 33554665, ; uint32_t type_token_id (0x20000e9)
		i32 451; uint32_t java_name_index (0x1c3)
	}, ; 499
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554474, ; uint32_t type_token_id (0x200002a)
		i32 25; uint32_t java_name_index (0x19)
	}, ; 500
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555049, ; uint32_t type_token_id (0x2000269)
		i32 316; uint32_t java_name_index (0x13c)
	}, ; 501
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554872, ; uint32_t type_token_id (0x20001b8)
		i32 244; uint32_t java_name_index (0xf4)
	}, ; 502
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555048, ; uint32_t type_token_id (0x2000268)
		i32 315; uint32_t java_name_index (0x13b)
	}, ; 503
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 343; uint32_t java_name_index (0x157)
	}, ; 504
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554983, ; uint32_t type_token_id (0x2000227)
		i32 274; uint32_t java_name_index (0x112)
	}, ; 505
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554621, ; uint32_t type_token_id (0x20000bd)
		i32 91; uint32_t java_name_index (0x5b)
	}, ; 506
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554505, ; uint32_t type_token_id (0x2000049)
		i32 44; uint32_t java_name_index (0x2c)
	}, ; 507
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554816, ; uint32_t type_token_id (0x2000180)
		i32 212; uint32_t java_name_index (0xd4)
	}, ; 508
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 329; uint32_t java_name_index (0x149)
	}, ; 509
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555171, ; uint32_t type_token_id (0x20002e3)
		i32 403; uint32_t java_name_index (0x193)
	}, ; 510
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555102, ; uint32_t type_token_id (0x200029e)
		i32 353; uint32_t java_name_index (0x161)
	}, ; 511
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554852, ; uint32_t type_token_id (0x20001a4)
		i32 233; uint32_t java_name_index (0xe9)
	}, ; 512
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555132, ; uint32_t type_token_id (0x20002bc)
		i32 373; uint32_t java_name_index (0x175)
	}, ; 513
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 388; uint32_t java_name_index (0x184)
	}, ; 514
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index (0x7)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 480; uint32_t java_name_index (0x1e0)
	}, ; 515
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 83; uint32_t java_name_index (0x53)
	}, ; 516
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555002, ; uint32_t type_token_id (0x200023a)
		i32 287; uint32_t java_name_index (0x11f)
	}, ; 517
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554473, ; uint32_t type_token_id (0x2000029)
		i32 24; uint32_t java_name_index (0x18)
	}, ; 518
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index (0x9)
		i32 33554438, ; uint32_t type_token_id (0x2000006)
		i32 500; uint32_t java_name_index (0x1f4)
	}, ; 519
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554800, ; uint32_t type_token_id (0x2000170)
		i32 202; uint32_t java_name_index (0xca)
	}, ; 520
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 305; uint32_t java_name_index (0x131)
	}, ; 521
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554597, ; uint32_t type_token_id (0x20000a5)
		i32 77; uint32_t java_name_index (0x4d)
	}, ; 522
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555109, ; uint32_t type_token_id (0x20002a5)
		i32 357; uint32_t java_name_index (0x165)
	}, ; 523
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554634, ; uint32_t type_token_id (0x20000ca)
		i32 95; uint32_t java_name_index (0x5f)
	}, ; 524
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554452, ; uint32_t type_token_id (0x2000014)
		i32 8; uint32_t java_name_index (0x8)
	}, ; 525
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554810, ; uint32_t type_token_id (0x200017a)
		i32 207; uint32_t java_name_index (0xcf)
	}, ; 526
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555176, ; uint32_t type_token_id (0x20002e8)
		i32 407; uint32_t java_name_index (0x197)
	}, ; 527
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554934, ; uint32_t type_token_id (0x20001f6)
		i32 260; uint32_t java_name_index (0x104)
	} ; 528
], align 4

; Java type names
@java_type_names = dso_local local_unnamed_addr constant [529 x ptr] [
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
	ptr @.str.528 ; 528
], align 8

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
@.str.60 = private unnamed_addr constant [29 x i8] c"org/xmlpull/v1/XmlPullParser\00", align 1
@.str.61 = private unnamed_addr constant [38 x i8] c"org/xmlpull/v1/XmlPullParserException\00", align 1
@.str.62 = private unnamed_addr constant [19 x i8] c"org/json/JSONArray\00", align 1
@.str.63 = private unnamed_addr constant [20 x i8] c"org/json/JSONObject\00", align 1
@.str.64 = private unnamed_addr constant [32 x i8] c"javax/security/cert/Certificate\00", align 1
@.str.65 = private unnamed_addr constant [36 x i8] c"javax/security/cert/X509Certificate\00", align 1
@.str.66 = private unnamed_addr constant [28 x i8] c"javax/security/auth/Subject\00", align 1
@.str.67 = private unnamed_addr constant [39 x i8] c"javax/security/auth/x500/X500Principal\00", align 1
@.str.68 = private unnamed_addr constant [24 x i8] c"javax/net/SocketFactory\00", align 1
@.str.69 = private unnamed_addr constant [33 x i8] c"javax/net/ssl/HttpsURLConnection\00", align 1
@.str.70 = private unnamed_addr constant [31 x i8] c"javax/net/ssl/HostnameVerifier\00", align 1
@.str.71 = private unnamed_addr constant [25 x i8] c"javax/net/ssl/KeyManager\00", align 1
@.str.72 = private unnamed_addr constant [25 x i8] c"javax/net/ssl/SSLSession\00", align 1
@.str.73 = private unnamed_addr constant [32 x i8] c"javax/net/ssl/SSLSessionContext\00", align 1
@.str.74 = private unnamed_addr constant [27 x i8] c"javax/net/ssl/TrustManager\00", align 1
@.str.75 = private unnamed_addr constant [32 x i8] c"javax/net/ssl/KeyManagerFactory\00", align 1
@.str.76 = private unnamed_addr constant [25 x i8] c"javax/net/ssl/SSLContext\00", align 1
@.str.77 = private unnamed_addr constant [31 x i8] c"javax/net/ssl/SSLSocketFactory\00", align 1
@.str.78 = private unnamed_addr constant [34 x i8] c"javax/net/ssl/TrustManagerFactory\00", align 1
@.str.79 = private unnamed_addr constant [33 x i8] c"javax/crypto/AEADBadTagException\00", align 1
@.str.80 = private unnamed_addr constant [33 x i8] c"javax/crypto/BadPaddingException\00", align 1
@.str.81 = private unnamed_addr constant [20 x i8] c"javax/crypto/Cipher\00", align 1
@.str.82 = private unnamed_addr constant [39 x i8] c"javax/crypto/IllegalBlockSizeException\00", align 1
@.str.83 = private unnamed_addr constant [23 x i8] c"javax/crypto/SecretKey\00", align 1
@.str.84 = private unnamed_addr constant [26 x i8] c"javax/crypto/KeyGenerator\00", align 1
@.str.85 = private unnamed_addr constant [35 x i8] c"javax/crypto/spec/GCMParameterSpec\00", align 1
@.str.86 = private unnamed_addr constant [34 x i8] c"javax/crypto/spec/IvParameterSpec\00", align 1
@.str.87 = private unnamed_addr constant [27 x i8] c"android/widget/AbsListView\00", align 1
@.str.88 = private unnamed_addr constant [26 x i8] c"android/widget/AbsSpinner\00", align 1
@.str.89 = private unnamed_addr constant [27 x i8] c"android/widget/AdapterView\00", align 1
@.str.90 = private unnamed_addr constant [47 x i8] c"android/widget/AdapterView$OnItemClickListener\00", align 1
@.str.91 = private unnamed_addr constant [63 x i8] c"mono/android/widget/AdapterView_OnItemClickListenerImplementor\00", align 1
@.str.92 = private unnamed_addr constant [50 x i8] c"android/widget/AdapterView$OnItemSelectedListener\00", align 1
@.str.93 = private unnamed_addr constant [66 x i8] c"mono/android/widget/AdapterView_OnItemSelectedListenerImplementor\00", align 1
@.str.94 = private unnamed_addr constant [28 x i8] c"android/widget/ArrayAdapter\00", align 1
@.str.95 = private unnamed_addr constant [27 x i8] c"android/widget/BaseAdapter\00", align 1
@.str.96 = private unnamed_addr constant [22 x i8] c"android/widget/Button\00", align 1
@.str.97 = private unnamed_addr constant [30 x i8] c"android/widget/CompoundButton\00", align 1
@.str.98 = private unnamed_addr constant [54 x i8] c"android/widget/CompoundButton$OnCheckedChangeListener\00", align 1
@.str.99 = private unnamed_addr constant [70 x i8] c"mono/android/widget/CompoundButton_OnCheckedChangeListenerImplementor\00", align 1
@.str.100 = private unnamed_addr constant [24 x i8] c"android/widget/EditText\00", align 1
@.str.101 = private unnamed_addr constant [23 x i8] c"android/widget/Adapter\00", align 1
@.str.102 = private unnamed_addr constant [27 x i8] c"android/widget/ListAdapter\00", align 1
@.str.103 = private unnamed_addr constant [30 x i8] c"android/widget/SpinnerAdapter\00", align 1
@.str.104 = private unnamed_addr constant [28 x i8] c"android/widget/LinearLayout\00", align 1
@.str.105 = private unnamed_addr constant [41 x i8] c"android/widget/LinearLayout$LayoutParams\00", align 1
@.str.106 = private unnamed_addr constant [24 x i8] c"android/widget/ListView\00", align 1
@.str.107 = private unnamed_addr constant [27 x i8] c"android/widget/ProgressBar\00", align 1
@.str.108 = private unnamed_addr constant [27 x i8] c"android/widget/RemoteViews\00", align 1
@.str.109 = private unnamed_addr constant [23 x i8] c"android/widget/Spinner\00", align 1
@.str.110 = private unnamed_addr constant [22 x i8] c"android/widget/Switch\00", align 1
@.str.111 = private unnamed_addr constant [24 x i8] c"android/widget/TextView\00", align 1
@.str.112 = private unnamed_addr constant [21 x i8] c"android/widget/Toast\00", align 1
@.str.113 = private unnamed_addr constant [28 x i8] c"android/widget/ToggleButton\00", align 1
@.str.114 = private unnamed_addr constant [23 x i8] c"android/widget/Toolbar\00", align 1
@.str.115 = private unnamed_addr constant [27 x i8] c"android/webkit/MimeTypeMap\00", align 1
@.str.116 = private unnamed_addr constant [30 x i8] c"android/util/AndroidException\00", align 1
@.str.117 = private unnamed_addr constant [28 x i8] c"android/util/DisplayMetrics\00", align 1
@.str.118 = private unnamed_addr constant [26 x i8] c"android/util/AttributeSet\00", align 1
@.str.119 = private unnamed_addr constant [17 x i8] c"android/util/Log\00", align 1
@.str.120 = private unnamed_addr constant [18 x i8] c"android/util/Size\00", align 1
@.str.121 = private unnamed_addr constant [19 x i8] c"android/util/SizeF\00", align 1
@.str.122 = private unnamed_addr constant [30 x i8] c"android/text/ClipboardManager\00", align 1
@.str.123 = private unnamed_addr constant [18 x i8] c"android/text/Html\00", align 1
@.str.124 = private unnamed_addr constant [22 x i8] c"android/text/Editable\00", align 1
@.str.125 = private unnamed_addr constant [22 x i8] c"android/text/GetChars\00", align 1
@.str.126 = private unnamed_addr constant [25 x i8] c"android/text/InputFilter\00", align 1
@.str.127 = private unnamed_addr constant [24 x i8] c"android/text/NoCopySpan\00", align 1
@.str.128 = private unnamed_addr constant [23 x i8] c"android/text/Spannable\00", align 1
@.str.129 = private unnamed_addr constant [21 x i8] c"android/text/Spanned\00", align 1
@.str.130 = private unnamed_addr constant [25 x i8] c"android/text/TextWatcher\00", align 1
@.str.131 = private unnamed_addr constant [41 x i8] c"mono/android/text/TextWatcherImplementor\00", align 1
@.str.132 = private unnamed_addr constant [35 x i8] c"android/telephony/PhoneNumberUtils\00", align 1
@.str.133 = private unnamed_addr constant [32 x i8] c"android/speech/tts/TextToSpeech\00", align 1
@.str.134 = private unnamed_addr constant [47 x i8] c"android/speech/tts/TextToSpeech$OnInitListener\00", align 1
@.str.135 = private unnamed_addr constant [61 x i8] c"android/speech/tts/TextToSpeech$OnUtteranceCompletedListener\00", align 1
@.str.136 = private unnamed_addr constant [38 x i8] c"android/security/KeyPairGeneratorSpec\00", align 1
@.str.137 = private unnamed_addr constant [46 x i8] c"android/security/KeyPairGeneratorSpec$Builder\00", align 1
@.str.138 = private unnamed_addr constant [46 x i8] c"android/security/keystore/KeyGenParameterSpec\00", align 1
@.str.139 = private unnamed_addr constant [54 x i8] c"android/security/keystore/KeyGenParameterSpec$Builder\00", align 1
@.str.140 = private unnamed_addr constant [34 x i8] c"android/provider/ContactsContract\00", align 1
@.str.141 = private unnamed_addr constant [50 x i8] c"android/provider/ContactsContract$CommonDataKinds\00", align 1
@.str.142 = private unnamed_addr constant [56 x i8] c"android/provider/ContactsContract$CommonDataKinds$Email\00", align 1
@.str.143 = private unnamed_addr constant [56 x i8] c"android/provider/ContactsContract$CommonDataKinds$Phone\00", align 1
@.str.144 = private unnamed_addr constant [43 x i8] c"android/provider/ContactsContract$Contacts\00", align 1
@.str.145 = private unnamed_addr constant [39 x i8] c"android/provider/ContactsContract$Data\00", align 1
@.str.146 = private unnamed_addr constant [35 x i8] c"android/provider/DocumentsContract\00", align 1
@.str.147 = private unnamed_addr constant [28 x i8] c"android/provider/MediaStore\00", align 1
@.str.148 = private unnamed_addr constant [34 x i8] c"android/provider/MediaStore$Audio\00", align 1
@.str.149 = private unnamed_addr constant [40 x i8] c"android/provider/MediaStore$Audio$Media\00", align 1
@.str.150 = private unnamed_addr constant [35 x i8] c"android/provider/MediaStore$Images\00", align 1
@.str.151 = private unnamed_addr constant [41 x i8] c"android/provider/MediaStore$Images$Media\00", align 1
@.str.152 = private unnamed_addr constant [34 x i8] c"android/provider/MediaStore$Video\00", align 1
@.str.153 = private unnamed_addr constant [40 x i8] c"android/provider/MediaStore$Video$Media\00", align 1
@.str.154 = private unnamed_addr constant [26 x i8] c"android/provider/Settings\00", align 1
@.str.155 = private unnamed_addr constant [33 x i8] c"android/provider/Settings$Global\00", align 1
@.str.156 = private unnamed_addr constant [41 x i8] c"android/provider/Settings$NameValueTable\00", align 1
@.str.157 = private unnamed_addr constant [33 x i8] c"android/provider/Settings$Secure\00", align 1
@.str.158 = private unnamed_addr constant [33 x i8] c"android/provider/Settings$System\00", align 1
@.str.159 = private unnamed_addr constant [27 x i8] c"android/provider/Telephony\00", align 1
@.str.160 = private unnamed_addr constant [31 x i8] c"android/provider/Telephony$Sms\00", align 1
@.str.161 = private unnamed_addr constant [37 x i8] c"android/preference/PreferenceManager\00", align 1
@.str.162 = private unnamed_addr constant [22 x i8] c"android/os/BaseBundle\00", align 1
@.str.163 = private unnamed_addr constant [18 x i8] c"android/os/Binder\00", align 1
@.str.164 = private unnamed_addr constant [17 x i8] c"android/os/Build\00", align 1
@.str.165 = private unnamed_addr constant [25 x i8] c"android/os/Build$VERSION\00", align 1
@.str.166 = private unnamed_addr constant [18 x i8] c"android/os/Bundle\00", align 1
@.str.167 = private unnamed_addr constant [31 x i8] c"android/os/DeadObjectException\00", align 1
@.str.168 = private unnamed_addr constant [23 x i8] c"android/os/Environment\00", align 1
@.str.169 = private unnamed_addr constant [19 x i8] c"android/os/Handler\00", align 1
@.str.170 = private unnamed_addr constant [34 x i8] c"android/os/IBinder$DeathRecipient\00", align 1
@.str.171 = private unnamed_addr constant [19 x i8] c"android/os/IBinder\00", align 1
@.str.172 = private unnamed_addr constant [22 x i8] c"android/os/IInterface\00", align 1
@.str.173 = private unnamed_addr constant [30 x i8] c"android/os/Parcelable$Creator\00", align 1
@.str.174 = private unnamed_addr constant [22 x i8] c"android/os/Parcelable\00", align 1
@.str.175 = private unnamed_addr constant [22 x i8] c"android/os/LocaleList\00", align 1
@.str.176 = private unnamed_addr constant [18 x i8] c"android/os/Looper\00", align 1
@.str.177 = private unnamed_addr constant [18 x i8] c"android/os/Parcel\00", align 1
@.str.178 = private unnamed_addr constant [32 x i8] c"android/os/ParcelFileDescriptor\00", align 1
@.str.179 = private unnamed_addr constant [24 x i8] c"android/os/PowerManager\00", align 1
@.str.180 = private unnamed_addr constant [19 x i8] c"android/os/Process\00", align 1
@.str.181 = private unnamed_addr constant [27 x i8] c"android/os/RemoteException\00", align 1
@.str.182 = private unnamed_addr constant [27 x i8] c"android/os/VibrationEffect\00", align 1
@.str.183 = private unnamed_addr constant [20 x i8] c"android/os/Vibrator\00", align 1
@.str.184 = private unnamed_addr constant [32 x i8] c"android/net/ConnectivityManager\00", align 1
@.str.185 = private unnamed_addr constant [48 x i8] c"android/net/ConnectivityManager$NetworkCallback\00", align 1
@.str.186 = private unnamed_addr constant [27 x i8] c"android/net/LinkProperties\00", align 1
@.str.187 = private unnamed_addr constant [20 x i8] c"android/net/Network\00", align 1
@.str.188 = private unnamed_addr constant [32 x i8] c"android/net/NetworkCapabilities\00", align 1
@.str.189 = private unnamed_addr constant [24 x i8] c"android/net/NetworkInfo\00", align 1
@.str.190 = private unnamed_addr constant [27 x i8] c"android/net/NetworkRequest\00", align 1
@.str.191 = private unnamed_addr constant [35 x i8] c"android/net/NetworkRequest$Builder\00", align 1
@.str.192 = private unnamed_addr constant [16 x i8] c"android/net/Uri\00", align 1
@.str.193 = private unnamed_addr constant [24 x i8] c"android/net/Uri$Builder\00", align 1
@.str.194 = private unnamed_addr constant [29 x i8] c"android/net/wifi/WifiManager\00", align 1
@.str.195 = private unnamed_addr constant [25 x i8] c"android/location/Address\00", align 1
@.str.196 = private unnamed_addr constant [26 x i8] c"android/location/Criteria\00", align 1
@.str.197 = private unnamed_addr constant [26 x i8] c"android/location/Geocoder\00", align 1
@.str.198 = private unnamed_addr constant [34 x i8] c"android/location/LocationListener\00", align 1
@.str.199 = private unnamed_addr constant [26 x i8] c"android/location/Location\00", align 1
@.str.200 = private unnamed_addr constant [33 x i8] c"android/location/LocationManager\00", align 1
@.str.201 = private unnamed_addr constant [24 x i8] c"android/hardware/Camera\00", align 1
@.str.202 = private unnamed_addr constant [35 x i8] c"android/hardware/Camera$Parameters\00", align 1
@.str.203 = private unnamed_addr constant [37 x i8] c"android/hardware/SensorEventListener\00", align 1
@.str.204 = private unnamed_addr constant [24 x i8] c"android/hardware/Sensor\00", align 1
@.str.205 = private unnamed_addr constant [29 x i8] c"android/hardware/SensorEvent\00", align 1
@.str.206 = private unnamed_addr constant [31 x i8] c"android/hardware/SensorManager\00", align 1
@.str.207 = private unnamed_addr constant [31 x i8] c"android/hardware/usb/UsbDevice\00", align 1
@.str.208 = private unnamed_addr constant [47 x i8] c"android/hardware/camera2/CameraCharacteristics\00", align 1
@.str.209 = private unnamed_addr constant [51 x i8] c"android/hardware/camera2/CameraCharacteristics$Key\00", align 1
@.str.210 = private unnamed_addr constant [39 x i8] c"android/hardware/camera2/CameraManager\00", align 1
@.str.211 = private unnamed_addr constant [40 x i8] c"android/hardware/camera2/CameraMetadata\00", align 1
@.str.212 = private unnamed_addr constant [33 x i8] c"android/database/CharArrayBuffer\00", align 1
@.str.213 = private unnamed_addr constant [33 x i8] c"android/database/ContentObserver\00", align 1
@.str.214 = private unnamed_addr constant [33 x i8] c"android/database/DataSetObserver\00", align 1
@.str.215 = private unnamed_addr constant [24 x i8] c"android/database/Cursor\00", align 1
@.str.216 = private unnamed_addr constant [35 x i8] c"android/bluetooth/BluetoothAdapter\00", align 1
@.str.217 = private unnamed_addr constant [34 x i8] c"android/bluetooth/BluetoothDevice\00", align 1
@.str.218 = private unnamed_addr constant [35 x i8] c"android/bluetooth/BluetoothManager\00", align 1
@.str.219 = private unnamed_addr constant [34 x i8] c"android/bluetooth/BluetoothSocket\00", align 1
@.str.220 = private unnamed_addr constant [22 x i8] c"android/app/ActionBar\00", align 1
@.str.221 = private unnamed_addr constant [21 x i8] c"android/app/Activity\00", align 1
@.str.222 = private unnamed_addr constant [24 x i8] c"android/app/AlertDialog\00", align 1
@.str.223 = private unnamed_addr constant [32 x i8] c"android/app/AlertDialog$Builder\00", align 1
@.str.224 = private unnamed_addr constant [24 x i8] c"android/app/Application\00", align 1
@.str.225 = private unnamed_addr constant [51 x i8] c"android/app/Application$ActivityLifecycleCallbacks\00", align 1
@.str.226 = private unnamed_addr constant [19 x i8] c"android/app/Dialog\00", align 1
@.str.227 = private unnamed_addr constant [26 x i8] c"android/app/PendingIntent\00", align 1
@.str.228 = private unnamed_addr constant [20 x i8] c"android/app/Service\00", align 1
@.str.229 = private unnamed_addr constant [26 x i8] c"android/app/UiModeManager\00", align 1
@.str.230 = private unnamed_addr constant [40 x i8] c"android/view/WindowManager$LayoutParams\00", align 1
@.str.231 = private unnamed_addr constant [28 x i8] c"android/view/ActionProvider\00", align 1
@.str.232 = private unnamed_addr constant [33 x i8] c"android/view/ContextThemeWrapper\00", align 1
@.str.233 = private unnamed_addr constant [21 x i8] c"android/view/Display\00", align 1
@.str.234 = private unnamed_addr constant [23 x i8] c"android/view/DragEvent\00", align 1
@.str.235 = private unnamed_addr constant [41 x i8] c"android/view/ContextMenu$ContextMenuInfo\00", align 1
@.str.236 = private unnamed_addr constant [18 x i8] c"android/view/Menu\00", align 1
@.str.237 = private unnamed_addr constant [45 x i8] c"android/view/MenuItem$OnActionExpandListener\00", align 1
@.str.238 = private unnamed_addr constant [46 x i8] c"android/view/MenuItem$OnMenuItemClickListener\00", align 1
@.str.239 = private unnamed_addr constant [22 x i8] c"android/view/MenuItem\00", align 1
@.str.240 = private unnamed_addr constant [24 x i8] c"android/view/InputEvent\00", align 1
@.str.241 = private unnamed_addr constant [21 x i8] c"android/view/SubMenu\00", align 1
@.str.242 = private unnamed_addr constant [25 x i8] c"android/view/ViewManager\00", align 1
@.str.243 = private unnamed_addr constant [27 x i8] c"android/view/WindowManager\00", align 1
@.str.244 = private unnamed_addr constant [22 x i8] c"android/view/KeyEvent\00", align 1
@.str.245 = private unnamed_addr constant [28 x i8] c"android/view/LayoutInflater\00", align 1
@.str.246 = private unnamed_addr constant [26 x i8] c"android/view/MenuInflater\00", align 1
@.str.247 = private unnamed_addr constant [38 x i8] c"android/view/OrientationEventListener\00", align 1
@.str.248 = private unnamed_addr constant [18 x i8] c"android/view/View\00", align 1
@.str.249 = private unnamed_addr constant [34 x i8] c"android/view/View$OnClickListener\00", align 1
@.str.250 = private unnamed_addr constant [50 x i8] c"mono/android/view/View_OnClickListenerImplementor\00", align 1
@.str.251 = private unnamed_addr constant [38 x i8] c"android/view/View$OnLongClickListener\00", align 1
@.str.252 = private unnamed_addr constant [54 x i8] c"mono/android/view/View_OnLongClickListenerImplementor\00", align 1
@.str.253 = private unnamed_addr constant [23 x i8] c"android/view/ViewGroup\00", align 1
@.str.254 = private unnamed_addr constant [36 x i8] c"android/view/ViewGroup$LayoutParams\00", align 1
@.str.255 = private unnamed_addr constant [42 x i8] c"android/view/ViewGroup$MarginLayoutParams\00", align 1
@.str.256 = private unnamed_addr constant [20 x i8] c"android/view/Window\00", align 1
@.str.257 = private unnamed_addr constant [27 x i8] c"android/view/WindowMetrics\00", align 1
@.str.258 = private unnamed_addr constant [40 x i8] c"mono/android/runtime/InputStreamAdapter\00", align 1
@.str.259 = private unnamed_addr constant [31 x i8] c"mono/android/runtime/JavaArray\00", align 1
@.str.260 = private unnamed_addr constant [21 x i8] c"java/util/Collection\00", align 1
@.str.261 = private unnamed_addr constant [18 x i8] c"java/util/HashMap\00", align 1
@.str.262 = private unnamed_addr constant [20 x i8] c"java/util/ArrayList\00", align 1
@.str.263 = private unnamed_addr constant [32 x i8] c"mono/android/runtime/JavaObject\00", align 1
@.str.264 = private unnamed_addr constant [35 x i8] c"android/runtime/JavaProxyThrowable\00", align 1
@.str.265 = private unnamed_addr constant [18 x i8] c"java/util/HashSet\00", align 1
@.str.266 = private unnamed_addr constant [41 x i8] c"mono/android/runtime/OutputStreamAdapter\00", align 1
@.str.267 = private unnamed_addr constant [40 x i8] c"android/runtime/XmlReaderResourceParser\00", align 1
@.str.268 = private unnamed_addr constant [36 x i8] c"android/runtime/XmlReaderPullParser\00", align 1
@.str.269 = private unnamed_addr constant [24 x i8] c"android/graphics/Bitmap\00", align 1
@.str.270 = private unnamed_addr constant [39 x i8] c"android/graphics/Bitmap$CompressFormat\00", align 1
@.str.271 = private unnamed_addr constant [31 x i8] c"android/graphics/Bitmap$Config\00", align 1
@.str.272 = private unnamed_addr constant [27 x i8] c"android/graphics/BlendMode\00", align 1
@.str.273 = private unnamed_addr constant [24 x i8] c"android/graphics/Canvas\00", align 1
@.str.274 = private unnamed_addr constant [23 x i8] c"android/graphics/Color\00", align 1
@.str.275 = private unnamed_addr constant [24 x i8] c"android/graphics/Matrix\00", align 1
@.str.276 = private unnamed_addr constant [23 x i8] c"android/graphics/Point\00", align 1
@.str.277 = private unnamed_addr constant [24 x i8] c"android/graphics/PointF\00", align 1
@.str.278 = private unnamed_addr constant [28 x i8] c"android/graphics/PorterDuff\00", align 1
@.str.279 = private unnamed_addr constant [33 x i8] c"android/graphics/PorterDuff$Mode\00", align 1
@.str.280 = private unnamed_addr constant [22 x i8] c"android/graphics/Rect\00", align 1
@.str.281 = private unnamed_addr constant [23 x i8] c"android/graphics/RectF\00", align 1
@.str.282 = private unnamed_addr constant [32 x i8] c"android/graphics/SurfaceTexture\00", align 1
@.str.283 = private unnamed_addr constant [35 x i8] c"android/graphics/drawable/Drawable\00", align 1
@.str.284 = private unnamed_addr constant [31 x i8] c"android/graphics/drawable/Icon\00", align 1
@.str.285 = private unnamed_addr constant [42 x i8] c"android/content/ActivityNotFoundException\00", align 1
@.str.286 = private unnamed_addr constant [34 x i8] c"android/content/BroadcastReceiver\00", align 1
@.str.287 = private unnamed_addr constant [33 x i8] c"android/content/ClipboardManager\00", align 1
@.str.288 = private unnamed_addr constant [62 x i8] c"android/content/ClipboardManager$OnPrimaryClipChangedListener\00", align 1
@.str.289 = private unnamed_addr constant [25 x i8] c"android/content/ClipData\00", align 1
@.str.290 = private unnamed_addr constant [30 x i8] c"android/content/ClipData$Item\00", align 1
@.str.291 = private unnamed_addr constant [30 x i8] c"android/content/ComponentName\00", align 1
@.str.292 = private unnamed_addr constant [32 x i8] c"android/content/ContentProvider\00", align 1
@.str.293 = private unnamed_addr constant [32 x i8] c"android/content/ContentResolver\00", align 1
@.str.294 = private unnamed_addr constant [30 x i8] c"android/content/ContentValues\00", align 1
@.str.295 = private unnamed_addr constant [24 x i8] c"android/content/Context\00", align 1
@.str.296 = private unnamed_addr constant [31 x i8] c"android/content/ContextWrapper\00", align 1
@.str.297 = private unnamed_addr constant [48 x i8] c"android/content/DialogInterface$OnClickListener\00", align 1
@.str.298 = private unnamed_addr constant [64 x i8] c"mono/android/content/DialogInterface_OnClickListenerImplementor\00", align 1
@.str.299 = private unnamed_addr constant [32 x i8] c"android/content/DialogInterface\00", align 1
@.str.300 = private unnamed_addr constant [23 x i8] c"android/content/Intent\00", align 1
@.str.301 = private unnamed_addr constant [29 x i8] c"android/content/IntentFilter\00", align 1
@.str.302 = private unnamed_addr constant [29 x i8] c"android/content/IntentSender\00", align 1
@.str.303 = private unnamed_addr constant [34 x i8] c"android/content/ServiceConnection\00", align 1
@.str.304 = private unnamed_addr constant [41 x i8] c"android/content/SharedPreferences$Editor\00", align 1
@.str.305 = private unnamed_addr constant [67 x i8] c"android/content/SharedPreferences$OnSharedPreferenceChangeListener\00", align 1
@.str.306 = private unnamed_addr constant [34 x i8] c"android/content/SharedPreferences\00", align 1
@.str.307 = private unnamed_addr constant [40 x i8] c"android/content/res/AssetFileDescriptor\00", align 1
@.str.308 = private unnamed_addr constant [33 x i8] c"android/content/res/AssetManager\00", align 1
@.str.309 = private unnamed_addr constant [35 x i8] c"android/content/res/ColorStateList\00", align 1
@.str.310 = private unnamed_addr constant [34 x i8] c"android/content/res/Configuration\00", align 1
@.str.311 = private unnamed_addr constant [38 x i8] c"android/content/res/XmlResourceParser\00", align 1
@.str.312 = private unnamed_addr constant [30 x i8] c"android/content/res/Resources\00", align 1
@.str.313 = private unnamed_addr constant [34 x i8] c"android/content/pm/PackageManager\00", align 1
@.str.314 = private unnamed_addr constant [56 x i8] c"android/content/pm/PackageManager$NameNotFoundException\00", align 1
@.str.315 = private unnamed_addr constant [32 x i8] c"android/content/pm/ActivityInfo\00", align 1
@.str.316 = private unnamed_addr constant [35 x i8] c"android/content/pm/ApplicationInfo\00", align 1
@.str.317 = private unnamed_addr constant [33 x i8] c"android/content/pm/ComponentInfo\00", align 1
@.str.318 = private unnamed_addr constant [31 x i8] c"android/content/pm/FeatureInfo\00", align 1
@.str.319 = private unnamed_addr constant [31 x i8] c"android/content/pm/PackageInfo\00", align 1
@.str.320 = private unnamed_addr constant [35 x i8] c"android/content/pm/PackageItemInfo\00", align 1
@.str.321 = private unnamed_addr constant [31 x i8] c"android/content/pm/ResolveInfo\00", align 1
@.str.322 = private unnamed_addr constant [31 x i8] c"android/content/pm/ServiceInfo\00", align 1
@.str.323 = private unnamed_addr constant [32 x i8] c"android/content/pm/ShortcutInfo\00", align 1
@.str.324 = private unnamed_addr constant [40 x i8] c"android/content/pm/ShortcutInfo$Builder\00", align 1
@.str.325 = private unnamed_addr constant [35 x i8] c"android/content/pm/ShortcutManager\00", align 1
@.str.326 = private unnamed_addr constant [29 x i8] c"android/content/pm/Signature\00", align 1
@.str.327 = private unnamed_addr constant [31 x i8] c"android/content/pm/SigningInfo\00", align 1
@.str.328 = private unnamed_addr constant [15 x i8] c"java/util/Date\00", align 1
@.str.329 = private unnamed_addr constant [22 x i8] c"java/util/Enumeration\00", align 1
@.str.330 = private unnamed_addr constant [19 x i8] c"java/util/Iterator\00", align 1
@.str.331 = private unnamed_addr constant [17 x i8] c"java/util/Locale\00", align 1
@.str.332 = private unnamed_addr constant [26 x i8] c"java/util/Locale$Category\00", align 1
@.str.333 = private unnamed_addr constant [21 x i8] c"java/util/Properties\00", align 1
@.str.334 = private unnamed_addr constant [17 x i8] c"java/util/Random\00", align 1
@.str.335 = private unnamed_addr constant [15 x i8] c"java/util/UUID\00", align 1
@.str.336 = private unnamed_addr constant [35 x i8] c"java/util/zip/DeflaterOutputStream\00", align 1
@.str.337 = private unnamed_addr constant [23 x i8] c"java/util/zip/ZipEntry\00", align 1
@.str.338 = private unnamed_addr constant [30 x i8] c"java/util/zip/ZipOutputStream\00", align 1
@.str.339 = private unnamed_addr constant [28 x i8] c"java/util/function/Consumer\00", align 1
@.str.340 = private unnamed_addr constant [31 x i8] c"java/util/function/IntConsumer\00", align 1
@.str.341 = private unnamed_addr constant [30 x i8] c"java/util/concurrent/Executor\00", align 1
@.str.342 = private unnamed_addr constant [39 x i8] c"java/security/GeneralSecurityException\00", align 1
@.str.343 = private unnamed_addr constant [18 x i8] c"java/security/Key\00", align 1
@.str.344 = private unnamed_addr constant [49 x i8] c"java/security/InvalidAlgorithmParameterException\00", align 1
@.str.345 = private unnamed_addr constant [34 x i8] c"java/security/InvalidKeyException\00", align 1
@.str.346 = private unnamed_addr constant [24 x i8] c"java/security/Principal\00", align 1
@.str.347 = private unnamed_addr constant [25 x i8] c"java/security/PrivateKey\00", align 1
@.str.348 = private unnamed_addr constant [24 x i8] c"java/security/PublicKey\00", align 1
@.str.349 = private unnamed_addr constant [27 x i8] c"java/security/KeyException\00", align 1
@.str.350 = private unnamed_addr constant [22 x i8] c"java/security/KeyPair\00", align 1
@.str.351 = private unnamed_addr constant [31 x i8] c"java/security/KeyPairGenerator\00", align 1
@.str.352 = private unnamed_addr constant [34 x i8] c"java/security/KeyPairGeneratorSpi\00", align 1
@.str.353 = private unnamed_addr constant [23 x i8] c"java/security/KeyStore\00", align 1
@.str.354 = private unnamed_addr constant [42 x i8] c"java/security/KeyStore$LoadStoreParameter\00", align 1
@.str.355 = private unnamed_addr constant [43 x i8] c"java/security/KeyStore$ProtectionParameter\00", align 1
@.str.356 = private unnamed_addr constant [28 x i8] c"java/security/MessageDigest\00", align 1
@.str.357 = private unnamed_addr constant [31 x i8] c"java/security/MessageDigestSpi\00", align 1
@.str.358 = private unnamed_addr constant [39 x i8] c"java/security/NoSuchAlgorithmException\00", align 1
@.str.359 = private unnamed_addr constant [27 x i8] c"java/security/SecureRandom\00", align 1
@.str.360 = private unnamed_addr constant [42 x i8] c"java/security/spec/AlgorithmParameterSpec\00", align 1
@.str.361 = private unnamed_addr constant [31 x i8] c"java/security/cert/Certificate\00", align 1
@.str.362 = private unnamed_addr constant [48 x i8] c"java/security/cert/CertificateEncodingException\00", align 1
@.str.363 = private unnamed_addr constant [40 x i8] c"java/security/cert/CertificateException\00", align 1
@.str.364 = private unnamed_addr constant [38 x i8] c"java/security/cert/CertificateFactory\00", align 1
@.str.365 = private unnamed_addr constant [35 x i8] c"java/security/cert/X509Certificate\00", align 1
@.str.366 = private unnamed_addr constant [30 x i8] c"java/nio/channels/FileChannel\00", align 1
@.str.367 = private unnamed_addr constant [51 x i8] c"java/nio/channels/spi/AbstractInterruptibleChannel\00", align 1
@.str.368 = private unnamed_addr constant [26 x i8] c"java/net/ConnectException\00", align 1
@.str.369 = private unnamed_addr constant [27 x i8] c"java/net/HttpURLConnection\00", align 1
@.str.370 = private unnamed_addr constant [27 x i8] c"java/net/InetSocketAddress\00", align 1
@.str.371 = private unnamed_addr constant [27 x i8] c"java/net/ProtocolException\00", align 1
@.str.372 = private unnamed_addr constant [15 x i8] c"java/net/Proxy\00", align 1
@.str.373 = private unnamed_addr constant [20 x i8] c"java/net/Proxy$Type\00", align 1
@.str.374 = private unnamed_addr constant [23 x i8] c"java/net/SocketAddress\00", align 1
@.str.375 = private unnamed_addr constant [25 x i8] c"java/net/SocketException\00", align 1
@.str.376 = private unnamed_addr constant [32 x i8] c"java/net/SocketTimeoutException\00", align 1
@.str.377 = private unnamed_addr constant [33 x i8] c"java/net/UnknownServiceException\00", align 1
@.str.378 = private unnamed_addr constant [13 x i8] c"java/net/URL\00", align 1
@.str.379 = private unnamed_addr constant [23 x i8] c"java/net/URLConnection\00", align 1
@.str.380 = private unnamed_addr constant [20 x i8] c"java/net/URLEncoder\00", align 1
@.str.381 = private unnamed_addr constant [21 x i8] c"java/math/BigInteger\00", align 1
@.str.382 = private unnamed_addr constant [13 x i8] c"java/io/File\00", align 1
@.str.383 = private unnamed_addr constant [23 x i8] c"java/io/FileDescriptor\00", align 1
@.str.384 = private unnamed_addr constant [24 x i8] c"java/io/FileInputStream\00", align 1
@.str.385 = private unnamed_addr constant [30 x i8] c"java/io/FileNotFoundException\00", align 1
@.str.386 = private unnamed_addr constant [25 x i8] c"java/io/FileOutputStream\00", align 1
@.str.387 = private unnamed_addr constant [27 x i8] c"java/io/FilterOutputStream\00", align 1
@.str.388 = private unnamed_addr constant [18 x i8] c"java/io/Closeable\00", align 1
@.str.389 = private unnamed_addr constant [20 x i8] c"java/io/InputStream\00", align 1
@.str.390 = private unnamed_addr constant [31 x i8] c"java/io/InterruptedIOException\00", align 1
@.str.391 = private unnamed_addr constant [20 x i8] c"java/io/IOException\00", align 1
@.str.392 = private unnamed_addr constant [21 x i8] c"java/io/Serializable\00", align 1
@.str.393 = private unnamed_addr constant [21 x i8] c"java/io/OutputStream\00", align 1
@.str.394 = private unnamed_addr constant [20 x i8] c"java/io/PrintWriter\00", align 1
@.str.395 = private unnamed_addr constant [15 x i8] c"java/io/Reader\00", align 1
@.str.396 = private unnamed_addr constant [21 x i8] c"java/io/StringWriter\00", align 1
@.str.397 = private unnamed_addr constant [15 x i8] c"java/io/Writer\00", align 1
@.str.398 = private unnamed_addr constant [18 x i8] c"java/lang/Boolean\00", align 1
@.str.399 = private unnamed_addr constant [15 x i8] c"java/lang/Byte\00", align 1
@.str.400 = private unnamed_addr constant [20 x i8] c"java/lang/Character\00", align 1
@.str.401 = private unnamed_addr constant [16 x i8] c"java/lang/Class\00", align 1
@.str.402 = private unnamed_addr constant [29 x i8] c"java/lang/ClassCastException\00", align 1
@.str.403 = private unnamed_addr constant [17 x i8] c"java/lang/Double\00", align 1
@.str.404 = private unnamed_addr constant [15 x i8] c"java/lang/Enum\00", align 1
@.str.405 = private unnamed_addr constant [16 x i8] c"java/lang/Error\00", align 1
@.str.406 = private unnamed_addr constant [20 x i8] c"java/lang/Exception\00", align 1
@.str.407 = private unnamed_addr constant [16 x i8] c"java/lang/Float\00", align 1
@.str.408 = private unnamed_addr constant [21 x i8] c"java/lang/Appendable\00", align 1
@.str.409 = private unnamed_addr constant [23 x i8] c"java/lang/CharSequence\00", align 1
@.str.410 = private unnamed_addr constant [35 x i8] c"java/lang/IllegalArgumentException\00", align 1
@.str.411 = private unnamed_addr constant [32 x i8] c"java/lang/IllegalStateException\00", align 1
@.str.412 = private unnamed_addr constant [36 x i8] c"java/lang/IndexOutOfBoundsException\00", align 1
@.str.413 = private unnamed_addr constant [18 x i8] c"java/lang/Integer\00", align 1
@.str.414 = private unnamed_addr constant [19 x i8] c"java/lang/Runnable\00", align 1
@.str.415 = private unnamed_addr constant [17 x i8] c"java/lang/System\00", align 1
@.str.416 = private unnamed_addr constant [23 x i8] c"java/lang/LinkageError\00", align 1
@.str.417 = private unnamed_addr constant [15 x i8] c"java/lang/Long\00", align 1
@.str.418 = private unnamed_addr constant [15 x i8] c"java/lang/Math\00", align 1
@.str.419 = private unnamed_addr constant [31 x i8] c"java/lang/NullPointerException\00", align 1
@.str.420 = private unnamed_addr constant [17 x i8] c"java/lang/Number\00", align 1
@.str.421 = private unnamed_addr constant [17 x i8] c"java/lang/Object\00", align 1
@.str.422 = private unnamed_addr constant [27 x i8] c"java/lang/RuntimeException\00", align 1
@.str.423 = private unnamed_addr constant [28 x i8] c"java/lang/SecurityException\00", align 1
@.str.424 = private unnamed_addr constant [16 x i8] c"java/lang/Short\00", align 1
@.str.425 = private unnamed_addr constant [28 x i8] c"java/lang/StackTraceElement\00", align 1
@.str.426 = private unnamed_addr constant [17 x i8] c"java/lang/String\00", align 1
@.str.427 = private unnamed_addr constant [17 x i8] c"java/lang/Thread\00", align 1
@.str.428 = private unnamed_addr constant [35 x i8] c"mono/java/lang/RunnableImplementor\00", align 1
@.str.429 = private unnamed_addr constant [20 x i8] c"java/lang/Throwable\00", align 1
@.str.430 = private unnamed_addr constant [31 x i8] c"java/lang/UnsatisfiedLinkError\00", align 1
@.str.431 = private unnamed_addr constant [40 x i8] c"java/lang/UnsupportedOperationException\00", align 1
@.str.432 = private unnamed_addr constant [25 x i8] c"mono/android/TypeManager\00", align 1
@.str.433 = private unnamed_addr constant [47 x i8] c"com/trimble/bluebottle/remoteapi/ApplicationId\00", align 1
@.str.434 = private unnamed_addr constant [53 x i8] c"com/trimble/bluebottle/remoteapi/IBlueBottleCallback\00", align 1
@.str.435 = private unnamed_addr constant [58 x i8] c"com/trimble/bluebottle/remoteapi/IBlueBottleCallback$Stub\00", align 1
@.str.436 = private unnamed_addr constant [52 x i8] c"com/trimble/bluebottle/remoteapi/IBlueBottleService\00", align 1
@.str.437 = private unnamed_addr constant [57 x i8] c"com/trimble/bluebottle/remoteapi/IBlueBottleService$Stub\00", align 1
@.str.438 = private unnamed_addr constant [35 x i8] c"com/trimble/timservice/BuildConfig\00", align 1
@.str.439 = private unnamed_addr constant [40 x i8] c"com/trimble/timservice/ITimService$Stub\00", align 1
@.str.440 = private unnamed_addr constant [46 x i8] c"com/trimble/timservice/ITimService$Stub$Proxy\00", align 1
@.str.441 = private unnamed_addr constant [35 x i8] c"com/trimble/timservice/ITimService\00", align 1
@.str.442 = private unnamed_addr constant [36 x i8] c"com/trimble/timservice/LicenseState\00", align 1
@.str.443 = private unnamed_addr constant [24 x i8] c"crc64775202d62a505530/c\00", align 1
@.str.444 = private unnamed_addr constant [42 x i8] c"crc6445b87d7bcfab1150/BBServiceConnection\00", align 1
@.str.445 = private unnamed_addr constant [37 x i8] c"crc64f64ae6bbda7f4685/ModuleListener\00", align 1
@.str.446 = private unnamed_addr constant [44 x i8] c"crc64f64ae6bbda7f4685/ModuleManagerListener\00", align 1
@.str.447 = private unnamed_addr constant [61 x i8] c"crc64a0e0a82d0db9a07d/Connectivity_EssentialsNetworkCallback\00", align 1
@.str.448 = private unnamed_addr constant [44 x i8] c"crc64a0e0a82d0db9a07d/AccelerometerListener\00", align 1
@.str.449 = private unnamed_addr constant [40 x i8] c"crc64a0e0a82d0db9a07d/BarometerListener\00", align 1
@.str.450 = private unnamed_addr constant [47 x i8] c"crc64a0e0a82d0db9a07d/BatteryBroadcastReceiver\00", align 1
@.str.451 = private unnamed_addr constant [51 x i8] c"crc64a0e0a82d0db9a07d/EnergySaverBroadcastReceiver\00", align 1
@.str.452 = private unnamed_addr constant [46 x i8] c"crc64a0e0a82d0db9a07d/ClipboardChangeListener\00", align 1
@.str.453 = private unnamed_addr constant [37 x i8] c"crc64a0e0a82d0db9a07d/SensorListener\00", align 1
@.str.454 = private unnamed_addr constant [52 x i8] c"crc64a0e0a82d0db9a07d/ConnectivityBroadcastReceiver\00", align 1
@.str.455 = private unnamed_addr constant [31 x i8] c"crc64a0e0a82d0db9a07d/Listener\00", align 1
@.str.456 = private unnamed_addr constant [45 x i8] c"crc64a0e0a82d0db9a07d/SingleLocationListener\00", align 1
@.str.457 = private unnamed_addr constant [40 x i8] c"crc64a0e0a82d0db9a07d/GyroscopeListener\00", align 1
@.str.458 = private unnamed_addr constant [43 x i8] c"crc64a0e0a82d0db9a07d/MagnetometerListener\00", align 1
@.str.459 = private unnamed_addr constant [48 x i8] c"crc64a0e0a82d0db9a07d/OrientationSensorListener\00", align 1
@.str.460 = private unnamed_addr constant [55 x i8] c"crc64a0e0a82d0db9a07d/ActivityLifecycleContextListener\00", align 1
@.str.461 = private unnamed_addr constant [43 x i8] c"crc64a0e0a82d0db9a07d/IntermediateActivity\00", align 1
@.str.462 = private unnamed_addr constant [49 x i8] c"crc64a0e0a82d0db9a07d/TextToSpeechImplementation\00", align 1
@.str.463 = private unnamed_addr constant [32 x i8] c"xamarin/essentials/fileProvider\00", align 1
@.str.464 = private unnamed_addr constant [55 x i8] c"crc64a0e0a82d0db9a07d/WebAuthenticatorCallbackActivity\00", align 1
@.str.465 = private unnamed_addr constant [59 x i8] c"crc64a0e0a82d0db9a07d/WebAuthenticatorIntermediateActivity\00", align 1
@.str.466 = private unnamed_addr constant [38 x i8] c"com/trimble/empower/em940/EM940Device\00", align 1
@.str.467 = private unnamed_addr constant [64 x i8] c"com/trimble/empower/em940/EM940Device$EM940DeviceStatusCallback\00", align 1
@.str.468 = private unnamed_addr constant [50 x i8] c"com/trimble/empower/em940/EM940Device$FlowControl\00", align 1
@.str.469 = private unnamed_addr constant [48 x i8] c"com/trimble/empower/em940/EM940Device$PurgeType\00", align 1
@.str.470 = private unnamed_addr constant [44 x i8] c"com/trimble/empower/em940/EM940Device$State\00", align 1
@.str.471 = private unnamed_addr constant [42 x i8] c"com/trimble/empower/em940/EM940DeviceInfo\00", align 1
@.str.472 = private unnamed_addr constant [41 x i8] c"com/trimble/empower/em940/EM940Exception\00", align 1
@.str.473 = private unnamed_addr constant [39 x i8] c"com/trimble/empower/em940/EM940Manager\00", align 1
@.str.474 = private unnamed_addr constant [60 x i8] c"com/trimble/empower/em940/EM940Manager$AvailabilityCallback\00", align 1
@.str.475 = private unnamed_addr constant [49 x i8] c"com/trimble/empower/em940/EM940ApiStatusCallback\00", align 1
@.str.476 = private unnamed_addr constant [45 x i8] c"com/trimble/empower/em940/EM940EventListener\00", align 1
@.str.477 = private unnamed_addr constant [61 x i8] c"mono/com/trimble/empower/em940/EM940EventListenerImplementor\00", align 1
@.str.478 = private unnamed_addr constant [65 x i8] c"com/trimble/empower/em940/internal/IAvailabilityCallback$Default\00", align 1
@.str.479 = private unnamed_addr constant [62 x i8] c"com/trimble/empower/em940/internal/IAvailabilityCallback$Stub\00", align 1
@.str.480 = private unnamed_addr constant [57 x i8] c"com/trimble/empower/em940/internal/IAvailabilityCallback\00", align 1
@.str.481 = private unnamed_addr constant [56 x i8] c"com/trimble/empower/em940/internal/IEM940Device$Default\00", align 1
@.str.482 = private unnamed_addr constant [53 x i8] c"com/trimble/empower/em940/internal/IEM940Device$Stub\00", align 1
@.str.483 = private unnamed_addr constant [48 x i8] c"com/trimble/empower/em940/internal/IEM940Device\00", align 1
@.str.484 = private unnamed_addr constant [70 x i8] c"com/trimble/empower/em940/internal/IEM940DeviceStatusCallback$Default\00", align 1
@.str.485 = private unnamed_addr constant [67 x i8] c"com/trimble/empower/em940/internal/IEM940DeviceStatusCallback$Stub\00", align 1
@.str.486 = private unnamed_addr constant [62 x i8] c"com/trimble/empower/em940/internal/IEM940DeviceStatusCallback\00", align 1
@.str.487 = private unnamed_addr constant [63 x i8] c"com/trimble/empower/em940/internal/IEM940EventListener$Default\00", align 1
@.str.488 = private unnamed_addr constant [60 x i8] c"com/trimble/empower/em940/internal/IEM940EventListener$Stub\00", align 1
@.str.489 = private unnamed_addr constant [55 x i8] c"com/trimble/empower/em940/internal/IEM940EventListener\00", align 1
@.str.490 = private unnamed_addr constant [57 x i8] c"com/trimble/empower/em940/internal/IEM940Manager$Default\00", align 1
@.str.491 = private unnamed_addr constant [54 x i8] c"com/trimble/empower/em940/internal/IEM940Manager$Stub\00", align 1
@.str.492 = private unnamed_addr constant [49 x i8] c"com/trimble/empower/em940/internal/IEM940Manager\00", align 1
@.str.493 = private unnamed_addr constant [47 x i8] c"com/trimble/empower/em940/em940lib/BuildConfig\00", align 1
@.str.494 = private unnamed_addr constant [41 x i8] c"crc6454360aa41b8b940b/AltGeoRelayService\00", align 1
@.str.495 = private unnamed_addr constant [39 x i8] c"crc6454360aa41b8b940b/BTSelectActivity\00", align 1
@.str.496 = private unnamed_addr constant [57 x i8] c"crc6454360aa41b8b940b/BTSelectActivity_BluetoothReceiver\00", align 1
@.str.497 = private unnamed_addr constant [57 x i8] c"crc6454360aa41b8b940b/BTSelectActivity_BthDevListAdapter\00", align 1
@.str.498 = private unnamed_addr constant [36 x i8] c"crc6454360aa41b8b940b/Configuration\00", align 1
@.str.499 = private unnamed_addr constant [35 x i8] c"crc6454360aa41b8b940b/MainActivity\00", align 1
@.str.500 = private unnamed_addr constant [45 x i8] c"crc640e50ecb54de2b5d2/CatalystFacadeActivity\00", align 1
@.str.501 = private unnamed_addr constant [54 x i8] c"crc640e50ecb54de2b5d2/TCPCommunicator_NetworkCallback\00", align 1
@.str.502 = private unnamed_addr constant [24 x i8] c"crc649aea178664f9314c/k\00", align 1
@.str.503 = private unnamed_addr constant [45 x i8] c"androidx/browser/customtabs/CustomTabsClient\00", align 1
@.str.504 = private unnamed_addr constant [68 x i8] c"androidx/browser/customtabs/CustomTabsClient_CustomTabsCallbackImpl\00", align 1
@.str.505 = private unnamed_addr constant [54 x i8] c"crc64396a3fe5f8138e3f/CustomTabsServiceConnectionImpl\00", align 1
@.str.506 = private unnamed_addr constant [55 x i8] c"androidx/browser/customtabs/CustomTabColorSchemeParams\00", align 1
@.str.507 = private unnamed_addr constant [47 x i8] c"androidx/browser/customtabs/CustomTabsCallback\00", align 1
@.str.508 = private unnamed_addr constant [45 x i8] c"androidx/browser/customtabs/CustomTabsIntent\00", align 1
@.str.509 = private unnamed_addr constant [53 x i8] c"androidx/browser/customtabs/CustomTabsIntent$Builder\00", align 1
@.str.510 = private unnamed_addr constant [56 x i8] c"androidx/browser/customtabs/CustomTabsServiceConnection\00", align 1
@.str.511 = private unnamed_addr constant [46 x i8] c"androidx/browser/customtabs/CustomTabsSession\00", align 1
@.str.512 = private unnamed_addr constant [61 x i8] c"androidx/browser/customtabs/CustomTabsSession$PendingSession\00", align 1
@.str.513 = private unnamed_addr constant [49 x i8] c"crc6405db95066ba03620/GenericParcelableCreator_1\00", align 1
@.str.514 = private unnamed_addr constant [34 x i8] c"crc640eda0984e46970d1/ITMMService\00", align 1
@.str.515 = private unnamed_addr constant [38 x i8] c"crc640eda0984e46970d1/ITMMServiceStub\00", align 1
@.str.516 = private unnamed_addr constant [44 x i8] c"crc640eda0984e46970d1/ITMMServiceStub_Proxy\00", align 1
@.str.517 = private unnamed_addr constant [51 x i8] c"crc640eda0984e46970d1/LicenseFeatureInfoParcelable\00", align 1
@.str.518 = private unnamed_addr constant [45 x i8] c"crc640eda0984e46970d1/LicenseGroupParcelable\00", align 1
@.str.519 = private unnamed_addr constant [24 x i8] c"crc640947112d00c027ad/k\00", align 1
@.str.520 = private unnamed_addr constant [48 x i8] c"androidx/core/view/DragAndDropPermissionsCompat\00", align 1
@.str.521 = private unnamed_addr constant [36 x i8] c"androidx/core/content/ContextCompat\00", align 1
@.str.522 = private unnamed_addr constant [35 x i8] c"androidx/core/content/FileProvider\00", align 1
@.str.523 = private unnamed_addr constant [40 x i8] c"androidx/core/content/PermissionChecker\00", align 1
@.str.524 = private unnamed_addr constant [43 x i8] c"androidx/core/content/pm/PackageInfoCompat\00", align 1
@.str.525 = private unnamed_addr constant [33 x i8] c"androidx/core/app/ActivityCompat\00", align 1
@.str.526 = private unnamed_addr constant [58 x i8] c"androidx/core/app/ActivityCompat$PermissionCompatDelegate\00", align 1
@.str.527 = private unnamed_addr constant [40 x i8] c"androidx/core/app/SharedElementCallback\00", align 1
@.str.528 = private unnamed_addr constant [70 x i8] c"androidx/core/app/SharedElementCallback$OnSharedElementsReadyListener\00", align 1

;TypeMapModule
@.TypeMapModule.0_assembly_name = private unnamed_addr constant [34 x i8] c"Trimble.EMPOWER.JavaBinding.Droid\00", align 1
@.TypeMapModule.1_assembly_name = private unnamed_addr constant [13 x i8] c"Mono.Android\00", align 1
@.TypeMapModule.2_assembly_name = private unnamed_addr constant [67 x i8] c"Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.JavaBindings\00", align 1
@.TypeMapModule.3_assembly_name = private unnamed_addr constant [12 x i8] c"AIDLService\00", align 1
@.TypeMapModule.4_assembly_name = private unnamed_addr constant [62 x i8] c"Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.Android\00", align 1
@.TypeMapModule.5_assembly_name = private unnamed_addr constant [30 x i8] c"Trimble.EMPOWER.Manager.Droid\00", align 1
@.TypeMapModule.6_assembly_name = private unnamed_addr constant [19 x i8] c"Xamarin.Essentials\00", align 1
@.TypeMapModule.7_assembly_name = private unnamed_addr constant [22 x i8] c"EM940Lib-Mono-Android\00", align 1
@.TypeMapModule.8_assembly_name = private unnamed_addr constant [25 x i8] c"AltGeoRelayService.Droid\00", align 1
@.TypeMapModule.9_assembly_name = private unnamed_addr constant [25 x i8] c"CatalystFacade.NET.Droid\00", align 1
@.TypeMapModule.10_assembly_name = private unnamed_addr constant [33 x i8] c"Trimble.Ssi.DriverManagement.NET\00", align 1
@.TypeMapModule.11_assembly_name = private unnamed_addr constant [25 x i8] c"Xamarin.AndroidX.Browser\00", align 1
@.TypeMapModule.12_assembly_name = private unnamed_addr constant [24 x i8] c"Trimble.LicensingV2.NET\00", align 1
@.TypeMapModule.13_assembly_name = private unnamed_addr constant [22 x i8] c"Xamarin.AndroidX.Core\00", align 1

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
