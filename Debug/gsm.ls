   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
   5                     .const:	section	.text
   6  0000               _aucAtPAscii_Question:
   7  0000 3f00          	dc.b	"?",0
   8  0002               _aucAtPAscii_1:
   9  0002 3100          	dc.b	"1",0
  10  0004               _aucAtPAscii_0:
  11  0004 3000          	dc.b	"0",0
  12  0006               _aucAtPAscii_Equal1:
  13  0006 3d3100        	dc.b	"=1",0
  14  0009               _aucAtPAscii_Equal0:
  15  0009 3d3000        	dc.b	"=0",0
  16  000c               _aucAtPBaudrate:
  17  000c 353736303000  	dc.b	"57600",0
  18  0012               _aucAtPTimeServer1:
  19  0012 3d22          	dc.b	"=",34
  20  0014 74696d652e6e  	dc.b	"time.nist.gov",34,0
  21  0023               _aucAtPTimeServer2:
  22  0023 3d22          	dc.b	"=",34
  23  0025 74696d652e77  	dc.b	"time.windows.com",34,0
  24  0037               _aucAtPPort2:
  25  0037 223333303033  	dc.b	34,51,51,48,48,51
  26  003d 2200          	dc.b	34,0
  27  003f               _aucAtrInit:
  28  003f 2b5042524541  	dc.b	"+PBREADY",0
  29  0048               _aucAtrPppFail:
  30  0048 534f434b4554  	dc.b	"SOCKETS: IPR STOPP"
  31  005a 454400        	dc.b	"ED",0
  32  005d               _aucAtrCclk:
  33  005d 2b43434c4b3a  	dc.b	"+CCLK: ",34,0
  34  0066               _aucAtrCpinReady:
  35  0066 2b4350494e3a  	dc.b	"+CPIN: READY",0
  36  0073               _aucAtrCreg:
  37  0073 2b435245473a  	dc.b	"+CREG:",0
  38  007a               _aucAtrNeoway:
  39  007a 4e454f574159  	dc.b	"NEOWAY",0
  40  0081               _aucAtrOk:
  41  0081 4f4b00        	dc.b	"OK",0
  42  0084               _aucAtrXiic:
  43  0084 2b584949433a  	dc.b	"+XIIC:",0
  44  008b               _aucAtrTcpsetup:
  45  008b 2b5443505345  	dc.b	"+TCPSETUP:",0
  46  0096               _aucAtrTcpsend:
  47  0096 3e00          	dc.b	">",0
  48  0098               _aucAtrTcprecv:
  49  0098 2b5443505245  	dc.b	"+TCPRECV:",0
  50  00a2               _aucAtrTcpclose:
  51  00a2 2b544350434c  	dc.b	"+TCPCLOSE:",0
  52  00ad               _aucAtrIpr:
  53  00ad 2b4950523d33  	dc.b	"+IPR=38400",0
  54  00b8               _aucAtrError:
  55  00b8 4552524f5200  	dc.b	"ERROR",0
  56  00be               _aucAtInit:
  57  00be 2b5042524541  	dc.b	"+PBREADY",0
  58  00c7               _aucAtNull:
  59  00c7 00            	dc.b	0
  60  00c8               _aucATS_A:
  61  00c8 412f00        	dc.b	"A/",0
  62  00cb               _aucATS_E:
  63  00cb 4500          	dc.b	"E",0
  64  00cd               _aucATS_V:
  65  00cd 265600        	dc.b	"&V",0
  66  00d0               _aucATS_W:
  67  00d0 265700        	dc.b	"&W",0
  68  00d3               _aucAtS_D2:
  69  00d3 26443200      	dc.b	"&D2",0
  70  00d7               _aucAtS_Plus:
  71  00d7 2b2b2b00      	dc.b	"+++",0
  72  00db               _aucAtS_O:
  73  00db 4f00          	dc.b	"O",0
  74  00dd               _aucAtS_D:
  75  00dd 442a39392300  	dc.b	"D*99#",0
  76  00e3               _aucAtI:
  77  00e3 4900          	dc.b	"I",0
  78  00e5               _aucAtCcid:
  79  00e5 2b4343494400  	dc.b	"+CCID",0
  80  00eb               _aucAtCgmi:
  81  00eb 2b43474d4900  	dc.b	"+CGMI",0
  82  00f1               _aucAtCgmm:
  83  00f1 2b43474d4d00  	dc.b	"+CGMM",0
  84  00f7               _aucAtCgsn:
  85  00f7 2b4347534e00  	dc.b	"+CGSN",0
  86  00fd               _aucAtCimi:
  87  00fd 2b43494d4900  	dc.b	"+CIMI",0
  88  0103               _aucAtGetvers:
  89  0103 2b4745545645  	dc.b	"+GETVERS",0
  90  010c               _aucAtCclk:
  91  010c 2b43434c4b3f  	dc.b	"+CCLK?",0
  92  0113               _aucAtCeer:
  93  0113 2b4345455200  	dc.b	"+CEER",0
  94  0119               _aucAtCfun:
  95  0119 2b4346554e00  	dc.b	"+CFUN",0
  96  011f               _aucAtCipstatus:
  97  011f 2b4349505354  	dc.b	"+CIPSTATUS",0
  98  012a               _aucAtClck:
  99  012a 2b434c434b00  	dc.b	"+CLCK",0
 100  0130               _aucAtCmee:
 101  0130 2b434d454500  	dc.b	"+CMEE",0
 102  0136               _aucAtCmux:
 103  0136 2b434d555800  	dc.b	"+CMUX",0
 104  013c               _aucAtCpas:
 105  013c 2b4350415300  	dc.b	"+CPAS",0
 106  0142               _aucAtCpin:
 107  0142 2b4350494e3f  	dc.b	"+CPIN?",0
 108  0149               _aucAtCpwd:
 109  0149 2b4350574400  	dc.b	"+CPWD",0
 110  014f               _aucAtCpwroff:
 111  014f 2b43504f4600  	dc.b	"+CPOF",0
 112  0155               _aucAtCreg:
 113  0155 2b435245473f  	dc.b	"+CREG?",0
 114  015c               _aucAtEnpwrsavE:
 115  015c 2b454e505752  	dc.b	"+ENPWRSAVE",0
 116  0167               _aucAtIcf:
 117  0167 2b49434600    	dc.b	"+ICF",0
 118  016c               _aucAtIpr:
 119  016c 2b4950523d31  	dc.b	"+IPR=19200",0
 120  0177               _aucAtCops:
 121  0177 2b434f50533f  	dc.b	"+COPS?",0
 122  017e               _aucAtCsq:
 123  017e 2b43535100    	dc.b	"+CSQ",0
 124  0183               _aucAtXbandsel:
 125  0183 2b5842414e44  	dc.b	"+XBANDSEL",0
 126  018d               _aucAtCmgd:
 127  018d 2b434d474400  	dc.b	"+CMGD",0
 128  0193               _aucAtCmgf:
 129  0193 2b434d474600  	dc.b	"+CMGF",0
 130  0199               _aucAtCmgl:
 131  0199 2b434d474c00  	dc.b	"+CMGL",0
 132  019f               _aucAtCmgr:
 133  019f 2b434d475200  	dc.b	"+CMGR",0
 134  01a5               _aucAtCmgs:
 135  01a5 2b434d475300  	dc.b	"+CMGS",0
 136  01ab               _aucAtCmgw:
 137  01ab 2b434d475700  	dc.b	"+CMGW",0
 138  01b1               _aucAtCmss:
 139  01b1 2b434d535300  	dc.b	"+CMSS",0
 140  01b7               _aucAtCnmi:
 141  01b7 2b434e4d4900  	dc.b	"+CNMI",0
 142  01bd               _aucAtCpms:
 143  01bd 2b43504d5300  	dc.b	"+CPMS",0
 144  01c3               _aucAtCsca:
 145  01c3 2b4353434100  	dc.b	"+CSCA",0
 146  01c9               _aucAtCscb:
 147  01c9 2b4353434200  	dc.b	"+CSCB",0
 148  01cf               _aucAtCscs:
 149  01cf 2b4353435300  	dc.b	"+CSCS",0
 150  01d5               _aucAtCsdh:
 151  01d5 2b4353444800  	dc.b	"+CSDH",0
 152  01db               _aucAtCsmp:
 153  01db 2b43534d5000  	dc.b	"+CSMP",0
 154  01e1               _aucAtCsms:
 155  01e1 2b43534d5300  	dc.b	"+CSMS",0
 156  01e7               _aucAtCnum:
 157  01e7 2b434e554d00  	dc.b	"+CNUM",0
 158  01ed               _aucAtCpbf:
 159  01ed 2b4350424600  	dc.b	"+CPBF",0
 160  01f3               _aucAtCpbr:
 161  01f3 2b4350425200  	dc.b	"+CPBR",0
 162  01f9               _aucAtCpbs:
 163  01f9 2b4350425300  	dc.b	"+CPBS",0
 164  01ff               _aucAtCpbw:
 165  01ff 2b4350425700  	dc.b	"+CPBW",0
 166  0205               _aucAtPdpCm:
 167  0205 2b434744434f  	dc.b	"+CGDCONT=1,",34
 168  0211 495022        	dc.b	"IP",34
 169  0214 2c22          	dc.b	",",34
 170  0216 434d4e455422  	dc.b	"CMNET",34,0
 171  021d               _aucAtPdpUn:
 172  021d 2b434744434f  	dc.b	"+CGDCONT=1,",34
 173  0229 495022        	dc.b	"IP",34
 174  022c 2c22          	dc.b	",",34
 175  022e 554e494e4554  	dc.b	"UNINET",34,0
 176  0236               _aucAtCgatt:
 177  0236 2b4347415454  	dc.b	"+CGATT=",0
 178  023e               _aucAtCusd:
 179  023e 2b4355534400  	dc.b	"+CUSD",0
 180  0244               _aucAtIpstatus:
 181  0244 2b4950535441  	dc.b	"+IPSTATUS",0
 182  024e               _aucAtTcprecv:
 183  024e 2b5443505245  	dc.b	"+TCPRECV",0
 184  0257               _aucAtTcpsend:
 185  0257 2b4349505345  	dc.b	"+CIPSEND=",0
 186  0261               _aucAtTcpsetup:
 187  0261 2b6369707374  	dc.b	"+cipstart=",34
 188  026c 54435022      	dc.b	"TCP",34
 189  0270 2c00          	dc.b	",",0
 190  0272               _aucAtXgauth:
 191  0272 2b435354543d  	dc.b	"+CSTT=",0
 192  0279               _aucAtTcpclose:
 193  0279 2b434950434c  	dc.b	"+CIPCLOSE",0
 194  0283               _aucAtUdpclose:
 195  0283 2b554450434c  	dc.b	"+UDPCLOSE",0
 196  028d               _aucAtUdprecv:
 197  028d 2b5544505245  	dc.b	"+UDPRECV",0
 198  0296               _aucAtUdpsend:
 199  0296 2b5544505345  	dc.b	"+UDPSEND",0
 200  029f               _aucAtUdpsetup:
 201  029f 2b5544505345  	dc.b	"+UDPSETUP",0
 202  02a9               _aucAtXiic:
 203  02a9 2b4349465352  	dc.b	"+CIFSR",0
 204  02b0               _aucAtXisp:
 205  02b0 2b4349494352  	dc.b	"+CIICR",0
 206  02b7               _aucAtDns:
 207  02b7 2b444e5300    	dc.b	"+DNS",0
 208  02bc               _aucAtDnsserver:
 209  02bc 2b444e535345  	dc.b	"+DNSSERVER",0
 210  02c7               _aucAtFtpget:
 211  02c7 2b4654504745  	dc.b	"+FTPGET",0
 212  02cf               _aucAtFtplogin:
 213  02cf 2b4654504c4f  	dc.b	"+FTPLOGIN",0
 214  02d9               _aucAtFtplogout:
 215  02d9 2b4654504c4f  	dc.b	"+FTPLOGOUT",0
 216  02e4               _aucAtFtpput:
 217  02e4 2b4654505055  	dc.b	"+FTPPUT",0
 218  02ec               _aucAtFtpstatus:
 219  02ec 2b4654505354  	dc.b	"+FTPSTATUS",0
 220  02f7               _aucAtClientstatus:
 221  02f7 2b434c49454e  	dc.b	"+CLIENTSTATUS",0
 222  0305               _aucAtCloseclient:
 223  0305 2b434c4f5345  	dc.b	"+CLOSECLIENT",0
 224  0312               _aucAtCloselisten:
 225  0312 2b434c4f5345  	dc.b	"+CLOSELISTEN",0
 226  031f               _aucAtGprsstatus:
 227  031f 2b4750525353  	dc.b	"+GPRSSTATUS",0
 228  032b               _aucAtSignal:
 229  032b 2b5349474e41  	dc.b	"+SIGNAL",0
 230  0333               _aucAtTcplisten:
 231  0333 2b5443504c49  	dc.b	"+TCPLISTEN",0
 232  033e               _aucAtTcprecv_S:
 233  033e 2b5443505245  	dc.b	"+TCPRECV(S)",0
 234  034a               _aucAtTcpsends:
 235  034a 2b5443505345  	dc.b	"+TCPSENDS",0
 236  0354               _aucAtMycged:
 237  0354 244d59434745  	dc.b	"$MYCGED",0
 238  035c               _aucAtMylacid:
 239  035c 244d594c4143  	dc.b	"$MYLACID",0
 240  0365               _aucAtMytimeupdate:
 241  0365 244d5954494d  	dc.b	"$MYTIMEUPDATE",0
 242  0373               _aucAtShutDown:
 243  0373 434950534855  	dc.b	"CIPSHUT",0
 244  037b               _aucAtCmd:
 245  037b 00c7          	dc.w	_aucAtNull
 246  037d 00cb          	dc.w	_aucATS_E
 247  037f 00c7          	dc.w	_aucAtNull
 248  0381 00c7          	dc.w	_aucAtNull
 249  0383 00c7          	dc.w	_aucAtNull
 250  0385 00c7          	dc.w	_aucAtNull
 251  0387 00c7          	dc.w	_aucAtNull
 252  0389 00dd          	dc.w	_aucAtS_D
 253  038b 00e3          	dc.w	_aucAtI
 254  038d 00e5          	dc.w	_aucAtCcid
 255  038f 00eb          	dc.w	_aucAtCgmi
 256  0391 00f1          	dc.w	_aucAtCgmm
 257  0393 00f7          	dc.w	_aucAtCgsn
 258  0395 00fd          	dc.w	_aucAtCimi
 259  0397 0103          	dc.w	_aucAtGetvers
 260  0399 010c          	dc.w	_aucAtCclk
 261  039b 00c7          	dc.w	_aucAtNull
 262  039d 00c7          	dc.w	_aucAtNull
 263  039f 00c7          	dc.w	_aucAtNull
 264  03a1 00c7          	dc.w	_aucAtNull
 265  03a3 00c7          	dc.w	_aucAtNull
 266  03a5 00c7          	dc.w	_aucAtNull
 267  03a7 00c7          	dc.w	_aucAtNull
 268  03a9 0142          	dc.w	_aucAtCpin
 269  03ab 0149          	dc.w	_aucAtCpwd
 270  03ad 014f          	dc.w	_aucAtCpwroff
 271  03af 0155          	dc.w	_aucAtCreg
 272  03b1 00c7          	dc.w	_aucAtNull
 273  03b3 00c7          	dc.w	_aucAtNull
 274  03b5 016c          	dc.w	_aucAtIpr
 275  03b7 0177          	dc.w	_aucAtCops
 276  03b9 017e          	dc.w	_aucAtCsq
 277  03bb 00c7          	dc.w	_aucAtNull
 278  03bd 018d          	dc.w	_aucAtCmgd
 279  03bf 00c7          	dc.w	_aucAtNull
 280  03c1 00c7          	dc.w	_aucAtNull
 281  03c3 00c7          	dc.w	_aucAtNull
 282  03c5 00c7          	dc.w	_aucAtNull
 283  03c7 00c7          	dc.w	_aucAtNull
 284  03c9 00c7          	dc.w	_aucAtNull
 285  03cb 00c7          	dc.w	_aucAtNull
 286  03cd 00c7          	dc.w	_aucAtNull
 287  03cf 01c3          	dc.w	_aucAtCsca
 288  03d1 01c9          	dc.w	_aucAtCscb
 289  03d3 00c7          	dc.w	_aucAtNull
 290  03d5 00c7          	dc.w	_aucAtNull
 291  03d7 00c7          	dc.w	_aucAtNull
 292  03d9 00c7          	dc.w	_aucAtNull
 293  03db 00c7          	dc.w	_aucAtNull
 294  03dd 00c7          	dc.w	_aucAtNull
 295  03df 00c7          	dc.w	_aucAtNull
 296  03e1 00c7          	dc.w	_aucAtNull
 297  03e3 00c7          	dc.w	_aucAtNull
 298  03e5 0205          	dc.w	_aucAtPdpCm
 299  03e7 021d          	dc.w	_aucAtPdpUn
 300  03e9 0236          	dc.w	_aucAtCgatt
 301  03eb 023e          	dc.w	_aucAtCusd
 302  03ed 0272          	dc.w	_aucAtXgauth
 303  03ef 0244          	dc.w	_aucAtIpstatus
 304  03f1 0279          	dc.w	_aucAtTcpclose
 305  03f3 00c7          	dc.w	_aucAtNull
 306  03f5 0257          	dc.w	_aucAtTcpsend
 307  03f7 0261          	dc.w	_aucAtTcpsetup
 308  03f9 00c7          	dc.w	_aucAtNull
 309  03fb 00c7          	dc.w	_aucAtNull
 310  03fd 00c7          	dc.w	_aucAtNull
 311  03ff 00c7          	dc.w	_aucAtNull
 312  0401 02a9          	dc.w	_aucAtXiic
 313  0403 02b0          	dc.w	_aucAtXisp
 314  0405 02b7          	dc.w	_aucAtDns
 315  0407 00c7          	dc.w	_aucAtNull
 316  0409 00c7          	dc.w	_aucAtNull
 317  040b 00c7          	dc.w	_aucAtNull
 318  040d 00c7          	dc.w	_aucAtNull
 319  040f 00c7          	dc.w	_aucAtNull
 320  0411 00c7          	dc.w	_aucAtNull
 321  0413 02f7          	dc.w	_aucAtClientstatus
 322  0415 0305          	dc.w	_aucAtCloseclient
 323  0417 0312          	dc.w	_aucAtCloselisten
 324  0419 031f          	dc.w	_aucAtGprsstatus
 325  041b 032b          	dc.w	_aucAtSignal
 326  041d 00c7          	dc.w	_aucAtNull
 327  041f 00c7          	dc.w	_aucAtNull
 328  0421 00c7          	dc.w	_aucAtNull
 329  0423 00c7          	dc.w	_aucAtNull
 330  0425 00c7          	dc.w	_aucAtNull
 331  0427 0365          	dc.w	_aucAtMytimeupdate
 332  0429 0373          	dc.w	_aucAtShutDown
 333  042b               _aucAtRCmd:
 334  042b 003f          	dc.w	_aucAtrInit
 335  042d 0048          	dc.w	_aucAtrPppFail
 336  042f 0081          	dc.w	_aucAtrOk
 337  0431 0066          	dc.w	_aucAtrCpinReady
 338  0433 0073          	dc.w	_aucAtrCreg
 339  0435 0084          	dc.w	_aucAtrXiic
 340  0437 005d          	dc.w	_aucAtrCclk
 341  0439 007a          	dc.w	_aucAtrNeoway
 342  043b 008b          	dc.w	_aucAtrTcpsetup
 343  043d 0096          	dc.w	_aucAtrTcpsend
 344  043f 0098          	dc.w	_aucAtrTcprecv
 345  0441 00a2          	dc.w	_aucAtrTcpclose
 346  0443 00ad          	dc.w	_aucAtrIpr
 347  0445 00b8          	dc.w	_aucAtrError
2846                     	switch	.data
2847  0000               _g_nSignal:
2848  0000 00            	dc.b	0
2849  0001               _g_nApnBuf:
2850  0001 22434d4e4554  	dc.b	34,67,77,78,69,84
2851  0007 2200          	dc.b	34,0
2852  0009 000000000000  	ds.b	12
2853  0015               _g_nUsrBuf:
2854  0015 2247534d2200  	dc.b	34,71,83,77,34,0
2855  001b 000000000000  	ds.b	10
2856  0025               _g_nPwdBuf:
2857  0025 223132333422  	dc.b	34,49,50,51,52,34,0
2858  002c 000000000000  	ds.b	9
2859  0035               _aucAtPServer1:
2860  0035 223138332e36  	dc.b	34,49,56,51,46,54
2861  003b 322e3233322e  	dc.b	"2.232.21",34,0
2862  0045 00000000      	ds.b	4
2863  0049               _aucAtPPort1:
2864  0049 223330303432  	dc.b	34,51,48,48,52,50
2865  004f 2200          	dc.b	34,0
2866  0051               _aucAtPServerBk:
2867  0051 223138332e36  	dc.b	34,49,56,51,46,54
2868  0057 322e3233322e  	dc.b	"2.232.21",34,0
2869  0061 00000000      	ds.b	4
2870  0065               _aucAtPPortBk:
2871  0065 223330303432  	dc.b	34,51,48,48,52,50
2872  006b 2200          	dc.b	34,0
2873                     	switch	.const
2874  0447               _m_nVerBuf:
2875  0447 56            	dc.b	86
2876  0448 30            	dc.b	48
2877  0449 2e            	dc.b	46
2878  044a 31            	dc.b	49
2879  044b 2e            	dc.b	46
2880  044c 30            	dc.b	48
2881  044d 20            	dc.b	32
2882  044e 20            	dc.b	32
2883  044f 31            	dc.b	49
2884  0450 38            	dc.b	56
2885  0451 30            	dc.b	48
2886  0452 34            	dc.b	52
2887  0453 32            	dc.b	50
2888  0454 35            	dc.b	53
2889  0455 30            	dc.b	48
2890  0456 31            	dc.b	49
2891  0457               _m_nPtrcoVerBuf:
2892  0457 56322e333200  	dc.b	"V2.32",0
2893  045d 0000          	ds.b	2
2894                     	switch	.data
2895  006d               _m_nCcidBuf:
2896  006d 00            	dc.b	0
2897  006e 000000000000  	ds.b	23
2898  0085               _m_nImsiBuf:
2899  0085 00            	dc.b	0
2900  0086 000000000000  	ds.b	23
2901  009d               _m_nImsiBufXJ:
2902  009d 00            	dc.b	0
2903  009e 000000000000  	ds.b	7
2904  00a5               _m_nWakeupReportFlg:
2905  00a5 00            	dc.b	0
2906  00a6               _m_nGprsStep:
2907  00a6 00            	dc.b	0
2908  00a7               _m_dwTimeCnt:
2909  00a7 00000000      	dc.l	0
2910  00ab               _g_wTmReportCnt:
2911  00ab 0000          	dc.w	0
2912  00ad               _g_nReportFlg:
2913  00ad 00            	dc.b	0
2914  00ae               _g_OptValveRepFlg:
2915  00ae 00            	dc.b	0
2916  00af               _g_dwCommDelay:
2917  00af 00000000      	dc.l	0
2918  00b3               _g_BatRepFlg:
2919  00b3 01            	dc.b	1
2920  00b4               _g_nDatRepCnt:
2921  00b4 00            	dc.b	0
2922  00b5               _g_dwRepTick:
2923  00b5 00000000      	dc.l	0
2924  00b9               _g_nApnType:
2925  00b9 00            	dc.b	0
2926  00ba               _m_nRepEnableFlg:
2927  00ba 01            	dc.b	1
2928  00bb               _m_nIpAddBk:
2929  00bb 00            	dc.b	0
2930  00bc               _m_nRepIndex:
2931  00bc 00            	dc.b	0
2932  00bd               _m_nRepFailFlg:
2933  00bd 01            	dc.b	1
2934  00be               _m_nDataRepSucFlg:
2935  00be 00            	dc.b	0
2936  00bf               _m_nLedFlashFlg:
2937  00bf 00            	dc.b	0
2938  00c0               _m_nMasterType:
2939  00c0 00            	dc.b	0
2940  00c1               _m_nGmTn_1:
2941  00c1 01            	dc.b	1
2942  00c2               _m_nGmTn_2:
2943  00c2 00            	dc.b	0
2944  00c3               _m_nUploadMode:
2945  00c3 00            	dc.b	0
2946  00c4               _m_nAlmRepFlg:
2947  00c4 00            	dc.b	0
2948  00c5               _g_dwTmAddress:
2949  00c5 00000001      	dc.l	1
2950  00c9               _g_nOwedRepFlg:
2951  00c9 01            	dc.b	1
2952  00ca               L7471_m_nCnt:
2953  00ca 00            	dc.b	0
3008                     ; 186 void  VavleStatTransform(u8 nMasterType, u8 nOldMastVavle, u8* pnNewVavleStat)
3008                     ; 187 {
3010                     	switch	.text
3011  0000               _VavleStatTransform:
3013  0000 89            	pushw	x
3014       00000000      OFST:	set	0
3017                     ; 189 	if(MASTER_NEW == nMasterType)
3019  0001 9e            	ld	a,xh
3020  0002 4a            	dec	a
3021  0003 2615          	jrne	L1002
3022                     ; 191 		if(OLD_VAVLE_CLOSE == nOldMastVavle)
3024  0005 9f            	ld	a,xl
3025  0006 a108          	cp	a,#8
3026  0008 2606          	jrne	L3002
3027                     ; 193 			(*pnNewVavleStat) = VALVE_CLOSE;
3029  000a 1e05          	ldw	x,(OFST+5,sp)
3030  000c a601          	ld	a,#1
3032  000e 2009          	jp	LC001
3033  0010               L3002:
3034                     ; 195 		else if(OLD_VAVLE_ERROR == nOldMastVavle)
3036  0010 7b02          	ld	a,(OFST+2,sp)
3037  0012 4c            	inc	a
3038  0013 2605          	jrne	L1002
3039                     ; 197 			(*pnNewVavleStat) = VALVE_ERROR;
3041  0015 1e05          	ldw	x,(OFST+5,sp)
3042  0017 a603          	ld	a,#3
3043  0019               LC001:
3044  0019 f7            	ld	(x),a
3045  001a               L1002:
3046                     ; 200 }
3049  001a 85            	popw	x
3050  001b 81            	ret	
3103                     ; 210 void  MeterTnNumTransform(u8 nMasterType, u8 *pnNum1, u8 *pnNum2)
3103                     ; 211 {
3104                     	switch	.text
3105  001c               _MeterTnNumTransform:
3107  001c 88            	push	a
3108       00000000      OFST:	set	0
3111                     ; 213 	if(MASTER_NEW == nMasterType)
3113  001d 4a            	dec	a
3114  001e 2609          	jrne	L5302
3115                     ; 215 		(*pnNum1) = 0x01;
3117  0020 1e04          	ldw	x,(OFST+4,sp)
3118  0022 4c            	inc	a
3119  0023 f7            	ld	(x),a
3120                     ; 216 		(*pnNum2) = 0x01;
3122  0024 1e06          	ldw	x,(OFST+6,sp)
3123  0026 f7            	ld	(x),a
3125  0027 2008          	jra	L7302
3126  0029               L5302:
3127                     ; 220 		(*pnNum1) = 0x01;
3129  0029 1e04          	ldw	x,(OFST+4,sp)
3130  002b a601          	ld	a,#1
3131  002d f7            	ld	(x),a
3132                     ; 221 		(*pnNum2) = 0x00;
3134  002e 1e06          	ldw	x,(OFST+6,sp)
3135  0030 7f            	clr	(x)
3136  0031               L7302:
3137                     ; 223 }
3140  0031 84            	pop	a
3141  0032 81            	ret	
3175                     ; 234 void SetLogonMode(u8 nMode)
3175                     ; 235 {
3176                     	switch	.text
3177  0033               _SetLogonMode:
3181                     ; 236 	ucLogonMode = nMode; 
3183  0033 c700d0        	ld	_ucLogonMode,a
3184                     ; 237 	nLogonModeBk = nMode;
3186  0036 c700cf        	ld	_nLogonModeBk,a
3187                     ; 238 	return ;
3190  0039 81            	ret	
3390                     	switch	.const
3391  045f               L02:
3392  045f 00015180      	dc.l	86400
3393                     ; 250 s32 ClaReportTimeToSec(u8 nCycle)
3393                     ; 251 {
3394                     	switch	.text
3395  003a               _ClaReportTimeToSec:
3397  003a 88            	push	a
3398  003b 5214          	subw	sp,#20
3399       00000014      OFST:	set	20
3402                     ; 252 	s32 dwTemp = 0;
3404  003d 5f            	clrw	x
3405  003e 1f13          	ldw	(OFST-1,sp),x
3406  0040 1f11          	ldw	(OFST-3,sp),x
3407                     ; 255 	if(FALSE == ReadRecord(0, (u8*)&stRecord, sizeof(stRecord)))
3409  0042 4b10          	push	#16
3410  0044 96            	ldw	x,sp
3411  0045 1c0002        	addw	x,#OFST-18
3412  0048 89            	pushw	x
3413  0049 4f            	clr	a
3414  004a cd0000        	call	_ReadRecord
3416  004d 5b03          	addw	sp,#3
3417  004f 4d            	tnz	a
3418  0050 2602          	jrne	L5612
3419                     ; 257 		stRecord.nStatus = VALVE_OPEN;
3421  0052 6b0f          	ld	(OFST-5,sp),a
3422  0054               L5612:
3423                     ; 263 	if((0x41 == nCycle)||(OLD_VAVLE_CLOSE == stRecord.nStatus)||(VALVE_CLOSE == GetBoardVavleStat())) //(0x41 == nCycle)
3425  0054 7b15          	ld	a,(OFST+1,sp)
3426  0056 a141          	cp	a,#65
3427  0058 270c          	jreq	L1712
3429  005a 7b0f          	ld	a,(OFST-5,sp)
3430  005c a108          	cp	a,#8
3431  005e 2706          	jreq	L1712
3433  0060 cd0000        	call	_GetBoardVavleStat
3435  0063 4a            	dec	a
3436  0064 2612          	jrne	L7612
3437  0066               L1712:
3438                     ; 271 		dwTemp = 3600;
3440  0066 ae0e10        	ldw	x,#3600
3441  0069               LC003:
3442  0069 1f13          	ldw	(OFST-1,sp),x
3443  006b 5f            	clrw	x
3444  006c               LC002:
3445  006c 1f11          	ldw	(OFST-3,sp),x
3447  006e               L5712:
3448                     ; 304 	return dwTemp;
3450  006e 96            	ldw	x,sp
3451  006f 1c0011        	addw	x,#OFST-3
3452  0072 cd0000        	call	c_ltor
3456  0075 5b15          	addw	sp,#21
3457  0077 81            	ret	
3458  0078               L7612:
3459                     ; 273 	else if((0xC1 == nCycle)||(0x81 == nCycle))/* 每天 不支持每月，每月也当做每天上报 */
3461  0078 7b15          	ld	a,(OFST+1,sp)
3462  007a a1c1          	cp	a,#193
3463  007c 2704          	jreq	L1022
3465  007e a181          	cp	a,#129
3466  0080 260a          	jrne	L7712
3467  0082               L1022:
3468                     ; 275 		dwTemp = 3600UL*24;
3470  0082 ae5180        	ldw	x,#20864
3471  0085 1f13          	ldw	(OFST-1,sp),x
3472  0087 ae0001        	ldw	x,#1
3474  008a 20e0          	jp	LC002
3475  008c               L7712:
3476                     ; 277 	else if(30 >= nCycle)/* 每1-10天上报则按以下方式获取上报数据 */
3478  008c a11f          	cp	a,#31
3479  008e 2420          	jruge	L5022
3480                     ; 279 		if(6 == nCycle)
3482  0090 a106          	cp	a,#6
3483  0092 2605          	jrne	L7022
3484                     ; 281 			dwTemp = 3600UL*6;
3486  0094 ae5460        	ldw	x,#21600
3488  0097 20d0          	jp	LC003
3489  0099               L7022:
3490                     ; 295 			dwTemp = 3600UL*24*nCycle;
3492  0099 b703          	ld	c_lreg+3,a
3493  009b 3f02          	clr	c_lreg+2
3494  009d 3f01          	clr	c_lreg+1
3495  009f 3f00          	clr	c_lreg
3496  00a1 ae045f        	ldw	x,#L02
3497  00a4 cd0000        	call	c_lmul
3499  00a7 96            	ldw	x,sp
3500  00a8 1c0011        	addw	x,#OFST-3
3501  00ab cd0000        	call	c_rtol
3503  00ae 20be          	jra	L5712
3504  00b0               L5022:
3505                     ; 302 		dwTemp = 5UL*60;
3507  00b0 ae012c        	ldw	x,#300
3508  00b3 20b4          	jp	LC003
3511                     	switch	.const
3512  0463               L5122_nBuf:
3513  0463 00            	dc.b	0
3514  0464 000000000000  	ds.b	9
3713                     ; 316 void UpLinkSaveReportTime(void)
3713                     ; 317 {
3714                     	switch	.text
3715  00b5               _UpLinkSaveReportTime:
3717  00b5 5221          	subw	sp,#33
3718       00000021      OFST:	set	33
3721                     ; 320 	u8 nBuf[10] = {0};
3723  00b7 96            	ldw	x,sp
3724  00b8 1c0018        	addw	x,#OFST-9
3725  00bb 90ae0463      	ldw	y,#L5122_nBuf
3726  00bf a60a          	ld	a,#10
3727  00c1 cd0000        	call	c_xymvx
3729                     ; 321 	s32 dwOffsetSec = 0, dwCycle = 0;
3731  00c4 5f            	clrw	x
3732  00c5 1f03          	ldw	(OFST-30,sp),x
3733  00c7 1f01          	ldw	(OFST-32,sp),x
3736  00c9 1f07          	ldw	(OFST-26,sp),x
3737  00cb 1f05          	ldw	(OFST-28,sp),x
3738                     ; 323 	STM8_RTC_Get(&stReportTime);
3740  00cd 96            	ldw	x,sp
3741  00ce 1c0011        	addw	x,#OFST-16
3742  00d1 cd0000        	call	_STM8_RTC_Get
3744                     ; 324 	TM_TimeChangeAToB(&stReportTime,&stTime);
3746  00d4 96            	ldw	x,sp
3747  00d5 1c0009        	addw	x,#OFST-24
3748  00d8 89            	pushw	x
3749  00d9 1c0008        	addw	x,#8
3750  00dc cd0000        	call	_TM_TimeChangeAToB
3752  00df 85            	popw	x
3753                     ; 334 	g_wTmReportCnt++;
3755  00e0 ce00ab        	ldw	x,_g_wTmReportCnt
3756  00e3 5c            	incw	x
3757  00e4 cf00ab        	ldw	_g_wTmReportCnt,x
3758                     ; 342 	MemcpyFunc((u8*)nBuf, (u8*)&stLastReportT, 8);
3760  00e7 4b08          	push	#8
3761  00e9 ae000a        	ldw	x,#_stLastReportT
3762  00ec 89            	pushw	x
3763  00ed 96            	ldw	x,sp
3764  00ee 1c001b        	addw	x,#OFST-6
3765  00f1 cd0000        	call	_MemcpyFunc
3767  00f4 5b03          	addw	sp,#3
3768                     ; 343 	MemcpyFunc(&nBuf[8], (u8*)&g_wTmReportCnt, 2);
3770  00f6 4b02          	push	#2
3771  00f8 ae00ab        	ldw	x,#_g_wTmReportCnt
3772  00fb 89            	pushw	x
3773  00fc 96            	ldw	x,sp
3774  00fd 1c0023        	addw	x,#OFST+2
3775  0100 cd0000        	call	_MemcpyFunc
3777  0103 5b03          	addw	sp,#3
3778                     ; 344 	SaveParameterForType(nBuf, 10, LT_REP_TIME);
3780  0105 4b05          	push	#5
3781  0107 4b0a          	push	#10
3782  0109 96            	ldw	x,sp
3783  010a 1c001a        	addw	x,#OFST-7
3784  010d cd0000        	call	_SaveParameterForType
3786  0110 c60001        	ld	a,_stOptValve+1
3787  0113 a1ee          	cp	a,#238
3788  0115 85            	popw	x
3789                     ; 347 	if((CTL_VALVE_OVER == stOptValve.nOptFlg)&&(MAX_REP_TIMES > stOptValve.nRepFailCnt))
3791  0116 2624          	jrne	L5132
3793  0118 c60008        	ld	a,_stOptValve+8
3794  011b a103          	cp	a,#3
3795  011d 241d          	jruge	L5132
3796                     ; 349 		stOptValve.nRepFailCnt++;
3798  011f 725c0008      	inc	_stOptValve+8
3799                     ; 350 		stOptValve.nRepFailCnt = ((stOptValve.nRepFailCnt>MAX_REP_TIMES)?MAX_REP_TIMES:stOptValve.nRepFailCnt);
3801  0123 c60008        	ld	a,_stOptValve+8
3802  0126 a104          	cp	a,#4
3803  0128 2502          	jrult	L63
3804  012a a603          	ld	a,#3
3805  012c               L63:
3806  012c c70008        	ld	_stOptValve+8,a
3807                     ; 351 		SaveParameterForType((u8*)&stOptValve, OPTVALVE_LEN, OPT_VALVE_PRAA);
3809  012f 4b06          	push	#6
3810  0131 4b0a          	push	#10
3811  0133 ae0000        	ldw	x,#_stOptValve
3812  0136 cd0000        	call	_SaveParameterForType
3814  0139 85            	popw	x
3815                     ; 352 		return ;
3817  013a 2045          	jra	L07
3818  013c               L5132:
3819                     ; 356 	if((NO_ALARM != (ALM_GetBatStatus())&ALARM_MASK) 
3819                     ; 357 		&& (ALARM_REP_FLG != (g_nGuardEnFlg&ALARM_REP_FLG))
3819                     ; 358 		&& (MAX_REP_TIMES > g_nAlmRepFailCnt)&&(m_nAlmRepFlg))
3821  013c cd0000        	call	_ALM_GetBatStatus
3823  013f 4d            	tnz	a
3824  0140 2705          	jreq	L44
3825  0142 ae0001        	ldw	x,#1
3826  0145 2001          	jra	L05
3827  0147               L44:
3828  0147 5f            	clrw	x
3829  0148               L05:
3830  0148 01            	rrwa	x,a
3831  0149 a5ff          	bcp	a,#255
3832  014b 2737          	jreq	L7132
3834  014d 7202000032    	btjt	_g_nGuardEnFlg,#1,L7132
3836  0152 c60000        	ld	a,_g_nAlmRepFailCnt
3837  0155 a103          	cp	a,#3
3838  0157 242b          	jruge	L7132
3840  0159 c600c4        	ld	a,_m_nAlmRepFlg
3841  015c 2726          	jreq	L7132
3842                     ; 360 		g_nAlmRepFailCnt++;
3844  015e 725c0000      	inc	_g_nAlmRepFailCnt
3845                     ; 361 		g_nAlmRepFailCnt = ((g_nAlmRepFailCnt>MAX_REP_TIMES)?MAX_REP_TIMES:g_nAlmRepFailCnt);
3847  0162 c60000        	ld	a,_g_nAlmRepFailCnt
3848  0165 a104          	cp	a,#4
3849  0167 2502          	jrult	L25
3850  0169 a603          	ld	a,#3
3851  016b               L25:
3852  016b c70000        	ld	_g_nAlmRepFailCnt,a
3853                     ; 362 		g_nGuardEnFlg |=(g_nAlmRepFailCnt<<6); /* 记录上报告警失败次数 */
3855  016e 97            	ld	xl,a
3856  016f a640          	ld	a,#64
3857  0171 42            	mul	x,a
3858  0172 9f            	ld	a,xl
3859  0173 ca0000        	or	a,_g_nGuardEnFlg
3860  0176 c70000        	ld	_g_nGuardEnFlg,a
3861                     ; 363 		SaveByte(ADDRESS_GUARD_EN, g_nGuardEnFlg);
3863  0179 88            	push	a
3864  017a ae1000        	ldw	x,#4096
3865  017d cd0000        	call	_SaveByte
3867  0180 84            	pop	a
3868                     ; 364 		return ;
3869  0181               L07:
3872  0181 5b21          	addw	sp,#33
3873  0183 81            	ret	
3874  0184               L7132:
3875                     ; 368 	if(m_nRepFailFlg)
3877  0184 c600bd        	ld	a,_m_nRepFailFlg
3878  0187 27f8          	jreq	L07
3879                     ; 370 		MemcpyFunc((u8*)&stRepFail.stTime, (u8*)&stReportTime, sizeof(stRepFail.stTime));
3881  0189 4b06          	push	#6
3882  018b 96            	ldw	x,sp
3883  018c 1c0012        	addw	x,#OFST-15
3884  018f 89            	pushw	x
3885  0190 ae0000        	ldw	x,#_stRepFail
3886  0193 cd0000        	call	_MemcpyFunc
3888  0196 5b03          	addw	sp,#3
3889                     ; 371 		stRepFail.nSigal = JX_ByteToBcd(g_nSignal);			//信号大小,固定值
3891  0198 c60000        	ld	a,_g_nSignal
3892  019b cd0000        	call	_JX_ByteToBcd
3894  019e c70008        	ld	_stRepFail+8,a
3895                     ; 372 		AddAlmRecord((u8*)&stRepFail, sizeof(stRepFail));
3897  01a1 4b09          	push	#9
3898  01a3 ae0000        	ldw	x,#_stRepFail
3899  01a6 cd0000        	call	_AddAlmRecord
3901  01a9 84            	pop	a
3902                     ; 375 		if(m_nWakeupReportFlg&THIRD_REP_FAIL)
3904  01aa 720700a506    	btjf	_m_nWakeupReportFlg,#3,L3232
3905                     ; 377 			m_nWakeupReportFlg = 0;
3907  01af 725f00a5      	clr	_m_nWakeupReportFlg
3909  01b3 201a          	jra	L5232
3910  01b5               L3232:
3911                     ; 387 		else if(m_nWakeupReportFlg&SECOND_REP_FAIL)
3913  01b5 720500a506    	btjf	_m_nWakeupReportFlg,#2,L7232
3914                     ; 389 			m_nWakeupReportFlg |= THIRD_REP_FAIL;
3916  01ba 721600a5      	bset	_m_nWakeupReportFlg,#3
3918  01be 200f          	jra	L5232
3919  01c0               L7232:
3920                     ; 391 		else if(m_nWakeupReportFlg&FIRST_REP_FAIL)
3922  01c0 720300a506    	btjf	_m_nWakeupReportFlg,#1,L3332
3923                     ; 393 			m_nWakeupReportFlg |= SECOND_REP_FAIL;
3925  01c5 721400a5      	bset	_m_nWakeupReportFlg,#2
3927  01c9 2004          	jra	L5232
3928  01cb               L3332:
3929                     ; 397 			m_nWakeupReportFlg |= FIRST_REP_FAIL;
3931  01cb 721200a5      	bset	_m_nWakeupReportFlg,#1
3932  01cf               L5232:
3933                     ; 399 		SaveReportFlag(m_nWakeupReportFlg);
3935  01cf c600a5        	ld	a,_m_nWakeupReportFlg
3936  01d2 cd0000        	call	_SaveReportFlag
3938                     ; 400 		m_nRepFailFlg = FALSE;
3940  01d5 725f00bd      	clr	_m_nRepFailFlg
3941                     ; 402 }
3943  01d9 20a6          	jra	L07
3976                     ; 412 void BatteryVolRepPro(void)
3976                     ; 413 {
3977                     	switch	.text
3978  01db               _BatteryVolRepPro:
3982                     ; 414 	if((ALARM_MASK&ALM_GetBatStatus())&&(g_BatRepFlg)
3982                     ; 415 		&&((OTHER_REP == m_nUploadMode)||(MAX_REP_TIMES <= g_nAlmRepFailCnt)))
3984  01db cd0000        	call	_ALM_GetBatStatus
3986  01de 5f            	clrw	x
3987  01df 97            	ld	xl,a
3988  01e0 5d            	tnzw	x
3989  01e1 2730          	jreq	L7432
3991  01e3 c600b3        	ld	a,_g_BatRepFlg
3992  01e6 272b          	jreq	L7432
3994  01e8 c600c3        	ld	a,_m_nUploadMode
3995  01eb 2707          	jreq	L1532
3997  01ed c60000        	ld	a,_g_nAlmRepFailCnt
3998  01f0 a103          	cp	a,#3
3999  01f2 251f          	jrult	L7432
4000  01f4               L1532:
4001                     ; 417 		g_dwRepTick = GetSysTemTick();
4003  01f4 cd0000        	call	_GetSysTemTick
4005  01f7 ae00b5        	ldw	x,#_g_dwRepTick
4006  01fa cd0000        	call	c_rtol
4008                     ; 418 		g_nDatRepCnt = 0;
4010  01fd 725f00b4      	clr	_g_nDatRepCnt
4011                     ; 419 		m_nRepEnableFlg = TRUE; //上报超时使能		
4013  0201 350100ba      	mov	_m_nRepEnableFlg,#1
4014                     ; 420 		SetLogonMode(UP_UPLOAD_BAT_VAL);
4016  0205 a604          	ld	a,#4
4017  0207 cd0033        	call	_SetLogonMode
4019                     ; 421 		g_BatRepFlg = FALSE;
4021  020a 725f00b3      	clr	_g_BatRepFlg
4022                     ; 422 		m_nAlmRepFlg = TRUE;
4024  020e 350100c4      	mov	_m_nAlmRepFlg,#1
4027  0212 81            	ret	
4028  0213               L7432:
4029                     ; 426 		SetLogonMode(UP_HEARTBEAT);
4031  0213 a601          	ld	a,#1
4033                     ; 428 	return ;
4036  0215 cc0033        	jp	_SetLogonMode
4179                     ; 440 u8 AlmMakeFrame(u8* pnOutBuf)
4179                     ; 441 {
4180                     	switch	.text
4181  0218               _AlmMakeFrame:
4183  0218 89            	pushw	x
4184  0219 520b          	subw	sp,#11
4185       0000000b      OFST:	set	11
4188                     ; 442 	u8 i = 0, nAtReportLen = 0;
4192  021b 0f01          	clr	(OFST-10,sp)
4193                     ; 445 	for(i = 0; i < MAX_ALM_NUM; i++)  //  wTemp
4195  021d 0f02          	clr	(OFST-9,sp)
4196  021f               L7342:
4197                     ; 448 		if(FALSE == ReadAlmRecord(i, (u8*)&stRecord, sizeof(stRecord)))
4199  021f 4b09          	push	#9
4200  0221 96            	ldw	x,sp
4201  0222 1c0004        	addw	x,#OFST-7
4202  0225 89            	pushw	x
4203  0226 7b05          	ld	a,(OFST-6,sp)
4204  0228 cd0000        	call	_ReadAlmRecord
4206  022b 5b03          	addw	sp,#3
4207  022d 4d            	tnz	a
4208  022e 260c          	jrne	L5442
4209                     ; 450 			MemsetFunc((u8*)&stRecord, 0xFF, sizeof(stRecord));
4211  0230 4b09          	push	#9
4212  0232 4bff          	push	#255
4213  0234 96            	ldw	x,sp
4214  0235 1c0005        	addw	x,#OFST-6
4215  0238 cd0000        	call	_MemsetFunc
4217  023b 85            	popw	x
4218  023c               L5442:
4219                     ; 453 		JX_BL_Change(2,(u8*)&stRecord.wError);
4221  023c 96            	ldw	x,sp
4222  023d 1c0009        	addw	x,#OFST-2
4223  0240 89            	pushw	x
4224  0241 ae0002        	ldw	x,#2
4225  0244 cd0000        	call	_JX_BL_Change
4227  0247 85            	popw	x
4228                     ; 454 		MemcpyFunc(&pnOutBuf[i*9], (u8*)&stRecord, sizeof(stRecord));
4230  0248 4b09          	push	#9
4231  024a 96            	ldw	x,sp
4232  024b 1c0004        	addw	x,#OFST-7
4233  024e 89            	pushw	x
4234  024f 7b05          	ld	a,(OFST-6,sp)
4235  0251 97            	ld	xl,a
4236  0252 a609          	ld	a,#9
4237  0254 42            	mul	x,a
4238  0255 72fb0f        	addw	x,(OFST+4,sp)
4239  0258 cd0000        	call	_MemcpyFunc
4241  025b 5b03          	addw	sp,#3
4242                     ; 455 		nAtReportLen = (i+1)*9;
4244  025d 7b02          	ld	a,(OFST-9,sp)
4245  025f 97            	ld	xl,a
4246  0260 a609          	ld	a,#9
4247  0262 42            	mul	x,a
4248  0263 9f            	ld	a,xl
4249  0264 ab09          	add	a,#9
4250  0266 6b01          	ld	(OFST-10,sp),a
4251                     ; 445 	for(i = 0; i < MAX_ALM_NUM; i++)  //  wTemp
4253  0268 0c02          	inc	(OFST-9,sp)
4256  026a 7b02          	ld	a,(OFST-9,sp)
4257  026c a103          	cp	a,#3
4258  026e 25af          	jrult	L7342
4259                     ; 458 	return nAtReportLen;	
4261  0270 7b01          	ld	a,(OFST-10,sp)
4264  0272 5b0d          	addw	sp,#13
4265  0274 81            	ret	
4316                     ; 470 void FrameSendFunc(u8 Size, u8 nComChannel, u8* pnPoint)
4316                     ; 471 {
4317                     	switch	.text
4318  0275               _FrameSendFunc:
4320  0275 89            	pushw	x
4321       00000000      OFST:	set	0
4324                     ; 473 	if(COM_1 == nComChannel)
4326  0276 9f            	ld	a,xl
4327  0277 4a            	dec	a
4328  0278 2614          	jrne	L1742
4329                     ; 475 		*pnPoint++ = AT_TAIL_0;				//数据发送规定
4331  027a 1e05          	ldw	x,(OFST+5,sp)
4332  027c a60d          	ld	a,#13
4333  027e f7            	ld	(x),a
4334  027f 5c            	incw	x
4335  0280 1f05          	ldw	(OFST+5,sp),x
4336                     ; 476 		SetBusUart(nComChannel, PARITY_NULL);	//设置串口通道号
4338  0282 5f            	clrw	x
4339  0283 7b02          	ld	a,(OFST+2,sp)
4340  0285 95            	ld	xh,a
4341  0286 cd0000        	call	_SetBusUart
4343                     ; 477 		StartSendBusUartGroup(Size + 1);
4345  0289 7b01          	ld	a,(OFST+1,sp)
4346  028b 4c            	inc	a
4349  028c 200b          	jra	L3742
4350  028e               L1742:
4351                     ; 481 		SetBusUart(nComChannel, PARITY_EVEN);	//设置串口通道号  
4353  028e ae0003        	ldw	x,#3
4354  0291 7b02          	ld	a,(OFST+2,sp)
4355  0293 95            	ld	xh,a
4356  0294 cd0000        	call	_SetBusUart
4358                     ; 482 		StartSendBusUartGroup(Size);
4360  0297 7b01          	ld	a,(OFST+1,sp)
4362  0299               L3742:
4363  0299 cd0000        	call	_StartSendBusUartGroup
4364                     ; 484 }
4367  029c 85            	popw	x
4368  029d 81            	ret	
4422                     ; 494 void GetIsmiCcidDat(void)
4422                     ; 495 {
4423                     	switch	.text
4424  029e               _GetIsmiCcidDat:
4426  029e 5203          	subw	sp,#3
4427       00000003      OFST:	set	3
4430                     ; 496 	u8 nOptCmd = 0, nOptRlt = 0, nCnt = 0;
4432  02a0 0f01          	clr	(OFST-2,sp)
4437  02a2 0f02          	clr	(OFST-1,sp)
4438                     ; 498 	if(g_nSignal <= 0)
4440  02a4 c60000        	ld	a,_g_nSignal
4441  02a7 2653          	jrne	L5152
4442                     ; 500 		TurnBusUartOn();
4444  02a9 cd0000        	call	_TurnBusUartOn
4446                     ; 501 		SetPortGsmResetDisable();
4448  02ac 4b00          	push	#0
4449  02ae 4b40          	push	#64
4450  02b0 ae5005        	ldw	x,#20485
4451  02b3 cd0000        	call	_GPIO_WriteBit
4453  02b6 85            	popw	x
4454                     ; 502 		SetPortGsmPowerOn();		   //供电
4456  02b7 4b01          	push	#1
4457  02b9 4b10          	push	#16
4458  02bb ae500a        	ldw	x,#20490
4459  02be cd0000        	call	_GPIO_WriteBit
4461  02c1 85            	popw	x
4462                     ; 503 		SetPortSoftSwitchOn();
4464  02c2 ad3b          	call	LC004
4465                     ; 505 		SetPortSoftSwitchOff();
4467  02c4 4b00          	push	#0
4468  02c6 4b20          	push	#32
4469  02c8 ae5005        	ldw	x,#20485
4470  02cb cd0000        	call	_GPIO_WriteBit
4472  02ce 85            	popw	x
4473                     ; 506 		UC_SleepFunc(2500);
4475  02cf ae09c4        	ldw	x,#2500
4476  02d2 ad39          	call	LC005
4477                     ; 507 		SetPortSoftSwitchOn();
4479  02d4 ad29          	call	LC004
4480  02d6               L7152:
4481                     ; 511 			UC_SleepFunc(500); 
4483  02d6 ae01f4        	ldw	x,#500
4484  02d9 ad32          	call	LC005
4485                     ; 512 			SIMGK7M_GetCIMI(m_nImsiBuf, sizeof(m_nImsiBuf));
4487  02db 4b18          	push	#24
4488  02dd ae0085        	ldw	x,#_m_nImsiBuf
4489  02e0 cd0d61        	call	_SIMGK7M_GetCIMI
4491  02e3 84            	pop	a
4492                     ; 513 			nOptRlt = SIMGL868_GetCCID(m_nCcidBuf, sizeof(m_nCcidBuf));
4494  02e4 4b18          	push	#24
4495  02e6 ae006d        	ldw	x,#_m_nCcidBuf
4496  02e9 cd0db6        	call	_SIMGL868_GetCCID
4498  02ec 5b01          	addw	sp,#1
4499  02ee 6b03          	ld	(OFST+0,sp),a
4500                     ; 514 		}while((3 > nCnt++)&&(FALSE == nOptRlt));
4502  02f0 7b02          	ld	a,(OFST-1,sp)
4503  02f2 0c02          	inc	(OFST-1,sp)
4504  02f4 a103          	cp	a,#3
4505  02f6 2404          	jruge	L5152
4507  02f8 7b03          	ld	a,(OFST+0,sp)
4508  02fa 27da          	jreq	L7152
4509  02fc               L5152:
4510                     ; 517 }
4513  02fc 5b03          	addw	sp,#3
4514  02fe 81            	ret	
4516  02ff               LC004:
4517  02ff 4b01          	push	#1
4518  0301 4b20          	push	#32
4519  0303 ae5005        	ldw	x,#20485
4520  0306 cd0000        	call	_GPIO_WriteBit
4522  0309 85            	popw	x
4523                     ; 508 		UC_SleepFunc(500); 
4525  030a ae01f4        	ldw	x,#500
4526  030d               LC005:
4527  030d 89            	pushw	x
4528  030e 5f            	clrw	x
4529  030f 89            	pushw	x
4530  0310 cd0760        	call	_UC_SleepFunc
4532  0313 5b04          	addw	sp,#4
4533  0315 81            	ret	
4584                     ; 532 u8  JX_Strlen(char* pbSrc)
4584                     ; 533 {
4585                     	switch	.text
4586  0316               _JX_Strlen:
4588  0316 89            	pushw	x
4589  0317 5203          	subw	sp,#3
4590       00000003      OFST:	set	3
4593                     ; 534 	u8 nLoop = 0;
4595                     ; 535 	char* pBuf = (char*)pbSrc;
4597  0319 1e04          	ldw	x,(OFST+1,sp)
4598  031b 1f01          	ldw	(OFST-2,sp),x
4599                     ; 537 	nLoop = 0;
4601  031d 0f03          	clr	(OFST+0,sp)
4602  031f               L3552:
4603                     ; 540 		nLoop++;
4605  031f 0c03          	inc	(OFST+0,sp)
4606                     ; 541 	}while(pBuf[nLoop] != 0);
4608  0321 7b01          	ld	a,(OFST-2,sp)
4609  0323 97            	ld	xl,a
4610  0324 7b02          	ld	a,(OFST-1,sp)
4611  0326 1b03          	add	a,(OFST+0,sp)
4612  0328 2401          	jrnc	L461
4613  032a 5c            	incw	x
4614  032b               L461:
4615  032b 02            	rlwa	x,a
4616  032c f6            	ld	a,(x)
4617  032d 26f0          	jrne	L3552
4618                     ; 543 	return nLoop;
4620  032f 7b03          	ld	a,(OFST+0,sp)
4623  0331 5b05          	addw	sp,#5
4624  0333 81            	ret	
4690                     ; 555 void  JX_StringCat(char* pbSrc,char * pnStr, u8 nLen)
4690                     ; 556 {
4691                     	switch	.text
4692  0334               _JX_StringCat:
4694  0334 89            	pushw	x
4695  0335 89            	pushw	x
4696       00000002      OFST:	set	2
4699                     ; 557 	u8 nLoop = 0, i = 0;
4703                     ; 559 	nLoop = 0;
4705                     ; 560 	for(nLoop = 0; nLoop < 254; nLoop++)
4707  0336 0f02          	clr	(OFST+0,sp)
4708  0338               L1162:
4709                     ; 562 		if(pbSrc[nLoop] == 0)
4711  0338 7b03          	ld	a,(OFST+1,sp)
4712  033a 97            	ld	xl,a
4713  033b 7b04          	ld	a,(OFST+2,sp)
4714  033d 1b02          	add	a,(OFST+0,sp)
4715  033f 2401          	jrnc	L071
4716  0341 5c            	incw	x
4717  0342               L071:
4718  0342 02            	rlwa	x,a
4719  0343 f6            	ld	a,(x)
4720  0344 2708          	jreq	L5162
4721                     ; 564 			break;
4723                     ; 560 	for(nLoop = 0; nLoop < 254; nLoop++)
4725  0346 0c02          	inc	(OFST+0,sp)
4728  0348 7b02          	ld	a,(OFST+0,sp)
4729  034a a1fe          	cp	a,#254
4730  034c 25ea          	jrult	L1162
4731  034e               L5162:
4732                     ; 567 	for(i = 0; i < nLen; i++)
4734  034e 0f01          	clr	(OFST-1,sp)
4736  0350 201a          	jra	L5262
4737  0352               L1262:
4738                     ; 569 		pbSrc[nLoop++] = pnStr[i];
4740  0352 7b02          	ld	a,(OFST+0,sp)
4741  0354 0c02          	inc	(OFST+0,sp)
4742  0356 5f            	clrw	x
4743  0357 97            	ld	xl,a
4744  0358 72fb03        	addw	x,(OFST+1,sp)
4745  035b 89            	pushw	x
4746  035c 7b09          	ld	a,(OFST+7,sp)
4747  035e 97            	ld	xl,a
4748  035f 7b0a          	ld	a,(OFST+8,sp)
4749  0361 1b03          	add	a,(OFST+1,sp)
4750  0363 2401          	jrnc	L271
4751  0365 5c            	incw	x
4752  0366               L271:
4753  0366 02            	rlwa	x,a
4754  0367 f6            	ld	a,(x)
4755  0368 85            	popw	x
4756  0369 f7            	ld	(x),a
4757                     ; 567 	for(i = 0; i < nLen; i++)
4759  036a 0c01          	inc	(OFST-1,sp)
4760  036c               L5262:
4763  036c 7b01          	ld	a,(OFST-1,sp)
4764  036e 1109          	cp	a,(OFST+7,sp)
4765  0370 25e0          	jrult	L1262
4766                     ; 572 	return ;
4769  0372 5b04          	addw	sp,#4
4770  0374 81            	ret	
4825                     ; 580 void PackAtCmd(u8 Cmd)
4825                     ; 581 {
4826                     	switch	.text
4827  0375               _PackAtCmd:
4829  0375 88            	push	a
4830  0376 5204          	subw	sp,#4
4831       00000004      OFST:	set	4
4834                     ; 584 	point = aucUartTxBuffer;
4836  0378 ae0000        	ldw	x,#_aucUartTxBuffer
4837                     ; 585 	if (Cmd > AT_CMD_S_D)		//有包头?
4839  037b a108          	cp	a,#8
4840  037d 2508          	jrult	L3562
4841                     ; 587 		*point++ = AT_HEAD_0;
4843  037f a641          	ld	a,#65
4844  0381 f7            	ld	(x),a
4845  0382 5c            	incw	x
4846                     ; 588 		*point++ = AT_HEAD_1;
4848  0383 a654          	ld	a,#84
4849  0385 f7            	ld	(x),a
4850  0386 5c            	incw	x
4851  0387               L3562:
4852  0387 1f03          	ldw	(OFST-1,sp),x
4853                     ; 590 	length = JX_Strlen((char const *)aucAtCmd[Cmd] );
4855  0389 7b05          	ld	a,(OFST+1,sp)
4856  038b 5f            	clrw	x
4857  038c 97            	ld	xl,a
4858  038d 58            	sllw	x
4859  038e de037b        	ldw	x,(_aucAtCmd,x)
4860  0391 ad83          	call	_JX_Strlen
4862  0393 5f            	clrw	x
4863  0394 97            	ld	xl,a
4864  0395 1f01          	ldw	(OFST-3,sp),x
4865                     ; 591 	MemcpyFunc( (u8 *)point, aucAtCmd[Cmd], length);		//复制字符串到缓冲中
4867  0397 7b02          	ld	a,(OFST-2,sp)
4868  0399 88            	push	a
4869  039a 7b06          	ld	a,(OFST+2,sp)
4870  039c 5f            	clrw	x
4871  039d 97            	ld	xl,a
4872  039e 58            	sllw	x
4873  039f de037b        	ldw	x,(_aucAtCmd,x)
4874  03a2 89            	pushw	x
4875  03a3 1e06          	ldw	x,(OFST+2,sp)
4876  03a5 cd0000        	call	_MemcpyFunc
4878  03a8 5b03          	addw	sp,#3
4879                     ; 592 	point += length;
4881  03aa 1e03          	ldw	x,(OFST-1,sp)
4882  03ac 72fb01        	addw	x,(OFST-3,sp)
4883                     ; 593 	*point++ = AT_TAIL_0;		//包尾
4885  03af a60d          	ld	a,#13
4886  03b1 f7            	ld	(x),a
4887  03b2 5c            	incw	x
4888                     ; 594 	*point++ = AT_TAIL_1;
4890  03b3 a60a          	ld	a,#10
4891  03b5 f7            	ld	(x),a
4892  03b6 5c            	incw	x
4893  03b7 1f03          	ldw	(OFST-1,sp),x
4894                     ; 595 	if (Cmd > AT_CMD_S_D)		//有包头?
4896  03b9 7b05          	ld	a,(OFST+1,sp)
4897  03bb a108          	cp	a,#8
4898  03bd 1e01          	ldw	x,(OFST-3,sp)
4899  03bf 2505          	jrult	L5562
4900                     ; 597 		length += 4;
4902  03c1 1c0004        	addw	x,#4
4904  03c4 2003          	jra	L7562
4905  03c6               L5562:
4906                     ; 601 		length += 2;
4908  03c6 1c0002        	addw	x,#2
4909  03c9               L7562:
4910  03c9 1f01          	ldw	(OFST-3,sp),x
4911                     ; 603 	SetBusUart(COM_1, PARITY_NULL);		//设置串口通道号
4913  03cb 5f            	clrw	x
4914  03cc a601          	ld	a,#1
4915  03ce 95            	ld	xh,a
4916  03cf cd0000        	call	_SetBusUart
4918                     ; 605 	StartSendBusUartGroup(length);
4920  03d2 7b02          	ld	a,(OFST-2,sp)
4921  03d4 cd0000        	call	_StartSendBusUartGroup
4923                     ; 606 }
4926  03d7 5b05          	addw	sp,#5
4927  03d9 81            	ret	
4999                     ; 613 void PackAtCmdParameter(u8 Cmd, u8 *Parameter)
4999                     ; 614 {
5000                     	switch	.text
5001  03da               _PackAtCmdParameter:
5003  03da 88            	push	a
5004  03db 5206          	subw	sp,#6
5005       00000006      OFST:	set	6
5008                     ; 617 	point = aucUartTxBuffer; 
5010  03dd ae0000        	ldw	x,#_aucUartTxBuffer
5011                     ; 618 	if (Cmd > AT_CMD_S_A)		//有包头? AT_CMD_S_D
5013  03e0 4d            	tnz	a
5014  03e1 2708          	jreq	L1172
5015                     ; 620 		*point++ = AT_HEAD_0;
5017  03e3 a641          	ld	a,#65
5018  03e5 f7            	ld	(x),a
5019  03e6 5c            	incw	x
5020                     ; 621 		*point++ = AT_HEAD_1;
5022  03e7 a654          	ld	a,#84
5023  03e9 f7            	ld	(x),a
5024  03ea 5c            	incw	x
5025  03eb               L1172:
5026  03eb 1f05          	ldw	(OFST-1,sp),x
5027                     ; 623 	length1 = JX_Strlen( (char const *)aucAtCmd[Cmd] );
5029  03ed 7b07          	ld	a,(OFST+1,sp)
5030  03ef 5f            	clrw	x
5031  03f0 97            	ld	xl,a
5032  03f1 58            	sllw	x
5033  03f2 de037b        	ldw	x,(_aucAtCmd,x)
5034  03f5 cd0316        	call	_JX_Strlen
5036  03f8 5f            	clrw	x
5037  03f9 97            	ld	xl,a
5038  03fa 1f03          	ldw	(OFST-3,sp),x
5039                     ; 624 	MemcpyFunc( (u8 *)point, aucAtCmd[Cmd], length1);		//复制字符串到缓冲中
5041  03fc 7b04          	ld	a,(OFST-2,sp)
5042  03fe 88            	push	a
5043  03ff 7b08          	ld	a,(OFST+2,sp)
5044  0401 5f            	clrw	x
5045  0402 97            	ld	xl,a
5046  0403 58            	sllw	x
5047  0404 de037b        	ldw	x,(_aucAtCmd,x)
5048  0407 89            	pushw	x
5049  0408 1e08          	ldw	x,(OFST+2,sp)
5050  040a cd0000        	call	_MemcpyFunc
5052  040d 5b03          	addw	sp,#3
5053                     ; 625 	point += length1;
5055  040f 1e05          	ldw	x,(OFST-1,sp)
5056  0411 72fb03        	addw	x,(OFST-3,sp)
5057  0414 1f05          	ldw	(OFST-1,sp),x
5058                     ; 626 	length2 = JX_Strlen( (char const *)Parameter);
5060  0416 1e0a          	ldw	x,(OFST+4,sp)
5061  0418 cd0316        	call	_JX_Strlen
5063  041b 5f            	clrw	x
5064  041c 97            	ld	xl,a
5065  041d 1f01          	ldw	(OFST-5,sp),x
5066                     ; 627 	MemcpyFunc( (u8 *)point, Parameter, length2);		//复制字符串到缓冲中
5068  041f 7b02          	ld	a,(OFST-4,sp)
5069  0421 88            	push	a
5070  0422 1e0b          	ldw	x,(OFST+5,sp)
5071  0424 89            	pushw	x
5072  0425 1e08          	ldw	x,(OFST+2,sp)
5073  0427 cd0000        	call	_MemcpyFunc
5075  042a 5b03          	addw	sp,#3
5076                     ; 628 	point += length2;
5078  042c 1e05          	ldw	x,(OFST-1,sp)
5079  042e 72fb01        	addw	x,(OFST-5,sp)
5080                     ; 629 	*point++ = AT_TAIL_0;		//包尾
5082  0431 a60d          	ld	a,#13
5083  0433 f7            	ld	(x),a
5084  0434 5c            	incw	x
5085                     ; 630 	*point++ = AT_TAIL_1;
5087  0435 a60a          	ld	a,#10
5088  0437 f7            	ld	(x),a
5089  0438 5c            	incw	x
5090  0439 1f05          	ldw	(OFST-1,sp),x
5091                     ; 631 	length1 += length2;
5093  043b 1e03          	ldw	x,(OFST-3,sp)
5094  043d 72fb01        	addw	x,(OFST-5,sp)
5095  0440 1f03          	ldw	(OFST-3,sp),x
5096                     ; 632 	if (Cmd > AT_CMD_S_A)		//有包头? AT_CMD_S_D
5098  0442 7b07          	ld	a,(OFST+1,sp)
5099  0444 2705          	jreq	L3172
5100                     ; 634 		length1 += 4;
5102  0446 1c0004        	addw	x,#4
5104  0449 2003          	jra	L5172
5105  044b               L3172:
5106                     ; 638 		length1 += 2;
5108  044b 1c0002        	addw	x,#2
5109  044e               L5172:
5110  044e 1f03          	ldw	(OFST-3,sp),x
5111                     ; 640 	SetBusUart(COM_1, PARITY_NULL);		//设置串口通道号
5113  0450 5f            	clrw	x
5114  0451 a601          	ld	a,#1
5115  0453 95            	ld	xh,a
5116  0454 cd0000        	call	_SetBusUart
5118                     ; 642 	StartSendBusUartGroup(length1);
5120  0457 7b04          	ld	a,(OFST-2,sp)
5121  0459 cd0000        	call	_StartSendBusUartGroup
5123                     ; 643 }
5126  045c 5b07          	addw	sp,#7
5127  045e 81            	ret	
5210                     ; 651 void PackAtCmdParameter2(u8 Cmd, u8 *Parameter1, u8 *Parameter2)
5210                     ; 652 {
5211                     	switch	.text
5212  045f               _PackAtCmdParameter2:
5214  045f 88            	push	a
5215  0460 5206          	subw	sp,#6
5216       00000006      OFST:	set	6
5219                     ; 655 	point = aucUartTxBuffer;
5221  0462 ae0000        	ldw	x,#_aucUartTxBuffer
5222                     ; 656 	if (Cmd > AT_CMD_S_D)		//有包头?
5224  0465 a108          	cp	a,#8
5225  0467 2508          	jrult	L3572
5226                     ; 658 		*point++ = AT_HEAD_0;
5228  0469 a641          	ld	a,#65
5229  046b f7            	ld	(x),a
5230  046c 5c            	incw	x
5231                     ; 659 		*point++ = AT_HEAD_1;
5233  046d a654          	ld	a,#84
5234  046f f7            	ld	(x),a
5235  0470 5c            	incw	x
5236  0471               L3572:
5237  0471 1f05          	ldw	(OFST-1,sp),x
5238                     ; 662 	length1 = JX_Strlen( (char const *)aucAtCmd[Cmd] );
5240  0473 7b07          	ld	a,(OFST+1,sp)
5241  0475 5f            	clrw	x
5242  0476 97            	ld	xl,a
5243  0477 58            	sllw	x
5244  0478 de037b        	ldw	x,(_aucAtCmd,x)
5245  047b cd0509        	call	LC006
5246  047e 1f01          	ldw	(OFST-5,sp),x
5247                     ; 663 	MemcpyFunc( (u8 *)point, aucAtCmd[Cmd], length1);		//复制字符串到缓冲中
5249  0480 7b02          	ld	a,(OFST-4,sp)
5250  0482 88            	push	a
5251  0483 7b08          	ld	a,(OFST+2,sp)
5252  0485 5f            	clrw	x
5253  0486 97            	ld	xl,a
5254  0487 58            	sllw	x
5255  0488 de037b        	ldw	x,(_aucAtCmd,x)
5256  048b 89            	pushw	x
5257  048c 1e08          	ldw	x,(OFST+2,sp)
5258  048e cd0000        	call	_MemcpyFunc
5260  0491 5b03          	addw	sp,#3
5261                     ; 664 	point += length1;
5263  0493 1e05          	ldw	x,(OFST-1,sp)
5264  0495 72fb01        	addw	x,(OFST-5,sp)
5265  0498 1f05          	ldw	(OFST-1,sp),x
5266                     ; 669 	length2 = JX_Strlen( (char const *)Parameter1);
5268  049a 1e0a          	ldw	x,(OFST+4,sp)
5269  049c ad6b          	call	LC006
5270  049e 1f03          	ldw	(OFST-3,sp),x
5271                     ; 670 	MemcpyFunc( (u8 *)point, Parameter1, length2);		//复制字符串到缓冲中
5273  04a0 7b04          	ld	a,(OFST-2,sp)
5274  04a2 88            	push	a
5275  04a3 1e0b          	ldw	x,(OFST+5,sp)
5276  04a5 89            	pushw	x
5277  04a6 1e08          	ldw	x,(OFST+2,sp)
5278  04a8 cd0000        	call	_MemcpyFunc
5280  04ab 5b03          	addw	sp,#3
5281                     ; 671 	length1 += length2;
5283  04ad 1e01          	ldw	x,(OFST-5,sp)
5284  04af 72fb03        	addw	x,(OFST-3,sp)
5285  04b2 1f01          	ldw	(OFST-5,sp),x
5286                     ; 672 	point += length2;
5288  04b4 1e05          	ldw	x,(OFST-1,sp)
5289  04b6 72fb03        	addw	x,(OFST-3,sp)
5290                     ; 673 	*point++ = ',';			//2个参数之间只能用逗号连接
5292  04b9 a62c          	ld	a,#44
5293  04bb f7            	ld	(x),a
5294  04bc 5c            	incw	x
5295  04bd 1f05          	ldw	(OFST-1,sp),x
5296                     ; 674 	length2 = JX_Strlen( (char const *)Parameter2);
5298  04bf 1e0c          	ldw	x,(OFST+6,sp)
5299  04c1 ad46          	call	LC006
5300  04c3 1f03          	ldw	(OFST-3,sp),x
5301                     ; 675 	MemcpyFunc( (u8 *)point, Parameter2, length2);		//复制字符串到缓冲中
5303  04c5 7b04          	ld	a,(OFST-2,sp)
5304  04c7 88            	push	a
5305  04c8 1e0d          	ldw	x,(OFST+7,sp)
5306  04ca 89            	pushw	x
5307  04cb 1e08          	ldw	x,(OFST+2,sp)
5308  04cd cd0000        	call	_MemcpyFunc
5310  04d0 5b03          	addw	sp,#3
5311                     ; 676 	length1 += length2;
5313  04d2 1e01          	ldw	x,(OFST-5,sp)
5314  04d4 72fb03        	addw	x,(OFST-3,sp)
5315  04d7 1f01          	ldw	(OFST-5,sp),x
5316                     ; 677 	point += length2;
5318  04d9 1e05          	ldw	x,(OFST-1,sp)
5319  04db 72fb03        	addw	x,(OFST-3,sp)
5320                     ; 678 	*point++ = AT_TAIL_0;		//包尾
5322  04de a60d          	ld	a,#13
5323  04e0 f7            	ld	(x),a
5324  04e1 5c            	incw	x
5325                     ; 679 	*point++ = AT_TAIL_1;
5327  04e2 a60a          	ld	a,#10
5328  04e4 f7            	ld	(x),a
5329  04e5 5c            	incw	x
5330  04e6 1f05          	ldw	(OFST-1,sp),x
5331                     ; 681 	if (Cmd > AT_CMD_S_D)		//有包头?
5333  04e8 7b07          	ld	a,(OFST+1,sp)
5334  04ea a108          	cp	a,#8
5335  04ec 1e01          	ldw	x,(OFST-5,sp)
5336  04ee 2505          	jrult	L5572
5337                     ; 686 		length1 += 5;
5339  04f0 1c0005        	addw	x,#5
5341  04f3 2003          	jra	L7572
5342  04f5               L5572:
5343                     ; 694 		length1 += 3;
5345  04f5 1c0003        	addw	x,#3
5346  04f8               L7572:
5347  04f8 1f01          	ldw	(OFST-5,sp),x
5348                     ; 697 	SetBusUart(COM_1, PARITY_NULL);		//设置串口通道号
5350  04fa 5f            	clrw	x
5351  04fb a601          	ld	a,#1
5352  04fd 95            	ld	xh,a
5353  04fe cd0000        	call	_SetBusUart
5355                     ; 698 	StartSendBusUartGroup(length1);
5357  0501 7b02          	ld	a,(OFST-4,sp)
5358  0503 cd0000        	call	_StartSendBusUartGroup
5360                     ; 699 }
5363  0506 5b07          	addw	sp,#7
5364  0508 81            	ret	
5366  0509               LC006:
5367  0509 cd0316        	call	_JX_Strlen
5369  050c 5f            	clrw	x
5370  050d 97            	ld	xl,a
5371  050e 81            	ret	
5477                     ; 707 void PackAtCmdParameter3(u8 Cmd, u8 *Parameter1, u8 *Parameter2, u8 *Parameter3)
5477                     ; 708 {
5478                     	switch	.text
5479  050f               _PackAtCmdParameter3:
5481  050f 88            	push	a
5482  0510 5206          	subw	sp,#6
5483       00000006      OFST:	set	6
5486                     ; 709 	u16 length0 = 0, length1 = 0, length2 = 0, length3 = 0;
5494                     ; 712 	if((NULL == Parameter1)||(NULL == Parameter2)||(NULL == Parameter3))
5496  0512 1e0a          	ldw	x,(OFST+4,sp)
5497  0514 2603cc05ef    	jreq	L472
5499  0519 1e0c          	ldw	x,(OFST+6,sp)
5500  051b 27f9          	jreq	L472
5502  051d 1e0e          	ldw	x,(OFST+8,sp)
5503                     ; 714 		return;
5505  051f 27f5          	jreq	L472
5506                     ; 717 	point = aucUartTxBuffer;
5508  0521 ae0000        	ldw	x,#_aucUartTxBuffer
5509                     ; 718 	if (Cmd > AT_CMD_S_D)		//有包头?
5511  0524 7b07          	ld	a,(OFST+1,sp)
5512  0526 a108          	cp	a,#8
5513  0528 2508          	jrult	L3303
5514                     ; 720 		*point++ = AT_HEAD_0;
5516  052a a641          	ld	a,#65
5517  052c f7            	ld	(x),a
5518  052d 5c            	incw	x
5519                     ; 721 		*point++ = AT_HEAD_1;
5521  052e a654          	ld	a,#84
5522  0530 f7            	ld	(x),a
5523  0531 5c            	incw	x
5524  0532               L3303:
5525  0532 1f05          	ldw	(OFST-1,sp),x
5526                     ; 723 	length0 = JX_Strlen( (char const *)aucAtCmd[Cmd] );
5528  0534 7b07          	ld	a,(OFST+1,sp)
5529  0536 5f            	clrw	x
5530  0537 97            	ld	xl,a
5531  0538 58            	sllw	x
5532  0539 de037b        	ldw	x,(_aucAtCmd,x)
5533  053c cd05f2        	call	LC007
5534  053f 1f01          	ldw	(OFST-5,sp),x
5535                     ; 724 	MemcpyFunc( (u8 *)point, aucAtCmd[Cmd], length0);		//复制字符串到缓冲中
5537  0541 7b02          	ld	a,(OFST-4,sp)
5538  0543 88            	push	a
5539  0544 7b08          	ld	a,(OFST+2,sp)
5540  0546 5f            	clrw	x
5541  0547 97            	ld	xl,a
5542  0548 58            	sllw	x
5543  0549 de037b        	ldw	x,(_aucAtCmd,x)
5544  054c 89            	pushw	x
5545  054d 1e08          	ldw	x,(OFST+2,sp)
5546  054f cd0000        	call	_MemcpyFunc
5548  0552 5b03          	addw	sp,#3
5549                     ; 725 	point += length0;
5551  0554 1e05          	ldw	x,(OFST-1,sp)
5552  0556 72fb01        	addw	x,(OFST-5,sp)
5553  0559 1f05          	ldw	(OFST-1,sp),x
5554                     ; 730 	length1 = JX_Strlen( (char *)Parameter1);//(char const *)
5556  055b 1e0a          	ldw	x,(OFST+4,sp)
5557  055d cd05f2        	call	LC007
5558  0560 1f03          	ldw	(OFST-3,sp),x
5559                     ; 731 	MemcpyFunc( (u8 *)point, Parameter1, length1);		//复制字符串到缓冲中
5561  0562 7b04          	ld	a,(OFST-2,sp)
5562  0564 88            	push	a
5563  0565 1e0b          	ldw	x,(OFST+5,sp)
5564  0567 89            	pushw	x
5565  0568 1e08          	ldw	x,(OFST+2,sp)
5566  056a cd0000        	call	_MemcpyFunc
5568  056d 5b03          	addw	sp,#3
5569                     ; 732 	length0 += length1;
5571  056f 1e01          	ldw	x,(OFST-5,sp)
5572  0571 72fb03        	addw	x,(OFST-3,sp)
5573  0574 1f01          	ldw	(OFST-5,sp),x
5574                     ; 733 	point += length1;
5576  0576 1e05          	ldw	x,(OFST-1,sp)
5577  0578 72fb03        	addw	x,(OFST-3,sp)
5578                     ; 734 	*point++ = ',';			//2个参数之间只能用逗号连接
5580  057b a62c          	ld	a,#44
5581  057d f7            	ld	(x),a
5582  057e 5c            	incw	x
5583  057f 1f05          	ldw	(OFST-1,sp),x
5584                     ; 736 	length2 = JX_Strlen( (char const *)Parameter2);
5586  0581 1e0c          	ldw	x,(OFST+6,sp)
5587  0583 ad6d          	call	LC007
5588  0585 1f03          	ldw	(OFST-3,sp),x
5589                     ; 737 	MemcpyFunc( (u8 *)point, Parameter2, length2);		//复制字符串到缓冲中
5591  0587 7b04          	ld	a,(OFST-2,sp)
5592  0589 88            	push	a
5593  058a 1e0d          	ldw	x,(OFST+7,sp)
5594  058c 89            	pushw	x
5595  058d 1e08          	ldw	x,(OFST+2,sp)
5596  058f cd0000        	call	_MemcpyFunc
5598  0592 5b03          	addw	sp,#3
5599                     ; 738 	length0 += length2+1;
5601  0594 1e03          	ldw	x,(OFST-3,sp)
5602  0596 5c            	incw	x
5603  0597 72fb01        	addw	x,(OFST-5,sp)
5604  059a 1f01          	ldw	(OFST-5,sp),x
5605                     ; 739 	point += length2;
5607  059c 1e05          	ldw	x,(OFST-1,sp)
5608  059e 72fb03        	addw	x,(OFST-3,sp)
5609                     ; 740 	*point++ = ',';			//2个参数之间只能用逗号连接
5611  05a1 a62c          	ld	a,#44
5612  05a3 f7            	ld	(x),a
5613  05a4 5c            	incw	x
5614  05a5 1f05          	ldw	(OFST-1,sp),x
5615                     ; 742 	length3 = JX_Strlen( (char const *)Parameter3);
5617  05a7 1e0e          	ldw	x,(OFST+8,sp)
5618  05a9 ad47          	call	LC007
5619  05ab 1f03          	ldw	(OFST-3,sp),x
5620                     ; 743 	MemcpyFunc( (u8 *)point, Parameter3, length3);		//复制字符串到缓冲中
5622  05ad 7b04          	ld	a,(OFST-2,sp)
5623  05af 88            	push	a
5624  05b0 1e0f          	ldw	x,(OFST+9,sp)
5625  05b2 89            	pushw	x
5626  05b3 1e08          	ldw	x,(OFST+2,sp)
5627  05b5 cd0000        	call	_MemcpyFunc
5629  05b8 5b03          	addw	sp,#3
5630                     ; 744 	length0 += length3+1;
5632  05ba 1e03          	ldw	x,(OFST-3,sp)
5633  05bc 5c            	incw	x
5634  05bd 72fb01        	addw	x,(OFST-5,sp)
5635  05c0 1f01          	ldw	(OFST-5,sp),x
5636                     ; 745 	point += length3;
5638  05c2 1e05          	ldw	x,(OFST-1,sp)
5639  05c4 72fb03        	addw	x,(OFST-3,sp)
5640                     ; 747 	*point++ = AT_TAIL_0;		//包尾
5642  05c7 a60d          	ld	a,#13
5643  05c9 f7            	ld	(x),a
5644  05ca 5c            	incw	x
5645                     ; 748 	*point++ = AT_TAIL_1;
5647  05cb a60a          	ld	a,#10
5648  05cd f7            	ld	(x),a
5649  05ce 5c            	incw	x
5650  05cf 1f05          	ldw	(OFST-1,sp),x
5651                     ; 750 	if (Cmd > AT_CMD_S_D)		//有包头?
5653  05d1 7b07          	ld	a,(OFST+1,sp)
5654  05d3 a108          	cp	a,#8
5655  05d5 1e01          	ldw	x,(OFST-5,sp)
5656  05d7 2505          	jrult	L5303
5657                     ; 755 		length0 += 5;
5659  05d9 1c0005        	addw	x,#5
5661  05dc 2003          	jra	L7303
5662  05de               L5303:
5663                     ; 763 		length0 += 3;
5665  05de 1c0003        	addw	x,#3
5666  05e1               L7303:
5667  05e1 1f01          	ldw	(OFST-5,sp),x
5668                     ; 766 	SetBusUart(COM_1, PARITY_NULL);		//设置串口通道号
5670  05e3 5f            	clrw	x
5671  05e4 a601          	ld	a,#1
5672  05e6 95            	ld	xh,a
5673  05e7 cd0000        	call	_SetBusUart
5675                     ; 767 	StartSendBusUartGroup(length0);
5677  05ea 7b02          	ld	a,(OFST-4,sp)
5678  05ec cd0000        	call	_StartSendBusUartGroup
5680                     ; 768 }
5681  05ef               L472:
5684  05ef 5b07          	addw	sp,#7
5685  05f1 81            	ret	
5687  05f2               LC007:
5688  05f2 cd0316        	call	_JX_Strlen
5690  05f5 5f            	clrw	x
5691  05f6 97            	ld	xl,a
5692  05f7 81            	ret	
5763                     ; 775 void PackAtCmdTcpsend(u8 Length)
5763                     ; 776 {
5764                     	switch	.text
5765  05f8               _PackAtCmdTcpsend:
5767  05f8 88            	push	a
5768  05f9 520b          	subw	sp,#11
5769       0000000b      OFST:	set	11
5772                     ; 779 	point = aucUartTxBuffer;
5774  05fb ae0000        	ldw	x,#_aucUartTxBuffer
5775                     ; 780 	*point++ = AT_HEAD_0;
5777  05fe a641          	ld	a,#65
5778  0600 f7            	ld	(x),a
5779  0601 5c            	incw	x
5780                     ; 781 	*point++ = AT_HEAD_1;
5782  0602 a654          	ld	a,#84
5783  0604 f7            	ld	(x),a
5784  0605 5c            	incw	x
5785  0606 1f0a          	ldw	(OFST-1,sp),x
5786                     ; 782 	length1 = JX_Strlen( (char const *)aucAtCmd[AT_CMD_TCPSEND] );
5788  0608 ae0257        	ldw	x,#_aucAtTcpsend
5789  060b cd0316        	call	_JX_Strlen
5791  060e 5f            	clrw	x
5792  060f 97            	ld	xl,a
5793  0610 1f01          	ldw	(OFST-10,sp),x
5794                     ; 783 	MemcpyFunc( (u8 *)point, aucAtCmd[AT_CMD_TCPSEND], length1);		//复制字符串到缓冲中
5796  0612 7b02          	ld	a,(OFST-9,sp)
5797  0614 88            	push	a
5798  0615 ae0257        	ldw	x,#_aucAtTcpsend
5799  0618 89            	pushw	x
5800  0619 1e0d          	ldw	x,(OFST+2,sp)
5801  061b cd0000        	call	_MemcpyFunc
5803  061e 5b03          	addw	sp,#3
5804                     ; 784 	point += length1;
5806  0620 1e0a          	ldw	x,(OFST-1,sp)
5807  0622 72fb01        	addw	x,(OFST-10,sp)
5808  0625 1f0a          	ldw	(OFST-1,sp),x
5809                     ; 800 	if (Length > 99)
5811  0627 7b0c          	ld	a,(OFST+1,sp)
5812  0629 a164          	cp	a,#100
5813  062b 2532          	jrult	L1703
5814                     ; 802 		length2 = 3;		
5816  062d ae0003        	ldw	x,#3
5817  0630 1f03          	ldw	(OFST-8,sp),x
5818                     ; 803 		buffer[0] = '0' + Length / 100;
5820  0632 ae0064        	ldw	x,#100
5821  0635 9093          	ldw	y,x
5822  0637 5f            	clrw	x
5823  0638 97            	ld	xl,a
5824  0639 65            	divw	x,y
5825  063a 9f            	ld	a,xl
5826  063b ab30          	add	a,#48
5827  063d 6b05          	ld	(OFST-6,sp),a
5828                     ; 804 		buffer[1] = '0' + (Length%100) / 10;
5830  063f 7b0c          	ld	a,(OFST+1,sp)
5831  0641 5f            	clrw	x
5832  0642 97            	ld	xl,a
5833  0643 a664          	ld	a,#100
5834  0645 cd0000        	call	c_smodx
5836  0648 a60a          	ld	a,#10
5837  064a cd0000        	call	c_sdivx
5839  064d 1c0030        	addw	x,#48
5840  0650 01            	rrwa	x,a
5841  0651 6b06          	ld	(OFST-5,sp),a
5842                     ; 805 		buffer[2] = '0' + Length % 10;
5844  0653 7b0c          	ld	a,(OFST+1,sp)
5845  0655 ad64          	call	LC008
5846  0657 909f          	ld	a,yl
5847  0659 ab30          	add	a,#48
5848  065b 6b07          	ld	(OFST-4,sp),a
5850  065d 2025          	jra	L3703
5851  065f               L1703:
5852                     ; 807 	else if (Length > 9) 	//10~39?
5854  065f a10a          	cp	a,#10
5855  0661 2518          	jrult	L5703
5856                     ; 809 		length2 = 2;
5858  0663 ae0002        	ldw	x,#2
5859  0666 1f03          	ldw	(OFST-8,sp),x
5860                     ; 810 		buffer[0] = '0' + Length / 10;
5862  0668 ad51          	call	LC008
5863  066a 9f            	ld	a,xl
5864  066b ab30          	add	a,#48
5865  066d 6b05          	ld	(OFST-6,sp),a
5866                     ; 811 		buffer[1] = '0' + Length % 10;
5868  066f 7b0c          	ld	a,(OFST+1,sp)
5869  0671 ad48          	call	LC008
5870  0673 909f          	ld	a,yl
5871  0675 ab30          	add	a,#48
5872  0677 6b06          	ld	(OFST-5,sp),a
5874  0679 2009          	jra	L3703
5875  067b               L5703:
5876                     ; 815 		length2 = 1;
5878  067b ae0001        	ldw	x,#1
5879  067e 1f03          	ldw	(OFST-8,sp),x
5880                     ; 816 		buffer[0] = '0' + Length;
5882  0680 ab30          	add	a,#48
5883  0682 6b05          	ld	(OFST-6,sp),a
5884  0684               L3703:
5885                     ; 820 	MemcpyFunc( (u8 *)point, buffer, length2);		//复制字符串到缓冲中
5887  0684 7b04          	ld	a,(OFST-7,sp)
5888  0686 88            	push	a
5889  0687 96            	ldw	x,sp
5890  0688 1c0006        	addw	x,#OFST-5
5891  068b 89            	pushw	x
5892  068c 1e0d          	ldw	x,(OFST+2,sp)
5893  068e cd0000        	call	_MemcpyFunc
5895  0691 5b03          	addw	sp,#3
5896                     ; 821 	point += length2;
5898  0693 1e0a          	ldw	x,(OFST-1,sp)
5899  0695 72fb03        	addw	x,(OFST-8,sp)
5900                     ; 822 	*point++ = AT_TAIL_0;		//包尾
5902  0698 a60d          	ld	a,#13
5903  069a f7            	ld	(x),a
5904  069b 5c            	incw	x
5905                     ; 823 	*point++ = AT_TAIL_1;
5907  069c a60a          	ld	a,#10
5908  069e f7            	ld	(x),a
5909  069f 5c            	incw	x
5910  06a0 1f0a          	ldw	(OFST-1,sp),x
5911                     ; 824 	length1 += length2;
5913  06a2 1e01          	ldw	x,(OFST-10,sp)
5914  06a4 72fb03        	addw	x,(OFST-8,sp)
5915                     ; 825 	length1 += 2+2;            //头和尾 长度
5917  06a7 1c0004        	addw	x,#4
5918  06aa 1f01          	ldw	(OFST-10,sp),x
5919                     ; 826 	SetBusUart(COM_1, PARITY_NULL);		//设置串口通道号
5921  06ac 5f            	clrw	x
5922  06ad a601          	ld	a,#1
5923  06af 95            	ld	xh,a
5924  06b0 cd0000        	call	_SetBusUart
5926                     ; 828 	StartSendBusUartGroup(length1);
5928  06b3 7b02          	ld	a,(OFST-9,sp)
5929  06b5 cd0000        	call	_StartSendBusUartGroup
5931                     ; 829 }
5934  06b8 5b0c          	addw	sp,#12
5935  06ba 81            	ret	
5937  06bb               LC008:
5938  06bb ae000a        	ldw	x,#10
5939  06be 9093          	ldw	y,x
5940  06c0 5f            	clrw	x
5941  06c1 97            	ld	xl,a
5942  06c2 65            	divw	x,y
5943  06c3 81            	ret	
5977                     ; 836 void PackTcpSendData(u8 nLen)
5977                     ; 837 {	
5978                     	switch	.text
5979  06c4               _PackTcpSendData:
5981  06c4 88            	push	a
5982       00000000      OFST:	set	0
5985                     ; 838 	aucUartTxBuffer[nLen] = AT_TAIL_0; //包尾
5987  06c5 5f            	clrw	x
5988  06c6 97            	ld	xl,a
5989  06c7 a60d          	ld	a,#13
5990  06c9 d70000        	ld	(_aucUartTxBuffer,x),a
5991                     ; 839 	SetBusUart(COM_1, PARITY_NULL);		//设置串口通道号
5993  06cc 5f            	clrw	x
5994  06cd a601          	ld	a,#1
5995  06cf 95            	ld	xh,a
5996  06d0 cd0000        	call	_SetBusUart
5998                     ; 840 	StartSendBusUartGroup(nLen+1);
6000  06d3 7b01          	ld	a,(OFST+1,sp)
6001  06d5 4c            	inc	a
6002  06d6 cd0000        	call	_StartSendBusUartGroup
6004                     ; 841 }
6007  06d9 84            	pop	a
6008  06da 81            	ret	
6053                     ; 853 void PackAtCmdExt(void)
6053                     ; 854 {
6054                     	switch	.text
6055  06db               _PackAtCmdExt:
6057  06db 5204          	subw	sp,#4
6058       00000004      OFST:	set	4
6061                     ; 855 	u16 length = 0;
6063  06dd 5f            	clrw	x
6064  06de 1f01          	ldw	(OFST-3,sp),x
6065                     ; 856 	u8 *point  = NULL;
6067                     ; 857 	point = aucUartTxBuffer;
6069  06e0 ae0000        	ldw	x,#_aucUartTxBuffer
6070                     ; 859 		*point++ = AT_HEAD_0;
6072  06e3 a641          	ld	a,#65
6073  06e5 f7            	ld	(x),a
6074  06e6 5c            	incw	x
6075                     ; 860 		*point++ = AT_HEAD_1;
6077  06e7 a654          	ld	a,#84
6078  06e9 f7            	ld	(x),a
6079  06ea 5c            	incw	x
6080                     ; 862 	*point++ = AT_TAIL_0;		//包尾
6082  06eb a60d          	ld	a,#13
6083  06ed f7            	ld	(x),a
6084  06ee 5c            	incw	x
6085                     ; 863 	*point++ = AT_TAIL_1;
6087  06ef a60a          	ld	a,#10
6088  06f1 f7            	ld	(x),a
6089  06f2 5c            	incw	x
6090  06f3 1f03          	ldw	(OFST-1,sp),x
6091                     ; 865 		length += 2;
6093  06f5 1e01          	ldw	x,(OFST-3,sp)
6094  06f7 1c0002        	addw	x,#2
6095  06fa 1f01          	ldw	(OFST-3,sp),x
6096                     ; 867 	SetBusUart(COM_1, PARITY_NULL);		//设置串口通道号
6098  06fc 5f            	clrw	x
6099  06fd a601          	ld	a,#1
6100  06ff 95            	ld	xh,a
6101  0700 cd0000        	call	_SetBusUart
6103                     ; 868 	StartSendBusUartGroup(length);
6105  0703 7b02          	ld	a,(OFST-2,sp)
6106  0705 cd0000        	call	_StartSendBusUartGroup
6108                     ; 869 }
6111  0708 5b04          	addw	sp,#4
6112  070a 81            	ret	
6145                     ; 880 void  UC_SetSleepCnt(uint32_t dwWaitmS)
6145                     ; 881 {
6146                     	switch	.text
6147  070b               _UC_SetSleepCnt:
6149       00000000      OFST:	set	0
6152                     ; 882 	m_dwTimeCnt = (dwWaitmS);
6154  070b 1e05          	ldw	x,(OFST+5,sp)
6155  070d cf00a9        	ldw	_m_dwTimeCnt+2,x
6156  0710 1e03          	ldw	x,(OFST+3,sp)
6157  0712 cf00a7        	ldw	_m_dwTimeCnt,x
6158                     ; 883 }
6161  0715 81            	ret	
6164                     	switch	.data
6165  00cb               L1513_dwTime:
6166  00cb 00000000      	dc.l	0
6205                     ; 894 uint8_t  UC_SleepProc(void)
6205                     ; 895 {
6206                     	switch	.text
6207  0716               _UC_SleepProc:
6209  0716 5204          	subw	sp,#4
6210       00000004      OFST:	set	4
6213                     ; 897 	uint32_t  dwTimeNow = 0;
6215  0718 5f            	clrw	x
6216  0719 1f03          	ldw	(OFST-1,sp),x
6217  071b 1f01          	ldw	(OFST-3,sp),x
6218                     ; 900 	dwTimeNow = GetSysTemTick();
6220  071d cd0000        	call	_GetSysTemTick
6222  0720 96            	ldw	x,sp
6223  0721 5c            	incw	x
6224  0722 cd0000        	call	c_rtol
6226                     ; 902 	if (dwTime < dwTimeNow)
6228  0725 ae00cb        	ldw	x,#L1513_dwTime
6229  0728 cd0000        	call	c_ltor
6231  072b 96            	ldw	x,sp
6232  072c 5c            	incw	x
6233  072d cd0000        	call	c_lcmp
6235  0730 240a          	jruge	L1713
6236                     ; 904 		 if(dwTimeNow - dwTime > m_dwTimeCnt)
6238  0732 96            	ldw	x,sp
6239  0733 5c            	incw	x
6240  0734 cd0000        	call	c_ltor
6242  0737 ae00cb        	ldw	x,#L1513_dwTime
6245                     ; 906 			dwTime = GetSysTemTick();
6248                     ; 907 			return TRUE;
6250  073a 2008          	jp	LC009
6251  073c               L1713:
6252                     ; 910 	else if ((dwTime - dwTimeNow) > m_dwTimeCnt)
6254  073c ae00cb        	ldw	x,#L1513_dwTime
6255  073f cd0000        	call	c_ltor
6257  0742 96            	ldw	x,sp
6258  0743 5c            	incw	x
6261                     ; 912 		dwTime = GetSysTemTick();
6265                     ; 913 		return TRUE;
6267  0744               LC009:
6268  0744 cd0000        	call	c_lsub
6269  0747 ae00a7        	ldw	x,#_m_dwTimeCnt
6270  074a cd0000        	call	c_lcmp
6271  074d 230e          	jrule	L5713
6273  074f cd0000        	call	_GetSysTemTick
6274  0752 ae00cb        	ldw	x,#L1513_dwTime
6275  0755 cd0000        	call	c_rtol
6277  0758 a601          	ld	a,#1
6279  075a               L043:
6281  075a 5b04          	addw	sp,#4
6282  075c 81            	ret	
6283  075d               L5713:
6284                     ; 916 	return FALSE;
6286  075d 4f            	clr	a
6288  075e 20fa          	jra	L043
6336                     ; 928 uint8_t  UC_SleepFunc(uint32_t dwWaitmS)
6336                     ; 929 {
6337                     	switch	.text
6338  0760               _UC_SleepFunc:
6340  0760 5208          	subw	sp,#8
6341       00000008      OFST:	set	8
6344                     ; 930 	uint32_t dwTime = 0, dwNowTime = 0;
6346  0762 96            	ldw	x,sp
6347  0763 5c            	incw	x
6348  0764 cd0000        	call	c_ltor
6352  0767 96            	ldw	x,sp
6353  0768 1c0005        	addw	x,#OFST-3
6354  076b cd0000        	call	c_ltor
6356                     ; 933 	dwTime = GetSysTemTick();	
6358  076e cd0000        	call	_GetSysTemTick
6360  0771 96            	ldw	x,sp
6361  0772 5c            	incw	x
6362  0773 cd0000        	call	c_rtol
6364  0776               L1223:
6365                     ; 937 		dwNowTime = GetSysTemTick();
6367  0776 cd0000        	call	_GetSysTemTick
6369  0779 96            	ldw	x,sp
6370  077a 1c0005        	addw	x,#OFST-3
6371  077d cd0000        	call	c_rtol
6373                     ; 938 		if (dwTime < dwNowTime)
6375  0780 96            	ldw	x,sp
6376  0781 5c            	incw	x
6377  0782 cd0000        	call	c_ltor
6379  0785 96            	ldw	x,sp
6380  0786 1c0005        	addw	x,#OFST-3
6381  0789 cd0000        	call	c_lcmp
6383  078c 96            	ldw	x,sp
6384  078d 240a          	jruge	L5223
6385                     ; 940 			 if(dwNowTime - dwTime > dwWaitmS)
6387  078f 1c0005        	addw	x,#OFST-3
6388  0792 cd0000        	call	c_ltor
6390  0795 96            	ldw	x,sp
6391  0796 5c            	incw	x
6394                     ; 942 				break;
6396  0797 200a          	jra	L3223
6397  0799               L5223:
6398                     ; 945 		else if ((dwTime - dwNowTime) > dwWaitmS)
6400  0799 1c0001        	addw	x,#OFST-7
6401  079c cd0000        	call	c_ltor
6403  079f 96            	ldw	x,sp
6404  07a0 1c0005        	addw	x,#OFST-3
6407                     ; 947 			break;
6408  07a3               L3223:
6409  07a3 cd0000        	call	c_lsub
6410  07a6 96            	ldw	x,sp
6411  07a7 1c000b        	addw	x,#OFST+3
6412  07aa cd0000        	call	c_lcmp
6413  07ad 2304          	jrule	L1323
6414                     ; 955         return 0;
6416  07af 4f            	clr	a
6419  07b0 5b08          	addw	sp,#8
6420  07b2 81            	ret	
6421  07b3               L1323:
6422                     ; 953 		FeedSoftWareIwdg();
6424  07b3 cd0000        	call	_FeedSoftWareIwdg
6427  07b6 20be          	jra	L1223
6504                     	switch	.const
6505  046d               L453:
6506  046d 00004001      	dc.l	16385
6507  0471               L653:
6508  0471 00000401      	dc.l	1025
6509                     ; 968 int8_t  *QH_bufbuf(int8_t* pbSrc, uint32_t wSrcLen, int8_t* pbSub, uint32_t wSubLen)
6509                     ; 969 {
6510                     	switch	.text
6511  07b8               _QH_bufbuf:
6513  07b8 89            	pushw	x
6514  07b9 5207          	subw	sp,#7
6515       00000007      OFST:	set	7
6518                     ; 970 	int8_t  *pbSrcEnd = pbSrc + wSrcLen;
6520  07bb 72fb0e        	addw	x,(OFST+7,sp)
6521  07be 1f05          	ldw	(OFST-2,sp),x
6522                     ; 971 	u8 nLoop = 0;
6524                     ; 973 	if ((pbSrc == NULL) || (pbSub == NULL) || (wSrcLen > 16384) || (wSubLen > 1024))
6526  07c0 1e08          	ldw	x,(OFST+1,sp)
6527  07c2 2603cc0850    	jreq	LC010
6529  07c7 1e10          	ldw	x,(OFST+9,sp)
6530  07c9 27f9          	jreq	LC010
6532  07cb 96            	ldw	x,sp
6533  07cc 1c000c        	addw	x,#OFST+5
6534  07cf cd0000        	call	c_ltor
6536  07d2 ae046d        	ldw	x,#L453
6537  07d5 cd0000        	call	c_lcmp
6539  07d8 2476          	jruge	LC010
6541  07da 96            	ldw	x,sp
6542  07db 1c0012        	addw	x,#OFST+11
6543  07de cd0000        	call	c_ltor
6545  07e1 ae0471        	ldw	x,#L653
6546  07e4 cd0000        	call	c_lcmp
6548  07e7 255e          	jrult	L3033
6549                     ; 975 		return (NULL);
6551  07e9 2065          	jp	LC010
6552  07eb               L1033:
6553                     ; 980 		nLoop = 0;
6555  07eb 0f07          	clr	(OFST+0,sp)
6556  07ed               L7033:
6557                     ; 983 			if(pbSrc[nLoop] != pbSub[nLoop])
6559  07ed 7b10          	ld	a,(OFST+9,sp)
6560  07ef 97            	ld	xl,a
6561  07f0 7b11          	ld	a,(OFST+10,sp)
6562  07f2 1b07          	add	a,(OFST+0,sp)
6563  07f4 2401          	jrnc	L063
6564  07f6 5c            	incw	x
6565  07f7               L063:
6566  07f7 02            	rlwa	x,a
6567  07f8 f6            	ld	a,(x)
6568  07f9 6b04          	ld	(OFST-3,sp),a
6569  07fb 7b08          	ld	a,(OFST+1,sp)
6570  07fd 97            	ld	xl,a
6571  07fe 7b09          	ld	a,(OFST+2,sp)
6572  0800 1b07          	add	a,(OFST+0,sp)
6573  0802 2401          	jrnc	L263
6574  0804 5c            	incw	x
6575  0805               L263:
6576  0805 02            	rlwa	x,a
6577  0806 f6            	ld	a,(x)
6578  0807 1104          	cp	a,(OFST-3,sp)
6579  0809 2615          	jrne	L3133
6580                     ; 985 				break;
6582                     ; 987 			nLoop++;
6584  080b 0c07          	inc	(OFST+0,sp)
6585                     ; 988 		}while(nLoop<wSubLen);
6587  080d 7b07          	ld	a,(OFST+0,sp)
6588  080f b703          	ld	c_lreg+3,a
6589  0811 3f02          	clr	c_lreg+2
6590  0813 3f01          	clr	c_lreg+1
6591  0815 3f00          	clr	c_lreg
6592  0817 96            	ldw	x,sp
6593  0818 1c0012        	addw	x,#OFST+11
6594  081b cd0000        	call	c_lcmp
6596  081e 25cd          	jrult	L7033
6597  0820               L3133:
6598                     ; 989 		if(wSubLen <=nLoop)
6600  0820 7b07          	ld	a,(OFST+0,sp)
6601  0822 b703          	ld	c_lreg+3,a
6602  0824 3f02          	clr	c_lreg+2
6603  0826 3f01          	clr	c_lreg+1
6604  0828 3f00          	clr	c_lreg
6605  082a 96            	ldw	x,sp
6606  082b 5c            	incw	x
6607  082c cd0000        	call	c_rtol
6609  082f 96            	ldw	x,sp
6610  0830 1c0012        	addw	x,#OFST+11
6611  0833 cd0000        	call	c_ltor
6613  0836 96            	ldw	x,sp
6614  0837 5c            	incw	x
6615  0838 cd0000        	call	c_lcmp
6617  083b 2205          	jrugt	L7133
6618                     ; 991 			return pbSrc;
6620  083d 1e08          	ldw	x,(OFST+1,sp)
6622  083f               L463:
6624  083f 5b09          	addw	sp,#9
6625  0841 81            	ret	
6626  0842               L7133:
6627                     ; 993 		pbSrc++;
6629  0842 1e08          	ldw	x,(OFST+1,sp)
6630  0844 5c            	incw	x
6631  0845 1f08          	ldw	(OFST+1,sp),x
6632  0847               L3033:
6633                     ; 978 	while ((pbSrc+wSubLen) <= pbSrcEnd)
6635  0847 1e08          	ldw	x,(OFST+1,sp)
6636  0849 72fb14        	addw	x,(OFST+13,sp)
6637  084c 1305          	cpw	x,(OFST-2,sp)
6638  084e 239b          	jrule	L1033
6639                     ; 996 	return (NULL);
6641  0850               LC010:
6643  0850 5f            	clrw	x
6645  0851 20ec          	jra	L463
6728                     ; 1038 u8  QH_SearchStrVal(int8_t* pStart, int8_t* pEnd, uint32_t *dwVal)
6728                     ; 1039 {
6729                     	switch	.text
6730  0853               _QH_SearchStrVal:
6732  0853 89            	pushw	x
6733  0854 520b          	subw	sp,#11
6734       0000000b      OFST:	set	11
6737                     ; 1040 	u8 fGetFirst = FALSE, fRtnVal = FALSE;
6739  0856 0f0a          	clr	(OFST-1,sp)
6742  0858 0f05          	clr	(OFST-6,sp)
6743                     ; 1041 	uint32_t  val = 0;
6745  085a 5f            	clrw	x
6746  085b 1f08          	ldw	(OFST-3,sp),x
6747  085d 1f06          	ldw	(OFST-5,sp),x
6748                     ; 1045 	if ((pStart == NULL) || (pEnd == NULL) || (dwVal == NULL))
6750  085f 1e0c          	ldw	x,(OFST+1,sp)
6751  0861 2708          	jreq	L1633
6753  0863 1e10          	ldw	x,(OFST+5,sp)
6754  0865 2704          	jreq	L1633
6756  0867 1e12          	ldw	x,(OFST+7,sp)
6757  0869 265a          	jrne	L7633
6758  086b               L1633:
6759                     ; 1047 		return (fRtnVal);
6761  086b 4f            	clr	a
6763  086c 2070          	jra	L073
6764  086e               L5633:
6765                     ; 1052 		nByteTemp = *pStart++;
6767  086e f6            	ld	a,(x)
6768  086f 5c            	incw	x
6769  0870 1f0c          	ldw	(OFST+1,sp),x
6770  0872 6b0b          	ld	(OFST+0,sp),a
6771                     ; 1054 		if (fGetFirst == FALSE)
6773  0874 0d0a          	tnz	(OFST-1,sp)
6774  0876 260c          	jrne	L3733
6775                     ; 1056 			if (nByteTemp>='0' && nByteTemp<='9')
6777  0878 a130          	cp	a,#48
6778  087a 2f08          	jrslt	L3733
6780  087c a13a          	cp	a,#58
6781  087e 2e04          	jrsge	L3733
6782                     ; 1058 				fGetFirst = TRUE;
6784  0880 a601          	ld	a,#1
6785  0882 6b0a          	ld	(OFST-1,sp),a
6786  0884               L3733:
6787                     ; 1062 		if (fGetFirst == TRUE)
6789  0884 7b0a          	ld	a,(OFST-1,sp)
6790  0886 4a            	dec	a
6791  0887 263c          	jrne	L7633
6792                     ; 1064 			if (nByteTemp>='0' && nByteTemp<='9')
6794  0889 7b0b          	ld	a,(OFST+0,sp)
6795  088b a130          	cp	a,#48
6796  088d 2f3c          	jrslt	L1733
6798  088f a13a          	cp	a,#58
6799  0891 2e38          	jrsge	L1733
6800                     ; 1066 				val = val*10 + nByteTemp - '0';
6802  0893 b703          	ld	c_lreg+3,a
6803  0895 48            	sll	a
6804  0896 4f            	clr	a
6805  0897 a200          	sbc	a,#0
6806  0899 b702          	ld	c_lreg+2,a
6807  089b b701          	ld	c_lreg+1,a
6808  089d b700          	ld	c_lreg,a
6809  089f 96            	ldw	x,sp
6810  08a0 5c            	incw	x
6811  08a1 cd0000        	call	c_rtol
6813  08a4 96            	ldw	x,sp
6814  08a5 1c0006        	addw	x,#OFST-5
6815  08a8 cd0000        	call	c_ltor
6817  08ab a60a          	ld	a,#10
6818  08ad cd0000        	call	c_smul
6820  08b0 96            	ldw	x,sp
6821  08b1 5c            	incw	x
6822  08b2 cd0000        	call	c_ladd
6824  08b5 a630          	ld	a,#48
6825  08b7 cd0000        	call	c_lsbc
6827  08ba 96            	ldw	x,sp
6828  08bb 1c0006        	addw	x,#OFST-5
6829  08be cd0000        	call	c_rtol
6831                     ; 1067 				fRtnVal = TRUE;
6833  08c1 a601          	ld	a,#1
6834  08c3 6b05          	ld	(OFST-6,sp),a
6836  08c5               L7633:
6837                     ; 1050 	while (pStart < pEnd)
6839  08c5 1e0c          	ldw	x,(OFST+1,sp)
6840  08c7 1310          	cpw	x,(OFST+5,sp)
6841  08c9 25a3          	jrult	L5633
6842  08cb               L1733:
6843                     ; 1077 	*dwVal = val;
6845  08cb 1e12          	ldw	x,(OFST+7,sp)
6846  08cd 7b09          	ld	a,(OFST-2,sp)
6847  08cf e703          	ld	(3,x),a
6848  08d1 7b08          	ld	a,(OFST-3,sp)
6849  08d3 e702          	ld	(2,x),a
6850  08d5 7b07          	ld	a,(OFST-4,sp)
6851  08d7 e701          	ld	(1,x),a
6852  08d9 7b06          	ld	a,(OFST-5,sp)
6853  08db f7            	ld	(x),a
6854                     ; 1078 	return (fRtnVal);
6856  08dc 7b05          	ld	a,(OFST-6,sp)
6858  08de               L073:
6860  08de 5b0d          	addw	sp,#13
6861  08e0 81            	ret	
7040                     ; 1090 uint8_t  UC_CommAT(u8 nCmd, u8 *pnParameter, uint8_t *pnMatch1, uint8_t *pnMatch2, uint8_t *pnMatch3, 
7040                     ; 1091 					 uint8_t *pnMatch4, uint8_t **pnOutMatchPtr, uint32_t dwWaitmS)
7040                     ; 1092 {
7041                     	switch	.text
7042  08e1               _UC_CommAT:
7044  08e1 88            	push	a
7045  08e2 5213          	subw	sp,#19
7046       00000013      OFST:	set	19
7049                     ; 1093 	uint32_t  dwTimeOut = 0, dwTime = 0, dwNowTime = 0;
7051  08e4 96            	ldw	x,sp
7052  08e5 5c            	incw	x
7053  08e6 cd0000        	call	c_ltor
7057  08e9 96            	ldw	x,sp
7058  08ea 1c0005        	addw	x,#OFST-14
7059  08ed cd0000        	call	c_ltor
7063  08f0 96            	ldw	x,sp
7064  08f1 1c0009        	addw	x,#OFST-10
7065  08f4 cd0000        	call	c_ltor
7067                     ; 1094 	uint8_t   *pnMatchTagStr = NULL, nRtnVal = 0, *pnDat = NULL;
7069  08f7 5f            	clrw	x
7070  08f8 1f0e          	ldw	(OFST-5,sp),x
7073  08fa 0f0d          	clr	(OFST-6,sp)
7076                     ; 1095 	uint8_t   nData = 0, nStrLen = 0, nTxRxLen = 0;
7082                     ; 1098 	dwTime = GetSysTemTick();	
7084  08fc cd0000        	call	_GetSysTemTick
7086  08ff 96            	ldw	x,sp
7087  0900 1c0005        	addw	x,#OFST-14
7088  0903 cd0000        	call	c_rtol
7090                     ; 1099 	dwTimeOut = (dwWaitmS);
7092  0906 1e25          	ldw	x,(OFST+18,sp)
7093  0908 1f03          	ldw	(OFST-16,sp),x
7094  090a 1e23          	ldw	x,(OFST+16,sp)
7095  090c 1f01          	ldw	(OFST-18,sp),x
7096                     ; 1101 	if((NULL != pnParameter)&&(nCmd < AT_CMD_NULL))
7098  090e 1e17          	ldw	x,(OFST+4,sp)
7099  0910 2714          	jreq	L3053
7101  0912 7b14          	ld	a,(OFST+1,sp)
7102  0914 a1ff          	cp	a,#255
7103  0916 240e          	jruge	L3053
7104                     ; 1104 		ClearRxBuff();
7106  0918 cd0000        	call	_ClearRxBuff
7108                     ; 1105 		PackAtCmdParameter(nCmd, pnParameter);                
7110  091b 1e17          	ldw	x,(OFST+4,sp)
7111  091d 89            	pushw	x
7112  091e 7b16          	ld	a,(OFST+3,sp)
7113  0920 cd03da        	call	_PackAtCmdParameter
7115  0923 85            	popw	x
7117  0924 200e          	jra	L5053
7118  0926               L3053:
7119                     ; 1107 	else if (nCmd < AT_CMD_NULL)
7121  0926 7b14          	ld	a,(OFST+1,sp)
7122  0928 a1ff          	cp	a,#255
7123  092a 2408          	jruge	L5053
7124                     ; 1110 		ClearRxBuff();
7126  092c cd0000        	call	_ClearRxBuff
7128                     ; 1111 		PackAtCmd(nCmd);
7130  092f 7b14          	ld	a,(OFST+1,sp)
7131  0931 cd0375        	call	_PackAtCmd
7133  0934               L5053:
7134                     ; 1116 	nTxRxLen = 0;
7136  0934 0f12          	clr	(OFST-1,sp)
7137                     ; 1117 	pnDat = GetUartRxBuf();
7139  0936 cd0000        	call	_GetUartRxBuf
7141  0939 1f10          	ldw	(OFST-3,sp),x
7143  093b cc0a85        	jra	L5153
7144  093e               L1153:
7145                     ; 1122 		FeedSoftWareIwdg();
7147  093e cd0000        	call	_FeedSoftWareIwdg
7149                     ; 1124 		dwNowTime = GetSysTemTick();
7151  0941 cd0000        	call	_GetSysTemTick
7153  0944 96            	ldw	x,sp
7154  0945 1c0009        	addw	x,#OFST-10
7155  0948 cd0000        	call	c_rtol
7157                     ; 1125 		if (dwTime < dwNowTime)
7159  094b 96            	ldw	x,sp
7160  094c 1c0005        	addw	x,#OFST-14
7161  094f cd0000        	call	c_ltor
7163  0952 96            	ldw	x,sp
7164  0953 1c0009        	addw	x,#OFST-10
7165  0956 cd0000        	call	c_lcmp
7167  0959 96            	ldw	x,sp
7168  095a 241a          	jruge	L1253
7169                     ; 1127 			 if(dwNowTime - dwTime > dwTimeOut)
7171  095c 1c0009        	addw	x,#OFST-10
7172  095f cd0000        	call	c_ltor
7174  0962 96            	ldw	x,sp
7175  0963 1c0005        	addw	x,#OFST-14
7176  0966 cd0000        	call	c_lsub
7178  0969 96            	ldw	x,sp
7179  096a 5c            	incw	x
7180  096b cd0000        	call	c_lcmp
7182  096e 2320          	jrule	L5253
7183                     ; 1129 				ClearRxBuff(); 
7185  0970 cd0000        	call	_ClearRxBuff
7187                     ; 1130 				break;
7189  0973 cc0a9c        	jra	L5043
7190  0976               L1253:
7191                     ; 1133 		else if ((dwTime - dwNowTime) > dwTimeOut)
7193  0976 1c0005        	addw	x,#OFST-14
7194  0979 cd0000        	call	c_ltor
7196  097c 96            	ldw	x,sp
7197  097d 1c0009        	addw	x,#OFST-10
7198  0980 cd0000        	call	c_lsub
7200  0983 96            	ldw	x,sp
7201  0984 5c            	incw	x
7202  0985 cd0000        	call	c_lcmp
7204  0988 2306          	jrule	L5253
7205                     ; 1135 			ClearRxBuff();
7207  098a cd0000        	call	_ClearRxBuff
7209                     ; 1136 			break;
7211  098d cc0a9c        	jra	L5043
7212  0990               L5253:
7213                     ; 1139 		if (0 == (nTxRxLen = CheckRevDataLen()))
7215  0990 cd0000        	call	_CheckRevDataLen
7217  0993 6b12          	ld	(OFST-1,sp),a
7218  0995 27a4          	jreq	L5153
7219                     ; 1141 			continue;
7221                     ; 1144 		nData = *(pnDat + nTxRxLen - 1); 		//不需要判断头,尾之类
7223  0997 7b10          	ld	a,(OFST-3,sp)
7224  0999 97            	ld	xl,a
7225  099a 7b11          	ld	a,(OFST-2,sp)
7226  099c 1b12          	add	a,(OFST-1,sp)
7227  099e 2401          	jrnc	L224
7228  09a0 5c            	incw	x
7229  09a1               L224:
7230  09a1 02            	rlwa	x,a
7231  09a2 5a            	decw	x
7232  09a3 f6            	ld	a,(x)
7233  09a4 6b13          	ld	(OFST+0,sp),a
7234                     ; 1156 		DecodeParameter(pnDat, CheckRevDataLen());
7236  09a6 cd0000        	call	_CheckRevDataLen
7238  09a9 88            	push	a
7239  09aa 1e11          	ldw	x,(OFST-2,sp)
7240  09ac cd25e8        	call	_DecodeParameter
7242  09af 84            	pop	a
7243                     ; 1162 		if ( (nData == AT_TAIL_0) || (nData == AT_TAIL_1) ) 	//0d0a
7245  09b0 7b13          	ld	a,(OFST+0,sp)
7246  09b2 a10d          	cp	a,#13
7247  09b4 2704          	jreq	L5353
7249  09b6 a10a          	cp	a,#10
7250  09b8 2681          	jrne	L5153
7251  09ba               L5353:
7252                     ; 1164 			if (pnMatch1 != NULL)
7254  09ba 1e19          	ldw	x,(OFST+6,sp)
7255  09bc 2730          	jreq	L7353
7256                     ; 1166 				nStrLen = (u8)JX_Strlen((char *)pnMatch1);
7258  09be cd0316        	call	_JX_Strlen
7260  09c1 6b13          	ld	(OFST+0,sp),a
7261                     ; 1167 				if	((nTxRxLen >= nStrLen) && 
7261                     ; 1168 					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch1, nStrLen)) != NULL))
7263  09c3 7b12          	ld	a,(OFST-1,sp)
7264  09c5 1113          	cp	a,(OFST+0,sp)
7265  09c7 2525          	jrult	L7353
7267  09c9 7b13          	ld	a,(OFST+0,sp)
7268  09cb cd0ab0        	call	LC012
7269  09ce 89            	pushw	x
7270  09cf be00          	ldw	x,c_lreg
7271  09d1 89            	pushw	x
7272  09d2 1e1d          	ldw	x,(OFST+10,sp)
7273  09d4 89            	pushw	x
7274  09d5 7b18          	ld	a,(OFST+5,sp)
7275  09d7 cd0ab0        	call	LC012
7276  09da 89            	pushw	x
7277  09db be00          	ldw	x,c_lreg
7278  09dd 89            	pushw	x
7279  09de 1e1a          	ldw	x,(OFST+7,sp)
7280  09e0 cd07b8        	call	_QH_bufbuf
7282  09e3 5b0a          	addw	sp,#10
7283  09e5 1f0e          	ldw	(OFST-5,sp),x
7284  09e7 2705          	jreq	L7353
7285                     ; 1170 					nRtnVal = 1;
7287  09e9 a601          	ld	a,#1
7288                     ; 1171 					goto  __UC_CommAT_Exit;
7290  09eb cc0a81        	jp	LC011
7291  09ee               L7353:
7292                     ; 1174 			if (pnMatch2 != NULL)
7294  09ee 1e1b          	ldw	x,(OFST+8,sp)
7295  09f0 272f          	jreq	L3453
7296                     ; 1176 				nStrLen = (u8)JX_Strlen((char *)pnMatch2);
7298  09f2 cd0316        	call	_JX_Strlen
7300  09f5 6b13          	ld	(OFST+0,sp),a
7301                     ; 1177 				if	((nTxRxLen >= nStrLen) && 
7301                     ; 1178 					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch2, nStrLen)) != NULL))
7303  09f7 7b12          	ld	a,(OFST-1,sp)
7304  09f9 1113          	cp	a,(OFST+0,sp)
7305  09fb 2524          	jrult	L3453
7307  09fd 7b13          	ld	a,(OFST+0,sp)
7308  09ff cd0ab0        	call	LC012
7309  0a02 89            	pushw	x
7310  0a03 be00          	ldw	x,c_lreg
7311  0a05 89            	pushw	x
7312  0a06 1e1f          	ldw	x,(OFST+12,sp)
7313  0a08 89            	pushw	x
7314  0a09 7b18          	ld	a,(OFST+5,sp)
7315  0a0b cd0ab0        	call	LC012
7316  0a0e 89            	pushw	x
7317  0a0f be00          	ldw	x,c_lreg
7318  0a11 89            	pushw	x
7319  0a12 1e1a          	ldw	x,(OFST+7,sp)
7320  0a14 cd07b8        	call	_QH_bufbuf
7322  0a17 5b0a          	addw	sp,#10
7323  0a19 1f0e          	ldw	(OFST-5,sp),x
7324  0a1b 2704          	jreq	L3453
7325                     ; 1180 					nRtnVal = 2;
7327  0a1d a602          	ld	a,#2
7328                     ; 1181 					goto  __UC_CommAT_Exit;
7330  0a1f 2060          	jp	LC011
7331  0a21               L3453:
7332                     ; 1184 			if (pnMatch3 != NULL)
7334  0a21 1e1d          	ldw	x,(OFST+10,sp)
7335  0a23 272d          	jreq	L7453
7336                     ; 1186 				nStrLen = (u8)JX_Strlen((char *)pnMatch3);
7338  0a25 cd0316        	call	_JX_Strlen
7340  0a28 6b13          	ld	(OFST+0,sp),a
7341                     ; 1187 				if	((nTxRxLen >= nStrLen) && 
7341                     ; 1188 					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch3, nStrLen)) != NULL))
7343  0a2a 7b12          	ld	a,(OFST-1,sp)
7344  0a2c 1113          	cp	a,(OFST+0,sp)
7345  0a2e 2522          	jrult	L7453
7347  0a30 7b13          	ld	a,(OFST+0,sp)
7348  0a32 ad7c          	call	LC012
7349  0a34 89            	pushw	x
7350  0a35 be00          	ldw	x,c_lreg
7351  0a37 89            	pushw	x
7352  0a38 1e21          	ldw	x,(OFST+14,sp)
7353  0a3a 89            	pushw	x
7354  0a3b 7b18          	ld	a,(OFST+5,sp)
7355  0a3d ad71          	call	LC012
7356  0a3f 89            	pushw	x
7357  0a40 be00          	ldw	x,c_lreg
7358  0a42 89            	pushw	x
7359  0a43 1e1a          	ldw	x,(OFST+7,sp)
7360  0a45 cd07b8        	call	_QH_bufbuf
7362  0a48 5b0a          	addw	sp,#10
7363  0a4a 1f0e          	ldw	(OFST-5,sp),x
7364  0a4c 2704          	jreq	L7453
7365                     ; 1190 					nRtnVal = 3;
7367  0a4e a603          	ld	a,#3
7368                     ; 1191 					goto  __UC_CommAT_Exit;
7370  0a50 202f          	jp	LC011
7371  0a52               L7453:
7372                     ; 1194 			if (pnMatch4 != NULL)
7374  0a52 1e1f          	ldw	x,(OFST+12,sp)
7375  0a54 272f          	jreq	L5153
7376                     ; 1196 				nStrLen = (u8)JX_Strlen((char *)pnMatch4);
7378  0a56 cd0316        	call	_JX_Strlen
7380  0a59 6b13          	ld	(OFST+0,sp),a
7381                     ; 1197 				if	((nTxRxLen >= nStrLen) && 
7381                     ; 1198 					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch4, nStrLen)) != NULL))
7383  0a5b 7b12          	ld	a,(OFST-1,sp)
7384  0a5d 1113          	cp	a,(OFST+0,sp)
7385  0a5f 2524          	jrult	L5153
7387  0a61 7b13          	ld	a,(OFST+0,sp)
7388  0a63 ad4b          	call	LC012
7389  0a65 89            	pushw	x
7390  0a66 be00          	ldw	x,c_lreg
7391  0a68 89            	pushw	x
7392  0a69 1e23          	ldw	x,(OFST+16,sp)
7393  0a6b 89            	pushw	x
7394  0a6c 7b18          	ld	a,(OFST+5,sp)
7395  0a6e ad40          	call	LC012
7396  0a70 89            	pushw	x
7397  0a71 be00          	ldw	x,c_lreg
7398  0a73 89            	pushw	x
7399  0a74 1e1a          	ldw	x,(OFST+7,sp)
7400  0a76 cd07b8        	call	_QH_bufbuf
7402  0a79 5b0a          	addw	sp,#10
7403  0a7b 1f0e          	ldw	(OFST-5,sp),x
7404  0a7d 2706          	jreq	L5153
7405                     ; 1200 					nRtnVal = 4;
7407  0a7f a604          	ld	a,#4
7408  0a81               LC011:
7409  0a81 6b0d          	ld	(OFST-6,sp),a
7410                     ; 1201 					goto  __UC_CommAT_Exit;
7412  0a83 2017          	jra	L5043
7413  0a85               L5153:
7414                     ; 1119 	while ((dwTimeOut <= dwWaitmS) && (nTxRxLen < NUMBER_UART_RX))
7416  0a85 96            	ldw	x,sp
7417  0a86 5c            	incw	x
7418  0a87 cd0000        	call	c_ltor
7420  0a8a 96            	ldw	x,sp
7421  0a8b 1c0023        	addw	x,#OFST+16
7422  0a8e cd0000        	call	c_lcmp
7424  0a91 2209          	jrugt	L5043
7426  0a93 7b12          	ld	a,(OFST-1,sp)
7427  0a95 a1c0          	cp	a,#192
7428  0a97 2403cc093e    	jrult	L1153
7429  0a9c               L5043:
7430                     ; 1210 __UC_CommAT_Exit:
7430                     ; 1211 	if ((pnOutMatchPtr != NULL) && (pnMatchTagStr != NULL))
7432  0a9c 1e21          	ldw	x,(OFST+14,sp)
7433  0a9e 2709          	jreq	L1653
7435  0aa0 1e0e          	ldw	x,(OFST-5,sp)
7436  0aa2 2705          	jreq	L1653
7437                     ; 1213 		*pnOutMatchPtr = pnMatchTagStr;
7439  0aa4 1e21          	ldw	x,(OFST+14,sp)
7440  0aa6 160e          	ldw	y,(OFST-5,sp)
7441  0aa8 ff            	ldw	(x),y
7442  0aa9               L1653:
7443                     ; 1215 	if (nTxRxLen > 0)
7445  0aa9 0d12          	tnz	(OFST-1,sp)
7446                     ; 1220 	return (nRtnVal); 
7448  0aab 7b0d          	ld	a,(OFST-6,sp)
7451  0aad 5b14          	addw	sp,#20
7452  0aaf 81            	ret	
7454  0ab0               LC012:
7455  0ab0 b703          	ld	c_lreg+3,a
7456  0ab2 3f02          	clr	c_lreg+2
7457  0ab4 3f01          	clr	c_lreg+1
7458  0ab6 3f00          	clr	c_lreg
7459  0ab8 be02          	ldw	x,c_lreg+2
7460  0aba 81            	ret	
7662                     ; 1232 uint8_t  UC_CommATExt(u8 nCmd, u8 *pnParameter1, u8 *pnParameter2, u8 *pnParameter3, uint8_t *pnMatch1, uint8_t *pnMatch2, uint8_t *pnMatch3, 
7662                     ; 1233 					 uint8_t *pnMatch4, uint8_t **pnOutMatchPtr, uint32_t dwWaitmS)
7662                     ; 1234 {
7663                     	switch	.text
7664  0abb               _UC_CommATExt:
7666  0abb 88            	push	a
7667  0abc 5213          	subw	sp,#19
7668       00000013      OFST:	set	19
7671                     ; 1235 	uint32_t  dwTimeOut = 0, dwTime = 0, dwNowTime = 0;
7673  0abe 96            	ldw	x,sp
7674  0abf 5c            	incw	x
7675  0ac0 cd0000        	call	c_ltor
7679  0ac3 96            	ldw	x,sp
7680  0ac4 1c0005        	addw	x,#OFST-14
7681  0ac7 cd0000        	call	c_ltor
7685  0aca 96            	ldw	x,sp
7686  0acb 1c0009        	addw	x,#OFST-10
7687  0ace cd0000        	call	c_ltor
7689                     ; 1236 	uint8_t   *pnMatchTagStr = NULL, nRtnVal = 0;
7691  0ad1 5f            	clrw	x
7692  0ad2 1f0d          	ldw	(OFST-6,sp),x
7695  0ad4 0f0f          	clr	(OFST-4,sp)
7696                     ; 1237 	uint8_t   nData = 0, *pnDat = NULL, nTxRxLen = 0, nStrLen = 0;
7704                     ; 1240 	dwTime = GetSysTemTick();	
7706  0ad6 cd0000        	call	_GetSysTemTick
7708  0ad9 96            	ldw	x,sp
7709  0ada 1c0005        	addw	x,#OFST-14
7710  0add cd0000        	call	c_rtol
7712                     ; 1241 	dwTimeOut = (dwWaitmS);
7714  0ae0 1e29          	ldw	x,(OFST+22,sp)
7715  0ae2 1f03          	ldw	(OFST-16,sp),x
7716  0ae4 1e27          	ldw	x,(OFST+20,sp)
7717  0ae6 1f01          	ldw	(OFST-18,sp),x
7718                     ; 1244 	ClearRxBuff();
7720  0ae8 cd0000        	call	_ClearRxBuff
7722                     ; 1246 	if(AT_CMD_TCPSEND == nCmd)
7724  0aeb 7b14          	ld	a,(OFST+1,sp)
7725  0aed a13d          	cp	a,#61
7726  0aef 2608          	jrne	L3763
7727                     ; 1248 		PackAtCmdTcpsend(ucNumberMessage);
7729  0af1 c600d1        	ld	a,_ucNumberMessage
7730  0af4 cd05f8        	call	_PackAtCmdTcpsend
7733  0af7 2045          	jra	L5763
7734  0af9               L3763:
7735                     ; 1250 	else if((AT_CMD_NULL == nCmd)&&(NULL != pnParameter1)) /* 特殊处理需要发送的数据 */
7737  0af9 4c            	inc	a
7738  0afa 260a          	jrne	L7763
7740  0afc 1e17          	ldw	x,(OFST+4,sp)
7741  0afe 2706          	jreq	L7763
7742                     ; 1252 		PackTcpSendData(*pnParameter1);
7744  0b00 f6            	ld	a,(x)
7745  0b01 cd06c4        	call	_PackTcpSendData
7748  0b04 2038          	jra	L5763
7749  0b06               L7763:
7750                     ; 1254 	else if((NULL != pnParameter1)&&(NULL != pnParameter2)&&(NULL == pnParameter3))
7752  0b06 1e17          	ldw	x,(OFST+4,sp)
7753  0b08 2717          	jreq	L3073
7755  0b0a 1e19          	ldw	x,(OFST+6,sp)
7756  0b0c 2713          	jreq	L3073
7758  0b0e 1e1b          	ldw	x,(OFST+8,sp)
7759  0b10 260f          	jrne	L3073
7760                     ; 1256 		PackAtCmdParameter2(nCmd, pnParameter1, pnParameter2);
7762  0b12 1e19          	ldw	x,(OFST+6,sp)
7763  0b14 89            	pushw	x
7764  0b15 1e19          	ldw	x,(OFST+6,sp)
7765  0b17 89            	pushw	x
7766  0b18 7b18          	ld	a,(OFST+5,sp)
7767  0b1a cd045f        	call	_PackAtCmdParameter2
7769  0b1d 5b04          	addw	sp,#4
7771  0b1f 201d          	jra	L5763
7772  0b21               L3073:
7773                     ; 1258 	else if((NULL != pnParameter1)&&(NULL != pnParameter2)&&(NULL != pnParameter3))
7775  0b21 1e17          	ldw	x,(OFST+4,sp)
7776  0b23 2603cc0cc1    	jreq	L625
7778  0b28 1e19          	ldw	x,(OFST+6,sp)
7779  0b2a 27f9          	jreq	L625
7781  0b2c 1e1b          	ldw	x,(OFST+8,sp)
7782  0b2e 27f5          	jreq	L625
7783                     ; 1260 		PackAtCmdParameter3(nCmd, pnParameter1, pnParameter2, pnParameter3);
7785  0b30 89            	pushw	x
7786  0b31 1e1b          	ldw	x,(OFST+8,sp)
7787  0b33 89            	pushw	x
7788  0b34 1e1b          	ldw	x,(OFST+8,sp)
7789  0b36 89            	pushw	x
7790  0b37 7b1a          	ld	a,(OFST+7,sp)
7791  0b39 cd050f        	call	_PackAtCmdParameter3
7793  0b3c 5b06          	addw	sp,#6
7795  0b3e               L5763:
7796                     ; 1267 	nTxRxLen = 0;
7798  0b3e 0f12          	clr	(OFST-1,sp)
7799                     ; 1268 	pnDat = GetUartRxBuf();
7801  0b40 cd0000        	call	_GetUartRxBuf
7803  0b43 1f10          	ldw	(OFST-3,sp),x
7804                     ; 1269 	UC_SleepFunc(10);
7806  0b45 ae000a        	ldw	x,#10
7807  0b48 89            	pushw	x
7808  0b49 5f            	clrw	x
7809  0b4a 89            	pushw	x
7810  0b4b cd0760        	call	_UC_SleepFunc
7812  0b4e 5b04          	addw	sp,#4
7814  0b50 cc0c9b        	jra	L5173
7815                     ; 1264 		return nRtnVal;
7817  0b53               L3173:
7818                     ; 1275 		FeedSoftWareIwdg();
7820  0b53 cd0000        	call	_FeedSoftWareIwdg
7822                     ; 1277 		dwNowTime = GetSysTemTick();
7824  0b56 cd0000        	call	_GetSysTemTick
7826  0b59 96            	ldw	x,sp
7827  0b5a 1c0009        	addw	x,#OFST-10
7828  0b5d cd0000        	call	c_rtol
7830                     ; 1278 		if (dwTime < dwNowTime)
7832  0b60 96            	ldw	x,sp
7833  0b61 1c0005        	addw	x,#OFST-14
7834  0b64 cd0000        	call	c_ltor
7836  0b67 96            	ldw	x,sp
7837  0b68 1c0009        	addw	x,#OFST-10
7838  0b6b cd0000        	call	c_lcmp
7840  0b6e 96            	ldw	x,sp
7841  0b6f 2417          	jruge	L1273
7842                     ; 1280 			 if(dwNowTime - dwTime > dwTimeOut)
7844  0b71 1c0009        	addw	x,#OFST-10
7845  0b74 cd0000        	call	c_ltor
7847  0b77 96            	ldw	x,sp
7848  0b78 1c0005        	addw	x,#OFST-14
7849  0b7b cd0000        	call	c_lsub
7851  0b7e 96            	ldw	x,sp
7852  0b7f 5c            	incw	x
7853  0b80 cd0000        	call	c_lcmp
7855  0b83 2317          	jrule	L5273
7856                     ; 1283 				break;
7858  0b85 cc0cb2        	jra	L5653
7859  0b88               L1273:
7860                     ; 1286 		else if ((dwTime - dwNowTime) > dwTimeOut)
7862  0b88 1c0005        	addw	x,#OFST-14
7863  0b8b cd0000        	call	c_ltor
7865  0b8e 96            	ldw	x,sp
7866  0b8f 1c0009        	addw	x,#OFST-10
7867  0b92 cd0000        	call	c_lsub
7869  0b95 96            	ldw	x,sp
7870  0b96 5c            	incw	x
7871  0b97 cd0000        	call	c_lcmp
7873  0b9a 22e9          	jrugt	L5653
7874                     ; 1289 			break;
7876  0b9c               L5273:
7877                     ; 1292 		if (0 == (nTxRxLen = CheckRevDataLen()))
7879  0b9c cd0000        	call	_CheckRevDataLen
7881  0b9f 6b12          	ld	(OFST-1,sp),a
7882  0ba1 27ad          	jreq	L5173
7883                     ; 1294 			continue;
7885                     ; 1297 		nData = *(pnDat + nTxRxLen - 1); 		//不需要判断头,尾之类
7887  0ba3 7b10          	ld	a,(OFST-3,sp)
7888  0ba5 97            	ld	xl,a
7889  0ba6 7b11          	ld	a,(OFST-2,sp)
7890  0ba8 1b12          	add	a,(OFST-1,sp)
7891  0baa 2401          	jrnc	L005
7892  0bac 5c            	incw	x
7893  0bad               L005:
7894  0bad 02            	rlwa	x,a
7895  0bae 5a            	decw	x
7896  0baf f6            	ld	a,(x)
7897  0bb0 6b13          	ld	(OFST+0,sp),a
7898                     ; 1302 		DecodeParameter(pnDat, CheckRevDataLen());
7900  0bb2 cd0000        	call	_CheckRevDataLen
7902  0bb5 88            	push	a
7903  0bb6 1e11          	ldw	x,(OFST-2,sp)
7904  0bb8 cd25e8        	call	_DecodeParameter
7906  0bbb 84            	pop	a
7907                     ; 1308 		if ( (2 <= nTxRxLen)||((nData == AT_TAIL_0) || (nData == AT_TAIL_1)|| (nData == '>')) ) 	// (2 <= nTxRxLen)&& 此处特殊处理发送长度时回复的'>'
7909  0bbc 7b12          	ld	a,(OFST-1,sp)
7910  0bbe a102          	cp	a,#2
7911  0bc0 240e          	jruge	L5373
7913  0bc2 7b13          	ld	a,(OFST+0,sp)
7914  0bc4 a10d          	cp	a,#13
7915  0bc6 2708          	jreq	L5373
7917  0bc8 a10a          	cp	a,#10
7918  0bca 2704          	jreq	L5373
7920  0bcc a13e          	cp	a,#62
7921  0bce 2680          	jrne	L5173
7922  0bd0               L5373:
7923                     ; 1310 			if (pnMatch1 != NULL)
7925  0bd0 1e1d          	ldw	x,(OFST+10,sp)
7926  0bd2 2730          	jreq	L3473
7927                     ; 1312 				nStrLen = (u8)JX_Strlen((char *)pnMatch1);
7929  0bd4 cd0316        	call	_JX_Strlen
7931  0bd7 6b13          	ld	(OFST+0,sp),a
7932                     ; 1313 				if	((nTxRxLen >= nStrLen) && 
7932                     ; 1314 					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch1, nStrLen)) != NULL))
7934  0bd9 7b12          	ld	a,(OFST-1,sp)
7935  0bdb 1113          	cp	a,(OFST+0,sp)
7936  0bdd 2525          	jrult	L3473
7938  0bdf 7b13          	ld	a,(OFST+0,sp)
7939  0be1 cd0cc6        	call	LC014
7940  0be4 89            	pushw	x
7941  0be5 be00          	ldw	x,c_lreg
7942  0be7 89            	pushw	x
7943  0be8 1e21          	ldw	x,(OFST+14,sp)
7944  0bea 89            	pushw	x
7945  0beb 7b18          	ld	a,(OFST+5,sp)
7946  0bed cd0cc6        	call	LC014
7947  0bf0 89            	pushw	x
7948  0bf1 be00          	ldw	x,c_lreg
7949  0bf3 89            	pushw	x
7950  0bf4 1e1a          	ldw	x,(OFST+7,sp)
7951  0bf6 cd07b8        	call	_QH_bufbuf
7953  0bf9 5b0a          	addw	sp,#10
7954  0bfb 1f0d          	ldw	(OFST-6,sp),x
7955  0bfd 2705          	jreq	L3473
7956                     ; 1316 					nRtnVal = 1;
7958  0bff a601          	ld	a,#1
7959                     ; 1317 					goto  __UC_CommAT_Exit;
7961  0c01 cc0c97        	jp	LC013
7962  0c04               L3473:
7963                     ; 1320 			if (pnMatch2 != NULL)
7965  0c04 1e1f          	ldw	x,(OFST+12,sp)
7966  0c06 272f          	jreq	L7473
7967                     ; 1322 				nStrLen = (u8)JX_Strlen((char *)pnMatch2);
7969  0c08 cd0316        	call	_JX_Strlen
7971  0c0b 6b13          	ld	(OFST+0,sp),a
7972                     ; 1323 				if	((nTxRxLen >= nStrLen) && 
7972                     ; 1324 					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch2, nStrLen)) != NULL))
7974  0c0d 7b12          	ld	a,(OFST-1,sp)
7975  0c0f 1113          	cp	a,(OFST+0,sp)
7976  0c11 2524          	jrult	L7473
7978  0c13 7b13          	ld	a,(OFST+0,sp)
7979  0c15 cd0cc6        	call	LC014
7980  0c18 89            	pushw	x
7981  0c19 be00          	ldw	x,c_lreg
7982  0c1b 89            	pushw	x
7983  0c1c 1e23          	ldw	x,(OFST+16,sp)
7984  0c1e 89            	pushw	x
7985  0c1f 7b18          	ld	a,(OFST+5,sp)
7986  0c21 cd0cc6        	call	LC014
7987  0c24 89            	pushw	x
7988  0c25 be00          	ldw	x,c_lreg
7989  0c27 89            	pushw	x
7990  0c28 1e1a          	ldw	x,(OFST+7,sp)
7991  0c2a cd07b8        	call	_QH_bufbuf
7993  0c2d 5b0a          	addw	sp,#10
7994  0c2f 1f0d          	ldw	(OFST-6,sp),x
7995  0c31 2704          	jreq	L7473
7996                     ; 1326 					nRtnVal = 2;
7998  0c33 a602          	ld	a,#2
7999                     ; 1327 					goto  __UC_CommAT_Exit;
8001  0c35 2060          	jp	LC013
8002  0c37               L7473:
8003                     ; 1330 			if (pnMatch3 != NULL)
8005  0c37 1e21          	ldw	x,(OFST+14,sp)
8006  0c39 272d          	jreq	L3573
8007                     ; 1332 				nStrLen = (u8)JX_Strlen((char *)pnMatch3);
8009  0c3b cd0316        	call	_JX_Strlen
8011  0c3e 6b13          	ld	(OFST+0,sp),a
8012                     ; 1333 				if	((nTxRxLen >= nStrLen) && 
8012                     ; 1334 					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch3, nStrLen)) != NULL))
8014  0c40 7b12          	ld	a,(OFST-1,sp)
8015  0c42 1113          	cp	a,(OFST+0,sp)
8016  0c44 2522          	jrult	L3573
8018  0c46 7b13          	ld	a,(OFST+0,sp)
8019  0c48 ad7c          	call	LC014
8020  0c4a 89            	pushw	x
8021  0c4b be00          	ldw	x,c_lreg
8022  0c4d 89            	pushw	x
8023  0c4e 1e25          	ldw	x,(OFST+18,sp)
8024  0c50 89            	pushw	x
8025  0c51 7b18          	ld	a,(OFST+5,sp)
8026  0c53 ad71          	call	LC014
8027  0c55 89            	pushw	x
8028  0c56 be00          	ldw	x,c_lreg
8029  0c58 89            	pushw	x
8030  0c59 1e1a          	ldw	x,(OFST+7,sp)
8031  0c5b cd07b8        	call	_QH_bufbuf
8033  0c5e 5b0a          	addw	sp,#10
8034  0c60 1f0d          	ldw	(OFST-6,sp),x
8035  0c62 2704          	jreq	L3573
8036                     ; 1336 					nRtnVal = 3;
8038  0c64 a603          	ld	a,#3
8039                     ; 1337 					goto  __UC_CommAT_Exit;
8041  0c66 202f          	jp	LC013
8042  0c68               L3573:
8043                     ; 1340 			if (pnMatch4 != NULL)
8045  0c68 1e23          	ldw	x,(OFST+16,sp)
8046  0c6a 272f          	jreq	L5173
8047                     ; 1342 				nStrLen = (u8)JX_Strlen((char *)pnMatch4);
8049  0c6c cd0316        	call	_JX_Strlen
8051  0c6f 6b13          	ld	(OFST+0,sp),a
8052                     ; 1343 				if	((nTxRxLen >= nStrLen) && 
8052                     ; 1344 					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch4, nStrLen)) != NULL))
8054  0c71 7b12          	ld	a,(OFST-1,sp)
8055  0c73 1113          	cp	a,(OFST+0,sp)
8056  0c75 2524          	jrult	L5173
8058  0c77 7b13          	ld	a,(OFST+0,sp)
8059  0c79 ad4b          	call	LC014
8060  0c7b 89            	pushw	x
8061  0c7c be00          	ldw	x,c_lreg
8062  0c7e 89            	pushw	x
8063  0c7f 1e27          	ldw	x,(OFST+20,sp)
8064  0c81 89            	pushw	x
8065  0c82 7b18          	ld	a,(OFST+5,sp)
8066  0c84 ad40          	call	LC014
8067  0c86 89            	pushw	x
8068  0c87 be00          	ldw	x,c_lreg
8069  0c89 89            	pushw	x
8070  0c8a 1e1a          	ldw	x,(OFST+7,sp)
8071  0c8c cd07b8        	call	_QH_bufbuf
8073  0c8f 5b0a          	addw	sp,#10
8074  0c91 1f0d          	ldw	(OFST-6,sp),x
8075  0c93 2706          	jreq	L5173
8076                     ; 1346 					nRtnVal = 4;
8078  0c95 a604          	ld	a,#4
8079  0c97               LC013:
8080  0c97 6b0f          	ld	(OFST-4,sp),a
8081                     ; 1347 					goto  __UC_CommAT_Exit;
8083  0c99 2017          	jra	L5653
8084  0c9b               L5173:
8085                     ; 1272 	while ((dwTimeOut <= dwWaitmS) && (nTxRxLen < NUMBER_UART_RX))
8087  0c9b 96            	ldw	x,sp
8088  0c9c 5c            	incw	x
8089  0c9d cd0000        	call	c_ltor
8091  0ca0 96            	ldw	x,sp
8092  0ca1 1c0027        	addw	x,#OFST+20
8093  0ca4 cd0000        	call	c_lcmp
8095  0ca7 2209          	jrugt	L5653
8097  0ca9 7b12          	ld	a,(OFST-1,sp)
8098  0cab a1c0          	cp	a,#192
8099  0cad 2403cc0b53    	jrult	L3173
8100  0cb2               L5653:
8101                     ; 1356 __UC_CommAT_Exit:
8101                     ; 1357 	if ((pnOutMatchPtr != NULL) && (pnMatchTagStr != NULL))
8103  0cb2 1e25          	ldw	x,(OFST+18,sp)
8104  0cb4 2709          	jreq	L5673
8106  0cb6 1e0d          	ldw	x,(OFST-6,sp)
8107  0cb8 2705          	jreq	L5673
8108                     ; 1359 		*pnOutMatchPtr = pnMatchTagStr;
8110  0cba 1e25          	ldw	x,(OFST+18,sp)
8111  0cbc 160d          	ldw	y,(OFST-6,sp)
8112  0cbe ff            	ldw	(x),y
8113  0cbf               L5673:
8114                     ; 1361 	if (nTxRxLen > 0)
8116  0cbf 0d12          	tnz	(OFST-1,sp)
8117                     ; 1366 	return (nRtnVal); 
8120  0cc1               L625:
8122  0cc1 7b0f          	ld	a,(OFST-4,sp)
8124  0cc3 5b14          	addw	sp,#20
8125  0cc5 81            	ret	
8127  0cc6               LC014:
8128  0cc6 b703          	ld	c_lreg+3,a
8129  0cc8 3f02          	clr	c_lreg+2
8130  0cca 3f01          	clr	c_lreg+1
8131  0ccc 3f00          	clr	c_lreg
8132  0cce be02          	ldw	x,c_lreg+2
8133  0cd0 81            	ret	
8165                     ; 1375 uint8_t  SIMGetRegisterStat(void)
8165                     ; 1376 {
8166                     	switch	.text
8167  0cd1               _SIMGetRegisterStat:
8169  0cd1 88            	push	a
8170       00000001      OFST:	set	1
8173                     ; 1377 	uint8_t  nTmp = 0;
8175  0cd2 0f01          	clr	(OFST+0,sp)
8176                     ; 1380 	nTmp = UC_CommAT(AT_CMD_CREG,	NULL, "+CREG: 0,1", "+CREG: 0,5", "ERROR", NULL, NULL, 1000);
8178  0cd4 ae03e8        	ldw	x,#1000
8179  0cd7 89            	pushw	x
8180  0cd8 5f            	clrw	x
8181  0cd9 89            	pushw	x
8182  0cda 89            	pushw	x
8183  0cdb 89            	pushw	x
8184  0cdc ae0670        	ldw	x,#L1104
8185  0cdf 89            	pushw	x
8186  0ce0 ae065a        	ldw	x,#L7004
8187  0ce3 89            	pushw	x
8188  0ce4 ae0665        	ldw	x,#L5004
8189  0ce7 89            	pushw	x
8190  0ce8 5f            	clrw	x
8191  0ce9 89            	pushw	x
8192  0cea a61a          	ld	a,#26
8193  0cec cd08e1        	call	_UC_CommAT
8195  0cef 5b10          	addw	sp,#16
8196  0cf1 6b01          	ld	(OFST+0,sp),a
8197                     ; 1381 	if((nTmp != 1)&&(nTmp != 2))
8199  0cf3 a101          	cp	a,#1
8200  0cf5 2709          	jreq	L3104
8202  0cf7 a102          	cp	a,#2
8203  0cf9 2705          	jreq	L3104
8204                     ; 1383 		return SIM_REG_FAILURE;
8206  0cfb a602          	ld	a,#2
8209  0cfd 5b01          	addw	sp,#1
8210  0cff 81            	ret	
8211  0d00               L3104:
8212                     ; 1385 	return SIM_REG_SUCCESS;
8214  0d00 a601          	ld	a,#1
8217  0d02 5b01          	addw	sp,#1
8218  0d04 81            	ret	
8274                     	switch	.const
8275  0475               L245:
8276  0475 00000020      	dc.l	32
8277                     ; 1394 uint8_t  SIMGL868_UpdateSignal(void)
8277                     ; 1395 {
8278                     	switch	.text
8279  0d05               _SIMGL868_UpdateSignal:
8281  0d05 5208          	subw	sp,#8
8282       00000008      OFST:	set	8
8285                     ; 1396 	uint32_t  dwSignalStr = 0;
8287  0d07 5f            	clrw	x
8288  0d08 1f03          	ldw	(OFST-5,sp),x
8289  0d0a 1f01          	ldw	(OFST-7,sp),x
8290                     ; 1400 	if (UC_CommAT(AT_CMD_CSQ, NULL, "+CSQ:", NULL, NULL, NULL, &pnRecvBuf, 1000) == 1)
8292  0d0c ae03e8        	ldw	x,#1000
8293  0d0f 89            	pushw	x
8294  0d10 5f            	clrw	x
8295  0d11 89            	pushw	x
8296  0d12 96            	ldw	x,sp
8297  0d13 1c000b        	addw	x,#OFST+3
8298  0d16 89            	pushw	x
8299  0d17 5f            	clrw	x
8300  0d18 89            	pushw	x
8301  0d19 89            	pushw	x
8302  0d1a 89            	pushw	x
8303  0d1b ae0654        	ldw	x,#L3404
8304  0d1e 89            	pushw	x
8305  0d1f 5f            	clrw	x
8306  0d20 89            	pushw	x
8307  0d21 a61f          	ld	a,#31
8308  0d23 cd08e1        	call	_UC_CommAT
8310  0d26 5b10          	addw	sp,#16
8311  0d28 4a            	dec	a
8312  0d29 2632          	jrne	L1404
8313                     ; 1402 		pnRecvBufEnd = (uint8_t  *)(pnRecvBuf + JX_Strlen((char *)pnRecvBuf));
8315  0d2b 1e07          	ldw	x,(OFST-1,sp)
8316  0d2d cd0316        	call	_JX_Strlen
8318  0d30 5f            	clrw	x
8319  0d31 97            	ld	xl,a
8320  0d32 72fb07        	addw	x,(OFST-1,sp)
8321  0d35 1f05          	ldw	(OFST-3,sp),x
8322                     ; 1403 		if (((uint32_t)(pnRecvBufEnd - pnRecvBuf) < 32) && (pnRecvBuf != NULL) &&
8322                     ; 1404 			(QH_SearchStrVal((int8_t *)pnRecvBuf, (int8_t *)pnRecvBufEnd, &dwSignalStr) == TRUE))
8324  0d37 72f007        	subw	x,(OFST-1,sp)
8325  0d3a cd0000        	call	c_itolx
8327  0d3d ae0475        	ldw	x,#L245
8328  0d40 cd0000        	call	c_lcmp
8330  0d43 2418          	jruge	L1404
8332  0d45 1e07          	ldw	x,(OFST-1,sp)
8333  0d47 2714          	jreq	L1404
8335  0d49 96            	ldw	x,sp
8336  0d4a 5c            	incw	x
8337  0d4b 89            	pushw	x
8338  0d4c 1e07          	ldw	x,(OFST-1,sp)
8339  0d4e 89            	pushw	x
8340  0d4f 1e0b          	ldw	x,(OFST+3,sp)
8341  0d51 cd0853        	call	_QH_SearchStrVal
8343  0d54 5b04          	addw	sp,#4
8344  0d56 4a            	dec	a
8345  0d57 2604          	jrne	L1404
8346                     ; 1406 			return ((uint8_t)dwSignalStr);
8348  0d59 7b04          	ld	a,(OFST-4,sp)
8350  0d5b 2001          	jra	L645
8351  0d5d               L1404:
8352                     ; 1410 	return (0);
8354  0d5d 4f            	clr	a
8356  0d5e               L645:
8358  0d5e 5b08          	addw	sp,#8
8359  0d60 81            	ret	
8424                     ; 1419 uint8_t  SIMGK7M_GetCIMI(u8 *pnOutBuf, u8 nLen)
8424                     ; 1420 {
8425                     	switch	.text
8426  0d61               _SIMGK7M_GetCIMI:
8428  0d61 89            	pushw	x
8429  0d62 5204          	subw	sp,#4
8430       00000004      OFST:	set	4
8433                     ; 1424 	if (UC_CommAT(AT_CMD_CIMI, NULL, "46", NULL, NULL, NULL, &pnRecvBuf, 1000) == 1)
8435  0d64 ae03e8        	ldw	x,#1000
8436  0d67 89            	pushw	x
8437  0d68 5f            	clrw	x
8438  0d69 89            	pushw	x
8439  0d6a 96            	ldw	x,sp
8440  0d6b 1c0007        	addw	x,#OFST+3
8441  0d6e 89            	pushw	x
8442  0d6f 5f            	clrw	x
8443  0d70 89            	pushw	x
8444  0d71 89            	pushw	x
8445  0d72 89            	pushw	x
8446  0d73 ae0651        	ldw	x,#L1014
8447  0d76 89            	pushw	x
8448  0d77 5f            	clrw	x
8449  0d78 89            	pushw	x
8450  0d79 a60d          	ld	a,#13
8451  0d7b cd08e1        	call	_UC_CommAT
8453  0d7e 5b10          	addw	sp,#16
8454  0d80 4a            	dec	a
8455  0d81 262f          	jrne	L7704
8456                     ; 1426 		pnRecvBufEnd = (uint8_t  *)(pnRecvBuf + JX_Strlen((char *)pnRecvBuf));
8458  0d83 1e03          	ldw	x,(OFST-1,sp)
8459  0d85 cd0316        	call	_JX_Strlen
8461  0d88 5f            	clrw	x
8462  0d89 97            	ld	xl,a
8463  0d8a 72fb03        	addw	x,(OFST-1,sp)
8464  0d8d 1f01          	ldw	(OFST-3,sp),x
8465                     ; 1427 		if (((uint32_t)(pnRecvBufEnd - pnRecvBuf) < 32) && (pnRecvBuf != NULL))
8467  0d8f 72f003        	subw	x,(OFST-1,sp)
8468  0d92 cd0000        	call	c_itolx
8470  0d95 ae0475        	ldw	x,#L245
8471  0d98 cd0000        	call	c_lcmp
8473  0d9b 2415          	jruge	L7704
8475  0d9d 1e03          	ldw	x,(OFST-1,sp)
8476  0d9f 2711          	jreq	L7704
8477                     ; 1429 			MemcpyFunc(pnOutBuf, pnRecvBuf, nLen);
8479  0da1 7b09          	ld	a,(OFST+5,sp)
8480  0da3 88            	push	a
8481  0da4 1e04          	ldw	x,(OFST+0,sp)
8482  0da6 89            	pushw	x
8483  0da7 1e08          	ldw	x,(OFST+4,sp)
8484  0da9 cd0000        	call	_MemcpyFunc
8486  0dac 5b03          	addw	sp,#3
8487                     ; 1430 			return TRUE;
8489  0dae a601          	ld	a,#1
8491  0db0 2001          	jra	L065
8492  0db2               L7704:
8493                     ; 1434 	return (0);
8495  0db2 4f            	clr	a
8497  0db3               L065:
8499  0db3 5b06          	addw	sp,#6
8500  0db5 81            	ret	
8565                     ; 1442 uint8_t  SIMGL868_GetCCID(u8 *pnOutBuf, u8 nLen)
8565                     ; 1443 {
8566                     	switch	.text
8567  0db6               _SIMGL868_GetCCID:
8569  0db6 89            	pushw	x
8570  0db7 5204          	subw	sp,#4
8571       00000004      OFST:	set	4
8574                     ; 1447 	if (UC_CommAT(AT_CMD_CCID, NULL, "89", NULL, NULL, NULL, &pnRecvBuf, 1000) == 1)
8576  0db9 ae03e8        	ldw	x,#1000
8577  0dbc 89            	pushw	x
8578  0dbd 5f            	clrw	x
8579  0dbe 89            	pushw	x
8580  0dbf 96            	ldw	x,sp
8581  0dc0 1c0007        	addw	x,#OFST+3
8582  0dc3 89            	pushw	x
8583  0dc4 5f            	clrw	x
8584  0dc5 89            	pushw	x
8585  0dc6 89            	pushw	x
8586  0dc7 89            	pushw	x
8587  0dc8 ae064e        	ldw	x,#L7314
8588  0dcb 89            	pushw	x
8589  0dcc 5f            	clrw	x
8590  0dcd 89            	pushw	x
8591  0dce a609          	ld	a,#9
8592  0dd0 cd08e1        	call	_UC_CommAT
8594  0dd3 5b10          	addw	sp,#16
8595  0dd5 4a            	dec	a
8596  0dd6 262f          	jrne	L5314
8597                     ; 1449 		pnRecvBufEnd = (uint8_t  *)(pnRecvBuf + JX_Strlen((char *)pnRecvBuf));
8599  0dd8 1e03          	ldw	x,(OFST-1,sp)
8600  0dda cd0316        	call	_JX_Strlen
8602  0ddd 5f            	clrw	x
8603  0dde 97            	ld	xl,a
8604  0ddf 72fb03        	addw	x,(OFST-1,sp)
8605  0de2 1f01          	ldw	(OFST-3,sp),x
8606                     ; 1450 		if (((uint32_t)(pnRecvBufEnd - pnRecvBuf) < 32) && (pnRecvBuf != NULL))
8608  0de4 72f003        	subw	x,(OFST-1,sp)
8609  0de7 cd0000        	call	c_itolx
8611  0dea ae0475        	ldw	x,#L245
8612  0ded cd0000        	call	c_lcmp
8614  0df0 2415          	jruge	L5314
8616  0df2 1e03          	ldw	x,(OFST-1,sp)
8617  0df4 2711          	jreq	L5314
8618                     ; 1452 			MemcpyFunc(pnOutBuf, pnRecvBuf, nLen);
8620  0df6 7b09          	ld	a,(OFST+5,sp)
8621  0df8 88            	push	a
8622  0df9 1e04          	ldw	x,(OFST+0,sp)
8623  0dfb 89            	pushw	x
8624  0dfc 1e08          	ldw	x,(OFST+4,sp)
8625  0dfe cd0000        	call	_MemcpyFunc
8627  0e01 5b03          	addw	sp,#3
8628                     ; 1453 			return TRUE;
8630  0e03 a601          	ld	a,#1
8632  0e05 2001          	jra	L275
8633  0e07               L5314:
8634                     ; 1457 	return (0);
8636  0e07 4f            	clr	a
8638  0e08               L275:
8640  0e08 5b06          	addw	sp,#6
8641  0e0a 81            	ret	
8644                     	switch	.data
8645  00cf               L3414_nFailCnt:
8646  00cf 00            	dc.b	0
8755                     ; 1469 u8 AT_CmdFailProc(u8 nCmd, u8 *pnParameter, uint8_t *pnMatch1, uint8_t *pnMatch2, uint8_t *pnMatch3, 
8755                     ; 1470 					 uint8_t *pnMatch4, uint8_t **pnOutMatchPtr, uint32_t dwWaitmS)
8755                     ; 1471 {
8756                     	switch	.text
8757  0e0b               _AT_CmdFailProc:
8759  0e0b 88            	push	a
8760       00000000      OFST:	set	0
8763                     ; 1474 	if(1 != UC_CommAT(nCmd, pnParameter, pnMatch1, pnMatch2, pnMatch3, pnMatch4, pnOutMatchPtr, dwWaitmS))
8765  0e0c 1e12          	ldw	x,(OFST+18,sp)
8766  0e0e 89            	pushw	x
8767  0e0f 1e12          	ldw	x,(OFST+18,sp)
8768  0e11 89            	pushw	x
8769  0e12 1e12          	ldw	x,(OFST+18,sp)
8770  0e14 89            	pushw	x
8771  0e15 1e12          	ldw	x,(OFST+18,sp)
8772  0e17 89            	pushw	x
8773  0e18 1e12          	ldw	x,(OFST+18,sp)
8774  0e1a 89            	pushw	x
8775  0e1b 1e12          	ldw	x,(OFST+18,sp)
8776  0e1d 89            	pushw	x
8777  0e1e 1e12          	ldw	x,(OFST+18,sp)
8778  0e20 89            	pushw	x
8779  0e21 1e12          	ldw	x,(OFST+18,sp)
8780  0e23 89            	pushw	x
8781  0e24 cd08e1        	call	_UC_CommAT
8783  0e27 5b10          	addw	sp,#16
8784  0e29 4a            	dec	a
8785  0e2a 271d          	jreq	L5124
8786                     ; 1476 		nFailCnt++;
8788  0e2c 725c00cf      	inc	L3414_nFailCnt
8789                     ; 1477 		if(TO_MAXCNT < nFailCnt)
8791  0e30 c600cf        	ld	a,L3414_nFailCnt
8792  0e33 a103          	cp	a,#3
8793  0e35 2519          	jrult	L1224
8794                     ; 1479 			nFailCnt = 0;
8796  0e37 725f00cf      	clr	L3414_nFailCnt
8797                     ; 1480 			m_nGprsStep = INIT_PWR_OFF;
8799  0e3b 725f00a6      	clr	_m_nGprsStep
8800                     ; 1481 			ucStatusGsm = GSM_INIT;
8802  0e3f 350100ce      	mov	_ucStatusGsm,#1
8803                     ; 1482 			stRepFail.wError |= (1<<ATCMD_ERROR);
8805  0e43 72120006      	bset	_stRepFail+6,#1
8806  0e47 2007          	jra	L1224
8807  0e49               L5124:
8808                     ; 1487 		nFailCnt = 0;
8810  0e49 c700cf        	ld	L3414_nFailCnt,a
8811                     ; 1488 		return TRUE;
8813  0e4c 4c            	inc	a
8816  0e4d 5b01          	addw	sp,#1
8817  0e4f 81            	ret	
8818  0e50               L1224:
8819                     ; 1491 	return FALSE;
8821  0e50 4f            	clr	a
8824  0e51 5b01          	addw	sp,#1
8825  0e53 81            	ret	
8828                     	switch	.data
8829  00d0               L3224_nFailCnt:
8830  00d0 00            	dc.b	0
8831  00d1               L5224_nCnt:
8832  00d1 00            	dc.b	0
8904                     	switch	.const
8905  0479               L276:
8906  0479 0e6f          	dc.w	L7224
8907  047b 0e87          	dc.w	L1324
8908  047d 0ebb          	dc.w	L3324
8909  047f 0ed3          	dc.w	L5324
8910  0481 0ee3          	dc.w	L7324
8911  0483 0f18          	dc.w	L1424
8912  0485 0f3f          	dc.w	L3424
8913  0487 0f6c          	dc.w	L5424
8914  0489 0f8e          	dc.w	L7424
8915  048b 0fad          	dc.w	L1524
8916  048d 0fd1          	dc.w	L3524
8917                     ; 1503 u8 M590_Init(void)
8917                     ; 1504 {
8918                     	switch	.text
8919  0e54               _M590_Init:
8921  0e54 88            	push	a
8922       00000001      OFST:	set	1
8925                     ; 1505 	uint8_t nSig = 0, nTmp = 0, nResult = 0;
8931                     ; 1509 	if(FALSE == UC_SleepProc())
8933  0e55 cd0716        	call	_UC_SleepProc
8935  0e58 4d            	tnz	a
8936  0e59 2603          	jrne	L3034
8937                     ; 1511 		return FALSE;
8941  0e5b 5b01          	addw	sp,#1
8942  0e5d 81            	ret	
8943  0e5e               L3034:
8944                     ; 1514 	switch(m_nGprsStep)
8946  0e5e c600a6        	ld	a,_m_nGprsStep
8948                     ; 1634 		default:
8948                     ; 1635 			break;
8949  0e61 a10b          	cp	a,#11
8950  0e63 2503cc102e    	jruge	L7034
8951  0e68 5f            	clrw	x
8952  0e69 97            	ld	xl,a
8953  0e6a 58            	sllw	x
8954  0e6b de0479        	ldw	x,(L276,x)
8955  0e6e fc            	jp	(x)
8956  0e6f               L7224:
8957                     ; 1516 		case INIT_PWR_OFF:			
8957                     ; 1517 			SetPortGsmPowerOff();		   //断电			
8959  0e6f 4b00          	push	#0
8960  0e71 4b10          	push	#16
8961  0e73 ae500a        	ldw	x,#20490
8962  0e76 cd0000        	call	_GPIO_WriteBit
8964  0e79 85            	popw	x
8965                     ; 1518 			UC_SetSleepCnt(5000);
8967  0e7a ae1388        	ldw	x,#5000
8968  0e7d cd1032        	call	LC017
8969                     ; 1519 			m_nGprsStep = INIT_PWR_ON;
8971  0e80 350100a6      	mov	_m_nGprsStep,#1
8972                     ; 1520 			break;
8974  0e84 cc102e        	jra	L7034
8975  0e87               L1324:
8976                     ; 1522 		case INIT_PWR_ON:
8976                     ; 1523 			TurnBusUartOn();	           //硬件串口波特率,115200 BAUDRATE_38400
8978  0e87 cd0000        	call	_TurnBusUartOn
8980                     ; 1524 			SetPortGsmResetEnable();       //软件复位			
8982  0e8a 4b01          	push	#1
8983  0e8c 4b40          	push	#64
8984  0e8e ae5005        	ldw	x,#20485
8985  0e91 cd0000        	call	_GPIO_WriteBit
8987  0e94 85            	popw	x
8988                     ; 1526 			SetPortGsmResetDisable();
8990  0e95 4b00          	push	#0
8991  0e97 4b40          	push	#64
8992  0e99 ae5005        	ldw	x,#20485
8993  0e9c cd0000        	call	_GPIO_WriteBit
8995  0e9f 85            	popw	x
8996                     ; 1527 			SetPortGsmPowerOn();		   //供电
8998  0ea0 4b01          	push	#1
8999  0ea2 4b10          	push	#16
9000  0ea4 ae500a        	ldw	x,#20490
9001  0ea7 cd0000        	call	_GPIO_WriteBit
9003  0eaa 85            	popw	x
9004                     ; 1528 			SetPortSoftSwitchOn();
9006  0eab cd1045        	call	LC019
9007                     ; 1529 			UC_SetSleepCnt(3000);
9009  0eae ae0bb8        	ldw	x,#3000
9010  0eb1 cd1032        	call	LC017
9011                     ; 1530 			m_nGprsStep = INIT_SWITCH_OFF;
9013  0eb4 350200a6      	mov	_m_nGprsStep,#2
9014                     ; 1531 			break;
9016  0eb8 cc102e        	jra	L7034
9017  0ebb               L3324:
9018                     ; 1533 		case INIT_SWITCH_OFF:
9018                     ; 1534 			SetPortSoftSwitchOff();
9020  0ebb 4b00          	push	#0
9021  0ebd 4b20          	push	#32
9022  0ebf ae5005        	ldw	x,#20485
9023  0ec2 cd0000        	call	_GPIO_WriteBit
9025  0ec5 85            	popw	x
9026                     ; 1535 			UC_SetSleepCnt(3000);
9028  0ec6 ae0bb8        	ldw	x,#3000
9029  0ec9 cd1032        	call	LC017
9030                     ; 1536 			m_nGprsStep = INIT_SWITCH_ON;
9032  0ecc 350300a6      	mov	_m_nGprsStep,#3
9033                     ; 1537 			break;
9035  0ed0 cc102e        	jra	L7034
9036  0ed3               L5324:
9037                     ; 1539 		case INIT_SWITCH_ON:
9037                     ; 1540 			SetPortSoftSwitchOn();
9039  0ed3 cd1045        	call	LC019
9040                     ; 1541 			UC_SetSleepCnt(4000);
9042  0ed6 ae0fa0        	ldw	x,#4000
9043  0ed9 cd1032        	call	LC017
9044                     ; 1542 			m_nGprsStep = INIT_PBREADY_1;
9046  0edc 350400a6      	mov	_m_nGprsStep,#4
9047                     ; 1543 			break;
9049  0ee0 cc102e        	jra	L7034
9050  0ee3               L7324:
9051                     ; 1545 		case INIT_PBREADY_1: /* 等待模块上电稳定初始化OK */
9051                     ; 1546 			//SetPortSoftSwitchOn();
9051                     ; 1547 			//SetPortSoftSwitchOff();
9051                     ; 1548 			UC_SetSleepCnt(100);
9053  0ee3 ae0064        	ldw	x,#100
9054  0ee6 cd1032        	call	LC017
9055                     ; 1552 			if(FALSE == AT_CmdFailProc(AT_CMD_I, NULL, "OK", "ERROR", NULL, NULL, NULL, 3000))
9057  0ee9 ae0bb8        	ldw	x,#3000
9058  0eec 89            	pushw	x
9059  0eed 5f            	clrw	x
9060  0eee 89            	pushw	x
9061  0eef 89            	pushw	x
9062  0ef0 89            	pushw	x
9063  0ef1 89            	pushw	x
9064  0ef2 ae0670        	ldw	x,#L1104
9065  0ef5 89            	pushw	x
9066  0ef6 ae0678        	ldw	x,#L3134
9067  0ef9 89            	pushw	x
9068  0efa 5f            	clrw	x
9069  0efb 89            	pushw	x
9070  0efc a608          	ld	a,#8
9071  0efe cd0e0b        	call	_AT_CmdFailProc
9073  0f01 5b10          	addw	sp,#16
9074  0f03 4d            	tnz	a
9075  0f04 2607          	jrne	L1134
9076                     ; 1554 				stRepFail.wError |= (1<<REP_NO_GPRS_MODE);
9078  0f06 72100007      	bset	_stRepFail+7,#0
9079                     ; 1555 				return FALSE;
9083  0f0a 5b01          	addw	sp,#1
9084  0f0c 81            	ret	
9085  0f0d               L1134:
9086                     ; 1558 			stRepFail.wError &= ~((u16)(1<<REP_NO_GPRS_MODE));
9088  0f0d 72110007      	bres	_stRepFail+7,#0
9089                     ; 1559 			m_nGprsStep = INIT_SET_IPR;
9091  0f11 350500a6      	mov	_m_nGprsStep,#5
9092                     ; 1560 			break;
9094  0f15 cc102e        	jra	L7034
9095  0f18               L1424:
9096                     ; 1562 		case INIT_SET_IPR:
9096                     ; 1563 			if(FALSE == AT_CmdFailProc(AT_CMD_IPR, NULL, "OK", "ERROR", NULL, NULL, NULL, 3000))
9098  0f18 ae0bb8        	ldw	x,#3000
9099  0f1b 89            	pushw	x
9100  0f1c 5f            	clrw	x
9101  0f1d 89            	pushw	x
9102  0f1e 89            	pushw	x
9103  0f1f 89            	pushw	x
9104  0f20 89            	pushw	x
9105  0f21 ae0670        	ldw	x,#L1104
9106  0f24 89            	pushw	x
9107  0f25 ae0678        	ldw	x,#L3134
9108  0f28 89            	pushw	x
9109  0f29 5f            	clrw	x
9110  0f2a 89            	pushw	x
9111  0f2b a61d          	ld	a,#29
9112  0f2d cd0e0b        	call	_AT_CmdFailProc
9114  0f30 5b10          	addw	sp,#16
9115  0f32 4d            	tnz	a
9116  0f33 2603          	jrne	L5134
9117                     ; 1565 				return FALSE;
9121  0f35 5b01          	addw	sp,#1
9122  0f37 81            	ret	
9123  0f38               L5134:
9124                     ; 1567 			m_nGprsStep = INIT_CPIN_2;
9126  0f38 350600a6      	mov	_m_nGprsStep,#6
9127                     ; 1568 			break;
9129  0f3c cc102e        	jra	L7034
9130  0f3f               L3424:
9131                     ; 1570 		case INIT_CPIN_2:/* 检查 SIM 卡状态 */	
9131                     ; 1571 			UC_SetSleepCnt(100);
9133  0f3f ae0064        	ldw	x,#100
9134  0f42 cd1032        	call	LC017
9135                     ; 1572 			if(FALSE == AT_CmdFailProc(AT_CMD_CPIN,	NULL, "READY", "ERROR", NULL, NULL, NULL, 1000))
9137  0f45 ae03e8        	ldw	x,#1000
9138  0f48 89            	pushw	x
9139  0f49 5f            	clrw	x
9140  0f4a 89            	pushw	x
9141  0f4b 89            	pushw	x
9142  0f4c 89            	pushw	x
9143  0f4d 89            	pushw	x
9144  0f4e ae0670        	ldw	x,#L1104
9145  0f51 89            	pushw	x
9146  0f52 ae0648        	ldw	x,#L1234
9147  0f55 89            	pushw	x
9148  0f56 5f            	clrw	x
9149  0f57 89            	pushw	x
9150  0f58 a617          	ld	a,#23
9151  0f5a cd0e0b        	call	_AT_CmdFailProc
9153  0f5d 5b10          	addw	sp,#16
9154  0f5f 4d            	tnz	a
9155  0f60 2603          	jrne	L7134
9156                     ; 1574 				return FALSE;
9160  0f62 5b01          	addw	sp,#1
9161  0f64 81            	ret	
9162  0f65               L7134:
9163                     ; 1576 			m_nGprsStep = INIT_IMSI_3;
9165  0f65 350700a6      	mov	_m_nGprsStep,#7
9166                     ; 1577 			break;
9168  0f69 cc102e        	jra	L7034
9169  0f6c               L5424:
9170                     ; 1579 		case INIT_IMSI_3:/* 读取 SIM 卡的 内置IMSI号 */
9170                     ; 1580 			nResult = SIMGK7M_GetCIMI(m_nImsiBuf, sizeof(m_nImsiBuf));
9172  0f6c 4b18          	push	#24
9173  0f6e ae0085        	ldw	x,#_m_nImsiBuf
9174  0f71 cd0d61        	call	_SIMGK7M_GetCIMI
9176  0f74 5b01          	addw	sp,#1
9177  0f76 6b01          	ld	(OFST+0,sp),a
9178                     ; 1581 			if((3 < nCnt++)||(nResult))
9180  0f78 cd103b        	call	LC018
9181  0f7b 2404          	jruge	L5234
9183  0f7d 7b01          	ld	a,(OFST+0,sp)
9184  0f7f 2708          	jreq	L3234
9185  0f81               L5234:
9186                     ; 1583 				nCnt = 0;
9188  0f81 725f00d1      	clr	L5224_nCnt
9189                     ; 1584 				m_nGprsStep = INIT_CCID_4;
9191  0f85 350800a6      	mov	_m_nGprsStep,#8
9192  0f89               L3234:
9193                     ; 1586 			UC_SetSleepCnt(100);
9195  0f89 ae0064        	ldw	x,#100
9197                     ; 1587 			break;
9199  0f8c 203f          	jp	LC015
9200  0f8e               L7424:
9201                     ; 1589 		case INIT_CCID_4:/* 读取 SIM 卡的 CCID */
9201                     ; 1590 			nResult = SIMGL868_GetCCID(m_nCcidBuf, sizeof(m_nCcidBuf));
9203  0f8e 4b18          	push	#24
9204  0f90 ae006d        	ldw	x,#_m_nCcidBuf
9205  0f93 cd0db6        	call	_SIMGL868_GetCCID
9207  0f96 5b01          	addw	sp,#1
9208  0f98 6b01          	ld	(OFST+0,sp),a
9209                     ; 1591 			if((3 < nCnt++)||(nResult))
9211  0f9a cd103b        	call	LC018
9212  0f9d 2404          	jruge	L1334
9214  0f9f 7b01          	ld	a,(OFST+0,sp)
9215  0fa1 2727          	jreq	L3334
9216  0fa3               L1334:
9217                     ; 1593 				nCnt = 0;
9219  0fa3 725f00d1      	clr	L5224_nCnt
9220                     ; 1594 				m_nGprsStep = INIT_CSQ_5;
9222  0fa7 350900a6      	mov	_m_nGprsStep,#9
9223                     ; 1596 			UC_SetSleepCnt(8000);
9225                     ; 1597 			break;
9227  0fab 201d          	jp	L3334
9228  0fad               L1524:
9229                     ; 1598 		case INIT_CSQ_5:/* 读取信号强度经验证此处最少延时6S查询三次，才能获得相对稳定信号 */
9229                     ; 1599 			nSig = SIMGL868_UpdateSignal();
9231  0fad cd0d05        	call	_SIMGL868_UpdateSignal
9233  0fb0 6b01          	ld	(OFST+0,sp),a
9234                     ; 1600 			if((3 < nCnt++)||((15 <= nSig)&&(32 > nSig)))
9236  0fb2 cd103b        	call	LC018
9237  0fb5 240a          	jruge	L5334
9239  0fb7 7b01          	ld	a,(OFST+0,sp)
9240  0fb9 a10f          	cp	a,#15
9241  0fbb 250d          	jrult	L3334
9243  0fbd a120          	cp	a,#32
9244  0fbf 2409          	jruge	L3334
9245  0fc1               L5334:
9246                     ; 1602 				m_nGprsStep = INIT_CREG_6;
9248  0fc1 350a00a6      	mov	_m_nGprsStep,#10
9249                     ; 1603 				g_nSignal = nSig;
9251  0fc5 7b01          	ld	a,(OFST+0,sp)
9252  0fc7 c70000        	ld	_g_nSignal,a
9253  0fca               L3334:
9254                     ; 1605 			UC_SetSleepCnt(8000);
9257  0fca ae1f40        	ldw	x,#8000
9259  0fcd               LC015:
9260  0fcd ad63          	call	LC017
9261                     ; 1606 			break;
9263  0fcf 205d          	jra	L7034
9264  0fd1               L3524:
9265                     ; 1608 		case INIT_CREG_6:   /* 已注册上 GSM 网络 */
9265                     ; 1609 			nTmp = UC_CommAT(AT_CMD_CREG,	NULL, "+CREG: 0,1", "+CREG: 0,5", "ERROR", NULL, NULL, 1000);
9267  0fd1 ae03e8        	ldw	x,#1000
9268  0fd4 89            	pushw	x
9269  0fd5 5f            	clrw	x
9270  0fd6 89            	pushw	x
9271  0fd7 89            	pushw	x
9272  0fd8 89            	pushw	x
9273  0fd9 ae0670        	ldw	x,#L1104
9274  0fdc 89            	pushw	x
9275  0fdd ae065a        	ldw	x,#L7004
9276  0fe0 89            	pushw	x
9277  0fe1 ae0665        	ldw	x,#L5004
9278  0fe4 89            	pushw	x
9279  0fe5 5f            	clrw	x
9280  0fe6 89            	pushw	x
9281  0fe7 a61a          	ld	a,#26
9282  0fe9 cd08e1        	call	_UC_CommAT
9284  0fec 5b10          	addw	sp,#16
9285  0fee 6b01          	ld	(OFST+0,sp),a
9286                     ; 1610 			if((nTmp != 1)&&(nTmp != 2))
9288  0ff0 a101          	cp	a,#1
9289  0ff2 2724          	jreq	L7334
9291  0ff4 a102          	cp	a,#2
9292  0ff6 2720          	jreq	L7334
9293                     ; 1612 				if(TO_MAXCNT < nFailCnt++)
9295  0ff8 c600d0        	ld	a,L3224_nFailCnt
9296  0ffb 725c00d0      	inc	L3224_nFailCnt
9297  0fff a103          	cp	a,#3
9298  1001 250c          	jrult	L1434
9299                     ; 1614 					stRepFail.wError |= (1<<REP_REG_FAIL);
9301  1003 72120007      	bset	_stRepFail+7,#1
9302                     ; 1615 					nFailCnt = 0;
9304  1007 725f00d0      	clr	L3224_nFailCnt
9305                     ; 1616 					m_nGprsStep = INIT_PWR_OFF;
9307  100b 725f00a6      	clr	_m_nGprsStep
9308  100f               L1434:
9309                     ; 1618 				UC_SetSleepCnt(1000);
9311  100f ae03e8        	ldw	x,#1000
9312  1012 ad1e          	call	LC017
9313                     ; 1619 				return FALSE;
9315  1014 4f            	clr	a
9318  1015 5b01          	addw	sp,#1
9319  1017 81            	ret	
9320  1018               L7334:
9321                     ; 1623 				nFailCnt = 0;
9323  1018 725f00d0      	clr	L3224_nFailCnt
9324                     ; 1626 			m_nGprsStep = PPP_CGATT_0;
9326  101c 725f00a6      	clr	_m_nGprsStep
9327                     ; 1630 			stRepFail.wError &= ~((u16)(1<<REP_REG_FAIL));
9329  1020 72130007      	bres	_stRepFail+7,#1
9330                     ; 1631 			UC_SetSleepCnt(100);
9332  1024 ae0064        	ldw	x,#100
9333  1027 ad09          	call	LC017
9334                     ; 1632 			return TRUE;
9336  1029 a601          	ld	a,#1
9339  102b 5b01          	addw	sp,#1
9340  102d 81            	ret	
9341                     ; 1634 		default:
9341                     ; 1635 			break;
9343  102e               L7034:
9344                     ; 1637 	return FALSE;
9346  102e 4f            	clr	a
9349  102f 5b01          	addw	sp,#1
9350  1031 81            	ret	
9352  1032               LC017:
9353  1032 89            	pushw	x
9354  1033 5f            	clrw	x
9355  1034 89            	pushw	x
9356  1035 cd070b        	call	_UC_SetSleepCnt
9358  1038 5b04          	addw	sp,#4
9359  103a 81            	ret	
9360  103b               LC018:
9361  103b c600d1        	ld	a,L5224_nCnt
9362  103e 725c00d1      	inc	L5224_nCnt
9363  1042 a104          	cp	a,#4
9364  1044 81            	ret	
9365  1045               LC019:
9366  1045 4b01          	push	#1
9367  1047 4b20          	push	#32
9368  1049 ae5005        	ldw	x,#20485
9369  104c cd0000        	call	_GPIO_WriteBit
9371  104f 85            	popw	x
9372  1050 81            	ret	
9405                     ; 1649 s8 M590_HandShake(void)
9405                     ; 1650 {
9406                     	switch	.text
9407  1051               _M590_HandShake:
9411                     ; 1652 	if(FALSE == UC_SleepProc())
9413  1051 cd0716        	call	_UC_SleepProc
9415  1054 4d            	tnz	a
9416  1055 2601          	jrne	L1734
9417                     ; 1654 		return FALSE;
9421  1057 81            	ret	
9422  1058               L1734:
9423                     ; 1656 	switch(m_nGprsStep)
9425  1058 c600a6        	ld	a,_m_nGprsStep
9427                     ; 1711 	default:
9427                     ; 1712 		break;
9428  105b 2715          	jreq	L5434
9429  105d 4a            	dec	a
9430  105e 273d          	jreq	L7434
9431  1060 4a            	dec	a
9432  1061 2765          	jreq	L1534
9433  1063 4a            	dec	a
9434  1064 2603cc10f0    	jreq	L3534
9435  1069 4a            	dec	a
9436  106a 2603cc1143    	jreq	L5534
9437  106f cc116d        	jra	L5734
9438  1072               L5434:
9439                     ; 1659 	case PPP_CGATT_0: /* GPRS附着 */		
9439                     ; 1660 		UC_SetSleepCnt(100);
9441  1072 ae0064        	ldw	x,#100
9442  1075 cd116f        	call	LC020
9443  1078 89            	pushw	x
9444  1079 5f            	clrw	x
9445  107a 89            	pushw	x
9446  107b 89            	pushw	x
9447  107c 89            	pushw	x
9448  107d 89            	pushw	x
9449  107e ae0670        	ldw	x,#L1104
9450  1081 89            	pushw	x
9451  1082 ae0678        	ldw	x,#L3134
9452  1085 89            	pushw	x
9453  1086 ae0002        	ldw	x,#_aucAtPAscii_1
9454  1089 89            	pushw	x
9455  108a a637          	ld	a,#55
9456  108c cd0e0b        	call	_AT_CmdFailProc
9458  108f 5b10          	addw	sp,#16
9459  1091 4d            	tnz	a
9460  1092 2602          	jrne	L7734
9461                     ; 1663 			return ERROR;
9463  1094 4a            	dec	a
9466  1095 81            	ret	
9467  1096               L7734:
9468                     ; 1665 		m_nGprsStep = PPP_CSTT_1;
9470  1096 350100a6      	mov	_m_nGprsStep,#1
9471                     ; 1666 		break;
9473  109a cc116d        	jra	L5734
9474  109d               L7434:
9475                     ; 1667 	case PPP_CSTT_1: /* 设置APN */
9475                     ; 1668 		UC_SetSleepCnt(100);
9477  109d ae0064        	ldw	x,#100
9478  10a0 cd116f        	call	LC020
9479  10a3 89            	pushw	x
9480  10a4 5f            	clrw	x
9481  10a5 89            	pushw	x
9482  10a6 89            	pushw	x
9483  10a7 89            	pushw	x
9484  10a8 89            	pushw	x
9485  10a9 ae0670        	ldw	x,#L1104
9486  10ac 89            	pushw	x
9487  10ad ae0678        	ldw	x,#L3134
9488  10b0 89            	pushw	x
9489  10b1 ae0001        	ldw	x,#_g_nApnBuf
9490  10b4 89            	pushw	x
9491  10b5 a639          	ld	a,#57
9492  10b7 cd0e0b        	call	_AT_CmdFailProc
9494  10ba 5b10          	addw	sp,#16
9495  10bc 4d            	tnz	a
9496  10bd 2602          	jrne	L1044
9497                     ; 1672 			return ERROR;
9499  10bf 4a            	dec	a
9502  10c0 81            	ret	
9503  10c1               L1044:
9504                     ; 1674 		m_nGprsStep = PPP_CIICR_2;
9506  10c1 350200a6      	mov	_m_nGprsStep,#2
9507                     ; 1675 		break;
9509  10c5 cc116d        	jra	L5734
9510  10c8               L1534:
9511                     ; 1677 	case PPP_CIICR_2: /* 激活移动场景，开启 GPRS 或 CSD 无线连接 */
9511                     ; 1678 		UC_SetSleepCnt(3000);
9513  10c8 ae0bb8        	ldw	x,#3000
9514  10cb cd116f        	call	LC020
9515  10ce 89            	pushw	x
9516  10cf 5f            	clrw	x
9517  10d0 89            	pushw	x
9518  10d1 89            	pushw	x
9519  10d2 89            	pushw	x
9520  10d3 89            	pushw	x
9521  10d4 ae0670        	ldw	x,#L1104
9522  10d7 89            	pushw	x
9523  10d8 ae0678        	ldw	x,#L3134
9524  10db 89            	pushw	x
9525  10dc 5f            	clrw	x
9526  10dd 89            	pushw	x
9527  10de a644          	ld	a,#68
9528  10e0 cd0e0b        	call	_AT_CmdFailProc
9530  10e3 5b10          	addw	sp,#16
9531  10e5 4d            	tnz	a
9532  10e6 2602          	jrne	L3044
9533                     ; 1681 			return ERROR;
9535  10e8 4a            	dec	a
9538  10e9 81            	ret	
9539  10ea               L3044:
9540                     ; 1683 		m_nGprsStep = PPP_CIFSR_3;
9542  10ea 350300a6      	mov	_m_nGprsStep,#3
9543                     ; 1684 		break;
9545  10ee 207d          	jra	L5734
9546  10f0               L3534:
9547                     ; 1686 	case PPP_CIFSR_3: /* 获取IP */
9547                     ; 1687 		UC_SetSleepCnt(100);
9549  10f0 ae0064        	ldw	x,#100
9550  10f3 ad7a          	call	LC020
9551  10f5 89            	pushw	x
9552  10f6 5f            	clrw	x
9553  10f7 89            	pushw	x
9554  10f8 89            	pushw	x
9555  10f9 89            	pushw	x
9556  10fa 89            	pushw	x
9557  10fb ae0670        	ldw	x,#L1104
9558  10fe 89            	pushw	x
9559  10ff ae0678        	ldw	x,#L3134
9560  1102 89            	pushw	x
9561  1103 5f            	clrw	x
9562  1104 89            	pushw	x
9563  1105 a643          	ld	a,#67
9564  1107 cd08e1        	call	_UC_CommAT
9566  110a 5b10          	addw	sp,#16
9567  110c a102          	cp	a,#2
9568  110e 2629          	jrne	L5044
9569                     ; 1690 			if(TO_MAXCNT < m_nCnt++)
9571  1110 c600ca        	ld	a,L7471_m_nCnt
9572  1113 725c00ca      	inc	L7471_m_nCnt
9573  1117 a103          	cp	a,#3
9574  1119 2510          	jrult	L7044
9575                     ; 1692 				m_nCnt = 0;
9577  111b 725f00ca      	clr	L7471_m_nCnt
9578                     ; 1693 				m_nGprsStep = INIT_PWR_OFF;
9580  111f 725f00a6      	clr	_m_nGprsStep
9581                     ; 1694 				ucStatusGsm = GSM_INIT;
9583  1123 350100ce      	mov	_ucStatusGsm,#1
9584                     ; 1695 				stRepFail.wError |= (1<<ATCMD_ERROR);
9586  1127 72120006      	bset	_stRepFail+6,#1
9587  112b               L7044:
9588                     ; 1697 			UC_SetSleepCnt(1000);
9590  112b ae03e8        	ldw	x,#1000
9591  112e 89            	pushw	x
9592  112f 5f            	clrw	x
9593  1130 89            	pushw	x
9594  1131 cd070b        	call	_UC_SetSleepCnt
9596  1134 5b04          	addw	sp,#4
9597                     ; 1698 			return ERROR;
9599  1136 a6ff          	ld	a,#255
9602  1138 81            	ret	
9603  1139               L5044:
9604                     ; 1700 		m_nCnt = 0;
9606  1139 725f00ca      	clr	L7471_m_nCnt
9607                     ; 1701 		m_nGprsStep = PPP_ATE0_4;
9609  113d 350400a6      	mov	_m_nGprsStep,#4
9610                     ; 1702 		break;		
9612  1141 202a          	jra	L5734
9613  1143               L5534:
9614                     ; 1703 	case PPP_ATE0_4: /* 关闭回显 */
9614                     ; 1704 		UC_SetSleepCnt(100);
9616  1143 ae0064        	ldw	x,#100
9617  1146 ad27          	call	LC020
9618  1148 89            	pushw	x
9619  1149 5f            	clrw	x
9620  114a 89            	pushw	x
9621  114b 89            	pushw	x
9622  114c 89            	pushw	x
9623  114d 89            	pushw	x
9624  114e ae0670        	ldw	x,#L1104
9625  1151 89            	pushw	x
9626  1152 ae0678        	ldw	x,#L3134
9627  1155 89            	pushw	x
9628  1156 ae0004        	ldw	x,#_aucAtPAscii_0
9629  1159 89            	pushw	x
9630  115a a601          	ld	a,#1
9631  115c cd0e0b        	call	_AT_CmdFailProc
9633  115f 5b10          	addw	sp,#16
9634  1161 4d            	tnz	a
9635  1162 2602          	jrne	L1144
9636                     ; 1707 			return ERROR;
9638  1164 4a            	dec	a
9641  1165 81            	ret	
9642  1166               L1144:
9643                     ; 1709 		m_nGprsStep = PPP_CGATT_0;
9645  1166 725f00a6      	clr	_m_nGprsStep
9646                     ; 1710 		return TRUE;
9648  116a a601          	ld	a,#1
9651  116c 81            	ret	
9652                     ; 1711 	default:
9652                     ; 1712 		break;
9654  116d               L5734:
9655                     ; 1789 	return FALSE;
9657  116d 4f            	clr	a
9660  116e 81            	ret	
9662  116f               LC020:
9663  116f 89            	pushw	x
9664  1170 5f            	clrw	x
9665  1171 89            	pushw	x
9666  1172 cd070b        	call	_UC_SetSleepCnt
9668  1175 5b04          	addw	sp,#4
9669                     ; 1661 		if(FALSE == AT_CmdFailProc(AT_CMD_CGATT, (u8 *)aucAtPAscii_1, "OK", "ERROR", NULL, NULL, NULL, 1000))
9671  1177 ae03e8        	ldw	x,#1000
9672  117a 81            	ret	
9701                     ; 1801 u8 M590_CloseConnect(void)
9701                     ; 1802 {	
9702                     	switch	.text
9703  117b               _M590_CloseConnect:
9707                     ; 1804 		SetIO_LEDOff();
9709  117b 4b00          	push	#0
9710  117d 4b04          	push	#4
9711  117f ae5005        	ldw	x,#20485
9712  1182 cd0000        	call	_GPIO_WriteBit
9714  1185 4f            	clr	a
9715  1186 85            	popw	x
9716                     ; 1808 		SetLogonMode(UP_LOGIN);
9718  1187 cd0033        	call	_SetLogonMode
9720                     ; 1811 	m_nGprsStep = INIT_PWR_OFF;
9722  118a 725f00a6      	clr	_m_nGprsStep
9723                     ; 1814 	FeedSoftWareIwdg();
9725  118e cd0000        	call	_FeedSoftWareIwdg
9727                     ; 1817 	UC_CommAT(AT_CMD_TCPCLOSE, NULL, "OK", "ERROR", NULL, NULL, NULL, 1000);
9729  1191 ae03e8        	ldw	x,#1000
9730  1194 89            	pushw	x
9731  1195 5f            	clrw	x
9732  1196 89            	pushw	x
9733  1197 89            	pushw	x
9734  1198 89            	pushw	x
9735  1199 89            	pushw	x
9736  119a ae0670        	ldw	x,#L1104
9737  119d 89            	pushw	x
9738  119e ae0678        	ldw	x,#L3134
9739  11a1 89            	pushw	x
9740  11a2 5f            	clrw	x
9741  11a3 89            	pushw	x
9742  11a4 a63b          	ld	a,#59
9743  11a6 cd08e1        	call	_UC_CommAT
9745  11a9 5b10          	addw	sp,#16
9746                     ; 1818 	delay_ms(50);
9748  11ab ad5e          	call	LC021
9749  11ad 89            	pushw	x
9750  11ae 5f            	clrw	x
9751  11af 89            	pushw	x
9752  11b0 89            	pushw	x
9753  11b1 89            	pushw	x
9754  11b2 89            	pushw	x
9755  11b3 ae0670        	ldw	x,#L1104
9756  11b6 89            	pushw	x
9757  11b7 ae0678        	ldw	x,#L3134
9758  11ba 89            	pushw	x
9759  11bb 5f            	clrw	x
9760  11bc 89            	pushw	x
9761  11bd a657          	ld	a,#87
9762  11bf cd08e1        	call	_UC_CommAT
9764  11c2 5b10          	addw	sp,#16
9765                     ; 1822 	delay_ms(50);
9767  11c4 ae0032        	ldw	x,#50
9768  11c7 cd0000        	call	_delay_ms
9770                     ; 1825 	FeedSoftWareIwdg();
9772  11ca cd0000        	call	_FeedSoftWareIwdg
9774                     ; 1828 	UC_CommAT(AT_CMD_CGATT, (u8 *)aucAtPAscii_0, "OK", "ERROR", NULL, NULL, NULL, 1000);
9776  11cd ae03e8        	ldw	x,#1000
9777  11d0 89            	pushw	x
9778  11d1 5f            	clrw	x
9779  11d2 89            	pushw	x
9780  11d3 89            	pushw	x
9781  11d4 89            	pushw	x
9782  11d5 89            	pushw	x
9783  11d6 ae0670        	ldw	x,#L1104
9784  11d9 89            	pushw	x
9785  11da ae0678        	ldw	x,#L3134
9786  11dd 89            	pushw	x
9787  11de ae0004        	ldw	x,#_aucAtPAscii_0
9788  11e1 89            	pushw	x
9789  11e2 a637          	ld	a,#55
9790  11e4 cd08e1        	call	_UC_CommAT
9792  11e7 5b10          	addw	sp,#16
9793                     ; 1829 	delay_ms(50);
9795  11e9 ad20          	call	LC021
9796  11eb 89            	pushw	x
9797  11ec 5f            	clrw	x
9798  11ed 89            	pushw	x
9799  11ee 89            	pushw	x
9800  11ef 89            	pushw	x
9801  11f0 89            	pushw	x
9802  11f1 ae0670        	ldw	x,#L1104
9803  11f4 89            	pushw	x
9804  11f5 ae0678        	ldw	x,#L3134
9805  11f8 89            	pushw	x
9806  11f9 5f            	clrw	x
9807  11fa 89            	pushw	x
9808  11fb a619          	ld	a,#25
9809  11fd cd08e1        	call	_UC_CommAT
9811  1200 5b10          	addw	sp,#16
9812                     ; 1833 	delay_ms(50);
9814  1202 ae0032        	ldw	x,#50
9815  1205 cd0000        	call	_delay_ms
9817                     ; 1836 	return TRUE;	
9819  1208 a601          	ld	a,#1
9822  120a 81            	ret	
9824  120b               LC021:
9825  120b ae0032        	ldw	x,#50
9826  120e cd0000        	call	_delay_ms
9828                     ; 1832 	UC_CommAT(AT_CMD_CPWROFF, NULL, "OK", "ERROR", NULL, NULL, NULL, 1000);
9830  1211 ae03e8        	ldw	x,#1000
9831  1214 81            	ret	
9876                     ; 1848 u8 M590_ConnectServer(u8 nBkFlg)
9876                     ; 1849 {
9877                     	switch	.text
9878  1215               _M590_ConnectServer:
9880  1215 88            	push	a
9881       00000001      OFST:	set	1
9884                     ; 1850 	u8 nRef = 0;
9886  1216 0f01          	clr	(OFST+0,sp)
9887                     ; 1860 	if(FALSE == nBkFlg)
9889  1218 4d            	tnz	a
9890  1219 263a          	jrne	L1444
9891                     ; 1862 		nRef = UC_CommATExt(AT_CMD_TCPSETUP, (u8 *)aucAtPServer1, (u8 *)aucAtPPort1, NULL,"CONNECT OK", "ALREADY CONNECT", "CONNECT FAIL", "ERROR", NULL, 20000);
9893  121b ae4e20        	ldw	x,#20000
9894  121e 89            	pushw	x
9895  121f 5f            	clrw	x
9896  1220 89            	pushw	x
9897  1221 89            	pushw	x
9898  1222 ae0670        	ldw	x,#L1104
9899  1225 89            	pushw	x
9900  1226 ae0620        	ldw	x,#L7444
9901  1229 89            	pushw	x
9902  122a ae062d        	ldw	x,#L5444
9903  122d 89            	pushw	x
9904  122e ae063d        	ldw	x,#L3444
9905  1231 89            	pushw	x
9906  1232 5f            	clrw	x
9907  1233 89            	pushw	x
9908  1234 ae0049        	ldw	x,#_aucAtPPort1
9909  1237 89            	pushw	x
9910  1238 ae0035        	ldw	x,#_aucAtPServer1
9911  123b 89            	pushw	x
9912  123c a63e          	ld	a,#62
9913  123e cd0abb        	call	_UC_CommATExt
9915  1241 5b14          	addw	sp,#20
9916  1243 6b01          	ld	(OFST+0,sp),a
9917                     ; 1863 		if((1 != nRef)&&(2 != nRef))
9919  1245 a101          	cp	a,#1
9920  1247 2746          	jreq	L3544
9922  1249 a102          	cp	a,#2
9923  124b 2742          	jreq	L3544
9924                     ; 1865 			stRepFail.wError |= (1<<REP_CONNECT_FAIL);
9926  124d 72140007      	bset	_stRepFail+7,#2
9927                     ; 1866 			return FALSE;
9929  1251 4f            	clr	a
9932  1252 5b01          	addw	sp,#1
9933  1254 81            	ret	
9934  1255               L1444:
9935                     ; 1871 		nRef = UC_CommATExt(AT_CMD_TCPSETUP, (u8 *)aucAtPServerBk, (u8 *)aucAtPPortBk, NULL,"CONNECT OK", "ALREADY CONNECT", "CONNECT FAIL", "ERROR", NULL, 20000);
9937  1255 ae4e20        	ldw	x,#20000
9938  1258 89            	pushw	x
9939  1259 5f            	clrw	x
9940  125a 89            	pushw	x
9941  125b 89            	pushw	x
9942  125c ae0670        	ldw	x,#L1104
9943  125f 89            	pushw	x
9944  1260 ae0620        	ldw	x,#L7444
9945  1263 89            	pushw	x
9946  1264 ae062d        	ldw	x,#L5444
9947  1267 89            	pushw	x
9948  1268 ae063d        	ldw	x,#L3444
9949  126b 89            	pushw	x
9950  126c 5f            	clrw	x
9951  126d 89            	pushw	x
9952  126e ae0065        	ldw	x,#_aucAtPPortBk
9953  1271 89            	pushw	x
9954  1272 ae0051        	ldw	x,#_aucAtPServerBk
9955  1275 89            	pushw	x
9956  1276 a63e          	ld	a,#62
9957  1278 cd0abb        	call	_UC_CommATExt
9959  127b 5b14          	addw	sp,#20
9960  127d 6b01          	ld	(OFST+0,sp),a
9961                     ; 1872 		if((1 != nRef)&&(2 != nRef))
9963  127f a101          	cp	a,#1
9964  1281 270c          	jreq	L3544
9966  1283 a102          	cp	a,#2
9967  1285 2708          	jreq	L3544
9968                     ; 1874 			stRepFail.wError |= (1<<REP_CONNECT_FAIL);
9970  1287 72140007      	bset	_stRepFail+7,#2
9971                     ; 1875 			return FALSE;
9973  128b 4f            	clr	a
9976  128c 5b01          	addw	sp,#1
9977  128e 81            	ret	
9978  128f               L3544:
9979                     ; 1878 	UC_SleepFunc(100);
9981  128f ae0064        	ldw	x,#100
9982  1292 89            	pushw	x
9983  1293 5f            	clrw	x
9984  1294 89            	pushw	x
9985  1295 cd0760        	call	_UC_SleepFunc
9987  1298 5b04          	addw	sp,#4
9988                     ; 1880 	stRepFail.wError &= ~((u16)(1<<REP_CONNECT_FAIL));
9990  129a 72150007      	bres	_stRepFail+7,#2
9991                     ; 1881 	return TRUE;	
9993  129e a601          	ld	a,#1
9996  12a0 5b01          	addw	sp,#1
9997  12a2 81            	ret	
10039                     ; 1893 s8 M590_TcpSendDatLen(u8 nLen)
10039                     ; 1894 {
10040                     	switch	.text
10041  12a3               _M590_TcpSendDatLen:
10043  12a3 88            	push	a
10044  12a4 88            	push	a
10045       00000001      OFST:	set	1
10048                     ; 1895 	s8 nRef = FALSE;
10050  12a5 0f01          	clr	(OFST+0,sp)
10051                     ; 1897 	if(0 == nLen)
10053  12a7 4d            	tnz	a
10054                     ; 1899 		return FALSE;
10057  12a8 2739          	jreq	L677
10058                     ; 1902 	ucNumberMessage = nLen;
10060  12aa 7b02          	ld	a,(OFST+1,sp)
10061  12ac c700d1        	ld	_ucNumberMessage,a
10062                     ; 1905 	nRef = UC_CommATExt(AT_CMD_TCPSEND, NULL, NULL, NULL, ">", "ERROR", "Link Closed", NULL, NULL, 4000);
10064  12af ae0fa0        	ldw	x,#4000
10065  12b2 89            	pushw	x
10066  12b3 5f            	clrw	x
10067  12b4 89            	pushw	x
10068  12b5 89            	pushw	x
10069  12b6 89            	pushw	x
10070  12b7 ae0614        	ldw	x,#L1054
10071  12ba 89            	pushw	x
10072  12bb ae0670        	ldw	x,#L1104
10073  12be 89            	pushw	x
10074  12bf ae0676        	ldw	x,#L7744
10075  12c2 89            	pushw	x
10076  12c3 5f            	clrw	x
10077  12c4 89            	pushw	x
10078  12c5 89            	pushw	x
10079  12c6 89            	pushw	x
10080  12c7 a63d          	ld	a,#61
10081  12c9 cd0abb        	call	_UC_CommATExt
10083  12cc 5b14          	addw	sp,#20
10084  12ce 6b01          	ld	(OFST+0,sp),a
10085                     ; 1906 	UC_SleepFunc(100);
10087  12d0 ae0064        	ldw	x,#100
10088  12d3 89            	pushw	x
10089  12d4 5f            	clrw	x
10090  12d5 89            	pushw	x
10091  12d6 cd0760        	call	_UC_SleepFunc
10093  12d9 5b04          	addw	sp,#4
10094                     ; 1908 	if(1 == nRef)
10096  12db 7b01          	ld	a,(OFST+0,sp)
10097  12dd a101          	cp	a,#1
10098  12df 2604          	jrne	L3054
10099                     ; 1910 		return TRUE;	
10101  12e1 a601          	ld	a,#1
10103  12e3               L677:
10105  12e3 85            	popw	x
10106  12e4 81            	ret	
10107  12e5               L3054:
10108                     ; 1912 	else if((2 == nRef) || (3 == nRef))
10110  12e5 a102          	cp	a,#2
10111  12e7 2704          	jreq	L1154
10113  12e9 a103          	cp	a,#3
10114  12eb 2604          	jrne	L7054
10115  12ed               L1154:
10116                     ; 1914 		return -1;
10118  12ed a6ff          	ld	a,#255
10120  12ef 20f2          	jra	L677
10121  12f1               L7054:
10122                     ; 1918 		return FALSE;
10124  12f1 4f            	clr	a
10126  12f2 20ef          	jra	L677
10150                     ; 1931 u8 WatitDataSendOk(void)
10150                     ; 1932 {
10151                     	switch	.text
10152  12f4               _WatitDataSendOk:
10156                     ; 1934 	if(1 != UC_CommAT(AT_CMD_NULL, NULL, "OK", "ERROR", NULL, NULL, NULL, 20000))
10158  12f4 ae4e20        	ldw	x,#20000
10159  12f7 89            	pushw	x
10160  12f8 5f            	clrw	x
10161  12f9 89            	pushw	x
10162  12fa 89            	pushw	x
10163  12fb 89            	pushw	x
10164  12fc 89            	pushw	x
10165  12fd ae0670        	ldw	x,#L1104
10166  1300 89            	pushw	x
10167  1301 ae0678        	ldw	x,#L3134
10168  1304 89            	pushw	x
10169  1305 5f            	clrw	x
10170  1306 89            	pushw	x
10171  1307 a6ff          	ld	a,#255
10172  1309 cd08e1        	call	_UC_CommAT
10174  130c 5b10          	addw	sp,#16
10175  130e 4a            	dec	a
10176  130f 2702          	jreq	L5254
10177                     ; 1939 		return FALSE;
10179  1311 4f            	clr	a
10182  1312 81            	ret	
10183  1313               L5254:
10184                     ; 1941 	return TRUE;
10186  1313 4c            	inc	a
10189  1314 81            	ret	
10234                     ; 2042 void ReWriteRepFlg(void)
10234                     ; 2043 {
10235                     	switch	.text
10236  1315               _ReWriteRepFlg:
10238  1315 5211          	subw	sp,#17
10239       00000011      OFST:	set	17
10242                     ; 2044 	u8 nLoop = 0;
10244                     ; 2047 	for(nLoop = 0; nLoop <= m_nRepIndex; nLoop++)
10246  1317 0f01          	clr	(OFST-16,sp)
10248  1319 2031          	jra	L3554
10249  131b               L7454:
10250                     ; 2049 		ReadRecord(nLoop, (u8*)&stRecord, sizeof(stRecord));
10252  131b 4b10          	push	#16
10253  131d 96            	ldw	x,sp
10254  131e 1c0003        	addw	x,#OFST-14
10255  1321 89            	pushw	x
10256  1322 7b04          	ld	a,(OFST-13,sp)
10257  1324 cd0000        	call	_ReadRecord
10259  1327 5b03          	addw	sp,#3
10260                     ; 2050 		stRecord.nRepFlg = FALSE;		
10262  1329 0f11          	clr	(OFST+0,sp)
10263                     ; 2051 		if(FALSE == EditRecord(nLoop,(u8*)&stRecord, sizeof(stRecord)))
10265  132b 4b10          	push	#16
10266  132d 96            	ldw	x,sp
10267  132e 1c0003        	addw	x,#OFST-14
10268  1331 89            	pushw	x
10269  1332 7b04          	ld	a,(OFST-13,sp)
10270  1334 cd0000        	call	_EditRecord
10272  1337 5b03          	addw	sp,#3
10273  1339 4d            	tnz	a
10274  133a 260e          	jrne	L7554
10275                     ; 2053 			EditRecord(nLoop,(u8*)&stRecord, sizeof(stRecord));
10277  133c 4b10          	push	#16
10278  133e 96            	ldw	x,sp
10279  133f 1c0003        	addw	x,#OFST-14
10280  1342 89            	pushw	x
10281  1343 7b04          	ld	a,(OFST-13,sp)
10282  1345 cd0000        	call	_EditRecord
10284  1348 5b03          	addw	sp,#3
10285  134a               L7554:
10286                     ; 2047 	for(nLoop = 0; nLoop <= m_nRepIndex; nLoop++)
10288  134a 0c01          	inc	(OFST-16,sp)
10289  134c               L3554:
10292  134c 7b01          	ld	a,(OFST-16,sp)
10293  134e c100bc        	cp	a,_m_nRepIndex
10294  1351 23c8          	jrule	L7454
10295                     ; 2056 }
10298  1353 5b11          	addw	sp,#17
10299  1355 81            	ret	
10359                     	switch	.const
10360  048f               L6101:
10361  048f 00000400      	dc.l	1024
10362  0493               L6201:
10363  0493 00000200      	dc.l	512
10364  0497               L2301:
10365  0497 00000100      	dc.l	256
10366  049b               L0501:
10367  049b 0000002d      	dc.l	45
10368  049f               L2501:
10369  049f 00000079      	dc.l	121
10370  04a3               L4501:
10371  04a3 00000007      	dc.l	7
10372  04a7               L6501:
10373  04a7 000003e8      	dc.l	1000
10374                     ; 2067 u8 TermReportReplyPro(u32 dwItem, u8 *pnBuf)
10374                     ; 2068 {
10375                     	switch	.text
10376  1356               _TermReportReplyPro:
10378       00000000      OFST:	set	0
10381                     ; 2069 	if(0 != (dwItem&0xFFFF00FF))
10383  1356 2702          	jreq	L1064
10384                     ; 2071 		return FALSE;
10386  1358 4f            	clr	a
10389  1359 81            	ret	
10390  135a               L1064:
10391                     ; 2075 	if(0x00000400 == dwItem)
10393  135a 96            	ldw	x,sp
10394  135b 1c0003        	addw	x,#OFST+3
10395  135e cd0000        	call	c_ltor
10397  1361 ae048f        	ldw	x,#L6101
10398  1364 cd0000        	call	c_lcmp
10400  1367 263c          	jrne	L3064
10401                     ; 2077 		if((pnBuf[0] == 0x8c)&&(pnBuf[1] == 0x00) 
10401                     ; 2078 			&& (pnBuf[2] == 0)&&(pnBuf[3] == 0x45)&&(pnBuf[4] == 0x24))
10403  1369 1e07          	ldw	x,(OFST+7,sp)
10404  136b f6            	ld	a,(x)
10405  136c a18c          	cp	a,#140
10406  136e 2633          	jrne	L5064
10408  1370 e601          	ld	a,(1,x)
10409  1372 262f          	jrne	L5064
10411  1374 e602          	ld	a,(2,x)
10412  1376 262b          	jrne	L5064
10414  1378 e603          	ld	a,(3,x)
10415  137a a145          	cp	a,#69
10416  137c 2625          	jrne	L5064
10418  137e e604          	ld	a,(4,x)
10419  1380 a124          	cp	a,#36
10420  1382 261f          	jrne	L5064
10421                     ; 2080 			stOptValve.nOptFlg = 0;
10423  1384 725f0001      	clr	_stOptValve+1
10424                     ; 2081 			stOptValve.nRepFailCnt = 0;
10426  1388 725f0008      	clr	_stOptValve+8
10427                     ; 2082 			SaveParameterForType((u8*)&stOptValve, OPTVALVE_LEN, OPT_VALVE_PRAA);
10429  138c 4b06          	push	#6
10430  138e 4b0a          	push	#10
10431  1390 ae0000        	ldw	x,#_stOptValve
10432  1393 cd0000        	call	_SaveParameterForType
10434  1396 a601          	ld	a,#1
10435  1398 85            	popw	x
10436                     ; 2083 			SetLogonMode(UP_HEARTBEAT);
10438  1399 cd0033        	call	_SetLogonMode
10440                     ; 2084 			m_nRepEnableFlg = FALSE;
10442  139c 725f00ba      	clr	_m_nRepEnableFlg
10443                     ; 2085 			m_nWakeupReportFlg &=(~(REPORT_FAIL_FLG));
10445  13a0 cd1473        	call	LC022
10446  13a3               L5064:
10447                     ; 2089 		return FALSE;
10449  13a3 4f            	clr	a
10452  13a4 81            	ret	
10453  13a5               L3064:
10454                     ; 2093 	if((MASTER_OLD == m_nMasterType)&&(CTL_VALVE_OVER == stOptValve.nOptFlg))
10456  13a5 c600c0        	ld	a,_m_nMasterType
10457  13a8 2609          	jrne	L7064
10459  13aa c60001        	ld	a,_stOptValve+1
10460  13ad a1ee          	cp	a,#238
10461  13af 2602          	jrne	L7064
10462                     ; 2095 		return FALSE;
10464  13b1 4f            	clr	a
10467  13b2 81            	ret	
10468  13b3               L7064:
10469                     ; 2099 	if(0x00000200 != dwItem)
10471  13b3 96            	ldw	x,sp
10472  13b4 cd1483        	call	LC023
10474  13b7 2719          	jreq	L1164
10475                     ; 2108 		if(UP_UPLOAD_BAT_VAL == nLogonModeBk)
10477  13b9 c600cf        	ld	a,_nLogonModeBk
10478  13bc a104          	cp	a,#4
10479  13be 2612          	jrne	L1164
10480                     ; 2110 			g_nGuardEnFlg = (ALARM_REP_FLG|(g_nGuardEnFlg&0x3F));
10482  13c0 c60000        	ld	a,_g_nGuardEnFlg
10483  13c3 a43f          	and	a,#63
10484  13c5 aa02          	or	a,#2
10485  13c7 c70000        	ld	_g_nGuardEnFlg,a
10486                     ; 2111 			SaveByte(ADDRESS_GUARD_EN, g_nGuardEnFlg);
10488  13ca 88            	push	a
10489  13cb ae1000        	ldw	x,#4096
10490  13ce cd0000        	call	_SaveByte
10492  13d1 84            	pop	a
10493  13d2               L1164:
10494                     ; 2116 	if(0x00000100 == dwItem)
10496  13d2 96            	ldw	x,sp
10497  13d3 1c0003        	addw	x,#OFST+3
10498  13d6 cd0000        	call	c_ltor
10500  13d9 ae0497        	ldw	x,#L2301
10501  13dc cd0000        	call	c_lcmp
10503  13df 2611          	jrne	L5164
10504                     ; 2118 		m_nRepEnableFlg = FALSE;
10506  13e1 725f00ba      	clr	_m_nRepEnableFlg
10507                     ; 2119 		BatteryVolRepPro();
10509  13e5 cd01db        	call	_BatteryVolRepPro
10511                     ; 2120 		m_nWakeupReportFlg &=(~(REPORT_FAIL_FLG));
10513  13e8 cd1473        	call	LC022
10514                     ; 2123 		m_nDataRepSucFlg = TRUE;
10516  13eb 350100be      	mov	_m_nDataRepSucFlg,#1
10518  13ef cc1471        	jra	L7164
10519  13f2               L5164:
10520                     ; 2125 	else if(0x00000200 == dwItem)
10522  13f2 96            	ldw	x,sp
10523  13f3 cd1483        	call	LC023
10525  13f6 2615          	jrne	L1264
10526                     ; 2127 		g_dwRepTick = GetSysTemTick();
10528  13f8 cd148f        	call	LC024
10530                     ; 2128 		if((UP_UPLOAD == nLogonModeBk)||(UP_UPLOAD_BAT_VAL == nLogonModeBk))
10532  13fb c600cf        	ld	a,_nLogonModeBk
10533  13fe a103          	cp	a,#3
10534  1400 2704          	jreq	L5264
10536  1402 a104          	cp	a,#4
10537  1404 266b          	jrne	L7164
10538  1406               L5264:
10539                     ; 2130 			ucLogonMode = nLogonModeBk;
10541  1406 5500cf00d0    	mov	_ucLogonMode,_nLogonModeBk
10542  140b 2064          	jra	L7164
10543  140d               L1264:
10544                     ; 2135 		m_nRepEnableFlg = FALSE;
10546  140d 725f00ba      	clr	_m_nRepEnableFlg
10547                     ; 2136 		g_dwRepTick  = GetSysTemTick();
10549  1411 ad7c          	call	LC024
10551                     ; 2137 		g_nDatRepCnt = 0;
10553  1413 725f00b4      	clr	_g_nDatRepCnt
10554                     ; 2138 		SaveReportFlag(FALSE);
10556  1417 4f            	clr	a
10557  1418 cd0000        	call	_SaveReportFlag
10559                     ; 2139 		m_nWakeupReportFlg &=(~(REPORT_FAIL_FLG));
10561  141b ad56          	call	LC022
10562                     ; 2142 		m_nDataRepSucFlg = TRUE;
10564  141d 350100be      	mov	_m_nDataRepSucFlg,#1
10565                     ; 2143 		g_dwCommDelay = (u16)((dwItem>>8)&0x000000FF);
10567  1421 7b05          	ld	a,(OFST+5,sp)
10568  1423 5f            	clrw	x
10569  1424 cd0000        	call	c_uitol
10571  1427 ae00af        	ldw	x,#_g_dwCommDelay
10572  142a cd0000        	call	c_rtol
10574                     ; 2145 		if((45 <= g_dwCommDelay)&&(120 >= g_dwCommDelay))
10576  142d cd0000        	call	c_ltor
10578  1430 ae049b        	ldw	x,#L0501
10579  1433 cd0000        	call	c_lcmp
10581  1436 252d          	jrult	L1364
10583  1438 ae00af        	ldw	x,#_g_dwCommDelay
10584  143b cd0000        	call	c_ltor
10586  143e ae049f        	ldw	x,#L2501
10587  1441 cd0000        	call	c_lcmp
10589  1444 241f          	jruge	L1364
10590                     ; 2147 			g_dwCommDelay = ((g_dwCommDelay*5/7)*1000);
10592  1446 ae00af        	ldw	x,#_g_dwCommDelay
10593  1449 cd0000        	call	c_ltor
10595  144c a605          	ld	a,#5
10596  144e cd0000        	call	c_smul
10598  1451 ae04a3        	ldw	x,#L4501
10599  1454 cd0000        	call	c_ludv
10601  1457 ae04a7        	ldw	x,#L6501
10602  145a cd0000        	call	c_lmul
10604  145d ae00af        	ldw	x,#_g_dwCommDelay
10605  1460 cd0000        	call	c_rtol
10608  1463 200c          	jra	L7164
10609  1465               L1364:
10610                     ; 2151 			g_dwCommDelay = REPROT_DELAYTO;
10612  1465 ae1170        	ldw	x,#4464
10613  1468 cf00b1        	ldw	_g_dwCommDelay+2,x
10614  146b ae0001        	ldw	x,#1
10615  146e cf00af        	ldw	_g_dwCommDelay,x
10616  1471               L7164:
10617                     ; 2155 	return FALSE;
10619  1471 4f            	clr	a
10622  1472 81            	ret	
10624  1473               LC022:
10625  1473 c600a5        	ld	a,_m_nWakeupReportFlg
10626  1476 a4f1          	and	a,#241
10627  1478 c700a5        	ld	_m_nWakeupReportFlg,a
10628                     ; 2140 		SaveReportFlag(m_nWakeupReportFlg);		
10630  147b cd0000        	call	_SaveReportFlag
10632                     ; 2141 		m_nRepFailFlg = FALSE;	
10634  147e 725f00bd      	clr	_m_nRepFailFlg
10635  1482 81            	ret	
10636  1483               LC023:
10637  1483 1c0003        	addw	x,#OFST+3
10638  1486 cd0000        	call	c_ltor
10640  1489 ae0493        	ldw	x,#L6201
10641  148c cc0000        	jp	c_lcmp
10642  148f               LC024:
10643  148f cd0000        	call	_GetSysTemTick
10645  1492 ae00b5        	ldw	x,#_g_dwRepTick
10646  1495 cc0000        	jp	c_rtol
10685                     ; 2167 u8 FreezeUnitTransform(u16 wGmTime)
10685                     ; 2168 {
10686                     	switch	.text
10687  1498               _FreezeUnitTransform:
10689  1498 89            	pushw	x
10690  1499 88            	push	a
10691       00000001      OFST:	set	1
10694                     ; 2169 	u8 nGmUnit = 0;
10696  149a 0f01          	clr	(OFST+0,sp)
10697                     ; 2171 	if(05 == wGmTime)
10699  149c a30005        	cpw	x,#5
10700  149f 2604          	jrne	L3564
10701                     ; 2173 		nGmUnit = 254;
10703  14a1 a6fe          	ld	a,#254
10705  14a3 201b          	jp	LC025
10706  14a5               L3564:
10707                     ; 2175 	else if(15 == wGmTime)
10709  14a5 1e02          	ldw	x,(OFST+1,sp)
10710  14a7 a3000f        	cpw	x,#15
10711  14aa 2604          	jrne	L7564
10712                     ; 2177 		nGmUnit = 1;
10714  14ac a601          	ld	a,#1
10716  14ae 2010          	jp	LC025
10717  14b0               L7564:
10718                     ; 2179 	else if(30 == wGmTime)
10720  14b0 a3001e        	cpw	x,#30
10721  14b3 2604          	jrne	L3664
10722                     ; 2181 		nGmUnit = 2;
10724  14b5 a602          	ld	a,#2
10726  14b7 2007          	jp	LC025
10727  14b9               L3664:
10728                     ; 2183 	else if(60 == wGmTime)
10730  14b9 a3003c        	cpw	x,#60
10731  14bc 2604          	jrne	L5564
10732                     ; 2185 		nGmUnit = 3;
10734  14be a603          	ld	a,#3
10735  14c0               LC025:
10736  14c0 6b01          	ld	(OFST+0,sp),a
10737  14c2               L5564:
10738                     ; 2187 	return nGmUnit;	
10740  14c2 7b01          	ld	a,(OFST+0,sp)
10743  14c4 5b03          	addw	sp,#3
10744  14c6 81            	ret	
10747                     	switch	.const
10748  04ab               L1764_nTmpBuf:
10749  04ab 00            	dc.b	0
10750  04ac 000000        	ds.b	3
10862                     	switch	.const
10863  04af               L0701:
10864  04af eeeeeeee      	dc.l	-286331154
10865                     ; 2199 u8 RepPizeometerMakeFrame(u8* pnOutBuf, u8* pnLen)
10865                     ; 2200 {
10866                     	switch	.text
10867  14c7               _RepPizeometerMakeFrame:
10869  14c7 89            	pushw	x
10870  14c8 521b          	subw	sp,#27
10871       0000001b      OFST:	set	27
10874                     ; 2201 	u8 i = 0, nIndex = 0, nTimeFlg = TRUE, nAtReportLen = 0,nResult = 0;
10878  14ca 0f0b          	clr	(OFST-16,sp)
10881  14cc a601          	ld	a,#1
10882  14ce 6b04          	ld	(OFST-23,sp),a
10885  14d0 0f03          	clr	(OFST-24,sp)
10888                     ; 2203 	u16 wTemp = 0;
10890  14d2 5f            	clrw	x
10891  14d3 1f01          	ldw	(OFST-26,sp),x
10892                     ; 2204 	u8 nTmpBuf[4]={0};
10894  14d5 96            	ldw	x,sp
10895  14d6 1c0007        	addw	x,#OFST-20
10896  14d9 90ae04ab      	ldw	y,#L1764_nTmpBuf
10897  14dd a604          	ld	a,#4
10898  14df cd0000        	call	c_xymvx
10900                     ; 2206 	for(i = MAX_REPORT_NUM; i > 0; i--)  //  wTemp
10902  14e2 a61c          	ld	a,#28
10903  14e4 6b05          	ld	(OFST-22,sp),a
10904  14e6               L1474:
10905                     ; 2208 		nResult = ReadRecord(i-1, (u8*)&stRecord, sizeof(stRecord));
10907  14e6 4b10          	push	#16
10908  14e8 96            	ldw	x,sp
10909  14e9 1c000d        	addw	x,#OFST-14
10910  14ec 89            	pushw	x
10911  14ed 7b08          	ld	a,(OFST-19,sp)
10912  14ef 4a            	dec	a
10913  14f0 cd0000        	call	_ReadRecord
10915  14f3 5b03          	addw	sp,#3
10916  14f5 6b06          	ld	(OFST-21,sp),a
10917                     ; 2210 		if(((nResult)&&(FALSE == stRecord.nRepFlg))||(FALSE == nResult))
10919  14f7 2704          	jreq	L3574
10921  14f9 7b1b          	ld	a,(OFST+0,sp)
10922  14fb 2704          	jreq	L1574
10923  14fd               L3574:
10925  14fd 7b06          	ld	a,(OFST-21,sp)
10926  14ff 2606          	jrne	L7474
10927  1501               L1574:
10928                     ; 2212 			nTimeFlg = TRUE;
10930  1501 a601          	ld	a,#1
10931  1503 6b04          	ld	(OFST-23,sp),a
10932                     ; 2213 			nIndex   = 0;
10934  1505 0f0b          	clr	(OFST-16,sp)
10935  1507               L7474:
10936                     ; 2216 		if(nTimeFlg)
10938  1507 7b04          	ld	a,(OFST-23,sp)
10939  1509 2722          	jreq	L5574
10940                     ; 2219 			if((FALSE == nResult)
10940                     ; 2220 				||(0xFF == stRecord.Time.Byte.Hour)||(0xFF == stRecord.Time.Byte.Day)||(FALSE == stRecord.nRepFlg))
10942  150b 7b06          	ld	a,(OFST-21,sp)
10943  150d 2766          	jreq	L3474
10945  150f 7b0e          	ld	a,(OFST-13,sp)
10946  1511 4c            	inc	a
10947  1512 2761          	jreq	L3474
10949  1514 7b0f          	ld	a,(OFST-12,sp)
10950  1516 4c            	inc	a
10951  1517 275c          	jreq	L3474
10953  1519 7b1b          	ld	a,(OFST+0,sp)
10954  151b 2758          	jreq	L3474
10955                     ; 2224 			MemcpyFunc(pnOutBuf, (u8*)&stRecord.Time.Byte.Minute, 5); 
10957  151d 4b05          	push	#5
10958  151f 96            	ldw	x,sp
10959  1520 1c000e        	addw	x,#OFST-13
10960  1523 89            	pushw	x
10961  1524 1e1f          	ldw	x,(OFST+4,sp)
10962  1526 cd0000        	call	_MemcpyFunc
10964  1529 5b03          	addw	sp,#3
10965                     ; 2225 			nTimeFlg = FALSE;
10967  152b 0f04          	clr	(OFST-23,sp)
10968  152d               L5574:
10969                     ; 2228 		if(INVALID_DATA != stRecord.wPressure)
10971  152d 96            	ldw	x,sp
10972  152e cd15e6        	call	LC026
10974  1531 2714          	jreq	L7674
10975                     ; 2230 			JX_DWORDToBCD((u32)stRecord.wPressure, nTmpBuf, 4); 
10977  1533 4b04          	push	#4
10978  1535 96            	ldw	x,sp
10979  1536 1c0008        	addw	x,#OFST-19
10980  1539 89            	pushw	x
10981  153a 1e1b          	ldw	x,(OFST+0,sp)
10982  153c 89            	pushw	x
10983  153d 1e1b          	ldw	x,(OFST+0,sp)
10984  153f 89            	pushw	x
10985  1540 cd0000        	call	_JX_DWORDToBCD
10987  1543 5b07          	addw	sp,#7
10989  1545 200c          	jra	L1774
10990  1547               L7674:
10991                     ; 2234 			MemsetFunc(nTmpBuf, 0xEE, 4); 
10993  1547 4b04          	push	#4
10994  1549 4bee          	push	#238
10995  154b 96            	ldw	x,sp
10996  154c 1c0009        	addw	x,#OFST-18
10997  154f cd0000        	call	_MemsetFunc
10999  1552 85            	popw	x
11000  1553               L1774:
11001                     ; 2236 		MemcpyFunc(&pnOutBuf[nIndex*4+9], nTmpBuf, 4);		
11003  1553 4b04          	push	#4
11004  1555 96            	ldw	x,sp
11005  1556 1c0008        	addw	x,#OFST-19
11006  1559 89            	pushw	x
11007  155a 7b0e          	ld	a,(OFST-13,sp)
11008  155c 97            	ld	xl,a
11009  155d a604          	ld	a,#4
11010  155f 42            	mul	x,a
11011  1560 72fb1f        	addw	x,(OFST+4,sp)
11012  1563 1c0009        	addw	x,#9
11013  1566 cd0000        	call	_MemcpyFunc
11015  1569 5b03          	addw	sp,#3
11016                     ; 2238 		nAtReportLen = nIndex*4+9;
11018  156b 7b0b          	ld	a,(OFST-16,sp)
11019  156d 48            	sll	a
11020  156e 48            	sll	a
11021  156f ab09          	add	a,#9
11022  1571 6b03          	ld	(OFST-24,sp),a
11023                     ; 2239 		nIndex++;
11025  1573 0c0b          	inc	(OFST-16,sp)
11026  1575               L3474:
11027                     ; 2206 	for(i = MAX_REPORT_NUM; i > 0; i--)  //  wTemp
11029  1575 0a05          	dec	(OFST-22,sp)
11032  1577 2703cc14e6    	jrne	L1474
11033                     ; 2241 	if(((0 == i)&&(0 == nIndex))||(KEY_WUAKEUP_FLG&GetReportFailFlag()))
11036  157c 7b0b          	ld	a,(OFST-16,sp)
11037  157e 2707          	jreq	L5774
11039  1580 cd2a88        	call	_GetReportFailFlag
11041  1583 a501          	bcp	a,#1
11042  1585 2755          	jreq	L3774
11043  1587               L5774:
11044                     ; 2244 		if((INVALID_DATA != stRecord.wPressure)||(KEY_WUAKEUP_FLG&GetReportFailFlag()))
11046  1587 96            	ldw	x,sp
11047  1588 ad5c          	call	LC026
11049  158a 2607          	jrne	L3005
11051  158c cd2a88        	call	_GetReportFailFlag
11053  158f a501          	bcp	a,#1
11054  1591 273b          	jreq	L1005
11055  1593               L3005:
11056                     ; 2246 			JX_DWORDToBCD((u32)tyRecord.wPressure, nTmpBuf, 4); 
11058  1593 4b04          	push	#4
11059  1595 96            	ldw	x,sp
11060  1596 1c0008        	addw	x,#OFST-19
11061  1599 89            	pushw	x
11062  159a ce000c        	ldw	x,_tyRecord+12
11063  159d 89            	pushw	x
11064  159e ce000a        	ldw	x,_tyRecord+10
11065  15a1 89            	pushw	x
11066  15a2 cd0000        	call	_JX_DWORDToBCD
11068  15a5 5b07          	addw	sp,#7
11070  15a7               L5005:
11071                     ; 2252 		MemcpyFunc(&pnOutBuf[9], nTmpBuf, 4);	
11073  15a7 4b04          	push	#4
11074  15a9 96            	ldw	x,sp
11075  15aa 1c0008        	addw	x,#OFST-19
11076  15ad 89            	pushw	x
11077  15ae 1e1f          	ldw	x,(OFST+4,sp)
11078  15b0 1c0009        	addw	x,#9
11079  15b3 cd0000        	call	_MemcpyFunc
11081  15b6 5b03          	addw	sp,#3
11082                     ; 2253 		MemcpyFunc(pnOutBuf, (u8*)&tyRecord.Time.Byte.Minute, 5); 		
11084  15b8 4b05          	push	#5
11085  15ba ae0001        	ldw	x,#_tyRecord+1
11086  15bd 89            	pushw	x
11087  15be 1e1f          	ldw	x,(OFST+4,sp)
11088  15c0 cd0000        	call	_MemcpyFunc
11090  15c3 5b03          	addw	sp,#3
11091                     ; 2254 		*pnLen = 9;
11093  15c5 1e20          	ldw	x,(OFST+5,sp)
11094  15c7 a609          	ld	a,#9
11095  15c9 f7            	ld	(x),a
11096                     ; 2255 		return 1;
11098  15ca a601          	ld	a,#1
11100  15cc 2015          	jra	L4111
11101  15ce               L1005:
11102                     ; 2250 			MemsetFunc(nTmpBuf, 0xEE, 4); 
11104  15ce 4b04          	push	#4
11105  15d0 4bee          	push	#238
11106  15d2 96            	ldw	x,sp
11107  15d3 1c0009        	addw	x,#OFST-18
11108  15d6 cd0000        	call	_MemsetFunc
11110  15d9 85            	popw	x
11111  15da 20cb          	jra	L5005
11112  15dc               L3774:
11113                     ; 2258 	*pnLen = nAtReportLen;
11115  15dc 7b03          	ld	a,(OFST-24,sp)
11116  15de 1e20          	ldw	x,(OFST+5,sp)
11117  15e0 f7            	ld	(x),a
11118                     ; 2259 	return nIndex;	
11120  15e1 7b0b          	ld	a,(OFST-16,sp)
11122  15e3               L4111:
11124  15e3 5b1d          	addw	sp,#29
11125  15e5 81            	ret	
11127  15e6               LC026:
11128  15e6 1c0016        	addw	x,#OFST-5
11129  15e9 cd0000        	call	c_ltor
11131  15ec ae04af        	ldw	x,#L0701
11132  15ef cc0000        	jp	c_lcmp
11214                     ; 2271 u8 AutoReportMakeFrame(u8* pnOutBuf)
11214                     ; 2272 {
11215                     	switch	.text
11216  15f2               _AutoReportMakeFrame:
11218  15f2 89            	pushw	x
11219  15f3 5215          	subw	sp,#21
11220       00000015      OFST:	set	21
11223                     ; 2273 	u8 i = 0, nAutoFlg = 0, nAtReportLen = 0;
11227  15f5 0f01          	clr	(OFST-20,sp)
11230  15f7 0f04          	clr	(OFST-17,sp)
11231                     ; 2275 	u16 wTemp = 0;
11233  15f9 5f            	clrw	x
11234  15fa 1f02          	ldw	(OFST-19,sp),x
11235                     ; 2277 	for(i = 0; i < MAX_REPORT_NUM; i++)  //  wTemp
11237  15fc 0f05          	clr	(OFST-16,sp)
11238  15fe               L1405:
11239                     ; 2280 		if((FALSE == ReadRecord(i, (u8*)&stRecord, sizeof(stRecord)))
11239                     ; 2281 			||(0xFF == stRecord.Time.Byte.Hour)||(0xFF == stRecord.Time.Byte.Day)||(TRUE != stRecord.nRepFlg))
11241  15fe 4b10          	push	#16
11242  1600 96            	ldw	x,sp
11243  1601 1c0007        	addw	x,#OFST-14
11244  1604 89            	pushw	x
11245  1605 7b08          	ld	a,(OFST-13,sp)
11246  1607 cd0000        	call	_ReadRecord
11248  160a 5b03          	addw	sp,#3
11249  160c 4d            	tnz	a
11250  160d 270f          	jreq	L1505
11252  160f 7b08          	ld	a,(OFST-13,sp)
11253  1611 4c            	inc	a
11254  1612 270a          	jreq	L1505
11256  1614 7b09          	ld	a,(OFST-12,sp)
11257  1616 4c            	inc	a
11258  1617 2705          	jreq	L1505
11260  1619 7b15          	ld	a,(OFST+0,sp)
11261  161b 4a            	dec	a
11262  161c 275f          	jreq	L7405
11263  161e               L1505:
11264                     ; 2283 			if(0 == i)
11266  161e 7b05          	ld	a,(OFST-16,sp)
11267  1620 2703cc1710    	jrne	L5405
11268                     ; 2290 				if(TRUE == stRecord.nRepFlg)  /* 去除因为已经上报过数据而补报全EE问题20170414 */
11270  1625 7b15          	ld	a,(OFST+0,sp)
11271  1627 4a            	dec	a
11272  1628 2607          	jrne	L1605
11273                     ; 2292 					stRecord.Value = INVALID_DATA;
11275  162a aeeeee        	ldw	x,#61166
11276  162d 1f0e          	ldw	(OFST-7,sp),x
11277  162f 1f0c          	ldw	(OFST-9,sp),x
11278  1631               L1605:
11279                     ; 2294 				MemcpyFunc(&pnOutBuf[5], (u8*)&stRecord.Time, sizeof(stRecord.Time));
11281  1631 4b06          	push	#6
11282  1633 96            	ldw	x,sp
11283  1634 1c0007        	addw	x,#OFST-14
11284  1637 89            	pushw	x
11285  1638 1e19          	ldw	x,(OFST+4,sp)
11286  163a 1c0005        	addw	x,#5
11287  163d cd0000        	call	_MemcpyFunc
11289  1640 5b03          	addw	sp,#3
11290                     ; 2296 				JX_BL_Change(4,(u8*)&stRecord.Value);
11292  1642 96            	ldw	x,sp
11293  1643 cd1727        	call	LC028
11294                     ; 2297 				MemcpyFunc(pnOutBuf, (u8*)&stRecord.Value, sizeof(stRecord.Value));
11296  1646 4b04          	push	#4
11297  1648 96            	ldw	x,sp
11298  1649 1c000d        	addw	x,#OFST-8
11299  164c 89            	pushw	x
11300  164d 1e19          	ldw	x,(OFST+4,sp)
11301  164f cd0000        	call	_MemcpyFunc
11303  1652 5b03          	addw	sp,#3
11304                     ; 2298 				pnOutBuf[4] = tyParameter.Status;
11306  1654 1e16          	ldw	x,(OFST+1,sp)
11307  1656 c60001        	ld	a,_tyParameter+1
11308  1659 e704          	ld	(4,x),a
11309                     ; 2299 				MemcpyFunc(&pnOutBuf[11], (u8*)&tyReport.wGatherCycle, sizeof(tyReport.wGatherCycle));		
11311  165b 4b02          	push	#2
11312  165d ae00c1        	ldw	x,#_tyReport
11313  1660 89            	pushw	x
11314  1661 1e19          	ldw	x,(OFST+4,sp)
11315  1663 1c000b        	addw	x,#11
11316  1666 cd0000        	call	_MemcpyFunc
11318  1669 5b03          	addw	sp,#3
11319                     ; 2300 				JX_BL_Change(2,(u8*)&pnOutBuf[11]);
11321  166b 1e16          	ldw	x,(OFST+1,sp)
11322  166d 1c000b        	addw	x,#11
11323  1670 89            	pushw	x
11324  1671 ae0002        	ldw	x,#2
11325  1674 cd0000        	call	_JX_BL_Change
11327  1677 a60d          	ld	a,#13
11328  1679 85            	popw	x
11329                     ; 2301 				return 13;
11332  167a cc171f        	jra	L4511
11333  167d               L7405:
11334                     ; 2307 		VavleStatTransform(m_nMasterType, stRecord.nStatus, &stRecord.nStatus);
11336  167d 96            	ldw	x,sp
11337  167e 1c0014        	addw	x,#OFST-1
11338  1681 89            	pushw	x
11339  1682 7b16          	ld	a,(OFST+1,sp)
11340  1684 97            	ld	xl,a
11341  1685 c600c0        	ld	a,_m_nMasterType
11342  1688 95            	ld	xh,a
11343  1689 cd0000        	call	_VavleStatTransform
11345  168c 85            	popw	x
11346                     ; 2309 		m_nRepIndex	= i;
11348  168d 7b05          	ld	a,(OFST-16,sp)
11349  168f c700bc        	ld	_m_nRepIndex,a
11350                     ; 2310 		JX_BL_Change(4,(u8*)&stRecord.Value);
11352  1692 96            	ldw	x,sp
11353  1693 cd1727        	call	LC028
11354                     ; 2311 		MemcpyFunc(&pnOutBuf[i*4], (u8*)&stRecord.Value, sizeof(stRecord.Value));
11356  1696 4b04          	push	#4
11357  1698 96            	ldw	x,sp
11358  1699 1c000d        	addw	x,#OFST-8
11359  169c 89            	pushw	x
11360  169d 7b08          	ld	a,(OFST-13,sp)
11361  169f cd1722        	call	LC027
11362  16a2 72fb19        	addw	x,(OFST+4,sp)
11363  16a5 cd0000        	call	_MemcpyFunc
11365  16a8 5b03          	addw	sp,#3
11366                     ; 2312 		MemcpyFunc(&pnOutBuf[i*4+4], (u8*)&stRecord.nStatus, sizeof(stRecord.nStatus));
11368  16aa 4b01          	push	#1
11369  16ac 96            	ldw	x,sp
11370  16ad 1c0015        	addw	x,#OFST+0
11371  16b0 89            	pushw	x
11372  16b1 7b08          	ld	a,(OFST-13,sp)
11373  16b3 ad6d          	call	LC027
11374  16b5 72fb19        	addw	x,(OFST+4,sp)
11375  16b8 1c0004        	addw	x,#4
11376  16bb cd0000        	call	_MemcpyFunc
11378  16be 5b03          	addw	sp,#3
11379                     ; 2313 		MemcpyFunc(&pnOutBuf[i*4+5], (u8*)&stRecord.Time, sizeof(stRecord.Time)); 
11381  16c0 4b06          	push	#6
11382  16c2 96            	ldw	x,sp
11383  16c3 1c0007        	addw	x,#OFST-14
11384  16c6 89            	pushw	x
11385  16c7 7b08          	ld	a,(OFST-13,sp)
11386  16c9 ad57          	call	LC027
11387  16cb 72fb19        	addw	x,(OFST+4,sp)
11388  16ce 1c0005        	addw	x,#5
11389  16d1 cd0000        	call	_MemcpyFunc
11391  16d4 5b03          	addw	sp,#3
11392                     ; 2314 		MemcpyFunc(&pnOutBuf[i*4+5+6], (u8*)&tyReport.wGatherCycle, sizeof(tyReport.wGatherCycle)); 	
11394  16d6 4b02          	push	#2
11395  16d8 ae00c1        	ldw	x,#_tyReport
11396  16db 89            	pushw	x
11397  16dc 7b08          	ld	a,(OFST-13,sp)
11398  16de ad42          	call	LC027
11399  16e0 72fb19        	addw	x,(OFST+4,sp)
11400  16e3 1c000b        	addw	x,#11
11401  16e6 cd0000        	call	_MemcpyFunc
11403  16e9 5b03          	addw	sp,#3
11404                     ; 2315 		JX_BL_Change(2,(u8*)&pnOutBuf[i*4+5+6]);
11406  16eb 7b05          	ld	a,(OFST-16,sp)
11407  16ed ad33          	call	LC027
11408  16ef 72fb16        	addw	x,(OFST+1,sp)
11409  16f2 1c000b        	addw	x,#11
11410  16f5 89            	pushw	x
11411  16f6 ae0002        	ldw	x,#2
11412  16f9 cd0000        	call	_JX_BL_Change
11414  16fc 85            	popw	x
11415                     ; 2316 		nAtReportLen = i*4+5+6+2;
11417  16fd 7b05          	ld	a,(OFST-16,sp)
11418  16ff 48            	sll	a
11419  1700 48            	sll	a
11420  1701 ab0d          	add	a,#13
11421  1703 6b04          	ld	(OFST-17,sp),a
11422                     ; 2277 	for(i = 0; i < MAX_REPORT_NUM; i++)  //  wTemp
11424  1705 0c05          	inc	(OFST-16,sp)
11427  1707 7b05          	ld	a,(OFST-16,sp)
11428  1709 a11c          	cp	a,#28
11429  170b 2403cc15fe    	jrult	L1405
11430  1710               L5405:
11431                     ; 2318 	JX_BL_DwordChange(m_nRepIndex+1, (u32*)pnOutBuf);
11433  1710 1e16          	ldw	x,(OFST+1,sp)
11434  1712 89            	pushw	x
11435  1713 c600bc        	ld	a,_m_nRepIndex
11436  1716 5f            	clrw	x
11437  1717 97            	ld	xl,a
11438  1718 5c            	incw	x
11439  1719 cd0000        	call	_JX_BL_DwordChange
11441  171c 85            	popw	x
11442                     ; 2320 	return nAtReportLen;	
11444  171d 7b04          	ld	a,(OFST-17,sp)
11446  171f               L4511:
11448  171f 5b17          	addw	sp,#23
11449  1721 81            	ret	
11451  1722               LC027:
11452  1722 97            	ld	xl,a
11453  1723 a604          	ld	a,#4
11454  1725 42            	mul	x,a
11455  1726 81            	ret	
11456  1727               LC028:
11457  1727 1c000c        	addw	x,#OFST-9
11458  172a 89            	pushw	x
11459  172b ae0004        	ldw	x,#4
11460  172e cd0000        	call	_JX_BL_Change
11462  1731 85            	popw	x
11463  1732 81            	ret	
11605                     ; 2332 s8 Protol130Send(u8 Size, u8 nComChannel)
11605                     ; 2333 {
11606                     	switch	.text
11607  1733               _Protol130Send:
11609  1733 89            	pushw	x
11610  1734 520c          	subw	sp,#12
11611       0000000c      OFST:	set	12
11614                     ; 2335 	u16 length = 0;
11616  1736 1e0a          	ldw	x,(OFST-2,sp)
11617                     ; 2337 	s8 nFailCnt = 0, nOptRelt = FALSE;
11619  1738 0f03          	clr	(OFST-9,sp)
11622  173a 7b0c          	ld	a,(OFST+0,sp)
11623  173c 97            	ld	xl,a
11624                     ; 2340 	if(COM_1 == nComChannel)
11626  173d 7b0e          	ld	a,(OFST+2,sp)
11627  173f 4a            	dec	a
11628  1740 2635          	jrne	L3415
11630  1742 2029          	jra	L7415
11631  1744               L5415:
11632                     ; 2345 			nOptRelt = M590_TcpSendDatLen(Size + 8); //0x0D不算入长度
11634  1744 7b0d          	ld	a,(OFST+1,sp)
11635  1746 ab08          	add	a,#8
11636  1748 cd12a3        	call	_M590_TcpSendDatLen
11638  174b 6b0c          	ld	(OFST+0,sp),a
11639                     ; 2346 			if(-1 == nOptRelt)
11641  174d a1ff          	cp	a,#255
11642  174f 260f          	jrne	L3515
11643                     ; 2348 				stRepFail.wError |= (1<<DATSEND_ERROR);
11645  1751 72100006      	bset	_stRepFail+6,#0
11646                     ; 2349 				M590_CloseConnect();
11648  1755 cd117b        	call	_M590_CloseConnect
11650                     ; 2350 				ucStatusGsm = GSM_SHAKEHAND;
11652  1758 350200ce      	mov	_ucStatusGsm,#2
11653                     ; 2351 				return -1;
11655  175c a6ff          	ld	a,#255
11657  175e 200a          	jra	L2711
11658  1760               L3515:
11659                     ; 2353 			if(TRUE == nOptRelt)
11661  1760 4a            	dec	a
11662  1761 260a          	jrne	L7415
11663                     ; 2355 				break;
11664  1763               L1515:
11665                     ; 2358 		if(nFailCnt >= 3 )
11667  1763 7b03          	ld	a,(OFST-9,sp)
11668  1765 a103          	cp	a,#3
11669  1767 2f0e          	jrslt	L3415
11670                     ; 2360 			return FALSE;
11672  1769 4f            	clr	a
11674  176a               L2711:
11676  176a 5b0e          	addw	sp,#14
11677  176c 81            	ret	
11678  176d               L7415:
11679                     ; 2343 		while(3 > nFailCnt++)
11681  176d 7b03          	ld	a,(OFST-9,sp)
11682  176f 0c03          	inc	(OFST-9,sp)
11683  1771 a103          	cp	a,#3
11684  1773 2fcf          	jrslt	L5415
11685  1775 20ec          	jra	L1515
11686  1777               L3415:
11687                     ; 2364 	length = Size * 4 + 1;		//长度计算方法,长度是从68后面开始到校验位结束,*4+1就是协议规定的发送数据
11689  1777 7b0d          	ld	a,(OFST+1,sp)
11690  1779 97            	ld	xl,a
11691  177a a604          	ld	a,#4
11692  177c 42            	mul	x,a
11693  177d 5c            	incw	x
11694  177e 1f0a          	ldw	(OFST-2,sp),x
11695                     ; 2366 	tyProtol130Head.Head0 = MSG_START;		//数据包头
11697  1780 a668          	ld	a,#104
11698  1782 6b04          	ld	(OFST-8,sp),a
11699                     ; 2367 	tyProtol130Head.Length0[0] = (length&0xFF);
11701  1784 7b0b          	ld	a,(OFST-1,sp)
11702  1786 6b05          	ld	(OFST-7,sp),a
11703                     ; 2368 	tyProtol130Head.Length0[1] = ((length>>8)&0xFF);
11705  1788 7b0a          	ld	a,(OFST-2,sp)
11706  178a 6b06          	ld	(OFST-6,sp),a
11707                     ; 2369 	tyProtol130Head.Length1[0] = (length&0xFF);		//协议规定,重复
11709  178c 7b0b          	ld	a,(OFST-1,sp)
11710  178e 6b07          	ld	(OFST-5,sp),a
11711                     ; 2370 	tyProtol130Head.Length1[1] = ((length>>8)&0xFF);
11713  1790 7b0a          	ld	a,(OFST-2,sp)
11714  1792 6b08          	ld	(OFST-4,sp),a
11715                     ; 2371 	tyProtol130Head.Head1 = MSG_START;		//数据包头
11717  1794 a668          	ld	a,#104
11718  1796 6b09          	ld	(OFST-3,sp),a
11719                     ; 2372 	Point = aucUartTxBuffer;		//指针指向接收发送缓冲头
11721  1798 ae0000        	ldw	x,#_aucUartTxBuffer
11722  179b 1f01          	ldw	(OFST-11,sp),x
11723                     ; 2373 	length = Size;
11725  179d 7b0d          	ld	a,(OFST+1,sp)
11726  179f 5f            	clrw	x
11727  17a0 97            	ld	xl,a
11728  17a1 1f0a          	ldw	(OFST-2,sp),x
11729                     ; 2375 	MemcpyFunc(Point, (u8 *)&tyProtol130Head, sizeof(tyProtol130Head) );	//复制数据头到缓冲中
11731  17a3 4b06          	push	#6
11732  17a5 96            	ldw	x,sp
11733  17a6 1c0005        	addw	x,#OFST-7
11734  17a9 89            	pushw	x
11735  17aa 1e04          	ldw	x,(OFST-8,sp)
11736  17ac cd0000        	call	_MemcpyFunc
11738  17af 5b03          	addw	sp,#3
11739                     ; 2376 	Point += sizeof(tyProtol130Head);			//指针向下
11741  17b1 1e01          	ldw	x,(OFST-11,sp)
11742  17b3 1c0006        	addw	x,#6
11743  17b6 1f01          	ldw	(OFST-11,sp),x
11744                     ; 2377 	checksum = 0;					//校验和是累加和
11746  17b8 0f03          	clr	(OFST-9,sp)
11747                     ; 2378 	for (nX = 0; nX < Size; nX++)
11749  17ba 0f0c          	clr	(OFST+0,sp)
11751  17bc 200b          	jra	L5615
11752  17be               L1615:
11753                     ; 2380 		checksum += tyProtol130.Buffer[nX];    //计算累加和
11755  17be 5f            	clrw	x
11756  17bf 97            	ld	xl,a
11757  17c0 7b03          	ld	a,(OFST-9,sp)
11758  17c2 db0026        	add	a,(_tyProtol130,x)
11759  17c5 6b03          	ld	(OFST-9,sp),a
11760                     ; 2378 	for (nX = 0; nX < Size; nX++)
11762  17c7 0c0c          	inc	(OFST+0,sp)
11763  17c9               L5615:
11766  17c9 7b0c          	ld	a,(OFST+0,sp)
11767  17cb 110d          	cp	a,(OFST+1,sp)
11768  17cd 25ef          	jrult	L1615
11769                     ; 2382 	tyProtol130.Buffer[length++] = checksum;
11771  17cf 7b03          	ld	a,(OFST-9,sp)
11772  17d1 1e0a          	ldw	x,(OFST-2,sp)
11773  17d3 d70026        	ld	(_tyProtol130,x),a
11774  17d6 5c            	incw	x
11775                     ; 2383 	tyProtol130.Buffer[length++] = MSG_END;		//数据包尾
11777  17d7 a616          	ld	a,#22
11778  17d9 d70026        	ld	(_tyProtol130,x),a
11779  17dc 5c            	incw	x
11780  17dd 1f0a          	ldw	(OFST-2,sp),x
11781                     ; 2384 	MemcpyFunc(Point, (u8 *)&tyProtol130, length);		//复制字符串到缓冲中
11783  17df 7b0b          	ld	a,(OFST-1,sp)
11784  17e1 88            	push	a
11785  17e2 ae0026        	ldw	x,#_tyProtol130
11786  17e5 89            	pushw	x
11787  17e6 1e04          	ldw	x,(OFST-8,sp)
11788  17e8 cd0000        	call	_MemcpyFunc
11790  17eb 5b03          	addw	sp,#3
11791                     ; 2385 	Point += length;					//
11793  17ed 1e01          	ldw	x,(OFST-11,sp)
11794  17ef 72fb0a        	addw	x,(OFST-2,sp)
11795  17f2 1f01          	ldw	(OFST-11,sp),x
11796                     ; 2387 	FrameSendFunc(Size+8, nComChannel, Point);	
11798  17f4 89            	pushw	x
11799  17f5 7b10          	ld	a,(OFST+4,sp)
11800  17f7 97            	ld	xl,a
11801  17f8 7b0f          	ld	a,(OFST+3,sp)
11802  17fa ab08          	add	a,#8
11803  17fc 95            	ld	xh,a
11804  17fd cd0275        	call	_FrameSendFunc
11806  1800 a601          	ld	a,#1
11807  1802 85            	popw	x
11808                     ; 2388 	return TRUE;
11811  1803 cc176a        	jra	L2711
12768                     	switch	.const
12769  04b3               L6221:
12770  04b3 fffff1f1      	dc.l	-3599
12771  04b7               L0321:
12772  04b7 00000e10      	dc.l	3600
12773  04bb               L1216:
12774  04bb 0003          	dc.w	3
12775  04bd 00000100      	dc.l	256
12776  04c1 19e6          	dc.w	L3025
12777  04c3 00000200      	dc.l	512
12778  04c7 19e6          	dc.w	L3025
12779  04c9 00000300      	dc.l	768
12780  04cd 19e6          	dc.w	L3025
12781  04cf 19eb          	dc.w	L5025
12782  04d1               L5216:
12783  04d1 0002          	dc.w	2
12784  04d3 000002fa      	dc.l	762
12785  04d7 1a10          	dc.w	L3125
12786  04d9 000080f8      	dc.l	33016
12787  04dd 19fa          	dc.w	L1125
12788  04df 1a20          	dc.w	L5125
12789  04e1               L1316:
12790  04e1 0002          	dc.w	2
12791  04e3 000040fa      	dc.l	16634
12792  04e7 1a52          	dc.w	L3225
12793  04e9 000080f8      	dc.l	33016
12794  04ed 1a3c          	dc.w	L1225
12795  04ef 1a5e          	dc.w	L3316
12796  04f1               L4131:
12797  04f1 0000003c      	dc.l	60
12798  04f5               L2231:
12799  04f5 00000032      	dc.l	50
12800  04f9               L7316:
12801  04f9 0007          	dc.w	7
12802  04fb 0000010b      	dc.l	267
12803  04ff 1bda          	dc.w	L5425
12804  0501 00004000      	dc.l	16384
12805  0505 1a78          	dc.w	L7225
12806  0507 00004003      	dc.l	16387
12807  050b 1bd2          	dc.w	L1425
12808  050d 00008040      	dc.l	32832
12809  0511 1b85          	dc.w	L3325
12810  0513 00008051      	dc.l	32849
12811  0517 1b9f          	dc.w	L5325
12812  0519 00008053      	dc.l	32851
12813  051d 1bbe          	dc.w	L7325
12814  051f 01012003      	dc.l	16850947
12815  0523 1ac9          	dc.w	L1325
12816  0525 1c62          	dc.w	L1416
12817  0527               L5516:
12818  0527 0005          	dc.w	5
12819  0529 00004000      	dc.l	16384
12820  052d 1c7d          	dc.w	L1525
12821  052f 00004003      	dc.l	16387
12822  0533 1d31          	dc.w	L5525
12823  0535 00008052      	dc.l	32850
12824  0539 1d60          	dc.w	L7525
12825  053b 00008054      	dc.l	32852
12826  053f 1da5          	dc.w	L1625
12827  0541 01012003      	dc.l	16850947
12828  0545 1cf4          	dc.w	L3525
12829  0547 1dc3          	dc.w	L7516
12830  0549               L3616:
12831  0549 000d          	dc.w	13
12832  054b 00000100      	dc.l	256
12833  054f 1e01          	dc.w	L1725
12834  0551 00000101      	dc.l	257
12835  0555 1dd3          	dc.w	L5625
12836  0557 00000107      	dc.l	263
12837  055b 1e28          	dc.w	L3725
12838  055d 00000108      	dc.l	264
12839  0561 1eb9          	dc.w	L5725
12840  0563 00000109      	dc.l	265
12841  0567 1fa9          	dc.w	L7725
12842  0569 0000010a      	dc.l	266
12843  056d 1fd9          	dc.w	L1035
12844  056f 0000010c      	dc.l	268
12845  0573 2087          	dc.w	L7035
12846  0575 0000010d      	dc.l	269
12847  0579 1dea          	dc.w	L7625
12848  057b 0000010e      	dc.l	270
12849  057f 200b          	dc.w	L3035
12850  0581 00000114      	dc.l	276
12851  0585 2037          	dc.w	L5035
12852  0587 0000100c      	dc.l	4108
12853  058b 209d          	dc.w	L1135
12854  058d 00008040      	dc.l	32832
12855  0591 20b2          	dc.w	L3135
12856  0593 20000107      	dc.l	536871175
12857  0597 1e28          	dc.w	L3725
12858  0599 20db          	dc.w	L5616
12859  059b               L3326:
12860  059b 0007          	dc.w	7
12861  059d 00000100      	dc.l	256
12862  05a1 20eb          	dc.w	L7135
12863  05a3 00000200      	dc.l	512
12864  05a7 214a          	dc.w	L3235
12865  05a9 00001001      	dc.l	4097
12866  05ad 214d          	dc.w	L5235
12867  05af 00001003      	dc.l	4099
12868  05b3 2177          	dc.w	L7235
12869  05b5 0000100c      	dc.l	4108
12870  05b9 2194          	dc.w	L1335
12871  05bb 00004523      	dc.l	17699
12872  05bf 211d          	dc.w	L1235
12873  05c1 20000102      	dc.l	536871170
12874  05c5 20eb          	dc.w	L7135
12875  05c7 21ae          	dc.w	L3335
12876                     ; 2396 u8 Protol130Handle(void)
12876                     ; 2397 {
12877                     	switch	.text
12878  1806               _Protol130Handle:
12880  1806 524e          	subw	sp,#78
12881       0000004e      OFST:	set	78
12884                     ; 2398 	u8 f        = 0;
12886  1808 0f49          	clr	(OFST-5,sp)
12887                     ; 2399 	u8 h        = 0;
12889  180a 0f36          	clr	(OFST-24,sp)
12890                     ; 2400 	u8 nSendLen = 0;
12892  180c 0f4a          	clr	(OFST-4,sp)
12893                     ; 2402 	u16 wBatVol = 0, wAddrLow = 0, wAddrHigh = 0;
12895  180e 5f            	clrw	x
12896  180f 1f09          	ldw	(OFST-69,sp),x
12899  1811 1f0b          	ldw	(OFST-67,sp),x
12902  1813 1f0d          	ldw	(OFST-65,sp),x
12903                     ; 2405 	int32_t dwTimeOffset = 0;
12905  1815 96            	ldw	x,sp
12906  1816 1c0017        	addw	x,#OFST-55
12907  1819 cd0000        	call	c_ltor
12909                     ; 2408 	u8 nOptCmd = 0, nOptRlt = 0, nCnt = 0, nSig = 0;
12913  181c 4f            	clr	a
12914  181d 6b48          	ld	(OFST-6,sp),a
12919                     ; 2409 	u8 nVavleStat = 0;
12921  181f 0f1b          	clr	(OFST-51,sp)
12922                     ; 2411 	int32_t  dwOffset = 0, dwTemp = 0;
12924  1821 5f            	clrw	x
12925  1822 1f03          	ldw	(OFST-75,sp),x
12926  1824 1f01          	ldw	(OFST-77,sp),x
12929  1826 1f07          	ldw	(OFST-71,sp),x
12930  1828 1f05          	ldw	(OFST-73,sp),x
12931                     ; 2415 	MemcpyFunc(tyProtol130.Packet.Address, (u8 *)&g_dwTmAddress, sizeof(tyProtol130.Packet.Address));
12933  182a cd21e2        	call	LC051
12934                     ; 2416 	tyProtol130.Packet.Broadcast &= 0xfe;			                    //清除广播包标志
12936  182d 7211002b      	bres	_tyProtol130+5,#0
12937                     ; 2417 	tyProtol130.Packet.Control = 0x80;
12939  1831 35800026      	mov	_tyProtol130,#128
12940                     ; 2418 	tyProtol130.Packet.Seq = (tyProtol130.Packet.Seq&0x0F|0x60);		//单帧报文+需要回复
12942  1835 c6002d        	ld	a,_tyProtol130+7
12943  1838 a40f          	and	a,#15
12944  183a aa60          	or	a,#96
12945  183c c7002d        	ld	_tyProtol130+7,a
12946                     ; 2419 	MemcpyFunc((u8*)&temp.Bytes.B0, (u8*)tyProtol130.Packet.Data, 4);	
12948  183f 4b04          	push	#4
12949  1841 ae002e        	ldw	x,#_tyProtol130+8
12950  1844 89            	pushw	x
12951  1845 96            	ldw	x,sp
12952  1846 1c004e        	addw	x,#OFST+0
12953  1849 cd0000        	call	_MemcpyFunc
12955  184c 5b03          	addw	sp,#3
12956                     ; 2421 	switch (tyProtol130.Packet.Afn)
12958  184e c6002c        	ld	a,_tyProtol130+6
12960                     ; 3178 		break;
12961  1851 273e          	jreq	L1715
12962  1853 4a            	dec	a
12963  1854 2603cc19d9    	jreq	L1025
12964  1859 4a            	dec	a
12965  185a 2735          	jreq	L1715
12966  185c a002          	sub	a,#2
12967  185e 2603cc19ed    	jreq	L7025
12968  1863 a006          	sub	a,#6
12969  1865 2603cc1a2f    	jreq	L7125
12970  186a a07a          	sub	a,#122
12971  186c 2603cc1a68    	jreq	L5225
12972  1871 4a            	dec	a
12973  1872 2603cc20de    	jreq	L5135
12974  1877 a005          	sub	a,#5
12975  1879 2603cc1c6c    	jreq	L7425
12976  187e a002          	sub	a,#2
12977  1880 2603cc1dc6    	jreq	L3625
12978  1885 4a            	dec	a
12979  1886 2603cc21b1    	jreq	L5335
12980  188b 4a            	dec	a
12981  188c 27fa          	jreq	L5335
12982  188e cc21d4        	jra	L3706
12983  1891               L1715:
12984                     ; 2423 	case 0x00:			//集中登录后的回复
12984                     ; 2424 	case 0x02:			//兼容新主站登录应答
12984                     ; 2425 		if ((0x00000400 == temp.Long)
12984                     ; 2426 		&& (tyProtol130.Packet.Buf[0] == 2)
12984                     ; 2427 		&& (tyProtol130.Packet.Buf[1] == 0x10) && (tyProtol130.Packet.Buf[2] == 0)
12984                     ; 2428 		&& ((tyProtol130.Packet.Buf[3] == 0x01)||(tyProtol130.Packet.Buf[3] == 0x04)) && (tyProtol130.Packet.Buf[4] == 0))
12986  1891 96            	ldw	x,sp
12987  1892 1c004b        	addw	x,#OFST-3
12988  1895 cd0000        	call	c_ltor
12990  1898 ae048f        	ldw	x,#L6101
12991  189b cd0000        	call	c_lcmp
12993  189e 2703cc19c7    	jrne	L5706
12995  18a3 c60032        	ld	a,_tyProtol130+12
12996  18a6 a102          	cp	a,#2
12997  18a8 26f6          	jrne	L5706
12999  18aa c60033        	ld	a,_tyProtol130+13
13000  18ad a110          	cp	a,#16
13001  18af 26ef          	jrne	L5706
13003  18b1 725d0034      	tnz	_tyProtol130+14
13004  18b5 26e9          	jrne	L5706
13006  18b7 c60035        	ld	a,_tyProtol130+15
13007  18ba 4a            	dec	a
13008  18bb 2707          	jreq	L7706
13010  18bd c60035        	ld	a,_tyProtol130+15
13011  18c0 a104          	cp	a,#4
13012  18c2 26dc          	jrne	L5706
13013  18c4               L7706:
13015  18c4 725d0036      	tnz	_tyProtol130+16
13016  18c8 26d6          	jrne	L5706
13017                     ; 2430 			switch (tyProtol130.Packet.Buf[3])
13019  18ca c60035        	ld	a,_tyProtol130+15
13021                     ; 2480 					break;
13022  18cd 4a            	dec	a
13023  18ce 2710          	jreq	L3715
13024  18d0 4a            	dec	a
13025  18d1 2603cc19a9    	jreq	L5715
13026  18d6 a002          	sub	a,#2
13027  18d8 2603cc19ae    	jreq	L7715
13028  18dd cc19c7        	jra	L5706
13029  18e0               L3715:
13030                     ; 2432 				case 1:
13030                     ; 2433 					//进上报
13030                     ; 2434 					m_nMasterType = tyProtol130.Packet.Buf[5];
13032  18e0 55003700c0    	mov	_m_nMasterType,_tyProtol130+17
13033                     ; 2435 					MeterTnNumTransform(m_nMasterType, &m_nGmTn_1, &m_nGmTn_2);
13035  18e5 ae00c2        	ldw	x,#_m_nGmTn_2
13036  18e8 89            	pushw	x
13037  18e9 ae00c1        	ldw	x,#_m_nGmTn_1
13038  18ec 89            	pushw	x
13039  18ed c600c0        	ld	a,_m_nMasterType
13040  18f0 cd001c        	call	_MeterTnNumTransform
13042  18f3 5b04          	addw	sp,#4
13043                     ; 2436 					SetIO_LEDOn();
13045  18f5 4b01          	push	#1
13046  18f7 4b04          	push	#4
13047  18f9 ae5005        	ldw	x,#20485
13048  18fc cd0000        	call	_GPIO_WriteBit
13050  18ff a603          	ld	a,#3
13051  1901 85            	popw	x
13052                     ; 2437 					SetLogonMode(UP_UPLOAD);
13054  1902 cd0033        	call	_SetLogonMode
13056                     ; 2438 					MemcpyFunc(&stTimeNow.nMonth, &tyProtol130.Packet.Buf[8], 5);
13058  1905 4b05          	push	#5
13059  1907 ae003a        	ldw	x,#_tyProtol130+20
13060  190a 89            	pushw	x
13061  190b ae0013        	ldw	x,#_stTimeNow+1
13062  190e cd0000        	call	_MemcpyFunc
13064  1911 5b03          	addw	sp,#3
13065                     ; 2439 					stTimeNow.wYear = tyProtol130.Packet.Buf[6];
13067  1913 5500380012    	mov	_stTimeNow,_tyProtol130+18
13068                     ; 2440 					TM_TimeChangeAToB(&stTimeNow, &stEnd);
13070  1918 96            	ldw	x,sp
13071  1919 1c000f        	addw	x,#OFST-63
13072  191c 89            	pushw	x
13073  191d ae0012        	ldw	x,#_stTimeNow
13074  1920 cd0000        	call	_TM_TimeChangeAToB
13076  1923 85            	popw	x
13077                     ; 2441 					if(FALSE == TM_IsValidTimePro(&stEnd))
13079  1924 96            	ldw	x,sp
13080  1925 1c000f        	addw	x,#OFST-63
13081  1928 cd0000        	call	_TM_IsValidTimePro
13083  192b 4d            	tnz	a
13084  192c 27af          	jreq	L5706
13085                     ; 2443 						break;
13087                     ; 2445 					STM8_RTC_Get(&stReportTime);	
13089  192e 96            	ldw	x,sp
13090  192f 1c0037        	addw	x,#OFST-23
13091  1932 cd0000        	call	_STM8_RTC_Get
13093                     ; 2446 					STM8_RTC_Set(&stTimeNow);		
13095  1935 ae0012        	ldw	x,#_stTimeNow
13096  1938 cd0000        	call	_STM8_RTC_Set
13098                     ; 2447 					TM_TimeChangeAToB(&stReportTime, &stStar);
13100  193b 96            	ldw	x,sp
13101  193c 1c001c        	addw	x,#OFST-50
13102  193f 89            	pushw	x
13103  1940 1c001b        	addw	x,#27
13104  1943 cd0000        	call	_TM_TimeChangeAToB
13106  1946 85            	popw	x
13107                     ; 2448 					dwTimeOffset = TM_DiffSecond(&stStar, &stEnd);
13109  1947 96            	ldw	x,sp
13110  1948 1c000f        	addw	x,#OFST-63
13111  194b 89            	pushw	x
13112  194c 1c000d        	addw	x,#13
13113  194f cd0000        	call	_TM_DiffSecond
13115  1952 85            	popw	x
13116  1953 96            	ldw	x,sp
13117  1954 1c0017        	addw	x,#OFST-55
13118  1957 cd0000        	call	c_rtol
13120                     ; 2449 					if((-3600 >= dwTimeOffset)||(3600 <= dwTimeOffset))
13122  195a 96            	ldw	x,sp
13123  195b 1c0017        	addw	x,#OFST-55
13124  195e cd0000        	call	c_ltor
13126  1961 ae04b3        	ldw	x,#L6221
13127  1964 cd0000        	call	c_lcmp
13129  1967 2f0f          	jrslt	L1116
13131  1969 96            	ldw	x,sp
13132  196a 1c0017        	addw	x,#OFST-55
13133  196d cd0000        	call	c_ltor
13135  1970 ae04b7        	ldw	x,#L0321
13136  1973 cd0000        	call	c_lcmp
13138  1976 2f2a          	jrslt	L7016
13139  1978               L1116:
13140                     ; 2452 						ALM_SetAlmStatus(RTC_ERROR);
13142  1978 a608          	ld	a,#8
13143  197a cd0000        	call	_ALM_SetAlmStatus
13145                     ; 2453 						stRepFail.wError |= (1<<RTC_TIMEERROR);
13147  197d 721e0007      	bset	_stRepFail+7,#7
13148                     ; 2454 						MemcpyFunc((u8*)&stRepFail.stTime, (u8*)&stReportTime, sizeof(stRepFail.stTime));
13150  1981 4b06          	push	#6
13151  1983 96            	ldw	x,sp
13152  1984 1c0038        	addw	x,#OFST-22
13153  1987 89            	pushw	x
13154  1988 ae0000        	ldw	x,#_stRepFail
13155  198b cd0000        	call	_MemcpyFunc
13157  198e 5b03          	addw	sp,#3
13158                     ; 2455 						stRepFail.nSigal = 0xFF; 		//信号大小,固定值
13160  1990 35ff0008      	mov	_stRepFail+8,#255
13161                     ; 2456 						AddAlmRecord((u8*)&stRepFail, sizeof(stRepFail));
13163  1994 4b09          	push	#9
13164  1996 ae0000        	ldw	x,#_stRepFail
13165  1999 cd0000        	call	_AddAlmRecord
13167  199c 84            	pop	a
13169  199d               L3116:
13170                     ; 2462 					ClearRxBuff();
13172  199d cd0000        	call	_ClearRxBuff
13174                     ; 2463 					break;
13176  19a0 2025          	jra	L5706
13177  19a2               L7016:
13178                     ; 2460 						ALM_ClrAlmStatus(RTC_ERROR);
13180  19a2 a608          	ld	a,#8
13181  19a4 cd0000        	call	_ALM_ClrAlmStatus
13183  19a7 20f4          	jra	L3116
13184  19a9               L5715:
13185                     ; 2465 				case 2:
13185                     ; 2466 					//进入登录模式
13185                     ; 2467 					SetLogonMode(UP_LOGIN);
13187  19a9 cd0033        	call	_SetLogonMode
13189                     ; 2468 					break;
13191  19ac 2019          	jra	L5706
13192  19ae               L7715:
13193                     ; 2470 				case 4:
13193                     ; 2471 					g_dwCommDelay = 0;
13195  19ae 5f            	clrw	x
13196  19af cf00b1        	ldw	_g_dwCommDelay+2,x
13197  19b2 cf00af        	ldw	_g_dwCommDelay,x
13198                     ; 2472 					if(UP_HEARTBEAT == ucLogonMode)
13200  19b5 c600d0        	ld	a,_ucLogonMode
13201  19b8 4a            	dec	a
13202  19b9 260c          	jrne	L5706
13203                     ; 2474 						bNeedReport = FALSE;
13205  19bb c70019        	ld	_tyGSMFlag,a
13206                     ; 2475 						if(0 == stOptValve.nOptFlg)
13208  19be 725d0001      	tnz	_stOptValve+1
13209  19c2 2603          	jrne	L5706
13210                     ; 2477 							g_OptValveRepFlg = FALSE;
13212  19c4 c700ae        	ld	_g_OptValveRepFlg,a
13213  19c7               L5706:
13214                     ; 2485 		TermReportReplyPro(temp.Long, tyProtol130.Packet.Buf);
13216  19c7 ae0032        	ldw	x,#_tyProtol130+12
13217  19ca 89            	pushw	x
13218  19cb 1e4f          	ldw	x,(OFST+1,sp)
13219  19cd 89            	pushw	x
13220  19ce 1e4f          	ldw	x,(OFST+1,sp)
13221  19d0 89            	pushw	x
13222  19d1 cd1356        	call	_TermReportReplyPro
13224  19d4 5b06          	addw	sp,#6
13225                     ; 2486 		break;
13227  19d6 cc21d4        	jra	L3706
13228  19d9               L1025:
13229                     ; 2488 	case 0x01:			//数据初始化
13229                     ; 2489 		switch (temp.Long)
13231  19d9 96            	ldw	x,sp
13232  19da 1c004b        	addw	x,#OFST-3
13233  19dd cd0000        	call	c_ltor
13236  19e0 ae04bb        	ldw	x,#L1216
13237  19e3 cd0000        	call	c_jltab
13238  19e6               L3025:
13239                     ; 2491 		case 0x00000100:
13239                     ; 2492 		case 0x00000200:
13239                     ; 2493 		case 0x00000300:
13239                     ; 2494 			temp.Long = CONFIRM_MARK;
13244  19e6 ae0100        	ldw	x,#256
13245                     ; 2495 			break;
13247  19e9 2038          	jra	L7216
13248  19eb               L5025:
13249                     ; 2496 		default:
13249                     ; 2497 			temp.Long = DENY_MARK;
13250                     ; 2498 			break;
13252                     ; 2500 		tyProtol130.Packet.Afn = 0x00;
13253                     ; 2501 		tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
13254                     ; 2502 		tyProtol130.Packet.Data[1] = temp.Bytes.B1;
13255                     ; 2503 		tyProtol130.Packet.Data[2] = temp.Bytes.B2;
13256                     ; 2504 		tyProtol130.Packet.Data[3] = temp.Bytes.B3;
13257                     ; 2505 		nSendLen = 12;
13258                     ; 2506 		break;
13260  19eb 2033          	jp	L5125
13261  19ed               L7025:
13262                     ; 2508 	case 0x04:
13262                     ; 2509 		switch (temp.Long)
13264  19ed 96            	ldw	x,sp
13265  19ee 1c004b        	addw	x,#OFST-3
13266  19f1 cd0000        	call	c_ltor
13269  19f4 ae04d1        	ldw	x,#L5216
13270  19f7 cd0000        	call	c_jltab
13271  19fa               L1125:
13272                     ; 2511 		case 0x000080f8:		//设置集中器地址
13272                     ; 2512 			MemcpyFunc( (u8 *)&g_dwTmAddress, (u8 *)&tyProtol130.Packet.Buf[0], sizeof(g_dwTmAddress) ); //(u8 *)tyParameter.Address本机地址 edit by maronglang 
13274  19fa 4b04          	push	#4
13275  19fc ae0032        	ldw	x,#_tyProtol130+12
13276  19ff 89            	pushw	x
13277  1a00 ae00c5        	ldw	x,#_g_dwTmAddress
13278  1a03 cd0000        	call	_MemcpyFunc
13280  1a06 5b03          	addw	sp,#3
13281                     ; 2513 			MemcpyFunc(tyProtol130.Packet.Address, (u8 *)&g_dwTmAddress, sizeof(tyProtol130.Packet.Address));
13283  1a08 cd21e2        	call	LC051
13284                     ; 2514 			SaveParameterForType((u8*)&g_dwTmAddress, sizeof(g_dwTmAddress), TM_ADDRESS_PRAA);
13286  1a0b cd21fd        	call	LC053
13287                     ; 2515 			temp.Long = CONFIRM_MARK;
13288                     ; 2516 			break;
13290  1a0e 20d6          	jp	L3025
13291  1a10               L3125:
13292                     ; 2518 		case 0x000002fa:		//设置WWW参数
13292                     ; 2519 			MemcpyFunc( (u8 *)tyReportParameter.Main_Port, (u8 *)&tyProtol130.Packet.Buf, sizeof(tyReportParameter.Main_Port) );  	//服务器端口
13294  1a10 4b02          	push	#2
13295  1a12 ae0032        	ldw	x,#_tyProtol130+12
13296  1a15 89            	pushw	x
13297  1a16 ce0022        	ldw	x,_tyReportParameter+8
13298  1a19 cd0000        	call	_MemcpyFunc
13300  1a1c 5b03          	addw	sp,#3
13301                     ; 2520 			temp.Long = CONFIRM_MARK;
13303                     ; 2521 			break;
13305  1a1e 20c6          	jp	L3025
13306  1a20               L5125:
13307                     ; 2522 		default:
13307                     ; 2523 			temp.Long = DENY_MARK;
13312  1a20 ae0200        	ldw	x,#512
13313                     ; 2524 			break;
13315  1a23               L7216:
13316  1a23 1f4d          	ldw	(OFST-1,sp),x
13317  1a25 5f            	clrw	x
13318  1a26 1f4b          	ldw	(OFST-3,sp),x
13319                     ; 2526 		tyProtol130.Packet.Afn = 0;
13321  1a28               LC046:
13325  1a28 725f002c      	clr	_tyProtol130+6
13326                     ; 2527 		tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
13327                     ; 2528 		tyProtol130.Packet.Data[1] = temp.Bytes.B1;
13328                     ; 2529 		tyProtol130.Packet.Data[2] = temp.Bytes.B2;
13329                     ; 2530 		tyProtol130.Packet.Data[3] = temp.Bytes.B3;
13330                     ; 2531 		nSendLen = 12;
13331                     ; 2532 		break;
13333  1a2c cc21bc        	jp	LC042
13334  1a2f               L7125:
13335                     ; 2533 	case 0x0a:
13335                     ; 2534 		switch (temp.Long)
13337  1a2f 96            	ldw	x,sp
13338  1a30 1c004b        	addw	x,#OFST-3
13339  1a33 cd0000        	call	c_ltor
13342  1a36 ae04e1        	ldw	x,#L1316
13343  1a39 cd0000        	call	c_jltab
13344  1a3c               L1225:
13345                     ; 2536 		case 0x000080f8:		//读取集中器地址
13345                     ; 2537 			f = 1;
13347  1a3c a601          	ld	a,#1
13348  1a3e 6b49          	ld	(OFST-5,sp),a
13349                     ; 2538 			MemcpyFunc( (u8 *)&tyProtol130.Packet.Buf, (u8 *)&g_dwTmAddress, sizeof(g_dwTmAddress) );//(u8 *)tyParameter.Address本机地址 edit by maronglang20180822
13351  1a40 4b04          	push	#4
13352  1a42 ae00c5        	ldw	x,#_g_dwTmAddress
13353  1a45 89            	pushw	x
13354  1a46 ae0032        	ldw	x,#_tyProtol130+12
13355  1a49 cd0000        	call	_MemcpyFunc
13357  1a4c 5b03          	addw	sp,#3
13358                     ; 2539 			nSendLen = 12 + sizeof(g_dwTmAddress);
13360  1a4e a610          	ld	a,#16
13361                     ; 2540 			break;
13363  1a50 200a          	jp	LC030
13364  1a52               L3225:
13365                     ; 2546 		case 0x000040fa:		//未知
13365                     ; 2547 			f = 1;
13367  1a52 a601          	ld	a,#1
13368  1a54 6b49          	ld	(OFST-5,sp),a
13369                     ; 2548 			tyProtol130.Packet.Buf[0] = 0xcb;
13371  1a56 35cb0032      	mov	_tyProtol130+12,#203
13372                     ; 2549 			nSendLen = 13;
13374  1a5a a60d          	ld	a,#13
13375  1a5c               LC030:
13376  1a5c 6b4a          	ld	(OFST-4,sp),a
13377                     ; 2550 			break;
13379  1a5e               L3316:
13380                     ; 2552 		if (f == 0)		//失败
13382                     ; 2554 			tyProtol130.Packet.Afn = 0;
13386  1a5e 7b49          	ld	a,(OFST-5,sp)
13387  1a60 2703cc21d4    	jrne	L3706
13389                     ; 2555 			temp.Long = DENY_MARK;
13390                     ; 2556 			tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
13391                     ; 2557 			tyProtol130.Packet.Data[1] = temp.Bytes.B1;
13392                     ; 2558 			tyProtol130.Packet.Data[2] = temp.Bytes.B2;
13393                     ; 2559 			tyProtol130.Packet.Data[3] = temp.Bytes.B3;
13394                     ; 2560 			nSendLen = 12;
13395  1a65 cc21b1        	jp	L5335
13396  1a68               L5225:
13397                     ; 2564 	case 0x84:
13397                     ; 2565 		f = 1;
13399  1a68 4c            	inc	a
13400  1a69 6b49          	ld	(OFST-5,sp),a
13401                     ; 2566 		switch (temp.Long)
13403  1a6b 96            	ldw	x,sp
13404  1a6c 1c004b        	addw	x,#OFST-3
13405  1a6f cd0000        	call	c_ltor
13408  1a72 ae04f9        	ldw	x,#L7316
13409  1a75 cd0000        	call	c_jltab
13410  1a78               L7225:
13411                     ; 2568 		case 0x00004000:		//设置GPRS参数
13411                     ; 2569 			MemcpyFunc( (u8 *)&tyReportParameter, (u8 *)&tyProtol130.Packet.Buf[1], 4);	                //主站地址
13413  1a78 4b04          	push	#4
13414  1a7a ae0033        	ldw	x,#_tyProtol130+13
13415  1a7d 89            	pushw	x
13416  1a7e ae001a        	ldw	x,#_tyReportParameter
13417  1a81 cd0000        	call	_MemcpyFunc
13419  1a84 5b03          	addw	sp,#3
13420                     ; 2570 			MemcpyFunc( (u8 *)&tyReportParameter.Main_Port, (u8 *)&tyProtol130.Packet.Buf[5], 2);		//主端口
13422  1a86 4b02          	push	#2
13423  1a88 ae0037        	ldw	x,#_tyProtol130+17
13424  1a8b 89            	pushw	x
13425  1a8c ae0022        	ldw	x,#_tyReportParameter+8
13426  1a8f cd0000        	call	_MemcpyFunc
13428  1a92 5b03          	addw	sp,#3
13429                     ; 2571 			MemcpyFunc( (u8 *)&tyReportParameter.Sub_IP, (u8 *)&tyProtol130.Packet.Buf[7], 4);		    //备用主站地址
13431  1a94 4b04          	push	#4
13432  1a96 ae0039        	ldw	x,#_tyProtol130+19
13433  1a99 89            	pushw	x
13434  1a9a ae001e        	ldw	x,#_tyReportParameter+4
13435  1a9d cd0000        	call	_MemcpyFunc
13437  1aa0 5b03          	addw	sp,#3
13438                     ; 2572 			MemcpyFunc( (u8 *)&tyReportParameter.Sub_Port, (u8 *)&tyProtol130.Packet.Buf[11], 2);		//备用端口
13440  1aa2 4b02          	push	#2
13441  1aa4 ae003d        	ldw	x,#_tyProtol130+23
13442  1aa7 89            	pushw	x
13443  1aa8 ae0024        	ldw	x,#_tyReportParameter+10
13444  1aab cd0000        	call	_MemcpyFunc
13446  1aae 5b03          	addw	sp,#3
13447                     ; 2575 			SaveParameterForType((u8 *)&tyReportParameter, sizeof(tyReportParameter), IPANDPORT_PARA);
13449  1ab0 4b01          	push	#1
13450  1ab2 4b0c          	push	#12
13451  1ab4 ae001a        	ldw	x,#_tyReportParameter
13452  1ab7 cd0000        	call	_SaveParameterForType
13454  1aba 85            	popw	x
13455                     ; 2576 			SaveParameterForType((u8 *)&tyProtol130.Packet.Buf[25], APN_LEN, APN_PARA);
13457  1abb 4b02          	push	#2
13458  1abd 4b10          	push	#16
13459  1abf ae004b        	ldw	x,#_tyProtol130+37
13460  1ac2 cd0000        	call	_SaveParameterForType
13462  1ac5 85            	popw	x
13463                     ; 2577 			break;
13465  1ac6 cc1c62        	jra	L1416
13466  1ac9               L1325:
13467                     ; 2579 		case 0x01012003:			//设置定时上报时间和周期
13467                     ; 2580 			MemcpyFunc( (u8 *)&tyReport.cycle, (u8 *)tyProtol130.Packet.Buf, sizeof(tyReport)-3 );		//tyTimerReport
13469  1ac9 4b08          	push	#8
13470  1acb ae0032        	ldw	x,#_tyProtol130+12
13471  1ace 89            	pushw	x
13472  1acf ae00c4        	ldw	x,#_tyReport+3
13473  1ad2 cd0000        	call	_MemcpyFunc
13475  1ad5 5b03          	addw	sp,#3
13476                     ; 2582 			tyReport.Time.Byte.Second = 0;
13478  1ad7 725f00c5      	clr	_tyReport+4
13479                     ; 2584 			MemcpyFunc((u8*)&stReportTime, (u8*)&tyReport.Time, sizeof(tyReport.Time));
13481  1adb 4b06          	push	#6
13482  1add ae00c5        	ldw	x,#_tyReport+4
13483  1ae0 89            	pushw	x
13484  1ae1 96            	ldw	x,sp
13485  1ae2 1c003a        	addw	x,#OFST-20
13486  1ae5 cd0000        	call	_MemcpyFunc
13488  1ae8 5b03          	addw	sp,#3
13489                     ; 2585 			JX_BL_Change(6, (u8*)&stReportTime);
13491  1aea 96            	ldw	x,sp
13492  1aeb 1c0037        	addw	x,#OFST-23
13493  1aee 89            	pushw	x
13494  1aef ae0006        	ldw	x,#6
13495  1af2 cd0000        	call	_JX_BL_Change
13497  1af5 85            	popw	x
13498                     ; 2586 			stReportTime.nMonth = stReportTime.nMonth&0x1F;
13500  1af6 7b38          	ld	a,(OFST-22,sp)
13501  1af8 a41f          	and	a,#31
13502  1afa 6b38          	ld	(OFST-22,sp),a
13503                     ; 2587 			TM_TimeChangeAToB(&stReportTime,&stLastReportT);
13505  1afc ae000a        	ldw	x,#_stLastReportT
13506  1aff 89            	pushw	x
13507  1b00 96            	ldw	x,sp
13508  1b01 1c0039        	addw	x,#OFST-21
13509  1b04 cd0000        	call	_TM_TimeChangeAToB
13511  1b07 85            	popw	x
13512                     ; 2588 			if(FALSE == TM_IsValidTimePro(&stLastReportT))
13514  1b08 ae000a        	ldw	x,#_stLastReportT
13515  1b0b cd0000        	call	_TM_IsValidTimePro
13517  1b0e 4d            	tnz	a
13518                     ; 2590 				f = 0;
13519                     ; 2591 				break;
13521  1b0f 2603cc1be4    	jreq	LC031
13522                     ; 2594 			TM_RTimeDecnMinute(&stLastReportT, (u32)(ClaReportTimeToSec(tyReport.cycle)/60));
13524  1b14 c600c4        	ld	a,_tyReport+3
13525  1b17 cd003a        	call	_ClaReportTimeToSec
13527  1b1a ae04f1        	ldw	x,#L4131
13528  1b1d cd0000        	call	c_ludv
13530  1b20 be02          	ldw	x,c_lreg+2
13531  1b22 89            	pushw	x
13532  1b23 be00          	ldw	x,c_lreg
13533  1b25 89            	pushw	x
13534  1b26 ae000a        	ldw	x,#_stLastReportT
13535  1b29 cd0000        	call	_TM_RTimeDecnMinute
13537  1b2c 5b04          	addw	sp,#4
13538                     ; 2596 			TM_TimeChangeAToB(&stTimeNow,&stStar);			
13540  1b2e 96            	ldw	x,sp
13541  1b2f 1c001c        	addw	x,#OFST-50
13542  1b32 89            	pushw	x
13543  1b33 ae0012        	ldw	x,#_stTimeNow
13544  1b36 cd0000        	call	_TM_TimeChangeAToB
13546  1b39 85            	popw	x
13547                     ; 2597 			stLastReportT.nMinute = ((g_dwTmAddress+TM_CalPastedSeconds(&stStar))%REPORT_RANDOM_MIN); //上报时间分钟值做随机
13549  1b3a 96            	ldw	x,sp
13550  1b3b 1c001c        	addw	x,#OFST-50
13551  1b3e cd0000        	call	_TM_CalPastedSeconds
13553  1b41 ae00c5        	ldw	x,#_g_dwTmAddress
13554  1b44 cd0000        	call	c_ladd
13556  1b47 ae04f5        	ldw	x,#L2231
13557  1b4a cd0000        	call	c_lumd
13559  1b4d b603          	ld	a,c_lreg+3
13560                     ; 2598 			stLastReportT.nMinute = ((stLastReportT.nMinute == 0)?1:(stLastReportT.nMinute));/* 去除与抄表间隔同一时刻 00 分 */
13562  1b4f 2601          	jrne	L4231
13563  1b51 4c            	inc	a
13564  1b52               L4231:
13565  1b52 c7000f        	ld	_stLastReportT+5,a
13566                     ; 2600 			MemcpyFunc(nBuf, (u8 *)&stLastReportT,sizeof(stLastReportT));			
13568  1b55 4b08          	push	#8
13569  1b57 ae000a        	ldw	x,#_stLastReportT
13570  1b5a 89            	pushw	x
13571  1b5b 96            	ldw	x,sp
13572  1b5c 1c0041        	addw	x,#OFST-13
13573  1b5f cd0000        	call	_MemcpyFunc
13575  1b62 5b03          	addw	sp,#3
13576                     ; 2601 			MemcpyFunc(&nBuf[8], (u8 *)&g_wTmReportCnt, 2);
13578  1b64 4b02          	push	#2
13579  1b66 ae00ab        	ldw	x,#_g_wTmReportCnt
13580  1b69 89            	pushw	x
13581  1b6a 96            	ldw	x,sp
13582  1b6b 1c0049        	addw	x,#OFST-5
13583  1b6e cd0000        	call	_MemcpyFunc
13585  1b71 5b03          	addw	sp,#3
13586                     ; 2602 			SaveParameterForType(nBuf, 10, LT_REP_TIME); 
13588  1b73 4b05          	push	#5
13589  1b75 4b0a          	push	#10
13590  1b77 96            	ldw	x,sp
13591  1b78 1c0040        	addw	x,#OFST-14
13592  1b7b cd0000        	call	_SaveParameterForType
13594  1b7e 85            	popw	x
13595                     ; 2605 			SaveParameterForType((u8 *)&tyReport, sizeof(tyReport), REPORT_PARA);
13597  1b7f cd2209        	call	LC054
13598                     ; 2606 			break;
13600  1b82 cc1c62        	jra	L1416
13601  1b85               L3325:
13602                     ; 2608 		case 0x00008040:			//设置采集周期
13602                     ; 2609 			MemcpyFunc( (u8 *)&tyReport.wGatherCycle, (u8 *)tyProtol130.Packet.Buf, 2);		//tyTimerReport
13604  1b85 4b02          	push	#2
13605  1b87 ae0032        	ldw	x,#_tyProtol130+12
13606  1b8a 89            	pushw	x
13607  1b8b ae00c1        	ldw	x,#_tyReport
13608  1b8e cd0000        	call	_MemcpyFunc
13610  1b91 5b03          	addw	sp,#3
13611                     ; 2610 			JX_BL_Change(2, (u8 *)&tyReport.wGatherCycle);
13613  1b93 ae00c1        	ldw	x,#_tyReport
13614  1b96 cd21d9        	call	LC050
13615                     ; 2613 			SaveParameterForType((u8 *)&tyReport, sizeof(tyReport), REPORT_PARA);
13617  1b99 cd2209        	call	LC054
13618                     ; 2614 			break;
13620  1b9c cc1c62        	jra	L1416
13621  1b9f               L5325:
13622                     ; 2616 		case 0x00008051:			//设置越限告警参数
13622                     ; 2617 			tyParameter.wBasePress = JX_BcdToDWORD(tyProtol130.Packet.Buf, 4);
13624  1b9f 4b04          	push	#4
13625  1ba1 ae0032        	ldw	x,#_tyProtol130+12
13626  1ba4 cd0000        	call	_JX_BcdToDWORD
13628  1ba7 ae0010        	ldw	x,#_tyParameter+16
13629  1baa 84            	pop	a
13630  1bab cd0000        	call	c_rtol
13632                     ; 2618 			tyParameter.nUpLmtRate = tyProtol130.Packet.Buf[5];
13634  1bae 5500370018    	mov	_tyParameter+24,_tyProtol130+17
13635                     ; 2619 			tyParameter.nDownLmtRate = tyProtol130.Packet.Buf[6];
13637  1bb3 5500380019    	mov	_tyParameter+25,_tyProtol130+18
13638                     ; 2622 			SaveParameterForType((u8 *)&tyParameter, sizeof(tyParameter), METER_PARA);
13640  1bb8 cd21f1        	call	LC052
13641                     ; 2623 			break;
13643  1bbb cc1c62        	jra	L1416
13644  1bbe               L7325:
13645                     ; 2625 		case 0x00008053:			//设置告警屏蔽字
13645                     ; 2626 			MemcpyFunc( tyParameter.nAlmCtl, (u8 *)tyProtol130.Packet.Buf, 4);		//tyTimerReport
13647  1bbe 4b04          	push	#4
13648  1bc0 ae0032        	ldw	x,#_tyProtol130+12
13649  1bc3 89            	pushw	x
13650  1bc4 ae0014        	ldw	x,#_tyParameter+20
13651  1bc7 cd0000        	call	_MemcpyFunc
13653  1bca 5b03          	addw	sp,#3
13654                     ; 2627 			SaveParameterForType((u8 *)&tyParameter, sizeof(tyParameter), METER_PARA);
13656  1bcc cd21f1        	call	LC052
13657                     ; 2628 			break;
13659  1bcf cc1c62        	jra	L1416
13660  1bd2               L1425:
13661                     ; 2630 		case 0x00004003:			//设置上报停止 设置上报允许
13661                     ; 2631 			tyReport.enable = tyProtol130.Packet.Buf[0];    //设置自动上报停止= 0XAA, 设置上报允许=0X55
13663  1bd2 55003200c3    	mov	_tyReport+2,_tyProtol130+12
13664                     ; 2632 			break;
13666  1bd7 cc1c62        	jra	L1416
13667                     ; 2633 		case 0x00000401:			//未知
13667                     ; 2634 			break;
13669  1bda               L5425:
13670                     ; 2635 		case 0x0000010B:				//地址自设置
13670                     ; 2636 #ifndef  PTROTO_JASON
13670                     ; 2637 			if(FALSE == CJ_T188ProtocolReadAdd(nBuf))
13672  1bda 96            	ldw	x,sp
13673  1bdb 1c003e        	addw	x,#OFST-16
13674  1bde cd0000        	call	_CJ_T188ProtocolReadAdd
13676  1be1 4d            	tnz	a
13677  1be2 2604          	jrne	L5416
13678                     ; 2639 				f = 0;
13680  1be4               LC031:
13682  1be4 6b49          	ld	(OFST-5,sp),a
13684  1be6 207a          	jra	L1416
13685  1be8               L5416:
13686                     ; 2643 				JX_BL_Change(5, nBuf);
13688  1be8 96            	ldw	x,sp
13689  1be9 1c003e        	addw	x,#OFST-16
13690  1bec 89            	pushw	x
13691  1bed ae0005        	ldw	x,#5
13692  1bf0 cd0000        	call	_JX_BL_Change
13694  1bf3 85            	popw	x
13695                     ; 2644 				JX_HexToASCII(nBuf, nApnBuf, 5);
13697  1bf4 ae0005        	ldw	x,#5
13698  1bf7 89            	pushw	x
13699  1bf8 96            	ldw	x,sp
13700  1bf9 1c0026        	addw	x,#OFST-40
13701  1bfc 89            	pushw	x
13702  1bfd 1c001a        	addw	x,#26
13703  1c00 cd0000        	call	_JX_HexToASCII
13705  1c03 5b04          	addw	sp,#4
13706                     ; 2645 				nApnBuf[10] = 0;
13708  1c05 0f2e          	clr	(OFST-32,sp)
13709                     ; 2646 				wAddrLow	= JX_BcdStrTo16BitBin(&nApnBuf[5], 5);
13711  1c07 4b05          	push	#5
13712  1c09 96            	ldw	x,sp
13713  1c0a 1c002a        	addw	x,#OFST-36
13714  1c0d cd0000        	call	_JX_BcdStrTo16BitBin
13716  1c10 84            	pop	a
13717  1c11 1f0b          	ldw	(OFST-67,sp),x
13718                     ; 2647 				nApnBuf[5]	= 0;
13720  1c13 0f29          	clr	(OFST-37,sp)
13721                     ; 2648 				wAddrHigh	= JX_BcdStrTo16BitBcd(&nApnBuf[1], 4);
13723  1c15 4b04          	push	#4
13724  1c17 96            	ldw	x,sp
13725  1c18 1c0026        	addw	x,#OFST-40
13726  1c1b cd0000        	call	_JX_BcdStrTo16BitBcd
13728  1c1e 84            	pop	a
13729  1c1f 1f0d          	ldw	(OFST-65,sp),x
13730                     ; 2649 				MemcpyFunc(nBuf, (u8*)&wAddrHigh, 2);
13732  1c21 4b02          	push	#2
13733  1c23 96            	ldw	x,sp
13734  1c24 1c000e        	addw	x,#OFST-64
13735  1c27 89            	pushw	x
13736  1c28 1c0031        	addw	x,#49
13737  1c2b cd0000        	call	_MemcpyFunc
13739  1c2e 5b03          	addw	sp,#3
13740                     ; 2650 				MemcpyFunc(&nBuf[2], (u8*)&wAddrLow, 2);
13742  1c30 4b02          	push	#2
13743  1c32 96            	ldw	x,sp
13744  1c33 1c000c        	addw	x,#OFST-66
13745  1c36 89            	pushw	x
13746  1c37 1c0035        	addw	x,#53
13747  1c3a cd0000        	call	_MemcpyFunc
13749  1c3d 5b03          	addw	sp,#3
13750                     ; 2651 				JX_BL_Change(2, nBuf);
13752  1c3f 96            	ldw	x,sp
13753  1c40 1c003e        	addw	x,#OFST-16
13754  1c43 cd21d9        	call	LC050
13755                     ; 2652 				JX_BL_Change(2, &nBuf[2]);
13757  1c46 96            	ldw	x,sp
13758  1c47 1c0040        	addw	x,#OFST-14
13759  1c4a cd21d9        	call	LC050
13760                     ; 2653 				MemcpyFunc((u8 *)&g_dwTmAddress, nBuf, 4);
13762  1c4d 4b04          	push	#4
13763  1c4f 96            	ldw	x,sp
13764  1c50 1c003f        	addw	x,#OFST-15
13765  1c53 89            	pushw	x
13766  1c54 ae00c5        	ldw	x,#_g_dwTmAddress
13767  1c57 cd0000        	call	_MemcpyFunc
13769  1c5a 5b03          	addw	sp,#3
13770                     ; 2654 				SaveParameterForType((u8*)&g_dwTmAddress, sizeof(g_dwTmAddress), TM_ADDRESS_PRAA);
13772  1c5c cd21fd        	call	LC053
13773                     ; 2655 				MemcpyFunc(tyProtol130.Packet.Address, (u8 *)&g_dwTmAddress, sizeof(tyProtol130.Packet.Address));
13775  1c5f cd21e2        	call	LC051
13776  1c62               L1416:
13777                     ; 2681 		if (f)
13779  1c62 7b49          	ld	a,(OFST-5,sp)
13780  1c64 2603cc1a20    	jreq	L5125
13781                     ; 2683 			temp.Long = CONFIRM_MARK;
13783  1c69 cc19e6        	jp	L3025
13784                     ; 2687 			temp.Long = DENY_MARK;
13785                     ; 2689 		tyProtol130.Packet.Afn = 0;
13786                     ; 2690 		tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
13787                     ; 2691 		tyProtol130.Packet.Data[1] = temp.Bytes.B1;
13788                     ; 2692 		tyProtol130.Packet.Data[2] = temp.Bytes.B2;
13789                     ; 2693 		tyProtol130.Packet.Data[3] = temp.Bytes.B3;
13790                     ; 2694 		nSendLen = 12;
13791                     ; 2695 		break;
13793  1c6c               L7425:
13794                     ; 2697 	case 0x8a:
13794                     ; 2698 		tyProtol130.Packet.Control = 0x88;
13796  1c6c 35880026      	mov	_tyProtol130,#136
13797                     ; 2699 		switch (temp.Long)
13799  1c70 96            	ldw	x,sp
13800  1c71 1c004b        	addw	x,#OFST-3
13801  1c74 cd0000        	call	c_ltor
13804  1c77 ae0527        	ldw	x,#L5516
13805  1c7a cd0000        	call	c_jltab
13806  1c7d               L1525:
13807                     ; 2701 		case 0x00004000:		//读GPRS参数
13807                     ; 2702 			f = 1;
13809  1c7d a601          	ld	a,#1
13810  1c7f 6b49          	ld	(OFST-5,sp),a
13811                     ; 2703 			MemsetFunc(nApnBuf, 0, sizeof(nApnBuf));
13813  1c81 4b12          	push	#18
13814  1c83 4b00          	push	#0
13815  1c85 96            	ldw	x,sp
13816  1c86 1c0026        	addw	x,#OFST-40
13817  1c89 cd0000        	call	_MemsetFunc
13819  1c8c 85            	popw	x
13820                     ; 2704 			ReadParameterForType(nApnBuf, APN_LEN, APN_PARA);
13822  1c8d 4b02          	push	#2
13823  1c8f 4b10          	push	#16
13824  1c91 96            	ldw	x,sp
13825  1c92 1c0026        	addw	x,#OFST-40
13826  1c95 cd0000        	call	_ReadParameterForType
13828  1c98 35020032      	mov	_tyProtol130+12,#2
13829  1c9c 85            	popw	x
13830                     ; 2705 			tyProtol130.Packet.Buf[0] = 2;									//通道类型
13832                     ; 2706 			MemcpyFunc(&tyProtol130.Packet.Buf[1], (u8 *)&tyReportParameter, 4);               //主站地址
13834  1c9d 4b04          	push	#4
13835  1c9f ae001a        	ldw	x,#_tyReportParameter
13836  1ca2 89            	pushw	x
13837  1ca3 ae0033        	ldw	x,#_tyProtol130+13
13838  1ca6 cd0000        	call	_MemcpyFunc
13840  1ca9 5b03          	addw	sp,#3
13841                     ; 2707 			MemcpyFunc(&tyProtol130.Packet.Buf[5],  (u8 *)&tyReportParameter.Main_Port, 2);		//主端口
13843  1cab 4b02          	push	#2
13844  1cad ae0022        	ldw	x,#_tyReportParameter+8
13845  1cb0 89            	pushw	x
13846  1cb1 ae0037        	ldw	x,#_tyProtol130+17
13847  1cb4 cd0000        	call	_MemcpyFunc
13849  1cb7 5b03          	addw	sp,#3
13850                     ; 2708 			MemcpyFunc( (u8 *)&tyProtol130.Packet.Buf[7], (u8 *)&tyReportParameter.Sub_IP, 4);		    //备用主站地址
13852  1cb9 4b04          	push	#4
13853  1cbb ae001e        	ldw	x,#_tyReportParameter+4
13854  1cbe 89            	pushw	x
13855  1cbf ae0039        	ldw	x,#_tyProtol130+19
13856  1cc2 cd0000        	call	_MemcpyFunc
13858  1cc5 5b03          	addw	sp,#3
13859                     ; 2709 			MemcpyFunc( (u8 *)&tyProtol130.Packet.Buf[11], (u8 *)&tyReportParameter.Sub_Port, 2);		//备用端口
13861  1cc7 4b02          	push	#2
13862  1cc9 ae0024        	ldw	x,#_tyReportParameter+10
13863  1ccc 89            	pushw	x
13864  1ccd ae003d        	ldw	x,#_tyProtol130+23
13865  1cd0 cd0000        	call	_MemcpyFunc
13867  1cd3 5b03          	addw	sp,#3
13868                     ; 2710 			MemsetFunc((u8 *)&tyProtol130.Packet.Buf[13], 0x00,44);
13870  1cd5 4b2c          	push	#44
13871  1cd7 4b00          	push	#0
13872  1cd9 ae003f        	ldw	x,#_tyProtol130+25
13873  1cdc cd0000        	call	_MemsetFunc
13875  1cdf 85            	popw	x
13876                     ; 2711 			MemcpyFunc((u8 *)&tyProtol130.Packet.Buf[25], nApnBuf, 16);			
13878  1ce0 4b10          	push	#16
13879  1ce2 96            	ldw	x,sp
13880  1ce3 1c0025        	addw	x,#OFST-41
13881  1ce6 89            	pushw	x
13882  1ce7 ae004b        	ldw	x,#_tyProtol130+37
13883  1cea cd0000        	call	_MemcpyFunc
13885  1ced 5b03          	addw	sp,#3
13886                     ; 2712 			nSendLen = 12 + 57;
13888  1cef a645          	ld	a,#69
13889                     ; 2713 			break;
13891  1cf1 cc1dc1        	jp	LC032
13892  1cf4               L3525:
13893                     ; 2714 		case 0x01012003:		//读上报时间
13893                     ; 2715 			f = 1;
13895  1cf4 a601          	ld	a,#1
13896  1cf6 6b49          	ld	(OFST-5,sp),a
13897                     ; 2716 			tyProtol130.Packet.Buf[7] = 1;				//标识个数
13899  1cf8 35010039      	mov	_tyProtol130+19,#1
13900                     ; 2717 			tyProtol130.Packet.Buf[8] = 0;				//数据单元标识 00 00 01 07
13902  1cfc 725f003a      	clr	_tyProtol130+20
13903                     ; 2718 			tyProtol130.Packet.Buf[9] = 0;
13905  1d00 725f003b      	clr	_tyProtol130+21
13906                     ; 2719 			tyProtol130.Packet.Buf[10] = 1;
13908  1d04 3501003c      	mov	_tyProtol130+22,#1
13909                     ; 2720 			tyProtol130.Packet.Buf[11] = 7;
13911  1d08 3507003d      	mov	_tyProtol130+23,#7
13912                     ; 2721 			tyProtol130.Packet.Buf[12] = 1;				//表数量M  0001
13914  1d0c 3501003e      	mov	_tyProtol130+24,#1
13915                     ; 2722 			tyProtol130.Packet.Buf[13] = 0;
13917  1d10 725f003f      	clr	_tyProtol130+25
13918                     ; 2723 			tyProtol130.Packet.Buf[14] = m_nGmTn_1;				//表序号  0001
13920  1d14 5500c10040    	mov	_tyProtol130+26,_m_nGmTn_1
13921                     ; 2724 			tyProtol130.Packet.Buf[15] = m_nGmTn_2;
13923  1d19 5500c20041    	mov	_tyProtol130+27,_m_nGmTn_2
13924                     ; 2725 			MemcpyFunc( (u8 *)&tyProtol130.Packet.Buf, (u8 *)&tyReport.cycle, sizeof(tyReport.Time)+1);
13926  1d1e 4b07          	push	#7
13927  1d20 ae00c4        	ldw	x,#_tyReport+3
13928  1d23 89            	pushw	x
13929  1d24 ae0032        	ldw	x,#_tyProtol130+12
13930  1d27 cd0000        	call	_MemcpyFunc
13932  1d2a 5b03          	addw	sp,#3
13933                     ; 2726 			nSendLen = 28;
13935  1d2c a61c          	ld	a,#28
13936                     ; 2727 			break;
13938  1d2e cc1dc1        	jp	LC032
13939  1d31               L5525:
13940                     ; 2728 		case 0x00004003:							//读取定时上报开启位
13940                     ; 2729 			f = 1;
13942  1d31 a601          	ld	a,#1
13943  1d33 6b49          	ld	(OFST-5,sp),a
13944                     ; 2730 			tyProtol130.Packet.Afn = 0;
13946  1d35 725f002c      	clr	_tyProtol130+6
13947                     ; 2731 			temp.Long = 0x01014003;
13949  1d39 ae4003        	ldw	x,#16387
13950  1d3c 1f4d          	ldw	(OFST-1,sp),x
13951  1d3e ae0101        	ldw	x,#257
13952  1d41 1f4b          	ldw	(OFST-3,sp),x
13953                     ; 2732 			tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
13955  1d43 7b4b          	ld	a,(OFST-3,sp)
13956  1d45 c7002e        	ld	_tyProtol130+8,a
13957                     ; 2733 			tyProtol130.Packet.Data[1] = temp.Bytes.B1;
13959  1d48 7b4c          	ld	a,(OFST-2,sp)
13960  1d4a c7002f        	ld	_tyProtol130+9,a
13961                     ; 2734 			tyProtol130.Packet.Data[2] = temp.Bytes.B2;
13963  1d4d 7b4d          	ld	a,(OFST-1,sp)
13964  1d4f c70030        	ld	_tyProtol130+10,a
13965                     ; 2735 			tyProtol130.Packet.Data[3] = temp.Bytes.B3;
13967  1d52 7b4e          	ld	a,(OFST+0,sp)
13968  1d54 c70031        	ld	_tyProtol130+11,a
13969                     ; 2736 			tyProtol130.Packet.Buf[0] = tyReport.enable;
13971  1d57 5500c30032    	mov	_tyProtol130+12,_tyReport+2
13972                     ; 2737 			nSendLen = 13;
13974  1d5c a60d          	ld	a,#13
13975                     ; 2738 			break;
13977  1d5e 2061          	jp	LC032
13978  1d60               L7525:
13979                     ; 2740 		case 0x00008052:			//读取越限告警参数
13979                     ; 2741 			f = 1;
13981  1d60 a601          	ld	a,#1
13982  1d62 6b49          	ld	(OFST-5,sp),a
13983                     ; 2742 			tyProtol130.Packet.Buf[5] = tyParameter.nUpLmtRate;
13985  1d64 5500180037    	mov	_tyProtol130+17,_tyParameter+24
13986                     ; 2743 			tyProtol130.Packet.Buf[6] = tyParameter.nDownLmtRate;
13988  1d69 5500190038    	mov	_tyProtol130+18,_tyParameter+25
13989                     ; 2744 			tyProtol130.Packet.Buf[7] = 0x00;
13991  1d6e 725f0039      	clr	_tyProtol130+19
13992                     ; 2745 			tyProtol130.Packet.Control = 0x88;
13994  1d72 35880026      	mov	_tyProtol130,#136
13995                     ; 2746 			tyProtol130.Packet.Afn = 0x8A;			
13997  1d76 358a002c      	mov	_tyProtol130+6,#138
13998                     ; 2747 			nBuf[4] = 0x03;
14000  1d7a a603          	ld	a,#3
14001  1d7c 6b42          	ld	(OFST-12,sp),a
14002                     ; 2748 			JX_DWORDToBCD((u32)tyParameter.wBasePress, nBuf, 4); 
14004  1d7e 4b04          	push	#4
14005  1d80 96            	ldw	x,sp
14006  1d81 1c003f        	addw	x,#OFST-15
14007  1d84 89            	pushw	x
14008  1d85 ce0012        	ldw	x,_tyParameter+18
14009  1d88 89            	pushw	x
14010  1d89 ce0010        	ldw	x,_tyParameter+16
14011  1d8c 89            	pushw	x
14012  1d8d cd0000        	call	_JX_DWORDToBCD
14014  1d90 5b07          	addw	sp,#7
14015                     ; 2749 			MemcpyFunc(tyProtol130.Packet.Buf, nBuf, 5);	
14017  1d92 4b05          	push	#5
14018  1d94 96            	ldw	x,sp
14019  1d95 1c003f        	addw	x,#OFST-15
14020  1d98 89            	pushw	x
14021  1d99 ae0032        	ldw	x,#_tyProtol130+12
14022  1d9c cd0000        	call	_MemcpyFunc
14024  1d9f 5b03          	addw	sp,#3
14025                     ; 2750 			nSendLen = 12 + 8;
14027  1da1 a614          	ld	a,#20
14028                     ; 2751 			break;
14030  1da3 201c          	jp	LC032
14031  1da5               L1625:
14032                     ; 2752 		case 0x00008054:			//读取告警屏蔽字
14032                     ; 2753 			f = 1;
14034  1da5 a601          	ld	a,#1
14035  1da7 6b49          	ld	(OFST-5,sp),a
14036                     ; 2754 			tyProtol130.Packet.Control = 0x88;
14038  1da9 35880026      	mov	_tyProtol130,#136
14039                     ; 2755 			tyProtol130.Packet.Afn = 0x8A;			
14041  1dad 358a002c      	mov	_tyProtol130+6,#138
14042                     ; 2756 			MemcpyFunc(tyProtol130.Packet.Buf,tyParameter.nAlmCtl, 4);		//tyTimerReport
14044  1db1 4b04          	push	#4
14045  1db3 ae0014        	ldw	x,#_tyParameter+20
14046  1db6 89            	pushw	x
14047  1db7 ae0032        	ldw	x,#_tyProtol130+12
14048  1dba cd0000        	call	_MemcpyFunc
14050  1dbd 5b03          	addw	sp,#3
14051                     ; 2757 			nSendLen = 12 + 4;
14053  1dbf a610          	ld	a,#16
14054  1dc1               LC032:
14055  1dc1 6b4a          	ld	(OFST-4,sp),a
14056                     ; 2758 			break;
14058  1dc3               L7516:
14059                     ; 2761 		if (f == 0)
14060                     ; 2763 			tyProtol130.Packet.Afn = 0;
14061                     ; 2764 			temp.Long = DENY_MARK;
14062                     ; 2765 			tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
14063                     ; 2766 			tyProtol130.Packet.Data[1] = temp.Bytes.B1;
14064                     ; 2767 			tyProtol130.Packet.Data[2] = temp.Bytes.B2;
14065                     ; 2768 			tyProtol130.Packet.Data[3] = temp.Bytes.B3;
14066                     ; 2769 			nSendLen = 12;
14067  1dc3 cc1a5e        	jp	L3316
14068  1dc6               L3625:
14069                     ; 2772 	case 0x8c:
14069                     ; 2773 		switch (temp.Long)
14071  1dc6 96            	ldw	x,sp
14072  1dc7 1c004b        	addw	x,#OFST-3
14073  1dca cd0000        	call	c_ltor
14076  1dcd ae0549        	ldw	x,#L3616
14077  1dd0 cd0000        	call	c_jltab
14078  1dd3               L5625:
14079                     ; 2775 		case 0x00000101:		        //读取软硬件版本
14079                     ; 2776 			f = 1;
14081  1dd3 a601          	ld	a,#1
14082  1dd5 6b49          	ld	(OFST-5,sp),a
14083                     ; 2777 			MemcpyFunc( (u8 *)&tyProtol130.Packet.Buf, m_nVerBuf, 16);			
14085  1dd7 4b10          	push	#16
14086  1dd9 ae0447        	ldw	x,#_m_nVerBuf
14087  1ddc 89            	pushw	x
14088  1ddd ae0032        	ldw	x,#_tyProtol130+12
14089  1de0 cd0000        	call	_MemcpyFunc
14091  1de3 5b03          	addw	sp,#3
14092                     ; 2778 			nSendLen = 12 + 16;
14094  1de5 a61c          	ld	a,#28
14095                     ; 2779 			break;
14097  1de7 cc20d9        	jp	LC036
14098  1dea               L7625:
14099                     ; 2780 		case 0x0000010D:		    //读取协议版本
14099                     ; 2781 			f = 1;
14101  1dea a601          	ld	a,#1
14102  1dec 6b49          	ld	(OFST-5,sp),a
14103                     ; 2782 			MemcpyFunc( (u8 *)&tyProtol130.Packet.Buf, m_nPtrcoVerBuf, 8);			
14105  1dee 4b08          	push	#8
14106  1df0 ae0457        	ldw	x,#_m_nPtrcoVerBuf
14107  1df3 89            	pushw	x
14108  1df4 ae0032        	ldw	x,#_tyProtol130+12
14109  1df7 cd0000        	call	_MemcpyFunc
14111  1dfa 5b03          	addw	sp,#3
14112                     ; 2783 			nSendLen = 12 + 8;
14114  1dfc a614          	ld	a,#20
14115                     ; 2784 			break;
14117  1dfe cc20d9        	jp	LC036
14118  1e01               L1725:
14119                     ; 2786 		case 0x00000100:				//读取时钟
14119                     ; 2787 			f = 1;
14121  1e01 a601          	ld	a,#1
14122  1e03 6b49          	ld	(OFST-5,sp),a
14123                     ; 2788 			STM8_RTC_Get(&stTimeNow);
14125  1e05 ae0012        	ldw	x,#_stTimeNow
14126  1e08 cd0000        	call	_STM8_RTC_Get
14128                     ; 2789 			MemcpyFunc( (u8 *)&tyProtol130.Packet.Buf, (u8 *)&stTimeNow, 6);
14130  1e0b 4b06          	push	#6
14131  1e0d ae0012        	ldw	x,#_stTimeNow
14132  1e10 89            	pushw	x
14133  1e11 ae0032        	ldw	x,#_tyProtol130+12
14134  1e14 cd0000        	call	_MemcpyFunc
14136  1e17 5b03          	addw	sp,#3
14137                     ; 2790 			JX_BL_Change(6, tyProtol130.Packet.Buf);
14139  1e19 ae0032        	ldw	x,#_tyProtol130+12
14140  1e1c 89            	pushw	x
14141  1e1d ae0006        	ldw	x,#6
14142  1e20 cd0000        	call	_JX_BL_Change
14144  1e23 a612          	ld	a,#18
14145                     ; 2791 			nSendLen = 12 + 6;
14146                     ; 2792 			break;
14148  1e25 cc20d8        	jp	LC037
14149  1e28               L3725:
14150                     ; 2793 		case 0x00000107:				//抄读单表 0x00000107
14150                     ; 2794 		case 0x20000107:
14150                     ; 2795 			f = 1;
14152  1e28 a601          	ld	a,#1
14153  1e2a 6b49          	ld	(OFST-5,sp),a
14154                     ; 2796 			if(1 == tyProtol130.Packet.Buf[1])
14156  1e2c c60033        	ld	a,_tyProtol130+13
14157  1e2f 4a            	dec	a
14158  1e30 2691          	jrne	L3316
14159                     ; 2798 				if(FALSE == GatherMeterFun())
14161  1e32 cd0000        	call	_GatherMeterFun
14163  1e35 4d            	tnz	a
14164  1e36 2628          	jrne	L1716
14165                     ; 2800 					if(GetTmDebugModeStat())
14167  1e38 cd0000        	call	_GetTmDebugModeStat
14169  1e3b 4d            	tnz	a
14170                     ; 2802 						tyParameter.Value = INVALID_DATA;
14172  1e3c 2619          	jrne	L7716
14173                     ; 2806 						if(TRUE == ReadRecord(0, (u8*)&tyRecord, sizeof(tyRecord)))
14175  1e3e 4b10          	push	#16
14176  1e40 ae0000        	ldw	x,#_tyRecord
14177  1e43 89            	pushw	x
14178  1e44 cd0000        	call	_ReadRecord
14180  1e47 5b03          	addw	sp,#3
14181  1e49 4a            	dec	a
14182  1e4a 260b          	jrne	L7716
14183                     ; 2808 							tyParameter.Value = tyRecord.Value;
14185  1e4c ce0008        	ldw	x,_tyRecord+8
14186  1e4f cf0004        	ldw	_tyParameter+4,x
14187  1e52 ce0006        	ldw	x,_tyRecord+6
14189  1e55 2006          	jp	LC033
14190  1e57               L7716:
14191                     ; 2812 							tyParameter.Value = INVALID_DATA;
14194  1e57 aeeeee        	ldw	x,#61166
14195  1e5a cf0004        	ldw	_tyParameter+4,x
14196  1e5d               LC033:
14197  1e5d cf0002        	ldw	_tyParameter+2,x
14198  1e60               L1716:
14199                     ; 2817 				tyProtol130.Packet.Control = 0x88;
14201  1e60 35880026      	mov	_tyProtol130,#136
14202                     ; 2818 				tyProtol130.Packet.Afn = 0x8C;
14204  1e64 358c002c      	mov	_tyProtol130+6,#140
14205                     ; 2819 				tyProtol130.Packet.Buf[0] = 0x01;
14207  1e68 35010032      	mov	_tyProtol130+12,#1
14208                     ; 2820 				tyProtol130.Packet.Buf[1] = 0x00;				
14210  1e6c 725f0033      	clr	_tyProtol130+13
14211                     ; 2821 				tyProtol130.Packet.Buf[2] = m_nGmTn_1;
14213  1e70 5500c10034    	mov	_tyProtol130+14,_m_nGmTn_1
14214                     ; 2822 				tyProtol130.Packet.Buf[3] = m_nGmTn_2;
14216  1e75 5500c20035    	mov	_tyProtol130+15,_m_nGmTn_2
14217                     ; 2823 				MemcpyFunc((u8*)&tyProtol130.Packet.Buf[4], (u8*)&tyParameter.Value, 4);
14219  1e7a 4b04          	push	#4
14220  1e7c ae0002        	ldw	x,#_tyParameter+2
14221  1e7f 89            	pushw	x
14222  1e80 ae0036        	ldw	x,#_tyProtol130+16
14223  1e83 cd0000        	call	_MemcpyFunc
14225  1e86 5b03          	addw	sp,#3
14226                     ; 2824 				JX_BL_Change(4, &tyProtol130.Packet.Buf[4]);
14228  1e88 ae0036        	ldw	x,#_tyProtol130+16
14229  1e8b 89            	pushw	x
14230  1e8c ae0004        	ldw	x,#4
14231  1e8f cd0000        	call	_JX_BL_Change
14233  1e92 c60000        	ld	a,_g_nValveStat
14234  1e95 a101          	cp	a,#1
14235  1e97 85            	popw	x
14236                     ; 2826 				if(VALVE_CLOSE == g_nValveStat)
14238  1e98 2609          	jrne	L3026
14239                     ; 2828 					if(MASTER_OLD == m_nMasterType)
14241  1e9a c600c0        	ld	a,_m_nMasterType
14242  1e9d 2610          	jrne	L7026
14243                     ; 2830 						nVavleStat = VALVE_CLOSE_UP;
14245  1e9f a608          	ld	a,#8
14246  1ea1 200a          	jp	LC035
14247  1ea3               L3026:
14248                     ; 2833 				else if(VALVE_ERROR == g_nValveStat)
14250  1ea3 a103          	cp	a,#3
14251  1ea5 2608          	jrne	L7026
14252                     ; 2835 					if(MASTER_OLD == m_nMasterType)
14254  1ea7 c600c0        	ld	a,_m_nMasterType
14255  1eaa 2603          	jrne	L7026
14256                     ; 2837 						nVavleStat = VALVE_ERROR_UP;
14258  1eac 4a            	dec	a
14259  1ead               LC035:
14260  1ead 6b1b          	ld	(OFST-51,sp),a
14261  1eaf               L7026:
14262                     ; 2843 				tyProtol130.Packet.Buf[8] = nVavleStat;
14264  1eaf 7b1b          	ld	a,(OFST-51,sp)
14265  1eb1 c7003a        	ld	_tyProtol130+20,a
14266                     ; 2844 				nSendLen = 12 + 9;
14268  1eb4               LC038:
14270  1eb4 a615          	ld	a,#21
14271  1eb6 cc20d9        	jp	LC036
14272  1eb9               L5725:
14273                     ; 2847 		case 0x00000108:				//读取集中器电池电压 0x00000108 16字节
14273                     ; 2848 			f = 1;
14275  1eb9 a601          	ld	a,#1
14276  1ebb 6b49          	ld	(OFST-5,sp),a
14277                     ; 2849 			wBatVol = BAT_GetBatVol();	
14279  1ebd cd0000        	call	_BAT_GetBatVol
14281  1ec0 1f09          	ldw	(OFST-69,sp),x
14282                     ; 2850 			if(g_nSignal > 0)
14284  1ec2 c60000        	ld	a,_g_nSignal
14285  1ec5 2704          	jreq	L5126
14286                     ; 2852 				nSig = g_nSignal;
14288  1ec7 6b48          	ld	(OFST-6,sp),a
14290  1ec9 2067          	jra	L7126
14291  1ecb               L5126:
14292                     ; 2856 				TurnBusUartOn();
14294  1ecb cd0000        	call	_TurnBusUartOn
14296                     ; 2857 				SetPortGsmResetDisable();
14298  1ece 4b00          	push	#0
14299  1ed0 4b40          	push	#64
14300  1ed2 ae5005        	ldw	x,#20485
14301  1ed5 cd0000        	call	_GPIO_WriteBit
14303  1ed8 85            	popw	x
14304                     ; 2858 				SetPortGsmPowerOn();		   //供电
14306  1ed9 4b01          	push	#1
14307  1edb 4b10          	push	#16
14308  1edd ae500a        	ldw	x,#20490
14309  1ee0 cd0000        	call	_GPIO_WriteBit
14311  1ee3 85            	popw	x
14312                     ; 2859 				SetPortSoftSwitchOn();
14314  1ee4 4b01          	push	#1
14315  1ee6 4b20          	push	#32
14316  1ee8 ae5005        	ldw	x,#20485
14317  1eeb cd0000        	call	_GPIO_WriteBit
14319  1eee 85            	popw	x
14320                     ; 2860 				UC_SleepFunc(2200);
14322  1eef ae0898        	ldw	x,#2200
14323  1ef2 89            	pushw	x
14324  1ef3 5f            	clrw	x
14325  1ef4 89            	pushw	x
14326  1ef5 cd0760        	call	_UC_SleepFunc
14328  1ef8 5b04          	addw	sp,#4
14329                     ; 2861 				SetPortSoftSwitchOff();
14331  1efa 4b00          	push	#0
14332  1efc 4b20          	push	#32
14333  1efe ae5005        	ldw	x,#20485
14334  1f01 cd0000        	call	_GPIO_WriteBit
14336  1f04 85            	popw	x
14337                     ; 2862 				nCnt = 0;
14339  1f05 0f36          	clr	(OFST-24,sp)
14340  1f07               L1226:
14341                     ; 2865 					UC_SleepFunc(GETSIGNAL_TO); 
14343  1f07 ae0fa0        	ldw	x,#4000
14344  1f0a 89            	pushw	x
14345  1f0b 5f            	clrw	x
14346  1f0c 89            	pushw	x
14347  1f0d cd0760        	call	_UC_SleepFunc
14349  1f10 5b04          	addw	sp,#4
14350                     ; 2866 					nSig = SIMGL868_UpdateSignal();
14352  1f12 cd0d05        	call	_SIMGL868_UpdateSignal
14354  1f15 6b48          	ld	(OFST-6,sp),a
14355                     ; 2867 					tyProtol130.Packet.Buf[14] = SIMGetRegisterStat();
14357  1f17 cd0cd1        	call	_SIMGetRegisterStat
14359  1f1a c70040        	ld	_tyProtol130+26,a
14360                     ; 2868 				}while((MODE_GETSIGNAL_CNT > nCnt++)&&((25>nSig)||
14360                     ; 2869 				(SIM_REG_FAILURE == tyProtol130.Packet.Buf[14])));
14362  1f1d 7b36          	ld	a,(OFST-24,sp)
14363  1f1f 0c36          	inc	(OFST-24,sp)
14364  1f21 a106          	cp	a,#6
14365  1f23 240d          	jruge	L7126
14367  1f25 7b48          	ld	a,(OFST-6,sp)
14368  1f27 a119          	cp	a,#25
14369  1f29 25dc          	jrult	L1226
14371  1f2b c60040        	ld	a,_tyProtol130+26
14372  1f2e a102          	cp	a,#2
14373  1f30 27d5          	jreq	L1226
14374  1f32               L7126:
14375                     ; 2872 			tyProtol130.Packet.Control = 0x88;
14377  1f32 35880026      	mov	_tyProtol130,#136
14378                     ; 2873 			tyProtol130.Packet.Afn = 0x8C;
14380  1f36 358c002c      	mov	_tyProtol130+6,#140
14381                     ; 2874 			MemcpyFunc(tyProtol130.Packet.Buf, (u8*)&wBatVol, 2);
14383  1f3a 4b02          	push	#2
14384  1f3c 96            	ldw	x,sp
14385  1f3d 1c000a        	addw	x,#OFST-68
14386  1f40 89            	pushw	x
14387  1f41 ae0032        	ldw	x,#_tyProtol130+12
14388  1f44 cd0000        	call	_MemcpyFunc
14390  1f47 5b03          	addw	sp,#3
14391                     ; 2875 			MemcpyFunc(&tyProtol130.Packet.Buf[2], (u8*)&g_dwBatNoLoadVol, 2);
14393  1f49 4b02          	push	#2
14394  1f4b ae0000        	ldw	x,#_g_dwBatNoLoadVol
14395  1f4e 89            	pushw	x
14396  1f4f ae0034        	ldw	x,#_tyProtol130+14
14397  1f52 cd0000        	call	_MemcpyFunc
14399  1f55 5b03          	addw	sp,#3
14400                     ; 2876 			MemcpyFunc(&tyProtol130.Packet.Buf[4], (u8*)&g_wTmReportCnt, 2);
14402  1f57 4b02          	push	#2
14403  1f59 ae00ab        	ldw	x,#_g_wTmReportCnt
14404  1f5c 89            	pushw	x
14405  1f5d ae0036        	ldw	x,#_tyProtol130+16
14406  1f60 cd0000        	call	_MemcpyFunc
14408  1f63 5b03          	addw	sp,#3
14409                     ; 2877 			TM_TimeChangeBToA(&stLastReportT, &stReportTime);
14411  1f65 96            	ldw	x,sp
14412  1f66 1c0037        	addw	x,#OFST-23
14413  1f69 89            	pushw	x
14414  1f6a ae000a        	ldw	x,#_stLastReportT
14415  1f6d cd0000        	call	_TM_TimeChangeBToA
14417  1f70 85            	popw	x
14418                     ; 2878 			MemcpyFunc(&tyProtol130.Packet.Buf[6], (u8*)&stReportTime, 6);
14420  1f71 4b06          	push	#6
14421  1f73 96            	ldw	x,sp
14422  1f74 1c0038        	addw	x,#OFST-22
14423  1f77 89            	pushw	x
14424  1f78 ae0038        	ldw	x,#_tyProtol130+18
14425  1f7b cd0000        	call	_MemcpyFunc
14427  1f7e 5b03          	addw	sp,#3
14428                     ; 2879 			tyProtol130.Packet.Buf[12] = ALM_GetBatStatus();
14430  1f80 cd0000        	call	_ALM_GetBatStatus
14432  1f83 c7003e        	ld	_tyProtol130+24,a
14433                     ; 2880 			tyProtol130.Packet.Buf[13] = JX_ByteToBcd(nSig);			//信号大小,固定值
14435  1f86 7b48          	ld	a,(OFST-6,sp)
14436  1f88 cd0000        	call	_JX_ByteToBcd
14438  1f8b c7003f        	ld	_tyProtol130+25,a
14439                     ; 2885 			JX_BL_Change(2, tyProtol130.Packet.Buf);
14441  1f8e ae0032        	ldw	x,#_tyProtol130+12
14442  1f91 cd21d9        	call	LC050
14443                     ; 2886 			JX_BL_Change(2, &tyProtol130.Packet.Buf[2]);
14445  1f94 ae0034        	ldw	x,#_tyProtol130+14
14446  1f97 cd21d9        	call	LC050
14447                     ; 2887 			JX_BL_Change(2, &tyProtol130.Packet.Buf[4]);
14449  1f9a ae0036        	ldw	x,#_tyProtol130+16
14450  1f9d 89            	pushw	x
14451  1f9e ae0002        	ldw	x,#2
14452  1fa1 cd0000        	call	_JX_BL_Change
14454  1fa4 a61c          	ld	a,#28
14455                     ; 2888 			nSendLen = 12 + 16;
14456                     ; 2889 			break;
14458  1fa6 cc20d8        	jp	LC037
14459  1fa9               L7725:
14460                     ; 2891 		case 0x00000109:				//读取终端CCID号
14460                     ; 2892 			f = 1;
14462  1fa9 a601          	ld	a,#1
14463  1fab 6b49          	ld	(OFST-5,sp),a
14464                     ; 2893 			GetIsmiCcidDat();			
14466  1fad cd029e        	call	_GetIsmiCcidDat
14468                     ; 2894 			tyProtol130.Packet.Control = 0x88;
14470  1fb0 35880026      	mov	_tyProtol130,#136
14471                     ; 2895 			tyProtol130.Packet.Afn = 0x8C;
14473  1fb4 358c002c      	mov	_tyProtol130+6,#140
14474                     ; 2896 			MemcpyFunc(tyProtol130.Packet.Buf, m_nCcidBuf, 24);	
14476  1fb8 4b18          	push	#24
14477  1fba ae006d        	ldw	x,#_m_nCcidBuf
14478  1fbd 89            	pushw	x
14479  1fbe ae0032        	ldw	x,#_tyProtol130+12
14480  1fc1 cd0000        	call	_MemcpyFunc
14482  1fc4 5b03          	addw	sp,#3
14483                     ; 2897 			MemcpyFunc(&tyProtol130.Packet.Buf[24], m_nImsiBuf, 24);	
14485  1fc6 4b18          	push	#24
14486  1fc8 ae0085        	ldw	x,#_m_nImsiBuf
14487  1fcb 89            	pushw	x
14488  1fcc ae004a        	ldw	x,#_tyProtol130+36
14489  1fcf cd0000        	call	_MemcpyFunc
14491  1fd2 5b03          	addw	sp,#3
14492                     ; 2898 			nSendLen = 12 + 48;
14494  1fd4 a63c          	ld	a,#60
14495                     ; 2899 			break;
14497  1fd6 cc20d9        	jp	LC036
14498  1fd9               L1035:
14499                     ; 2901 		case 0x0000010A:				//设置终端进入低功耗
14499                     ; 2902 			f = 1;
14501  1fd9 a601          	ld	a,#1
14502  1fdb 6b49          	ld	(OFST-5,sp),a
14503                     ; 2903 			LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
14505  1fdd 4f            	clr	a
14506  1fde cd0000        	call	_LP_SetLowPwrStartFlg
14508                     ; 2904 			LP_SetLowPwrStartFlg(LP_GPRS_FLG_OK);
14510  1fe1 a601          	ld	a,#1
14511  1fe3 cd0000        	call	_LP_SetLowPwrStartFlg
14513                     ; 2905 			tyProtol130.Packet.Afn = 0;
14515  1fe6 725f002c      	clr	_tyProtol130+6
14516                     ; 2906 			temp.Long = CONFIRM_MARK;
14518  1fea ae0100        	ldw	x,#256
14519  1fed 1f4d          	ldw	(OFST-1,sp),x
14520  1fef 5f            	clrw	x
14521  1ff0 1f4b          	ldw	(OFST-3,sp),x
14522                     ; 2907 			tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
14524  1ff2 7b4b          	ld	a,(OFST-3,sp)
14525  1ff4 c7002e        	ld	_tyProtol130+8,a
14526                     ; 2908 			tyProtol130.Packet.Data[1] = temp.Bytes.B1;
14528  1ff7 7b4c          	ld	a,(OFST-2,sp)
14529  1ff9 c7002f        	ld	_tyProtol130+9,a
14530                     ; 2909 			tyProtol130.Packet.Data[2] = temp.Bytes.B2;
14532  1ffc 7b4d          	ld	a,(OFST-1,sp)
14533  1ffe c70030        	ld	_tyProtol130+10,a
14534                     ; 2910 			tyProtol130.Packet.Data[3] = temp.Bytes.B3;
14536  2001 7b4e          	ld	a,(OFST+0,sp)
14537  2003 c70031        	ld	_tyProtol130+11,a
14538                     ; 2911 			nSendLen = 12;
14540  2006 a60c          	ld	a,#12
14541                     ; 2912 			break;
14543  2008 cc20d9        	jp	LC036
14544  200b               L3035:
14545                     ; 2914 		case 0x0000010E:				//设置终端进入维护模式
14545                     ; 2915 			f = 1;
14547  200b a601          	ld	a,#1
14548  200d 6b49          	ld	(OFST-5,sp),a
14549                     ; 2916 			SetTmDebugModeStat(DEBUG_MODE);
14551  200f cd0000        	call	_SetTmDebugModeStat
14553                     ; 2917 			tyProtol130.Packet.Afn = 0;
14555  2012 725f002c      	clr	_tyProtol130+6
14556                     ; 2918 			temp.Long = CONFIRM_MARK;
14558  2016 ae0100        	ldw	x,#256
14559  2019 1f4d          	ldw	(OFST-1,sp),x
14560  201b 5f            	clrw	x
14561  201c 1f4b          	ldw	(OFST-3,sp),x
14562                     ; 2919 			tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
14564  201e 7b4b          	ld	a,(OFST-3,sp)
14565  2020 c7002e        	ld	_tyProtol130+8,a
14566                     ; 2920 			tyProtol130.Packet.Data[1] = temp.Bytes.B1;
14568  2023 7b4c          	ld	a,(OFST-2,sp)
14569  2025 c7002f        	ld	_tyProtol130+9,a
14570                     ; 2921 			tyProtol130.Packet.Data[2] = temp.Bytes.B2;
14572  2028 7b4d          	ld	a,(OFST-1,sp)
14573  202a c70030        	ld	_tyProtol130+10,a
14574                     ; 2922 			tyProtol130.Packet.Data[3] = temp.Bytes.B3;
14576  202d 7b4e          	ld	a,(OFST+0,sp)
14577  202f c70031        	ld	_tyProtol130+11,a
14578                     ; 2923 			nSendLen = 12;
14580  2032 a60c          	ld	a,#12
14581                     ; 2924 			break;	
14583  2034 cc20d9        	jp	LC036
14584  2037               L5035:
14585                     ; 2926 		case 0x00000114:				//读取压力值
14585                     ; 2927 			f = 1;
14587  2037 a601          	ld	a,#1
14588  2039 6b49          	ld	(OFST-5,sp),a
14589                     ; 2928 			tyProtol130.Packet.Buf[0] = 0x01;
14591  203b 35010032      	mov	_tyProtol130+12,#1
14592                     ; 2929 			tyProtol130.Packet.Buf[1] = 0x00;
14594  203f 725f0033      	clr	_tyProtol130+13
14595                     ; 2930 			tyProtol130.Packet.Buf[2] = 0x01;
14597  2043 35010034      	mov	_tyProtol130+14,#1
14598                     ; 2931 			tyProtol130.Packet.Buf[3] = 0x01;
14600  2047 35010035      	mov	_tyProtol130+15,#1
14601                     ; 2932 			tyProtol130.Packet.Control = 0x88;
14603  204b 35880026      	mov	_tyProtol130,#136
14604                     ; 2933 			tyProtol130.Packet.Afn = 0x8C;			
14606  204f 358c002c      	mov	_tyProtol130+6,#140
14607                     ; 2934 			nBuf[4] = 0x03;
14609  2053 a603          	ld	a,#3
14610  2055 6b42          	ld	(OFST-12,sp),a
14611                     ; 2935 			tyRecord.wPressure = MODBUS_GetPizeometer(READ_CMD);	
14613  2057 4f            	clr	a
14614  2058 cd0000        	call	_MODBUS_GetPizeometer
14616  205b ae000a        	ldw	x,#_tyRecord+10
14617  205e cd0000        	call	c_rtol
14619                     ; 2936 			JX_DWORDToBCD((u32)tyRecord.wPressure, nBuf, 4); 
14621  2061 4b04          	push	#4
14622  2063 96            	ldw	x,sp
14623  2064 1c003f        	addw	x,#OFST-15
14624  2067 89            	pushw	x
14625  2068 ce000c        	ldw	x,_tyRecord+12
14626  206b 89            	pushw	x
14627  206c ce000a        	ldw	x,_tyRecord+10
14628  206f 89            	pushw	x
14629  2070 cd0000        	call	_JX_DWORDToBCD
14631  2073 5b07          	addw	sp,#7
14632                     ; 2937 			MemcpyFunc(&tyProtol130.Packet.Buf[4], nBuf, 5);	
14634  2075 4b05          	push	#5
14635  2077 96            	ldw	x,sp
14636  2078 1c003f        	addw	x,#OFST-15
14637  207b 89            	pushw	x
14638  207c ae0036        	ldw	x,#_tyProtol130+16
14639  207f cd0000        	call	_MemcpyFunc
14641  2082 5b03          	addw	sp,#3
14642                     ; 2938 			nSendLen = 12 + 9;
14643                     ; 2939 			break;
14645  2084 cc1eb4        	jp	LC038
14646  2087               L7035:
14647                     ; 2941 		case 0x0000010C:				//读取报警日志信息
14647                     ; 2942 			f = 1;
14649  2087 a601          	ld	a,#1
14650  2089 6b49          	ld	(OFST-5,sp),a
14651                     ; 2943 			tyProtol130.Packet.Control = 0x88;
14653  208b 35880026      	mov	_tyProtol130,#136
14654                     ; 2944 			tyProtol130.Packet.Afn = 0x8C;			
14656  208f 358c002c      	mov	_tyProtol130+6,#140
14657                     ; 2945 			nSendLen = 12 + AlmMakeFrame(tyProtol130.Packet.Buf);		
14659  2093 ae0032        	ldw	x,#_tyProtol130+12
14660  2096 cd0218        	call	_AlmMakeFrame
14662  2099 ab0c          	add	a,#12
14663                     ; 2946 			break;
14665  209b 203c          	jp	LC036
14666  209d               L1135:
14667                     ; 2947 		case 0x0000100C://读取防护按键使能标志
14667                     ; 2948 			f = 1;
14669  209d a601          	ld	a,#1
14670  209f 6b49          	ld	(OFST-5,sp),a
14671                     ; 2949 			tyProtol130.Packet.Control = 0x80;
14673  20a1 35800026      	mov	_tyProtol130,#128
14674                     ; 2950 			tyProtol130.Packet.Afn = 0x8C;	
14676  20a5 358c002c      	mov	_tyProtol130+6,#140
14677                     ; 2951 			tyProtol130.Packet.Buf[0] = g_nGuardEnFlg;
14679  20a9 5500000032    	mov	_tyProtol130+12,_g_nGuardEnFlg
14680                     ; 2952 			nSendLen = 12 + 1;
14682  20ae a60d          	ld	a,#13
14683                     ; 2953 			break;
14685  20b0 2027          	jp	LC036
14686  20b2               L3135:
14687                     ; 2955 		case 0x00008040:			//设置采集周期
14687                     ; 2956 			f = 1;
14689  20b2 a601          	ld	a,#1
14690  20b4 6b49          	ld	(OFST-5,sp),a
14691                     ; 2957 			MemcpyFunc(tyProtol130.Packet.Buf,(u8 *)&tyReport.wGatherCycle, 2); 	//tyTimerReport
14693  20b6 4b02          	push	#2
14694  20b8 ae00c1        	ldw	x,#_tyReport
14695  20bb 89            	pushw	x
14696  20bc ae0032        	ldw	x,#_tyProtol130+12
14697  20bf cd0000        	call	_MemcpyFunc
14699  20c2 5b03          	addw	sp,#3
14700                     ; 2958 			JX_BL_Change(2, tyProtol130.Packet.Buf);
14702  20c4 ae0032        	ldw	x,#_tyProtol130+12
14703  20c7 89            	pushw	x
14704  20c8 ae0002        	ldw	x,#2
14705  20cb cd0000        	call	_JX_BL_Change
14707  20ce 35880026      	mov	_tyProtol130,#136
14708  20d2 358c002c      	mov	_tyProtol130+6,#140
14709  20d6 a60e          	ld	a,#14
14710  20d8               LC037:
14711  20d8 85            	popw	x
14712                     ; 2959 			tyProtol130.Packet.Control = 0x88;
14714                     ; 2960 			tyProtol130.Packet.Afn = 0x8C;
14716                     ; 2961 			nSendLen = 12 + 2;
14718  20d9               LC036:
14721  20d9 6b4a          	ld	(OFST-4,sp),a
14722                     ; 2962 			break;
14724  20db               L5616:
14725                     ; 3030 		if (f == 0) //Q1667
14726                     ; 3032 			tyProtol130.Packet.Afn = 0;
14727                     ; 3033 			temp.Long = DENY_MARK;
14728                     ; 3034 			tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
14729                     ; 3035 			tyProtol130.Packet.Data[1] = temp.Bytes.B1;
14730                     ; 3036 			tyProtol130.Packet.Data[2] = temp.Bytes.B2;
14731                     ; 3037 			tyProtol130.Packet.Data[3] = temp.Bytes.B3;
14732                     ; 3038 			nSendLen = 12;
14733  20db cc1a5e        	jp	L3316
14734  20de               L5135:
14735                     ; 3042 	case 0x85:
14735                     ; 3043 		switch (temp.Long)
14737  20de 96            	ldw	x,sp
14738  20df 1c004b        	addw	x,#OFST-3
14739  20e2 cd0000        	call	c_ltor
14742  20e5 ae059b        	ldw	x,#L3326
14743  20e8 cd0000        	call	c_jltab
14744  20eb               L7135:
14745                     ; 3045 		case 0x00000100:  //关阀0xaa  开阀 = 0x55
14745                     ; 3046 		case 0x20000102:
14745                     ; 3047 			nOptCmd = tyProtol130.Packet.Buf[10];//tyProtol130.Packet.Buf[9] ? tyProtol130.Packet.Buf[16] : tyProtol130.Packet.Buf[10];
14747  20eb c6003c        	ld	a,_tyProtol130+22
14748  20ee 6b4a          	ld	(OFST-4,sp),a
14749                     ; 3048 			if (nOptCmd == 0xaa || nOptCmd == 0x55)	//拉闸当前表0xaa  合闸当前表 = 0x55
14751  20f0 a1aa          	cp	a,#170
14752  20f2 2704          	jreq	L3426
14754  20f4 a155          	cp	a,#85
14755  20f6 261b          	jrne	L7326
14756  20f8               L3426:
14757                     ; 3051 					if(nOptCmd == 0xaa)
14759  20f8 7b4a          	ld	a,(OFST-4,sp)
14760  20fa a1aa          	cp	a,#170
14761  20fc 2604          	jrne	L1526
14762                     ; 3053 						nOptRlt = VavleOperateFun(VALVECLOSE);
14764  20fe a605          	ld	a,#5
14767  2100 2002          	jra	L3526
14768  2102               L1526:
14769                     ; 3060 						nOptRlt = VavleOperateFun(VALVEOPEN);	
14771  2102 a603          	ld	a,#3
14773  2104               L3526:
14774  2104 cd0000        	call	_VavleOperateFun
14775  2107 6b48          	ld	(OFST-6,sp),a
14776                     ; 3065 					h++;
14778  2109 0c36          	inc	(OFST-24,sp)
14779                     ; 3066 				}while((FALSE == nOptRlt)&&(1 > h));
14781  210b 7b48          	ld	a,(OFST-6,sp)
14782  210d 2604          	jrne	L7326
14784  210f 7b36          	ld	a,(OFST-24,sp)
14785  2111 27e5          	jreq	L3426
14786  2113               L7326:
14787                     ; 3069 			if(nOptRlt)
14789  2113 7b48          	ld	a,(OFST-6,sp)
14790  2115 2603cc1a20    	jreq	L5125
14791                     ; 3071 				temp.Long = CONFIRM_MARK;
14793  211a cc19e6        	jp	L3025
14794                     ; 3078 				temp.Long    = DENY_MARK;
14795  211d               L1235:
14796                     ; 3082 		case 0x00004523:  /* 定时阀控测试 */
14796                     ; 3083 			stOptValve.nOptFlg = tyProtol130.Packet.Buf[0];
14798  211d 5500320001    	mov	_stOptValve+1,_tyProtol130+12
14799                     ; 3084 			stOptValve.nYear   = tyProtol130.Packet.Buf[1];
14801  2122 5500330002    	mov	_stOptValve+2,_tyProtol130+13
14802                     ; 3085 			stOptValve.nEnableFlg = stOptValve.nOptFlg;
14804  2127 5500010000    	mov	_stOptValve,_stOptValve+1
14805                     ; 3086 			stOptValve.nVavleCycle =  tyProtol130.Packet.Buf[7];
14807  212c 5500390009    	mov	_stOptValve+9,_tyProtol130+19
14808                     ; 3087 			MemcpyFunc(&stOptValve.nMonth, &tyProtol130.Packet.Buf[3], 4);
14810  2131 4b04          	push	#4
14811  2133 ae0035        	ldw	x,#_tyProtol130+15
14812  2136 89            	pushw	x
14813  2137 ae0003        	ldw	x,#_stOptValve+3
14814  213a cd0000        	call	_MemcpyFunc
14816  213d 5b03          	addw	sp,#3
14817                     ; 3088 			SaveParameterForType((u8*)&stOptValve, OPTVALVE_LEN, OPT_VALVE_PRAA);
14819  213f 4b06          	push	#6
14820  2141 4b0a          	push	#10
14821  2143 ae0000        	ldw	x,#_stOptValve
14822  2146 cd0000        	call	_SaveParameterForType
14824  2149 85            	popw	x
14825                     ; 3089 			temp.Long = CONFIRM_MARK;
14826                     ; 3090 			break;
14828  214a               L3235:
14829                     ; 3092 		case 0x00000200:		//未知
14829                     ; 3093 			f = 1;
14831                     ; 3094 			temp.Long = CONFIRM_MARK;
14835                     ; 3095 			break;
14837  214a cc19e6        	jp	L3025
14838  214d               L5235:
14839                     ; 3096 		case 0x00001001://设置时钟 tyTime.Byte.Month 字节高三位星期 低4位为月份0-9，第五位表示10位 12月则表示成0x12再加上当日星期几
14839                     ; 3097 			f = 1;
14841                     ; 3098 			MemcpyFunc( (u8 *)&stTimeNow, (u8 *)&tyProtol130.Packet.Buf, 6);
14843  214d 4b06          	push	#6
14844  214f ae0032        	ldw	x,#_tyProtol130+12
14845  2152 89            	pushw	x
14846  2153 ae0012        	ldw	x,#_stTimeNow
14847  2156 cd0000        	call	_MemcpyFunc
14849  2159 5b03          	addw	sp,#3
14850                     ; 3099 			JX_BL_Change(6, (u8*)&stTimeNow);
14852  215b ae0012        	ldw	x,#_stTimeNow
14853  215e 89            	pushw	x
14854  215f ae0006        	ldw	x,#6
14855  2162 cd0000        	call	_JX_BL_Change
14857  2165 c60013        	ld	a,_stTimeNow+1
14858  2168 a41f          	and	a,#31
14859  216a c70013        	ld	_stTimeNow+1,a
14860  216d 85            	popw	x
14861                     ; 3100 			stTimeNow.nMonth = stTimeNow.nMonth&0x1F;
14863                     ; 3101 			STM8_RTC_Set(&stTimeNow);
14865  216e ae0012        	ldw	x,#_stTimeNow
14866  2171 cd0000        	call	_STM8_RTC_Set
14868                     ; 3102 			temp.Long = CONFIRM_MARK;
14869                     ; 3103 			break;
14871  2174 cc19e6        	jp	L3025
14872  2177               L7235:
14873                     ; 3104 		case 0x00001003://结束任务帧
14873                     ; 3105 			f = 1;
14875                     ; 3106 			temp.Long = CONFIRM_MARK;		
14877  2177 ae0100        	ldw	x,#256
14878  217a 1f4d          	ldw	(OFST-1,sp),x
14879  217c 5f            	clrw	x
14880  217d 1f4b          	ldw	(OFST-3,sp),x
14881                     ; 3108 			if(UP_UPLOAD_PRESSURE == nLogonModeBk)
14883  217f c600cf        	ld	a,_nLogonModeBk
14884  2182 a105          	cp	a,#5
14885  2184 2606          	jrne	L3626
14886                     ; 3110 				BatteryVolRepPro();
14888  2186 cd01db        	call	_BatteryVolRepPro
14891  2189 cc1a28        	jra	LC046
14892  218c               L3626:
14893                     ; 3114 				SetLogonMode(UP_UPLOAD_PRESSURE);
14895  218c a605          	ld	a,#5
14896  218e cd0033        	call	_SetLogonMode
14898  2191 cc1a28        	jra	LC046
14899  2194               L1335:
14900                     ; 3120 		case 0x0000100C://设置防护按键使能标志
14900                     ; 3121 			f = 1;
14902                     ; 3122 			temp.Long = CONFIRM_MARK;			
14904  2194 ae0100        	ldw	x,#256
14905  2197 1f4d          	ldw	(OFST-1,sp),x
14906  2199 5f            	clrw	x
14907  219a 1f4b          	ldw	(OFST-3,sp),x
14908                     ; 3123 			g_nGuardEnFlg = tyProtol130.Packet.Buf[0];
14910  219c 5500320000    	mov	_g_nGuardEnFlg,_tyProtol130+12
14911                     ; 3124 			SaveByte(ADDRESS_GUARD_EN, g_nGuardEnFlg);
14913  21a1 3b0000        	push	_g_nGuardEnFlg
14914  21a4 ae1000        	ldw	x,#4096
14915  21a7 cd0000        	call	_SaveByte
14917  21aa 84            	pop	a
14918                     ; 3125 			break;
14920  21ab cc1a28        	jra	LC046
14921  21ae               L3335:
14922                     ; 3127 		default:
14922                     ; 3128 			temp.Long = DENY_MARK;
14924                     ; 3129 			break;
14926                     ; 3131 		tyProtol130.Packet.Afn = 0;
14927                     ; 3132 		tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
14928                     ; 3133 		tyProtol130.Packet.Data[1] = temp.Bytes.B1;
14929                     ; 3134 		tyProtol130.Packet.Data[2] = temp.Bytes.B2;
14930                     ; 3135 		tyProtol130.Packet.Data[3] = temp.Bytes.B3;
14931                     ; 3136 		nSendLen = 12;
14932                     ; 3137 		break;
14934  21ae cc1a20        	jp	L5125
14935  21b1               L5335:
14936                     ; 3161 			tyProtol130.Packet.Afn = 0;
14937                     ; 3162 			temp.Long = DENY_MARK;
14938                     ; 3163 			tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
14939                     ; 3164 			tyProtol130.Packet.Data[1] = temp.Bytes.B1;
14940                     ; 3165 			tyProtol130.Packet.Data[2] = temp.Bytes.B2;
14941                     ; 3166 			tyProtol130.Packet.Data[3] = temp.Bytes.B3;
14942                     ; 3167 			nSendLen = 12;
14943                     ; 3169 		break;
14945                     ; 3170 	case 0x8e:					//未知
14945                     ; 3171 		tyProtol130.Packet.Afn = 0;
14948                     ; 3172 		temp.Long = DENY_MARK;
14951  21b1 c7002c        	ld	_tyProtol130+6,a
14956  21b4 ae0200        	ldw	x,#512
14957  21b7 1f4d          	ldw	(OFST-1,sp),x
14958  21b9 5f            	clrw	x
14959  21ba 1f4b          	ldw	(OFST-3,sp),x
14960                     ; 3173 		tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
14962                     ; 3174 		tyProtol130.Packet.Data[1] = temp.Bytes.B1;
14964                     ; 3175 		tyProtol130.Packet.Data[2] = temp.Bytes.B2;
14966                     ; 3176 		tyProtol130.Packet.Data[3] = temp.Bytes.B3;
14968                     ; 3177 		nSendLen = 12;
14970  21bc               LC042:
14979  21bc 7b4b          	ld	a,(OFST-3,sp)
14980  21be c7002e        	ld	_tyProtol130+8,a
14989  21c1 7b4c          	ld	a,(OFST-2,sp)
14990  21c3 c7002f        	ld	_tyProtol130+9,a
14999  21c6 7b4d          	ld	a,(OFST-1,sp)
15000  21c8 c70030        	ld	_tyProtol130+10,a
15009  21cb 7b4e          	ld	a,(OFST+0,sp)
15010  21cd c70031        	ld	_tyProtol130+11,a
15019  21d0 a60c          	ld	a,#12
15020  21d2 6b4a          	ld	(OFST-4,sp),a
15021                     ; 3178 		break;
15023  21d4               L3706:
15024                     ; 3180 	return nSendLen;
15026  21d4 7b4a          	ld	a,(OFST-4,sp)
15029  21d6 5b4e          	addw	sp,#78
15030  21d8 81            	ret	
15032  21d9               LC050:
15033  21d9 89            	pushw	x
15034  21da ae0002        	ldw	x,#2
15035  21dd cd0000        	call	_JX_BL_Change
15037  21e0 85            	popw	x
15038  21e1 81            	ret	
15039  21e2               LC051:
15040  21e2 4b04          	push	#4
15041  21e4 ae00c5        	ldw	x,#_g_dwTmAddress
15042  21e7 89            	pushw	x
15043  21e8 ae0027        	ldw	x,#_tyProtol130+1
15044  21eb cd0000        	call	_MemcpyFunc
15046  21ee 5b03          	addw	sp,#3
15047  21f0 81            	ret	
15048  21f1               LC052:
15049  21f1 4b04          	push	#4
15050  21f3 4b1a          	push	#26
15051  21f5 ae0000        	ldw	x,#_tyParameter
15052  21f8 cd0000        	call	_SaveParameterForType
15054  21fb 85            	popw	x
15055  21fc 81            	ret	
15056  21fd               LC053:
15057  21fd 4b07          	push	#7
15058  21ff 4b04          	push	#4
15059  2201 ae00c5        	ldw	x,#_g_dwTmAddress
15060  2204 cd0000        	call	_SaveParameterForType
15062  2207 85            	popw	x
15063  2208 81            	ret	
15064  2209               LC054:
15065  2209 4b03          	push	#3
15066  220b 4b0b          	push	#11
15067  220d ae00c1        	ldw	x,#_tyReport
15068  2210 cd0000        	call	_SaveParameterForType
15070  2213 85            	popw	x
15071  2214 81            	ret	
15073                     	switch	.const
15074  05c9               L7626_nStrBuf:
15075  05c9 00            	dc.b	0
15076  05ca 000000        	ds.b	3
15186                     ; 3188 u8 Online(u8 nLogonMode)
15186                     ; 3189 {
15187                     	switch	.text
15188  2215               _Online:
15190  2215 88            	push	a
15191  2216 5212          	subw	sp,#18
15192       00000012      OFST:	set	18
15195                     ; 3191 	u8 nStrBuf[4] = {0}, nSendLen = 0;
15197  2218 96            	ldw	x,sp
15198  2219 5c            	incw	x
15199  221a 90ae05c9      	ldw	y,#L7626_nStrBuf
15200  221e a604          	ld	a,#4
15201  2220 cd0000        	call	c_xymvx
15205  2223 0f0e          	clr	(OFST-4,sp)
15206                     ; 3192 	u16 wBatVol   = 0;
15208  2225 5f            	clrw	x
15209  2226 1f05          	ldw	(OFST-13,sp),x
15210                     ; 3195 	tyProtol130.Packet.Afn = 2;
15212  2228 3502002c      	mov	_tyProtol130+6,#2
15213                     ; 3196 	tyProtol130.Packet.Broadcast = 0;			//清除广播包标志
15215  222c 725f002b      	clr	_tyProtol130+5
15216                     ; 3197 	tyProtol130.Packet.Control = 0xc9;
15218  2230 35c90026      	mov	_tyProtol130,#201
15219                     ; 3198 	tyProtol130.Packet.Seq = 0x70;		//单帧报文+需要回复 0x60
15221  2234 3570002d      	mov	_tyProtol130+7,#112
15222                     ; 3199 	MemcpyFunc(tyProtol130.Packet.Address, (u8 *)&g_dwTmAddress, sizeof(tyProtol130.Packet.Address));
15224  2238 4b04          	push	#4
15225  223a ae00c5        	ldw	x,#_g_dwTmAddress
15226  223d 89            	pushw	x
15227  223e ae0027        	ldw	x,#_tyProtol130+1
15228  2241 cd0000        	call	_MemcpyFunc
15230  2244 5b03          	addw	sp,#3
15231                     ; 3200 	switch (nLogonMode)
15233  2246 7b13          	ld	a,(OFST+1,sp)
15235                     ; 3237 	default:
15235                     ; 3238 		break;
15236  2248 2711          	jreq	L1726
15237  224a 4a            	dec	a
15238  224b 2717          	jreq	L3726
15239  224d 4a            	dec	a
15240  224e 2722          	jreq	L5726
15241  2250 4a            	dec	a
15242  2251 2730          	jreq	L7726
15243  2253 4a            	dec	a
15244  2254 2736          	jreq	L1036
15245  2256 4a            	dec	a
15246  2257 273b          	jreq	L3036
15247  2259 2043          	jra	L5436
15248  225b               L1726:
15249                     ; 3202 	case UP_LOGIN:		//集中器(登录)
15249                     ; 3203 		ucNumberMessage = 12;
15251  225b 350c00d1      	mov	_ucNumberMessage,#12
15252                     ; 3204 		temp.Long = 0x10000100;
15254  225f ae0100        	ldw	x,#256
15255                     ; 3205 		break;
15257  2262 2007          	jp	LC056
15258  2264               L3726:
15259                     ; 3206 	case UP_HEARTBEAT:		//集中器(心跳)
15259                     ; 3207 		ucNumberMessage = 12; //13;
15261  2264 350c00d1      	mov	_ucNumberMessage,#12
15262                     ; 3208 		temp.Long = 0x10000400;
15264  2268 ae0400        	ldw	x,#1024
15265  226b               LC056:
15266  226b 1f11          	ldw	(OFST-1,sp),x
15267  226d ae1000        	ldw	x,#4096
15268                     ; 3209 		break;
15270  2270 202a          	jp	LC055
15271  2272               L5726:
15272                     ; 3210 	case UP_LOGOUT:		//下线
15272                     ; 3211 		ucNumberMessage = 12;		//报文的数据长度
15274  2272 350c00d1      	mov	_ucNumberMessage,#12
15275                     ; 3212 		temp.Long = 0x00000000;
15277  2276 5f            	clrw	x
15278  2277 1f11          	ldw	(OFST-1,sp),x
15279  2279 1f0f          	ldw	(OFST-3,sp),x
15280                     ; 3221 			temp.Long |= 0x00000400;    //集中器(心跳)
15282  227b 7b11          	ld	a,(OFST-1,sp)
15283  227d aa04          	or	a,#4
15284  227f 6b11          	ld	(OFST-1,sp),a
15285                     ; 3223 		break;
15287  2281 201b          	jra	L5436
15288  2283               L7726:
15289                     ; 3224 	case UP_UPLOAD:		//上报
15289                     ; 3225 		ucNumberMessage = 12;
15291  2283 350c00d1      	mov	_ucNumberMessage,#12
15292                     ; 3226 		temp.Long = 0x10000107;
15294  2287 ae0107        	ldw	x,#263
15295                     ; 3227 		break;
15297  228a 20df          	jp	LC056
15298  228c               L1036:
15299                     ; 3229 	case UP_UPLOAD_BAT_VAL: 	//上报电池电压
15299                     ; 3230 		temp.Long = 0x00000108;
15301  228c ae0108        	ldw	x,#264
15302  228f 1f11          	ldw	(OFST-1,sp),x
15303  2291 5f            	clrw	x
15304                     ; 3231 		break;
15306  2292 2008          	jp	LC055
15307  2294               L3036:
15308                     ; 3233 	case UP_UPLOAD_PRESSURE: 	//压力曲线
15308                     ; 3234 		temp.Long = 0x21000002;
15310  2294 ae0002        	ldw	x,#2
15311  2297 1f11          	ldw	(OFST-1,sp),x
15312  2299 ae2100        	ldw	x,#8448
15313  229c               LC055:
15314  229c 1f0f          	ldw	(OFST-3,sp),x
15315                     ; 3235 		break;
15317                     ; 3237 	default:
15317                     ; 3238 		break;
15319  229e               L5436:
15320                     ; 3242 	if ( (ucLogonMode == UP_UPLOAD) && (TRUE == g_OptValveRepFlg) && (bNeedReport) )
15322  229e c600d0        	ld	a,_ucLogonMode
15323  22a1 a103          	cp	a,#3
15324  22a3 264e          	jrne	L7436
15326  22a5 c600ae        	ld	a,_g_OptValveRepFlg
15327  22a8 4a            	dec	a
15328  22a9 2648          	jrne	L7436
15330  22ab c60019        	ld	a,_tyGSMFlag
15331  22ae 2743          	jreq	L7436
15332                     ; 3244 		temp.Long = 0x00004524;
15334  22b0 ae4524        	ldw	x,#17700
15335  22b3 1f11          	ldw	(OFST-1,sp),x
15336  22b5 5f            	clrw	x
15337  22b6 1f0f          	ldw	(OFST-3,sp),x
15338                     ; 3245 		tyProtol130.Packet.Afn = 0x8c;
15340  22b8 358c002c      	mov	_tyProtol130+6,#140
15341                     ; 3246 		tyProtol130.Packet.Control = 0xC9;
15343  22bc 35c90026      	mov	_tyProtol130,#201
15344                     ; 3247 		tyProtol130.Packet.Buf[0] = stOptValve.nYear;
15346  22c0 5500020032    	mov	_tyProtol130+12,_stOptValve+2
15347                     ; 3248 		tyProtol130.Packet.Buf[1] = 0x20;
15349  22c5 35200033      	mov	_tyProtol130+13,#32
15350                     ; 3249 		MemcpyFunc(&tyProtol130.Packet.Buf[2], &stOptValve.nMonth, 4);
15352  22c9 4b04          	push	#4
15353  22cb ae0003        	ldw	x,#_stOptValve+3
15354  22ce 89            	pushw	x
15355  22cf ae0034        	ldw	x,#_tyProtol130+14
15356  22d2 cd0000        	call	_MemcpyFunc
15358  22d5 5b03          	addw	sp,#3
15359                     ; 3250 		tyProtol130.Packet.Buf[7] = 1;		//表数量,IP表,固定1组数据
15361  22d7 35010039      	mov	_tyProtol130+19,#1
15362                     ; 3251 		tyProtol130.Packet.Buf[8] = 0;
15364  22db 725f003a      	clr	_tyProtol130+20
15365                     ; 3252 		tyProtol130.Packet.Buf[9]  = m_nGmTn_1;		//采集器TN 
15367  22df 5500c1003b    	mov	_tyProtol130+21,_m_nGmTn_1
15368                     ; 3253 		tyProtol130.Packet.Buf[10] = m_nGmTn_2;		//表TN号
15370  22e4 5500c2003c    	mov	_tyProtol130+22,_m_nGmTn_2
15371                     ; 3254 		tyProtol130.Packet.Buf[11] = stOptValve.nVavleStat;
15373  22e9 550007003d    	mov	_tyProtol130+23,_stOptValve+7
15374                     ; 3255 		nSendLen = 12 + 12;
15376  22ee a618          	ld	a,#24
15378  22f0 cc252b        	jp	LC057
15379  22f3               L7436:
15380                     ; 3257 	else if ( (ucLogonMode == UP_UPLOAD) && (bNeedReport) )
15382  22f3 c600d0        	ld	a,_ucLogonMode
15383  22f6 a103          	cp	a,#3
15384  22f8 2703cc243b    	jrne	L3536
15386  22fd c60019        	ld	a,_tyGSMFlag
15387  2300 27f8          	jreq	L3536
15388                     ; 3260 		tyProtol130.Packet.Afn = 0x8c;
15390  2302 358c002c      	mov	_tyProtol130+6,#140
15391                     ; 3261 		tyProtol130.Packet.Control = 0x88;
15393  2306 35880026      	mov	_tyProtol130,#136
15394                     ; 3262 		tyProtol130.Packet.Buf[0] = 1;		//表数量,IP表,固定1组数据
15396  230a 35010032      	mov	_tyProtol130+12,#1
15397                     ; 3263 		tyProtol130.Packet.Buf[1] = 0;		
15399  230e 725f0033      	clr	_tyProtol130+13
15400                     ; 3264 		tyProtol130.Packet.Buf[2] = m_nGmTn_1;		//采集器TN 
15402  2312 5500c10034    	mov	_tyProtol130+14,_m_nGmTn_1
15403                     ; 3265 		tyProtol130.Packet.Buf[3] = m_nGmTn_2;		//表TN号
15405  2317 5500c20035    	mov	_tyProtol130+15,_m_nGmTn_2
15406                     ; 3268 		if(OWED_STAT_FLG == (tyParameter.nOverBuyFlg&(OWED_REP_SUCC|OWED_REP_FAIL|OWED_STAT_FLG)))
15408  231c c6000f        	ld	a,_tyParameter+15
15409  231f a40d          	and	a,#13
15410  2321 4a            	dec	a
15411  2322 2703cc23ac    	jrne	L5536
15412                     ; 3270 			tyProtol130.Packet.Buf[0] = 0x01;
15414  2327 35010032      	mov	_tyProtol130+12,#1
15415                     ; 3271 			tyProtol130.Packet.Buf[1] = 0x01;
15417  232b 35010033      	mov	_tyProtol130+13,#1
15418                     ; 3273 			if(FALSE == GM_GetGatherMeterFlg())
15420  232f cd0000        	call	_GM_GetGatherMeterFlg
15422  2332 4d            	tnz	a
15423  2333 260d          	jrne	L7536
15424                     ; 3275 				if(TRUE == ReadRecord(0, (u8*)&tyRecord, sizeof(tyRecord)))
15426  2335 cd2564        	call	LC059
15427  2338 2605          	jrne	L1636
15428                     ; 3277 					tyParameter.Value = tyRecord.Value;
15430  233a cd2552        	call	LC058
15431                     ; 3278 					tyParameter.Status = tyRecord.nStatus;
15432  233d 2003          	jra	L7536
15433  233f               L1636:
15434                     ; 3282 					tyParameter.Value = INVALID_DATA;
15436  233f cd2571        	call	LC060
15437  2342               L7536:
15438                     ; 3286 			VavleStatTransform(m_nMasterType, tyParameter.Status, &tyParameter.Status);
15440  2342 ae0001        	ldw	x,#_tyParameter+1
15441  2345 89            	pushw	x
15442  2346 c60001        	ld	a,_tyParameter+1
15443  2349 97            	ld	xl,a
15444  234a c600c0        	ld	a,_m_nMasterType
15445  234d 95            	ld	xh,a
15446  234e cd0000        	call	_VavleStatTransform
15448  2351 85            	popw	x
15449                     ; 3288 			temp.Long = tyParameter.Value;	//4位表读数
15451  2352 ce0004        	ldw	x,_tyParameter+4
15452  2355 1f11          	ldw	(OFST-1,sp),x
15453  2357 ce0002        	ldw	x,_tyParameter+2
15454  235a 1f0f          	ldw	(OFST-3,sp),x
15455                     ; 3289 			tyProtol130.Packet.Buf[2] = temp.Bytes.B3;		//LSB
15457  235c 7b12          	ld	a,(OFST+0,sp)
15458  235e c70034        	ld	_tyProtol130+14,a
15459                     ; 3290 			tyProtol130.Packet.Buf[3] = temp.Bytes.B2;
15461  2361 7b11          	ld	a,(OFST-1,sp)
15462  2363 c70035        	ld	_tyProtol130+15,a
15463                     ; 3291 			tyProtol130.Packet.Buf[4] = temp.Bytes.B1;
15465  2366 7b10          	ld	a,(OFST-2,sp)
15466  2368 c70036        	ld	_tyProtol130+16,a
15467                     ; 3292 			tyProtol130.Packet.Buf[5] = temp.Bytes.B0;
15469  236b 7b0f          	ld	a,(OFST-3,sp)
15470  236d c70037        	ld	_tyProtol130+17,a
15471                     ; 3293 			tyProtol130.Packet.Buf[6] = tyParameter.Status;
15473  2370 5500010038    	mov	_tyProtol130+18,_tyParameter+1
15474                     ; 3294 			STM8_RTC_Get(&stTimeNow);
15476  2375 ae0012        	ldw	x,#_stTimeNow
15477  2378 cd0000        	call	_STM8_RTC_Get
15479                     ; 3295 			tyProtol130.Packet.Buf[11]= 0x20;
15481  237b 3520003d      	mov	_tyProtol130+23,#32
15482                     ; 3296 			tyProtol130.Packet.Buf[12]= stTimeNow.wYear;
15484  237f 550012003e    	mov	_tyProtol130+24,_stTimeNow
15485                     ; 3297 			MemcpyFunc(&tyProtol130.Packet.Buf[13], &stTimeNow.nMonth, 5);
15487  2384 4b05          	push	#5
15488  2386 ae0013        	ldw	x,#_stTimeNow+1
15489  2389 89            	pushw	x
15490  238a ae003f        	ldw	x,#_tyProtol130+25
15491  238d cd0000        	call	_MemcpyFunc
15493  2390 5b03          	addw	sp,#3
15494                     ; 3298 			JX_BL_Change(7, &tyProtol130.Packet.Buf[11]);
15496  2392 ae003d        	ldw	x,#_tyProtol130+23
15497  2395 89            	pushw	x
15498  2396 ae0007        	ldw	x,#7
15499  2399 cd0000        	call	_JX_BL_Change
15501  239c 85            	popw	x
15502                     ; 3299 			temp.Long = 0x21000112;
15504  239d ae0112        	ldw	x,#274
15505  23a0 1f11          	ldw	(OFST-1,sp),x
15506  23a2 ae2100        	ldw	x,#8448
15507  23a5 1f0f          	ldw	(OFST-3,sp),x
15508                     ; 3300 			nSendLen =	12 + 18;
15510  23a7 a61e          	ld	a,#30
15512  23a9 cc252b        	jp	LC057
15513  23ac               L5536:
15514                     ; 3302 		else if(TRUE == (m_nWakeupReportFlg&KEY_WUAKEUP_FLG))/* 按键唤醒为单点调试 */
15516  23ac 720100a56b    	btjf	_m_nWakeupReportFlg,#0,L7636
15517                     ; 3304 			m_nRepIndex = 0;
15519  23b1 725f00bc      	clr	_m_nRepIndex
15520                     ; 3305 			if(FALSE == GM_GetGatherMeterFlg())
15522  23b5 cd0000        	call	_GM_GetGatherMeterFlg
15524  23b8 4d            	tnz	a
15525  23b9 260d          	jrne	L1736
15526                     ; 3307 				if(TRUE == ReadRecord(0, (u8*)&tyRecord, sizeof(tyRecord)))
15528  23bb cd2564        	call	LC059
15529  23be 2605          	jrne	L3736
15530                     ; 3309 					tyParameter.Value = tyRecord.Value;
15532  23c0 cd2552        	call	LC058
15533                     ; 3310 					tyParameter.Status = tyRecord.nStatus;
15534  23c3 2003          	jra	L1736
15535  23c5               L3736:
15536                     ; 3317 					tyParameter.Value = INVALID_DATA;
15538  23c5 cd2571        	call	LC060
15539  23c8               L1736:
15540                     ; 3321 			temp.Long = tyParameter.Value;	//4位表读数
15542  23c8 ce0004        	ldw	x,_tyParameter+4
15543  23cb 1f11          	ldw	(OFST-1,sp),x
15544  23cd ce0002        	ldw	x,_tyParameter+2
15545  23d0 1f0f          	ldw	(OFST-3,sp),x
15546                     ; 3322 			tyProtol130.Packet.Buf[4] = temp.Bytes.B3;		//LSB
15548  23d2 7b12          	ld	a,(OFST+0,sp)
15549  23d4 c70036        	ld	_tyProtol130+16,a
15550                     ; 3323 			tyProtol130.Packet.Buf[5] = temp.Bytes.B2;
15552  23d7 7b11          	ld	a,(OFST-1,sp)
15553  23d9 c70037        	ld	_tyProtol130+17,a
15554                     ; 3324 			tyProtol130.Packet.Buf[6] = temp.Bytes.B1;
15556  23dc 7b10          	ld	a,(OFST-2,sp)
15557  23de c70038        	ld	_tyProtol130+18,a
15558                     ; 3325 			tyProtol130.Packet.Buf[7] = temp.Bytes.B0;
15560  23e1 7b0f          	ld	a,(OFST-3,sp)
15561  23e3 c70039        	ld	_tyProtol130+19,a
15562                     ; 3326 			nSendLen =	12 + 2 + 1 * 7;
15564  23e6 a615          	ld	a,#21
15565  23e8 6b0e          	ld	(OFST-4,sp),a
15566                     ; 3327 			if(MASTER_NEW == m_nMasterType)
15568  23ea c600c0        	ld	a,_m_nMasterType
15569  23ed 4a            	dec	a
15570  23ee 260a          	jrne	L7736
15571                     ; 3329 				temp.Long = 0x30000107;				
15573  23f0 ae0107        	ldw	x,#263
15574  23f3 1f11          	ldw	(OFST-1,sp),x
15575  23f5 ae3000        	ldw	x,#12288
15577  23f8 2008          	jra	L1046
15578  23fa               L7736:
15579                     ; 3333 				temp.Long = 0x10000107;
15581  23fa ae0107        	ldw	x,#263
15582  23fd 1f11          	ldw	(OFST-1,sp),x
15583  23ff ae1000        	ldw	x,#4096
15584  2402               L1046:
15585  2402 1f0f          	ldw	(OFST-3,sp),x
15586                     ; 3335 			VavleStatTransform(m_nMasterType, tyParameter.Status, &tyParameter.Status);
15588  2404 ae0001        	ldw	x,#_tyParameter+1
15589  2407 89            	pushw	x
15590  2408 c60001        	ld	a,_tyParameter+1
15591  240b 97            	ld	xl,a
15592  240c c600c0        	ld	a,_m_nMasterType
15593  240f 95            	ld	xh,a
15594  2410 cd0000        	call	_VavleStatTransform
15596  2413 550001003a    	mov	_tyProtol130+20,_tyParameter+1
15597  2418 85            	popw	x
15598                     ; 3336 			tyProtol130.Packet.Buf[8] = tyParameter.Status;
15601  2419 cc252d        	jra	L1536
15602  241c               L7636:
15603                     ; 3340 			tyProtol130.Packet.Buf[0] = m_nGmTn_1;		//采集器TN 
15605  241c 5500c10032    	mov	_tyProtol130+12,_m_nGmTn_1
15606                     ; 3341 			tyProtol130.Packet.Buf[1] = m_nGmTn_2;		//表TN号
15608  2421 5500c20033    	mov	_tyProtol130+13,_m_nGmTn_2
15609                     ; 3342 			temp.Long = 0x00110107;
15611  2426 ae0107        	ldw	x,#263
15612  2429 1f11          	ldw	(OFST-1,sp),x
15613  242b ae0011        	ldw	x,#17
15614  242e 1f0f          	ldw	(OFST-3,sp),x
15615                     ; 3343 			nSendLen = 12+2+ AutoReportMakeFrame(&tyProtol130.Packet.Buf[2]);
15617  2430 ae0034        	ldw	x,#_tyProtol130+14
15618  2433 cd15f2        	call	_AutoReportMakeFrame
15620  2436 ab0e          	add	a,#14
15621  2438 cc252b        	jp	LC057
15622  243b               L3536:
15623                     ; 3346 	else if((ucLogonMode == UP_UPLOAD_BAT_VAL) && (bNeedReport))
15625  243b c600d0        	ld	a,_ucLogonMode
15626  243e a104          	cp	a,#4
15627  2440 2703cc24dc    	jrne	L7046
15629  2445 c60019        	ld	a,_tyGSMFlag
15630  2448 27f8          	jreq	L7046
15631                     ; 3348 		wBatVol = g_dwBatVol;//BAT_GetBatVol();				
15633  244a ce0000        	ldw	x,_g_dwBatVol
15634  244d 1f05          	ldw	(OFST-13,sp),x
15635                     ; 3349 		tyProtol130.Packet.Control = 0x88;
15637  244f 35880026      	mov	_tyProtol130,#136
15638                     ; 3350 		tyProtol130.Packet.Afn = 0x8C;
15640  2453 358c002c      	mov	_tyProtol130+6,#140
15641                     ; 3351 		MemcpyFunc(tyProtol130.Packet.Buf, (u8*)&wBatVol, 2);
15643  2457 4b02          	push	#2
15644  2459 96            	ldw	x,sp
15645  245a 1c0006        	addw	x,#OFST-12
15646  245d 89            	pushw	x
15647  245e ae0032        	ldw	x,#_tyProtol130+12
15648  2461 cd0000        	call	_MemcpyFunc
15650  2464 5b03          	addw	sp,#3
15651                     ; 3352 		MemcpyFunc(&tyProtol130.Packet.Buf[2], (u8*)&g_dwBatNoLoadVol, 2);
15653  2466 4b02          	push	#2
15654  2468 ae0000        	ldw	x,#_g_dwBatNoLoadVol
15655  246b 89            	pushw	x
15656  246c ae0034        	ldw	x,#_tyProtol130+14
15657  246f cd0000        	call	_MemcpyFunc
15659  2472 5b03          	addw	sp,#3
15660                     ; 3353 		MemcpyFunc(&tyProtol130.Packet.Buf[4], (u8*)&g_wTmReportCnt, 2);
15662  2474 4b02          	push	#2
15663  2476 ae00ab        	ldw	x,#_g_wTmReportCnt
15664  2479 89            	pushw	x
15665  247a ae0036        	ldw	x,#_tyProtol130+16
15666  247d cd0000        	call	_MemcpyFunc
15668  2480 5b03          	addw	sp,#3
15669                     ; 3354 		TM_TimeChangeBToA(&stLastReportT, &stReportTime);
15671  2482 96            	ldw	x,sp
15672  2483 1c0007        	addw	x,#OFST-11
15673  2486 89            	pushw	x
15674  2487 ae000a        	ldw	x,#_stLastReportT
15675  248a cd0000        	call	_TM_TimeChangeBToA
15677  248d 85            	popw	x
15678                     ; 3355 		MemcpyFunc(&tyProtol130.Packet.Buf[6], (u8*)&stReportTime, 6);
15680  248e 4b06          	push	#6
15681  2490 96            	ldw	x,sp
15682  2491 1c0008        	addw	x,#OFST-10
15683  2494 89            	pushw	x
15684  2495 ae0038        	ldw	x,#_tyProtol130+18
15685  2498 cd0000        	call	_MemcpyFunc
15687  249b 5b03          	addw	sp,#3
15688                     ; 3356 		tyProtol130.Packet.Buf[13] = JX_ByteToBcd(g_nSignal);			//信号大小,固定值
15690  249d c60000        	ld	a,_g_nSignal
15691  24a0 cd0000        	call	_JX_ByteToBcd
15693  24a3 c7003f        	ld	_tyProtol130+25,a
15694                     ; 3357 		tyProtol130.Packet.Buf[12] = ALM_GetBatStatus();			        //告警状态
15696  24a6 cd0000        	call	_ALM_GetBatStatus
15698  24a9 c7003e        	ld	_tyProtol130+24,a
15699                     ; 3359 		MemsetFunc((u8*)&tyProtol130.Packet.Buf[14], 0x00, 2);
15701  24ac 4b02          	push	#2
15702  24ae 4b00          	push	#0
15703  24b0 ae0040        	ldw	x,#_tyProtol130+26
15704  24b3 cd0000        	call	_MemsetFunc
15706  24b6 85            	popw	x
15707                     ; 3360 		JX_BL_Change(2, tyProtol130.Packet.Buf);
15709  24b7 ae0032        	ldw	x,#_tyProtol130+12
15710  24ba 89            	pushw	x
15711  24bb ae0002        	ldw	x,#2
15712  24be cd0000        	call	_JX_BL_Change
15714  24c1 85            	popw	x
15715                     ; 3361 		JX_BL_Change(2, &tyProtol130.Packet.Buf[2]);
15717  24c2 ae0034        	ldw	x,#_tyProtol130+14
15718  24c5 89            	pushw	x
15719  24c6 ae0002        	ldw	x,#2
15720  24c9 cd0000        	call	_JX_BL_Change
15722  24cc 85            	popw	x
15723                     ; 3362 		JX_BL_Change(2, &tyProtol130.Packet.Buf[4]);
15725  24cd ae0036        	ldw	x,#_tyProtol130+16
15726  24d0 89            	pushw	x
15727  24d1 ae0002        	ldw	x,#2
15728  24d4 cd0000        	call	_JX_BL_Change
15730  24d7 a61c          	ld	a,#28
15731  24d9 85            	popw	x
15732                     ; 3363 		nSendLen = 12 + 16;
15734  24da 204f          	jp	LC057
15735  24dc               L7046:
15736                     ; 3366 	else if((ucLogonMode == UP_UPLOAD_PRESSURE) && (bNeedReport)) //压力计曲线上报
15738  24dc c600d0        	ld	a,_ucLogonMode
15739  24df a105          	cp	a,#5
15740  24e1 263d          	jrne	L3146
15742  24e3 c60019        	ld	a,_tyGSMFlag
15743  24e6 2738          	jreq	L3146
15744                     ; 3368 		tyProtol130.Packet.Control = 0x88;
15746  24e8 35880026      	mov	_tyProtol130,#136
15747                     ; 3369 		tyProtol130.Packet.Afn = 0x8E;
15749  24ec 358e002c      	mov	_tyProtol130+6,#142
15750                     ; 3370 		tyProtol130.Packet.Buf[0] = m_nGmTn_1;		//采集器TN 
15752  24f0 5500c10032    	mov	_tyProtol130+12,_m_nGmTn_1
15753                     ; 3371 		tyProtol130.Packet.Buf[1] = m_nGmTn_2;		//表TN号
15755  24f5 5500c20033    	mov	_tyProtol130+13,_m_nGmTn_2
15756                     ; 3372 		tyProtol130.Packet.Buf[7] = FreezeUnitTransform(tyReport.wGatherCycle);		//5 分钟
15758  24fa ce00c1        	ldw	x,_tyReport
15759  24fd cd1498        	call	_FreezeUnitTransform
15761  2500 c70039        	ld	_tyProtol130+19,a
15762                     ; 3373 		tyProtol130.Packet.Buf[8] = RepPizeometerMakeFrame(&tyProtol130.Packet.Buf[2], &nSendLen);
15764  2503 96            	ldw	x,sp
15765  2504 1c000e        	addw	x,#OFST-4
15766  2507 89            	pushw	x
15767  2508 ae0034        	ldw	x,#_tyProtol130+14
15768  250b cd14c7        	call	_RepPizeometerMakeFrame
15770  250e c7003a        	ld	_tyProtol130+20,a
15771  2511 3504003b      	mov	_tyProtol130+21,#4
15772  2515 3583003c      	mov	_tyProtol130+22,#131
15773  2519 85            	popw	x
15774                     ; 3374 		tyProtol130.Packet.Buf[9] = 0x04;
15776                     ; 3375 		tyProtol130.Packet.Buf[10]= 0x83;
15778                     ; 3376 		nSendLen += (12+6);
15780  251a 7b0e          	ld	a,(OFST-4,sp)
15781  251c ab12          	add	a,#18
15783  251e 200b          	jp	LC057
15784  2520               L3146:
15785                     ; 3381 		tyProtol130.Packet.Buf[0] = JX_ByteToBcd(g_nSignal);			//信号大小,固定值
15787  2520 c60000        	ld	a,_g_nSignal
15788  2523 cd0000        	call	_JX_ByteToBcd
15790  2526 c70032        	ld	_tyProtol130+12,a
15791                     ; 3382 		nSendLen =  13;		//固定数据长度
15793  2529 a60d          	ld	a,#13
15794  252b               LC057:
15796  252b 6b0e          	ld	(OFST-4,sp),a
15797  252d               L1536:
15798                     ; 3385 	tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
15800  252d 7b0f          	ld	a,(OFST-3,sp)
15801  252f c7002e        	ld	_tyProtol130+8,a
15802                     ; 3386 	tyProtol130.Packet.Data[1] = temp.Bytes.B1;
15804  2532 7b10          	ld	a,(OFST-2,sp)
15805  2534 c7002f        	ld	_tyProtol130+9,a
15806                     ; 3387 	tyProtol130.Packet.Data[2] = temp.Bytes.B2;
15808  2537 7b11          	ld	a,(OFST-1,sp)
15809  2539 c70030        	ld	_tyProtol130+10,a
15810                     ; 3388 	tyProtol130.Packet.Data[3] = temp.Bytes.B3;	
15812  253c 7b12          	ld	a,(OFST+0,sp)
15813  253e c70031        	ld	_tyProtol130+11,a
15814                     ; 3389 	Protol130Send(nSendLen, COM_1);			//只有1组数据
15816  2541 ae0001        	ldw	x,#1
15817  2544 7b0e          	ld	a,(OFST-4,sp)
15818  2546 95            	ld	xh,a
15819  2547 cd1733        	call	_Protol130Send
15821                     ; 3392 	WatitDataSendOk();
15823  254a cd12f4        	call	_WatitDataSendOk
15825                     ; 3393 	return TRUE;
15827  254d a601          	ld	a,#1
15830  254f 5b13          	addw	sp,#19
15831  2551 81            	ret	
15833  2552               LC058:
15834  2552 ce0008        	ldw	x,_tyRecord+8
15835  2555 cf0004        	ldw	_tyParameter+4,x
15836  2558 ce0006        	ldw	x,_tyRecord+6
15837  255b cf0002        	ldw	_tyParameter+2,x
15838                     ; 3310 					tyParameter.Status = tyRecord.nStatus;
15840  255e 55000e0001    	mov	_tyParameter+1,_tyRecord+14
15841  2563 81            	ret	
15842  2564               LC059:
15843  2564 4b10          	push	#16
15844  2566 ae0000        	ldw	x,#_tyRecord
15845  2569 89            	pushw	x
15846  256a cd0000        	call	_ReadRecord
15848  256d 5b03          	addw	sp,#3
15849  256f 4a            	dec	a
15850  2570 81            	ret	
15851  2571               LC060:
15852  2571 aeeeee        	ldw	x,#61166
15853  2574 cf0004        	ldw	_tyParameter+4,x
15854  2577 cf0002        	ldw	_tyParameter+2,x
15855  257a 81            	ret	
15857                     	switch	.const
15858  05cd               L7146_nAddBuf:
15859  05cd 00            	dc.b	0
15860  05ce 00000000      	ds.b	4
15912                     ; 3445 u8 AddressComparePro(u8 *pnAddr)
15912                     ; 3446 {		
15913                     	switch	.text
15914  257b               _AddressComparePro:
15916  257b 89            	pushw	x
15917  257c 5207          	subw	sp,#7
15918       00000007      OFST:	set	7
15921                     ; 3447 	u8 nAddBuf[5] = {0};
15923  257e 96            	ldw	x,sp
15924  257f 1c0002        	addw	x,#OFST-5
15925  2582 90ae05cd      	ldw	y,#L7146_nAddBuf
15926  2586 a605          	ld	a,#5
15927  2588 cd0000        	call	c_xymvx
15929                     ; 3448 	u8 nLoop = 0;
15931  258b 0f07          	clr	(OFST+0,sp)
15932                     ; 3450 	if((0xFF == pnAddr[0]) && (0xFF == pnAddr[1]) 
15932                     ; 3451 		&& (0xFF == pnAddr[2]) && (0xFF == pnAddr[3]))
15934  258d 1e08          	ldw	x,(OFST+1,sp)
15935  258f f6            	ld	a,(x)
15936  2590 4c            	inc	a
15937  2591 260f          	jrne	L5446
15939  2593 e601          	ld	a,(1,x)
15940  2595 4c            	inc	a
15941  2596 260a          	jrne	L5446
15943  2598 e602          	ld	a,(2,x)
15944  259a 4c            	inc	a
15945  259b 2605          	jrne	L5446
15947  259d e603          	ld	a,(3,x)
15948  259f 4c            	inc	a
15949                     ; 3453 		return TRUE;
15951  25a0 2742          	jreq	L7546
15952  25a2               L5446:
15953                     ; 3456 	MemcpyFunc((u8*)nAddBuf, (u8*)&g_dwTmAddress, 4);
15955  25a2 4b04          	push	#4
15956  25a4 ae00c5        	ldw	x,#_g_dwTmAddress
15957  25a7 89            	pushw	x
15958  25a8 96            	ldw	x,sp
15959  25a9 1c0005        	addw	x,#OFST-2
15960  25ac cd0000        	call	_MemcpyFunc
15962  25af 5b03          	addw	sp,#3
15963                     ; 3459 	for(nLoop = 0; nLoop < 4; nLoop++)
15965  25b1 0f07          	clr	(OFST+0,sp)
15966  25b3               L7446:
15967                     ; 3461 		if(nAddBuf[nLoop] != pnAddr[nLoop])
15969  25b3 7b08          	ld	a,(OFST+1,sp)
15970  25b5 97            	ld	xl,a
15971  25b6 7b09          	ld	a,(OFST+2,sp)
15972  25b8 1b07          	add	a,(OFST+0,sp)
15973  25ba 2401          	jrnc	L4071
15974  25bc 5c            	incw	x
15975  25bd               L4071:
15976  25bd 02            	rlwa	x,a
15977  25be f6            	ld	a,(x)
15978  25bf 6b01          	ld	(OFST-6,sp),a
15979  25c1 96            	ldw	x,sp
15980  25c2 1c0002        	addw	x,#OFST-5
15981  25c5 9f            	ld	a,xl
15982  25c6 5e            	swapw	x
15983  25c7 1b07          	add	a,(OFST+0,sp)
15984  25c9 2401          	jrnc	L6071
15985  25cb 5c            	incw	x
15986  25cc               L6071:
15987  25cc 02            	rlwa	x,a
15988  25cd f6            	ld	a,(x)
15989  25ce 1101          	cp	a,(OFST-6,sp)
15990  25d0 2608          	jrne	L3546
15991                     ; 3463 			break;
15993                     ; 3459 	for(nLoop = 0; nLoop < 4; nLoop++)
15995  25d2 0c07          	inc	(OFST+0,sp)
15998  25d4 7b07          	ld	a,(OFST+0,sp)
15999  25d6 a104          	cp	a,#4
16000  25d8 25d9          	jrult	L7446
16001  25da               L3546:
16002                     ; 3467 	if(4 > nLoop)
16004  25da 7b07          	ld	a,(OFST+0,sp)
16005  25dc a104          	cp	a,#4
16006  25de 2404          	jruge	L7546
16007                     ; 3469 		return FALSE;
16009  25e0 4f            	clr	a
16011  25e1               L0171:
16013  25e1 5b09          	addw	sp,#9
16014  25e3 81            	ret	
16015  25e4               L7546:
16016                     ; 3472 	return TRUE;	
16019  25e4 a601          	ld	a,#1
16021  25e6 20f9          	jra	L0171
16112                     ; 3481 u8 DecodeParameter(u8* pnRxBuf, u8 nRxLen)
16112                     ; 3482 {
16113                     	switch	.text
16114  25e8               _DecodeParameter:
16116  25e8 89            	pushw	x
16117  25e9 520e          	subw	sp,#14
16118       0000000e      OFST:	set	14
16121                     ; 3483 	u8 *Point = NULL;
16123                     ; 3484 	u16 wDataLen = 0, wLen = 0;	
16125  25eb 5f            	clrw	x
16126  25ec 1f05          	ldw	(OFST-9,sp),x
16129  25ee 1f02          	ldw	(OFST-12,sp),x
16130                     ; 3486 	u8 nSendLen = 0;
16132  25f0 0f04          	clr	(OFST-10,sp)
16133                     ; 3487 	if(NULL == pnRxBuf)
16135  25f2 1e0f          	ldw	x,(OFST+1,sp)
16136  25f4 2603          	jrne	L1256
16137                     ; 3489 		return nSendLen;
16139  25f6 4f            	clr	a
16141  25f7 201d          	jra	L0471
16142  25f9               L1256:
16143                     ; 3491     Point = pnRxBuf;
16145  25f9 1f0d          	ldw	(OFST-1,sp),x
16147  25fb 201c          	jra	L7256
16148  25fd               L3256:
16149                     ; 3496 		Point++;
16151  25fd 5c            	incw	x
16152  25fe 1f0d          	ldw	(OFST-1,sp),x
16153                     ; 3497 		wLen++;
16155  2600 1e02          	ldw	x,(OFST-12,sp)
16156  2602 5c            	incw	x
16157  2603 1f02          	ldw	(OFST-12,sp),x
16158                     ; 3498 		if(nRxLen <= wLen)
16160  2605 7b13          	ld	a,(OFST+5,sp)
16161  2607 5f            	clrw	x
16162  2608 97            	ld	xl,a
16163  2609 1302          	cpw	x,(OFST-12,sp)
16164  260b 220c          	jrugt	L7256
16165                     ; 3500 		    if(NUMBER_UART_RX <= nRxLen)
16167  260d a1c0          	cp	a,#192
16168  260f 2503          	jrult	LC062
16169                     ; 3502 			    goto __UC_130Pro_Exit;
16170  2611               L1646:
16171                     ; 3558 __UC_130Pro_Exit:
16171                     ; 3559 
16171                     ; 3560 	/* add by maronglang clear RxBuf */
16171                     ; 3561 	ClearRxBuff();
16173  2611 cd0000        	call	_ClearRxBuff
16175                     ; 3562 	return nSendLen;
16177  2614               LC062:
16181  2614 7b04          	ld	a,(OFST-10,sp)
16183  2616               L0471:
16185  2616 5b10          	addw	sp,#16
16186  2618 81            	ret	
16187                     ; 3504 			return nSendLen;
16189  2619               L7256:
16190                     ; 3494 	while((MSG_START != *Point)||(MSG_START != *(Point+5)))
16192  2619 1e0d          	ldw	x,(OFST-1,sp)
16193  261b f6            	ld	a,(x)
16194  261c a168          	cp	a,#104
16195  261e 26dd          	jrne	L3256
16197  2620 e605          	ld	a,(5,x)
16198  2622 a168          	cp	a,#104
16199  2624 26d7          	jrne	L3256
16200                     ; 3508 	if(NUMBER_UART_RX <= nRxLen)
16202  2626 7b13          	ld	a,(OFST+5,sp)
16203  2628 a1c0          	cp	a,#192
16204  262a 24e5          	jruge	L1646
16205                     ; 3510 		goto __UC_130Pro_Exit;
16207                     ; 3513 	MemcpyFunc((u8 *)&tyProtol130Head, Point, sizeof(tyProtol130Head));		//复制字符串到缓冲中
16209  262c 4b06          	push	#6
16210  262e 1e0e          	ldw	x,(OFST+0,sp)
16211  2630 89            	pushw	x
16212  2631 96            	ldw	x,sp
16213  2632 1c000a        	addw	x,#OFST-4
16214  2635 cd0000        	call	_MemcpyFunc
16216  2638 5b03          	addw	sp,#3
16217                     ; 3516 	if ( (tyProtol130Head.Length0[0] != tyProtol130Head.Length1[0]) 
16217                     ; 3517 	||(tyProtol130Head.Length0[1] != tyProtol130Head.Length1[1]))
16219  263a 7b08          	ld	a,(OFST-6,sp)
16220  263c 110a          	cp	a,(OFST-4,sp)
16221  263e 26d1          	jrne	L1646
16223  2640 7b09          	ld	a,(OFST-5,sp)
16224  2642 110b          	cp	a,(OFST-3,sp)
16225  2644 26cb          	jrne	L1646
16226                     ; 3523 	JX_BL_Change(2,tyProtol130Head.Length0); //STVD默认为大端数据格式 应该去掉注释
16228  2646 96            	ldw	x,sp
16229  2647 1c0008        	addw	x,#OFST-6
16230  264a 89            	pushw	x
16231  264b ae0002        	ldw	x,#2
16232  264e cd0000        	call	_JX_BL_Change
16234  2651 85            	popw	x
16235                     ; 3524 	MemcpyFunc((u8*)&wDataLen, tyProtol130Head.Length0, 2);
16237  2652 4b02          	push	#2
16238  2654 96            	ldw	x,sp
16239  2655 1c0009        	addw	x,#OFST-5
16240  2658 89            	pushw	x
16241  2659 1d0003        	subw	x,#3
16242  265c cd0000        	call	_MemcpyFunc
16244  265f 5b03          	addw	sp,#3
16245                     ; 3525 	wDataLen = (wDataLen>>2);
16247  2661 a602          	ld	a,#2
16248  2663               L2271:
16249  2663 0405          	srl	(OFST-9,sp)
16250  2665 0606          	rrc	(OFST-8,sp)
16251  2667 4a            	dec	a
16252  2668 26f9          	jrne	L2271
16253                     ; 3528 	if((wDataLen+8+wLen) > nRxLen) //wLen为非法数据偏移量
16255  266a 1e05          	ldw	x,(OFST-9,sp)
16256  266c 72fb02        	addw	x,(OFST-12,sp)
16257  266f 1c0008        	addw	x,#8
16258  2672 7b13          	ld	a,(OFST+5,sp)
16259  2674 905f          	clrw	y
16260  2676 9097          	ld	yl,a
16261  2678 90bf01        	ldw	c_y+1,y
16262  267b b301          	cpw	x,c_y+1
16263                     ; 3530 		return nSendLen;
16265  267d 2295          	jrugt	LC062
16266                     ; 3534 	if(MSG_END != *(Point+wDataLen+sizeof(tyProtol130Head)+1))
16268  267f 1e0d          	ldw	x,(OFST-1,sp)
16269  2681 72fb05        	addw	x,(OFST-9,sp)
16270  2684 e607          	ld	a,(7,x)
16271  2686 a116          	cp	a,#22
16272  2688 2687          	jrne	L1646
16273                     ; 3536 		goto __UC_130Pro_Exit;
16275                     ; 3540 	if(*(Point+wDataLen+sizeof(tyProtol130Head)) != JX_AddSum8Bit(Point+sizeof(tyProtol130Head), wDataLen))
16277  268a 1e05          	ldw	x,(OFST-9,sp)
16278  268c 89            	pushw	x
16279  268d 1e0f          	ldw	x,(OFST+1,sp)
16280  268f 1c0006        	addw	x,#6
16281  2692 cd0000        	call	_JX_AddSum8Bit
16283  2695 85            	popw	x
16284  2696 6b01          	ld	(OFST-13,sp),a
16285  2698 1e0d          	ldw	x,(OFST-1,sp)
16286  269a 72fb05        	addw	x,(OFST-9,sp)
16287  269d e606          	ld	a,(6,x)
16288  269f 1101          	cp	a,(OFST-13,sp)
16289  26a1 2703cc2611    	jrne	L1646
16290                     ; 3542 		goto __UC_130Pro_Exit;
16292                     ; 3545 	Point += sizeof(tyProtol130Head);
16294  26a6 1e0d          	ldw	x,(OFST-1,sp)
16295  26a8 1c0006        	addw	x,#6
16296  26ab 1f0d          	ldw	(OFST-1,sp),x
16297                     ; 3546 	MemcpyFunc( (u8 *)&tyProtol130, Point, wDataLen);		//复制字符串到缓冲中
16299  26ad 7b06          	ld	a,(OFST-8,sp)
16300  26af 88            	push	a
16301  26b0 1e0e          	ldw	x,(OFST+0,sp)
16302  26b2 89            	pushw	x
16303  26b3 ae0026        	ldw	x,#_tyProtol130
16304  26b6 cd0000        	call	_MemcpyFunc
16306  26b9 5b03          	addw	sp,#3
16307                     ; 3549 	if(FALSE == AddressComparePro(tyProtol130.Packet.Address))
16309  26bb ae0027        	ldw	x,#_tyProtol130+1
16310  26be cd257b        	call	_AddressComparePro
16312  26c1 4d            	tnz	a
16313  26c2 27df          	jreq	L1646
16314                     ; 3551 		goto __UC_130Pro_Exit;
16316                     ; 3554 	nSendLen = Protol130Handle();
16318  26c4 cd1806        	call	_Protol130Handle
16320  26c7 6b04          	ld	(OFST-10,sp),a
16321                     ; 3555 	ClearRxBuffUnUsedLen(wDataLen+8+wLen);
16323  26c9 7b06          	ld	a,(OFST-8,sp)
16324  26cb 1b03          	add	a,(OFST-11,sp)
16325  26cd ab08          	add	a,#8
16326  26cf cd0000        	call	_ClearRxBuffUnUsedLen
16328                     ; 3556 	return nSendLen;
16330  26d2 cc2614        	jp	LC062
16385                     ; 3574 void JASON_130ProtolProc(void)
16385                     ; 3575 {
16386                     	switch	.text
16387  26d5               _JASON_130ProtolProc:
16389  26d5 5204          	subw	sp,#4
16390       00000004      OFST:	set	4
16393                     ; 3576 	u8* pnRxAdd = GetUartRxBuf();
16395  26d7 cd0000        	call	_GetUartRxBuf
16397  26da 1f02          	ldw	(OFST-2,sp),x
16398                     ; 3577 	u8  nRxLen  = 0, nSendLen = 0;
16400  26dc 0f01          	clr	(OFST-3,sp)
16403                     ; 3583 	nSendLen = DecodeParameter(pnRxAdd, CheckRevDataLen());
16405  26de cd0000        	call	_CheckRevDataLen
16407  26e1 88            	push	a
16408  26e2 1e03          	ldw	x,(OFST-1,sp)
16409  26e4 cd25e8        	call	_DecodeParameter
16411  26e7 5b01          	addw	sp,#1
16412  26e9 6b04          	ld	(OFST+0,sp),a
16413                     ; 3587 	if(0 < nSendLen)
16415  26eb 2707          	jreq	L7756
16416                     ; 3589 		Protol130Send(nSendLen, COM_1);
16418  26ed ae0001        	ldw	x,#1
16419  26f0 95            	ld	xh,a
16420  26f1 cd1733        	call	_Protol130Send
16422  26f4               L7756:
16423                     ; 3591 	UC_SleepFunc(50);
16425  26f4 ae0032        	ldw	x,#50
16426  26f7 89            	pushw	x
16427  26f8 5f            	clrw	x
16428  26f9 89            	pushw	x
16429  26fa cd0760        	call	_UC_SleepFunc
16431  26fd 5b08          	addw	sp,#8
16432                     ; 3592 }
16435  26ff 81            	ret	
16438                     	switch	.data
16439  00d2               L1066_dwTime:
16440  00d2 00000000      	dc.l	0
16441  00d6               L3066_dwHeart:
16442  00d6 00000000      	dc.l	0
16443  00da               L5066_nFirFlg:
16444  00da 01            	dc.b	1
16445  00db               L7066_nLoginCnt:
16446  00db 00            	dc.b	0
16505                     	switch	.const
16506  05d2               L6671:
16507  05d2 00003a99      	dc.l	15001
16508  05d6               L6771:
16509  05d6 0000ea61      	dc.l	60001
16510                     ; 3602 void JASON_130OnlineCtl(void)
16510                     ; 3603 {
16511                     	switch	.text
16512  2700               _JASON_130OnlineCtl:
16516                     ; 3607 	if(nFirFlg)
16518  2700 c600da        	ld	a,L5066_nFirFlg
16519  2703 2711          	jreq	L3366
16520                     ; 3609 		nFirFlg = FALSE;
16522  2705 725f00da      	clr	L5066_nFirFlg
16523                     ; 3610 		dwTime  = GetSysTemTick();
16525  2709 cd27aa        	call	LC063
16527                     ; 3611 		Online(ucLogonMode);
16529  270c c600d0        	ld	a,_ucLogonMode
16530  270f cd2215        	call	_Online
16532                     ; 3612 		bNeedReport = TRUE;
16534  2712 35010019      	mov	_tyGSMFlag,#1
16535  2716               L3366:
16536                     ; 3616 	if((UP_LOGIN == ucLogonMode) && 
16536                     ; 3617 		(RE_LOGIN_TO < GetSysTemTick() - dwTime))
16538  2716 725d00d0      	tnz	_ucLogonMode
16539  271a 2632          	jrne	L5366
16541  271c cd0000        	call	_GetSysTemTick
16543  271f ae00d2        	ldw	x,#L1066_dwTime
16544  2722 cd0000        	call	c_lsub
16546  2725 ae05d2        	ldw	x,#L6671
16547  2728 cd0000        	call	c_lcmp
16549  272b 2521          	jrult	L5366
16550                     ; 3619 		dwTime  = GetSysTemTick();
16552  272d ad7b          	call	LC063
16554                     ; 3620 		if(3 > nLoginCnt++)
16556  272f c600db        	ld	a,L7066_nLoginCnt
16557  2732 725c00db      	inc	L7066_nLoginCnt
16558  2736 a103          	cp	a,#3
16559  2738 2408          	jruge	L7366
16560                     ; 3622 			Online(ucLogonMode);
16562  273a c600d0        	ld	a,_ucLogonMode
16563  273d cd2215        	call	_Online
16566  2740 200c          	jra	L5366
16567  2742               L7366:
16568                     ; 3626 			stRepFail.wError |= (1<<REP_LOGIN_FAIL);
16570  2742 72160007      	bset	_stRepFail+7,#3
16571                     ; 3627 			bNeedReport = FALSE;
16573  2746 725f0019      	clr	_tyGSMFlag
16574                     ; 3628 			m_nRepFailFlg = TRUE;
16576  274a 350100bd      	mov	_m_nRepFailFlg,#1
16577  274e               L5366:
16578                     ; 3633 	if((UP_HEARTBEAT == ucLogonMode) && 
16578                     ; 3634 		((0 == dwHeart)||(RE_HEART_TO < GetSysTemTick() - dwHeart)))
16580  274e c600d0        	ld	a,_ucLogonMode
16581  2751 4a            	dec	a
16582  2752 2628          	jrne	L3466
16584  2754 ae00d6        	ldw	x,#L3066_dwHeart
16585  2757 cd0000        	call	c_lzmp
16587  275a 2711          	jreq	L5466
16589  275c cd0000        	call	_GetSysTemTick
16591  275f ae00d6        	ldw	x,#L3066_dwHeart
16592  2762 cd0000        	call	c_lsub
16594  2765 ae05d6        	ldw	x,#L6771
16595  2768 cd0000        	call	c_lcmp
16597  276b 250f          	jrult	L3466
16598  276d               L5466:
16599                     ; 3636 		dwHeart	= GetSysTemTick();
16601  276d cd0000        	call	_GetSysTemTick
16603  2770 ae00d6        	ldw	x,#L3066_dwHeart
16604  2773 cd0000        	call	c_rtol
16606                     ; 3637 		Online(ucLogonMode);
16608  2776 c600d0        	ld	a,_ucLogonMode
16609  2779 cd2215        	call	_Online
16611  277c               L3466:
16612                     ; 3641 	if(((UP_UPLOAD <= ucLogonMode)&&(UP_FREE > ucLogonMode))&&(bNeedReport))
16614  277c c600d0        	ld	a,_ucLogonMode
16615  277f a103          	cp	a,#3
16616  2781 2526          	jrult	L7466
16618  2783 c600d0        	ld	a,_ucLogonMode
16619  2786 a106          	cp	a,#6
16620  2788 241f          	jruge	L7466
16622  278a c60019        	ld	a,_tyGSMFlag
16623  278d 271a          	jreq	L7466
16624                     ; 3643 		if(TRUE == Online(ucLogonMode))
16626  278f c600d0        	ld	a,_ucLogonMode
16627  2792 cd2215        	call	_Online
16629  2795 4a            	dec	a
16630  2796 2611          	jrne	L7466
16631                     ; 3645 			ucLogonMode = UP_FREE;
16633  2798 350600d0      	mov	_ucLogonMode,#6
16634                     ; 3646 			g_dwRepTick = GetSysTemTick();
16636  279c cd0000        	call	_GetSysTemTick
16638  279f ae00b5        	ldw	x,#_g_dwRepTick
16639  27a2 cd0000        	call	c_rtol
16641                     ; 3649 			g_nDatRepCnt++;
16643  27a5 725c00b4      	inc	_g_nDatRepCnt
16644  27a9               L7466:
16645                     ; 3652 }
16648  27a9 81            	ret	
16650  27aa               LC063:
16651  27aa cd0000        	call	_GetSysTemTick
16653  27ad ae00d2        	ldw	x,#L1066_dwTime
16654  27b0 cc0000        	jp	c_rtol
16688                     ; 3663 void JASON_130TimeOutReUpLoad(void)
16688                     ; 3664 {
16689                     	switch	.text
16690  27b3               _JASON_130TimeOutReUpLoad:
16694                     ; 3665 	if (UP_FREE > ucLogonMode)
16696  27b3 c600d0        	ld	a,_ucLogonMode
16697  27b6 a106          	cp	a,#6
16698  27b8 240e          	jruge	L3666
16699                     ; 3667 		JASON_130OnlineCtl();
16701  27ba cd2700        	call	_JASON_130OnlineCtl
16703                     ; 3668 		UC_SleepFunc(200);
16705  27bd ae00c8        	ldw	x,#200
16706  27c0 89            	pushw	x
16707  27c1 5f            	clrw	x
16708  27c2 89            	pushw	x
16709  27c3 cd0760        	call	_UC_SleepFunc
16711  27c6 5b04          	addw	sp,#4
16712  27c8               L3666:
16713                     ; 3672 	if((FALSE == m_nRepEnableFlg)||(REPDAT_TIMEOUT >= GetSysTemTick() - g_dwRepTick))
16715  27c8 c600ba        	ld	a,_m_nRepEnableFlg
16716  27cb 2711          	jreq	L7666
16718  27cd cd0000        	call	_GetSysTemTick
16720  27d0 ae00b5        	ldw	x,#_g_dwRepTick
16721  27d3 cd0000        	call	c_lsub
16723  27d6 ae05d2        	ldw	x,#L6671
16724  27d9 cd0000        	call	c_lcmp
16726  27dc 2401          	jruge	L5666
16727  27de               L7666:
16728                     ; 3674 		return ;
16731  27de 81            	ret	
16732  27df               L5666:
16733                     ; 3677 	if((UP_FREE == ucLogonMode)&&(REPORT_CNT_TO > g_nDatRepCnt))
16735  27df c600d0        	ld	a,_ucLogonMode
16736  27e2 a106          	cp	a,#6
16737  27e4 261a          	jrne	L1766
16739  27e6 c600b4        	ld	a,_g_nDatRepCnt
16740  27e9 a103          	cp	a,#3
16741  27eb 2413          	jruge	L1766
16742                     ; 3679 		if((UP_UPLOAD <= ucLogonMode)&&(UP_FREE > ucLogonMode))
16744  27ed c600d0        	ld	a,_ucLogonMode
16745  27f0 a103          	cp	a,#3
16746  27f2 250c          	jrult	L1766
16748  27f4 c600d0        	ld	a,_ucLogonMode
16749  27f7 a106          	cp	a,#6
16750  27f9 2405          	jruge	L1766
16751                     ; 3681 			ucLogonMode = nLogonModeBk;
16753  27fb 5500cf00d0    	mov	_ucLogonMode,_nLogonModeBk
16754  2800               L1766:
16755                     ; 3685 	if(REPORT_CNT_TO <= g_nDatRepCnt)
16757  2800 c600b4        	ld	a,_g_nDatRepCnt
16758  2803 a103          	cp	a,#3
16759  2805 250d          	jrult	L5766
16760                     ; 3687 		SetLogonMode(UP_HEARTBEAT);
16762  2807 a601          	ld	a,#1
16763  2809 cd0033        	call	_SetLogonMode
16765                     ; 3688 		stRepFail.wError |= (1<<REP_RESPOND_FAIL);
16767  280c 72180007      	bset	_stRepFail+7,#4
16768                     ; 3689 		m_nRepFailFlg = TRUE;
16770  2810 350100bd      	mov	_m_nRepFailFlg,#1
16771  2814               L5766:
16772                     ; 3691 	return ;
16775  2814 81            	ret	
16778                     	switch	.const
16779  05da               L7766_nIPstr:
16780  05da 00            	dc.b	0
16781  05db 000000000000  	ds.b	31
16782  05fa               L1076_nPort:
16783  05fa 00            	dc.b	0
16784  05fb 0000000000    	ds.b	5
16785  0600               L3076_nBuf:
16786  0600 00            	dc.b	0
16787  0601 000000000000  	ds.b	9
16877                     ; 3703 void JASON_130InitializeGsm(void)
16877                     ; 3704 {
16878                     	switch	.text
16879  2815               _JASON_130InitializeGsm:
16881  2815 5239          	subw	sp,#57
16882       00000039      OFST:	set	57
16885                     ; 3705 	char nIPstr[32] = {0};
16887  2817 96            	ldw	x,sp
16888  2818 1c0003        	addw	x,#OFST-54
16889  281b 90ae05da      	ldw	y,#L7766_nIPstr
16890  281f a620          	ld	a,#32
16891  2821 cd0000        	call	c_xymvx
16893                     ; 3706 	u8 nPort[6]     = {0};
16895  2824 96            	ldw	x,sp
16896  2825 1c0023        	addw	x,#OFST-22
16897  2828 90ae05fa      	ldw	y,#L1076_nPort
16898  282c a606          	ld	a,#6
16899  282e cd0000        	call	c_xymvx
16901                     ; 3707 	u16 dwPortNum = 0;
16903  2831 5f            	clrw	x
16904  2832 1f01          	ldw	(OFST-56,sp),x
16905                     ; 3709 	u8 nBuf[10]     = {0};
16907  2834 96            	ldw	x,sp
16908  2835 1c0030        	addw	x,#OFST-9
16909  2838 90ae0600      	ldw	y,#L3076_nBuf
16910  283c a60a          	ld	a,#10
16911  283e cd0000        	call	c_xymvx
16913                     ; 3711 	MemsetFunc(nPort, 0, sizeof(nPort));
16915  2841 4b06          	push	#6
16916  2843 4b00          	push	#0
16917  2845 96            	ldw	x,sp
16918  2846 1c0025        	addw	x,#OFST-20
16919  2849 cd0000        	call	_MemsetFunc
16921  284c 85            	popw	x
16922                     ; 3712 	MemsetFunc(nIPstr, 0, sizeof(nIPstr));	
16924  284d 4b20          	push	#32
16925  284f 4b00          	push	#0
16926  2851 96            	ldw	x,sp
16927  2852 1c0005        	addw	x,#OFST-52
16928  2855 cd0000        	call	_MemsetFunc
16930  2858 4f            	clr	a
16931  2859 85            	popw	x
16932                     ; 3713 	SetLogonMode(UP_LOGIN);
16934  285a cd0033        	call	_SetLogonMode
16936                     ; 3716 	if(TRUE == ReadParameterForType((u8 *)&tyReportParameter, sizeof(tyReportParameter), IPANDPORT_PARA))
16938  285d 4b01          	push	#1
16939  285f 4b0c          	push	#12
16940  2861 ae001a        	ldw	x,#_tyReportParameter
16941  2864 cd0000        	call	_ReadParameterForType
16943  2867 4a            	dec	a
16944  2868 85            	popw	x
16945  2869 2703cc2904    	jrne	L1476
16946                     ; 3718 		JX_IpAddrToStr(nIPstr, (u8*)&tyReportParameter.Main_IP);
16948  286e ae001a        	ldw	x,#_tyReportParameter
16949  2871 89            	pushw	x
16950  2872 96            	ldw	x,sp
16951  2873 1c0005        	addw	x,#OFST-52
16952  2876 cd0000        	call	_JX_IpAddrToStr
16954  2879 85            	popw	x
16955                     ; 3719 		MemcpyFunc((u8*)&dwPortNum, (u8*)&tyReportParameter.Main_Port, 2);
16957  287a 4b02          	push	#2
16958  287c ae0022        	ldw	x,#_tyReportParameter+8
16959  287f 89            	pushw	x
16960  2880 96            	ldw	x,sp
16961  2881 1c0004        	addw	x,#OFST-53
16962  2884 cd0000        	call	_MemcpyFunc
16964  2887 5b03          	addw	sp,#3
16965                     ; 3720 		JX_BL_Change(2, (u8*)&dwPortNum);
16967  2889 96            	ldw	x,sp
16968  288a 5c            	incw	x
16969  288b 89            	pushw	x
16970  288c ae0002        	ldw	x,#2
16971  288f cd0000        	call	_JX_BL_Change
16973  2892 85            	popw	x
16974                     ; 3721 		JX_U32ToStr(dwPortNum, nPort);
16976  2893 96            	ldw	x,sp
16977  2894 1c0023        	addw	x,#OFST-22
16978  2897 89            	pushw	x
16979  2898 1e03          	ldw	x,(OFST-54,sp)
16980  289a cd0000        	call	c_uitolx
16982  289d be02          	ldw	x,c_lreg+2
16983  289f 89            	pushw	x
16984  28a0 be00          	ldw	x,c_lreg
16985  28a2 89            	pushw	x
16986  28a3 cd0000        	call	_JX_U32ToStr
16988  28a6 5b06          	addw	sp,#6
16989                     ; 3722 		MemsetFunc(&aucAtPServer1[1], 0, sizeof(aucAtPServer1)-1);
16991  28a8 4b13          	push	#19
16992  28aa 4b00          	push	#0
16993  28ac ae0036        	ldw	x,#_aucAtPServer1+1
16994  28af cd0000        	call	_MemsetFunc
16996  28b2 85            	popw	x
16997                     ; 3723 		MemsetFunc(&aucAtPPort1[1], 0, sizeof(aucAtPPort1)-1);
16999  28b3 4b07          	push	#7
17000  28b5 4b00          	push	#0
17001  28b7 ae004a        	ldw	x,#_aucAtPPort1+1
17002  28ba cd0000        	call	_MemsetFunc
17004  28bd 85            	popw	x
17005                     ; 3725 		MemcpyFunc((u8*)&aucAtPServer1[1], nIPstr, JX_Strlen(nIPstr));
17007  28be 96            	ldw	x,sp
17008  28bf 1c0003        	addw	x,#OFST-54
17009  28c2 cd0316        	call	_JX_Strlen
17011  28c5 88            	push	a
17012  28c6 96            	ldw	x,sp
17013  28c7 1c0004        	addw	x,#OFST-53
17014  28ca 89            	pushw	x
17015  28cb ae0036        	ldw	x,#_aucAtPServer1+1
17016  28ce cd0000        	call	_MemcpyFunc
17018  28d1 5b03          	addw	sp,#3
17019                     ; 3726 		JX_StringCat(aucAtPServer1,"\"", 2);
17021  28d3 4b02          	push	#2
17022  28d5 ae0612        	ldw	x,#L3476
17023  28d8 89            	pushw	x
17024  28d9 ae0035        	ldw	x,#_aucAtPServer1
17025  28dc cd0334        	call	_JX_StringCat
17027  28df 5b03          	addw	sp,#3
17028                     ; 3727 		MemcpyFunc((u8*)&aucAtPPort1[1], nPort, JX_Strlen(nPort));
17030  28e1 96            	ldw	x,sp
17031  28e2 1c0023        	addw	x,#OFST-22
17032  28e5 cd0316        	call	_JX_Strlen
17034  28e8 88            	push	a
17035  28e9 96            	ldw	x,sp
17036  28ea 1c0024        	addw	x,#OFST-21
17037  28ed 89            	pushw	x
17038  28ee ae004a        	ldw	x,#_aucAtPPort1+1
17039  28f1 cd0000        	call	_MemcpyFunc
17041  28f4 5b03          	addw	sp,#3
17042                     ; 3728 		JX_StringCat(aucAtPPort1,"\"", 2);
17044  28f6 4b02          	push	#2
17045  28f8 ae0612        	ldw	x,#L3476
17046  28fb 89            	pushw	x
17047  28fc ae0049        	ldw	x,#_aucAtPPort1
17048  28ff cd0334        	call	_JX_StringCat
17050  2902 5b03          	addw	sp,#3
17051  2904               L1476:
17052                     ; 3732 	if(TRUE == ReadParameterForType(&g_nApnBuf[1], APN_LEN, APN_PARA))
17054  2904 4b02          	push	#2
17055  2906 4b10          	push	#16
17056  2908 ae0002        	ldw	x,#_g_nApnBuf+1
17057  290b cd0000        	call	_ReadParameterForType
17059  290e 4a            	dec	a
17060  290f 85            	popw	x
17061  2910 260e          	jrne	L5476
17062                     ; 3734 		JX_StringCat(g_nApnBuf, "\"", 2);
17064  2912 4b02          	push	#2
17065  2914 ae0612        	ldw	x,#L3476
17066  2917 89            	pushw	x
17067  2918 ae0001        	ldw	x,#_g_nApnBuf
17068  291b cd0334        	call	_JX_StringCat
17070  291e 5b03          	addw	sp,#3
17071  2920               L5476:
17072                     ; 3738 	if(FALSE == ReadParameterForType((u8 *)&tyReport, sizeof(tyReport), REPORT_PARA))
17074  2920 4b03          	push	#3
17075  2922 4b0b          	push	#11
17076  2924 ae00c1        	ldw	x,#_tyReport
17077  2927 cd0000        	call	_ReadParameterForType
17079  292a 4d            	tnz	a
17080  292b 85            	popw	x
17081  292c 2630          	jrne	L7476
17082                     ; 3741 		tyReport.cycle = 0x06;   // 7
17084  292e 350600c4      	mov	_tyReport+3,#6
17085                     ; 3742 		tyReport.enable = 1;		
17087  2932 350100c3      	mov	_tyReport+2,#1
17088                     ; 3743 		tyReport.wGatherCycle = 15; // 10080
17090  2936 ae000f        	ldw	x,#15
17091  2939 cf00c1        	ldw	_tyReport,x
17092                     ; 3749 		tyReport.Time.Byte.Year = 0x15;
17094  293c 351500ca      	mov	_tyReport+9,#21
17095                     ; 3750 		tyReport.Time.Byte.Month = 0x12;
17097  2940 351200c9      	mov	_tyReport+8,#18
17098                     ; 3751 		tyReport.Time.Byte.Day = 0x28;
17100  2944 352800c8      	mov	_tyReport+7,#40
17101                     ; 3752 		tyReport.Time.Byte.Hour = 0x00;
17103  2948 725f00c7      	clr	_tyReport+6
17104                     ; 3753 		tyReport.Time.Byte.Minute= 0x00;
17106  294c 725f00c6      	clr	_tyReport+5
17107                     ; 3754 		SaveParameterForType((u8 *)&tyReport, sizeof(tyReport), REPORT_PARA);		
17109  2950 4b03          	push	#3
17110  2952 4b0b          	push	#11
17111  2954 ae00c1        	ldw	x,#_tyReport
17112  2957 cd0000        	call	_SaveParameterForType
17114  295a 85            	popw	x
17115                     ; 3755 		UC_SleepFunc(1);
17117  295b cd29fa        	call	LC064
17118  295e               L7476:
17119                     ; 3757 	if((0 == tyReport.nMonFreezeDay)||(28 < tyReport.nMonFreezeDay))
17121  295e c600cb        	ld	a,_tyReport+10
17122  2961 2704          	jreq	L3576
17124  2963 a11d          	cp	a,#29
17125  2965 2504          	jrult	L1576
17126  2967               L3576:
17127                     ; 3759 		tyReport.nMonFreezeDay   = 20;
17129  2967 351400cb      	mov	_tyReport+10,#20
17130  296b               L1576:
17131                     ; 3763 	if(FALSE == ReadParameterForType(nBuf, 10, LT_REP_TIME))
17133  296b 4b05          	push	#5
17134  296d 4b0a          	push	#10
17135  296f 96            	ldw	x,sp
17136  2970 1c0032        	addw	x,#OFST-7
17137  2973 cd0000        	call	_ReadParameterForType
17139  2976 4d            	tnz	a
17140  2977 85            	popw	x
17141  2978 265f          	jrne	L5576
17142                     ; 3765 		g_wTmReportCnt = 0;
17144  297a 5f            	clrw	x
17145  297b cf00ab        	ldw	_g_wTmReportCnt,x
17146                     ; 3766 		MemcpyFunc((u8*)&stReportTime, (u8*)&tyReport.Time, sizeof(tyReport.Time));
17148  297e 4b06          	push	#6
17149  2980 ae00c5        	ldw	x,#_tyReport+4
17150  2983 89            	pushw	x
17151  2984 96            	ldw	x,sp
17152  2985 1c002c        	addw	x,#OFST-13
17153  2988 cd0000        	call	_MemcpyFunc
17155  298b 5b03          	addw	sp,#3
17156                     ; 3767 		JX_BL_Change(6, (u8*)&stReportTime);
17158  298d 96            	ldw	x,sp
17159  298e 1c0029        	addw	x,#OFST-16
17160  2991 89            	pushw	x
17161  2992 ae0006        	ldw	x,#6
17162  2995 cd0000        	call	_JX_BL_Change
17164  2998 85            	popw	x
17165                     ; 3768 		stReportTime.nMonth = stReportTime.nMonth&0x1F;
17167  2999 7b2a          	ld	a,(OFST-15,sp)
17168  299b a41f          	and	a,#31
17169  299d 6b2a          	ld	(OFST-15,sp),a
17170                     ; 3769 		TM_TimeChangeAToB(&stReportTime,&stLastReportT);
17172  299f ae000a        	ldw	x,#_stLastReportT
17173  29a2 89            	pushw	x
17174  29a3 96            	ldw	x,sp
17175  29a4 1c002b        	addw	x,#OFST-14
17176  29a7 cd0000        	call	_TM_TimeChangeAToB
17178  29aa 85            	popw	x
17179                     ; 3770 		MemcpyFunc(nBuf, (u8*)&stLastReportT, 8);
17181  29ab 4b08          	push	#8
17182  29ad ae000a        	ldw	x,#_stLastReportT
17183  29b0 89            	pushw	x
17184  29b1 96            	ldw	x,sp
17185  29b2 1c0033        	addw	x,#OFST-6
17186  29b5 cd0000        	call	_MemcpyFunc
17188  29b8 5b03          	addw	sp,#3
17189                     ; 3771 		MemcpyFunc(&nBuf[8], (u8*)&g_wTmReportCnt, 2);
17191  29ba 4b02          	push	#2
17192  29bc ae00ab        	ldw	x,#_g_wTmReportCnt
17193  29bf 89            	pushw	x
17194  29c0 96            	ldw	x,sp
17195  29c1 1c003b        	addw	x,#OFST+2
17196  29c4 cd0000        	call	_MemcpyFunc
17198  29c7 5b03          	addw	sp,#3
17199                     ; 3772 		SaveParameterForType(nBuf, 10, LT_REP_TIME);
17201  29c9 4b05          	push	#5
17202  29cb 4b0a          	push	#10
17203  29cd 96            	ldw	x,sp
17204  29ce 1c0032        	addw	x,#OFST-7
17205  29d1 cd0000        	call	_SaveParameterForType
17207  29d4 85            	popw	x
17208                     ; 3773 		UC_SleepFunc(1);
17210  29d5 ad23          	call	LC064
17212  29d7 201e          	jra	L7576
17213  29d9               L5576:
17214                     ; 3777 		MemcpyFunc((u8 *)&stLastReportT, nBuf, 8);
17216  29d9 4b08          	push	#8
17217  29db 96            	ldw	x,sp
17218  29dc 1c0031        	addw	x,#OFST-8
17219  29df 89            	pushw	x
17220  29e0 ae000a        	ldw	x,#_stLastReportT
17221  29e3 cd0000        	call	_MemcpyFunc
17223  29e6 5b03          	addw	sp,#3
17224                     ; 3778 		MemcpyFunc((u8 *)&g_wTmReportCnt, &nBuf[8], 2);
17226  29e8 4b02          	push	#2
17227  29ea 96            	ldw	x,sp
17228  29eb 1c0039        	addw	x,#OFST+0
17229  29ee 89            	pushw	x
17230  29ef ae00ab        	ldw	x,#_g_wTmReportCnt
17231  29f2 cd0000        	call	_MemcpyFunc
17233  29f5 5b03          	addw	sp,#3
17234  29f7               L7576:
17235                     ; 3781 	return ;
17238  29f7 5b39          	addw	sp,#57
17239  29f9 81            	ret	
17241  29fa               LC064:
17242  29fa ae0001        	ldw	x,#1
17243  29fd 89            	pushw	x
17244  29fe 5f            	clrw	x
17245  29ff 89            	pushw	x
17246  2a00 cd0760        	call	_UC_SleepFunc
17248  2a03 5b04          	addw	sp,#4
17249  2a05 81            	ret	
17272                     ; 3796 u8 GetLedFlg(void)
17272                     ; 3797 {
17273                     	switch	.text
17274  2a06               _GetLedFlg:
17278                     ; 3798 	return m_nLedFlashFlg;
17280  2a06 c600bf        	ld	a,_m_nLedFlashFlg
17283  2a09 81            	ret	
17307                     ; 3809 u8 GetGprsConntStat(void)
17307                     ; 3810 {
17308                     	switch	.text
17309  2a0a               _GetGprsConntStat:
17313                     ; 3811 	return ucStatusGsm;
17315  2a0a c600ce        	ld	a,_ucStatusGsm
17318  2a0d 81            	ret	
17342                     ; 3823 u8 GetOnLineStatus(void)
17342                     ; 3824 {
17343                     	switch	.text
17344  2a0e               _GetOnLineStatus:
17348                     ; 3825 	return ucLogonMode;
17350  2a0e c600d0        	ld	a,_ucLogonMode
17353  2a11 81            	ret	
17377                     ; 3837 u16 GetTermReportTime(void)
17377                     ; 3838 {
17378                     	switch	.text
17379  2a12               _GetTermReportTime:
17383                     ; 3839 	return g_wTmReportCnt;
17385  2a12 ce00ab        	ldw	x,_g_wTmReportCnt
17388  2a15 81            	ret	
17391                     	switch	.data
17392  00dc               L1207_dwDelayCnt:
17393  00dc 00000000      	dc.l	0
17441                     ; 3851 void ReportTimeOutPro(void)
17441                     ; 3852 {
17442                     	switch	.text
17443  2a16               _ReportTimeOutPro:
17445  2a16 5204          	subw	sp,#4
17446       00000004      OFST:	set	4
17449                     ; 3854 	u32 dwTemp = 0;
17451  2a18 5f            	clrw	x
17452  2a19 1f03          	ldw	(OFST-1,sp),x
17453  2a1b 1f01          	ldw	(OFST-3,sp),x
17454                     ; 3856 	if(FALSE != bNeedReport)
17456  2a1d c60019        	ld	a,_tyGSMFlag
17457  2a20 2626          	jrne	L4512
17458                     ; 3858 		return ;
17460                     ; 3862 	dwTemp = GetSysTemTick();
17462  2a22 cd0000        	call	_GetSysTemTick
17464  2a25 96            	ldw	x,sp
17465  2a26 5c            	incw	x
17466  2a27 cd0000        	call	c_rtol
17468                     ; 3863 	if(REPROT_DELAY < dwTemp-dwDelayCnt)
17470  2a2a 96            	ldw	x,sp
17471  2a2b 5c            	incw	x
17472  2a2c cd0000        	call	c_ltor
17474  2a2f ae00dc        	ldw	x,#L1207_dwDelayCnt
17475  2a32 cd0000        	call	c_lsub
17477  2a35 cd0000        	call	c_lrzmp
17479  2a38 270e          	jreq	L4512
17480                     ; 3865 		if(0 == dwDelayCnt)
17482  2a3a cd0000        	call	c_lzmp
17484  2a3d 260c          	jrne	L7407
17485                     ; 3867 			dwDelayCnt = GetSysTemTick();
17487  2a3f cd0000        	call	_GetSysTemTick
17489  2a42 ae00dc        	ldw	x,#L1207_dwDelayCnt
17490  2a45 cd0000        	call	c_rtol
17492                     ; 3868 			return ;
17493  2a48               L4512:
17496  2a48 5b04          	addw	sp,#4
17497  2a4a 81            	ret	
17498                     ; 3873 		return ;
17500  2a4b               L7407:
17501                     ; 3876 	LP_SetLowPwrStartFlg(LP_GPRS_FLG_OK);
17503  2a4b a601          	ld	a,#1
17504  2a4d cd0000        	call	_LP_SetLowPwrStartFlg
17506                     ; 3877 	M590_CloseConnect();
17508  2a50 cd117b        	call	_M590_CloseConnect
17510                     ; 3883 	if(KEY_WUAKEUP_FLG != (m_nWakeupReportFlg&KEY_WUAKEUP_FLG))
17512  2a53 720000a50d    	btjt	_m_nWakeupReportFlg,#0,L1507
17513                     ; 3885 		if(m_nDataRepSucFlg)
17515  2a58 c600be        	ld	a,_m_nDataRepSucFlg
17516  2a5b 2703          	jreq	L3507
17517                     ; 3887 			ReWriteRepFlg();
17519  2a5d cd1315        	call	_ReWriteRepFlg
17521  2a60               L3507:
17522                     ; 3889 		UpLinkSaveReportTime();
17524  2a60 cd00b5        	call	_UpLinkSaveReportTime
17527  2a63 200a          	jra	L5507
17528  2a65               L1507:
17529                     ; 3893 		m_nWakeupReportFlg &=(~(KEY_WUAKEUP_FLG));
17531  2a65 721100a5      	bres	_m_nWakeupReportFlg,#0
17532                     ; 3894 		SaveReportFlag(m_nWakeupReportFlg); 
17534  2a69 c600a5        	ld	a,_m_nWakeupReportFlg
17535  2a6c cd0000        	call	_SaveReportFlag
17537  2a6f               L5507:
17538                     ; 3897 	UC_SleepFunc(1000);
17540  2a6f ae03e8        	ldw	x,#1000
17541  2a72 89            	pushw	x
17542  2a73 5f            	clrw	x
17543  2a74 89            	pushw	x
17544  2a75 cd0760        	call	_UC_SleepFunc
17546  2a78 5b04          	addw	sp,#4
17547                     ; 3898 	g_nReportFlg  = FALSE;
17549  2a7a 725f00ad      	clr	_g_nReportFlg
17550                     ; 3899 	return ;
17552  2a7e 20c8          	jra	L4512
17585                     ; 3913 void SetReportIndex(u8 nDat)
17585                     ; 3914 {
17586                     	switch	.text
17587  2a80               _SetReportIndex:
17591                     ; 3915 	m_nRepIndex = nDat;
17593  2a80 c700bc        	ld	_m_nRepIndex,a
17594                     ; 3916 }
17597  2a83 81            	ret	
17621                     ; 3927 u8 GetReportFlag(void)
17621                     ; 3928 {
17622                     	switch	.text
17623  2a84               _GetReportFlag:
17627                     ; 3929 	return g_nReportFlg;
17629  2a84 c600ad        	ld	a,_g_nReportFlg
17632  2a87 81            	ret	
17656                     ; 3941 u8 GetReportFailFlag(void)
17656                     ; 3942 {
17657                     	switch	.text
17658  2a88               _GetReportFailFlag:
17662                     ; 3943 	return m_nWakeupReportFlg;
17664  2a88 c600a5        	ld	a,_m_nWakeupReportFlg
17667  2a8b 81            	ret	
17670                     	switch	.data
17671  00e0               L3117_nFailCnt:
17672  00e0 00            	dc.b	0
17721                     	switch	.const
17722  060a               L6612:
17723  060a 0001d4c0      	dc.l	120000
17724                     ; 3955 void fixTaskGsmProc(void)
17724                     ; 3956 {
17725                     	switch	.text
17726  2a8c               _fixTaskGsmProc:
17728  2a8c 5205          	subw	sp,#5
17729       00000005      OFST:	set	5
17732                     ; 3957 	s8 nResult = 0;	
17734  2a8e 0f05          	clr	(OFST+0,sp)
17735                     ; 3961 	m_nLedFlashFlg = TRUE;
17737  2a90 350100bf      	mov	_m_nLedFlashFlg,#1
17738                     ; 3965 	if(REPROT_TIMEOUT+g_dwCommDelay < GetSysTemTick())
17740  2a94 cd0000        	call	_GetSysTemTick
17742  2a97 96            	ldw	x,sp
17743  2a98 5c            	incw	x
17744  2a99 cd0000        	call	c_rtol
17746  2a9c ae00af        	ldw	x,#_g_dwCommDelay
17747  2a9f cd0000        	call	c_ltor
17749  2aa2 ae060a        	ldw	x,#L6612
17750  2aa5 cd0000        	call	c_ladd
17752  2aa8 96            	ldw	x,sp
17753  2aa9 5c            	incw	x
17754  2aaa cd0000        	call	c_lcmp
17756  2aad 2409          	jruge	L3417
17757                     ; 3967 		bNeedReport = FALSE;
17759  2aaf 725f0019      	clr	_tyGSMFlag
17760                     ; 3968 		M590_CloseConnect();
17762  2ab3 cd117b        	call	_M590_CloseConnect
17764                     ; 3969 		return ;
17766  2ab6 205d          	jra	L7417
17767  2ab8               L3417:
17768                     ; 3972 	switch (ucStatusGsm)			//发送数据
17770  2ab8 c600ce        	ld	a,_ucStatusGsm
17772                     ; 4020 		break;
17773  2abb a002          	sub	a,#2
17774  2abd 2712          	jreq	L7117
17775  2abf 4a            	dec	a
17776  2ac0 271b          	jreq	L1217
17777  2ac2 4a            	dec	a
17778  2ac3 274a          	jreq	L3217
17779                     ; 3974 	default:
17779                     ; 3975 		if(FALSE != M590_Init())
17781  2ac5 cd0e54        	call	_M590_Init
17783  2ac8 4d            	tnz	a
17784  2ac9 274a          	jreq	L7417
17785                     ; 3977 			ucStatusGsm = GSM_SHAKEHAND;
17787  2acb 350200ce      	mov	_ucStatusGsm,#2
17788  2acf 2044          	jra	L7417
17789  2ad1               L7117:
17790                     ; 3981 	case GSM_SHAKEHAND:		
17790                     ; 3982 		if(TRUE == (nResult = M590_HandShake()))
17792  2ad1 cd1051        	call	_M590_HandShake
17794  2ad4 4a            	dec	a
17795  2ad5 263e          	jrne	L7417
17796                     ; 3984 			ucStatusGsm = GSM_DAIL;
17798  2ad7 350300ce      	mov	_ucStatusGsm,#3
17799  2adb 2038          	jra	L7417
17800  2add               L1217:
17801                     ; 3988 	case GSM_DAIL:
17801                     ; 3989 		if(TRUE == M590_ConnectServer(m_nIpAddBk))
17803  2add c600bb        	ld	a,_m_nIpAddBk
17804  2ae0 cd1215        	call	_M590_ConnectServer
17806  2ae3 4a            	dec	a
17807  2ae4 2606          	jrne	L5517
17808                     ; 3991 			ucStatusGsm = GSM_SEND;
17810  2ae6 350400ce      	mov	_ucStatusGsm,#4
17812  2aea 2029          	jra	L7417
17813  2aec               L5517:
17814                     ; 3995 			nFailCnt++;
17816  2aec 725c00e0      	inc	L3117_nFailCnt
17817                     ; 3996 			if(TO_MAXCNT < nFailCnt)
17819  2af0 c600e0        	ld	a,L3117_nFailCnt
17820  2af3 a103          	cp	a,#3
17821  2af5 251e          	jrult	L7417
17822                     ; 3998 				nFailCnt = 0;
17824  2af7 725f00e0      	clr	L3117_nFailCnt
17825                     ; 4001 				if(FALSE == m_nIpAddBk)
17827  2afb c600bb        	ld	a,_m_nIpAddBk
17828  2afe 2606          	jrne	L3617
17829                     ; 4003 					m_nIpAddBk = TRUE;
17831  2b00 350100bb      	mov	_m_nIpAddBk,#1
17832                     ; 4004 					break;
17834  2b04 200f          	jra	L7417
17835  2b06               L3617:
17836                     ; 4006 				M590_CloseConnect();
17838  2b06 cd117b        	call	_M590_CloseConnect
17840                     ; 4007 				ucStatusGsm = GSM_SHAKEHAND;
17842  2b09 350200ce      	mov	_ucStatusGsm,#2
17843  2b0d 2006          	jra	L7417
17844  2b0f               L3217:
17845                     ; 4012 	case GSM_SEND:		//发送数据.3
17845                     ; 4013 #ifdef  JASON130_PTR   //130协议
17845                     ; 4014 		JASON_130TimeOutReUpLoad();
17847  2b0f cd27b3        	call	_JASON_130TimeOutReUpLoad
17849                     ; 4015 		JASON_130ProtolProc();
17851  2b12 cd26d5        	call	_JASON_130ProtolProc
17853                     ; 4020 		break;
17855  2b15               L7417:
17856                     ; 4022 	return ;
17859  2b15 5b05          	addw	sp,#5
17860  2b17 81            	ret	
17939                     	switch	.const
17940  060e               L2322:
17941  060e 0000003d      	dc.l	61
17942                     ; 4034 void fixTaskGsm(void)
17942                     ; 4035 {
17943                     	switch	.text
17944  2b18               _fixTaskGsm:
17946  2b18 5217          	subw	sp,#23
17947       00000017      OFST:	set	23
17950                     ; 4036 	s32 dwReport = 0, dwOffset = 0;	
17952  2b1a 96            	ldw	x,sp
17953  2b1b 5c            	incw	x
17954  2b1c cd0000        	call	c_ltor
17958  2b1f 96            	ldw	x,sp
17959  2b20 1c0005        	addw	x,#OFST-18
17960  2b23 cd0000        	call	c_ltor
17962                     ; 4040 	STM8_RTC_Get(&stReportTime);
17964  2b26 96            	ldw	x,sp
17965  2b27 1c0009        	addw	x,#OFST-14
17966  2b2a cd0000        	call	_STM8_RTC_Get
17968                     ; 4041 	TM_TimeChangeAToB(&stReportTime,&stTimeNowTm);
17970  2b2d 96            	ldw	x,sp
17971  2b2e 1c0010        	addw	x,#OFST-7
17972  2b31 89            	pushw	x
17973  2b32 1d0007        	subw	x,#7
17974  2b35 cd0000        	call	_TM_TimeChangeAToB
17976  2b38 c600a5        	ld	a,_m_nWakeupReportFlg
17977  2b3b a50f          	bcp	a,#15
17978  2b3d 85            	popw	x
17979                     ; 4044 	if((FALSE != (m_nWakeupReportFlg&REPORT_FLG))
17979                     ; 4045 		||FALSE == TM_IsValidTimePro(&stLastReportT)
17979                     ; 4046 		||(2015 >= stTimeNowTm.wYear)||(TRUE == g_OptValveRepFlg)
17979                     ; 4047 #ifdef PURCHASE_MODE
17979                     ; 4048 		|| (OWED_STAT_FLG == (tyParameter.nOverBuyFlg&(OWED_REP_SUCC|OWED_REP_FAIL|OWED_STAT_FLG)))
17979                     ; 4049 #endif
17979                     ; 4050 		||((ALARM_MASK&ALM_GetBatStatus()&&(MAX_REP_TIMES > g_nAlmRepFailCnt)&&(ALARM_REP_FLG != (ALARM_REP_FLG&g_nGuardEnFlg)))))
17981  2b3e 262a          	jrne	L5127
17983  2b40 ae000a        	ldw	x,#_stLastReportT
17984  2b43 cd0000        	call	_TM_IsValidTimePro
17986  2b46 4d            	tnz	a
17987  2b47 2721          	jreq	L5127
17989  2b49 1e10          	ldw	x,(OFST-7,sp)
17990  2b4b a307e0        	cpw	x,#2016
17991  2b4e 251a          	jrult	L5127
17993  2b50 c600ae        	ld	a,_g_OptValveRepFlg
17994  2b53 4a            	dec	a
17995  2b54 2714          	jreq	L5127
17997  2b56 cd0000        	call	_ALM_GetBatStatus
17999  2b59 5f            	clrw	x
18000  2b5a 97            	ld	xl,a
18001  2b5b 5d            	tnzw	x
18002  2b5c 271c          	jreq	L3127
18004  2b5e c60000        	ld	a,_g_nAlmRepFailCnt
18005  2b61 a103          	cp	a,#3
18006  2b63 2415          	jruge	L3127
18008  2b65 7202000010    	btjt	_g_nGuardEnFlg,#1,L3127
18009  2b6a               L5127:
18010                     ; 4052 		g_nReportFlg  = TRUE;
18012  2b6a 350100ad      	mov	_g_nReportFlg,#1
18013                     ; 4053 	    m_nUploadMode = OTHER_REP;
18015  2b6e 725f00c3      	clr	_m_nUploadMode
18016                     ; 4054 		fixTaskGsmProc();
18018  2b72               LC065:
18020  2b72 cd2a8c        	call	_fixTaskGsmProc
18023  2b75               L5227:
18024                     ; 4106 	ReportTimeOutPro();
18026  2b75 cd2a16        	call	_ReportTimeOutPro
18028                     ; 4107 	return ;
18030  2b78 2053          	jra	L6422
18031  2b7a               L3127:
18032                     ; 4059 		if(FALSE == g_nReportFlg)
18034  2b7a c600ad        	ld	a,_g_nReportFlg
18035  2b7d 2659          	jrne	L7227
18036                     ; 4061 			dwReport = ClaReportTimeToSec(tyReport.cycle);
18038  2b7f c600c4        	ld	a,_tyReport+3
18039  2b82 cd003a        	call	_ClaReportTimeToSec
18041  2b85 96            	ldw	x,sp
18042  2b86 5c            	incw	x
18043  2b87 cd0000        	call	c_rtol
18045                     ; 4062 			dwOffset = TM_DiffSecond(&stLastReportT, &stTimeNowTm);
18047  2b8a 96            	ldw	x,sp
18048  2b8b 1c0010        	addw	x,#OFST-7
18049  2b8e 89            	pushw	x
18050  2b8f ae000a        	ldw	x,#_stLastReportT
18051  2b92 cd0000        	call	_TM_DiffSecond
18053  2b95 85            	popw	x
18054  2b96 96            	ldw	x,sp
18055  2b97 1c0005        	addw	x,#OFST-18
18056  2b9a cd0000        	call	c_rtol
18058                     ; 4064 			if((60 < (dwOffset%dwReport)) ||
18058                     ; 4065 				((TRUE == ReadRecord(0, (u8*)&tyRecord, sizeof(tyRecord)))&&(FALSE == tyRecord.nRepFlg)))
18060  2b9d 96            	ldw	x,sp
18061  2b9e 1c0005        	addw	x,#OFST-18
18062  2ba1 cd0000        	call	c_ltor
18064  2ba4 96            	ldw	x,sp
18065  2ba5 5c            	incw	x
18066  2ba6 cd0000        	call	c_lmod
18068  2ba9 ae060e        	ldw	x,#L2322
18069  2bac cd0000        	call	c_lcmp
18071  2baf 2e14          	jrsge	L3327
18073  2bb1 4b10          	push	#16
18074  2bb3 ae0000        	ldw	x,#_tyRecord
18075  2bb6 89            	pushw	x
18076  2bb7 4f            	clr	a
18077  2bb8 cd0000        	call	_ReadRecord
18079  2bbb 5b03          	addw	sp,#3
18080  2bbd 4a            	dec	a
18081  2bbe 2610          	jrne	L1327
18083  2bc0 c6000f        	ld	a,_tyRecord+15
18084  2bc3 260b          	jrne	L1327
18085  2bc5               L3327:
18086                     ; 4067 				LP_SetLowPwrStartFlg(LP_GPRS_FLG_OK);
18088  2bc5 a601          	ld	a,#1
18089  2bc7 cd0000        	call	_LP_SetLowPwrStartFlg
18091                     ; 4070 				M590_CloseConnect();
18093  2bca cd117b        	call	_M590_CloseConnect
18095                     ; 4071 				return ;
18096  2bcd               L6422:
18099  2bcd 5b17          	addw	sp,#23
18100  2bcf 81            	ret	
18101  2bd0               L1327:
18102                     ; 4075 				m_nUploadMode = TIME_DAT_REP;
18104  2bd0 a601          	ld	a,#1
18105  2bd2 c700c3        	ld	_m_nUploadMode,a
18106                     ; 4076 				g_nReportFlg  = TRUE;
18108  2bd5 c700ad        	ld	_g_nReportFlg,a
18109  2bd8               L7227:
18110                     ; 4079 		if(TRUE == g_nReportFlg)
18112  2bd8 4a            	dec	a
18113  2bd9 269a          	jrne	L5227
18114                     ; 4081 			fixTaskGsmProc();
18116  2bdb 2095          	jp	LC065
18153                     ; 4119 void InitializeGsm(void)
18153                     ; 4120 {	
18154                     	switch	.text
18155  2bdd               _InitializeGsm:
18159                     ; 4121 	tyGSMFlag = 0xFF;
18161  2bdd 35ff0019      	mov	_tyGSMFlag,#255
18162                     ; 4122 	ucStatusGsm    = GSM_INIT;
18164  2be1 350100ce      	mov	_ucStatusGsm,#1
18165                     ; 4123 	ucStepGsm      = 0;
18167  2be5 725f00cd      	clr	_ucStepGsm
18168                     ; 4124 	m_nGprsStep    = INIT_PWR_ON;
18170  2be9 350100a6      	mov	_m_nGprsStep,#1
18171                     ; 4125 	stRepFail.wError = 0;
18173  2bed 5f            	clrw	x
18174  2bee cf0006        	ldw	_stRepFail+6,x
18175                     ; 4127 	m_nWakeupReportFlg = ReadReportFlag();
18177  2bf1 cd0000        	call	_ReadReportFlag
18179  2bf4 c700a5        	ld	_m_nWakeupReportFlg,a
18180                     ; 4128 	ReadGroup(1, ADDRESS_GUARD_EN, &g_nGuardEnFlg);
18182  2bf7 ae0000        	ldw	x,#_g_nGuardEnFlg
18183  2bfa 89            	pushw	x
18184  2bfb ae1000        	ldw	x,#4096
18185  2bfe 89            	pushw	x
18186  2bff a601          	ld	a,#1
18187  2c01 cd0000        	call	_ReadGroup
18189  2c04 5b04          	addw	sp,#4
18190                     ; 4129 	g_nAlmRepFailCnt = (g_nGuardEnFlg>>6);
18192  2c06 c60000        	ld	a,_g_nGuardEnFlg
18193  2c09 4e            	swap	a
18194  2c0a a40c          	and	a,#12
18195  2c0c 44            	srl	a
18196  2c0d 44            	srl	a
18197  2c0e c70000        	ld	_g_nAlmRepFailCnt,a
18198                     ; 4132 	JASON_130InitializeGsm();
18200  2c11 cd2815        	call	_JASON_130InitializeGsm
18202                     ; 4138 	if(FALSE == ReadParameterForType((u8 *)&stOptValve, OPTVALVE_LEN, OPT_VALVE_PRAA))
18204  2c14 4b06          	push	#6
18205  2c16 4b0a          	push	#10
18206  2c18 ae0000        	ldw	x,#_stOptValve
18207  2c1b cd0000        	call	_ReadParameterForType
18209  2c1e 4d            	tnz	a
18210  2c1f 85            	popw	x
18211  2c20 2618          	jrne	L1527
18212                     ; 4140 		stOptValve.nOptFlg    = CTL_VAVLE_ENABLE;
18214  2c22 35aa0001      	mov	_stOptValve+1,#170
18215                     ; 4141 		stOptValve.nEnableFlg = CTL_VAVLE_ENABLE;
18217  2c26 35aa0000      	mov	_stOptValve,#170
18218                     ; 4142 		stOptValve.nStartHour = 0x02;
18220  2c2a 35020005      	mov	_stOptValve+5,#2
18221                     ; 4143 		stOptValve.nEndHour   = 0x04;
18223  2c2e 35040006      	mov	_stOptValve+6,#4
18224                     ; 4144 		stOptValve.nVavleStat = 0;
18226  2c32 725f0007      	clr	_stOptValve+7
18227                     ; 4145 		stOptValve.nVavleCycle= 0;
18229  2c36 725f0009      	clr	_stOptValve+9
18230  2c3a               L1527:
18231                     ; 4148 	if((MAX_REP_TIMES > stOptValve.nRepFailCnt)&&(CTL_VALVE_OVER == stOptValve.nOptFlg))
18233  2c3a c60008        	ld	a,_stOptValve+8
18234  2c3d a103          	cp	a,#3
18235  2c3f 240c          	jruge	L3527
18237  2c41 c60001        	ld	a,_stOptValve+1
18238  2c44 a1ee          	cp	a,#238
18239  2c46 2605          	jrne	L3527
18240                     ; 4150 		g_OptValveRepFlg = TRUE;
18242  2c48 350100ae      	mov	_g_OptValveRepFlg,#1
18245  2c4c 81            	ret	
18246  2c4d               L3527:
18247                     ; 4152 	else if(MAX_REP_TIMES <= stOptValve.nRepFailCnt)
18249  2c4d c60008        	ld	a,_stOptValve+8
18250  2c50 a103          	cp	a,#3
18251  2c52 2508          	jrult	L5527
18252                     ; 4154 		stOptValve.nOptFlg = 0;   /* 超出上报次数后，认为上报成功不在上报 */ 
18254  2c54 725f0001      	clr	_stOptValve+1
18255                     ; 4155 		stOptValve.nRepFailCnt = 0;
18257  2c58 725f0008      	clr	_stOptValve+8
18258  2c5c               L5527:
18259                     ; 4157 	return ;
18262  2c5c 81            	ret	
18686                     	xdef	_fixTaskGsmProc
18687                     	xdef	_ReportTimeOutPro
18688                     	xdef	_JASON_130InitializeGsm
18689                     	xdef	_JASON_130TimeOutReUpLoad
18690                     	xdef	_JASON_130OnlineCtl
18691                     	xdef	_JASON_130ProtolProc
18692                     	xdef	_AddressComparePro
18693                     	xdef	_Online
18694                     	xdef	_AutoReportMakeFrame
18695                     	xdef	_FreezeUnitTransform
18696                     	xdef	_TermReportReplyPro
18697                     	xdef	_M590_ConnectServer
18698                     	xdef	_M590_HandShake
18699                     	xdef	_M590_Init
18700                     	xdef	_AT_CmdFailProc
18701                     	xdef	_SIMGetRegisterStat
18702                     	xdef	_UC_CommATExt
18703                     	xdef	_QH_SearchStrVal
18704                     	xdef	_QH_bufbuf
18705                     	xdef	_UC_SleepProc
18706                     	xdef	_UC_SetSleepCnt
18707                     	xdef	_PackAtCmdExt
18708                     	xdef	_PackTcpSendData
18709                     	xdef	_PackAtCmdTcpsend
18710                     	xdef	_PackAtCmdParameter3
18711                     	xdef	_PackAtCmdParameter2
18712                     	xdef	_PackAtCmdParameter
18713                     	xdef	_PackAtCmd
18714                     	xdef	_JX_StringCat
18715                     	xdef	_JX_Strlen
18716                     	xdef	_AlmMakeFrame
18717                     	xdef	_BatteryVolRepPro
18718                     	xdef	_UpLinkSaveReportTime
18719                     	xdef	_MeterTnNumTransform
18720                     	xdef	_VavleStatTransform
18721                     	xdef	_UC_CommAT
18722                     	xdef	_SIMGL868_GetCCID
18723                     	xdef	_g_nOwedRepFlg
18724                     	xdef	_m_nAlmRepFlg
18725                     	xdef	_m_nUploadMode
18726                     	xdef	_m_nGmTn_2
18727                     	xdef	_m_nGmTn_1
18728                     	xdef	_m_nMasterType
18729                     	xdef	_m_nLedFlashFlg
18730                     	xdef	_m_nDataRepSucFlg
18731                     	xdef	_m_nRepIndex
18732                     	xdef	_m_nIpAddBk
18733                     	xdef	_g_BatRepFlg
18734                     	xdef	_g_nReportFlg
18735                     	xdef	_m_dwTimeCnt
18736                     	xdef	_m_nGprsStep
18737                     	xdef	_m_nWakeupReportFlg
18738                     	xdef	_m_nCcidBuf
18739                     	xdef	_m_nPtrcoVerBuf
18740                     	xdef	_aucAtPPortBk
18741                     	xdef	_aucAtPServerBk
18742                     	xdef	_g_nPwdBuf
18743                     	xdef	_g_nUsrBuf
18744                     	xref	_ALM_ClrAlmStatus
18745                     	xref	_ALM_SetAlmStatus
18746                     	xref	_BAT_GetBatVol
18747                     	xref	_ALM_GetBatStatus
18748                     	xref	_g_nAlmRepFailCnt
18749                     	xref	_g_nGuardEnFlg
18750                     	xref	_g_dwBatNoLoadVol
18751                     	xref	_g_dwBatVol
18752                     	xref	_LP_SetLowPwrStartFlg
18753                     	xref	_STM8_RTC_Set
18754                     	xref	_STM8_RTC_Get
18755                     	xref	_stRepFail
18756                     	xref	_tyRecord
18757                     	xref	_ReadAlmRecord
18758                     	xref	_AddAlmRecord
18759                     	xref	_EditRecord
18760                     	xref	_SaveByte
18761                     	xref	_ReadGroup
18762                     	xref	_ReadReportFlag
18763                     	xref	_SaveReportFlag
18764                     	xref	_SaveParameterForType
18765                     	xref	_ReadParameterForType
18766                     	xref	_ReadRecord
18767                     	xdef	_RepPizeometerMakeFrame
18768                     	xdef	_GetIsmiCcidDat
18769                     	xdef	_GetGprsConntStat
18770                     	xdef	_GetOnLineStatus
18771                     	xdef	_GetLedFlg
18772                     	xdef	_FrameSendFunc
18773                     	xdef	_M590_CloseConnect
18774                     	xdef	_M590_TcpSendDatLen
18775                     	xdef	_SetLogonMode
18776                     	xdef	_WatitDataSendOk
18777                     	xdef	_ClaReportTimeToSec
18778                     	xdef	_SetReportIndex
18779                     	xdef	_GetReportFailFlag
18780                     	xdef	_ReWriteRepFlg
18781                     	xdef	_GetTermReportTime
18782                     	xdef	_UC_SleepFunc
18783                     	xdef	_Protol130Send
18784                     	xdef	_Protol130Handle
18785                     	xdef	_DecodeParameter
18786                     	xdef	_InitializeGsm
18787                     	xdef	_fixTaskGsm
18788                     	xdef	_GetReportFlag
18789                     	xdef	_g_dwTmAddress
18790                     	xdef	_g_OptValveRepFlg
18791                     	xdef	_g_nSignal
18792                     	xdef	_g_wTmReportCnt
18793                     	xdef	_aucAtPPort1
18794                     	xdef	_aucAtPServer1
18795                     	xdef	_g_dwCommDelay
18796                     	xdef	_m_nImsiBufXJ
18797                     	xdef	_m_nImsiBuf
18798                     	xdef	_m_nVerBuf
18799                     	xdef	_g_nApnType
18800                     	xdef	_m_nRepFailFlg
18801                     	xdef	_g_nDatRepCnt
18802                     	xdef	_m_nRepEnableFlg
18803                     	xdef	_g_dwRepTick
18804                     	switch	.bss
18805  0000               _stOptValve:
18806  0000 000000000000  	ds.b	10
18807                     	xdef	_stOptValve
18808  000a               _stLastReportT:
18809  000a 000000000000  	ds.b	8
18810                     	xdef	_stLastReportT
18811  0012               _stTimeNow:
18812  0012 000000000000  	ds.b	7
18813                     	xdef	_stTimeNow
18814                     	xdef	_g_nApnBuf
18815                     	xref	_ClearRxBuffUnUsedLen
18816                     	xref	_GetUartRxBuf
18817                     	xref	_ClearRxBuff
18818                     	xref	_CheckRevDataLen
18819                     	xref	_TurnBusUartOn
18820                     	xref	_StartSendBusUartGroup
18821                     	xref	_SetBusUart
18822                     	xref	_SetTmDebugModeStat
18823                     	xref	_FeedSoftWareIwdg
18824                     	xref	_GetTmDebugModeStat
18825                     	xdef	_SIMGK7M_GetCIMI
18826                     	xdef	_SIMGL868_UpdateSignal
18827  0019               _tyGSMFlag:
18828  0019 00            	ds.b	1
18829                     	xdef	_tyGSMFlag
18830                     	xref	_aucUartTxBuffer
18831                     	xref	_tyParameter
18832  001a               _tyReportParameter:
18833  001a 000000000000  	ds.b	12
18834                     	xdef	_tyReportParameter
18835  0026               _tyProtol130:
18836  0026 000000000000  	ds.b	128
18837                     	xdef	_tyProtol130
18838  00a6               _tyGprs:
18839  00a6 000000000000  	ds.b	22
18840                     	xdef	_tyGprs
18841  00bc               _ucErrorGsm:
18842  00bc 00            	ds.b	1
18843                     	xdef	_ucErrorGsm
18844  00bd               _tyTimerReport:
18845  00bd 00000000      	ds.b	4
18846                     	xdef	_tyTimerReport
18847  00c1               _tyReport:
18848  00c1 000000000000  	ds.b	11
18849                     	xdef	_tyReport
18850  00cc               _ucStepReveive:
18851  00cc 00            	ds.b	1
18852                     	xdef	_ucStepReveive
18853  00cd               _ucStepGsm:
18854  00cd 00            	ds.b	1
18855                     	xdef	_ucStepGsm
18856  00ce               _ucStatusGsm:
18857  00ce 00            	ds.b	1
18858                     	xdef	_ucStatusGsm
18859  00cf               _nLogonModeBk:
18860  00cf 00            	ds.b	1
18861                     	xdef	_nLogonModeBk
18862  00d0               _ucLogonMode:
18863  00d0 00            	ds.b	1
18864                     	xdef	_ucLogonMode
18865  00d1               _ucNumberMessage:
18866  00d1 00            	ds.b	1
18867                     	xdef	_ucNumberMessage
18868                     	xdef	_aucAtRCmd
18869                     	xdef	_aucAtCmd
18870                     	xdef	_aucAtShutDown
18871                     	xdef	_aucAtMytimeupdate
18872                     	xdef	_aucAtMylacid
18873                     	xdef	_aucAtMycged
18874                     	xdef	_aucAtTcpsends
18875                     	xdef	_aucAtTcprecv_S
18876                     	xdef	_aucAtTcplisten
18877                     	xdef	_aucAtSignal
18878                     	xdef	_aucAtGprsstatus
18879                     	xdef	_aucAtCloselisten
18880                     	xdef	_aucAtCloseclient
18881                     	xdef	_aucAtClientstatus
18882                     	xdef	_aucAtFtpstatus
18883                     	xdef	_aucAtFtpput
18884                     	xdef	_aucAtFtplogout
18885                     	xdef	_aucAtFtplogin
18886                     	xdef	_aucAtFtpget
18887                     	xdef	_aucAtDnsserver
18888                     	xdef	_aucAtDns
18889                     	xdef	_aucAtXisp
18890                     	xdef	_aucAtXiic
18891                     	xdef	_aucAtUdpsetup
18892                     	xdef	_aucAtUdpsend
18893                     	xdef	_aucAtUdprecv
18894                     	xdef	_aucAtUdpclose
18895                     	xdef	_aucAtTcpclose
18896                     	xdef	_aucAtXgauth
18897                     	xdef	_aucAtTcpsetup
18898                     	xdef	_aucAtTcpsend
18899                     	xdef	_aucAtTcprecv
18900                     	xdef	_aucAtIpstatus
18901                     	xdef	_aucAtCusd
18902                     	xdef	_aucAtCgatt
18903                     	xdef	_aucAtPdpUn
18904                     	xdef	_aucAtPdpCm
18905                     	xdef	_aucAtCpbw
18906                     	xdef	_aucAtCpbs
18907                     	xdef	_aucAtCpbr
18908                     	xdef	_aucAtCpbf
18909                     	xdef	_aucAtCnum
18910                     	xdef	_aucAtCsms
18911                     	xdef	_aucAtCsmp
18912                     	xdef	_aucAtCsdh
18913                     	xdef	_aucAtCscs
18914                     	xdef	_aucAtCscb
18915                     	xdef	_aucAtCsca
18916                     	xdef	_aucAtCpms
18917                     	xdef	_aucAtCnmi
18918                     	xdef	_aucAtCmss
18919                     	xdef	_aucAtCmgw
18920                     	xdef	_aucAtCmgs
18921                     	xdef	_aucAtCmgr
18922                     	xdef	_aucAtCmgl
18923                     	xdef	_aucAtCmgf
18924                     	xdef	_aucAtCmgd
18925                     	xdef	_aucAtXbandsel
18926                     	xdef	_aucAtCsq
18927                     	xdef	_aucAtCops
18928                     	xdef	_aucAtIpr
18929                     	xdef	_aucAtIcf
18930                     	xdef	_aucAtEnpwrsavE
18931                     	xdef	_aucAtCreg
18932                     	xdef	_aucAtCpwroff
18933                     	xdef	_aucAtCpwd
18934                     	xdef	_aucAtCpin
18935                     	xdef	_aucAtCpas
18936                     	xdef	_aucAtCmux
18937                     	xdef	_aucAtCmee
18938                     	xdef	_aucAtClck
18939                     	xdef	_aucAtCipstatus
18940                     	xdef	_aucAtCfun
18941                     	xdef	_aucAtCeer
18942                     	xdef	_aucAtCclk
18943                     	xdef	_aucAtGetvers
18944                     	xdef	_aucAtCimi
18945                     	xdef	_aucAtCgsn
18946                     	xdef	_aucAtCgmm
18947                     	xdef	_aucAtCgmi
18948                     	xdef	_aucAtCcid
18949                     	xdef	_aucAtI
18950                     	xdef	_aucAtS_D
18951                     	xdef	_aucAtS_O
18952                     	xdef	_aucAtS_Plus
18953                     	xdef	_aucAtS_D2
18954                     	xdef	_aucATS_W
18955                     	xdef	_aucATS_V
18956                     	xdef	_aucATS_E
18957                     	xdef	_aucATS_A
18958                     	xdef	_aucAtNull
18959                     	xdef	_aucAtInit
18960                     	xdef	_aucAtrError
18961                     	xdef	_aucAtrIpr
18962                     	xdef	_aucAtrTcpclose
18963                     	xdef	_aucAtrTcprecv
18964                     	xdef	_aucAtrTcpsend
18965                     	xdef	_aucAtrTcpsetup
18966                     	xdef	_aucAtrXiic
18967                     	xdef	_aucAtrOk
18968                     	xdef	_aucAtrNeoway
18969                     	xdef	_aucAtrCreg
18970                     	xdef	_aucAtrCpinReady
18971                     	xdef	_aucAtrCclk
18972                     	xdef	_aucAtrPppFail
18973                     	xdef	_aucAtrInit
18974                     	xdef	_aucAtPPort2
18975                     	xdef	_aucAtPTimeServer2
18976                     	xdef	_aucAtPTimeServer1
18977                     	xdef	_aucAtPBaudrate
18978                     	xdef	_aucAtPAscii_Equal0
18979                     	xdef	_aucAtPAscii_Equal1
18980                     	xdef	_aucAtPAscii_0
18981                     	xdef	_aucAtPAscii_1
18982                     	xdef	_aucAtPAscii_Question
18983                     	xref	_GM_GetGatherMeterFlg
18984                     	xref	_JX_BcdToDWORD
18985                     	xref	_JX_DWORDToBCD
18986                     	xref	_JX_BcdStrTo16BitBcd
18987                     	xref	_JX_BcdStrTo16BitBin
18988                     	xref	_JX_HexToASCII
18989                     	xref	_JX_U32ToStr
18990                     	xref	_JX_ByteToBcd
18991                     	xref	_JX_IpAddrToStr
18992                     	xref	_TM_CalPastedSeconds
18993                     	xref	_TM_RTimeDecnMinute
18994                     	xref	_TM_DiffSecond
18995                     	xref	_TM_TimeChangeBToA
18996                     	xref	_TM_TimeChangeAToB
18997                     	xref	_TM_IsValidTimePro
18998                     	xref	_JX_AddSum8Bit
18999                     	xref	_JX_BL_DwordChange
19000                     	xref	_JX_BL_Change
19001                     	xref	_MemcpyFunc
19002                     	xref	_MemsetFunc
19003                     	xref	_delay_ms
19004                     	xref	_GetBoardVavleStat
19005                     	xref	_MODBUS_GetPizeometer
19006                     	xref	_CJ_T188ProtocolReadAdd
19007                     	xref	_VavleOperateFun
19008                     	xref	_GatherMeterFun
19009                     	xref	_GetSysTemTick
19010                     	xref	_g_nValveStat
19011                     	xref	_GPIO_WriteBit
19012                     	switch	.const
19013  0612               L3476:
19014  0612 2200          	dc.b	34,0
19015  0614               L1054:
19016  0614 4c696e6b2043  	dc.b	"Link Closed",0
19017  0620               L7444:
19018  0620 434f4e4e4543  	dc.b	"CONNECT FAIL",0
19019  062d               L5444:
19020  062d 414c52454144  	dc.b	"ALREADY CONNECT",0
19021  063d               L3444:
19022  063d 434f4e4e4543  	dc.b	"CONNECT OK",0
19023  0648               L1234:
19024  0648 524541445900  	dc.b	"READY",0
19025  064e               L7314:
19026  064e 383900        	dc.b	"89",0
19027  0651               L1014:
19028  0651 343600        	dc.b	"46",0
19029  0654               L3404:
19030  0654 2b4353513a00  	dc.b	"+CSQ:",0
19031  065a               L7004:
19032  065a 2b435245473a  	dc.b	"+CREG: 0,5",0
19033  0665               L5004:
19034  0665 2b435245473a  	dc.b	"+CREG: 0,1",0
19035  0670               L1104:
19036  0670 4552524f5200  	dc.b	"ERROR",0
19037  0676               L7744:
19038  0676 3e00          	dc.b	">",0
19039  0678               L3134:
19040  0678 4f4b00        	dc.b	"OK",0
19041                     	xref.b	c_lreg
19042                     	xref.b	c_x
19043                     	xref.b	c_y
19063                     	xref	c_lmod
19064                     	xref	c_lrzmp
19065                     	xref	c_uitolx
19066                     	xref	c_lzmp
19067                     	xref	c_jltab
19068                     	xref	c_lumd
19069                     	xref	c_ludv
19070                     	xref	c_uitol
19071                     	xref	c_itolx
19072                     	xref	c_lsbc
19073                     	xref	c_ladd
19074                     	xref	c_smul
19075                     	xref	c_lsub
19076                     	xref	c_lcmp
19077                     	xref	c_sdivx
19078                     	xref	c_smodx
19079                     	xref	c_xymvx
19080                     	xref	c_ltor
19081                     	xref	c_rtol
19082                     	xref	c_lmul
19083                     	end
