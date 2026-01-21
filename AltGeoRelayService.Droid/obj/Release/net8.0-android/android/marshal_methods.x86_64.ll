; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [93 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [186 x i64] [
	i64 120698629574877762, ; 0: Mono.Android => 0x1accec39cafe242 => 92
	i64 140074891376951025, ; 1: Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.JavaBindings => 0x1f1a55f1e797ef1 => 19
	i64 196720943101637631, ; 2: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 53
	i64 560278790331054453, ; 3: System.Reflection.Primitives => 0x7c6829760de3975 => 70
	i64 750875890346172408, ; 4: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 79
	i64 799765834175365804, ; 5: System.ComponentModel.dll => 0xb1956c9f18442ac => 41
	i64 1010599046655515943, ; 6: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 70
	i64 1073751218545268946, ; 7: Trimble.Ssi.DriverProxy.Common.NET.dll => 0xee6bb0b568898d2 => 12
	i64 1257372209792751434, ; 8: Trimble.Ssi.DriverProxy.Common.NET => 0x1173155ceb25174a => 12
	i64 1268860745194512059, ; 9: System.Drawing.dll => 0x119be62002c19ebb => 49
	i64 1457525410365018655, ; 10: Trimble.EMPOWER.JavaBinding.Droid.dll => 0x143a2ba36fe9921f => 16
	i64 1476839205573959279, ; 11: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 58
	i64 1513467482682125403, ; 12: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 91
	i64 1537168428375924959, ; 13: System.Threading.Thread.dll => 0x15551e8a954ae0df => 79
	i64 1593285203559120070, ; 14: Trimble.Ssi.Components.Core => 0x161c7c737806fcc6 => 7
	i64 1731380447121279447, ; 15: Newtonsoft.Json => 0x18071957e9b889d7 => 3
	i64 1743969030606105336, ; 16: System.Memory.dll => 0x1833d297e88f2af8 => 55
	i64 1767386781656293639, ; 17: System.Private.Uri.dll => 0x188704e9f5582107 => 65
	i64 1769105627832031750, ; 18: Google.Protobuf => 0x188d203205129a06 => 2
	i64 1840303479325186618, ; 19: Trimble.Ssi.Core.dll => 0x198a12439c17da3a => 8
	i64 1875417405349196092, ; 20: System.Drawing.Primitives => 0x1a06d2319b6c713c => 48
	i64 2102659300918482391, ; 21: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 48
	i64 2133195048986300728, ; 22: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 3
	i64 2165725771938924357, ; 23: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 28
	i64 2287834202362508563, ; 24: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 35
	i64 2497223385847772520, ; 25: System.Runtime => 0x22a7eb7046413568 => 75
	i64 2624866290265602282, ; 26: mscorlib.dll => 0x246d65fbde2db8ea => 86
	i64 2632269733008246987, ; 27: System.Net.NameResolution => 0x2487b36034f808cb => 57
	i64 2836692224226108244, ; 28: Trimble.Ssi.Driver.CarpoBased.Driver.RSeries.NET => 0x275df48c6a1c2354 => 20
	i64 2952628965209514592, ; 29: Trimble.Ssi.Interfaces.dll => 0x28f9d86670d7a260 => 14
	i64 3325875462027654285, ; 30: System.Runtime.Numerics => 0x2e27e21c8958b48d => 72
	i64 3328853167529574890, ; 31: System.Net.Sockets.dll => 0x2e327651a008c1ea => 62
	i64 3333980648856470333, ; 32: Trimble.EMPOWER.Common.Droid => 0x2e44adbc671dc33d => 15
	i64 3412765936396324931, ; 33: Trimble.Ssi.DriverCommon.Interfaces.NET.dll => 0x2f5c94899c74d043 => 10
	i64 3531994851595924923, ; 34: System.Numerics => 0x31042a9aade235bb => 63
	i64 3551103847008531295, ; 35: System.Private.CoreLib.dll => 0x31480e226177735f => 88
	i64 3571415421602489686, ; 36: System.Runtime.dll => 0x319037675df7e556 => 75
	i64 3647754201059316852, ; 37: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 83
	i64 3648960364718861714, ; 38: EM940Lib-Mono-Android.dll => 0x32a3b61e628c2d92 => 1
	i64 3716579019761409177, ; 39: netstandard.dll => 0x3393f0ed5c8c5c99 => 87
	i64 3933965368022646939, ; 40: System.Net.Requests => 0x369840a8bfadc09b => 59
	i64 3966267475168208030, ; 41: System.Memory => 0x370b03412596249e => 55
	i64 4009997192427317104, ; 42: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 74
	i64 4073500526318903918, ; 43: System.Private.Xml.dll => 0x3887fb25779ae26e => 67
	i64 4154383907710350974, ; 44: System.ComponentModel => 0x39a7562737acb67e => 41
	i64 4167269041631776580, ; 45: System.Threading.ThreadPool => 0x39d51d1d3df1cf44 => 80
	i64 4187479170553454871, ; 46: System.Linq.Expressions => 0x3a1cea1e912fa117 => 53
	i64 4205801962323029395, ; 47: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 40
	i64 4574894122442396495, ; 48: Trimble.Ssi.DriverManagement.NET.dll => 0x3f7d49f72d33934f => 11
	i64 4809057822547766521, ; 49: System.Drawing => 0x42bd349c3145ecf9 => 49
	i64 4814660307502931973, ; 50: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 57
	i64 5103417709280584325, ; 51: System.Collections.Specialized => 0x46d2fb5e161b6285 => 37
	i64 5182934613077526976, ; 52: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 37
	i64 5203618020066742981, ; 53: Xamarin.Essentials => 0x4836f704f0e652c5 => 30
	i64 5507995362134886206, ; 54: System.Core.dll => 0x4c705499688c873e => 43
	i64 5517297753249125880, ; 55: AIDLService.dll => 0x4c9161131e7995f8 => 4
	i64 5570799893513421663, ; 56: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 51
	i64 5573260873512690141, ; 57: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 76
	i64 5682114405122467582, ; 58: Trimble.Licensing.Interfaces.dll => 0x4edaecf2427466fe => 5
	i64 5689324854860274080, ; 59: AltGeoRelayService.Droid => 0x4ef48acfe9bf59a0 => 33
	i64 5979151488806146654, ; 60: System.Formats.Asn1 => 0x52fa3699a489d25e => 50
	i64 6264691207911888601, ; 61: Trimble.EMPOWER.Manager.Droid.dll => 0x56f0a7763b19d6d9 => 17
	i64 6284145129771520194, ; 62: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 68
	i64 6357457916754632952, ; 63: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 0
	i64 6504860066809920875, ; 64: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 28
	i64 6670293004297032482, ; 65: Trimble.LicensingV2.NET.dll => 0x5c91a4258ce5d322 => 6
	i64 6674897089302588469, ; 66: Trimble.Ssi.DriverProxy.Gnss.NET => 0x5ca1ff89a02b6c35 => 24
	i64 6692274143064415497, ; 67: Trimble.Ssi.DriverCommon.Interfaces.Gnss.NET.dll => 0x5cdfbbe03ce2dd09 => 23
	i64 6766838998325427728, ; 68: Trimble.TDDTransformation.NET => 0x5de8a4377b727e10 => 27
	i64 6786606130239981554, ; 69: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 47
	i64 6814185388980153342, ; 70: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 84
	i64 6866759973250584829, ; 71: Trimble.Licensing.Interfaces => 0x5f4ba1d06378d0fd => 5
	i64 6876862101832370452, ; 72: System.Xml.Linq => 0x5f6f85a57d108914 => 82
	i64 7083547580668757502, ; 73: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 66
	i64 7193382460334273206, ; 74: CatalystFacade.NET => 0x63d4073c49bff2b6 => 31
	i64 7270811800166795866, ; 75: System.Linq => 0x64e71ccf51a90a5a => 54
	i64 7273322646089545850, ; 76: Trimble.Ssi.Driver.MockGnss.NET => 0x64f0086930f8b87a => 22
	i64 7377312882064240630, ; 77: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 40
	i64 7481948808415908457, ; 78: Trimble.Ssi.Driver.CarpoBased.Driver.RSeries.NET.dll => 0x67d538ccd9499269 => 20
	i64 7488575175965059935, ; 79: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 82
	i64 7489048572193775167, ; 80: System.ObjectModel => 0x67ee71ff6b419e3f => 64
	i64 7508562163349786002, ; 81: Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.JavaBindings.dll => 0x6833c58168670d92 => 19
	i64 7575836358607197752, ; 82: Trimble.Ssi.DriverCommon.Interfaces.NET => 0x6922c70797455638 => 10
	i64 7637365915383206639, ; 83: Xamarin.Essentials.dll => 0x69fd5fd5e61792ef => 30
	i64 7654504624184590948, ; 84: System.Net.Http => 0x6a3a4366801b8264 => 56
	i64 7714652370974252055, ; 85: System.Private.CoreLib => 0x6b0ff375198b9c17 => 88
	i64 7735176074855944702, ; 86: Microsoft.CSharp => 0x6b58dda848e391fe => 34
	i64 7839064162908321495, ; 87: Trimble.Ssi.Drivers.Common.NET.dll => 0x6cc9f352b1a536d7 => 13
	i64 8064050204834738623, ; 88: System.Collections.dll => 0x6fe942efa61731bf => 38
	i64 8087206902342787202, ; 89: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 45
	i64 8167236081217502503, ; 90: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 89
	i64 8185542183669246576, ; 91: System.Collections => 0x7198e33f4794aa70 => 38
	i64 8368701292315763008, ; 92: System.Security.Cryptography => 0x7423997c6fd56140 => 76
	i64 8410671156615598628, ; 93: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 69
	i64 8547174171519436312, ; 94: Trimble.EMPOWER.Common.Droid.dll => 0x769da99fc6cf4618 => 15
	i64 8563666267364444763, ; 95: System.Private.Uri => 0x76d841191140ca5b => 65
	i64 8626175481042262068, ; 96: Java.Interop => 0x77b654e585b55834 => 89
	i64 8633036388224324580, ; 97: Trimble.Ssi.Interfaces => 0x77ceb4daf521d3e4 => 14
	i64 8638972117149407195, ; 98: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 34
	i64 8725526185868997716, ; 99: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 45
	i64 8867513702165897114, ; 100: CatalystFacade.NET.Droid => 0x7b0fbcbae281df9a => 32
	i64 8895951724003829430, ; 101: Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.Android.dll => 0x7b74c4f5d045a6b6 => 18
	i64 8941376889969657626, ; 102: System.Xml.XDocument => 0x7c1626e87187471a => 84
	i64 8950774829024100261, ; 103: Trimble.EMPOWER.Manager.Droid => 0x7c378a48a47d3fa5 => 17
	i64 8952205747321061047, ; 104: Trimble.Ssi.DriverCommon.Interfaces.Gnss.NET => 0x7c3c9fb245483eb7 => 23
	i64 9624820285633993679, ; 105: AltGeoRelayService.Droid.dll => 0x85923b0e28301bcf => 33
	i64 9632101313172962083, ; 106: Trimble.Ssi.Driver.MockGnss.NET.dll => 0x85ac191c7c3f7b23 => 22
	i64 9659729154652888475, ; 107: System.Text.RegularExpressions => 0x860e407c9991dd9b => 78
	i64 9662334977499516867, ; 108: System.Numerics.dll => 0x8617827802b0cfc3 => 63
	i64 9667360217193089419, ; 109: System.Diagnostics.StackTrace => 0x86295ce5cd89898b => 46
	i64 9702891218465930390, ; 110: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 36
	i64 9808709177481450983, ; 111: Mono.Android.dll => 0x881f890734e555e7 => 92
	i64 10038780035334861115, ; 112: System.Net.Http.dll => 0x8b50e941206af13b => 56
	i64 10051358222726253779, ; 113: System.Private.Xml => 0x8b7d990c97ccccd3 => 67
	i64 10236703004850800690, ; 114: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 61
	i64 10245369515835430794, ; 115: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 69
	i64 10364469296367737616, ; 116: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 68
	i64 10430153318873392755, ; 117: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 29
	i64 10662219418612303395, ; 118: Trimble.Ssi.DriverCommon.Core.NET => 0x93f7d01203a88623 => 9
	i64 10779136763836825880, ; 119: Trimble.Ssi.DriverProxy.Gnss.NET.dll => 0x95972fc6c1d90118 => 24
	i64 10785150219063592792, ; 120: System.Net.Primitives => 0x95ac8cfb68830758 => 58
	i64 11023048688141570732, ; 121: System.Core => 0x98f9bc61168392ac => 43
	i64 11203073507885195700, ; 122: Trimble.Ssi.Core => 0x9b794fffbe1621b4 => 8
	i64 11446671985764974897, ; 123: Mono.Android.Export => 0x9edabf8623efc131 => 90
	i64 11485890710487134646, ; 124: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 71
	i64 11597940890313164233, ; 125: netstandard => 0xa0f429ca8d1805c9 => 87
	i64 11656044835872886233, ; 126: Trimble.EMPOWER.JavaBinding.Droid => 0xa1c29705983acdd9 => 16
	i64 11963025891960411283, ; 127: Trimble.TDDTransformation.NET.dll => 0xa60534aa7919d493 => 27
	i64 12040886584167504988, ; 128: System.Net.ServicePoint => 0xa719d28d8e121c5c => 61
	i64 12201331334810686224, ; 129: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 74
	i64 12309273434487086027, ; 130: Trimble.Ssi.DriverManagement.NET => 0xaad352f8a9c15bcb => 11
	i64 12475113361194491050, ; 131: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 0
	i64 12502951974429290121, ; 132: Trimble.Ssi.DriverCommon.Core.NET.dll => 0xad836893c7a06e89 => 9
	i64 12517810545449516888, ; 133: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 47
	i64 12550430181894122309, ; 134: Trimble.Ssi.Interfaces.Gnss.dll => 0xae2c15c16223eb45 => 26
	i64 12550732019250633519, ; 135: System.IO.Compression => 0xae2d28465e8e1b2f => 52
	i64 12699999919562409296, ; 136: System.Diagnostics.StackTrace.dll => 0xb03f76a3ad01c550 => 46
	i64 12708922737231849740, ; 137: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 77
	i64 12892835379789747377, ; 138: CatalystFacade.NET.Droid.dll => 0xb2ec8d77fff4d4b1 => 32
	i64 13068258254871114833, ; 139: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 73
	i64 13343850469010654401, ; 140: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 91
	i64 13717397318615465333, ; 141: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 39
	i64 13771327306989888538, ; 142: Trimble.Ssi.Interfaces.Gnss => 0xbf1d9538dac4e41a => 26
	i64 13823759128159171198, ; 143: Trimble.Ssi.Driver.CarpoBased.Driver.SP80.NET.dll => 0xbfd7dbaf867db27e => 21
	i64 13853993852186483133, ; 144: EM940Lib-Mono-Android => 0xc0434601c80559bd => 1
	i64 13881769479078963060, ; 145: System.Console.dll => 0xc0a5f3cade5c6774 => 42
	i64 14038858762917816341, ; 146: Trimble.Ssi.Drivers.Gnss.NET => 0xc2d40ba9ef98a815 => 25
	i64 14125464355221830302, ; 147: System.Threading.dll => 0xc407bafdbc707a9e => 81
	i64 14254574811015963973, ; 148: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 77
	i64 14461014870687870182, ; 149: System.Net.Requests.dll => 0xc8afd8683afdece6 => 59
	i64 14622043554576106986, ; 150: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 73
	i64 14987728460634540364, ; 151: System.IO.Compression.dll => 0xcfff1ba06622494c => 52
	i64 15015154896917945444, ; 152: System.Net.Security.dll => 0xd0608bd33642dc64 => 60
	i64 15076659072870671916, ; 153: System.ObjectModel.dll => 0xd13b0d8c1620662c => 64
	i64 15115185479366240210, ; 154: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 51
	i64 15133485256822086103, ; 155: System.Linq.dll => 0xd204f0a9127dd9d7 => 54
	i64 15352745422631309647, ; 156: Trimble.LicensingV2.NET => 0xd50fe89e9af1914f => 6
	i64 15370334346939861994, ; 157: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 29
	i64 15439535221505717392, ; 158: AIDLService => 0xd6443f7b56faf490 => 4
	i64 15527772828719725935, ; 159: System.Console => 0xd77dbb1e38cd3d6f => 42
	i64 15557562860424774966, ; 160: System.Net.Sockets => 0xd7e790fe7a6dc536 => 62
	i64 15609085926864131306, ; 161: System.dll => 0xd89e9cf3334914ea => 85
	i64 15661133872274321916, ; 162: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 83
	i64 16154507427712707110, ; 163: System => 0xe03056ea4e39aa26 => 85
	i64 16219561732052121626, ; 164: System.Net.Security => 0xe1177575db7c781a => 60
	i64 16496768397145114574, ; 165: Mono.Android.Export.dll => 0xe4f04b741db987ce => 90
	i64 16520624188192642183, ; 166: Trimble.Ssi.Driver.CarpoBased.Driver.SP80.NET => 0xe5450c2b4cf2d487 => 21
	i64 16659816010386973303, ; 167: Trimble.Ssi.Drivers.Gnss.NET.dll => 0xe7338e64da7b2277 => 25
	i64 16833383113903931215, ; 168: mscorlib => 0xe99c30c1484d7f4f => 86
	i64 16856067890322379635, ; 169: System.Data.Common.dll => 0xe9ecc87060889373 => 44
	i64 16890310621557459193, ; 170: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 78
	i64 17008137082415910100, ; 171: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 36
	i64 17062143951396181894, ; 172: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 39
	i64 17230721278011714856, ; 173: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 66
	i64 17260702271250283638, ; 174: System.Data.Common => 0xef8a5543bba6bc76 => 44
	i64 17399129415912995047, ; 175: CatalystFacade.NET.dll => 0xf1762004ec8b38e7 => 31
	i64 17553799493972570483, ; 176: Google.Protobuf.dll => 0xf39b9fa2c0aab173 => 2
	i64 17584771863047707195, ; 177: Trimble.Ssi.Drivers.Common.NET => 0xf409a8d7613e1a3b => 13
	i64 17712670374920797664, ; 178: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 71
	i64 17777860260071588075, ; 179: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 72
	i64 18025913125965088385, ; 180: System.Threading => 0xfa28e87b91334681 => 81
	i64 18123327041412273232, ; 181: Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.Android => 0xfb82fdec339c1450 => 18
	i64 18146411883821974900, ; 182: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 50
	i64 18225059387460068507, ; 183: System.Threading.ThreadPool.dll => 0xfcec6af3cff4a49b => 80
	i64 18245806341561545090, ; 184: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 35
	i64 18395692028899152159 ; 185: Trimble.Ssi.Components.Core.dll => 0xff4aa06f8c04d11f => 7
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [186 x i32] [
	i32 92, ; 0
	i32 19, ; 1
	i32 53, ; 2
	i32 70, ; 3
	i32 79, ; 4
	i32 41, ; 5
	i32 70, ; 6
	i32 12, ; 7
	i32 12, ; 8
	i32 49, ; 9
	i32 16, ; 10
	i32 58, ; 11
	i32 91, ; 12
	i32 79, ; 13
	i32 7, ; 14
	i32 3, ; 15
	i32 55, ; 16
	i32 65, ; 17
	i32 2, ; 18
	i32 8, ; 19
	i32 48, ; 20
	i32 48, ; 21
	i32 3, ; 22
	i32 28, ; 23
	i32 35, ; 24
	i32 75, ; 25
	i32 86, ; 26
	i32 57, ; 27
	i32 20, ; 28
	i32 14, ; 29
	i32 72, ; 30
	i32 62, ; 31
	i32 15, ; 32
	i32 10, ; 33
	i32 63, ; 34
	i32 88, ; 35
	i32 75, ; 36
	i32 83, ; 37
	i32 1, ; 38
	i32 87, ; 39
	i32 59, ; 40
	i32 55, ; 41
	i32 74, ; 42
	i32 67, ; 43
	i32 41, ; 44
	i32 80, ; 45
	i32 53, ; 46
	i32 40, ; 47
	i32 11, ; 48
	i32 49, ; 49
	i32 57, ; 50
	i32 37, ; 51
	i32 37, ; 52
	i32 30, ; 53
	i32 43, ; 54
	i32 4, ; 55
	i32 51, ; 56
	i32 76, ; 57
	i32 5, ; 58
	i32 33, ; 59
	i32 50, ; 60
	i32 17, ; 61
	i32 68, ; 62
	i32 0, ; 63
	i32 28, ; 64
	i32 6, ; 65
	i32 24, ; 66
	i32 23, ; 67
	i32 27, ; 68
	i32 47, ; 69
	i32 84, ; 70
	i32 5, ; 71
	i32 82, ; 72
	i32 66, ; 73
	i32 31, ; 74
	i32 54, ; 75
	i32 22, ; 76
	i32 40, ; 77
	i32 20, ; 78
	i32 82, ; 79
	i32 64, ; 80
	i32 19, ; 81
	i32 10, ; 82
	i32 30, ; 83
	i32 56, ; 84
	i32 88, ; 85
	i32 34, ; 86
	i32 13, ; 87
	i32 38, ; 88
	i32 45, ; 89
	i32 89, ; 90
	i32 38, ; 91
	i32 76, ; 92
	i32 69, ; 93
	i32 15, ; 94
	i32 65, ; 95
	i32 89, ; 96
	i32 14, ; 97
	i32 34, ; 98
	i32 45, ; 99
	i32 32, ; 100
	i32 18, ; 101
	i32 84, ; 102
	i32 17, ; 103
	i32 23, ; 104
	i32 33, ; 105
	i32 22, ; 106
	i32 78, ; 107
	i32 63, ; 108
	i32 46, ; 109
	i32 36, ; 110
	i32 92, ; 111
	i32 56, ; 112
	i32 67, ; 113
	i32 61, ; 114
	i32 69, ; 115
	i32 68, ; 116
	i32 29, ; 117
	i32 9, ; 118
	i32 24, ; 119
	i32 58, ; 120
	i32 43, ; 121
	i32 8, ; 122
	i32 90, ; 123
	i32 71, ; 124
	i32 87, ; 125
	i32 16, ; 126
	i32 27, ; 127
	i32 61, ; 128
	i32 74, ; 129
	i32 11, ; 130
	i32 0, ; 131
	i32 9, ; 132
	i32 47, ; 133
	i32 26, ; 134
	i32 52, ; 135
	i32 46, ; 136
	i32 77, ; 137
	i32 32, ; 138
	i32 73, ; 139
	i32 91, ; 140
	i32 39, ; 141
	i32 26, ; 142
	i32 21, ; 143
	i32 1, ; 144
	i32 42, ; 145
	i32 25, ; 146
	i32 81, ; 147
	i32 77, ; 148
	i32 59, ; 149
	i32 73, ; 150
	i32 52, ; 151
	i32 60, ; 152
	i32 64, ; 153
	i32 51, ; 154
	i32 54, ; 155
	i32 6, ; 156
	i32 29, ; 157
	i32 4, ; 158
	i32 42, ; 159
	i32 62, ; 160
	i32 85, ; 161
	i32 83, ; 162
	i32 85, ; 163
	i32 60, ; 164
	i32 90, ; 165
	i32 21, ; 166
	i32 25, ; 167
	i32 86, ; 168
	i32 44, ; 169
	i32 78, ; 170
	i32 36, ; 171
	i32 39, ; 172
	i32 66, ; 173
	i32 44, ; 174
	i32 31, ; 175
	i32 2, ; 176
	i32 13, ; 177
	i32 71, ; 178
	i32 72, ; 179
	i32 81, ; 180
	i32 18, ; 181
	i32 50, ; 182
	i32 80, ; 183
	i32 35, ; 184
	i32 7 ; 185
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

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
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

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
