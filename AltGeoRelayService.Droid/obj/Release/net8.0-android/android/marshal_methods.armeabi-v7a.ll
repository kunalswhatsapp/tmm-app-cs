; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [93 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [186 x i32] [
	i32 10166715, ; 0: System.Net.NameResolution.dll => 0x9b21bb => 57
	i32 39109920, ; 1: Newtonsoft.Json.dll => 0x254c520 => 3
	i32 42639949, ; 2: System.Threading.Thread => 0x28aa24d => 79
	i32 66541672, ; 3: System.Diagnostics.StackTrace => 0x3f75868 => 46
	i32 94467485, ; 4: Trimble.Ssi.Drivers.Gnss.NET => 0x5a1759d => 25
	i32 117431740, ; 5: System.Runtime.InteropServices => 0x6ffddbc => 71
	i32 200902347, ; 6: AIDLService.dll => 0xbf986cb => 4
	i32 205061960, ; 7: System.ComponentModel => 0xc38ff48 => 41
	i32 209399409, ; 8: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 28
	i32 230752869, ; 9: Microsoft.CSharp.dll => 0xdc10265 => 34
	i32 246610117, ; 10: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 69
	i32 321597661, ; 11: System.Numerics => 0x132b30dd => 63
	i32 345067907, ; 12: Trimble.Licensing.Interfaces => 0x14915183 => 5
	i32 369012355, ; 13: Trimble.Ssi.Driver.CarpoBased.Driver.SP80.NET => 0x15feae83 => 21
	i32 375677976, ; 14: System.Net.ServicePoint.dll => 0x16646418 => 61
	i32 379916513, ; 15: System.Threading.Thread.dll => 0x16a510e1 => 79
	i32 385762202, ; 16: System.Memory.dll => 0x16fe439a => 55
	i32 392211733, ; 17: CatalystFacade.NET.Droid => 0x1760ad15 => 32
	i32 392610295, ; 18: System.Threading.ThreadPool.dll => 0x1766c1f7 => 80
	i32 395744057, ; 19: _Microsoft.Android.Resource.Designer => 0x17969339 => 0
	i32 442521989, ; 20: Xamarin.Essentials => 0x1a605985 => 30
	i32 442565967, ; 21: System.Collections => 0x1a61054f => 38
	i32 459347974, ; 22: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 74
	i32 465846621, ; 23: mscorlib => 0x1bc4415d => 86
	i32 469710990, ; 24: System.dll => 0x1bff388e => 85
	i32 483333429, ; 25: Trimble.Ssi.Interfaces.dll => 0x1ccf1535 => 14
	i32 498788369, ; 26: System.ObjectModel => 0x1dbae811 => 64
	i32 506375840, ; 27: EM940Lib-Mono-Android => 0x1e2eaea0 => 1
	i32 672442732, ; 28: System.Collections.Concurrent => 0x2814a96c => 35
	i32 683518922, ; 29: System.Net.Security => 0x28bdabca => 60
	i32 690569205, ; 30: System.Xml.Linq.dll => 0x29293ff5 => 82
	i32 698852761, ; 31: Trimble.EMPOWER.Common.Droid => 0x29a7a599 => 15
	i32 758405526, ; 32: Trimble.Ssi.Driver.CarpoBased.Driver.SP80.NET.dll => 0x2d345996 => 21
	i32 759454413, ; 33: System.Net.Requests => 0x2d445acd => 59
	i32 759797674, ; 34: Trimble.Ssi.DriverProxy.Common.NET.dll => 0x2d4997aa => 12
	i32 775507847, ; 35: System.IO.Compression => 0x2e394f87 => 52
	i32 804715423, ; 36: System.Data.Common => 0x2ff6fb9f => 44
	i32 823281589, ; 37: System.Private.Uri.dll => 0x311247b5 => 65
	i32 830298997, ; 38: System.IO.Compression.Brotli => 0x317d5b75 => 51
	i32 857211421, ; 39: Trimble.Ssi.Driver.CarpoBased.Driver.RSeries.NET.dll => 0x3318021d => 20
	i32 904024072, ; 40: System.ComponentModel.Primitives.dll => 0x35e25008 => 39
	i32 907069023, ; 41: Trimble.Ssi.Core => 0x3610c65f => 8
	i32 941511168, ; 42: Trimble.TDDTransformation.NET.dll => 0x381e5200 => 27
	i32 955402788, ; 43: Newtonsoft.Json => 0x38f24a24 => 3
	i32 975874589, ; 44: System.Xml.XDocument => 0x3a2aaa1d => 84
	i32 992768348, ; 45: System.Collections.dll => 0x3b2c715c => 38
	i32 1019214401, ; 46: System.Drawing => 0x3cbffa41 => 49
	i32 1034646685, ; 47: Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.Android => 0x3dab749d => 18
	i32 1036536393, ; 48: System.Drawing.Primitives.dll => 0x3dc84a49 => 48
	i32 1044663988, ; 49: System.Linq.Expressions.dll => 0x3e444eb4 => 53
	i32 1071396955, ; 50: Trimble.Ssi.Driver.MockGnss.NET.dll => 0x3fdc385b => 22
	i32 1082857460, ; 51: System.ComponentModel.TypeConverter => 0x408b17f4 => 40
	i32 1098259244, ; 52: System => 0x41761b2c => 85
	i32 1290146439, ; 53: Trimble.EMPOWER.Manager.Droid.dll => 0x4ce61287 => 17
	i32 1324164729, ; 54: System.Linq => 0x4eed2679 => 54
	i32 1331565719, ; 55: Trimble.Ssi.Drivers.Gnss.NET.dll => 0x4f5e1497 => 25
	i32 1335490478, ; 56: Trimble.EMPOWER.Common.Droid.dll => 0x4f99f7ae => 15
	i32 1408764838, ; 57: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 73
	i32 1452070440, ; 58: System.Formats.Asn1.dll => 0x568cd628 => 50
	i32 1458022317, ; 59: System.Net.Security.dll => 0x56e7a7ad => 60
	i32 1462112819, ; 60: System.IO.Compression.dll => 0x57261233 => 52
	i32 1480492111, ; 61: System.IO.Compression.Brotli.dll => 0x583e844f => 51
	i32 1543031311, ; 62: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 78
	i32 1568431217, ; 63: Trimble.LicensingV2.NET.dll => 0x5d7c5c71 => 6
	i32 1611530934, ; 64: Trimble.Ssi.Interfaces.Gnss.dll => 0x600e02b6 => 26
	i32 1639515021, ; 65: System.Net.Http.dll => 0x61b9038d => 56
	i32 1639986890, ; 66: System.Text.RegularExpressions => 0x61c036ca => 78
	i32 1642466345, ; 67: Trimble.EMPOWER.Manager.Droid => 0x61e60c29 => 17
	i32 1657153582, ; 68: System.Runtime => 0x62c6282e => 75
	i32 1677501392, ; 69: System.Net.Primitives.dll => 0x63fca3d0 => 58
	i32 1679769178, ; 70: System.Security.Cryptography => 0x641f3e5a => 76
	i32 1704313042, ; 71: Trimble.Ssi.Interfaces => 0x6595c0d2 => 14
	i32 1714251341, ; 72: Trimble.Ssi.DriverCommon.Interfaces.NET.dll => 0x662d664d => 10
	i32 1746316138, ; 73: Mono.Android.Export => 0x6816ab6a => 90
	i32 1763938596, ; 74: System.Diagnostics.TraceSource.dll => 0x69239124 => 47
	i32 1776026572, ; 75: System.Core.dll => 0x69dc03cc => 43
	i32 1780572499, ; 76: Mono.Android.Runtime.dll => 0x6a216153 => 91
	i32 1808821652, ; 77: Trimble.Ssi.Core.dll => 0x6bd06d94 => 8
	i32 1824175904, ; 78: System.Text.Encoding.Extensions => 0x6cbab720 => 77
	i32 1824722060, ; 79: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 73
	i32 1858542181, ; 80: System.Linq.Expressions => 0x6ec71a65 => 53
	i32 1862635601, ; 81: Trimble.Ssi.DriverCommon.Interfaces.Gnss.NET.dll => 0x6f059051 => 23
	i32 1867746548, ; 82: Xamarin.Essentials.dll => 0x6f538cf4 => 30
	i32 1870277092, ; 83: System.Reflection.Primitives => 0x6f7a29e4 => 70
	i32 1910275211, ; 84: System.Collections.NonGeneric.dll => 0x71dc7c8b => 36
	i32 1935182812, ; 85: CatalystFacade.NET.dll => 0x73588bdc => 31
	i32 1939592360, ; 86: System.Private.Xml.Linq => 0x739bd4a8 => 66
	i32 1944918660, ; 87: Trimble.Ssi.DriverCommon.Core.NET => 0x73ed1a84 => 9
	i32 1979348969, ; 88: Trimble.Ssi.Drivers.Common.NET.dll => 0x75fa77e9 => 13
	i32 2006896308, ; 89: Trimble.Ssi.DriverProxy.Gnss.NET.dll => 0x779eceb4 => 24
	i32 2021594754, ; 90: EM940Lib-Mono-Android.dll => 0x787f1682 => 1
	i32 2045470958, ; 91: System.Private.Xml => 0x79eb68ee => 67
	i32 2070888862, ; 92: System.Diagnostics.TraceSource => 0x7b6f419e => 47
	i32 2079903147, ; 93: System.Runtime.dll => 0x7bf8cdab => 75
	i32 2083657637, ; 94: Trimble.Ssi.Components.Core => 0x7c3217a5 => 7
	i32 2102860745, ; 95: Trimble.Ssi.DriverCommon.Interfaces.Gnss.NET => 0x7d571bc9 => 23
	i32 2115272055, ; 96: Trimble.Ssi.Driver.CarpoBased.Driver.RSeries.NET => 0x7e147d77 => 20
	i32 2127167465, ; 97: System.Console => 0x7ec9ffe9 => 42
	i32 2128347312, ; 98: Trimble.Licensing.Interfaces.dll => 0x7edc00b0 => 5
	i32 2142473426, ; 99: System.Collections.Specialized => 0x7fb38cd2 => 37
	i32 2193016926, ; 100: System.ObjectModel.dll => 0x82b6c85e => 64
	i32 2201231467, ; 101: System.Net.Http => 0x8334206b => 56
	i32 2226594010, ; 102: Trimble.TDDTransformation.NET => 0x84b720da => 27
	i32 2295906218, ; 103: System.Net.Sockets => 0x88d8bfaa => 62
	i32 2305521784, ; 104: System.Private.CoreLib.dll => 0x896b7878 => 88
	i32 2340745234, ; 105: Trimble.Ssi.DriverManagement.NET.dll => 0x8b84f012 => 11
	i32 2353062107, ; 106: System.Net.Primitives => 0x8c40e0db => 58
	i32 2368005991, ; 107: System.Xml.ReaderWriter.dll => 0x8d24e767 => 83
	i32 2380613258, ; 108: AltGeoRelayService.Droid.dll => 0x8de5468a => 33
	i32 2430427323, ; 109: Trimble.Ssi.DriverManagement.NET => 0x90dd60bb => 11
	i32 2435356389, ; 110: System.Console.dll => 0x912896e5 => 42
	i32 2458678730, ; 111: System.Net.Sockets.dll => 0x928c75ca => 62
	i32 2471841756, ; 112: netstandard.dll => 0x93554fdc => 87
	i32 2475788418, ; 113: Java.Interop.dll => 0x93918882 => 89
	i32 2484371297, ; 114: System.Net.ServicePoint => 0x94147f61 => 61
	i32 2519305614, ; 115: Trimble.EMPOWER.JavaBinding.Droid.dll => 0x96298d8e => 16
	i32 2538310050, ; 116: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 69
	i32 2562349572, ; 117: Microsoft.CSharp => 0x98ba5a04 => 34
	i32 2585220780, ; 118: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 77
	i32 2589602615, ; 119: System.Threading.ThreadPool => 0x9a5a3337 => 80
	i32 2617129537, ; 120: System.Private.Xml.dll => 0x9bfe3a41 => 67
	i32 2633938609, ; 121: Trimble.EMPOWER.JavaBinding.Droid => 0x9cfeb6b1 => 16
	i32 2664396074, ; 122: System.Xml.XDocument.dll => 0x9ecf752a => 84
	i32 2665622720, ; 123: System.Drawing.Primitives => 0x9ee22cc0 => 48
	i32 2676780864, ; 124: System.Data.Common.dll => 0x9f8c6f40 => 44
	i32 2724373263, ; 125: System.Runtime.Numerics.dll => 0xa262a30f => 72
	i32 2861098320, ; 126: Mono.Android.Export.dll => 0xaa88e550 => 90
	i32 2905242038, ; 127: mscorlib.dll => 0xad2a79b6 => 86
	i32 2909740682, ; 128: System.Private.CoreLib => 0xad6f1e8a => 88
	i32 2938562415, ; 129: Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.JavaBindings => 0xaf26e76f => 19
	i32 2940926066, ; 130: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 46
	i32 2959614098, ; 131: System.ComponentModel.dll => 0xb0682092 => 41
	i32 3016553109, ; 132: Trimble.Ssi.DriverCommon.Core.NET.dll => 0xb3ccf295 => 9
	i32 3038032645, ; 133: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 0
	i32 3059408633, ; 134: Mono.Android.Runtime => 0xb65adef9 => 91
	i32 3059793426, ; 135: System.ComponentModel.Primitives => 0xb660be12 => 39
	i32 3103600923, ; 136: System.Formats.Asn1 => 0xb8fd311b => 50
	i32 3126763205, ; 137: Trimble.Ssi.Drivers.Common.NET => 0xba5e9ec5 => 13
	i32 3159123045, ; 138: System.Reflection.Primitives.dll => 0xbc4c6465 => 70
	i32 3220365878, ; 139: System.Threading => 0xbff2e236 => 81
	i32 3316684772, ; 140: System.Net.Requests.dll => 0xc5b097e4 => 59
	i32 3362522851, ; 141: Xamarin.AndroidX.Core => 0xc86c06e3 => 29
	i32 3366347497, ; 142: Java.Interop => 0xc8a662e9 => 89
	i32 3378298534, ; 143: Trimble.Ssi.DriverProxy.Common.NET => 0xc95cbea6 => 12
	i32 3382917508, ; 144: CatalystFacade.NET => 0xc9a33984 => 31
	i32 3406917265, ; 145: Trimble.Ssi.Components.Core.dll => 0xcb116e91 => 7
	i32 3430777524, ; 146: netstandard => 0xcc7d82b4 => 87
	i32 3471940407, ; 147: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 40
	i32 3476120550, ; 148: Mono.Android => 0xcf3163e6 => 92
	i32 3479741568, ; 149: Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.Android.dll => 0xcf68a480 => 18
	i32 3499097210, ; 150: Google.Protobuf.dll => 0xd08ffc7a => 2
	i32 3509114376, ; 151: System.Xml.Linq => 0xd128d608 => 82
	i32 3538969265, ; 152: Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.JavaBindings.dll => 0xd2f062b1 => 19
	i32 3608519521, ; 153: System.Linq.dll => 0xd715a361 => 54
	i32 3645630983, ; 154: Google.Protobuf => 0xd94bea07 => 2
	i32 3672681054, ; 155: Mono.Android.dll => 0xdae8aa5e => 92
	i32 3682565725, ; 156: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 28
	i32 3682973436, ; 157: Trimble.Ssi.Driver.MockGnss.NET => 0xdb85b6fc => 22
	i32 3732100267, ; 158: System.Net.NameResolution => 0xde7354ab => 57
	i32 3748608112, ; 159: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 45
	i32 3773573141, ; 160: Trimble.Ssi.DriverCommon.Interfaces.NET => 0xe0ec2815 => 10
	i32 3783409177, ; 161: AIDLService => 0xe1823e19 => 4
	i32 3789578385, ; 162: Trimble.Ssi.Interfaces.Gnss => 0xe1e06091 => 26
	i32 3792276235, ; 163: System.Collections.NonGeneric => 0xe2098b0b => 36
	i32 3802395368, ; 164: System.Collections.Specialized.dll => 0xe2a3f2e8 => 37
	i32 3823082795, ; 165: System.Security.Cryptography.dll => 0xe3df9d2b => 76
	i32 3829621856, ; 166: System.Numerics.dll => 0xe4436460 => 63
	i32 3849253459, ; 167: System.Runtime.InteropServices.dll => 0xe56ef253 => 71
	i32 3896106733, ; 168: System.Collections.Concurrent.dll => 0xe839deed => 35
	i32 3896760992, ; 169: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 29
	i32 3928044579, ; 170: System.Xml.ReaderWriter => 0xea213423 => 83
	i32 4025784931, ; 171: System.Memory => 0xeff49a63 => 55
	i32 4032579209, ; 172: Trimble.LicensingV2.NET => 0xf05c4689 => 6
	i32 4054681211, ; 173: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 68
	i32 4068434129, ; 174: System.Private.Xml.Linq.dll => 0xf27f60d1 => 66
	i32 4073602200, ; 175: System.Threading.dll => 0xf2ce3c98 => 81
	i32 4099507663, ; 176: System.Drawing.dll => 0xf45985cf => 49
	i32 4100113165, ; 177: System.Private.Uri => 0xf462c30d => 65
	i32 4147896353, ; 178: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 68
	i32 4151237749, ; 179: System.Core => 0xf76edc75 => 43
	i32 4174597548, ; 180: Trimble.Ssi.DriverProxy.Gnss.NET => 0xf8d34dac => 24
	i32 4181436372, ; 181: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 74
	i32 4213026141, ; 182: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 45
	i32 4248489701, ; 183: CatalystFacade.NET.Droid.dll => 0xfd3acee5 => 32
	i32 4249087357, ; 184: AltGeoRelayService.Droid => 0xfd43ed7d => 33
	i32 4274976490 ; 185: System.Runtime.Numerics => 0xfecef6ea => 72
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [186 x i32] [
	i32 57, ; 0
	i32 3, ; 1
	i32 79, ; 2
	i32 46, ; 3
	i32 25, ; 4
	i32 71, ; 5
	i32 4, ; 6
	i32 41, ; 7
	i32 28, ; 8
	i32 34, ; 9
	i32 69, ; 10
	i32 63, ; 11
	i32 5, ; 12
	i32 21, ; 13
	i32 61, ; 14
	i32 79, ; 15
	i32 55, ; 16
	i32 32, ; 17
	i32 80, ; 18
	i32 0, ; 19
	i32 30, ; 20
	i32 38, ; 21
	i32 74, ; 22
	i32 86, ; 23
	i32 85, ; 24
	i32 14, ; 25
	i32 64, ; 26
	i32 1, ; 27
	i32 35, ; 28
	i32 60, ; 29
	i32 82, ; 30
	i32 15, ; 31
	i32 21, ; 32
	i32 59, ; 33
	i32 12, ; 34
	i32 52, ; 35
	i32 44, ; 36
	i32 65, ; 37
	i32 51, ; 38
	i32 20, ; 39
	i32 39, ; 40
	i32 8, ; 41
	i32 27, ; 42
	i32 3, ; 43
	i32 84, ; 44
	i32 38, ; 45
	i32 49, ; 46
	i32 18, ; 47
	i32 48, ; 48
	i32 53, ; 49
	i32 22, ; 50
	i32 40, ; 51
	i32 85, ; 52
	i32 17, ; 53
	i32 54, ; 54
	i32 25, ; 55
	i32 15, ; 56
	i32 73, ; 57
	i32 50, ; 58
	i32 60, ; 59
	i32 52, ; 60
	i32 51, ; 61
	i32 78, ; 62
	i32 6, ; 63
	i32 26, ; 64
	i32 56, ; 65
	i32 78, ; 66
	i32 17, ; 67
	i32 75, ; 68
	i32 58, ; 69
	i32 76, ; 70
	i32 14, ; 71
	i32 10, ; 72
	i32 90, ; 73
	i32 47, ; 74
	i32 43, ; 75
	i32 91, ; 76
	i32 8, ; 77
	i32 77, ; 78
	i32 73, ; 79
	i32 53, ; 80
	i32 23, ; 81
	i32 30, ; 82
	i32 70, ; 83
	i32 36, ; 84
	i32 31, ; 85
	i32 66, ; 86
	i32 9, ; 87
	i32 13, ; 88
	i32 24, ; 89
	i32 1, ; 90
	i32 67, ; 91
	i32 47, ; 92
	i32 75, ; 93
	i32 7, ; 94
	i32 23, ; 95
	i32 20, ; 96
	i32 42, ; 97
	i32 5, ; 98
	i32 37, ; 99
	i32 64, ; 100
	i32 56, ; 101
	i32 27, ; 102
	i32 62, ; 103
	i32 88, ; 104
	i32 11, ; 105
	i32 58, ; 106
	i32 83, ; 107
	i32 33, ; 108
	i32 11, ; 109
	i32 42, ; 110
	i32 62, ; 111
	i32 87, ; 112
	i32 89, ; 113
	i32 61, ; 114
	i32 16, ; 115
	i32 69, ; 116
	i32 34, ; 117
	i32 77, ; 118
	i32 80, ; 119
	i32 67, ; 120
	i32 16, ; 121
	i32 84, ; 122
	i32 48, ; 123
	i32 44, ; 124
	i32 72, ; 125
	i32 90, ; 126
	i32 86, ; 127
	i32 88, ; 128
	i32 19, ; 129
	i32 46, ; 130
	i32 41, ; 131
	i32 9, ; 132
	i32 0, ; 133
	i32 91, ; 134
	i32 39, ; 135
	i32 50, ; 136
	i32 13, ; 137
	i32 70, ; 138
	i32 81, ; 139
	i32 59, ; 140
	i32 29, ; 141
	i32 89, ; 142
	i32 12, ; 143
	i32 31, ; 144
	i32 7, ; 145
	i32 87, ; 146
	i32 40, ; 147
	i32 92, ; 148
	i32 18, ; 149
	i32 2, ; 150
	i32 82, ; 151
	i32 19, ; 152
	i32 54, ; 153
	i32 2, ; 154
	i32 92, ; 155
	i32 28, ; 156
	i32 22, ; 157
	i32 57, ; 158
	i32 45, ; 159
	i32 10, ; 160
	i32 4, ; 161
	i32 26, ; 162
	i32 36, ; 163
	i32 37, ; 164
	i32 76, ; 165
	i32 63, ; 166
	i32 71, ; 167
	i32 35, ; 168
	i32 29, ; 169
	i32 83, ; 170
	i32 55, ; 171
	i32 6, ; 172
	i32 68, ; 173
	i32 66, ; 174
	i32 81, ; 175
	i32 49, ; 176
	i32 65, ; 177
	i32 68, ; 178
	i32 43, ; 179
	i32 24, ; 180
	i32 74, ; 181
	i32 45, ; 182
	i32 32, ; 183
	i32 33, ; 184
	i32 72 ; 185
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

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
