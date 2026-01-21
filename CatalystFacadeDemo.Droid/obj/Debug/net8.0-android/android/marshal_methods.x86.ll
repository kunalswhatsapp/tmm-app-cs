; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [217 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [428 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 206
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 210
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39109920, ; 6: Newtonsoft.Json.dll => 0x254c520 => 175
	i32 39485524, ; 7: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 8: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 9: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 68219467, ; 10: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 82292897, ; 11: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 94467485, ; 12: Trimble.Ssi.Drivers.Gnss.NET => 0x5a1759d => 197
	i32 117431740, ; 13: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 122350210, ; 14: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 142721839, ; 15: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 16: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 17: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 18: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 203
	i32 176265551, ; 19: System.ServiceProcess => 0xa81994f => 132
	i32 184328833, ; 20: System.ValueTuple.dll => 0xafca281 => 151
	i32 200902347, ; 21: AIDLService.dll => 0xbf986cb => 176
	i32 205061960, ; 22: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 23: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 202
	i32 220171995, ; 24: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230752869, ; 25: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 26: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 27: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 28: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 276479776, ; 29: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 291076382, ; 30: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 31: System.Net.Ping.dll => 0x11d123fd => 69
	i32 321597661, ; 32: System.Numerics => 0x132b30dd => 83
	i32 342366114, ; 33: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 205
	i32 345067907, ; 34: Trimble.Licensing.Interfaces => 0x14915183 => 177
	i32 360082299, ; 35: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 36: System.IO.Pipes => 0x15ebe147 => 55
	i32 369012355, ; 37: Trimble.Ssi.Driver.CarpoBased.Driver.SP80.NET => 0x15feae83 => 193
	i32 374914964, ; 38: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 39: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 40: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 41: System.Memory.dll => 0x16fe439a => 62
	i32 392211733, ; 42: CatalystFacade.NET.Droid => 0x1760ad15 => 212
	i32 392610295, ; 43: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 44: _Microsoft.Android.Resource.Designer => 0x17969339 => 213
	i32 403441872, ; 45: WindowsBase => 0x180c08d0 => 165
	i32 442521989, ; 46: Xamarin.Essentials => 0x1a605985 => 209
	i32 442565967, ; 47: System.Collections => 0x1a61054f => 12
	i32 451504562, ; 48: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 49: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 50: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 51: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 52: System.dll => 0x1bff388e => 164
	i32 483333429, ; 53: Trimble.Ssi.Interfaces.dll => 0x1ccf1535 => 186
	i32 498788369, ; 54: System.ObjectModel => 0x1dbae811 => 84
	i32 506375840, ; 55: EM940Lib-Mono-Android => 0x1e2eaea0 => 173
	i32 526420162, ; 56: System.Transactions.dll => 0x1f6088c2 => 150
	i32 530272170, ; 57: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 540030774, ; 58: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 59: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 60: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 61: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 577335427, ; 62: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 601371474, ; 63: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 64: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 65: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 643868501, ; 66: System.Net => 0x2660a755 => 81
	i32 662205335, ; 67: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 68: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 208
	i32 666292255, ; 69: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 201
	i32 672442732, ; 70: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 71: System.Net.Security => 0x28bdabca => 73
	i32 690569205, ; 72: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 693804605, ; 73: System.Windows => 0x295a9e3d => 154
	i32 698852761, ; 74: Trimble.EMPOWER.Common.Droid => 0x29a7a599 => 187
	i32 699345723, ; 75: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700358131, ; 76: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 722857257, ; 77: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 78: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 79: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 758405526, ; 80: Trimble.Ssi.Driver.CarpoBased.Driver.SP80.NET.dll => 0x2d345996 => 193
	i32 759454413, ; 81: System.Net.Requests => 0x2d445acd => 72
	i32 759797674, ; 82: Trimble.Ssi.DriverProxy.Common.NET.dll => 0x2d4997aa => 184
	i32 762598435, ; 83: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 84: System.IO.Compression => 0x2e394f87 => 46
	i32 804715423, ; 85: System.Data.Common => 0x2ff6fb9f => 22
	i32 823281589, ; 86: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 87: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 88: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 89: System.Net.Quic => 0x31b69d60 => 71
	i32 857211421, ; 90: Trimble.Ssi.Driver.CarpoBased.Driver.RSeries.NET.dll => 0x3318021d => 192
	i32 873119928, ; 91: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 92: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 93: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 94: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 907069023, ; 95: Trimble.Ssi.Core => 0x3610c65f => 180
	i32 911108515, ; 96: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 928116545, ; 97: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 210
	i32 941511168, ; 98: Trimble.TDDTransformation.NET.dll => 0x381e5200 => 199
	i32 952186615, ; 99: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 955402788, ; 100: Newtonsoft.Json => 0x38f24a24 => 175
	i32 967690846, ; 101: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 205
	i32 975236339, ; 102: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 103: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 104: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 105: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 106: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 107: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 108: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1019214401, ; 109: System.Drawing => 0x3cbffa41 => 36
	i32 1034646685, ; 110: Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.Android => 0x3dab749d => 190
	i32 1036536393, ; 111: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 112: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1071396955, ; 113: Trimble.Ssi.Driver.MockGnss.NET.dll => 0x3fdc385b => 194
	i32 1082857460, ; 114: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1098259244, ; 115: System => 0x41761b2c => 164
	i32 1170634674, ; 116: System.Web.dll => 0x45c677b2 => 153
	i32 1204270330, ; 117: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 201
	i32 1208641965, ; 118: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 119: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1253011324, ; 120: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1290146439, ; 121: Trimble.EMPOWER.Manager.Droid.dll => 0x4ce61287 => 189
	i32 1309188875, ; 122: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1324164729, ; 123: System.Linq => 0x4eed2679 => 61
	i32 1331565719, ; 124: Trimble.Ssi.Drivers.Gnss.NET.dll => 0x4f5e1497 => 197
	i32 1335329327, ; 125: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1335490478, ; 126: Trimble.EMPOWER.Common.Droid.dll => 0x4f99f7ae => 187
	i32 1364015309, ; 127: System.IO => 0x514d38cd => 57
	i32 1379779777, ; 128: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 129: System.Configuration.dll => 0x53936ab4 => 19
	i32 1408764838, ; 130: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 131: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 132: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1434145427, ; 133: System.Runtime.Handles => 0x557b5293 => 104
	i32 1439761251, ; 134: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 135: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 136: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 137: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 138: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461234159, ; 139: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 140: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 141: System.IO.Compression.dll => 0x57261233 => 46
	i32 1479771757, ; 142: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 143: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 144: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1536373174, ; 145: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 146: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 147: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 148: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1565862583, ; 149: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 150: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1568431217, ; 151: Trimble.LicensingV2.NET.dll => 0x5d7c5c71 => 178
	i32 1573704789, ; 152: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 153: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1592978981, ; 154: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1601112923, ; 155: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 156: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1611530934, ; 157: Trimble.Ssi.Interfaces.Gnss.dll => 0x600e02b6 => 198
	i32 1618516317, ; 158: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622358360, ; 159: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1639515021, ; 160: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 161: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 162: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1642466345, ; 163: Trimble.EMPOWER.Manager.Droid => 0x61e60c29 => 189
	i32 1657153582, ; 164: System.Runtime => 0x62c6282e => 116
	i32 1675553242, ; 165: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 166: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 167: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 168: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 169: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 170: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1701541528, ; 171: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1704313042, ; 172: Trimble.Ssi.Interfaces => 0x6595c0d2 => 186
	i32 1714251341, ; 173: Trimble.Ssi.DriverCommon.Interfaces.NET.dll => 0x662d664d => 182
	i32 1726116996, ; 174: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 175: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1744735666, ; 176: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 177: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 178: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 179: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 180: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 181: System.Reflection.Extensions => 0x6942234e => 93
	i32 1776026572, ; 182: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 183: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 184: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1808821652, ; 185: Trimble.Ssi.Core.dll => 0x6bd06d94 => 180
	i32 1818787751, ; 186: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 187: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 188: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1858542181, ; 189: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1862635601, ; 190: Trimble.Ssi.DriverCommon.Interfaces.Gnss.NET.dll => 0x6f059051 => 195
	i32 1867746548, ; 191: Xamarin.Essentials.dll => 0x6f538cf4 => 209
	i32 1870277092, ; 192: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1879696579, ; 193: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1888955245, ; 194: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 195: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 196: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 197: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 198: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1919157823, ; 199: Xamarin.AndroidX.MultiDex.dll => 0x7264063f => 207
	i32 1935182812, ; 200: CatalystFacade.NET.dll => 0x73588bdc => 211
	i32 1939592360, ; 201: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1944918660, ; 202: Trimble.Ssi.DriverCommon.Core.NET => 0x73ed1a84 => 181
	i32 1956758971, ; 203: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1979348969, ; 204: Trimble.Ssi.Drivers.Common.NET.dll => 0x75fa77e9 => 185
	i32 2006896308, ; 205: Trimble.Ssi.DriverProxy.Gnss.NET.dll => 0x779eceb4 => 196
	i32 2011961780, ; 206: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2021594754, ; 207: EM940Lib-Mono-Android.dll => 0x787f1682 => 173
	i32 2045470958, ; 208: System.Private.Xml => 0x79eb68ee => 88
	i32 2060060697, ; 209: System.Windows.dll => 0x7aca0819 => 154
	i32 2070888862, ; 210: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 211: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2083657637, ; 212: Trimble.Ssi.Components.Core => 0x7c3217a5 => 179
	i32 2090596640, ; 213: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2102860745, ; 214: Trimble.Ssi.DriverCommon.Interfaces.Gnss.NET => 0x7d571bc9 => 195
	i32 2115272055, ; 215: Trimble.Ssi.Driver.CarpoBased.Driver.RSeries.NET => 0x7e147d77 => 192
	i32 2127167465, ; 216: System.Console => 0x7ec9ffe9 => 20
	i32 2128347312, ; 217: Trimble.Licensing.Interfaces.dll => 0x7edc00b0 => 177
	i32 2142473426, ; 218: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 219: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 220: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2193016926, ; 221: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201231467, ; 222: System.Net.Http => 0x8334206b => 64
	i32 2222056684, ; 223: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2226594010, ; 224: Trimble.TDDTransformation.NET => 0x84b720da => 199
	i32 2252106437, ; 225: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 226: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2256548716, ; 227: Xamarin.AndroidX.MultiDex => 0x8680336c => 207
	i32 2265110946, ; 228: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2293034957, ; 229: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 230: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 231: System.Net.Mail => 0x88ffe49e => 66
	i32 2305521784, ; 232: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 233: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 200
	i32 2320631194, ; 234: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 235: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2340745234, ; 236: Trimble.Ssi.DriverManagement.NET.dll => 0x8b84f012 => 183
	i32 2344264397, ; 237: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 238: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 239: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2378619854, ; 240: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 241: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2401565422, ; 242: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2421380589, ; 243: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2430427323, ; 244: Trimble.Ssi.DriverManagement.NET => 0x90dd60bb => 183
	i32 2435356389, ; 245: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 246: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 247: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 248: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 249: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2471841756, ; 250: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 251: Java.Interop.dll => 0x93918882 => 168
	i32 2483903535, ; 252: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 253: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 254: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 255: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 256: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 206
	i32 2519305614, ; 257: Trimble.EMPOWER.JavaBinding.Droid.dll => 0x96298d8e => 188
	i32 2538310050, ; 258: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2562349572, ; 259: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 260: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2585220780, ; 261: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 262: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 263: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2617129537, ; 264: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 265: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2627185994, ; 266: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 267: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633938609, ; 268: Trimble.EMPOWER.JavaBinding.Droid => 0x9cfeb6b1 => 188
	i32 2663698177, ; 269: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 270: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 271: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 272: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 273: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 274: System.IO.dll => 0xa090e36a => 57
	i32 2715334215, ; 275: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 276: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 277: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 278: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2735172069, ; 279: System.Threading.Channels => 0xa30769e5 => 139
	i32 2740948882, ; 280: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 281: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2765824710, ; 282: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2803228030, ; 283: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2819470561, ; 284: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 285: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2824502124, ; 286: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2849599387, ; 287: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2861098320, ; 288: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2875220617, ; 289: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2887636118, ; 290: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 291: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 292: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 293: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 294: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 295: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2919462931, ; 296: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2936416060, ; 297: System.Resources.Reader => 0xaf06273c => 98
	i32 2938562415, ; 298: Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.JavaBindings => 0xaf26e76f => 191
	i32 2940926066, ; 299: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 300: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 301: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 302: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 303: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 3016553109, ; 304: Trimble.Ssi.DriverCommon.Core.NET.dll => 0xb3ccf295 => 181
	i32 3023353419, ; 305: WindowsBase.dll => 0xb434b64b => 165
	i32 3038032645, ; 306: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 213
	i32 3059408633, ; 307: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 308: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 309: System.Threading.Tasks => 0xb755818f => 144
	i32 3090735792, ; 310: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 311: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 312: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 313: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 314: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 315: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3126763205, ; 316: Trimble.Ssi.Drivers.Common.NET => 0xba5e9ec5 => 185
	i32 3132293585, ; 317: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 318: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3159123045, ; 319: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 320: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3192346100, ; 321: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 322: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 323: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 324: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3220365878, ; 325: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 326: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 327: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3265493905, ; 328: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 329: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277748351, ; 330: CatalystFacadeDemo.Droid => 0xc35e787f => 0
	i32 3277815716, ; 331: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 332: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 333: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 334: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 335: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 336: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3316684772, ; 337: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317144872, ; 338: System.Data => 0xc5b79d28 => 24
	i32 3358260929, ; 339: System.Text.Json => 0xc82afec1 => 137
	i32 3362522851, ; 340: Xamarin.AndroidX.Core => 0xc86c06e3 => 204
	i32 3366347497, ; 341: Java.Interop => 0xc8a662e9 => 168
	i32 3378298534, ; 342: Trimble.Ssi.DriverProxy.Common.NET => 0xc95cbea6 => 184
	i32 3382917508, ; 343: CatalystFacade.NET => 0xc9a33984 => 211
	i32 3395150330, ; 344: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 345: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3406917265, ; 346: Trimble.Ssi.Components.Core.dll => 0xcb116e91 => 179
	i32 3429136800, ; 347: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 348: netstandard => 0xcc7d82b4 => 167
	i32 3445260447, ; 349: System.Formats.Tar => 0xcd5a809f => 39
	i32 3471940407, ; 350: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 351: Mono.Android => 0xcf3163e6 => 171
	i32 3479741568, ; 352: Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.Android.dll => 0xcf68a480 => 190
	i32 3485117614, ; 353: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 354: System.Transactions => 0xcfd0c798 => 150
	i32 3499097210, ; 355: Google.Protobuf.dll => 0xd08ffc7a => 174
	i32 3509114376, ; 356: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 357: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 358: System.Configuration => 0xd2757232 => 19
	i32 3538969265, ; 359: Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.JavaBindings.dll => 0xd2f062b1 => 191
	i32 3539954161, ; 360: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 361: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 362: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3598340787, ; 363: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 364: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 365: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3638274909, ; 366: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3645089577, ; 367: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3645630983, ; 368: Google.Protobuf => 0xd94bea07 => 174
	i32 3660523487, ; 369: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 370: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 371: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 202
	i32 3682973436, ; 372: Trimble.Ssi.Driver.MockGnss.NET => 0xdb85b6fc => 194
	i32 3700866549, ; 373: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3716563718, ; 374: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 375: Xamarin.AndroidX.Annotation => 0xdda814c6 => 200
	i32 3732100267, ; 376: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 377: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 378: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 379: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3773573141, ; 380: Trimble.Ssi.DriverCommon.Interfaces.NET => 0xe0ec2815 => 182
	i32 3783409177, ; 381: AIDLService => 0xe1823e19 => 176
	i32 3786282454, ; 382: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 203
	i32 3789578385, ; 383: Trimble.Ssi.Interfaces.Gnss => 0xe1e06091 => 198
	i32 3792276235, ; 384: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3802395368, ; 385: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 386: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 387: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 388: System.Numerics.dll => 0xe4436460 => 83
	i32 3844307129, ; 389: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 390: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 391: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 392: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 393: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 394: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3896106733, ; 395: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 396: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 204
	i32 3901907137, ; 397: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 398: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 399: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 208
	i32 3928044579, ; 400: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 401: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3945713374, ; 402: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 403: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3999648927, ; 404: CatalystFacadeDemo.Droid.dll => 0xee65cc9f => 0
	i32 4003436829, ; 405: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4025784931, ; 406: System.Memory => 0xeff49a63 => 62
	i32 4032579209, ; 407: Trimble.LicensingV2.NET => 0xf05c4689 => 178
	i32 4054681211, ; 408: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 409: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 410: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4099507663, ; 411: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 412: System.Private.Uri => 0xf462c30d => 86
	i32 4127667938, ; 413: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 414: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 415: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4151237749, ; 416: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 417: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 418: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 419: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4174597548, ; 420: Trimble.Ssi.DriverProxy.Gnss.NET => 0xf8d34dac => 196
	i32 4181436372, ; 421: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4185676441, ; 422: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 423: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 424: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4248489701, ; 425: CatalystFacade.NET.Droid.dll => 0xfd3acee5 => 212
	i32 4260525087, ; 426: System.Buffers => 0xfdf2741f => 7
	i32 4274976490 ; 427: System.Runtime.Numerics => 0xfecef6ea => 110
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [428 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 206, ; 3
	i32 210, ; 4
	i32 48, ; 5
	i32 175, ; 6
	i32 80, ; 7
	i32 145, ; 8
	i32 30, ; 9
	i32 124, ; 10
	i32 102, ; 11
	i32 197, ; 12
	i32 107, ; 13
	i32 139, ; 14
	i32 77, ; 15
	i32 124, ; 16
	i32 13, ; 17
	i32 203, ; 18
	i32 132, ; 19
	i32 151, ; 20
	i32 176, ; 21
	i32 18, ; 22
	i32 202, ; 23
	i32 26, ; 24
	i32 1, ; 25
	i32 59, ; 26
	i32 42, ; 27
	i32 91, ; 28
	i32 147, ; 29
	i32 54, ; 30
	i32 69, ; 31
	i32 83, ; 32
	i32 205, ; 33
	i32 177, ; 34
	i32 131, ; 35
	i32 55, ; 36
	i32 193, ; 37
	i32 149, ; 38
	i32 74, ; 39
	i32 145, ; 40
	i32 62, ; 41
	i32 212, ; 42
	i32 146, ; 43
	i32 213, ; 44
	i32 165, ; 45
	i32 209, ; 46
	i32 12, ; 47
	i32 125, ; 48
	i32 152, ; 49
	i32 113, ; 50
	i32 166, ; 51
	i32 164, ; 52
	i32 186, ; 53
	i32 84, ; 54
	i32 173, ; 55
	i32 150, ; 56
	i32 60, ; 57
	i32 51, ; 58
	i32 103, ; 59
	i32 114, ; 60
	i32 40, ; 61
	i32 120, ; 62
	i32 52, ; 63
	i32 44, ; 64
	i32 119, ; 65
	i32 81, ; 66
	i32 136, ; 67
	i32 208, ; 68
	i32 201, ; 69
	i32 8, ; 70
	i32 73, ; 71
	i32 155, ; 72
	i32 154, ; 73
	i32 187, ; 74
	i32 92, ; 75
	i32 45, ; 76
	i32 109, ; 77
	i32 129, ; 78
	i32 25, ; 79
	i32 193, ; 80
	i32 72, ; 81
	i32 184, ; 82
	i32 55, ; 83
	i32 46, ; 84
	i32 22, ; 85
	i32 86, ; 86
	i32 43, ; 87
	i32 160, ; 88
	i32 71, ; 89
	i32 192, ; 90
	i32 3, ; 91
	i32 42, ; 92
	i32 63, ; 93
	i32 16, ; 94
	i32 180, ; 95
	i32 53, ; 96
	i32 210, ; 97
	i32 199, ; 98
	i32 105, ; 99
	i32 175, ; 100
	i32 205, ; 101
	i32 34, ; 102
	i32 158, ; 103
	i32 85, ; 104
	i32 32, ; 105
	i32 12, ; 106
	i32 51, ; 107
	i32 56, ; 108
	i32 36, ; 109
	i32 190, ; 110
	i32 35, ; 111
	i32 58, ; 112
	i32 194, ; 113
	i32 17, ; 114
	i32 164, ; 115
	i32 153, ; 116
	i32 201, ; 117
	i32 29, ; 118
	i32 52, ; 119
	i32 5, ; 120
	i32 189, ; 121
	i32 85, ; 122
	i32 61, ; 123
	i32 197, ; 124
	i32 112, ; 125
	i32 187, ; 126
	i32 57, ; 127
	i32 99, ; 128
	i32 19, ; 129
	i32 111, ; 130
	i32 101, ; 131
	i32 102, ; 132
	i32 104, ; 133
	i32 71, ; 134
	i32 38, ; 135
	i32 32, ; 136
	i32 103, ; 137
	i32 73, ; 138
	i32 9, ; 139
	i32 123, ; 140
	i32 46, ; 141
	i32 9, ; 142
	i32 43, ; 143
	i32 4, ; 144
	i32 31, ; 145
	i32 138, ; 146
	i32 92, ; 147
	i32 93, ; 148
	i32 49, ; 149
	i32 141, ; 150
	i32 178, ; 151
	i32 112, ; 152
	i32 140, ; 153
	i32 115, ; 154
	i32 157, ; 155
	i32 76, ; 156
	i32 198, ; 157
	i32 79, ; 158
	i32 37, ; 159
	i32 64, ; 160
	i32 138, ; 161
	i32 15, ; 162
	i32 189, ; 163
	i32 116, ; 164
	i32 48, ; 165
	i32 70, ; 166
	i32 80, ; 167
	i32 126, ; 168
	i32 94, ; 169
	i32 121, ; 170
	i32 26, ; 171
	i32 186, ; 172
	i32 182, ; 173
	i32 97, ; 174
	i32 28, ; 175
	i32 149, ; 176
	i32 169, ; 177
	i32 4, ; 178
	i32 98, ; 179
	i32 33, ; 180
	i32 93, ; 181
	i32 21, ; 182
	i32 41, ; 183
	i32 170, ; 184
	i32 180, ; 185
	i32 2, ; 186
	i32 134, ; 187
	i32 111, ; 188
	i32 58, ; 189
	i32 195, ; 190
	i32 209, ; 191
	i32 95, ; 192
	i32 39, ; 193
	i32 25, ; 194
	i32 94, ; 195
	i32 89, ; 196
	i32 99, ; 197
	i32 10, ; 198
	i32 207, ; 199
	i32 211, ; 200
	i32 87, ; 201
	i32 181, ; 202
	i32 100, ; 203
	i32 185, ; 204
	i32 196, ; 205
	i32 7, ; 206
	i32 173, ; 207
	i32 88, ; 208
	i32 154, ; 209
	i32 33, ; 210
	i32 116, ; 211
	i32 179, ; 212
	i32 82, ; 213
	i32 195, ; 214
	i32 192, ; 215
	i32 20, ; 216
	i32 177, ; 217
	i32 11, ; 218
	i32 162, ; 219
	i32 3, ; 220
	i32 84, ; 221
	i32 64, ; 222
	i32 143, ; 223
	i32 199, ; 224
	i32 157, ; 225
	i32 41, ; 226
	i32 207, ; 227
	i32 117, ; 228
	i32 131, ; 229
	i32 75, ; 230
	i32 66, ; 231
	i32 172, ; 232
	i32 200, ; 233
	i32 143, ; 234
	i32 106, ; 235
	i32 183, ; 236
	i32 151, ; 237
	i32 70, ; 238
	i32 156, ; 239
	i32 121, ; 240
	i32 127, ; 241
	i32 152, ; 242
	i32 141, ; 243
	i32 183, ; 244
	i32 20, ; 245
	i32 14, ; 246
	i32 135, ; 247
	i32 75, ; 248
	i32 59, ; 249
	i32 167, ; 250
	i32 168, ; 251
	i32 15, ; 252
	i32 74, ; 253
	i32 6, ; 254
	i32 23, ; 255
	i32 206, ; 256
	i32 188, ; 257
	i32 91, ; 258
	i32 1, ; 259
	i32 136, ; 260
	i32 134, ; 261
	i32 69, ; 262
	i32 146, ; 263
	i32 88, ; 264
	i32 96, ; 265
	i32 31, ; 266
	i32 45, ; 267
	i32 188, ; 268
	i32 109, ; 269
	i32 158, ; 270
	i32 35, ; 271
	i32 22, ; 272
	i32 114, ; 273
	i32 57, ; 274
	i32 144, ; 275
	i32 118, ; 276
	i32 120, ; 277
	i32 110, ; 278
	i32 139, ; 279
	i32 54, ; 280
	i32 105, ; 281
	i32 133, ; 282
	i32 159, ; 283
	i32 163, ; 284
	i32 132, ; 285
	i32 161, ; 286
	i32 140, ; 287
	i32 169, ; 288
	i32 40, ; 289
	i32 81, ; 290
	i32 56, ; 291
	i32 37, ; 292
	i32 97, ; 293
	i32 166, ; 294
	i32 172, ; 295
	i32 82, ; 296
	i32 98, ; 297
	i32 191, ; 298
	i32 30, ; 299
	i32 159, ; 300
	i32 18, ; 301
	i32 127, ; 302
	i32 119, ; 303
	i32 181, ; 304
	i32 165, ; 305
	i32 213, ; 306
	i32 170, ; 307
	i32 16, ; 308
	i32 144, ; 309
	i32 125, ; 310
	i32 118, ; 311
	i32 38, ; 312
	i32 115, ; 313
	i32 47, ; 314
	i32 142, ; 315
	i32 185, ; 316
	i32 117, ; 317
	i32 34, ; 318
	i32 95, ; 319
	i32 53, ; 320
	i32 129, ; 321
	i32 153, ; 322
	i32 24, ; 323
	i32 161, ; 324
	i32 148, ; 325
	i32 104, ; 326
	i32 89, ; 327
	i32 60, ; 328
	i32 142, ; 329
	i32 0, ; 330
	i32 100, ; 331
	i32 5, ; 332
	i32 13, ; 333
	i32 122, ; 334
	i32 135, ; 335
	i32 28, ; 336
	i32 72, ; 337
	i32 24, ; 338
	i32 137, ; 339
	i32 204, ; 340
	i32 168, ; 341
	i32 184, ; 342
	i32 211, ; 343
	i32 101, ; 344
	i32 123, ; 345
	i32 179, ; 346
	i32 163, ; 347
	i32 167, ; 348
	i32 39, ; 349
	i32 17, ; 350
	i32 171, ; 351
	i32 190, ; 352
	i32 137, ; 353
	i32 150, ; 354
	i32 174, ; 355
	i32 155, ; 356
	i32 130, ; 357
	i32 19, ; 358
	i32 191, ; 359
	i32 65, ; 360
	i32 147, ; 361
	i32 47, ; 362
	i32 79, ; 363
	i32 61, ; 364
	i32 106, ; 365
	i32 49, ; 366
	i32 14, ; 367
	i32 174, ; 368
	i32 68, ; 369
	i32 171, ; 370
	i32 202, ; 371
	i32 194, ; 372
	i32 78, ; 373
	i32 108, ; 374
	i32 200, ; 375
	i32 67, ; 376
	i32 63, ; 377
	i32 27, ; 378
	i32 160, ; 379
	i32 182, ; 380
	i32 176, ; 381
	i32 203, ; 382
	i32 198, ; 383
	i32 10, ; 384
	i32 11, ; 385
	i32 78, ; 386
	i32 126, ; 387
	i32 83, ; 388
	i32 66, ; 389
	i32 107, ; 390
	i32 65, ; 391
	i32 128, ; 392
	i32 122, ; 393
	i32 77, ; 394
	i32 8, ; 395
	i32 204, ; 396
	i32 2, ; 397
	i32 44, ; 398
	i32 208, ; 399
	i32 156, ; 400
	i32 128, ; 401
	i32 23, ; 402
	i32 133, ; 403
	i32 0, ; 404
	i32 29, ; 405
	i32 62, ; 406
	i32 178, ; 407
	i32 90, ; 408
	i32 87, ; 409
	i32 148, ; 410
	i32 36, ; 411
	i32 86, ; 412
	i32 50, ; 413
	i32 6, ; 414
	i32 90, ; 415
	i32 21, ; 416
	i32 162, ; 417
	i32 96, ; 418
	i32 50, ; 419
	i32 196, ; 420
	i32 113, ; 421
	i32 130, ; 422
	i32 76, ; 423
	i32 27, ; 424
	i32 212, ; 425
	i32 7, ; 426
	i32 110 ; 427
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

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
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

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

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
