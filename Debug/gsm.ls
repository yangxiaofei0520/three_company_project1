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
2747                     	switch	.data
2748  0000               _g_nSignal:
2749  0000 00            	dc.b	0
2750  0001               _g_nApnBuf:
2751  0001 22434d4e4554  	dc.b	34,67,77,78,69,84
2752  0007 2200          	dc.b	34,0
2753  0009 000000000000  	ds.b	12
2754  0015               _g_nUsrBuf:
2755  0015 2247534d2200  	dc.b	34,71,83,77,34,0
2756  001b 000000000000  	ds.b	10
2757  0025               _g_nPwdBuf:
2758  0025 223132333422  	dc.b	34,49,50,51,52,34,0
2759  002c 000000000000  	ds.b	9
2760  0035               _aucAtPServer1:
2761  0035 223138332e36  	dc.b	34,49,56,51,46,54
2762  003b 322e3233322e  	dc.b	"2.232.21",34,0
2763  0045 00000000      	ds.b	4
2764  0049               _aucAtPPort1:
2765  0049 223330303432  	dc.b	34,51,48,48,52,50
2766  004f 2200          	dc.b	34,0
2767  0051               _aucAtPServerBk:
2768  0051 223138332e36  	dc.b	34,49,56,51,46,54
2769  0057 322e3233322e  	dc.b	"2.232.21",34,0
2770  0061 00000000      	ds.b	4
2771  0065               _aucAtPPortBk:
2772  0065 223330303432  	dc.b	34,51,48,48,52,50
2773  006b 2200          	dc.b	34,0
2774                     	switch	.const
2775  0447               _m_nVerBuf:
2776  0447 56            	dc.b	86
2777  0448 31            	dc.b	49
2778  0449 2e            	dc.b	46
2779  044a 31            	dc.b	49
2780  044b 2e            	dc.b	46
2781  044c 30            	dc.b	48
2782  044d 20            	dc.b	32
2783  044e 20            	dc.b	32
2784  044f 31            	dc.b	49
2785  0450 38            	dc.b	56
2786  0451 30            	dc.b	48
2787  0452 31            	dc.b	49
2788  0453 30            	dc.b	48
2789  0454 35            	dc.b	53
2790  0455 30            	dc.b	48
2791  0456 31            	dc.b	49
2792  0457               _m_nPtrcoVerBuf:
2793  0457 56322e333200  	dc.b	"V2.32",0
2794  045d 0000          	ds.b	2
2795                     	switch	.data
2796  006d               _m_nCcidBuf:
2797  006d 00            	dc.b	0
2798  006e 000000000000  	ds.b	23
2799  0085               _m_nImsiBuf:
2800  0085 00            	dc.b	0
2801  0086 000000000000  	ds.b	23
2802  009d               _m_nImsiBufXJ:
2803  009d 00            	dc.b	0
2804  009e 000000000000  	ds.b	7
2805  00a5               _m_nWakeupReportFlg:
2806  00a5 00            	dc.b	0
2807  00a6               _m_nGprsStep:
2808  00a6 00            	dc.b	0
2809  00a7               _m_dwTimeCnt:
2810  00a7 00000000      	dc.l	0
2811  00ab               _g_wTmReportCnt:
2812  00ab 0000          	dc.w	0
2813  00ad               _g_nReportFlg:
2814  00ad 00            	dc.b	0
2815  00ae               _g_OptValveRepFlg:
2816  00ae 00            	dc.b	0
2817  00af               _g_dwCommDelay:
2818  00af 00000000      	dc.l	0
2819  00b3               _g_BatRepFlg:
2820  00b3 01            	dc.b	1
2821  00b4               _g_nDatRepCnt:
2822  00b4 00            	dc.b	0
2823  00b5               _g_dwRepTick:
2824  00b5 00000000      	dc.l	0
2825  00b9               _g_nApnType:
2826  00b9 00            	dc.b	0
2827  00ba               _m_nRepEnableFlg:
2828  00ba 01            	dc.b	1
2829  00bb               _m_nIpAddBk:
2830  00bb 00            	dc.b	0
2831  00bc               _m_nRepIndex:
2832  00bc 00            	dc.b	0
2833  00bd               _m_nRepFailFlg:
2834  00bd 01            	dc.b	1
2835  00be               _m_nDataRepSucFlg:
2836  00be 00            	dc.b	0
2837  00bf               _m_nLedFlashFlg:
2838  00bf 00            	dc.b	0
2839  00c0               _m_nMasterType:
2840  00c0 00            	dc.b	0
2841  00c1               _m_nGmTn_1:
2842  00c1 01            	dc.b	1
2843  00c2               _m_nGmTn_2:
2844  00c2 00            	dc.b	0
2845  00c3               _m_nUploadMode:
2846  00c3 00            	dc.b	0
2847  00c4               _m_nAlmRepFlg:
2848  00c4 00            	dc.b	0
2849  00c5               _g_dwTmAddress:
2850  00c5 00000001      	dc.l	1
2851  00c9               _g_nOwedRepFlg:
2852  00c9 01            	dc.b	1
2853  00ca               L1071_m_nCnt:
2854  00ca 00            	dc.b	0
2909                     ; 185 void  VavleStatTransform(u8 nMasterType, u8 nOldMastVavle, u8* pnNewVavleStat)
2909                     ; 186 {
2911                     	switch	.text
2912  0000               _VavleStatTransform:
2914  0000 89            	pushw	x
2915       00000000      OFST:	set	0
2918                     ; 188 	if(MASTER_NEW == nMasterType)
2920  0001 9e            	ld	a,xh
2921  0002 4a            	dec	a
2922  0003 2615          	jrne	L3371
2923                     ; 190 		if(OLD_VAVLE_CLOSE == nOldMastVavle)
2925  0005 9f            	ld	a,xl
2926  0006 a108          	cp	a,#8
2927  0008 2606          	jrne	L5371
2928                     ; 192 			(*pnNewVavleStat) = VALVE_CLOSE;
2930  000a 1e05          	ldw	x,(OFST+5,sp)
2931  000c a601          	ld	a,#1
2933  000e 2009          	jp	LC001
2934  0010               L5371:
2935                     ; 194 		else if(OLD_VAVLE_ERROR == nOldMastVavle)
2937  0010 7b02          	ld	a,(OFST+2,sp)
2938  0012 4c            	inc	a
2939  0013 2605          	jrne	L3371
2940                     ; 196 			(*pnNewVavleStat) = VALVE_ERROR;
2942  0015 1e05          	ldw	x,(OFST+5,sp)
2943  0017 a603          	ld	a,#3
2944  0019               LC001:
2945  0019 f7            	ld	(x),a
2946  001a               L3371:
2947                     ; 199 }
2950  001a 85            	popw	x
2951  001b 81            	ret	
3004                     ; 209 void  MeterTnNumTransform(u8 nMasterType, u8 *pnNum1, u8 *pnNum2)
3004                     ; 210 {
3005                     	switch	.text
3006  001c               _MeterTnNumTransform:
3008  001c 88            	push	a
3009       00000000      OFST:	set	0
3012                     ; 212 	if(MASTER_NEW == nMasterType)
3014  001d 4a            	dec	a
3015  001e 2609          	jrne	L7671
3016                     ; 214 		(*pnNum1) = 0x01;
3018  0020 1e04          	ldw	x,(OFST+4,sp)
3019  0022 4c            	inc	a
3020  0023 f7            	ld	(x),a
3021                     ; 215 		(*pnNum2) = 0x01;
3023  0024 1e06          	ldw	x,(OFST+6,sp)
3024  0026 f7            	ld	(x),a
3026  0027 2008          	jra	L1771
3027  0029               L7671:
3028                     ; 219 		(*pnNum1) = 0x01;
3030  0029 1e04          	ldw	x,(OFST+4,sp)
3031  002b a601          	ld	a,#1
3032  002d f7            	ld	(x),a
3033                     ; 220 		(*pnNum2) = 0x00;
3035  002e 1e06          	ldw	x,(OFST+6,sp)
3036  0030 7f            	clr	(x)
3037  0031               L1771:
3038                     ; 222 }
3041  0031 84            	pop	a
3042  0032 81            	ret	
3076                     ; 233 void SetLogonMode(u8 nMode)
3076                     ; 234 {
3077                     	switch	.text
3078  0033               _SetLogonMode:
3082                     ; 235 	ucLogonMode = nMode; 
3084  0033 c7006a        	ld	_ucLogonMode,a
3085                     ; 236 	nLogonModeBk = nMode;
3087  0036 c70069        	ld	_nLogonModeBk,a
3088                     ; 237 	return ;
3091  0039 81            	ret	
3283                     	switch	.const
3284  045f               L61:
3285  045f 00015180      	dc.l	86400
3286                     ; 249 s32 ClaReportTimeToSec(u8 nCycle)
3286                     ; 250 {
3287                     	switch	.text
3288  003a               _ClaReportTimeToSec:
3290  003a 88            	push	a
3291  003b 5210          	subw	sp,#16
3292       00000010      OFST:	set	16
3295                     ; 251 	s32 dwTemp = 0;
3297  003d 5f            	clrw	x
3298  003e 1f0f          	ldw	(OFST-1,sp),x
3299  0040 1f0d          	ldw	(OFST-3,sp),x
3300                     ; 254 	if(FALSE == ReadRecord(0, (u8*)&stRecord, sizeof(stRecord)))
3302  0042 4b0c          	push	#12
3303  0044 96            	ldw	x,sp
3304  0045 1c0002        	addw	x,#OFST-14
3305  0048 89            	pushw	x
3306  0049 4f            	clr	a
3307  004a cd0000        	call	_ReadRecord
3309  004d 5b03          	addw	sp,#3
3310  004f 4d            	tnz	a
3311  0050 2602          	jrne	L5112
3312                     ; 256 		stRecord.nStatus = VALVE_OPEN;
3314  0052 6b0b          	ld	(OFST-5,sp),a
3315  0054               L5112:
3316                     ; 267 	if(0x41 == nCycle)
3318  0054 7b11          	ld	a,(OFST+1,sp)
3319  0056 a141          	cp	a,#65
3320  0058 2605          	jrne	L7112
3321                     ; 270 		dwTemp = 3600;
3323  005a ae0e10        	ldw	x,#3600
3325  005d 2027          	jp	LC003
3326  005f               L7112:
3327                     ; 272 	else if((0xC1 == nCycle)||(0x81 == nCycle))/* 每天 不支持每月，每月也当做每天上报 */
3329  005f a1c1          	cp	a,#193
3330  0061 2704          	jreq	L5212
3332  0063 a181          	cp	a,#129
3333  0065 2614          	jrne	L3212
3334  0067               L5212:
3335                     ; 274 		dwTemp = 3600UL*24;
3337  0067 ae5180        	ldw	x,#20864
3338  006a 1f0f          	ldw	(OFST-1,sp),x
3339  006c ae0001        	ldw	x,#1
3340  006f               LC002:
3341  006f 1f0d          	ldw	(OFST-3,sp),x
3343  0071               L1212:
3344                     ; 303 	return dwTemp;
3346  0071 96            	ldw	x,sp
3347  0072 1c000d        	addw	x,#OFST-3
3348  0075 cd0000        	call	c_ltor
3352  0078 5b11          	addw	sp,#17
3353  007a 81            	ret	
3354  007b               L3212:
3355                     ; 276 	else if(30 >= nCycle)/* 每1-10天上报则按以下方式获取上报数据 */
3357  007b a11f          	cp	a,#31
3358  007d 2423          	jruge	L1312
3359                     ; 278 		if(6 == nCycle)
3361  007f a106          	cp	a,#6
3362  0081 2608          	jrne	L3312
3363                     ; 280 			dwTemp = 3600UL*6;
3365  0083 ae5460        	ldw	x,#21600
3366  0086               LC003:
3367  0086 1f0f          	ldw	(OFST-1,sp),x
3368  0088 5f            	clrw	x
3370  0089 20e4          	jp	LC002
3371  008b               L3312:
3372                     ; 294 			dwTemp = 3600UL*24*nCycle;
3374  008b b703          	ld	c_lreg+3,a
3375  008d 3f02          	clr	c_lreg+2
3376  008f 3f01          	clr	c_lreg+1
3377  0091 3f00          	clr	c_lreg
3378  0093 ae045f        	ldw	x,#L61
3379  0096 cd0000        	call	c_lmul
3381  0099 96            	ldw	x,sp
3382  009a 1c000d        	addw	x,#OFST-3
3383  009d cd0000        	call	c_rtol
3385  00a0 20cf          	jra	L1212
3386  00a2               L1312:
3387                     ; 301 		dwTemp = 5UL*60;
3389  00a2 ae012c        	ldw	x,#300
3390  00a5 20df          	jp	LC003
3393                     	switch	.const
3394  0463               L1412_nBuf:
3395  0463 00            	dc.b	0
3396  0464 000000000000  	ds.b	9
3595                     ; 315 void UpLinkSaveReportTime(void)
3595                     ; 316 {
3596                     	switch	.text
3597  00a7               _UpLinkSaveReportTime:
3599  00a7 5221          	subw	sp,#33
3600       00000021      OFST:	set	33
3603                     ; 319 	u8 nBuf[10] = {0};
3605  00a9 96            	ldw	x,sp
3606  00aa 1c0018        	addw	x,#OFST-9
3607  00ad 90ae0463      	ldw	y,#L1412_nBuf
3608  00b1 a60a          	ld	a,#10
3609  00b3 cd0000        	call	c_xymvx
3611                     ; 320 	s32 dwOffsetSec = 0, dwCycle = 0;
3613  00b6 5f            	clrw	x
3614  00b7 1f03          	ldw	(OFST-30,sp),x
3615  00b9 1f01          	ldw	(OFST-32,sp),x
3618  00bb 1f07          	ldw	(OFST-26,sp),x
3619  00bd 1f05          	ldw	(OFST-28,sp),x
3620                     ; 322 	STM8_RTC_Get(&stReportTime);
3622  00bf 96            	ldw	x,sp
3623  00c0 1c0011        	addw	x,#OFST-16
3624  00c3 cd0000        	call	_STM8_RTC_Get
3626                     ; 323 	TM_TimeChangeAToB(&stReportTime,&stTime);
3628  00c6 96            	ldw	x,sp
3629  00c7 1c0009        	addw	x,#OFST-24
3630  00ca 89            	pushw	x
3631  00cb 1c0008        	addw	x,#8
3632  00ce cd0000        	call	_TM_TimeChangeAToB
3634  00d1 85            	popw	x
3635                     ; 333 	g_wTmReportCnt++;
3637  00d2 ce00ab        	ldw	x,_g_wTmReportCnt
3638  00d5 5c            	incw	x
3639  00d6 cf00ab        	ldw	_g_wTmReportCnt,x
3640                     ; 341 	MemcpyFunc((u8*)nBuf, (u8*)&stLastReportT, 8);
3642  00d9 4b08          	push	#8
3643  00db ae000a        	ldw	x,#_stLastReportT
3644  00de 89            	pushw	x
3645  00df 96            	ldw	x,sp
3646  00e0 1c001b        	addw	x,#OFST-6
3647  00e3 cd0000        	call	_MemcpyFunc
3649  00e6 5b03          	addw	sp,#3
3650                     ; 342 	MemcpyFunc(&nBuf[8], (u8*)&g_wTmReportCnt, 2);
3652  00e8 4b02          	push	#2
3653  00ea ae00ab        	ldw	x,#_g_wTmReportCnt
3654  00ed 89            	pushw	x
3655  00ee 96            	ldw	x,sp
3656  00ef 1c0023        	addw	x,#OFST+2
3657  00f2 cd0000        	call	_MemcpyFunc
3659  00f5 5b03          	addw	sp,#3
3660                     ; 343 	SaveParameterForType(nBuf, 10, LT_REP_TIME);
3662  00f7 4b05          	push	#5
3663  00f9 4b0a          	push	#10
3664  00fb 96            	ldw	x,sp
3665  00fc 1c001a        	addw	x,#OFST-7
3666  00ff cd0000        	call	_SaveParameterForType
3668  0102 c60001        	ld	a,_stOptValve+1
3669  0105 a1ee          	cp	a,#238
3670  0107 85            	popw	x
3671                     ; 346 	if((CTL_VALVE_OVER == stOptValve.nOptFlg)&&(MAX_REP_TIMES > stOptValve.nRepFailCnt))
3673  0108 2624          	jrne	L1422
3675  010a c60008        	ld	a,_stOptValve+8
3676  010d a103          	cp	a,#3
3677  010f 241d          	jruge	L1422
3678                     ; 348 		stOptValve.nRepFailCnt++;
3680  0111 725c0008      	inc	_stOptValve+8
3681                     ; 349 		stOptValve.nRepFailCnt = ((stOptValve.nRepFailCnt>MAX_REP_TIMES)?MAX_REP_TIMES:stOptValve.nRepFailCnt);
3683  0115 c60008        	ld	a,_stOptValve+8
3684  0118 a104          	cp	a,#4
3685  011a 2502          	jrult	L43
3686  011c a603          	ld	a,#3
3687  011e               L43:
3688  011e c70008        	ld	_stOptValve+8,a
3689                     ; 350 		SaveParameterForType((u8*)&stOptValve, OPTVALVE_LEN, OPT_VALVE_PRAA);
3691  0121 4b06          	push	#6
3692  0123 4b0a          	push	#10
3693  0125 ae0000        	ldw	x,#_stOptValve
3694  0128 cd0000        	call	_SaveParameterForType
3696  012b 85            	popw	x
3697                     ; 351 		return ;
3699  012c 2045          	jra	L66
3700  012e               L1422:
3701                     ; 355 	if((NO_ALARM != (ALM_GetBatStatus())&ALARM_MASK) 
3701                     ; 356 		&& (ALARM_REP_FLG != (g_nGuardEnFlg&ALARM_REP_FLG))
3701                     ; 357 		&& (MAX_REP_TIMES > g_nAlmRepFailCnt)&&(m_nAlmRepFlg))
3703  012e cd0000        	call	_ALM_GetBatStatus
3705  0131 4d            	tnz	a
3706  0132 2705          	jreq	L24
3707  0134 ae0001        	ldw	x,#1
3708  0137 2001          	jra	L64
3709  0139               L24:
3710  0139 5f            	clrw	x
3711  013a               L64:
3712  013a 01            	rrwa	x,a
3713  013b a50f          	bcp	a,#15
3714  013d 2737          	jreq	L3422
3716  013f 7202000032    	btjt	_g_nGuardEnFlg,#1,L3422
3718  0144 c60000        	ld	a,_g_nAlmRepFailCnt
3719  0147 a103          	cp	a,#3
3720  0149 242b          	jruge	L3422
3722  014b c600c4        	ld	a,_m_nAlmRepFlg
3723  014e 2726          	jreq	L3422
3724                     ; 359 		g_nAlmRepFailCnt++;
3726  0150 725c0000      	inc	_g_nAlmRepFailCnt
3727                     ; 360 		g_nAlmRepFailCnt = ((g_nAlmRepFailCnt>MAX_REP_TIMES)?MAX_REP_TIMES:g_nAlmRepFailCnt);
3729  0154 c60000        	ld	a,_g_nAlmRepFailCnt
3730  0157 a104          	cp	a,#4
3731  0159 2502          	jrult	L05
3732  015b a603          	ld	a,#3
3733  015d               L05:
3734  015d c70000        	ld	_g_nAlmRepFailCnt,a
3735                     ; 361 		g_nGuardEnFlg |=(g_nAlmRepFailCnt<<6); /* 记录上报告警失败次数 */
3737  0160 97            	ld	xl,a
3738  0161 a640          	ld	a,#64
3739  0163 42            	mul	x,a
3740  0164 9f            	ld	a,xl
3741  0165 ca0000        	or	a,_g_nGuardEnFlg
3742  0168 c70000        	ld	_g_nGuardEnFlg,a
3743                     ; 362 		SaveByte(ADDRESS_GUARD_EN, g_nGuardEnFlg);
3745  016b 88            	push	a
3746  016c ae1000        	ldw	x,#4096
3747  016f cd0000        	call	_SaveByte
3749  0172 84            	pop	a
3750                     ; 363 		return ;
3751  0173               L66:
3754  0173 5b21          	addw	sp,#33
3755  0175 81            	ret	
3756  0176               L3422:
3757                     ; 367 	if(m_nRepFailFlg)
3759  0176 c600bd        	ld	a,_m_nRepFailFlg
3760  0179 27f8          	jreq	L66
3761                     ; 369 		MemcpyFunc((u8*)&stRepFail.stTime, (u8*)&stReportTime, sizeof(stRepFail.stTime));
3763  017b 4b06          	push	#6
3764  017d 96            	ldw	x,sp
3765  017e 1c0012        	addw	x,#OFST-15
3766  0181 89            	pushw	x
3767  0182 ae0000        	ldw	x,#_stRepFail
3768  0185 cd0000        	call	_MemcpyFunc
3770  0188 5b03          	addw	sp,#3
3771                     ; 370 		stRepFail.nSigal = JX_ByteToBcd(g_nSignal);			//信号大小,固定值
3773  018a c60000        	ld	a,_g_nSignal
3774  018d cd0000        	call	_JX_ByteToBcd
3776  0190 c70008        	ld	_stRepFail+8,a
3777                     ; 371 		AddAlmRecord((u8*)&stRepFail, sizeof(stRepFail));
3779  0193 4b09          	push	#9
3780  0195 ae0000        	ldw	x,#_stRepFail
3781  0198 cd0000        	call	_AddAlmRecord
3783  019b 84            	pop	a
3784                     ; 374 		if(m_nWakeupReportFlg&THIRD_REP_FAIL)
3786  019c 720700a506    	btjf	_m_nWakeupReportFlg,#3,L7422
3787                     ; 376 			m_nWakeupReportFlg = 0;
3789  01a1 725f00a5      	clr	_m_nWakeupReportFlg
3791  01a5 201a          	jra	L1522
3792  01a7               L7422:
3793                     ; 386 		else if(m_nWakeupReportFlg&SECOND_REP_FAIL)
3795  01a7 720500a506    	btjf	_m_nWakeupReportFlg,#2,L3522
3796                     ; 388 			m_nWakeupReportFlg |= THIRD_REP_FAIL;
3798  01ac 721600a5      	bset	_m_nWakeupReportFlg,#3
3800  01b0 200f          	jra	L1522
3801  01b2               L3522:
3802                     ; 390 		else if(m_nWakeupReportFlg&FIRST_REP_FAIL)
3804  01b2 720300a506    	btjf	_m_nWakeupReportFlg,#1,L7522
3805                     ; 392 			m_nWakeupReportFlg |= SECOND_REP_FAIL;
3807  01b7 721400a5      	bset	_m_nWakeupReportFlg,#2
3809  01bb 2004          	jra	L1522
3810  01bd               L7522:
3811                     ; 396 			m_nWakeupReportFlg |= FIRST_REP_FAIL;
3813  01bd 721200a5      	bset	_m_nWakeupReportFlg,#1
3814  01c1               L1522:
3815                     ; 398 		SaveReportFlag(m_nWakeupReportFlg);
3817  01c1 c600a5        	ld	a,_m_nWakeupReportFlg
3818  01c4 cd0000        	call	_SaveReportFlag
3820                     ; 399 		m_nRepFailFlg = FALSE;
3822  01c7 725f00bd      	clr	_m_nRepFailFlg
3823                     ; 401 }
3825  01cb 20a6          	jra	L66
3858                     ; 411 void BatteryVolRepPro(void)
3858                     ; 412 {
3859                     	switch	.text
3860  01cd               _BatteryVolRepPro:
3864                     ; 413 	if((ALARM_MASK&ALM_GetBatStatus())&&(g_BatRepFlg)
3864                     ; 414 		&&((OTHER_REP == m_nUploadMode)||(MAX_REP_TIMES <= g_nAlmRepFailCnt)))
3866  01cd cd0000        	call	_ALM_GetBatStatus
3868  01d0 a50f          	bcp	a,#15
3869  01d2 2730          	jreq	L3722
3871  01d4 c600b3        	ld	a,_g_BatRepFlg
3872  01d7 272b          	jreq	L3722
3874  01d9 c600c3        	ld	a,_m_nUploadMode
3875  01dc 2707          	jreq	L5722
3877  01de c60000        	ld	a,_g_nAlmRepFailCnt
3878  01e1 a103          	cp	a,#3
3879  01e3 251f          	jrult	L3722
3880  01e5               L5722:
3881                     ; 416 		g_dwRepTick = GetSysTemTick();
3883  01e5 cd0000        	call	_GetSysTemTick
3885  01e8 ae00b5        	ldw	x,#_g_dwRepTick
3886  01eb cd0000        	call	c_rtol
3888                     ; 417 		g_nDatRepCnt = 0;
3890  01ee 725f00b4      	clr	_g_nDatRepCnt
3891                     ; 418 		m_nRepEnableFlg = TRUE; //上报超时使能		
3893  01f2 350100ba      	mov	_m_nRepEnableFlg,#1
3894                     ; 419 		SetLogonMode(UP_UPLOAD_BAT_VAL);
3896  01f6 a604          	ld	a,#4
3897  01f8 cd0033        	call	_SetLogonMode
3899                     ; 420 		g_BatRepFlg = FALSE;
3901  01fb 725f00b3      	clr	_g_BatRepFlg
3902                     ; 421 		m_nAlmRepFlg = TRUE;
3904  01ff 350100c4      	mov	_m_nAlmRepFlg,#1
3907  0203 81            	ret	
3908  0204               L3722:
3909                     ; 425 		SetLogonMode(UP_HEARTBEAT);
3911  0204 a601          	ld	a,#1
3913                     ; 427 	return ;
3916  0206 cc0033        	jp	_SetLogonMode
4059                     ; 439 u8 AlmMakeFrame(u8* pnOutBuf)
4059                     ; 440 {
4060                     	switch	.text
4061  0209               _AlmMakeFrame:
4063  0209 89            	pushw	x
4064  020a 520b          	subw	sp,#11
4065       0000000b      OFST:	set	11
4068                     ; 441 	u8 i = 0, nAtReportLen = 0;
4072  020c 0f01          	clr	(OFST-10,sp)
4073                     ; 444 	for(i = 0; i < MAX_ALM_NUM; i++)  //  wTemp
4075  020e 0f02          	clr	(OFST-9,sp)
4076  0210               L3632:
4077                     ; 447 		if(FALSE == ReadAlmRecord(i, (u8*)&stRecord, sizeof(stRecord)))
4079  0210 4b09          	push	#9
4080  0212 96            	ldw	x,sp
4081  0213 1c0004        	addw	x,#OFST-7
4082  0216 89            	pushw	x
4083  0217 7b05          	ld	a,(OFST-6,sp)
4084  0219 cd0000        	call	_ReadAlmRecord
4086  021c 5b03          	addw	sp,#3
4087  021e 4d            	tnz	a
4088  021f 260c          	jrne	L1732
4089                     ; 449 			MemsetFunc((u8*)&stRecord, 0xFF, sizeof(stRecord));
4091  0221 4b09          	push	#9
4092  0223 4bff          	push	#255
4093  0225 96            	ldw	x,sp
4094  0226 1c0005        	addw	x,#OFST-6
4095  0229 cd0000        	call	_MemsetFunc
4097  022c 85            	popw	x
4098  022d               L1732:
4099                     ; 452 		JX_BL_Change(2,(u8*)&stRecord.wError);
4101  022d 96            	ldw	x,sp
4102  022e 1c0009        	addw	x,#OFST-2
4103  0231 89            	pushw	x
4104  0232 ae0002        	ldw	x,#2
4105  0235 cd0000        	call	_JX_BL_Change
4107  0238 85            	popw	x
4108                     ; 453 		MemcpyFunc(&pnOutBuf[i*9], (u8*)&stRecord, sizeof(stRecord));
4110  0239 4b09          	push	#9
4111  023b 96            	ldw	x,sp
4112  023c 1c0004        	addw	x,#OFST-7
4113  023f 89            	pushw	x
4114  0240 7b05          	ld	a,(OFST-6,sp)
4115  0242 97            	ld	xl,a
4116  0243 a609          	ld	a,#9
4117  0245 42            	mul	x,a
4118  0246 72fb0f        	addw	x,(OFST+4,sp)
4119  0249 cd0000        	call	_MemcpyFunc
4121  024c 5b03          	addw	sp,#3
4122                     ; 454 		nAtReportLen = (i+1)*9;
4124  024e 7b02          	ld	a,(OFST-9,sp)
4125  0250 97            	ld	xl,a
4126  0251 a609          	ld	a,#9
4127  0253 42            	mul	x,a
4128  0254 9f            	ld	a,xl
4129  0255 ab09          	add	a,#9
4130  0257 6b01          	ld	(OFST-10,sp),a
4131                     ; 444 	for(i = 0; i < MAX_ALM_NUM; i++)  //  wTemp
4133  0259 0c02          	inc	(OFST-9,sp)
4136  025b 7b02          	ld	a,(OFST-9,sp)
4137  025d a103          	cp	a,#3
4138  025f 25af          	jrult	L3632
4139                     ; 457 	return nAtReportLen;	
4141  0261 7b01          	ld	a,(OFST-10,sp)
4144  0263 5b0d          	addw	sp,#13
4145  0265 81            	ret	
4196                     ; 469 void FrameSendFunc(u8 Size, u8 nComChannel, u8* pnPoint)
4196                     ; 470 {
4197                     	switch	.text
4198  0266               _FrameSendFunc:
4200  0266 89            	pushw	x
4201       00000000      OFST:	set	0
4204                     ; 472 	if(COM_1 == nComChannel)
4206  0267 9f            	ld	a,xl
4207  0268 4a            	dec	a
4208  0269 2614          	jrne	L5142
4209                     ; 474 		*pnPoint++ = AT_TAIL_0;				//数据发送规定
4211  026b 1e05          	ldw	x,(OFST+5,sp)
4212  026d a60d          	ld	a,#13
4213  026f f7            	ld	(x),a
4214  0270 5c            	incw	x
4215  0271 1f05          	ldw	(OFST+5,sp),x
4216                     ; 475 		SetBusUart(nComChannel, PARITY_NULL);	//设置串口通道号
4218  0273 5f            	clrw	x
4219  0274 7b02          	ld	a,(OFST+2,sp)
4220  0276 95            	ld	xh,a
4221  0277 cd0000        	call	_SetBusUart
4223                     ; 476 		StartSendBusUartGroup(Size + 1);
4225  027a 7b01          	ld	a,(OFST+1,sp)
4226  027c 4c            	inc	a
4229  027d 200b          	jra	L7142
4230  027f               L5142:
4231                     ; 480 		SetBusUart(nComChannel, PARITY_EVEN);	//设置串口通道号  
4233  027f ae0003        	ldw	x,#3
4234  0282 7b02          	ld	a,(OFST+2,sp)
4235  0284 95            	ld	xh,a
4236  0285 cd0000        	call	_SetBusUart
4238                     ; 481 		StartSendBusUartGroup(Size);
4240  0288 7b01          	ld	a,(OFST+1,sp)
4242  028a               L7142:
4243  028a cd0000        	call	_StartSendBusUartGroup
4244                     ; 483 }
4247  028d 85            	popw	x
4248  028e 81            	ret	
4302                     ; 493 void GetIsmiCcidDat(void)
4302                     ; 494 {
4303                     	switch	.text
4304  028f               _GetIsmiCcidDat:
4306  028f 5203          	subw	sp,#3
4307       00000003      OFST:	set	3
4310                     ; 495 	u8 nOptCmd = 0, nOptRlt = 0, nCnt = 0;
4312  0291 0f01          	clr	(OFST-2,sp)
4317  0293 0f02          	clr	(OFST-1,sp)
4318                     ; 497 	if(g_nSignal <= 0)
4320  0295 c60000        	ld	a,_g_nSignal
4321  0298 2653          	jrne	L1442
4322                     ; 499 		TurnBusUartOn();
4324  029a cd0000        	call	_TurnBusUartOn
4326                     ; 500 		SetPortGsmResetDisable();
4328  029d 4b00          	push	#0
4329  029f 4b40          	push	#64
4330  02a1 ae5005        	ldw	x,#20485
4331  02a4 cd0000        	call	_GPIO_WriteBit
4333  02a7 85            	popw	x
4334                     ; 501 		SetPortGsmPowerOn();		   //供电
4336  02a8 4b01          	push	#1
4337  02aa 4b10          	push	#16
4338  02ac ae500a        	ldw	x,#20490
4339  02af cd0000        	call	_GPIO_WriteBit
4341  02b2 85            	popw	x
4342                     ; 502 		SetPortSoftSwitchOn();
4344  02b3 ad3b          	call	LC004
4345                     ; 504 		SetPortSoftSwitchOff();
4347  02b5 4b00          	push	#0
4348  02b7 4b20          	push	#32
4349  02b9 ae5005        	ldw	x,#20485
4350  02bc cd0000        	call	_GPIO_WriteBit
4352  02bf 85            	popw	x
4353                     ; 505 		UC_SleepFunc(2500);
4355  02c0 ae09c4        	ldw	x,#2500
4356  02c3 ad39          	call	LC005
4357                     ; 506 		SetPortSoftSwitchOn();
4359  02c5 ad29          	call	LC004
4360  02c7               L3442:
4361                     ; 510 			UC_SleepFunc(500); 
4363  02c7 ae01f4        	ldw	x,#500
4364  02ca ad32          	call	LC005
4365                     ; 511 			SIMGK7M_GetCIMI(m_nImsiBuf, sizeof(m_nImsiBuf));
4367  02cc 4b18          	push	#24
4368  02ce ae0085        	ldw	x,#_m_nImsiBuf
4369  02d1 cd0d52        	call	_SIMGK7M_GetCIMI
4371  02d4 84            	pop	a
4372                     ; 512 			nOptRlt = SIMGL868_GetCCID(m_nCcidBuf, sizeof(m_nCcidBuf));
4374  02d5 4b18          	push	#24
4375  02d7 ae006d        	ldw	x,#_m_nCcidBuf
4376  02da cd0da7        	call	_SIMGL868_GetCCID
4378  02dd 5b01          	addw	sp,#1
4379  02df 6b03          	ld	(OFST+0,sp),a
4380                     ; 513 		}while((3 > nCnt++)&&(FALSE == nOptRlt));
4382  02e1 7b02          	ld	a,(OFST-1,sp)
4383  02e3 0c02          	inc	(OFST-1,sp)
4384  02e5 a103          	cp	a,#3
4385  02e7 2404          	jruge	L1442
4387  02e9 7b03          	ld	a,(OFST+0,sp)
4388  02eb 27da          	jreq	L3442
4389  02ed               L1442:
4390                     ; 516 }
4393  02ed 5b03          	addw	sp,#3
4394  02ef 81            	ret	
4396  02f0               LC004:
4397  02f0 4b01          	push	#1
4398  02f2 4b20          	push	#32
4399  02f4 ae5005        	ldw	x,#20485
4400  02f7 cd0000        	call	_GPIO_WriteBit
4402  02fa 85            	popw	x
4403                     ; 507 		UC_SleepFunc(500); 
4405  02fb ae01f4        	ldw	x,#500
4406  02fe               LC005:
4407  02fe 89            	pushw	x
4408  02ff 5f            	clrw	x
4409  0300 89            	pushw	x
4410  0301 cd0751        	call	_UC_SleepFunc
4412  0304 5b04          	addw	sp,#4
4413  0306 81            	ret	
4464                     ; 531 u8  JX_Strlen(char* pbSrc)
4464                     ; 532 {
4465                     	switch	.text
4466  0307               _JX_Strlen:
4468  0307 89            	pushw	x
4469  0308 5203          	subw	sp,#3
4470       00000003      OFST:	set	3
4473                     ; 533 	u8 nLoop = 0;
4475                     ; 534 	char* pBuf = (char*)pbSrc;
4477  030a 1e04          	ldw	x,(OFST+1,sp)
4478  030c 1f01          	ldw	(OFST-2,sp),x
4479                     ; 536 	nLoop = 0;
4481  030e 0f03          	clr	(OFST+0,sp)
4482  0310               L7742:
4483                     ; 539 		nLoop++;
4485  0310 0c03          	inc	(OFST+0,sp)
4486                     ; 540 	}while(pBuf[nLoop] != 0);
4488  0312 7b01          	ld	a,(OFST-2,sp)
4489  0314 97            	ld	xl,a
4490  0315 7b02          	ld	a,(OFST-1,sp)
4491  0317 1b03          	add	a,(OFST+0,sp)
4492  0319 2401          	jrnc	L261
4493  031b 5c            	incw	x
4494  031c               L261:
4495  031c 02            	rlwa	x,a
4496  031d f6            	ld	a,(x)
4497  031e 26f0          	jrne	L7742
4498                     ; 542 	return nLoop;
4500  0320 7b03          	ld	a,(OFST+0,sp)
4503  0322 5b05          	addw	sp,#5
4504  0324 81            	ret	
4570                     ; 554 void  JX_StringCat(char* pbSrc,char * pnStr, u8 nLen)
4570                     ; 555 {
4571                     	switch	.text
4572  0325               _JX_StringCat:
4574  0325 89            	pushw	x
4575  0326 89            	pushw	x
4576       00000002      OFST:	set	2
4579                     ; 556 	u8 nLoop = 0, i = 0;
4583                     ; 558 	nLoop = 0;
4585                     ; 559 	for(nLoop = 0; nLoop < 254; nLoop++)
4587  0327 0f02          	clr	(OFST+0,sp)
4588  0329               L5352:
4589                     ; 561 		if(pbSrc[nLoop] == 0)
4591  0329 7b03          	ld	a,(OFST+1,sp)
4592  032b 97            	ld	xl,a
4593  032c 7b04          	ld	a,(OFST+2,sp)
4594  032e 1b02          	add	a,(OFST+0,sp)
4595  0330 2401          	jrnc	L661
4596  0332 5c            	incw	x
4597  0333               L661:
4598  0333 02            	rlwa	x,a
4599  0334 f6            	ld	a,(x)
4600  0335 2708          	jreq	L1452
4601                     ; 563 			break;
4603                     ; 559 	for(nLoop = 0; nLoop < 254; nLoop++)
4605  0337 0c02          	inc	(OFST+0,sp)
4608  0339 7b02          	ld	a,(OFST+0,sp)
4609  033b a1fe          	cp	a,#254
4610  033d 25ea          	jrult	L5352
4611  033f               L1452:
4612                     ; 566 	for(i = 0; i < nLen; i++)
4614  033f 0f01          	clr	(OFST-1,sp)
4616  0341 201a          	jra	L1552
4617  0343               L5452:
4618                     ; 568 		pbSrc[nLoop++] = pnStr[i];
4620  0343 7b02          	ld	a,(OFST+0,sp)
4621  0345 0c02          	inc	(OFST+0,sp)
4622  0347 5f            	clrw	x
4623  0348 97            	ld	xl,a
4624  0349 72fb03        	addw	x,(OFST+1,sp)
4625  034c 89            	pushw	x
4626  034d 7b09          	ld	a,(OFST+7,sp)
4627  034f 97            	ld	xl,a
4628  0350 7b0a          	ld	a,(OFST+8,sp)
4629  0352 1b03          	add	a,(OFST+1,sp)
4630  0354 2401          	jrnc	L071
4631  0356 5c            	incw	x
4632  0357               L071:
4633  0357 02            	rlwa	x,a
4634  0358 f6            	ld	a,(x)
4635  0359 85            	popw	x
4636  035a f7            	ld	(x),a
4637                     ; 566 	for(i = 0; i < nLen; i++)
4639  035b 0c01          	inc	(OFST-1,sp)
4640  035d               L1552:
4643  035d 7b01          	ld	a,(OFST-1,sp)
4644  035f 1109          	cp	a,(OFST+7,sp)
4645  0361 25e0          	jrult	L5452
4646                     ; 571 	return ;
4649  0363 5b04          	addw	sp,#4
4650  0365 81            	ret	
4705                     ; 579 void PackAtCmd(u8 Cmd)
4705                     ; 580 {
4706                     	switch	.text
4707  0366               _PackAtCmd:
4709  0366 88            	push	a
4710  0367 5204          	subw	sp,#4
4711       00000004      OFST:	set	4
4714                     ; 583 	point = aucUartTxBuffer;
4716  0369 ae0000        	ldw	x,#_aucUartTxBuffer
4717                     ; 584 	if (Cmd > AT_CMD_S_D)		//有包头?
4719  036c a108          	cp	a,#8
4720  036e 2508          	jrult	L7752
4721                     ; 586 		*point++ = AT_HEAD_0;
4723  0370 a641          	ld	a,#65
4724  0372 f7            	ld	(x),a
4725  0373 5c            	incw	x
4726                     ; 587 		*point++ = AT_HEAD_1;
4728  0374 a654          	ld	a,#84
4729  0376 f7            	ld	(x),a
4730  0377 5c            	incw	x
4731  0378               L7752:
4732  0378 1f03          	ldw	(OFST-1,sp),x
4733                     ; 589 	length = JX_Strlen((char const *)aucAtCmd[Cmd] );
4735  037a 7b05          	ld	a,(OFST+1,sp)
4736  037c 5f            	clrw	x
4737  037d 97            	ld	xl,a
4738  037e 58            	sllw	x
4739  037f de037b        	ldw	x,(_aucAtCmd,x)
4740  0382 ad83          	call	_JX_Strlen
4742  0384 5f            	clrw	x
4743  0385 97            	ld	xl,a
4744  0386 1f01          	ldw	(OFST-3,sp),x
4745                     ; 590 	MemcpyFunc( (u8 *)point, aucAtCmd[Cmd], length);		//复制字符串到缓冲中
4747  0388 7b02          	ld	a,(OFST-2,sp)
4748  038a 88            	push	a
4749  038b 7b06          	ld	a,(OFST+2,sp)
4750  038d 5f            	clrw	x
4751  038e 97            	ld	xl,a
4752  038f 58            	sllw	x
4753  0390 de037b        	ldw	x,(_aucAtCmd,x)
4754  0393 89            	pushw	x
4755  0394 1e06          	ldw	x,(OFST+2,sp)
4756  0396 cd0000        	call	_MemcpyFunc
4758  0399 5b03          	addw	sp,#3
4759                     ; 591 	point += length;
4761  039b 1e03          	ldw	x,(OFST-1,sp)
4762  039d 72fb01        	addw	x,(OFST-3,sp)
4763                     ; 592 	*point++ = AT_TAIL_0;		//包尾
4765  03a0 a60d          	ld	a,#13
4766  03a2 f7            	ld	(x),a
4767  03a3 5c            	incw	x
4768                     ; 593 	*point++ = AT_TAIL_1;
4770  03a4 a60a          	ld	a,#10
4771  03a6 f7            	ld	(x),a
4772  03a7 5c            	incw	x
4773  03a8 1f03          	ldw	(OFST-1,sp),x
4774                     ; 594 	if (Cmd > AT_CMD_S_D)		//有包头?
4776  03aa 7b05          	ld	a,(OFST+1,sp)
4777  03ac a108          	cp	a,#8
4778  03ae 1e01          	ldw	x,(OFST-3,sp)
4779  03b0 2505          	jrult	L1062
4780                     ; 596 		length += 4;
4782  03b2 1c0004        	addw	x,#4
4784  03b5 2003          	jra	L3062
4785  03b7               L1062:
4786                     ; 600 		length += 2;
4788  03b7 1c0002        	addw	x,#2
4789  03ba               L3062:
4790  03ba 1f01          	ldw	(OFST-3,sp),x
4791                     ; 602 	SetBusUart(COM_1, PARITY_NULL);		//设置串口通道号
4793  03bc 5f            	clrw	x
4794  03bd a601          	ld	a,#1
4795  03bf 95            	ld	xh,a
4796  03c0 cd0000        	call	_SetBusUart
4798                     ; 604 	StartSendBusUartGroup(length);
4800  03c3 7b02          	ld	a,(OFST-2,sp)
4801  03c5 cd0000        	call	_StartSendBusUartGroup
4803                     ; 605 }
4806  03c8 5b05          	addw	sp,#5
4807  03ca 81            	ret	
4879                     ; 612 void PackAtCmdParameter(u8 Cmd, u8 *Parameter)
4879                     ; 613 {
4880                     	switch	.text
4881  03cb               _PackAtCmdParameter:
4883  03cb 88            	push	a
4884  03cc 5206          	subw	sp,#6
4885       00000006      OFST:	set	6
4888                     ; 616 	point = aucUartTxBuffer; 
4890  03ce ae0000        	ldw	x,#_aucUartTxBuffer
4891                     ; 617 	if (Cmd > AT_CMD_S_A)		//有包头? AT_CMD_S_D
4893  03d1 4d            	tnz	a
4894  03d2 2708          	jreq	L5362
4895                     ; 619 		*point++ = AT_HEAD_0;
4897  03d4 a641          	ld	a,#65
4898  03d6 f7            	ld	(x),a
4899  03d7 5c            	incw	x
4900                     ; 620 		*point++ = AT_HEAD_1;
4902  03d8 a654          	ld	a,#84
4903  03da f7            	ld	(x),a
4904  03db 5c            	incw	x
4905  03dc               L5362:
4906  03dc 1f05          	ldw	(OFST-1,sp),x
4907                     ; 622 	length1 = JX_Strlen( (char const *)aucAtCmd[Cmd] );
4909  03de 7b07          	ld	a,(OFST+1,sp)
4910  03e0 5f            	clrw	x
4911  03e1 97            	ld	xl,a
4912  03e2 58            	sllw	x
4913  03e3 de037b        	ldw	x,(_aucAtCmd,x)
4914  03e6 cd0307        	call	_JX_Strlen
4916  03e9 5f            	clrw	x
4917  03ea 97            	ld	xl,a
4918  03eb 1f03          	ldw	(OFST-3,sp),x
4919                     ; 623 	MemcpyFunc( (u8 *)point, aucAtCmd[Cmd], length1);		//复制字符串到缓冲中
4921  03ed 7b04          	ld	a,(OFST-2,sp)
4922  03ef 88            	push	a
4923  03f0 7b08          	ld	a,(OFST+2,sp)
4924  03f2 5f            	clrw	x
4925  03f3 97            	ld	xl,a
4926  03f4 58            	sllw	x
4927  03f5 de037b        	ldw	x,(_aucAtCmd,x)
4928  03f8 89            	pushw	x
4929  03f9 1e08          	ldw	x,(OFST+2,sp)
4930  03fb cd0000        	call	_MemcpyFunc
4932  03fe 5b03          	addw	sp,#3
4933                     ; 624 	point += length1;
4935  0400 1e05          	ldw	x,(OFST-1,sp)
4936  0402 72fb03        	addw	x,(OFST-3,sp)
4937  0405 1f05          	ldw	(OFST-1,sp),x
4938                     ; 625 	length2 = JX_Strlen( (char const *)Parameter);
4940  0407 1e0a          	ldw	x,(OFST+4,sp)
4941  0409 cd0307        	call	_JX_Strlen
4943  040c 5f            	clrw	x
4944  040d 97            	ld	xl,a
4945  040e 1f01          	ldw	(OFST-5,sp),x
4946                     ; 626 	MemcpyFunc( (u8 *)point, Parameter, length2);		//复制字符串到缓冲中
4948  0410 7b02          	ld	a,(OFST-4,sp)
4949  0412 88            	push	a
4950  0413 1e0b          	ldw	x,(OFST+5,sp)
4951  0415 89            	pushw	x
4952  0416 1e08          	ldw	x,(OFST+2,sp)
4953  0418 cd0000        	call	_MemcpyFunc
4955  041b 5b03          	addw	sp,#3
4956                     ; 627 	point += length2;
4958  041d 1e05          	ldw	x,(OFST-1,sp)
4959  041f 72fb01        	addw	x,(OFST-5,sp)
4960                     ; 628 	*point++ = AT_TAIL_0;		//包尾
4962  0422 a60d          	ld	a,#13
4963  0424 f7            	ld	(x),a
4964  0425 5c            	incw	x
4965                     ; 629 	*point++ = AT_TAIL_1;
4967  0426 a60a          	ld	a,#10
4968  0428 f7            	ld	(x),a
4969  0429 5c            	incw	x
4970  042a 1f05          	ldw	(OFST-1,sp),x
4971                     ; 630 	length1 += length2;
4973  042c 1e03          	ldw	x,(OFST-3,sp)
4974  042e 72fb01        	addw	x,(OFST-5,sp)
4975  0431 1f03          	ldw	(OFST-3,sp),x
4976                     ; 631 	if (Cmd > AT_CMD_S_A)		//有包头? AT_CMD_S_D
4978  0433 7b07          	ld	a,(OFST+1,sp)
4979  0435 2705          	jreq	L7362
4980                     ; 633 		length1 += 4;
4982  0437 1c0004        	addw	x,#4
4984  043a 2003          	jra	L1462
4985  043c               L7362:
4986                     ; 637 		length1 += 2;
4988  043c 1c0002        	addw	x,#2
4989  043f               L1462:
4990  043f 1f03          	ldw	(OFST-3,sp),x
4991                     ; 639 	SetBusUart(COM_1, PARITY_NULL);		//设置串口通道号
4993  0441 5f            	clrw	x
4994  0442 a601          	ld	a,#1
4995  0444 95            	ld	xh,a
4996  0445 cd0000        	call	_SetBusUart
4998                     ; 641 	StartSendBusUartGroup(length1);
5000  0448 7b04          	ld	a,(OFST-2,sp)
5001  044a cd0000        	call	_StartSendBusUartGroup
5003                     ; 642 }
5006  044d 5b07          	addw	sp,#7
5007  044f 81            	ret	
5090                     ; 650 void PackAtCmdParameter2(u8 Cmd, u8 *Parameter1, u8 *Parameter2)
5090                     ; 651 {
5091                     	switch	.text
5092  0450               _PackAtCmdParameter2:
5094  0450 88            	push	a
5095  0451 5206          	subw	sp,#6
5096       00000006      OFST:	set	6
5099                     ; 654 	point = aucUartTxBuffer;
5101  0453 ae0000        	ldw	x,#_aucUartTxBuffer
5102                     ; 655 	if (Cmd > AT_CMD_S_D)		//有包头?
5104  0456 a108          	cp	a,#8
5105  0458 2508          	jrult	L7762
5106                     ; 657 		*point++ = AT_HEAD_0;
5108  045a a641          	ld	a,#65
5109  045c f7            	ld	(x),a
5110  045d 5c            	incw	x
5111                     ; 658 		*point++ = AT_HEAD_1;
5113  045e a654          	ld	a,#84
5114  0460 f7            	ld	(x),a
5115  0461 5c            	incw	x
5116  0462               L7762:
5117  0462 1f05          	ldw	(OFST-1,sp),x
5118                     ; 661 	length1 = JX_Strlen( (char const *)aucAtCmd[Cmd] );
5120  0464 7b07          	ld	a,(OFST+1,sp)
5121  0466 5f            	clrw	x
5122  0467 97            	ld	xl,a
5123  0468 58            	sllw	x
5124  0469 de037b        	ldw	x,(_aucAtCmd,x)
5125  046c cd04fa        	call	LC006
5126  046f 1f01          	ldw	(OFST-5,sp),x
5127                     ; 662 	MemcpyFunc( (u8 *)point, aucAtCmd[Cmd], length1);		//复制字符串到缓冲中
5129  0471 7b02          	ld	a,(OFST-4,sp)
5130  0473 88            	push	a
5131  0474 7b08          	ld	a,(OFST+2,sp)
5132  0476 5f            	clrw	x
5133  0477 97            	ld	xl,a
5134  0478 58            	sllw	x
5135  0479 de037b        	ldw	x,(_aucAtCmd,x)
5136  047c 89            	pushw	x
5137  047d 1e08          	ldw	x,(OFST+2,sp)
5138  047f cd0000        	call	_MemcpyFunc
5140  0482 5b03          	addw	sp,#3
5141                     ; 663 	point += length1;
5143  0484 1e05          	ldw	x,(OFST-1,sp)
5144  0486 72fb01        	addw	x,(OFST-5,sp)
5145  0489 1f05          	ldw	(OFST-1,sp),x
5146                     ; 668 	length2 = JX_Strlen( (char const *)Parameter1);
5148  048b 1e0a          	ldw	x,(OFST+4,sp)
5149  048d ad6b          	call	LC006
5150  048f 1f03          	ldw	(OFST-3,sp),x
5151                     ; 669 	MemcpyFunc( (u8 *)point, Parameter1, length2);		//复制字符串到缓冲中
5153  0491 7b04          	ld	a,(OFST-2,sp)
5154  0493 88            	push	a
5155  0494 1e0b          	ldw	x,(OFST+5,sp)
5156  0496 89            	pushw	x
5157  0497 1e08          	ldw	x,(OFST+2,sp)
5158  0499 cd0000        	call	_MemcpyFunc
5160  049c 5b03          	addw	sp,#3
5161                     ; 670 	length1 += length2;
5163  049e 1e01          	ldw	x,(OFST-5,sp)
5164  04a0 72fb03        	addw	x,(OFST-3,sp)
5165  04a3 1f01          	ldw	(OFST-5,sp),x
5166                     ; 671 	point += length2;
5168  04a5 1e05          	ldw	x,(OFST-1,sp)
5169  04a7 72fb03        	addw	x,(OFST-3,sp)
5170                     ; 672 	*point++ = ',';			//2个参数之间只能用逗号连接
5172  04aa a62c          	ld	a,#44
5173  04ac f7            	ld	(x),a
5174  04ad 5c            	incw	x
5175  04ae 1f05          	ldw	(OFST-1,sp),x
5176                     ; 673 	length2 = JX_Strlen( (char const *)Parameter2);
5178  04b0 1e0c          	ldw	x,(OFST+6,sp)
5179  04b2 ad46          	call	LC006
5180  04b4 1f03          	ldw	(OFST-3,sp),x
5181                     ; 674 	MemcpyFunc( (u8 *)point, Parameter2, length2);		//复制字符串到缓冲中
5183  04b6 7b04          	ld	a,(OFST-2,sp)
5184  04b8 88            	push	a
5185  04b9 1e0d          	ldw	x,(OFST+7,sp)
5186  04bb 89            	pushw	x
5187  04bc 1e08          	ldw	x,(OFST+2,sp)
5188  04be cd0000        	call	_MemcpyFunc
5190  04c1 5b03          	addw	sp,#3
5191                     ; 675 	length1 += length2;
5193  04c3 1e01          	ldw	x,(OFST-5,sp)
5194  04c5 72fb03        	addw	x,(OFST-3,sp)
5195  04c8 1f01          	ldw	(OFST-5,sp),x
5196                     ; 676 	point += length2;
5198  04ca 1e05          	ldw	x,(OFST-1,sp)
5199  04cc 72fb03        	addw	x,(OFST-3,sp)
5200                     ; 677 	*point++ = AT_TAIL_0;		//包尾
5202  04cf a60d          	ld	a,#13
5203  04d1 f7            	ld	(x),a
5204  04d2 5c            	incw	x
5205                     ; 678 	*point++ = AT_TAIL_1;
5207  04d3 a60a          	ld	a,#10
5208  04d5 f7            	ld	(x),a
5209  04d6 5c            	incw	x
5210  04d7 1f05          	ldw	(OFST-1,sp),x
5211                     ; 680 	if (Cmd > AT_CMD_S_D)		//有包头?
5213  04d9 7b07          	ld	a,(OFST+1,sp)
5214  04db a108          	cp	a,#8
5215  04dd 1e01          	ldw	x,(OFST-5,sp)
5216  04df 2505          	jrult	L1072
5217                     ; 685 		length1 += 5;
5219  04e1 1c0005        	addw	x,#5
5221  04e4 2003          	jra	L3072
5222  04e6               L1072:
5223                     ; 693 		length1 += 3;
5225  04e6 1c0003        	addw	x,#3
5226  04e9               L3072:
5227  04e9 1f01          	ldw	(OFST-5,sp),x
5228                     ; 696 	SetBusUart(COM_1, PARITY_NULL);		//设置串口通道号
5230  04eb 5f            	clrw	x
5231  04ec a601          	ld	a,#1
5232  04ee 95            	ld	xh,a
5233  04ef cd0000        	call	_SetBusUart
5235                     ; 697 	StartSendBusUartGroup(length1);
5237  04f2 7b02          	ld	a,(OFST-4,sp)
5238  04f4 cd0000        	call	_StartSendBusUartGroup
5240                     ; 698 }
5243  04f7 5b07          	addw	sp,#7
5244  04f9 81            	ret	
5246  04fa               LC006:
5247  04fa cd0307        	call	_JX_Strlen
5249  04fd 5f            	clrw	x
5250  04fe 97            	ld	xl,a
5251  04ff 81            	ret	
5357                     ; 706 void PackAtCmdParameter3(u8 Cmd, u8 *Parameter1, u8 *Parameter2, u8 *Parameter3)
5357                     ; 707 {
5358                     	switch	.text
5359  0500               _PackAtCmdParameter3:
5361  0500 88            	push	a
5362  0501 5206          	subw	sp,#6
5363       00000006      OFST:	set	6
5366                     ; 708 	u16 length0 = 0, length1 = 0, length2 = 0, length3 = 0;
5374                     ; 711 	if((NULL == Parameter1)||(NULL == Parameter2)||(NULL == Parameter3))
5376  0503 1e0a          	ldw	x,(OFST+4,sp)
5377  0505 2603cc05e0    	jreq	L272
5379  050a 1e0c          	ldw	x,(OFST+6,sp)
5380  050c 27f9          	jreq	L272
5382  050e 1e0e          	ldw	x,(OFST+8,sp)
5383                     ; 713 		return;
5385  0510 27f5          	jreq	L272
5386                     ; 716 	point = aucUartTxBuffer;
5388  0512 ae0000        	ldw	x,#_aucUartTxBuffer
5389                     ; 717 	if (Cmd > AT_CMD_S_D)		//有包头?
5391  0515 7b07          	ld	a,(OFST+1,sp)
5392  0517 a108          	cp	a,#8
5393  0519 2508          	jrult	L7572
5394                     ; 719 		*point++ = AT_HEAD_0;
5396  051b a641          	ld	a,#65
5397  051d f7            	ld	(x),a
5398  051e 5c            	incw	x
5399                     ; 720 		*point++ = AT_HEAD_1;
5401  051f a654          	ld	a,#84
5402  0521 f7            	ld	(x),a
5403  0522 5c            	incw	x
5404  0523               L7572:
5405  0523 1f05          	ldw	(OFST-1,sp),x
5406                     ; 722 	length0 = JX_Strlen( (char const *)aucAtCmd[Cmd] );
5408  0525 7b07          	ld	a,(OFST+1,sp)
5409  0527 5f            	clrw	x
5410  0528 97            	ld	xl,a
5411  0529 58            	sllw	x
5412  052a de037b        	ldw	x,(_aucAtCmd,x)
5413  052d cd05e3        	call	LC007
5414  0530 1f01          	ldw	(OFST-5,sp),x
5415                     ; 723 	MemcpyFunc( (u8 *)point, aucAtCmd[Cmd], length0);		//复制字符串到缓冲中
5417  0532 7b02          	ld	a,(OFST-4,sp)
5418  0534 88            	push	a
5419  0535 7b08          	ld	a,(OFST+2,sp)
5420  0537 5f            	clrw	x
5421  0538 97            	ld	xl,a
5422  0539 58            	sllw	x
5423  053a de037b        	ldw	x,(_aucAtCmd,x)
5424  053d 89            	pushw	x
5425  053e 1e08          	ldw	x,(OFST+2,sp)
5426  0540 cd0000        	call	_MemcpyFunc
5428  0543 5b03          	addw	sp,#3
5429                     ; 724 	point += length0;
5431  0545 1e05          	ldw	x,(OFST-1,sp)
5432  0547 72fb01        	addw	x,(OFST-5,sp)
5433  054a 1f05          	ldw	(OFST-1,sp),x
5434                     ; 729 	length1 = JX_Strlen( (char *)Parameter1);//(char const *)
5436  054c 1e0a          	ldw	x,(OFST+4,sp)
5437  054e cd05e3        	call	LC007
5438  0551 1f03          	ldw	(OFST-3,sp),x
5439                     ; 730 	MemcpyFunc( (u8 *)point, Parameter1, length1);		//复制字符串到缓冲中
5441  0553 7b04          	ld	a,(OFST-2,sp)
5442  0555 88            	push	a
5443  0556 1e0b          	ldw	x,(OFST+5,sp)
5444  0558 89            	pushw	x
5445  0559 1e08          	ldw	x,(OFST+2,sp)
5446  055b cd0000        	call	_MemcpyFunc
5448  055e 5b03          	addw	sp,#3
5449                     ; 731 	length0 += length1;
5451  0560 1e01          	ldw	x,(OFST-5,sp)
5452  0562 72fb03        	addw	x,(OFST-3,sp)
5453  0565 1f01          	ldw	(OFST-5,sp),x
5454                     ; 732 	point += length1;
5456  0567 1e05          	ldw	x,(OFST-1,sp)
5457  0569 72fb03        	addw	x,(OFST-3,sp)
5458                     ; 733 	*point++ = ',';			//2个参数之间只能用逗号连接
5460  056c a62c          	ld	a,#44
5461  056e f7            	ld	(x),a
5462  056f 5c            	incw	x
5463  0570 1f05          	ldw	(OFST-1,sp),x
5464                     ; 735 	length2 = JX_Strlen( (char const *)Parameter2);
5466  0572 1e0c          	ldw	x,(OFST+6,sp)
5467  0574 ad6d          	call	LC007
5468  0576 1f03          	ldw	(OFST-3,sp),x
5469                     ; 736 	MemcpyFunc( (u8 *)point, Parameter2, length2);		//复制字符串到缓冲中
5471  0578 7b04          	ld	a,(OFST-2,sp)
5472  057a 88            	push	a
5473  057b 1e0d          	ldw	x,(OFST+7,sp)
5474  057d 89            	pushw	x
5475  057e 1e08          	ldw	x,(OFST+2,sp)
5476  0580 cd0000        	call	_MemcpyFunc
5478  0583 5b03          	addw	sp,#3
5479                     ; 737 	length0 += length2+1;
5481  0585 1e03          	ldw	x,(OFST-3,sp)
5482  0587 5c            	incw	x
5483  0588 72fb01        	addw	x,(OFST-5,sp)
5484  058b 1f01          	ldw	(OFST-5,sp),x
5485                     ; 738 	point += length2;
5487  058d 1e05          	ldw	x,(OFST-1,sp)
5488  058f 72fb03        	addw	x,(OFST-3,sp)
5489                     ; 739 	*point++ = ',';			//2个参数之间只能用逗号连接
5491  0592 a62c          	ld	a,#44
5492  0594 f7            	ld	(x),a
5493  0595 5c            	incw	x
5494  0596 1f05          	ldw	(OFST-1,sp),x
5495                     ; 741 	length3 = JX_Strlen( (char const *)Parameter3);
5497  0598 1e0e          	ldw	x,(OFST+8,sp)
5498  059a ad47          	call	LC007
5499  059c 1f03          	ldw	(OFST-3,sp),x
5500                     ; 742 	MemcpyFunc( (u8 *)point, Parameter3, length3);		//复制字符串到缓冲中
5502  059e 7b04          	ld	a,(OFST-2,sp)
5503  05a0 88            	push	a
5504  05a1 1e0f          	ldw	x,(OFST+9,sp)
5505  05a3 89            	pushw	x
5506  05a4 1e08          	ldw	x,(OFST+2,sp)
5507  05a6 cd0000        	call	_MemcpyFunc
5509  05a9 5b03          	addw	sp,#3
5510                     ; 743 	length0 += length3+1;
5512  05ab 1e03          	ldw	x,(OFST-3,sp)
5513  05ad 5c            	incw	x
5514  05ae 72fb01        	addw	x,(OFST-5,sp)
5515  05b1 1f01          	ldw	(OFST-5,sp),x
5516                     ; 744 	point += length3;
5518  05b3 1e05          	ldw	x,(OFST-1,sp)
5519  05b5 72fb03        	addw	x,(OFST-3,sp)
5520                     ; 746 	*point++ = AT_TAIL_0;		//包尾
5522  05b8 a60d          	ld	a,#13
5523  05ba f7            	ld	(x),a
5524  05bb 5c            	incw	x
5525                     ; 747 	*point++ = AT_TAIL_1;
5527  05bc a60a          	ld	a,#10
5528  05be f7            	ld	(x),a
5529  05bf 5c            	incw	x
5530  05c0 1f05          	ldw	(OFST-1,sp),x
5531                     ; 749 	if (Cmd > AT_CMD_S_D)		//有包头?
5533  05c2 7b07          	ld	a,(OFST+1,sp)
5534  05c4 a108          	cp	a,#8
5535  05c6 1e01          	ldw	x,(OFST-5,sp)
5536  05c8 2505          	jrult	L1672
5537                     ; 754 		length0 += 5;
5539  05ca 1c0005        	addw	x,#5
5541  05cd 2003          	jra	L3672
5542  05cf               L1672:
5543                     ; 762 		length0 += 3;
5545  05cf 1c0003        	addw	x,#3
5546  05d2               L3672:
5547  05d2 1f01          	ldw	(OFST-5,sp),x
5548                     ; 765 	SetBusUart(COM_1, PARITY_NULL);		//设置串口通道号
5550  05d4 5f            	clrw	x
5551  05d5 a601          	ld	a,#1
5552  05d7 95            	ld	xh,a
5553  05d8 cd0000        	call	_SetBusUart
5555                     ; 766 	StartSendBusUartGroup(length0);
5557  05db 7b02          	ld	a,(OFST-4,sp)
5558  05dd cd0000        	call	_StartSendBusUartGroup
5560                     ; 767 }
5561  05e0               L272:
5564  05e0 5b07          	addw	sp,#7
5565  05e2 81            	ret	
5567  05e3               LC007:
5568  05e3 cd0307        	call	_JX_Strlen
5570  05e6 5f            	clrw	x
5571  05e7 97            	ld	xl,a
5572  05e8 81            	ret	
5643                     ; 774 void PackAtCmdTcpsend(u8 Length)
5643                     ; 775 {
5644                     	switch	.text
5645  05e9               _PackAtCmdTcpsend:
5647  05e9 88            	push	a
5648  05ea 520b          	subw	sp,#11
5649       0000000b      OFST:	set	11
5652                     ; 778 	point = aucUartTxBuffer;
5654  05ec ae0000        	ldw	x,#_aucUartTxBuffer
5655                     ; 779 	*point++ = AT_HEAD_0;
5657  05ef a641          	ld	a,#65
5658  05f1 f7            	ld	(x),a
5659  05f2 5c            	incw	x
5660                     ; 780 	*point++ = AT_HEAD_1;
5662  05f3 a654          	ld	a,#84
5663  05f5 f7            	ld	(x),a
5664  05f6 5c            	incw	x
5665  05f7 1f0a          	ldw	(OFST-1,sp),x
5666                     ; 781 	length1 = JX_Strlen( (char const *)aucAtCmd[AT_CMD_TCPSEND] );
5668  05f9 ae0257        	ldw	x,#_aucAtTcpsend
5669  05fc cd0307        	call	_JX_Strlen
5671  05ff 5f            	clrw	x
5672  0600 97            	ld	xl,a
5673  0601 1f01          	ldw	(OFST-10,sp),x
5674                     ; 782 	MemcpyFunc( (u8 *)point, aucAtCmd[AT_CMD_TCPSEND], length1);		//复制字符串到缓冲中
5676  0603 7b02          	ld	a,(OFST-9,sp)
5677  0605 88            	push	a
5678  0606 ae0257        	ldw	x,#_aucAtTcpsend
5679  0609 89            	pushw	x
5680  060a 1e0d          	ldw	x,(OFST+2,sp)
5681  060c cd0000        	call	_MemcpyFunc
5683  060f 5b03          	addw	sp,#3
5684                     ; 783 	point += length1;
5686  0611 1e0a          	ldw	x,(OFST-1,sp)
5687  0613 72fb01        	addw	x,(OFST-10,sp)
5688  0616 1f0a          	ldw	(OFST-1,sp),x
5689                     ; 799 	if (Length > 99)
5691  0618 7b0c          	ld	a,(OFST+1,sp)
5692  061a a164          	cp	a,#100
5693  061c 2532          	jrult	L5103
5694                     ; 801 		length2 = 3;		
5696  061e ae0003        	ldw	x,#3
5697  0621 1f03          	ldw	(OFST-8,sp),x
5698                     ; 802 		buffer[0] = '0' + Length / 100;
5700  0623 ae0064        	ldw	x,#100
5701  0626 9093          	ldw	y,x
5702  0628 5f            	clrw	x
5703  0629 97            	ld	xl,a
5704  062a 65            	divw	x,y
5705  062b 9f            	ld	a,xl
5706  062c ab30          	add	a,#48
5707  062e 6b05          	ld	(OFST-6,sp),a
5708                     ; 803 		buffer[1] = '0' + (Length%100) / 10;
5710  0630 7b0c          	ld	a,(OFST+1,sp)
5711  0632 5f            	clrw	x
5712  0633 97            	ld	xl,a
5713  0634 a664          	ld	a,#100
5714  0636 cd0000        	call	c_smodx
5716  0639 a60a          	ld	a,#10
5717  063b cd0000        	call	c_sdivx
5719  063e 1c0030        	addw	x,#48
5720  0641 01            	rrwa	x,a
5721  0642 6b06          	ld	(OFST-5,sp),a
5722                     ; 804 		buffer[2] = '0' + Length % 10;
5724  0644 7b0c          	ld	a,(OFST+1,sp)
5725  0646 ad64          	call	LC008
5726  0648 909f          	ld	a,yl
5727  064a ab30          	add	a,#48
5728  064c 6b07          	ld	(OFST-4,sp),a
5730  064e 2025          	jra	L7103
5731  0650               L5103:
5732                     ; 806 	else if (Length > 9) 	//10~39?
5734  0650 a10a          	cp	a,#10
5735  0652 2518          	jrult	L1203
5736                     ; 808 		length2 = 2;
5738  0654 ae0002        	ldw	x,#2
5739  0657 1f03          	ldw	(OFST-8,sp),x
5740                     ; 809 		buffer[0] = '0' + Length / 10;
5742  0659 ad51          	call	LC008
5743  065b 9f            	ld	a,xl
5744  065c ab30          	add	a,#48
5745  065e 6b05          	ld	(OFST-6,sp),a
5746                     ; 810 		buffer[1] = '0' + Length % 10;
5748  0660 7b0c          	ld	a,(OFST+1,sp)
5749  0662 ad48          	call	LC008
5750  0664 909f          	ld	a,yl
5751  0666 ab30          	add	a,#48
5752  0668 6b06          	ld	(OFST-5,sp),a
5754  066a 2009          	jra	L7103
5755  066c               L1203:
5756                     ; 814 		length2 = 1;
5758  066c ae0001        	ldw	x,#1
5759  066f 1f03          	ldw	(OFST-8,sp),x
5760                     ; 815 		buffer[0] = '0' + Length;
5762  0671 ab30          	add	a,#48
5763  0673 6b05          	ld	(OFST-6,sp),a
5764  0675               L7103:
5765                     ; 819 	MemcpyFunc( (u8 *)point, buffer, length2);		//复制字符串到缓冲中
5767  0675 7b04          	ld	a,(OFST-7,sp)
5768  0677 88            	push	a
5769  0678 96            	ldw	x,sp
5770  0679 1c0006        	addw	x,#OFST-5
5771  067c 89            	pushw	x
5772  067d 1e0d          	ldw	x,(OFST+2,sp)
5773  067f cd0000        	call	_MemcpyFunc
5775  0682 5b03          	addw	sp,#3
5776                     ; 820 	point += length2;
5778  0684 1e0a          	ldw	x,(OFST-1,sp)
5779  0686 72fb03        	addw	x,(OFST-8,sp)
5780                     ; 821 	*point++ = AT_TAIL_0;		//包尾
5782  0689 a60d          	ld	a,#13
5783  068b f7            	ld	(x),a
5784  068c 5c            	incw	x
5785                     ; 822 	*point++ = AT_TAIL_1;
5787  068d a60a          	ld	a,#10
5788  068f f7            	ld	(x),a
5789  0690 5c            	incw	x
5790  0691 1f0a          	ldw	(OFST-1,sp),x
5791                     ; 823 	length1 += length2;
5793  0693 1e01          	ldw	x,(OFST-10,sp)
5794  0695 72fb03        	addw	x,(OFST-8,sp)
5795                     ; 824 	length1 += 2+2;            //头和尾 长度
5797  0698 1c0004        	addw	x,#4
5798  069b 1f01          	ldw	(OFST-10,sp),x
5799                     ; 825 	SetBusUart(COM_1, PARITY_NULL);		//设置串口通道号
5801  069d 5f            	clrw	x
5802  069e a601          	ld	a,#1
5803  06a0 95            	ld	xh,a
5804  06a1 cd0000        	call	_SetBusUart
5806                     ; 827 	StartSendBusUartGroup(length1);
5808  06a4 7b02          	ld	a,(OFST-9,sp)
5809  06a6 cd0000        	call	_StartSendBusUartGroup
5811                     ; 828 }
5814  06a9 5b0c          	addw	sp,#12
5815  06ab 81            	ret	
5817  06ac               LC008:
5818  06ac ae000a        	ldw	x,#10
5819  06af 9093          	ldw	y,x
5820  06b1 5f            	clrw	x
5821  06b2 97            	ld	xl,a
5822  06b3 65            	divw	x,y
5823  06b4 81            	ret	
5857                     ; 835 void PackTcpSendData(u8 nLen)
5857                     ; 836 {	
5858                     	switch	.text
5859  06b5               _PackTcpSendData:
5861  06b5 88            	push	a
5862       00000000      OFST:	set	0
5865                     ; 837 	aucUartTxBuffer[nLen] = AT_TAIL_0; //包尾
5867  06b6 5f            	clrw	x
5868  06b7 97            	ld	xl,a
5869  06b8 a60d          	ld	a,#13
5870  06ba d70000        	ld	(_aucUartTxBuffer,x),a
5871                     ; 838 	SetBusUart(COM_1, PARITY_NULL);		//设置串口通道号
5873  06bd 5f            	clrw	x
5874  06be a601          	ld	a,#1
5875  06c0 95            	ld	xh,a
5876  06c1 cd0000        	call	_SetBusUart
5878                     ; 839 	StartSendBusUartGroup(nLen+1);
5880  06c4 7b01          	ld	a,(OFST+1,sp)
5881  06c6 4c            	inc	a
5882  06c7 cd0000        	call	_StartSendBusUartGroup
5884                     ; 840 }
5887  06ca 84            	pop	a
5888  06cb 81            	ret	
5933                     ; 852 void PackAtCmdExt(void)
5933                     ; 853 {
5934                     	switch	.text
5935  06cc               _PackAtCmdExt:
5937  06cc 5204          	subw	sp,#4
5938       00000004      OFST:	set	4
5941                     ; 854 	u16 length = 0;
5943  06ce 5f            	clrw	x
5944  06cf 1f01          	ldw	(OFST-3,sp),x
5945                     ; 855 	u8 *point  = NULL;
5947                     ; 856 	point = aucUartTxBuffer;
5949  06d1 ae0000        	ldw	x,#_aucUartTxBuffer
5950                     ; 858 		*point++ = AT_HEAD_0;
5952  06d4 a641          	ld	a,#65
5953  06d6 f7            	ld	(x),a
5954  06d7 5c            	incw	x
5955                     ; 859 		*point++ = AT_HEAD_1;
5957  06d8 a654          	ld	a,#84
5958  06da f7            	ld	(x),a
5959  06db 5c            	incw	x
5960                     ; 861 	*point++ = AT_TAIL_0;		//包尾
5962  06dc a60d          	ld	a,#13
5963  06de f7            	ld	(x),a
5964  06df 5c            	incw	x
5965                     ; 862 	*point++ = AT_TAIL_1;
5967  06e0 a60a          	ld	a,#10
5968  06e2 f7            	ld	(x),a
5969  06e3 5c            	incw	x
5970  06e4 1f03          	ldw	(OFST-1,sp),x
5971                     ; 864 		length += 2;
5973  06e6 1e01          	ldw	x,(OFST-3,sp)
5974  06e8 1c0002        	addw	x,#2
5975  06eb 1f01          	ldw	(OFST-3,sp),x
5976                     ; 866 	SetBusUart(COM_1, PARITY_NULL);		//设置串口通道号
5978  06ed 5f            	clrw	x
5979  06ee a601          	ld	a,#1
5980  06f0 95            	ld	xh,a
5981  06f1 cd0000        	call	_SetBusUart
5983                     ; 867 	StartSendBusUartGroup(length);
5985  06f4 7b02          	ld	a,(OFST-2,sp)
5986  06f6 cd0000        	call	_StartSendBusUartGroup
5988                     ; 868 }
5991  06f9 5b04          	addw	sp,#4
5992  06fb 81            	ret	
6025                     ; 879 void  UC_SetSleepCnt(uint32_t dwWaitmS)
6025                     ; 880 {
6026                     	switch	.text
6027  06fc               _UC_SetSleepCnt:
6029       00000000      OFST:	set	0
6032                     ; 881 	m_dwTimeCnt = (dwWaitmS);
6034  06fc 1e05          	ldw	x,(OFST+5,sp)
6035  06fe cf00a9        	ldw	_m_dwTimeCnt+2,x
6036  0701 1e03          	ldw	x,(OFST+3,sp)
6037  0703 cf00a7        	ldw	_m_dwTimeCnt,x
6038                     ; 882 }
6041  0706 81            	ret	
6044                     	switch	.data
6045  00cb               L5703_dwTime:
6046  00cb 00000000      	dc.l	0
6085                     ; 893 uint8_t  UC_SleepProc(void)
6085                     ; 894 {
6086                     	switch	.text
6087  0707               _UC_SleepProc:
6089  0707 5204          	subw	sp,#4
6090       00000004      OFST:	set	4
6093                     ; 896 	uint32_t  dwTimeNow = 0;
6095  0709 5f            	clrw	x
6096  070a 1f03          	ldw	(OFST-1,sp),x
6097  070c 1f01          	ldw	(OFST-3,sp),x
6098                     ; 899 	dwTimeNow = GetSysTemTick();
6100  070e cd0000        	call	_GetSysTemTick
6102  0711 96            	ldw	x,sp
6103  0712 5c            	incw	x
6104  0713 cd0000        	call	c_rtol
6106                     ; 901 	if (dwTime < dwTimeNow)
6108  0716 ae00cb        	ldw	x,#L5703_dwTime
6109  0719 cd0000        	call	c_ltor
6111  071c 96            	ldw	x,sp
6112  071d 5c            	incw	x
6113  071e cd0000        	call	c_lcmp
6115  0721 240a          	jruge	L5113
6116                     ; 903 		 if(dwTimeNow - dwTime > m_dwTimeCnt)
6118  0723 96            	ldw	x,sp
6119  0724 5c            	incw	x
6120  0725 cd0000        	call	c_ltor
6122  0728 ae00cb        	ldw	x,#L5703_dwTime
6125                     ; 905 			dwTime = GetSysTemTick();
6128                     ; 906 			return TRUE;
6130  072b 2008          	jp	LC009
6131  072d               L5113:
6132                     ; 909 	else if ((dwTime - dwTimeNow) > m_dwTimeCnt)
6134  072d ae00cb        	ldw	x,#L5703_dwTime
6135  0730 cd0000        	call	c_ltor
6137  0733 96            	ldw	x,sp
6138  0734 5c            	incw	x
6141                     ; 911 		dwTime = GetSysTemTick();
6145                     ; 912 		return TRUE;
6147  0735               LC009:
6148  0735 cd0000        	call	c_lsub
6149  0738 ae00a7        	ldw	x,#_m_dwTimeCnt
6150  073b cd0000        	call	c_lcmp
6151  073e 230e          	jrule	L1213
6153  0740 cd0000        	call	_GetSysTemTick
6154  0743 ae00cb        	ldw	x,#L5703_dwTime
6155  0746 cd0000        	call	c_rtol
6157  0749 a601          	ld	a,#1
6159  074b               L633:
6161  074b 5b04          	addw	sp,#4
6162  074d 81            	ret	
6163  074e               L1213:
6164                     ; 915 	return FALSE;
6166  074e 4f            	clr	a
6168  074f 20fa          	jra	L633
6216                     ; 927 uint8_t  UC_SleepFunc(uint32_t dwWaitmS)
6216                     ; 928 {
6217                     	switch	.text
6218  0751               _UC_SleepFunc:
6220  0751 5208          	subw	sp,#8
6221       00000008      OFST:	set	8
6224                     ; 929 	uint32_t dwTime = 0, dwNowTime = 0;
6226  0753 96            	ldw	x,sp
6227  0754 5c            	incw	x
6228  0755 cd0000        	call	c_ltor
6232  0758 96            	ldw	x,sp
6233  0759 1c0005        	addw	x,#OFST-3
6234  075c cd0000        	call	c_ltor
6236                     ; 932 	dwTime = GetSysTemTick();	
6238  075f cd0000        	call	_GetSysTemTick
6240  0762 96            	ldw	x,sp
6241  0763 5c            	incw	x
6242  0764 cd0000        	call	c_rtol
6244  0767               L5413:
6245                     ; 936 		dwNowTime = GetSysTemTick();
6247  0767 cd0000        	call	_GetSysTemTick
6249  076a 96            	ldw	x,sp
6250  076b 1c0005        	addw	x,#OFST-3
6251  076e cd0000        	call	c_rtol
6253                     ; 937 		if (dwTime < dwNowTime)
6255  0771 96            	ldw	x,sp
6256  0772 5c            	incw	x
6257  0773 cd0000        	call	c_ltor
6259  0776 96            	ldw	x,sp
6260  0777 1c0005        	addw	x,#OFST-3
6261  077a cd0000        	call	c_lcmp
6263  077d 96            	ldw	x,sp
6264  077e 240a          	jruge	L1513
6265                     ; 939 			 if(dwNowTime - dwTime > dwWaitmS)
6267  0780 1c0005        	addw	x,#OFST-3
6268  0783 cd0000        	call	c_ltor
6270  0786 96            	ldw	x,sp
6271  0787 5c            	incw	x
6274                     ; 941 				break;
6276  0788 200a          	jra	L7413
6277  078a               L1513:
6278                     ; 944 		else if ((dwTime - dwNowTime) > dwWaitmS)
6280  078a 1c0001        	addw	x,#OFST-7
6281  078d cd0000        	call	c_ltor
6283  0790 96            	ldw	x,sp
6284  0791 1c0005        	addw	x,#OFST-3
6287                     ; 946 			break;
6288  0794               L7413:
6289  0794 cd0000        	call	c_lsub
6290  0797 96            	ldw	x,sp
6291  0798 1c000b        	addw	x,#OFST+3
6292  079b cd0000        	call	c_lcmp
6293  079e 2304          	jrule	L5513
6294                     ; 954         return 0;
6296  07a0 4f            	clr	a
6299  07a1 5b08          	addw	sp,#8
6300  07a3 81            	ret	
6301  07a4               L5513:
6302                     ; 952 		FeedSoftWareIwdg();
6304  07a4 cd0000        	call	_FeedSoftWareIwdg
6307  07a7 20be          	jra	L5413
6384                     	switch	.const
6385  046d               L253:
6386  046d 00004001      	dc.l	16385
6387  0471               L453:
6388  0471 00000401      	dc.l	1025
6389                     ; 967 int8_t  *QH_bufbuf(int8_t* pbSrc, uint32_t wSrcLen, int8_t* pbSub, uint32_t wSubLen)
6389                     ; 968 {
6390                     	switch	.text
6391  07a9               _QH_bufbuf:
6393  07a9 89            	pushw	x
6394  07aa 5207          	subw	sp,#7
6395       00000007      OFST:	set	7
6398                     ; 969 	int8_t  *pbSrcEnd = pbSrc + wSrcLen;
6400  07ac 72fb0e        	addw	x,(OFST+7,sp)
6401  07af 1f05          	ldw	(OFST-2,sp),x
6402                     ; 970 	u8 nLoop = 0;
6404                     ; 972 	if ((pbSrc == NULL) || (pbSub == NULL) || (wSrcLen > 16384) || (wSubLen > 1024))
6406  07b1 1e08          	ldw	x,(OFST+1,sp)
6407  07b3 2603cc0841    	jreq	LC010
6409  07b8 1e10          	ldw	x,(OFST+9,sp)
6410  07ba 27f9          	jreq	LC010
6412  07bc 96            	ldw	x,sp
6413  07bd 1c000c        	addw	x,#OFST+5
6414  07c0 cd0000        	call	c_ltor
6416  07c3 ae046d        	ldw	x,#L253
6417  07c6 cd0000        	call	c_lcmp
6419  07c9 2476          	jruge	LC010
6421  07cb 96            	ldw	x,sp
6422  07cc 1c0012        	addw	x,#OFST+11
6423  07cf cd0000        	call	c_ltor
6425  07d2 ae0471        	ldw	x,#L453
6426  07d5 cd0000        	call	c_lcmp
6428  07d8 255e          	jrult	L7223
6429                     ; 974 		return (NULL);
6431  07da 2065          	jp	LC010
6432  07dc               L5223:
6433                     ; 979 		nLoop = 0;
6435  07dc 0f07          	clr	(OFST+0,sp)
6436  07de               L3323:
6437                     ; 982 			if(pbSrc[nLoop] != pbSub[nLoop])
6439  07de 7b10          	ld	a,(OFST+9,sp)
6440  07e0 97            	ld	xl,a
6441  07e1 7b11          	ld	a,(OFST+10,sp)
6442  07e3 1b07          	add	a,(OFST+0,sp)
6443  07e5 2401          	jrnc	L653
6444  07e7 5c            	incw	x
6445  07e8               L653:
6446  07e8 02            	rlwa	x,a
6447  07e9 f6            	ld	a,(x)
6448  07ea 6b04          	ld	(OFST-3,sp),a
6449  07ec 7b08          	ld	a,(OFST+1,sp)
6450  07ee 97            	ld	xl,a
6451  07ef 7b09          	ld	a,(OFST+2,sp)
6452  07f1 1b07          	add	a,(OFST+0,sp)
6453  07f3 2401          	jrnc	L063
6454  07f5 5c            	incw	x
6455  07f6               L063:
6456  07f6 02            	rlwa	x,a
6457  07f7 f6            	ld	a,(x)
6458  07f8 1104          	cp	a,(OFST-3,sp)
6459  07fa 2615          	jrne	L7323
6460                     ; 984 				break;
6462                     ; 986 			nLoop++;
6464  07fc 0c07          	inc	(OFST+0,sp)
6465                     ; 987 		}while(nLoop<wSubLen);
6467  07fe 7b07          	ld	a,(OFST+0,sp)
6468  0800 b703          	ld	c_lreg+3,a
6469  0802 3f02          	clr	c_lreg+2
6470  0804 3f01          	clr	c_lreg+1
6471  0806 3f00          	clr	c_lreg
6472  0808 96            	ldw	x,sp
6473  0809 1c0012        	addw	x,#OFST+11
6474  080c cd0000        	call	c_lcmp
6476  080f 25cd          	jrult	L3323
6477  0811               L7323:
6478                     ; 988 		if(wSubLen <=nLoop)
6480  0811 7b07          	ld	a,(OFST+0,sp)
6481  0813 b703          	ld	c_lreg+3,a
6482  0815 3f02          	clr	c_lreg+2
6483  0817 3f01          	clr	c_lreg+1
6484  0819 3f00          	clr	c_lreg
6485  081b 96            	ldw	x,sp
6486  081c 5c            	incw	x
6487  081d cd0000        	call	c_rtol
6489  0820 96            	ldw	x,sp
6490  0821 1c0012        	addw	x,#OFST+11
6491  0824 cd0000        	call	c_ltor
6493  0827 96            	ldw	x,sp
6494  0828 5c            	incw	x
6495  0829 cd0000        	call	c_lcmp
6497  082c 2205          	jrugt	L3423
6498                     ; 990 			return pbSrc;
6500  082e 1e08          	ldw	x,(OFST+1,sp)
6502  0830               L263:
6504  0830 5b09          	addw	sp,#9
6505  0832 81            	ret	
6506  0833               L3423:
6507                     ; 992 		pbSrc++;
6509  0833 1e08          	ldw	x,(OFST+1,sp)
6510  0835 5c            	incw	x
6511  0836 1f08          	ldw	(OFST+1,sp),x
6512  0838               L7223:
6513                     ; 977 	while ((pbSrc+wSubLen) <= pbSrcEnd)
6515  0838 1e08          	ldw	x,(OFST+1,sp)
6516  083a 72fb14        	addw	x,(OFST+13,sp)
6517  083d 1305          	cpw	x,(OFST-2,sp)
6518  083f 239b          	jrule	L5223
6519                     ; 995 	return (NULL);
6521  0841               LC010:
6523  0841 5f            	clrw	x
6525  0842 20ec          	jra	L263
6608                     ; 1037 u8  QH_SearchStrVal(int8_t* pStart, int8_t* pEnd, uint32_t *dwVal)
6608                     ; 1038 {
6609                     	switch	.text
6610  0844               _QH_SearchStrVal:
6612  0844 89            	pushw	x
6613  0845 520b          	subw	sp,#11
6614       0000000b      OFST:	set	11
6617                     ; 1039 	u8 fGetFirst = FALSE, fRtnVal = FALSE;
6619  0847 0f0a          	clr	(OFST-1,sp)
6622  0849 0f05          	clr	(OFST-6,sp)
6623                     ; 1040 	uint32_t  val = 0;
6625  084b 5f            	clrw	x
6626  084c 1f08          	ldw	(OFST-3,sp),x
6627  084e 1f06          	ldw	(OFST-5,sp),x
6628                     ; 1044 	if ((pStart == NULL) || (pEnd == NULL) || (dwVal == NULL))
6630  0850 1e0c          	ldw	x,(OFST+1,sp)
6631  0852 2708          	jreq	L5033
6633  0854 1e10          	ldw	x,(OFST+5,sp)
6634  0856 2704          	jreq	L5033
6636  0858 1e12          	ldw	x,(OFST+7,sp)
6637  085a 265a          	jrne	L3133
6638  085c               L5033:
6639                     ; 1046 		return (fRtnVal);
6641  085c 4f            	clr	a
6643  085d 2070          	jra	L663
6644  085f               L1133:
6645                     ; 1051 		nByteTemp = *pStart++;
6647  085f f6            	ld	a,(x)
6648  0860 5c            	incw	x
6649  0861 1f0c          	ldw	(OFST+1,sp),x
6650  0863 6b0b          	ld	(OFST+0,sp),a
6651                     ; 1053 		if (fGetFirst == FALSE)
6653  0865 0d0a          	tnz	(OFST-1,sp)
6654  0867 260c          	jrne	L7133
6655                     ; 1055 			if (nByteTemp>='0' && nByteTemp<='9')
6657  0869 a130          	cp	a,#48
6658  086b 2f08          	jrslt	L7133
6660  086d a13a          	cp	a,#58
6661  086f 2e04          	jrsge	L7133
6662                     ; 1057 				fGetFirst = TRUE;
6664  0871 a601          	ld	a,#1
6665  0873 6b0a          	ld	(OFST-1,sp),a
6666  0875               L7133:
6667                     ; 1061 		if (fGetFirst == TRUE)
6669  0875 7b0a          	ld	a,(OFST-1,sp)
6670  0877 4a            	dec	a
6671  0878 263c          	jrne	L3133
6672                     ; 1063 			if (nByteTemp>='0' && nByteTemp<='9')
6674  087a 7b0b          	ld	a,(OFST+0,sp)
6675  087c a130          	cp	a,#48
6676  087e 2f3c          	jrslt	L5133
6678  0880 a13a          	cp	a,#58
6679  0882 2e38          	jrsge	L5133
6680                     ; 1065 				val = val*10 + nByteTemp - '0';
6682  0884 b703          	ld	c_lreg+3,a
6683  0886 48            	sll	a
6684  0887 4f            	clr	a
6685  0888 a200          	sbc	a,#0
6686  088a b702          	ld	c_lreg+2,a
6687  088c b701          	ld	c_lreg+1,a
6688  088e b700          	ld	c_lreg,a
6689  0890 96            	ldw	x,sp
6690  0891 5c            	incw	x
6691  0892 cd0000        	call	c_rtol
6693  0895 96            	ldw	x,sp
6694  0896 1c0006        	addw	x,#OFST-5
6695  0899 cd0000        	call	c_ltor
6697  089c a60a          	ld	a,#10
6698  089e cd0000        	call	c_smul
6700  08a1 96            	ldw	x,sp
6701  08a2 5c            	incw	x
6702  08a3 cd0000        	call	c_ladd
6704  08a6 a630          	ld	a,#48
6705  08a8 cd0000        	call	c_lsbc
6707  08ab 96            	ldw	x,sp
6708  08ac 1c0006        	addw	x,#OFST-5
6709  08af cd0000        	call	c_rtol
6711                     ; 1066 				fRtnVal = TRUE;
6713  08b2 a601          	ld	a,#1
6714  08b4 6b05          	ld	(OFST-6,sp),a
6716  08b6               L3133:
6717                     ; 1049 	while (pStart < pEnd)
6719  08b6 1e0c          	ldw	x,(OFST+1,sp)
6720  08b8 1310          	cpw	x,(OFST+5,sp)
6721  08ba 25a3          	jrult	L1133
6722  08bc               L5133:
6723                     ; 1076 	*dwVal = val;
6725  08bc 1e12          	ldw	x,(OFST+7,sp)
6726  08be 7b09          	ld	a,(OFST-2,sp)
6727  08c0 e703          	ld	(3,x),a
6728  08c2 7b08          	ld	a,(OFST-3,sp)
6729  08c4 e702          	ld	(2,x),a
6730  08c6 7b07          	ld	a,(OFST-4,sp)
6731  08c8 e701          	ld	(1,x),a
6732  08ca 7b06          	ld	a,(OFST-5,sp)
6733  08cc f7            	ld	(x),a
6734                     ; 1077 	return (fRtnVal);
6736  08cd 7b05          	ld	a,(OFST-6,sp)
6738  08cf               L663:
6740  08cf 5b0d          	addw	sp,#13
6741  08d1 81            	ret	
6920                     ; 1089 uint8_t  UC_CommAT(u8 nCmd, u8 *pnParameter, uint8_t *pnMatch1, uint8_t *pnMatch2, uint8_t *pnMatch3, 
6920                     ; 1090 					 uint8_t *pnMatch4, uint8_t **pnOutMatchPtr, uint32_t dwWaitmS)
6920                     ; 1091 {
6921                     	switch	.text
6922  08d2               _UC_CommAT:
6924  08d2 88            	push	a
6925  08d3 5213          	subw	sp,#19
6926       00000013      OFST:	set	19
6929                     ; 1092 	uint32_t  dwTimeOut = 0, dwTime = 0, dwNowTime = 0;
6931  08d5 96            	ldw	x,sp
6932  08d6 5c            	incw	x
6933  08d7 cd0000        	call	c_ltor
6937  08da 96            	ldw	x,sp
6938  08db 1c0005        	addw	x,#OFST-14
6939  08de cd0000        	call	c_ltor
6943  08e1 96            	ldw	x,sp
6944  08e2 1c0009        	addw	x,#OFST-10
6945  08e5 cd0000        	call	c_ltor
6947                     ; 1093 	uint8_t   *pnMatchTagStr = NULL, nRtnVal = 0, *pnDat = NULL;
6949  08e8 5f            	clrw	x
6950  08e9 1f0e          	ldw	(OFST-5,sp),x
6953  08eb 0f0d          	clr	(OFST-6,sp)
6956                     ; 1094 	uint8_t   nData = 0, nStrLen = 0, nTxRxLen = 0;
6962                     ; 1097 	dwTime = GetSysTemTick();	
6964  08ed cd0000        	call	_GetSysTemTick
6966  08f0 96            	ldw	x,sp
6967  08f1 1c0005        	addw	x,#OFST-14
6968  08f4 cd0000        	call	c_rtol
6970                     ; 1098 	dwTimeOut = (dwWaitmS);
6972  08f7 1e25          	ldw	x,(OFST+18,sp)
6973  08f9 1f03          	ldw	(OFST-16,sp),x
6974  08fb 1e23          	ldw	x,(OFST+16,sp)
6975  08fd 1f01          	ldw	(OFST-18,sp),x
6976                     ; 1100 	if((NULL != pnParameter)&&(nCmd < AT_CMD_NULL))
6978  08ff 1e17          	ldw	x,(OFST+4,sp)
6979  0901 2714          	jreq	L7243
6981  0903 7b14          	ld	a,(OFST+1,sp)
6982  0905 a1ff          	cp	a,#255
6983  0907 240e          	jruge	L7243
6984                     ; 1103 		ClearRxBuff();
6986  0909 cd0000        	call	_ClearRxBuff
6988                     ; 1104 		PackAtCmdParameter(nCmd, pnParameter);                
6990  090c 1e17          	ldw	x,(OFST+4,sp)
6991  090e 89            	pushw	x
6992  090f 7b16          	ld	a,(OFST+3,sp)
6993  0911 cd03cb        	call	_PackAtCmdParameter
6995  0914 85            	popw	x
6997  0915 200e          	jra	L1343
6998  0917               L7243:
6999                     ; 1106 	else if (nCmd < AT_CMD_NULL)
7001  0917 7b14          	ld	a,(OFST+1,sp)
7002  0919 a1ff          	cp	a,#255
7003  091b 2408          	jruge	L1343
7004                     ; 1109 		ClearRxBuff();
7006  091d cd0000        	call	_ClearRxBuff
7008                     ; 1110 		PackAtCmd(nCmd);
7010  0920 7b14          	ld	a,(OFST+1,sp)
7011  0922 cd0366        	call	_PackAtCmd
7013  0925               L1343:
7014                     ; 1115 	nTxRxLen = 0;
7016  0925 0f12          	clr	(OFST-1,sp)
7017                     ; 1116 	pnDat = GetUartRxBuf();
7019  0927 cd0000        	call	_GetUartRxBuf
7021  092a 1f10          	ldw	(OFST-3,sp),x
7023  092c cc0a76        	jra	L1443
7024  092f               L5343:
7025                     ; 1121 		FeedSoftWareIwdg();
7027  092f cd0000        	call	_FeedSoftWareIwdg
7029                     ; 1123 		dwNowTime = GetSysTemTick();
7031  0932 cd0000        	call	_GetSysTemTick
7033  0935 96            	ldw	x,sp
7034  0936 1c0009        	addw	x,#OFST-10
7035  0939 cd0000        	call	c_rtol
7037                     ; 1124 		if (dwTime < dwNowTime)
7039  093c 96            	ldw	x,sp
7040  093d 1c0005        	addw	x,#OFST-14
7041  0940 cd0000        	call	c_ltor
7043  0943 96            	ldw	x,sp
7044  0944 1c0009        	addw	x,#OFST-10
7045  0947 cd0000        	call	c_lcmp
7047  094a 96            	ldw	x,sp
7048  094b 241a          	jruge	L5443
7049                     ; 1126 			 if(dwNowTime - dwTime > dwTimeOut)
7051  094d 1c0009        	addw	x,#OFST-10
7052  0950 cd0000        	call	c_ltor
7054  0953 96            	ldw	x,sp
7055  0954 1c0005        	addw	x,#OFST-14
7056  0957 cd0000        	call	c_lsub
7058  095a 96            	ldw	x,sp
7059  095b 5c            	incw	x
7060  095c cd0000        	call	c_lcmp
7062  095f 2320          	jrule	L1543
7063                     ; 1128 				ClearRxBuff(); 
7065  0961 cd0000        	call	_ClearRxBuff
7067                     ; 1129 				break;
7069  0964 cc0a8d        	jra	L1333
7070  0967               L5443:
7071                     ; 1132 		else if ((dwTime - dwNowTime) > dwTimeOut)
7073  0967 1c0005        	addw	x,#OFST-14
7074  096a cd0000        	call	c_ltor
7076  096d 96            	ldw	x,sp
7077  096e 1c0009        	addw	x,#OFST-10
7078  0971 cd0000        	call	c_lsub
7080  0974 96            	ldw	x,sp
7081  0975 5c            	incw	x
7082  0976 cd0000        	call	c_lcmp
7084  0979 2306          	jrule	L1543
7085                     ; 1134 			ClearRxBuff();
7087  097b cd0000        	call	_ClearRxBuff
7089                     ; 1135 			break;
7091  097e cc0a8d        	jra	L1333
7092  0981               L1543:
7093                     ; 1138 		if (0 == (nTxRxLen = CheckRevDataLen()))
7095  0981 cd0000        	call	_CheckRevDataLen
7097  0984 6b12          	ld	(OFST-1,sp),a
7098  0986 27a4          	jreq	L1443
7099                     ; 1140 			continue;
7101                     ; 1143 		nData = *(pnDat + nTxRxLen - 1); 		//不需要判断头,尾之类
7103  0988 7b10          	ld	a,(OFST-3,sp)
7104  098a 97            	ld	xl,a
7105  098b 7b11          	ld	a,(OFST-2,sp)
7106  098d 1b12          	add	a,(OFST-1,sp)
7107  098f 2401          	jrnc	L024
7108  0991 5c            	incw	x
7109  0992               L024:
7110  0992 02            	rlwa	x,a
7111  0993 5a            	decw	x
7112  0994 f6            	ld	a,(x)
7113  0995 6b13          	ld	(OFST+0,sp),a
7114                     ; 1159 		HD_DecodeParameter(pnDat, CheckRevDataLen());
7116  0997 cd0000        	call	_CheckRevDataLen
7118  099a 88            	push	a
7119  099b 1e11          	ldw	x,(OFST-2,sp)
7120  099d cd0000        	call	_HD_DecodeParameter
7122  09a0 84            	pop	a
7123                     ; 1163 		if ( (nData == AT_TAIL_0) || (nData == AT_TAIL_1) ) 	//0d0a
7125  09a1 7b13          	ld	a,(OFST+0,sp)
7126  09a3 a10d          	cp	a,#13
7127  09a5 2704          	jreq	L1643
7129  09a7 a10a          	cp	a,#10
7130  09a9 2681          	jrne	L1443
7131  09ab               L1643:
7132                     ; 1165 			if (pnMatch1 != NULL)
7134  09ab 1e19          	ldw	x,(OFST+6,sp)
7135  09ad 2730          	jreq	L3643
7136                     ; 1167 				nStrLen = (u8)JX_Strlen((char *)pnMatch1);
7138  09af cd0307        	call	_JX_Strlen
7140  09b2 6b13          	ld	(OFST+0,sp),a
7141                     ; 1168 				if	((nTxRxLen >= nStrLen) && 
7141                     ; 1169 					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch1, nStrLen)) != NULL))
7143  09b4 7b12          	ld	a,(OFST-1,sp)
7144  09b6 1113          	cp	a,(OFST+0,sp)
7145  09b8 2525          	jrult	L3643
7147  09ba 7b13          	ld	a,(OFST+0,sp)
7148  09bc cd0aa1        	call	LC012
7149  09bf 89            	pushw	x
7150  09c0 be00          	ldw	x,c_lreg
7151  09c2 89            	pushw	x
7152  09c3 1e1d          	ldw	x,(OFST+10,sp)
7153  09c5 89            	pushw	x
7154  09c6 7b18          	ld	a,(OFST+5,sp)
7155  09c8 cd0aa1        	call	LC012
7156  09cb 89            	pushw	x
7157  09cc be00          	ldw	x,c_lreg
7158  09ce 89            	pushw	x
7159  09cf 1e1a          	ldw	x,(OFST+7,sp)
7160  09d1 cd07a9        	call	_QH_bufbuf
7162  09d4 5b0a          	addw	sp,#10
7163  09d6 1f0e          	ldw	(OFST-5,sp),x
7164  09d8 2705          	jreq	L3643
7165                     ; 1171 					nRtnVal = 1;
7167  09da a601          	ld	a,#1
7168                     ; 1172 					goto  __UC_CommAT_Exit;
7170  09dc cc0a72        	jp	LC011
7171  09df               L3643:
7172                     ; 1175 			if (pnMatch2 != NULL)
7174  09df 1e1b          	ldw	x,(OFST+8,sp)
7175  09e1 272f          	jreq	L7643
7176                     ; 1177 				nStrLen = (u8)JX_Strlen((char *)pnMatch2);
7178  09e3 cd0307        	call	_JX_Strlen
7180  09e6 6b13          	ld	(OFST+0,sp),a
7181                     ; 1178 				if	((nTxRxLen >= nStrLen) && 
7181                     ; 1179 					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch2, nStrLen)) != NULL))
7183  09e8 7b12          	ld	a,(OFST-1,sp)
7184  09ea 1113          	cp	a,(OFST+0,sp)
7185  09ec 2524          	jrult	L7643
7187  09ee 7b13          	ld	a,(OFST+0,sp)
7188  09f0 cd0aa1        	call	LC012
7189  09f3 89            	pushw	x
7190  09f4 be00          	ldw	x,c_lreg
7191  09f6 89            	pushw	x
7192  09f7 1e1f          	ldw	x,(OFST+12,sp)
7193  09f9 89            	pushw	x
7194  09fa 7b18          	ld	a,(OFST+5,sp)
7195  09fc cd0aa1        	call	LC012
7196  09ff 89            	pushw	x
7197  0a00 be00          	ldw	x,c_lreg
7198  0a02 89            	pushw	x
7199  0a03 1e1a          	ldw	x,(OFST+7,sp)
7200  0a05 cd07a9        	call	_QH_bufbuf
7202  0a08 5b0a          	addw	sp,#10
7203  0a0a 1f0e          	ldw	(OFST-5,sp),x
7204  0a0c 2704          	jreq	L7643
7205                     ; 1181 					nRtnVal = 2;
7207  0a0e a602          	ld	a,#2
7208                     ; 1182 					goto  __UC_CommAT_Exit;
7210  0a10 2060          	jp	LC011
7211  0a12               L7643:
7212                     ; 1185 			if (pnMatch3 != NULL)
7214  0a12 1e1d          	ldw	x,(OFST+10,sp)
7215  0a14 272d          	jreq	L3743
7216                     ; 1187 				nStrLen = (u8)JX_Strlen((char *)pnMatch3);
7218  0a16 cd0307        	call	_JX_Strlen
7220  0a19 6b13          	ld	(OFST+0,sp),a
7221                     ; 1188 				if	((nTxRxLen >= nStrLen) && 
7221                     ; 1189 					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch3, nStrLen)) != NULL))
7223  0a1b 7b12          	ld	a,(OFST-1,sp)
7224  0a1d 1113          	cp	a,(OFST+0,sp)
7225  0a1f 2522          	jrult	L3743
7227  0a21 7b13          	ld	a,(OFST+0,sp)
7228  0a23 ad7c          	call	LC012
7229  0a25 89            	pushw	x
7230  0a26 be00          	ldw	x,c_lreg
7231  0a28 89            	pushw	x
7232  0a29 1e21          	ldw	x,(OFST+14,sp)
7233  0a2b 89            	pushw	x
7234  0a2c 7b18          	ld	a,(OFST+5,sp)
7235  0a2e ad71          	call	LC012
7236  0a30 89            	pushw	x
7237  0a31 be00          	ldw	x,c_lreg
7238  0a33 89            	pushw	x
7239  0a34 1e1a          	ldw	x,(OFST+7,sp)
7240  0a36 cd07a9        	call	_QH_bufbuf
7242  0a39 5b0a          	addw	sp,#10
7243  0a3b 1f0e          	ldw	(OFST-5,sp),x
7244  0a3d 2704          	jreq	L3743
7245                     ; 1191 					nRtnVal = 3;
7247  0a3f a603          	ld	a,#3
7248                     ; 1192 					goto  __UC_CommAT_Exit;
7250  0a41 202f          	jp	LC011
7251  0a43               L3743:
7252                     ; 1195 			if (pnMatch4 != NULL)
7254  0a43 1e1f          	ldw	x,(OFST+12,sp)
7255  0a45 272f          	jreq	L1443
7256                     ; 1197 				nStrLen = (u8)JX_Strlen((char *)pnMatch4);
7258  0a47 cd0307        	call	_JX_Strlen
7260  0a4a 6b13          	ld	(OFST+0,sp),a
7261                     ; 1198 				if	((nTxRxLen >= nStrLen) && 
7261                     ; 1199 					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch4, nStrLen)) != NULL))
7263  0a4c 7b12          	ld	a,(OFST-1,sp)
7264  0a4e 1113          	cp	a,(OFST+0,sp)
7265  0a50 2524          	jrult	L1443
7267  0a52 7b13          	ld	a,(OFST+0,sp)
7268  0a54 ad4b          	call	LC012
7269  0a56 89            	pushw	x
7270  0a57 be00          	ldw	x,c_lreg
7271  0a59 89            	pushw	x
7272  0a5a 1e23          	ldw	x,(OFST+16,sp)
7273  0a5c 89            	pushw	x
7274  0a5d 7b18          	ld	a,(OFST+5,sp)
7275  0a5f ad40          	call	LC012
7276  0a61 89            	pushw	x
7277  0a62 be00          	ldw	x,c_lreg
7278  0a64 89            	pushw	x
7279  0a65 1e1a          	ldw	x,(OFST+7,sp)
7280  0a67 cd07a9        	call	_QH_bufbuf
7282  0a6a 5b0a          	addw	sp,#10
7283  0a6c 1f0e          	ldw	(OFST-5,sp),x
7284  0a6e 2706          	jreq	L1443
7285                     ; 1201 					nRtnVal = 4;
7287  0a70 a604          	ld	a,#4
7288  0a72               LC011:
7289  0a72 6b0d          	ld	(OFST-6,sp),a
7290                     ; 1202 					goto  __UC_CommAT_Exit;
7292  0a74 2017          	jra	L1333
7293  0a76               L1443:
7294                     ; 1118 	while ((dwTimeOut <= dwWaitmS) && (nTxRxLen < NUMBER_UART_RX))
7296  0a76 96            	ldw	x,sp
7297  0a77 5c            	incw	x
7298  0a78 cd0000        	call	c_ltor
7300  0a7b 96            	ldw	x,sp
7301  0a7c 1c0023        	addw	x,#OFST+16
7302  0a7f cd0000        	call	c_lcmp
7304  0a82 2209          	jrugt	L1333
7306  0a84 7b12          	ld	a,(OFST-1,sp)
7307  0a86 a1c0          	cp	a,#192
7308  0a88 2403cc092f    	jrult	L5343
7309  0a8d               L1333:
7310                     ; 1211 __UC_CommAT_Exit:
7310                     ; 1212 	if ((pnOutMatchPtr != NULL) && (pnMatchTagStr != NULL))
7312  0a8d 1e21          	ldw	x,(OFST+14,sp)
7313  0a8f 2709          	jreq	L5053
7315  0a91 1e0e          	ldw	x,(OFST-5,sp)
7316  0a93 2705          	jreq	L5053
7317                     ; 1214 		*pnOutMatchPtr = pnMatchTagStr;
7319  0a95 1e21          	ldw	x,(OFST+14,sp)
7320  0a97 160e          	ldw	y,(OFST-5,sp)
7321  0a99 ff            	ldw	(x),y
7322  0a9a               L5053:
7323                     ; 1216 	if (nTxRxLen > 0)
7325  0a9a 0d12          	tnz	(OFST-1,sp)
7326                     ; 1221 	return (nRtnVal); 
7328  0a9c 7b0d          	ld	a,(OFST-6,sp)
7331  0a9e 5b14          	addw	sp,#20
7332  0aa0 81            	ret	
7334  0aa1               LC012:
7335  0aa1 b703          	ld	c_lreg+3,a
7336  0aa3 3f02          	clr	c_lreg+2
7337  0aa5 3f01          	clr	c_lreg+1
7338  0aa7 3f00          	clr	c_lreg
7339  0aa9 be02          	ldw	x,c_lreg+2
7340  0aab 81            	ret	
7542                     ; 1233 uint8_t  UC_CommATExt(u8 nCmd, u8 *pnParameter1, u8 *pnParameter2, u8 *pnParameter3, uint8_t *pnMatch1, uint8_t *pnMatch2, uint8_t *pnMatch3, 
7542                     ; 1234 					 uint8_t *pnMatch4, uint8_t **pnOutMatchPtr, uint32_t dwWaitmS)
7542                     ; 1235 {
7543                     	switch	.text
7544  0aac               _UC_CommATExt:
7546  0aac 88            	push	a
7547  0aad 5213          	subw	sp,#19
7548       00000013      OFST:	set	19
7551                     ; 1236 	uint32_t  dwTimeOut = 0, dwTime = 0, dwNowTime = 0;
7553  0aaf 96            	ldw	x,sp
7554  0ab0 5c            	incw	x
7555  0ab1 cd0000        	call	c_ltor
7559  0ab4 96            	ldw	x,sp
7560  0ab5 1c0005        	addw	x,#OFST-14
7561  0ab8 cd0000        	call	c_ltor
7565  0abb 96            	ldw	x,sp
7566  0abc 1c0009        	addw	x,#OFST-10
7567  0abf cd0000        	call	c_ltor
7569                     ; 1237 	uint8_t   *pnMatchTagStr = NULL, nRtnVal = 0;
7571  0ac2 5f            	clrw	x
7572  0ac3 1f0d          	ldw	(OFST-6,sp),x
7575  0ac5 0f0f          	clr	(OFST-4,sp)
7576                     ; 1238 	uint8_t   nData = 0, *pnDat = NULL, nTxRxLen = 0, nStrLen = 0;
7584                     ; 1241 	dwTime = GetSysTemTick();	
7586  0ac7 cd0000        	call	_GetSysTemTick
7588  0aca 96            	ldw	x,sp
7589  0acb 1c0005        	addw	x,#OFST-14
7590  0ace cd0000        	call	c_rtol
7592                     ; 1242 	dwTimeOut = (dwWaitmS);
7594  0ad1 1e29          	ldw	x,(OFST+22,sp)
7595  0ad3 1f03          	ldw	(OFST-16,sp),x
7596  0ad5 1e27          	ldw	x,(OFST+20,sp)
7597  0ad7 1f01          	ldw	(OFST-18,sp),x
7598                     ; 1245 	ClearRxBuff();
7600  0ad9 cd0000        	call	_ClearRxBuff
7602                     ; 1247 	if(AT_CMD_TCPSEND == nCmd)
7604  0adc 7b14          	ld	a,(OFST+1,sp)
7605  0ade a13d          	cp	a,#61
7606  0ae0 2608          	jrne	L7163
7607                     ; 1249 		PackAtCmdTcpsend(ucNumberMessage);
7609  0ae2 c6006b        	ld	a,_ucNumberMessage
7610  0ae5 cd05e9        	call	_PackAtCmdTcpsend
7613  0ae8 2045          	jra	L1263
7614  0aea               L7163:
7615                     ; 1251 	else if((AT_CMD_NULL == nCmd)&&(NULL != pnParameter1)) /* 特殊处理需要发送的数据 */
7617  0aea 4c            	inc	a
7618  0aeb 260a          	jrne	L3263
7620  0aed 1e17          	ldw	x,(OFST+4,sp)
7621  0aef 2706          	jreq	L3263
7622                     ; 1253 		PackTcpSendData(*pnParameter1);
7624  0af1 f6            	ld	a,(x)
7625  0af2 cd06b5        	call	_PackTcpSendData
7628  0af5 2038          	jra	L1263
7629  0af7               L3263:
7630                     ; 1255 	else if((NULL != pnParameter1)&&(NULL != pnParameter2)&&(NULL == pnParameter3))
7632  0af7 1e17          	ldw	x,(OFST+4,sp)
7633  0af9 2717          	jreq	L7263
7635  0afb 1e19          	ldw	x,(OFST+6,sp)
7636  0afd 2713          	jreq	L7263
7638  0aff 1e1b          	ldw	x,(OFST+8,sp)
7639  0b01 260f          	jrne	L7263
7640                     ; 1257 		PackAtCmdParameter2(nCmd, pnParameter1, pnParameter2);
7642  0b03 1e19          	ldw	x,(OFST+6,sp)
7643  0b05 89            	pushw	x
7644  0b06 1e19          	ldw	x,(OFST+6,sp)
7645  0b08 89            	pushw	x
7646  0b09 7b18          	ld	a,(OFST+5,sp)
7647  0b0b cd0450        	call	_PackAtCmdParameter2
7649  0b0e 5b04          	addw	sp,#4
7651  0b10 201d          	jra	L1263
7652  0b12               L7263:
7653                     ; 1259 	else if((NULL != pnParameter1)&&(NULL != pnParameter2)&&(NULL != pnParameter3))
7655  0b12 1e17          	ldw	x,(OFST+4,sp)
7656  0b14 2603cc0cb2    	jreq	L425
7658  0b19 1e19          	ldw	x,(OFST+6,sp)
7659  0b1b 27f9          	jreq	L425
7661  0b1d 1e1b          	ldw	x,(OFST+8,sp)
7662  0b1f 27f5          	jreq	L425
7663                     ; 1261 		PackAtCmdParameter3(nCmd, pnParameter1, pnParameter2, pnParameter3);
7665  0b21 89            	pushw	x
7666  0b22 1e1b          	ldw	x,(OFST+8,sp)
7667  0b24 89            	pushw	x
7668  0b25 1e1b          	ldw	x,(OFST+8,sp)
7669  0b27 89            	pushw	x
7670  0b28 7b1a          	ld	a,(OFST+7,sp)
7671  0b2a cd0500        	call	_PackAtCmdParameter3
7673  0b2d 5b06          	addw	sp,#6
7675  0b2f               L1263:
7676                     ; 1268 	nTxRxLen = 0;
7678  0b2f 0f12          	clr	(OFST-1,sp)
7679                     ; 1269 	pnDat = GetUartRxBuf();
7681  0b31 cd0000        	call	_GetUartRxBuf
7683  0b34 1f10          	ldw	(OFST-3,sp),x
7684                     ; 1270 	UC_SleepFunc(10);
7686  0b36 ae000a        	ldw	x,#10
7687  0b39 89            	pushw	x
7688  0b3a 5f            	clrw	x
7689  0b3b 89            	pushw	x
7690  0b3c cd0751        	call	_UC_SleepFunc
7692  0b3f 5b04          	addw	sp,#4
7694  0b41 cc0c8c        	jra	L1463
7695                     ; 1265 		return nRtnVal;
7697  0b44               L7363:
7698                     ; 1276 		FeedSoftWareIwdg();
7700  0b44 cd0000        	call	_FeedSoftWareIwdg
7702                     ; 1278 		dwNowTime = GetSysTemTick();
7704  0b47 cd0000        	call	_GetSysTemTick
7706  0b4a 96            	ldw	x,sp
7707  0b4b 1c0009        	addw	x,#OFST-10
7708  0b4e cd0000        	call	c_rtol
7710                     ; 1279 		if (dwTime < dwNowTime)
7712  0b51 96            	ldw	x,sp
7713  0b52 1c0005        	addw	x,#OFST-14
7714  0b55 cd0000        	call	c_ltor
7716  0b58 96            	ldw	x,sp
7717  0b59 1c0009        	addw	x,#OFST-10
7718  0b5c cd0000        	call	c_lcmp
7720  0b5f 96            	ldw	x,sp
7721  0b60 2417          	jruge	L5463
7722                     ; 1281 			 if(dwNowTime - dwTime > dwTimeOut)
7724  0b62 1c0009        	addw	x,#OFST-10
7725  0b65 cd0000        	call	c_ltor
7727  0b68 96            	ldw	x,sp
7728  0b69 1c0005        	addw	x,#OFST-14
7729  0b6c cd0000        	call	c_lsub
7731  0b6f 96            	ldw	x,sp
7732  0b70 5c            	incw	x
7733  0b71 cd0000        	call	c_lcmp
7735  0b74 2317          	jrule	L1563
7736                     ; 1284 				break;
7738  0b76 cc0ca3        	jra	L1153
7739  0b79               L5463:
7740                     ; 1287 		else if ((dwTime - dwNowTime) > dwTimeOut)
7742  0b79 1c0005        	addw	x,#OFST-14
7743  0b7c cd0000        	call	c_ltor
7745  0b7f 96            	ldw	x,sp
7746  0b80 1c0009        	addw	x,#OFST-10
7747  0b83 cd0000        	call	c_lsub
7749  0b86 96            	ldw	x,sp
7750  0b87 5c            	incw	x
7751  0b88 cd0000        	call	c_lcmp
7753  0b8b 22e9          	jrugt	L1153
7754                     ; 1290 			break;
7756  0b8d               L1563:
7757                     ; 1293 		if (0 == (nTxRxLen = CheckRevDataLen()))
7759  0b8d cd0000        	call	_CheckRevDataLen
7761  0b90 6b12          	ld	(OFST-1,sp),a
7762  0b92 27ad          	jreq	L1463
7763                     ; 1295 			continue;
7765                     ; 1298 		nData = *(pnDat + nTxRxLen - 1); 		//不需要判断头,尾之类
7767  0b94 7b10          	ld	a,(OFST-3,sp)
7768  0b96 97            	ld	xl,a
7769  0b97 7b11          	ld	a,(OFST-2,sp)
7770  0b99 1b12          	add	a,(OFST-1,sp)
7771  0b9b 2401          	jrnc	L674
7772  0b9d 5c            	incw	x
7773  0b9e               L674:
7774  0b9e 02            	rlwa	x,a
7775  0b9f 5a            	decw	x
7776  0ba0 f6            	ld	a,(x)
7777  0ba1 6b13          	ld	(OFST+0,sp),a
7778                     ; 1307 				HD_DecodeParameter(pnDat, CheckRevDataLen());
7780  0ba3 cd0000        	call	_CheckRevDataLen
7782  0ba6 88            	push	a
7783  0ba7 1e11          	ldw	x,(OFST-2,sp)
7784  0ba9 cd0000        	call	_HD_DecodeParameter
7786  0bac 84            	pop	a
7787                     ; 1311 		if ( (2 <= nTxRxLen)||((nData == AT_TAIL_0) || (nData == AT_TAIL_1)|| (nData == '>')) ) 	// (2 <= nTxRxLen)&& 此处特殊处理发送长度时回复的'>'
7789  0bad 7b12          	ld	a,(OFST-1,sp)
7790  0baf a102          	cp	a,#2
7791  0bb1 240e          	jruge	L1663
7793  0bb3 7b13          	ld	a,(OFST+0,sp)
7794  0bb5 a10d          	cp	a,#13
7795  0bb7 2708          	jreq	L1663
7797  0bb9 a10a          	cp	a,#10
7798  0bbb 2704          	jreq	L1663
7800  0bbd a13e          	cp	a,#62
7801  0bbf 2680          	jrne	L1463
7802  0bc1               L1663:
7803                     ; 1313 			if (pnMatch1 != NULL)
7805  0bc1 1e1d          	ldw	x,(OFST+10,sp)
7806  0bc3 2730          	jreq	L7663
7807                     ; 1315 				nStrLen = (u8)JX_Strlen((char *)pnMatch1);
7809  0bc5 cd0307        	call	_JX_Strlen
7811  0bc8 6b13          	ld	(OFST+0,sp),a
7812                     ; 1316 				if	((nTxRxLen >= nStrLen) && 
7812                     ; 1317 					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch1, nStrLen)) != NULL))
7814  0bca 7b12          	ld	a,(OFST-1,sp)
7815  0bcc 1113          	cp	a,(OFST+0,sp)
7816  0bce 2525          	jrult	L7663
7818  0bd0 7b13          	ld	a,(OFST+0,sp)
7819  0bd2 cd0cb7        	call	LC014
7820  0bd5 89            	pushw	x
7821  0bd6 be00          	ldw	x,c_lreg
7822  0bd8 89            	pushw	x
7823  0bd9 1e21          	ldw	x,(OFST+14,sp)
7824  0bdb 89            	pushw	x
7825  0bdc 7b18          	ld	a,(OFST+5,sp)
7826  0bde cd0cb7        	call	LC014
7827  0be1 89            	pushw	x
7828  0be2 be00          	ldw	x,c_lreg
7829  0be4 89            	pushw	x
7830  0be5 1e1a          	ldw	x,(OFST+7,sp)
7831  0be7 cd07a9        	call	_QH_bufbuf
7833  0bea 5b0a          	addw	sp,#10
7834  0bec 1f0d          	ldw	(OFST-6,sp),x
7835  0bee 2705          	jreq	L7663
7836                     ; 1319 					nRtnVal = 1;
7838  0bf0 a601          	ld	a,#1
7839                     ; 1320 					goto  __UC_CommAT_Exit;
7841  0bf2 cc0c88        	jp	LC013
7842  0bf5               L7663:
7843                     ; 1323 			if (pnMatch2 != NULL)
7845  0bf5 1e1f          	ldw	x,(OFST+12,sp)
7846  0bf7 272f          	jreq	L3763
7847                     ; 1325 				nStrLen = (u8)JX_Strlen((char *)pnMatch2);
7849  0bf9 cd0307        	call	_JX_Strlen
7851  0bfc 6b13          	ld	(OFST+0,sp),a
7852                     ; 1326 				if	((nTxRxLen >= nStrLen) && 
7852                     ; 1327 					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch2, nStrLen)) != NULL))
7854  0bfe 7b12          	ld	a,(OFST-1,sp)
7855  0c00 1113          	cp	a,(OFST+0,sp)
7856  0c02 2524          	jrult	L3763
7858  0c04 7b13          	ld	a,(OFST+0,sp)
7859  0c06 cd0cb7        	call	LC014
7860  0c09 89            	pushw	x
7861  0c0a be00          	ldw	x,c_lreg
7862  0c0c 89            	pushw	x
7863  0c0d 1e23          	ldw	x,(OFST+16,sp)
7864  0c0f 89            	pushw	x
7865  0c10 7b18          	ld	a,(OFST+5,sp)
7866  0c12 cd0cb7        	call	LC014
7867  0c15 89            	pushw	x
7868  0c16 be00          	ldw	x,c_lreg
7869  0c18 89            	pushw	x
7870  0c19 1e1a          	ldw	x,(OFST+7,sp)
7871  0c1b cd07a9        	call	_QH_bufbuf
7873  0c1e 5b0a          	addw	sp,#10
7874  0c20 1f0d          	ldw	(OFST-6,sp),x
7875  0c22 2704          	jreq	L3763
7876                     ; 1329 					nRtnVal = 2;
7878  0c24 a602          	ld	a,#2
7879                     ; 1330 					goto  __UC_CommAT_Exit;
7881  0c26 2060          	jp	LC013
7882  0c28               L3763:
7883                     ; 1333 			if (pnMatch3 != NULL)
7885  0c28 1e21          	ldw	x,(OFST+14,sp)
7886  0c2a 272d          	jreq	L7763
7887                     ; 1335 				nStrLen = (u8)JX_Strlen((char *)pnMatch3);
7889  0c2c cd0307        	call	_JX_Strlen
7891  0c2f 6b13          	ld	(OFST+0,sp),a
7892                     ; 1336 				if	((nTxRxLen >= nStrLen) && 
7892                     ; 1337 					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch3, nStrLen)) != NULL))
7894  0c31 7b12          	ld	a,(OFST-1,sp)
7895  0c33 1113          	cp	a,(OFST+0,sp)
7896  0c35 2522          	jrult	L7763
7898  0c37 7b13          	ld	a,(OFST+0,sp)
7899  0c39 ad7c          	call	LC014
7900  0c3b 89            	pushw	x
7901  0c3c be00          	ldw	x,c_lreg
7902  0c3e 89            	pushw	x
7903  0c3f 1e25          	ldw	x,(OFST+18,sp)
7904  0c41 89            	pushw	x
7905  0c42 7b18          	ld	a,(OFST+5,sp)
7906  0c44 ad71          	call	LC014
7907  0c46 89            	pushw	x
7908  0c47 be00          	ldw	x,c_lreg
7909  0c49 89            	pushw	x
7910  0c4a 1e1a          	ldw	x,(OFST+7,sp)
7911  0c4c cd07a9        	call	_QH_bufbuf
7913  0c4f 5b0a          	addw	sp,#10
7914  0c51 1f0d          	ldw	(OFST-6,sp),x
7915  0c53 2704          	jreq	L7763
7916                     ; 1339 					nRtnVal = 3;
7918  0c55 a603          	ld	a,#3
7919                     ; 1340 					goto  __UC_CommAT_Exit;
7921  0c57 202f          	jp	LC013
7922  0c59               L7763:
7923                     ; 1343 			if (pnMatch4 != NULL)
7925  0c59 1e23          	ldw	x,(OFST+16,sp)
7926  0c5b 272f          	jreq	L1463
7927                     ; 1345 				nStrLen = (u8)JX_Strlen((char *)pnMatch4);
7929  0c5d cd0307        	call	_JX_Strlen
7931  0c60 6b13          	ld	(OFST+0,sp),a
7932                     ; 1346 				if	((nTxRxLen >= nStrLen) && 
7932                     ; 1347 					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch4, nStrLen)) != NULL))
7934  0c62 7b12          	ld	a,(OFST-1,sp)
7935  0c64 1113          	cp	a,(OFST+0,sp)
7936  0c66 2524          	jrult	L1463
7938  0c68 7b13          	ld	a,(OFST+0,sp)
7939  0c6a ad4b          	call	LC014
7940  0c6c 89            	pushw	x
7941  0c6d be00          	ldw	x,c_lreg
7942  0c6f 89            	pushw	x
7943  0c70 1e27          	ldw	x,(OFST+20,sp)
7944  0c72 89            	pushw	x
7945  0c73 7b18          	ld	a,(OFST+5,sp)
7946  0c75 ad40          	call	LC014
7947  0c77 89            	pushw	x
7948  0c78 be00          	ldw	x,c_lreg
7949  0c7a 89            	pushw	x
7950  0c7b 1e1a          	ldw	x,(OFST+7,sp)
7951  0c7d cd07a9        	call	_QH_bufbuf
7953  0c80 5b0a          	addw	sp,#10
7954  0c82 1f0d          	ldw	(OFST-6,sp),x
7955  0c84 2706          	jreq	L1463
7956                     ; 1349 					nRtnVal = 4;
7958  0c86 a604          	ld	a,#4
7959  0c88               LC013:
7960  0c88 6b0f          	ld	(OFST-4,sp),a
7961                     ; 1350 					goto  __UC_CommAT_Exit;
7963  0c8a 2017          	jra	L1153
7964  0c8c               L1463:
7965                     ; 1273 	while ((dwTimeOut <= dwWaitmS) && (nTxRxLen < NUMBER_UART_RX))
7967  0c8c 96            	ldw	x,sp
7968  0c8d 5c            	incw	x
7969  0c8e cd0000        	call	c_ltor
7971  0c91 96            	ldw	x,sp
7972  0c92 1c0027        	addw	x,#OFST+20
7973  0c95 cd0000        	call	c_lcmp
7975  0c98 2209          	jrugt	L1153
7977  0c9a 7b12          	ld	a,(OFST-1,sp)
7978  0c9c a1c0          	cp	a,#192
7979  0c9e 2403cc0b44    	jrult	L7363
7980  0ca3               L1153:
7981                     ; 1359 __UC_CommAT_Exit:
7981                     ; 1360 	if ((pnOutMatchPtr != NULL) && (pnMatchTagStr != NULL))
7983  0ca3 1e25          	ldw	x,(OFST+18,sp)
7984  0ca5 2709          	jreq	L1173
7986  0ca7 1e0d          	ldw	x,(OFST-6,sp)
7987  0ca9 2705          	jreq	L1173
7988                     ; 1362 		*pnOutMatchPtr = pnMatchTagStr;
7990  0cab 1e25          	ldw	x,(OFST+18,sp)
7991  0cad 160d          	ldw	y,(OFST-6,sp)
7992  0caf ff            	ldw	(x),y
7993  0cb0               L1173:
7994                     ; 1364 	if (nTxRxLen > 0)
7996  0cb0 0d12          	tnz	(OFST-1,sp)
7997                     ; 1369 	return (nRtnVal); 
8000  0cb2               L425:
8002  0cb2 7b0f          	ld	a,(OFST-4,sp)
8004  0cb4 5b14          	addw	sp,#20
8005  0cb6 81            	ret	
8007  0cb7               LC014:
8008  0cb7 b703          	ld	c_lreg+3,a
8009  0cb9 3f02          	clr	c_lreg+2
8010  0cbb 3f01          	clr	c_lreg+1
8011  0cbd 3f00          	clr	c_lreg
8012  0cbf be02          	ldw	x,c_lreg+2
8013  0cc1 81            	ret	
8045                     ; 1378 uint8_t  SIMGetRegisterStat(void)
8045                     ; 1379 {
8046                     	switch	.text
8047  0cc2               _SIMGetRegisterStat:
8049  0cc2 88            	push	a
8050       00000001      OFST:	set	1
8053                     ; 1380 	uint8_t  nTmp = 0;
8055  0cc3 0f01          	clr	(OFST+0,sp)
8056                     ; 1383 	nTmp = UC_CommAT(AT_CMD_CREG,	NULL, "+CREG: 0,1", "+CREG: 0,5", "ERROR", NULL, NULL, 1000);
8058  0cc5 ae03e8        	ldw	x,#1000
8059  0cc8 89            	pushw	x
8060  0cc9 5f            	clrw	x
8061  0cca 89            	pushw	x
8062  0ccb 89            	pushw	x
8063  0ccc 89            	pushw	x
8064  0ccd ae04f3        	ldw	x,#L5373
8065  0cd0 89            	pushw	x
8066  0cd1 ae04dd        	ldw	x,#L3373
8067  0cd4 89            	pushw	x
8068  0cd5 ae04e8        	ldw	x,#L1373
8069  0cd8 89            	pushw	x
8070  0cd9 5f            	clrw	x
8071  0cda 89            	pushw	x
8072  0cdb a61a          	ld	a,#26
8073  0cdd cd08d2        	call	_UC_CommAT
8075  0ce0 5b10          	addw	sp,#16
8076  0ce2 6b01          	ld	(OFST+0,sp),a
8077                     ; 1384 	if((nTmp != 1)&&(nTmp != 2))
8079  0ce4 a101          	cp	a,#1
8080  0ce6 2709          	jreq	L7373
8082  0ce8 a102          	cp	a,#2
8083  0cea 2705          	jreq	L7373
8084                     ; 1386 		return SIM_REG_FAILURE;
8086  0cec a602          	ld	a,#2
8089  0cee 5b01          	addw	sp,#1
8090  0cf0 81            	ret	
8091  0cf1               L7373:
8092                     ; 1388 	return SIM_REG_SUCCESS;
8094  0cf1 a601          	ld	a,#1
8097  0cf3 5b01          	addw	sp,#1
8098  0cf5 81            	ret	
8154                     	switch	.const
8155  0475               L045:
8156  0475 00000020      	dc.l	32
8157                     ; 1397 uint8_t  SIMGL868_UpdateSignal(void)
8157                     ; 1398 {
8158                     	switch	.text
8159  0cf6               _SIMGL868_UpdateSignal:
8161  0cf6 5208          	subw	sp,#8
8162       00000008      OFST:	set	8
8165                     ; 1399 	uint32_t  dwSignalStr = 0;
8167  0cf8 5f            	clrw	x
8168  0cf9 1f03          	ldw	(OFST-5,sp),x
8169  0cfb 1f01          	ldw	(OFST-7,sp),x
8170                     ; 1403 	if (UC_CommAT(AT_CMD_CSQ, NULL, "+CSQ:", NULL, NULL, NULL, &pnRecvBuf, 1000) == 1)
8172  0cfd ae03e8        	ldw	x,#1000
8173  0d00 89            	pushw	x
8174  0d01 5f            	clrw	x
8175  0d02 89            	pushw	x
8176  0d03 96            	ldw	x,sp
8177  0d04 1c000b        	addw	x,#OFST+3
8178  0d07 89            	pushw	x
8179  0d08 5f            	clrw	x
8180  0d09 89            	pushw	x
8181  0d0a 89            	pushw	x
8182  0d0b 89            	pushw	x
8183  0d0c ae04d7        	ldw	x,#L7673
8184  0d0f 89            	pushw	x
8185  0d10 5f            	clrw	x
8186  0d11 89            	pushw	x
8187  0d12 a61f          	ld	a,#31
8188  0d14 cd08d2        	call	_UC_CommAT
8190  0d17 5b10          	addw	sp,#16
8191  0d19 4a            	dec	a
8192  0d1a 2632          	jrne	L5673
8193                     ; 1405 		pnRecvBufEnd = (uint8_t  *)(pnRecvBuf + JX_Strlen((char *)pnRecvBuf));
8195  0d1c 1e07          	ldw	x,(OFST-1,sp)
8196  0d1e cd0307        	call	_JX_Strlen
8198  0d21 5f            	clrw	x
8199  0d22 97            	ld	xl,a
8200  0d23 72fb07        	addw	x,(OFST-1,sp)
8201  0d26 1f05          	ldw	(OFST-3,sp),x
8202                     ; 1406 		if (((uint32_t)(pnRecvBufEnd - pnRecvBuf) < 32) && (pnRecvBuf != NULL) &&
8202                     ; 1407 			(QH_SearchStrVal((int8_t *)pnRecvBuf, (int8_t *)pnRecvBufEnd, &dwSignalStr) == TRUE))
8204  0d28 72f007        	subw	x,(OFST-1,sp)
8205  0d2b cd0000        	call	c_itolx
8207  0d2e ae0475        	ldw	x,#L045
8208  0d31 cd0000        	call	c_lcmp
8210  0d34 2418          	jruge	L5673
8212  0d36 1e07          	ldw	x,(OFST-1,sp)
8213  0d38 2714          	jreq	L5673
8215  0d3a 96            	ldw	x,sp
8216  0d3b 5c            	incw	x
8217  0d3c 89            	pushw	x
8218  0d3d 1e07          	ldw	x,(OFST-1,sp)
8219  0d3f 89            	pushw	x
8220  0d40 1e0b          	ldw	x,(OFST+3,sp)
8221  0d42 cd0844        	call	_QH_SearchStrVal
8223  0d45 5b04          	addw	sp,#4
8224  0d47 4a            	dec	a
8225  0d48 2604          	jrne	L5673
8226                     ; 1409 			return ((uint8_t)dwSignalStr);
8228  0d4a 7b04          	ld	a,(OFST-4,sp)
8230  0d4c 2001          	jra	L445
8231  0d4e               L5673:
8232                     ; 1413 	return (0);
8234  0d4e 4f            	clr	a
8236  0d4f               L445:
8238  0d4f 5b08          	addw	sp,#8
8239  0d51 81            	ret	
8304                     ; 1422 uint8_t  SIMGK7M_GetCIMI(u8 *pnOutBuf, u8 nLen)
8304                     ; 1423 {
8305                     	switch	.text
8306  0d52               _SIMGK7M_GetCIMI:
8308  0d52 89            	pushw	x
8309  0d53 5204          	subw	sp,#4
8310       00000004      OFST:	set	4
8313                     ; 1427 	if (UC_CommAT(AT_CMD_CIMI, NULL, "46", NULL, NULL, NULL, &pnRecvBuf, 1000) == 1)
8315  0d55 ae03e8        	ldw	x,#1000
8316  0d58 89            	pushw	x
8317  0d59 5f            	clrw	x
8318  0d5a 89            	pushw	x
8319  0d5b 96            	ldw	x,sp
8320  0d5c 1c0007        	addw	x,#OFST+3
8321  0d5f 89            	pushw	x
8322  0d60 5f            	clrw	x
8323  0d61 89            	pushw	x
8324  0d62 89            	pushw	x
8325  0d63 89            	pushw	x
8326  0d64 ae04d4        	ldw	x,#L5204
8327  0d67 89            	pushw	x
8328  0d68 5f            	clrw	x
8329  0d69 89            	pushw	x
8330  0d6a a60d          	ld	a,#13
8331  0d6c cd08d2        	call	_UC_CommAT
8333  0d6f 5b10          	addw	sp,#16
8334  0d71 4a            	dec	a
8335  0d72 262f          	jrne	L3204
8336                     ; 1429 		pnRecvBufEnd = (uint8_t  *)(pnRecvBuf + JX_Strlen((char *)pnRecvBuf));
8338  0d74 1e03          	ldw	x,(OFST-1,sp)
8339  0d76 cd0307        	call	_JX_Strlen
8341  0d79 5f            	clrw	x
8342  0d7a 97            	ld	xl,a
8343  0d7b 72fb03        	addw	x,(OFST-1,sp)
8344  0d7e 1f01          	ldw	(OFST-3,sp),x
8345                     ; 1430 		if (((uint32_t)(pnRecvBufEnd - pnRecvBuf) < 32) && (pnRecvBuf != NULL))
8347  0d80 72f003        	subw	x,(OFST-1,sp)
8348  0d83 cd0000        	call	c_itolx
8350  0d86 ae0475        	ldw	x,#L045
8351  0d89 cd0000        	call	c_lcmp
8353  0d8c 2415          	jruge	L3204
8355  0d8e 1e03          	ldw	x,(OFST-1,sp)
8356  0d90 2711          	jreq	L3204
8357                     ; 1432 			MemcpyFunc(pnOutBuf, pnRecvBuf, nLen);
8359  0d92 7b09          	ld	a,(OFST+5,sp)
8360  0d94 88            	push	a
8361  0d95 1e04          	ldw	x,(OFST+0,sp)
8362  0d97 89            	pushw	x
8363  0d98 1e08          	ldw	x,(OFST+4,sp)
8364  0d9a cd0000        	call	_MemcpyFunc
8366  0d9d 5b03          	addw	sp,#3
8367                     ; 1433 			return TRUE;
8369  0d9f a601          	ld	a,#1
8371  0da1 2001          	jra	L655
8372  0da3               L3204:
8373                     ; 1437 	return (0);
8375  0da3 4f            	clr	a
8377  0da4               L655:
8379  0da4 5b06          	addw	sp,#6
8380  0da6 81            	ret	
8445                     ; 1445 uint8_t  SIMGL868_GetCCID(u8 *pnOutBuf, u8 nLen)
8445                     ; 1446 {
8446                     	switch	.text
8447  0da7               _SIMGL868_GetCCID:
8449  0da7 89            	pushw	x
8450  0da8 5204          	subw	sp,#4
8451       00000004      OFST:	set	4
8454                     ; 1450 	if (UC_CommAT(AT_CMD_CCID, NULL, "89", NULL, NULL, NULL, &pnRecvBuf, 1000) == 1)
8456  0daa ae03e8        	ldw	x,#1000
8457  0dad 89            	pushw	x
8458  0dae 5f            	clrw	x
8459  0daf 89            	pushw	x
8460  0db0 96            	ldw	x,sp
8461  0db1 1c0007        	addw	x,#OFST+3
8462  0db4 89            	pushw	x
8463  0db5 5f            	clrw	x
8464  0db6 89            	pushw	x
8465  0db7 89            	pushw	x
8466  0db8 89            	pushw	x
8467  0db9 ae04d1        	ldw	x,#L3604
8468  0dbc 89            	pushw	x
8469  0dbd 5f            	clrw	x
8470  0dbe 89            	pushw	x
8471  0dbf a609          	ld	a,#9
8472  0dc1 cd08d2        	call	_UC_CommAT
8474  0dc4 5b10          	addw	sp,#16
8475  0dc6 4a            	dec	a
8476  0dc7 262f          	jrne	L1604
8477                     ; 1452 		pnRecvBufEnd = (uint8_t  *)(pnRecvBuf + JX_Strlen((char *)pnRecvBuf));
8479  0dc9 1e03          	ldw	x,(OFST-1,sp)
8480  0dcb cd0307        	call	_JX_Strlen
8482  0dce 5f            	clrw	x
8483  0dcf 97            	ld	xl,a
8484  0dd0 72fb03        	addw	x,(OFST-1,sp)
8485  0dd3 1f01          	ldw	(OFST-3,sp),x
8486                     ; 1453 		if (((uint32_t)(pnRecvBufEnd - pnRecvBuf) < 32) && (pnRecvBuf != NULL))
8488  0dd5 72f003        	subw	x,(OFST-1,sp)
8489  0dd8 cd0000        	call	c_itolx
8491  0ddb ae0475        	ldw	x,#L045
8492  0dde cd0000        	call	c_lcmp
8494  0de1 2415          	jruge	L1604
8496  0de3 1e03          	ldw	x,(OFST-1,sp)
8497  0de5 2711          	jreq	L1604
8498                     ; 1455 			MemcpyFunc(pnOutBuf, pnRecvBuf, nLen);
8500  0de7 7b09          	ld	a,(OFST+5,sp)
8501  0de9 88            	push	a
8502  0dea 1e04          	ldw	x,(OFST+0,sp)
8503  0dec 89            	pushw	x
8504  0ded 1e08          	ldw	x,(OFST+4,sp)
8505  0def cd0000        	call	_MemcpyFunc
8507  0df2 5b03          	addw	sp,#3
8508                     ; 1456 			return TRUE;
8510  0df4 a601          	ld	a,#1
8512  0df6 2001          	jra	L075
8513  0df8               L1604:
8514                     ; 1460 	return (0);
8516  0df8 4f            	clr	a
8518  0df9               L075:
8520  0df9 5b06          	addw	sp,#6
8521  0dfb 81            	ret	
8524                     	switch	.data
8525  00cf               L7604_nFailCnt:
8526  00cf 00            	dc.b	0
8635                     ; 1472 u8 AT_CmdFailProc(u8 nCmd, u8 *pnParameter, uint8_t *pnMatch1, uint8_t *pnMatch2, uint8_t *pnMatch3, 
8635                     ; 1473 					 uint8_t *pnMatch4, uint8_t **pnOutMatchPtr, uint32_t dwWaitmS)
8635                     ; 1474 {
8636                     	switch	.text
8637  0dfc               _AT_CmdFailProc:
8639  0dfc 88            	push	a
8640       00000000      OFST:	set	0
8643                     ; 1477 	if(1 != UC_CommAT(nCmd, pnParameter, pnMatch1, pnMatch2, pnMatch3, pnMatch4, pnOutMatchPtr, dwWaitmS))
8645  0dfd 1e12          	ldw	x,(OFST+18,sp)
8646  0dff 89            	pushw	x
8647  0e00 1e12          	ldw	x,(OFST+18,sp)
8648  0e02 89            	pushw	x
8649  0e03 1e12          	ldw	x,(OFST+18,sp)
8650  0e05 89            	pushw	x
8651  0e06 1e12          	ldw	x,(OFST+18,sp)
8652  0e08 89            	pushw	x
8653  0e09 1e12          	ldw	x,(OFST+18,sp)
8654  0e0b 89            	pushw	x
8655  0e0c 1e12          	ldw	x,(OFST+18,sp)
8656  0e0e 89            	pushw	x
8657  0e0f 1e12          	ldw	x,(OFST+18,sp)
8658  0e11 89            	pushw	x
8659  0e12 1e12          	ldw	x,(OFST+18,sp)
8660  0e14 89            	pushw	x
8661  0e15 cd08d2        	call	_UC_CommAT
8663  0e18 5b10          	addw	sp,#16
8664  0e1a 4a            	dec	a
8665  0e1b 271d          	jreq	L1414
8666                     ; 1479 		nFailCnt++;
8668  0e1d 725c00cf      	inc	L7604_nFailCnt
8669                     ; 1480 		if(TO_MAXCNT < nFailCnt)
8671  0e21 c600cf        	ld	a,L7604_nFailCnt
8672  0e24 a103          	cp	a,#3
8673  0e26 2519          	jrult	L5414
8674                     ; 1482 			nFailCnt = 0;
8676  0e28 725f00cf      	clr	L7604_nFailCnt
8677                     ; 1483 			m_nGprsStep = INIT_PWR_OFF;
8679  0e2c 725f00a6      	clr	_m_nGprsStep
8680                     ; 1484 			ucStatusGsm = GSM_INIT;
8682  0e30 35010068      	mov	_ucStatusGsm,#1
8683                     ; 1485 			stRepFail.wError |= (1<<ATCMD_ERROR);
8685  0e34 72120006      	bset	_stRepFail+6,#1
8686  0e38 2007          	jra	L5414
8687  0e3a               L1414:
8688                     ; 1490 		nFailCnt = 0;
8690  0e3a c700cf        	ld	L7604_nFailCnt,a
8691                     ; 1491 		return TRUE;
8693  0e3d 4c            	inc	a
8696  0e3e 5b01          	addw	sp,#1
8697  0e40 81            	ret	
8698  0e41               L5414:
8699                     ; 1494 	return FALSE;
8701  0e41 4f            	clr	a
8704  0e42 5b01          	addw	sp,#1
8705  0e44 81            	ret	
8708                     	switch	.data
8709  00d0               L7414_nFailCnt:
8710  00d0 00            	dc.b	0
8711  00d1               L1514_nCnt:
8712  00d1 00            	dc.b	0
8784                     	switch	.const
8785  0479               L076:
8786  0479 0e60          	dc.w	L3514
8787  047b 0e78          	dc.w	L5514
8788  047d 0eac          	dc.w	L7514
8789  047f 0ec4          	dc.w	L1614
8790  0481 0ed4          	dc.w	L3614
8791  0483 0f09          	dc.w	L5614
8792  0485 0f30          	dc.w	L7614
8793  0487 0f5d          	dc.w	L1714
8794  0489 0f7f          	dc.w	L3714
8795  048b 0f9e          	dc.w	L5714
8796  048d 0fc2          	dc.w	L7714
8797                     ; 1506 u8 M590_Init(void)
8797                     ; 1507 {
8798                     	switch	.text
8799  0e45               _M590_Init:
8801  0e45 88            	push	a
8802       00000001      OFST:	set	1
8805                     ; 1508 	uint8_t nSig = 0, nTmp = 0, nResult = 0;
8811                     ; 1512 	if(FALSE == UC_SleepProc())
8813  0e46 cd0707        	call	_UC_SleepProc
8815  0e49 4d            	tnz	a
8816  0e4a 2603          	jrne	L7224
8817                     ; 1514 		return FALSE;
8821  0e4c 5b01          	addw	sp,#1
8822  0e4e 81            	ret	
8823  0e4f               L7224:
8824                     ; 1517 	switch(m_nGprsStep)
8826  0e4f c600a6        	ld	a,_m_nGprsStep
8828                     ; 1637 		default:
8828                     ; 1638 			break;
8829  0e52 a10b          	cp	a,#11
8830  0e54 2503cc101f    	jruge	L3324
8831  0e59 5f            	clrw	x
8832  0e5a 97            	ld	xl,a
8833  0e5b 58            	sllw	x
8834  0e5c de0479        	ldw	x,(L076,x)
8835  0e5f fc            	jp	(x)
8836  0e60               L3514:
8837                     ; 1519 		case INIT_PWR_OFF:			
8837                     ; 1520 			SetPortGsmPowerOff();		   //断电			
8839  0e60 4b00          	push	#0
8840  0e62 4b10          	push	#16
8841  0e64 ae500a        	ldw	x,#20490
8842  0e67 cd0000        	call	_GPIO_WriteBit
8844  0e6a 85            	popw	x
8845                     ; 1521 			UC_SetSleepCnt(5000);
8847  0e6b ae1388        	ldw	x,#5000
8848  0e6e cd1023        	call	LC017
8849                     ; 1522 			m_nGprsStep = INIT_PWR_ON;
8851  0e71 350100a6      	mov	_m_nGprsStep,#1
8852                     ; 1523 			break;
8854  0e75 cc101f        	jra	L3324
8855  0e78               L5514:
8856                     ; 1525 		case INIT_PWR_ON:
8856                     ; 1526 			TurnBusUartOn();	           //硬件串口波特率,115200 BAUDRATE_38400
8858  0e78 cd0000        	call	_TurnBusUartOn
8860                     ; 1527 			SetPortGsmResetEnable();       //软件复位			
8862  0e7b 4b01          	push	#1
8863  0e7d 4b40          	push	#64
8864  0e7f ae5005        	ldw	x,#20485
8865  0e82 cd0000        	call	_GPIO_WriteBit
8867  0e85 85            	popw	x
8868                     ; 1529 			SetPortGsmResetDisable();
8870  0e86 4b00          	push	#0
8871  0e88 4b40          	push	#64
8872  0e8a ae5005        	ldw	x,#20485
8873  0e8d cd0000        	call	_GPIO_WriteBit
8875  0e90 85            	popw	x
8876                     ; 1530 			SetPortGsmPowerOn();		   //供电
8878  0e91 4b01          	push	#1
8879  0e93 4b10          	push	#16
8880  0e95 ae500a        	ldw	x,#20490
8881  0e98 cd0000        	call	_GPIO_WriteBit
8883  0e9b 85            	popw	x
8884                     ; 1531 			SetPortSoftSwitchOn();
8886  0e9c cd1036        	call	LC019
8887                     ; 1532 			UC_SetSleepCnt(3000);
8889  0e9f ae0bb8        	ldw	x,#3000
8890  0ea2 cd1023        	call	LC017
8891                     ; 1533 			m_nGprsStep = INIT_SWITCH_OFF;
8893  0ea5 350200a6      	mov	_m_nGprsStep,#2
8894                     ; 1534 			break;
8896  0ea9 cc101f        	jra	L3324
8897  0eac               L7514:
8898                     ; 1536 		case INIT_SWITCH_OFF:
8898                     ; 1537 			SetPortSoftSwitchOff();
8900  0eac 4b00          	push	#0
8901  0eae 4b20          	push	#32
8902  0eb0 ae5005        	ldw	x,#20485
8903  0eb3 cd0000        	call	_GPIO_WriteBit
8905  0eb6 85            	popw	x
8906                     ; 1538 			UC_SetSleepCnt(3000);
8908  0eb7 ae0bb8        	ldw	x,#3000
8909  0eba cd1023        	call	LC017
8910                     ; 1539 			m_nGprsStep = INIT_SWITCH_ON;
8912  0ebd 350300a6      	mov	_m_nGprsStep,#3
8913                     ; 1540 			break;
8915  0ec1 cc101f        	jra	L3324
8916  0ec4               L1614:
8917                     ; 1542 		case INIT_SWITCH_ON:
8917                     ; 1543 			SetPortSoftSwitchOn();
8919  0ec4 cd1036        	call	LC019
8920                     ; 1544 			UC_SetSleepCnt(4000);
8922  0ec7 ae0fa0        	ldw	x,#4000
8923  0eca cd1023        	call	LC017
8924                     ; 1545 			m_nGprsStep = INIT_PBREADY_1;
8926  0ecd 350400a6      	mov	_m_nGprsStep,#4
8927                     ; 1546 			break;
8929  0ed1 cc101f        	jra	L3324
8930  0ed4               L3614:
8931                     ; 1548 		case INIT_PBREADY_1: /* 等待模块上电稳定初始化OK */
8931                     ; 1549 			//SetPortSoftSwitchOn();
8931                     ; 1550 			//SetPortSoftSwitchOff();
8931                     ; 1551 			UC_SetSleepCnt(100);
8933  0ed4 ae0064        	ldw	x,#100
8934  0ed7 cd1023        	call	LC017
8935                     ; 1555 			if(FALSE == AT_CmdFailProc(AT_CMD_I, NULL, "OK", "ERROR", NULL, NULL, NULL, 3000))
8937  0eda ae0bb8        	ldw	x,#3000
8938  0edd 89            	pushw	x
8939  0ede 5f            	clrw	x
8940  0edf 89            	pushw	x
8941  0ee0 89            	pushw	x
8942  0ee1 89            	pushw	x
8943  0ee2 89            	pushw	x
8944  0ee3 ae04f3        	ldw	x,#L5373
8945  0ee6 89            	pushw	x
8946  0ee7 ae04fb        	ldw	x,#L7324
8947  0eea 89            	pushw	x
8948  0eeb 5f            	clrw	x
8949  0eec 89            	pushw	x
8950  0eed a608          	ld	a,#8
8951  0eef cd0dfc        	call	_AT_CmdFailProc
8953  0ef2 5b10          	addw	sp,#16
8954  0ef4 4d            	tnz	a
8955  0ef5 2607          	jrne	L5324
8956                     ; 1557 				stRepFail.wError |= (1<<REP_NO_GPRS_MODE);
8958  0ef7 72100007      	bset	_stRepFail+7,#0
8959                     ; 1558 				return FALSE;
8963  0efb 5b01          	addw	sp,#1
8964  0efd 81            	ret	
8965  0efe               L5324:
8966                     ; 1561 			stRepFail.wError &= ~((u16)(1<<REP_NO_GPRS_MODE));
8968  0efe 72110007      	bres	_stRepFail+7,#0
8969                     ; 1562 			m_nGprsStep = INIT_SET_IPR;
8971  0f02 350500a6      	mov	_m_nGprsStep,#5
8972                     ; 1563 			break;
8974  0f06 cc101f        	jra	L3324
8975  0f09               L5614:
8976                     ; 1565 		case INIT_SET_IPR:
8976                     ; 1566 			if(FALSE == AT_CmdFailProc(AT_CMD_IPR, NULL, "OK", "ERROR", NULL, NULL, NULL, 3000))
8978  0f09 ae0bb8        	ldw	x,#3000
8979  0f0c 89            	pushw	x
8980  0f0d 5f            	clrw	x
8981  0f0e 89            	pushw	x
8982  0f0f 89            	pushw	x
8983  0f10 89            	pushw	x
8984  0f11 89            	pushw	x
8985  0f12 ae04f3        	ldw	x,#L5373
8986  0f15 89            	pushw	x
8987  0f16 ae04fb        	ldw	x,#L7324
8988  0f19 89            	pushw	x
8989  0f1a 5f            	clrw	x
8990  0f1b 89            	pushw	x
8991  0f1c a61d          	ld	a,#29
8992  0f1e cd0dfc        	call	_AT_CmdFailProc
8994  0f21 5b10          	addw	sp,#16
8995  0f23 4d            	tnz	a
8996  0f24 2603          	jrne	L1424
8997                     ; 1568 				return FALSE;
9001  0f26 5b01          	addw	sp,#1
9002  0f28 81            	ret	
9003  0f29               L1424:
9004                     ; 1570 			m_nGprsStep = INIT_CPIN_2;
9006  0f29 350600a6      	mov	_m_nGprsStep,#6
9007                     ; 1571 			break;
9009  0f2d cc101f        	jra	L3324
9010  0f30               L7614:
9011                     ; 1573 		case INIT_CPIN_2:/* 检查 SIM 卡状态 */	
9011                     ; 1574 			UC_SetSleepCnt(100);
9013  0f30 ae0064        	ldw	x,#100
9014  0f33 cd1023        	call	LC017
9015                     ; 1575 			if(FALSE == AT_CmdFailProc(AT_CMD_CPIN,	NULL, "READY", "ERROR", NULL, NULL, NULL, 1000))
9017  0f36 ae03e8        	ldw	x,#1000
9018  0f39 89            	pushw	x
9019  0f3a 5f            	clrw	x
9020  0f3b 89            	pushw	x
9021  0f3c 89            	pushw	x
9022  0f3d 89            	pushw	x
9023  0f3e 89            	pushw	x
9024  0f3f ae04f3        	ldw	x,#L5373
9025  0f42 89            	pushw	x
9026  0f43 ae04cb        	ldw	x,#L5424
9027  0f46 89            	pushw	x
9028  0f47 5f            	clrw	x
9029  0f48 89            	pushw	x
9030  0f49 a617          	ld	a,#23
9031  0f4b cd0dfc        	call	_AT_CmdFailProc
9033  0f4e 5b10          	addw	sp,#16
9034  0f50 4d            	tnz	a
9035  0f51 2603          	jrne	L3424
9036                     ; 1577 				return FALSE;
9040  0f53 5b01          	addw	sp,#1
9041  0f55 81            	ret	
9042  0f56               L3424:
9043                     ; 1579 			m_nGprsStep = INIT_IMSI_3;
9045  0f56 350700a6      	mov	_m_nGprsStep,#7
9046                     ; 1580 			break;
9048  0f5a cc101f        	jra	L3324
9049  0f5d               L1714:
9050                     ; 1582 		case INIT_IMSI_3:/* 读取 SIM 卡的 内置IMSI号 */
9050                     ; 1583 			nResult = SIMGK7M_GetCIMI(m_nImsiBuf, sizeof(m_nImsiBuf));
9052  0f5d 4b18          	push	#24
9053  0f5f ae0085        	ldw	x,#_m_nImsiBuf
9054  0f62 cd0d52        	call	_SIMGK7M_GetCIMI
9056  0f65 5b01          	addw	sp,#1
9057  0f67 6b01          	ld	(OFST+0,sp),a
9058                     ; 1584 			if((3 < nCnt++)||(nResult))
9060  0f69 cd102c        	call	LC018
9061  0f6c 2404          	jruge	L1524
9063  0f6e 7b01          	ld	a,(OFST+0,sp)
9064  0f70 2708          	jreq	L7424
9065  0f72               L1524:
9066                     ; 1586 				nCnt = 0;
9068  0f72 725f00d1      	clr	L1514_nCnt
9069                     ; 1587 				m_nGprsStep = INIT_CCID_4;
9071  0f76 350800a6      	mov	_m_nGprsStep,#8
9072  0f7a               L7424:
9073                     ; 1589 			UC_SetSleepCnt(100);
9075  0f7a ae0064        	ldw	x,#100
9077                     ; 1590 			break;
9079  0f7d 203f          	jp	LC015
9080  0f7f               L3714:
9081                     ; 1592 		case INIT_CCID_4:/* 读取 SIM 卡的 CCID */
9081                     ; 1593 			nResult = SIMGL868_GetCCID(m_nCcidBuf, sizeof(m_nCcidBuf));
9083  0f7f 4b18          	push	#24
9084  0f81 ae006d        	ldw	x,#_m_nCcidBuf
9085  0f84 cd0da7        	call	_SIMGL868_GetCCID
9087  0f87 5b01          	addw	sp,#1
9088  0f89 6b01          	ld	(OFST+0,sp),a
9089                     ; 1594 			if((3 < nCnt++)||(nResult))
9091  0f8b cd102c        	call	LC018
9092  0f8e 2404          	jruge	L5524
9094  0f90 7b01          	ld	a,(OFST+0,sp)
9095  0f92 2727          	jreq	L7524
9096  0f94               L5524:
9097                     ; 1596 				nCnt = 0;
9099  0f94 725f00d1      	clr	L1514_nCnt
9100                     ; 1597 				m_nGprsStep = INIT_CSQ_5;
9102  0f98 350900a6      	mov	_m_nGprsStep,#9
9103                     ; 1599 			UC_SetSleepCnt(8000);
9105                     ; 1600 			break;
9107  0f9c 201d          	jp	L7524
9108  0f9e               L5714:
9109                     ; 1601 		case INIT_CSQ_5:/* 读取信号强度经验证此处最少延时6S查询三次，才能获得相对稳定信号 */
9109                     ; 1602 			nSig = SIMGL868_UpdateSignal();
9111  0f9e cd0cf6        	call	_SIMGL868_UpdateSignal
9113  0fa1 6b01          	ld	(OFST+0,sp),a
9114                     ; 1603 			if((3 < nCnt++)||((15 <= nSig)&&(32 > nSig)))
9116  0fa3 cd102c        	call	LC018
9117  0fa6 240a          	jruge	L1624
9119  0fa8 7b01          	ld	a,(OFST+0,sp)
9120  0faa a10f          	cp	a,#15
9121  0fac 250d          	jrult	L7524
9123  0fae a120          	cp	a,#32
9124  0fb0 2409          	jruge	L7524
9125  0fb2               L1624:
9126                     ; 1605 				m_nGprsStep = INIT_CREG_6;
9128  0fb2 350a00a6      	mov	_m_nGprsStep,#10
9129                     ; 1606 				g_nSignal = nSig;
9131  0fb6 7b01          	ld	a,(OFST+0,sp)
9132  0fb8 c70000        	ld	_g_nSignal,a
9133  0fbb               L7524:
9134                     ; 1608 			UC_SetSleepCnt(8000);
9137  0fbb ae1f40        	ldw	x,#8000
9139  0fbe               LC015:
9140  0fbe ad63          	call	LC017
9141                     ; 1609 			break;
9143  0fc0 205d          	jra	L3324
9144  0fc2               L7714:
9145                     ; 1611 		case INIT_CREG_6:   /* 已注册上 GSM 网络 */
9145                     ; 1612 			nTmp = UC_CommAT(AT_CMD_CREG,	NULL, "+CREG: 0,1", "+CREG: 0,5", "ERROR", NULL, NULL, 1000);
9147  0fc2 ae03e8        	ldw	x,#1000
9148  0fc5 89            	pushw	x
9149  0fc6 5f            	clrw	x
9150  0fc7 89            	pushw	x
9151  0fc8 89            	pushw	x
9152  0fc9 89            	pushw	x
9153  0fca ae04f3        	ldw	x,#L5373
9154  0fcd 89            	pushw	x
9155  0fce ae04dd        	ldw	x,#L3373
9156  0fd1 89            	pushw	x
9157  0fd2 ae04e8        	ldw	x,#L1373
9158  0fd5 89            	pushw	x
9159  0fd6 5f            	clrw	x
9160  0fd7 89            	pushw	x
9161  0fd8 a61a          	ld	a,#26
9162  0fda cd08d2        	call	_UC_CommAT
9164  0fdd 5b10          	addw	sp,#16
9165  0fdf 6b01          	ld	(OFST+0,sp),a
9166                     ; 1613 			if((nTmp != 1)&&(nTmp != 2))
9168  0fe1 a101          	cp	a,#1
9169  0fe3 2724          	jreq	L3624
9171  0fe5 a102          	cp	a,#2
9172  0fe7 2720          	jreq	L3624
9173                     ; 1615 				if(TO_MAXCNT < nFailCnt++)
9175  0fe9 c600d0        	ld	a,L7414_nFailCnt
9176  0fec 725c00d0      	inc	L7414_nFailCnt
9177  0ff0 a103          	cp	a,#3
9178  0ff2 250c          	jrult	L5624
9179                     ; 1617 					stRepFail.wError |= (1<<REP_REG_FAIL);
9181  0ff4 72120007      	bset	_stRepFail+7,#1
9182                     ; 1618 					nFailCnt = 0;
9184  0ff8 725f00d0      	clr	L7414_nFailCnt
9185                     ; 1619 					m_nGprsStep = INIT_PWR_OFF;
9187  0ffc 725f00a6      	clr	_m_nGprsStep
9188  1000               L5624:
9189                     ; 1621 				UC_SetSleepCnt(1000);
9191  1000 ae03e8        	ldw	x,#1000
9192  1003 ad1e          	call	LC017
9193                     ; 1622 				return FALSE;
9195  1005 4f            	clr	a
9198  1006 5b01          	addw	sp,#1
9199  1008 81            	ret	
9200  1009               L3624:
9201                     ; 1626 				nFailCnt = 0;
9203  1009 725f00d0      	clr	L7414_nFailCnt
9204                     ; 1629 			m_nGprsStep = PPP_CGATT_0;
9206  100d 725f00a6      	clr	_m_nGprsStep
9207                     ; 1633 			stRepFail.wError &= ~((u16)(1<<REP_REG_FAIL));
9209  1011 72130007      	bres	_stRepFail+7,#1
9210                     ; 1634 			UC_SetSleepCnt(100);
9212  1015 ae0064        	ldw	x,#100
9213  1018 ad09          	call	LC017
9214                     ; 1635 			return TRUE;
9216  101a a601          	ld	a,#1
9219  101c 5b01          	addw	sp,#1
9220  101e 81            	ret	
9221                     ; 1637 		default:
9221                     ; 1638 			break;
9223  101f               L3324:
9224                     ; 1640 	return FALSE;
9226  101f 4f            	clr	a
9229  1020 5b01          	addw	sp,#1
9230  1022 81            	ret	
9232  1023               LC017:
9233  1023 89            	pushw	x
9234  1024 5f            	clrw	x
9235  1025 89            	pushw	x
9236  1026 cd06fc        	call	_UC_SetSleepCnt
9238  1029 5b04          	addw	sp,#4
9239  102b 81            	ret	
9240  102c               LC018:
9241  102c c600d1        	ld	a,L1514_nCnt
9242  102f 725c00d1      	inc	L1514_nCnt
9243  1033 a104          	cp	a,#4
9244  1035 81            	ret	
9245  1036               LC019:
9246  1036 4b01          	push	#1
9247  1038 4b20          	push	#32
9248  103a ae5005        	ldw	x,#20485
9249  103d cd0000        	call	_GPIO_WriteBit
9251  1040 85            	popw	x
9252  1041 81            	ret	
9285                     ; 1652 s8 M590_HandShake(void)
9285                     ; 1653 {
9286                     	switch	.text
9287  1042               _M590_HandShake:
9291                     ; 1655 	if(FALSE == UC_SleepProc())
9293  1042 cd0707        	call	_UC_SleepProc
9295  1045 4d            	tnz	a
9296  1046 2601          	jrne	L5134
9297                     ; 1657 		return FALSE;
9301  1048 81            	ret	
9302  1049               L5134:
9303                     ; 1659 	switch(m_nGprsStep)
9305  1049 c600a6        	ld	a,_m_nGprsStep
9307                     ; 1714 	default:
9307                     ; 1715 		break;
9308  104c 2715          	jreq	L1724
9309  104e 4a            	dec	a
9310  104f 273d          	jreq	L3724
9311  1051 4a            	dec	a
9312  1052 2765          	jreq	L5724
9313  1054 4a            	dec	a
9314  1055 2603cc10e1    	jreq	L7724
9315  105a 4a            	dec	a
9316  105b 2603cc1134    	jreq	L1034
9317  1060 cc115e        	jra	L1234
9318  1063               L1724:
9319                     ; 1662 	case PPP_CGATT_0: /* GPRS附着 */		
9319                     ; 1663 		UC_SetSleepCnt(100);
9321  1063 ae0064        	ldw	x,#100
9322  1066 cd1160        	call	LC020
9323  1069 89            	pushw	x
9324  106a 5f            	clrw	x
9325  106b 89            	pushw	x
9326  106c 89            	pushw	x
9327  106d 89            	pushw	x
9328  106e 89            	pushw	x
9329  106f ae04f3        	ldw	x,#L5373
9330  1072 89            	pushw	x
9331  1073 ae04fb        	ldw	x,#L7324
9332  1076 89            	pushw	x
9333  1077 ae0002        	ldw	x,#_aucAtPAscii_1
9334  107a 89            	pushw	x
9335  107b a637          	ld	a,#55
9336  107d cd0dfc        	call	_AT_CmdFailProc
9338  1080 5b10          	addw	sp,#16
9339  1082 4d            	tnz	a
9340  1083 2602          	jrne	L3234
9341                     ; 1666 			return ERROR;
9343  1085 4a            	dec	a
9346  1086 81            	ret	
9347  1087               L3234:
9348                     ; 1668 		m_nGprsStep = PPP_CSTT_1;
9350  1087 350100a6      	mov	_m_nGprsStep,#1
9351                     ; 1669 		break;
9353  108b cc115e        	jra	L1234
9354  108e               L3724:
9355                     ; 1670 	case PPP_CSTT_1: /* 设置APN */
9355                     ; 1671 		UC_SetSleepCnt(100);
9357  108e ae0064        	ldw	x,#100
9358  1091 cd1160        	call	LC020
9359  1094 89            	pushw	x
9360  1095 5f            	clrw	x
9361  1096 89            	pushw	x
9362  1097 89            	pushw	x
9363  1098 89            	pushw	x
9364  1099 89            	pushw	x
9365  109a ae04f3        	ldw	x,#L5373
9366  109d 89            	pushw	x
9367  109e ae04fb        	ldw	x,#L7324
9368  10a1 89            	pushw	x
9369  10a2 ae0001        	ldw	x,#_g_nApnBuf
9370  10a5 89            	pushw	x
9371  10a6 a639          	ld	a,#57
9372  10a8 cd0dfc        	call	_AT_CmdFailProc
9374  10ab 5b10          	addw	sp,#16
9375  10ad 4d            	tnz	a
9376  10ae 2602          	jrne	L5234
9377                     ; 1675 			return ERROR;
9379  10b0 4a            	dec	a
9382  10b1 81            	ret	
9383  10b2               L5234:
9384                     ; 1677 		m_nGprsStep = PPP_CIICR_2;
9386  10b2 350200a6      	mov	_m_nGprsStep,#2
9387                     ; 1678 		break;
9389  10b6 cc115e        	jra	L1234
9390  10b9               L5724:
9391                     ; 1680 	case PPP_CIICR_2: /* 激活移动场景，开启 GPRS 或 CSD 无线连接 */
9391                     ; 1681 		UC_SetSleepCnt(3000);
9393  10b9 ae0bb8        	ldw	x,#3000
9394  10bc cd1160        	call	LC020
9395  10bf 89            	pushw	x
9396  10c0 5f            	clrw	x
9397  10c1 89            	pushw	x
9398  10c2 89            	pushw	x
9399  10c3 89            	pushw	x
9400  10c4 89            	pushw	x
9401  10c5 ae04f3        	ldw	x,#L5373
9402  10c8 89            	pushw	x
9403  10c9 ae04fb        	ldw	x,#L7324
9404  10cc 89            	pushw	x
9405  10cd 5f            	clrw	x
9406  10ce 89            	pushw	x
9407  10cf a644          	ld	a,#68
9408  10d1 cd0dfc        	call	_AT_CmdFailProc
9410  10d4 5b10          	addw	sp,#16
9411  10d6 4d            	tnz	a
9412  10d7 2602          	jrne	L7234
9413                     ; 1684 			return ERROR;
9415  10d9 4a            	dec	a
9418  10da 81            	ret	
9419  10db               L7234:
9420                     ; 1686 		m_nGprsStep = PPP_CIFSR_3;
9422  10db 350300a6      	mov	_m_nGprsStep,#3
9423                     ; 1687 		break;
9425  10df 207d          	jra	L1234
9426  10e1               L7724:
9427                     ; 1689 	case PPP_CIFSR_3: /* 获取IP */
9427                     ; 1690 		UC_SetSleepCnt(100);
9429  10e1 ae0064        	ldw	x,#100
9430  10e4 ad7a          	call	LC020
9431  10e6 89            	pushw	x
9432  10e7 5f            	clrw	x
9433  10e8 89            	pushw	x
9434  10e9 89            	pushw	x
9435  10ea 89            	pushw	x
9436  10eb 89            	pushw	x
9437  10ec ae04f3        	ldw	x,#L5373
9438  10ef 89            	pushw	x
9439  10f0 ae04fb        	ldw	x,#L7324
9440  10f3 89            	pushw	x
9441  10f4 5f            	clrw	x
9442  10f5 89            	pushw	x
9443  10f6 a643          	ld	a,#67
9444  10f8 cd08d2        	call	_UC_CommAT
9446  10fb 5b10          	addw	sp,#16
9447  10fd a102          	cp	a,#2
9448  10ff 2629          	jrne	L1334
9449                     ; 1693 			if(TO_MAXCNT < m_nCnt++)
9451  1101 c600ca        	ld	a,L1071_m_nCnt
9452  1104 725c00ca      	inc	L1071_m_nCnt
9453  1108 a103          	cp	a,#3
9454  110a 2510          	jrult	L3334
9455                     ; 1695 				m_nCnt = 0;
9457  110c 725f00ca      	clr	L1071_m_nCnt
9458                     ; 1696 				m_nGprsStep = INIT_PWR_OFF;
9460  1110 725f00a6      	clr	_m_nGprsStep
9461                     ; 1697 				ucStatusGsm = GSM_INIT;
9463  1114 35010068      	mov	_ucStatusGsm,#1
9464                     ; 1698 				stRepFail.wError |= (1<<ATCMD_ERROR);
9466  1118 72120006      	bset	_stRepFail+6,#1
9467  111c               L3334:
9468                     ; 1700 			UC_SetSleepCnt(1000);
9470  111c ae03e8        	ldw	x,#1000
9471  111f 89            	pushw	x
9472  1120 5f            	clrw	x
9473  1121 89            	pushw	x
9474  1122 cd06fc        	call	_UC_SetSleepCnt
9476  1125 5b04          	addw	sp,#4
9477                     ; 1701 			return ERROR;
9479  1127 a6ff          	ld	a,#255
9482  1129 81            	ret	
9483  112a               L1334:
9484                     ; 1703 		m_nCnt = 0;
9486  112a 725f00ca      	clr	L1071_m_nCnt
9487                     ; 1704 		m_nGprsStep = PPP_ATE0_4;
9489  112e 350400a6      	mov	_m_nGprsStep,#4
9490                     ; 1705 		break;		
9492  1132 202a          	jra	L1234
9493  1134               L1034:
9494                     ; 1706 	case PPP_ATE0_4: /* 关闭回显 */
9494                     ; 1707 		UC_SetSleepCnt(100);
9496  1134 ae0064        	ldw	x,#100
9497  1137 ad27          	call	LC020
9498  1139 89            	pushw	x
9499  113a 5f            	clrw	x
9500  113b 89            	pushw	x
9501  113c 89            	pushw	x
9502  113d 89            	pushw	x
9503  113e 89            	pushw	x
9504  113f ae04f3        	ldw	x,#L5373
9505  1142 89            	pushw	x
9506  1143 ae04fb        	ldw	x,#L7324
9507  1146 89            	pushw	x
9508  1147 ae0004        	ldw	x,#_aucAtPAscii_0
9509  114a 89            	pushw	x
9510  114b a601          	ld	a,#1
9511  114d cd0dfc        	call	_AT_CmdFailProc
9513  1150 5b10          	addw	sp,#16
9514  1152 4d            	tnz	a
9515  1153 2602          	jrne	L5334
9516                     ; 1710 			return ERROR;
9518  1155 4a            	dec	a
9521  1156 81            	ret	
9522  1157               L5334:
9523                     ; 1712 		m_nGprsStep = PPP_CGATT_0;
9525  1157 725f00a6      	clr	_m_nGprsStep
9526                     ; 1713 		return TRUE;
9528  115b a601          	ld	a,#1
9531  115d 81            	ret	
9532                     ; 1714 	default:
9532                     ; 1715 		break;
9534  115e               L1234:
9535                     ; 1792 	return FALSE;
9537  115e 4f            	clr	a
9540  115f 81            	ret	
9542  1160               LC020:
9543  1160 89            	pushw	x
9544  1161 5f            	clrw	x
9545  1162 89            	pushw	x
9546  1163 cd06fc        	call	_UC_SetSleepCnt
9548  1166 5b04          	addw	sp,#4
9549                     ; 1664 		if(FALSE == AT_CmdFailProc(AT_CMD_CGATT, (u8 *)aucAtPAscii_1, "OK", "ERROR", NULL, NULL, NULL, 1000))
9551  1168 ae03e8        	ldw	x,#1000
9552  116b 81            	ret	
9581                     ; 1804 u8 M590_CloseConnect(void)
9581                     ; 1805 {	
9582                     	switch	.text
9583  116c               _M590_CloseConnect:
9587                     ; 1807 		SetIO_LEDOff();
9589  116c 4b00          	push	#0
9590  116e 4b04          	push	#4
9591  1170 ae5005        	ldw	x,#20485
9592  1173 cd0000        	call	_GPIO_WriteBit
9594  1176 4f            	clr	a
9595  1177 85            	popw	x
9596                     ; 1811 		SetLogonMode(UP_LOGIN);
9598  1178 cd0033        	call	_SetLogonMode
9600                     ; 1814 	m_nGprsStep = INIT_PWR_OFF;
9602  117b 725f00a6      	clr	_m_nGprsStep
9603                     ; 1817 	FeedSoftWareIwdg();
9605  117f cd0000        	call	_FeedSoftWareIwdg
9607                     ; 1820 	UC_CommAT(AT_CMD_TCPCLOSE, NULL, "OK", "ERROR", NULL, NULL, NULL, 1000);
9609  1182 ae03e8        	ldw	x,#1000
9610  1185 89            	pushw	x
9611  1186 5f            	clrw	x
9612  1187 89            	pushw	x
9613  1188 89            	pushw	x
9614  1189 89            	pushw	x
9615  118a 89            	pushw	x
9616  118b ae04f3        	ldw	x,#L5373
9617  118e 89            	pushw	x
9618  118f ae04fb        	ldw	x,#L7324
9619  1192 89            	pushw	x
9620  1193 5f            	clrw	x
9621  1194 89            	pushw	x
9622  1195 a63b          	ld	a,#59
9623  1197 cd08d2        	call	_UC_CommAT
9625  119a 5b10          	addw	sp,#16
9626                     ; 1821 	delay_ms(50);
9628  119c ad5e          	call	LC021
9629  119e 89            	pushw	x
9630  119f 5f            	clrw	x
9631  11a0 89            	pushw	x
9632  11a1 89            	pushw	x
9633  11a2 89            	pushw	x
9634  11a3 89            	pushw	x
9635  11a4 ae04f3        	ldw	x,#L5373
9636  11a7 89            	pushw	x
9637  11a8 ae04fb        	ldw	x,#L7324
9638  11ab 89            	pushw	x
9639  11ac 5f            	clrw	x
9640  11ad 89            	pushw	x
9641  11ae a657          	ld	a,#87
9642  11b0 cd08d2        	call	_UC_CommAT
9644  11b3 5b10          	addw	sp,#16
9645                     ; 1825 	delay_ms(50);
9647  11b5 ae0032        	ldw	x,#50
9648  11b8 cd0000        	call	_delay_ms
9650                     ; 1828 	FeedSoftWareIwdg();
9652  11bb cd0000        	call	_FeedSoftWareIwdg
9654                     ; 1831 	UC_CommAT(AT_CMD_CGATT, (u8 *)aucAtPAscii_0, "OK", "ERROR", NULL, NULL, NULL, 1000);
9656  11be ae03e8        	ldw	x,#1000
9657  11c1 89            	pushw	x
9658  11c2 5f            	clrw	x
9659  11c3 89            	pushw	x
9660  11c4 89            	pushw	x
9661  11c5 89            	pushw	x
9662  11c6 89            	pushw	x
9663  11c7 ae04f3        	ldw	x,#L5373
9664  11ca 89            	pushw	x
9665  11cb ae04fb        	ldw	x,#L7324
9666  11ce 89            	pushw	x
9667  11cf ae0004        	ldw	x,#_aucAtPAscii_0
9668  11d2 89            	pushw	x
9669  11d3 a637          	ld	a,#55
9670  11d5 cd08d2        	call	_UC_CommAT
9672  11d8 5b10          	addw	sp,#16
9673                     ; 1832 	delay_ms(50);
9675  11da ad20          	call	LC021
9676  11dc 89            	pushw	x
9677  11dd 5f            	clrw	x
9678  11de 89            	pushw	x
9679  11df 89            	pushw	x
9680  11e0 89            	pushw	x
9681  11e1 89            	pushw	x
9682  11e2 ae04f3        	ldw	x,#L5373
9683  11e5 89            	pushw	x
9684  11e6 ae04fb        	ldw	x,#L7324
9685  11e9 89            	pushw	x
9686  11ea 5f            	clrw	x
9687  11eb 89            	pushw	x
9688  11ec a619          	ld	a,#25
9689  11ee cd08d2        	call	_UC_CommAT
9691  11f1 5b10          	addw	sp,#16
9692                     ; 1836 	delay_ms(50);
9694  11f3 ae0032        	ldw	x,#50
9695  11f6 cd0000        	call	_delay_ms
9697                     ; 1839 	return TRUE;	
9699  11f9 a601          	ld	a,#1
9702  11fb 81            	ret	
9704  11fc               LC021:
9705  11fc ae0032        	ldw	x,#50
9706  11ff cd0000        	call	_delay_ms
9708                     ; 1835 	UC_CommAT(AT_CMD_CPWROFF, NULL, "OK", "ERROR", NULL, NULL, NULL, 1000);
9710  1202 ae03e8        	ldw	x,#1000
9711  1205 81            	ret	
9756                     ; 1851 u8 M590_ConnectServer(u8 nBkFlg)
9756                     ; 1852 {
9757                     	switch	.text
9758  1206               _M590_ConnectServer:
9760  1206 88            	push	a
9761       00000001      OFST:	set	1
9764                     ; 1853 	u8 nRef = 0;
9766  1207 0f01          	clr	(OFST+0,sp)
9767                     ; 1863 	if(FALSE == nBkFlg)
9769  1209 4d            	tnz	a
9770  120a 263a          	jrne	L5634
9771                     ; 1865 		nRef = UC_CommATExt(AT_CMD_TCPSETUP, (u8 *)aucAtPServer1, (u8 *)aucAtPPort1, NULL,"CONNECT OK", "ALREADY CONNECT", "CONNECT FAIL", "ERROR", NULL, 20000);
9773  120c ae4e20        	ldw	x,#20000
9774  120f 89            	pushw	x
9775  1210 5f            	clrw	x
9776  1211 89            	pushw	x
9777  1212 89            	pushw	x
9778  1213 ae04f3        	ldw	x,#L5373
9779  1216 89            	pushw	x
9780  1217 ae04a3        	ldw	x,#L3734
9781  121a 89            	pushw	x
9782  121b ae04b0        	ldw	x,#L1734
9783  121e 89            	pushw	x
9784  121f ae04c0        	ldw	x,#L7634
9785  1222 89            	pushw	x
9786  1223 5f            	clrw	x
9787  1224 89            	pushw	x
9788  1225 ae0049        	ldw	x,#_aucAtPPort1
9789  1228 89            	pushw	x
9790  1229 ae0035        	ldw	x,#_aucAtPServer1
9791  122c 89            	pushw	x
9792  122d a63e          	ld	a,#62
9793  122f cd0aac        	call	_UC_CommATExt
9795  1232 5b14          	addw	sp,#20
9796  1234 6b01          	ld	(OFST+0,sp),a
9797                     ; 1866 		if((1 != nRef)&&(2 != nRef))
9799  1236 a101          	cp	a,#1
9800  1238 2746          	jreq	L7734
9802  123a a102          	cp	a,#2
9803  123c 2742          	jreq	L7734
9804                     ; 1868 			stRepFail.wError |= (1<<REP_CONNECT_FAIL);
9806  123e 72140007      	bset	_stRepFail+7,#2
9807                     ; 1869 			return FALSE;
9809  1242 4f            	clr	a
9812  1243 5b01          	addw	sp,#1
9813  1245 81            	ret	
9814  1246               L5634:
9815                     ; 1874 		nRef = UC_CommATExt(AT_CMD_TCPSETUP, (u8 *)aucAtPServerBk, (u8 *)aucAtPPortBk, NULL,"CONNECT OK", "ALREADY CONNECT", "CONNECT FAIL", "ERROR", NULL, 20000);
9817  1246 ae4e20        	ldw	x,#20000
9818  1249 89            	pushw	x
9819  124a 5f            	clrw	x
9820  124b 89            	pushw	x
9821  124c 89            	pushw	x
9822  124d ae04f3        	ldw	x,#L5373
9823  1250 89            	pushw	x
9824  1251 ae04a3        	ldw	x,#L3734
9825  1254 89            	pushw	x
9826  1255 ae04b0        	ldw	x,#L1734
9827  1258 89            	pushw	x
9828  1259 ae04c0        	ldw	x,#L7634
9829  125c 89            	pushw	x
9830  125d 5f            	clrw	x
9831  125e 89            	pushw	x
9832  125f ae0065        	ldw	x,#_aucAtPPortBk
9833  1262 89            	pushw	x
9834  1263 ae0051        	ldw	x,#_aucAtPServerBk
9835  1266 89            	pushw	x
9836  1267 a63e          	ld	a,#62
9837  1269 cd0aac        	call	_UC_CommATExt
9839  126c 5b14          	addw	sp,#20
9840  126e 6b01          	ld	(OFST+0,sp),a
9841                     ; 1875 		if((1 != nRef)&&(2 != nRef))
9843  1270 a101          	cp	a,#1
9844  1272 270c          	jreq	L7734
9846  1274 a102          	cp	a,#2
9847  1276 2708          	jreq	L7734
9848                     ; 1877 			stRepFail.wError |= (1<<REP_CONNECT_FAIL);
9850  1278 72140007      	bset	_stRepFail+7,#2
9851                     ; 1878 			return FALSE;
9853  127c 4f            	clr	a
9856  127d 5b01          	addw	sp,#1
9857  127f 81            	ret	
9858  1280               L7734:
9859                     ; 1881 	UC_SleepFunc(100);
9861  1280 ae0064        	ldw	x,#100
9862  1283 89            	pushw	x
9863  1284 5f            	clrw	x
9864  1285 89            	pushw	x
9865  1286 cd0751        	call	_UC_SleepFunc
9867  1289 5b04          	addw	sp,#4
9868                     ; 1883 	stRepFail.wError &= ~((u16)(1<<REP_CONNECT_FAIL));
9870  128b 72150007      	bres	_stRepFail+7,#2
9871                     ; 1884 	return TRUE;	
9873  128f a601          	ld	a,#1
9876  1291 5b01          	addw	sp,#1
9877  1293 81            	ret	
9919                     ; 1896 s8 M590_TcpSendDatLen(u8 nLen)
9919                     ; 1897 {
9920                     	switch	.text
9921  1294               _M590_TcpSendDatLen:
9923  1294 88            	push	a
9924  1295 88            	push	a
9925       00000001      OFST:	set	1
9928                     ; 1898 	s8 nRef = FALSE;
9930  1296 0f01          	clr	(OFST+0,sp)
9931                     ; 1900 	if(0 == nLen)
9933  1298 4d            	tnz	a
9934                     ; 1902 		return FALSE;
9937  1299 2739          	jreq	L477
9938                     ; 1905 	ucNumberMessage = nLen;
9940  129b 7b02          	ld	a,(OFST+1,sp)
9941  129d c7006b        	ld	_ucNumberMessage,a
9942                     ; 1908 	nRef = UC_CommATExt(AT_CMD_TCPSEND, NULL, NULL, NULL, ">", "ERROR", "Link Closed", NULL, NULL, 4000);
9944  12a0 ae0fa0        	ldw	x,#4000
9945  12a3 89            	pushw	x
9946  12a4 5f            	clrw	x
9947  12a5 89            	pushw	x
9948  12a6 89            	pushw	x
9949  12a7 89            	pushw	x
9950  12a8 ae0497        	ldw	x,#L5244
9951  12ab 89            	pushw	x
9952  12ac ae04f3        	ldw	x,#L5373
9953  12af 89            	pushw	x
9954  12b0 ae04f9        	ldw	x,#L3244
9955  12b3 89            	pushw	x
9956  12b4 5f            	clrw	x
9957  12b5 89            	pushw	x
9958  12b6 89            	pushw	x
9959  12b7 89            	pushw	x
9960  12b8 a63d          	ld	a,#61
9961  12ba cd0aac        	call	_UC_CommATExt
9963  12bd 5b14          	addw	sp,#20
9964  12bf 6b01          	ld	(OFST+0,sp),a
9965                     ; 1909 	UC_SleepFunc(100);
9967  12c1 ae0064        	ldw	x,#100
9968  12c4 89            	pushw	x
9969  12c5 5f            	clrw	x
9970  12c6 89            	pushw	x
9971  12c7 cd0751        	call	_UC_SleepFunc
9973  12ca 5b04          	addw	sp,#4
9974                     ; 1911 	if(1 == nRef)
9976  12cc 7b01          	ld	a,(OFST+0,sp)
9977  12ce a101          	cp	a,#1
9978  12d0 2604          	jrne	L7244
9979                     ; 1913 		return TRUE;	
9981  12d2 a601          	ld	a,#1
9983  12d4               L477:
9985  12d4 85            	popw	x
9986  12d5 81            	ret	
9987  12d6               L7244:
9988                     ; 1915 	else if((2 == nRef) || (3 == nRef))
9990  12d6 a102          	cp	a,#2
9991  12d8 2704          	jreq	L5344
9993  12da a103          	cp	a,#3
9994  12dc 2604          	jrne	L3344
9995  12de               L5344:
9996                     ; 1917 		return -1;
9998  12de a6ff          	ld	a,#255
10000  12e0 20f2          	jra	L477
10001  12e2               L3344:
10002                     ; 1921 		return FALSE;
10004  12e2 4f            	clr	a
10006  12e3 20ef          	jra	L477
10030                     ; 1934 u8 WatitDataSendOk(void)
10030                     ; 1935 {
10031                     	switch	.text
10032  12e5               _WatitDataSendOk:
10036                     ; 1937 	if(1 != UC_CommAT(AT_CMD_NULL, NULL, "OK", "ERROR", NULL, NULL, NULL, 20000))
10038  12e5 ae4e20        	ldw	x,#20000
10039  12e8 89            	pushw	x
10040  12e9 5f            	clrw	x
10041  12ea 89            	pushw	x
10042  12eb 89            	pushw	x
10043  12ec 89            	pushw	x
10044  12ed 89            	pushw	x
10045  12ee ae04f3        	ldw	x,#L5373
10046  12f1 89            	pushw	x
10047  12f2 ae04fb        	ldw	x,#L7324
10048  12f5 89            	pushw	x
10049  12f6 5f            	clrw	x
10050  12f7 89            	pushw	x
10051  12f8 a6ff          	ld	a,#255
10052  12fa cd08d2        	call	_UC_CommAT
10054  12fd 5b10          	addw	sp,#16
10055  12ff 4a            	dec	a
10056  1300 2702          	jreq	L1544
10057                     ; 1942 		return FALSE;
10059  1302 4f            	clr	a
10062  1303 81            	ret	
10063  1304               L1544:
10064                     ; 1944 	return TRUE;
10066  1304 4c            	inc	a
10069  1305 81            	ret	
10114                     ; 1958 void ReWriteRepFlg(void)
10114                     ; 1959 {
10115                     	switch	.text
10116  1306               _ReWriteRepFlg:
10118  1306 520d          	subw	sp,#13
10119       0000000d      OFST:	set	13
10122                     ; 1960 	u8 nLoop = 0;
10124                     ; 1963 	for(nLoop = 0; nLoop <= m_nRepIndex; nLoop++)
10126  1308 0f01          	clr	(OFST-12,sp)
10128  130a 2031          	jra	L7744
10129  130c               L3744:
10130                     ; 1965 		ReadRecord(nLoop, (u8*)&stRecord, sizeof(stRecord));
10132  130c 4b0c          	push	#12
10133  130e 96            	ldw	x,sp
10134  130f 1c0003        	addw	x,#OFST-10
10135  1312 89            	pushw	x
10136  1313 7b04          	ld	a,(OFST-9,sp)
10137  1315 cd0000        	call	_ReadRecord
10139  1318 5b03          	addw	sp,#3
10140                     ; 1966 		stRecord.nRepFlg = FALSE;		
10142  131a 0f0d          	clr	(OFST+0,sp)
10143                     ; 1967 		if(FALSE == EditRecord(nLoop,(u8*)&stRecord, sizeof(stRecord)))
10145  131c 4b0c          	push	#12
10146  131e 96            	ldw	x,sp
10147  131f 1c0003        	addw	x,#OFST-10
10148  1322 89            	pushw	x
10149  1323 7b04          	ld	a,(OFST-9,sp)
10150  1325 cd0000        	call	_EditRecord
10152  1328 5b03          	addw	sp,#3
10153  132a 4d            	tnz	a
10154  132b 260e          	jrne	L3054
10155                     ; 1969 			EditRecord(nLoop,(u8*)&stRecord, sizeof(stRecord));
10157  132d 4b0c          	push	#12
10158  132f 96            	ldw	x,sp
10159  1330 1c0003        	addw	x,#OFST-10
10160  1333 89            	pushw	x
10161  1334 7b04          	ld	a,(OFST-9,sp)
10162  1336 cd0000        	call	_EditRecord
10164  1339 5b03          	addw	sp,#3
10165  133b               L3054:
10166                     ; 1963 	for(nLoop = 0; nLoop <= m_nRepIndex; nLoop++)
10168  133b 0c01          	inc	(OFST-12,sp)
10169  133d               L7744:
10172  133d 7b01          	ld	a,(OFST-12,sp)
10173  133f c100bc        	cp	a,_m_nRepIndex
10174  1342 23c8          	jrule	L3744
10175                     ; 1972 }
10178  1344 5b0d          	addw	sp,#13
10179  1346 81            	ret	
10203                     ; 3823 u8 GetLedFlg(void)
10203                     ; 3824 {
10204                     	switch	.text
10205  1347               _GetLedFlg:
10209                     ; 3825 	return m_nLedFlashFlg;
10211  1347 c600bf        	ld	a,_m_nLedFlashFlg
10214  134a 81            	ret	
10238                     ; 3836 u8 GetGprsConntStat(void)
10238                     ; 3837 {
10239                     	switch	.text
10240  134b               _GetGprsConntStat:
10244                     ; 3838 	return ucStatusGsm;
10246  134b c60068        	ld	a,_ucStatusGsm
10249  134e 81            	ret	
10273                     ; 3850 u8 GetOnLineStatus(void)
10273                     ; 3851 {
10274                     	switch	.text
10275  134f               _GetOnLineStatus:
10279                     ; 3852 	return ucLogonMode;
10281  134f c6006a        	ld	a,_ucLogonMode
10284  1352 81            	ret	
10308                     ; 3864 u16 GetTermReportTime(void)
10308                     ; 3865 {
10309                     	switch	.text
10310  1353               _GetTermReportTime:
10314                     ; 3866 	return g_wTmReportCnt;
10316  1353 ce00ab        	ldw	x,_g_wTmReportCnt
10319  1356 81            	ret	
10322                     	switch	.data
10323  00d2               L5454_dwDelayCnt:
10324  00d2 00000000      	dc.l	0
10372                     ; 3878 void ReportTimeOutPro(void)
10372                     ; 3879 {
10373                     	switch	.text
10374  1357               _ReportTimeOutPro:
10376  1357 5204          	subw	sp,#4
10377       00000004      OFST:	set	4
10380                     ; 3881 	u32 dwTemp = 0;
10382  1359 5f            	clrw	x
10383  135a 1f03          	ldw	(OFST-1,sp),x
10384  135c 1f01          	ldw	(OFST-3,sp),x
10385                     ; 3883 	if(FALSE != bNeedReport)
10387  135e c60019        	ld	a,_tyGSMFlag
10388  1361 2626          	jrne	L4401
10389                     ; 3885 		return ;
10391                     ; 3889 	dwTemp = GetSysTemTick();
10393  1363 cd0000        	call	_GetSysTemTick
10395  1366 96            	ldw	x,sp
10396  1367 5c            	incw	x
10397  1368 cd0000        	call	c_rtol
10399                     ; 3890 	if(REPROT_DELAY < dwTemp-dwDelayCnt)
10401  136b 96            	ldw	x,sp
10402  136c 5c            	incw	x
10403  136d cd0000        	call	c_ltor
10405  1370 ae00d2        	ldw	x,#L5454_dwDelayCnt
10406  1373 cd0000        	call	c_lsub
10408  1376 cd0000        	call	c_lrzmp
10410  1379 270e          	jreq	L4401
10411                     ; 3892 		if(0 == dwDelayCnt)
10413  137b cd0000        	call	c_lzmp
10415  137e 260c          	jrne	L3754
10416                     ; 3894 			dwDelayCnt = GetSysTemTick();
10418  1380 cd0000        	call	_GetSysTemTick
10420  1383 ae00d2        	ldw	x,#L5454_dwDelayCnt
10421  1386 cd0000        	call	c_rtol
10423                     ; 3895 			return ;
10424  1389               L4401:
10427  1389 5b04          	addw	sp,#4
10428  138b 81            	ret	
10429                     ; 3900 		return ;
10431  138c               L3754:
10432                     ; 3903 	LP_SetLowPwrStartFlg(LP_GPRS_FLG_OK);
10434  138c a601          	ld	a,#1
10435  138e cd0000        	call	_LP_SetLowPwrStartFlg
10437                     ; 3904 	M590_CloseConnect();
10439  1391 cd116c        	call	_M590_CloseConnect
10441                     ; 3910 	if(KEY_WUAKEUP_FLG != (m_nWakeupReportFlg&KEY_WUAKEUP_FLG))
10443  1394 720000a50d    	btjt	_m_nWakeupReportFlg,#0,L5754
10444                     ; 3912 		if(m_nDataRepSucFlg)
10446  1399 c600be        	ld	a,_m_nDataRepSucFlg
10447  139c 2703          	jreq	L7754
10448                     ; 3914 			ReWriteRepFlg();
10450  139e cd1306        	call	_ReWriteRepFlg
10452  13a1               L7754:
10453                     ; 3916 		UpLinkSaveReportTime();
10455  13a1 cd00a7        	call	_UpLinkSaveReportTime
10458  13a4 200a          	jra	L1064
10459  13a6               L5754:
10460                     ; 3920 		m_nWakeupReportFlg &=(~(KEY_WUAKEUP_FLG));
10462  13a6 721100a5      	bres	_m_nWakeupReportFlg,#0
10463                     ; 3921 		SaveReportFlag(m_nWakeupReportFlg); 
10465  13aa c600a5        	ld	a,_m_nWakeupReportFlg
10466  13ad cd0000        	call	_SaveReportFlag
10468  13b0               L1064:
10469                     ; 3924 	UC_SleepFunc(1000);
10471  13b0 ae03e8        	ldw	x,#1000
10472  13b3 89            	pushw	x
10473  13b4 5f            	clrw	x
10474  13b5 89            	pushw	x
10475  13b6 cd0751        	call	_UC_SleepFunc
10477  13b9 5b04          	addw	sp,#4
10478                     ; 3925 	g_nReportFlg  = FALSE;
10480  13bb 725f00ad      	clr	_g_nReportFlg
10481                     ; 3926 	return ;
10483  13bf 20c8          	jra	L4401
10516                     ; 3940 void SetReportIndex(u8 nDat)
10516                     ; 3941 {
10517                     	switch	.text
10518  13c1               _SetReportIndex:
10522                     ; 3942 	m_nRepIndex = nDat;
10524  13c1 c700bc        	ld	_m_nRepIndex,a
10525                     ; 3943 }
10528  13c4 81            	ret	
10552                     ; 3954 u8 GetReportFlag(void)
10552                     ; 3955 {
10553                     	switch	.text
10554  13c5               _GetReportFlag:
10558                     ; 3956 	return g_nReportFlg;
10560  13c5 c600ad        	ld	a,_g_nReportFlg
10563  13c8 81            	ret	
10587                     ; 3968 u8 GetReportFailFlag(void)
10587                     ; 3969 {
10588                     	switch	.text
10589  13c9               _GetReportFailFlag:
10593                     ; 3970 	return m_nWakeupReportFlg;
10595  13c9 c600a5        	ld	a,_m_nWakeupReportFlg
10598  13cc 81            	ret	
10601                     	switch	.data
10602  00d6               L7364_nFailCnt:
10603  00d6 00            	dc.b	0
10652                     	switch	.const
10653  048f               L6501:
10654  048f 0001d4c0      	dc.l	120000
10655                     ; 3982 void fixTaskGsmProc(void)
10655                     ; 3983 {
10656                     	switch	.text
10657  13cd               _fixTaskGsmProc:
10659  13cd 5205          	subw	sp,#5
10660       00000005      OFST:	set	5
10663                     ; 3984 	s8 nResult = 0;	
10665  13cf 0f05          	clr	(OFST+0,sp)
10666                     ; 3988 	m_nLedFlashFlg = TRUE;
10668  13d1 350100bf      	mov	_m_nLedFlashFlg,#1
10669                     ; 3992 	if(REPROT_TIMEOUT+g_dwCommDelay < GetSysTemTick())
10671  13d5 cd0000        	call	_GetSysTemTick
10673  13d8 96            	ldw	x,sp
10674  13d9 5c            	incw	x
10675  13da cd0000        	call	c_rtol
10677  13dd ae00af        	ldw	x,#_g_dwCommDelay
10678  13e0 cd0000        	call	c_ltor
10680  13e3 ae048f        	ldw	x,#L6501
10681  13e6 cd0000        	call	c_ladd
10683  13e9 96            	ldw	x,sp
10684  13ea 5c            	incw	x
10685  13eb cd0000        	call	c_lcmp
10687  13ee 2409          	jruge	L7664
10688                     ; 3994 		bNeedReport = FALSE;
10690  13f0 725f0019      	clr	_tyGSMFlag
10691                     ; 3995 		M590_CloseConnect();
10693  13f4 cd116c        	call	_M590_CloseConnect
10695                     ; 3996 		return ;
10697  13f7 205d          	jra	L3764
10698  13f9               L7664:
10699                     ; 3999 	switch (ucStatusGsm)			//发送数据
10701  13f9 c60068        	ld	a,_ucStatusGsm
10703                     ; 4050 		break;
10704  13fc a002          	sub	a,#2
10705  13fe 2712          	jreq	L3464
10706  1400 4a            	dec	a
10707  1401 271b          	jreq	L5464
10708  1403 4a            	dec	a
10709  1404 274a          	jreq	L7464
10710                     ; 4001 	default:
10710                     ; 4002 		if(FALSE != M590_Init())
10712  1406 cd0e45        	call	_M590_Init
10714  1409 4d            	tnz	a
10715  140a 274a          	jreq	L3764
10716                     ; 4004 			ucStatusGsm = GSM_SHAKEHAND;
10718  140c 35020068      	mov	_ucStatusGsm,#2
10719  1410 2044          	jra	L3764
10720  1412               L3464:
10721                     ; 4008 	case GSM_SHAKEHAND:		
10721                     ; 4009 		if(TRUE == (nResult = M590_HandShake()))
10723  1412 cd1042        	call	_M590_HandShake
10725  1415 4a            	dec	a
10726  1416 263e          	jrne	L3764
10727                     ; 4011 			ucStatusGsm = GSM_DAIL;
10729  1418 35030068      	mov	_ucStatusGsm,#3
10730  141c 2038          	jra	L3764
10731  141e               L5464:
10732                     ; 4015 	case GSM_DAIL:
10732                     ; 4016 		if(TRUE == M590_ConnectServer(m_nIpAddBk))
10734  141e c600bb        	ld	a,_m_nIpAddBk
10735  1421 cd1206        	call	_M590_ConnectServer
10737  1424 4a            	dec	a
10738  1425 2606          	jrne	L1074
10739                     ; 4018 			ucStatusGsm = GSM_SEND;
10741  1427 35040068      	mov	_ucStatusGsm,#4
10743  142b 2029          	jra	L3764
10744  142d               L1074:
10745                     ; 4022 			nFailCnt++;
10747  142d 725c00d6      	inc	L7364_nFailCnt
10748                     ; 4023 			if(TO_MAXCNT < nFailCnt)
10750  1431 c600d6        	ld	a,L7364_nFailCnt
10751  1434 a103          	cp	a,#3
10752  1436 251e          	jrult	L3764
10753                     ; 4025 				nFailCnt = 0;
10755  1438 725f00d6      	clr	L7364_nFailCnt
10756                     ; 4028 				if(FALSE == m_nIpAddBk)
10758  143c c600bb        	ld	a,_m_nIpAddBk
10759  143f 2606          	jrne	L7074
10760                     ; 4030 					m_nIpAddBk = TRUE;
10762  1441 350100bb      	mov	_m_nIpAddBk,#1
10763                     ; 4031 					break;
10765  1445 200f          	jra	L3764
10766  1447               L7074:
10767                     ; 4033 				M590_CloseConnect();
10769  1447 cd116c        	call	_M590_CloseConnect
10771                     ; 4034 				ucStatusGsm = GSM_SHAKEHAND;
10773  144a 35020068      	mov	_ucStatusGsm,#2
10774  144e 2006          	jra	L3764
10775  1450               L7464:
10776                     ; 4039 	case GSM_SEND:		//发送数据.3
10776                     ; 4040 #ifdef  JASON130_PTR   //130协议
10776                     ; 4041 		JASON_130TimeOutReUpLoad();
10776                     ; 4042 		JASON_130ProtolProc();
10776                     ; 4043 #elif defined(XINJIANG_PTR)   //新疆协议
10776                     ; 4044 		XJ_TimeOutReUpLoad();
10776                     ; 4045 		XJ_ProtolProc();
10776                     ; 4046 #elif defined(HEDA_PTR)   //和达协议	
10776                     ; 4047 		HD_TimeOutReUpLoad();
10778  1450 cd0000        	call	_HD_TimeOutReUpLoad
10780                     ; 4048 		HD_ProtolProc();
10782  1453 cd0000        	call	_HD_ProtolProc
10784                     ; 4050 		break;
10786  1456               L3764:
10787                     ; 4052 	return ;
10790  1456 5b05          	addw	sp,#5
10791  1458 81            	ret	
10869                     	switch	.const
10870  0493               L2211:
10871  0493 0000003d      	dc.l	61
10872                     ; 4064 void fixTaskGsm(void)
10872                     ; 4065 {
10873                     	switch	.text
10874  1459               _fixTaskGsm:
10876  1459 5217          	subw	sp,#23
10877       00000017      OFST:	set	23
10880                     ; 4066 	s32 dwReport = 0, dwOffset = 0;	
10882  145b 96            	ldw	x,sp
10883  145c 5c            	incw	x
10884  145d cd0000        	call	c_ltor
10888  1460 96            	ldw	x,sp
10889  1461 1c0005        	addw	x,#OFST-18
10890  1464 cd0000        	call	c_ltor
10892                     ; 4070 	STM8_RTC_Get(&stReportTime);
10894  1467 96            	ldw	x,sp
10895  1468 1c0009        	addw	x,#OFST-14
10896  146b cd0000        	call	_STM8_RTC_Get
10898                     ; 4071 	TM_TimeChangeAToB(&stReportTime,&stTimeNowTm);
10900  146e 96            	ldw	x,sp
10901  146f 1c0010        	addw	x,#OFST-7
10902  1472 89            	pushw	x
10903  1473 1d0007        	subw	x,#7
10904  1476 cd0000        	call	_TM_TimeChangeAToB
10906  1479 c600a5        	ld	a,_m_nWakeupReportFlg
10907  147c a50f          	bcp	a,#15
10908  147e 85            	popw	x
10909                     ; 4074 	if((FALSE != (m_nWakeupReportFlg&REPORT_FLG))
10909                     ; 4075 		||FALSE == TM_IsValidTimePro(&stLastReportT)
10909                     ; 4076 		||(2015 >= stTimeNowTm.wYear)||(TRUE == g_OptValveRepFlg)
10909                     ; 4077 #ifdef PURCHASE_MODE
10909                     ; 4078 		|| (OWED_STAT_FLG == (tyParameter.nOverBuyFlg&(OWED_REP_SUCC|OWED_REP_FAIL|OWED_STAT_FLG)))
10909                     ; 4079 #endif
10909                     ; 4080 		||((ALARM_MASK&ALM_GetBatStatus()&&(MAX_REP_TIMES > g_nAlmRepFailCnt)&&(ALARM_REP_FLG != (ALARM_REP_FLG&g_nGuardEnFlg)))))
10911  147f 2629          	jrne	L1474
10913  1481 ae000a        	ldw	x,#_stLastReportT
10914  1484 cd0000        	call	_TM_IsValidTimePro
10916  1487 4d            	tnz	a
10917  1488 2720          	jreq	L1474
10919  148a 1e10          	ldw	x,(OFST-7,sp)
10920  148c a307e0        	cpw	x,#2016
10921  148f 2519          	jrult	L1474
10923  1491 c600ae        	ld	a,_g_OptValveRepFlg
10924  1494 4a            	dec	a
10925  1495 2713          	jreq	L1474
10927  1497 cd0000        	call	_ALM_GetBatStatus
10929  149a a50f          	bcp	a,#15
10930  149c 271c          	jreq	L7374
10932  149e c60000        	ld	a,_g_nAlmRepFailCnt
10933  14a1 a103          	cp	a,#3
10934  14a3 2415          	jruge	L7374
10936  14a5 7202000010    	btjt	_g_nGuardEnFlg,#1,L7374
10937  14aa               L1474:
10938                     ; 4082 		g_nReportFlg  = TRUE;
10940  14aa 350100ad      	mov	_g_nReportFlg,#1
10941                     ; 4083 	    m_nUploadMode = OTHER_REP;
10943  14ae 725f00c3      	clr	_m_nUploadMode
10944                     ; 4084 		fixTaskGsmProc();
10946  14b2               LC022:
10948  14b2 cd13cd        	call	_fixTaskGsmProc
10951  14b5               L1574:
10952                     ; 4161 	ReportTimeOutPro();
10954  14b5 cd1357        	call	_ReportTimeOutPro
10956                     ; 4162 	return ;
10958  14b8 2050          	jra	L6311
10959  14ba               L7374:
10960                     ; 4133 		if(FALSE == g_nReportFlg)
10962  14ba c600ad        	ld	a,_g_nReportFlg
10963  14bd 2656          	jrne	L3574
10964                     ; 4135 			dwReport = HD_ClaReportTimeToSec();
10966  14bf cd0000        	call	_HD_ClaReportTimeToSec
10968  14c2 96            	ldw	x,sp
10969  14c3 5c            	incw	x
10970  14c4 cd0000        	call	c_rtol
10972                     ; 4136 			dwOffset = TM_DiffSecond(&stLastReportT, &stTimeNowTm);
10974  14c7 96            	ldw	x,sp
10975  14c8 1c0010        	addw	x,#OFST-7
10976  14cb 89            	pushw	x
10977  14cc ae000a        	ldw	x,#_stLastReportT
10978  14cf cd0000        	call	_TM_DiffSecond
10980  14d2 85            	popw	x
10981  14d3 96            	ldw	x,sp
10982  14d4 1c0005        	addw	x,#OFST-18
10983  14d7 cd0000        	call	c_rtol
10985                     ; 4138 			if((60 < (dwOffset%dwReport)) ||
10985                     ; 4139 				((TRUE == ReadRecord(0, (u8*)&tyRecord, sizeof(tyRecord)))&&(FALSE == tyRecord.nRepFlg)))
10987  14da 96            	ldw	x,sp
10988  14db 1c0005        	addw	x,#OFST-18
10989  14de cd0000        	call	c_ltor
10991  14e1 96            	ldw	x,sp
10992  14e2 5c            	incw	x
10993  14e3 cd0000        	call	c_lmod
10995  14e6 ae0493        	ldw	x,#L2211
10996  14e9 cd0000        	call	c_lcmp
10998  14ec 2e14          	jrsge	L7574
11000  14ee 4b0c          	push	#12
11001  14f0 ae0000        	ldw	x,#_tyRecord
11002  14f3 89            	pushw	x
11003  14f4 4f            	clr	a
11004  14f5 cd0000        	call	_ReadRecord
11006  14f8 5b03          	addw	sp,#3
11007  14fa 4a            	dec	a
11008  14fb 2610          	jrne	L5574
11010  14fd c6000b        	ld	a,_tyRecord+11
11011  1500 260b          	jrne	L5574
11012  1502               L7574:
11013                     ; 4141 				LP_SetLowPwrStartFlg(LP_GPRS_FLG_OK);
11015  1502 a601          	ld	a,#1
11016  1504 cd0000        	call	_LP_SetLowPwrStartFlg
11018                     ; 4144 				M590_CloseConnect();
11020  1507 cd116c        	call	_M590_CloseConnect
11022                     ; 4145 				return ;
11023  150a               L6311:
11026  150a 5b17          	addw	sp,#23
11027  150c 81            	ret	
11028  150d               L5574:
11029                     ; 4149 				m_nUploadMode = TIME_DAT_REP;
11031  150d a601          	ld	a,#1
11032  150f c700c3        	ld	_m_nUploadMode,a
11033                     ; 4150 				g_nReportFlg  = TRUE;
11035  1512 c700ad        	ld	_g_nReportFlg,a
11036  1515               L3574:
11037                     ; 4153 		if(TRUE == g_nReportFlg)
11039  1515 4a            	dec	a
11040  1516 269d          	jrne	L1574
11041                     ; 4155 			fixTaskGsmProc();
11043  1518 2098          	jp	LC022
11080                     ; 4174 void InitializeGsm(void)
11080                     ; 4175 {	
11081                     	switch	.text
11082  151a               _InitializeGsm:
11086                     ; 4176 	tyGSMFlag = 0xFF;
11088  151a 35ff0019      	mov	_tyGSMFlag,#255
11089                     ; 4177 	ucStatusGsm    = GSM_INIT;
11091  151e 35010068      	mov	_ucStatusGsm,#1
11092                     ; 4178 	ucStepGsm      = 0;
11094  1522 725f0067      	clr	_ucStepGsm
11095                     ; 4179 	m_nGprsStep    = INIT_PWR_ON;
11097  1526 350100a6      	mov	_m_nGprsStep,#1
11098                     ; 4180 	stRepFail.wError = 0;
11100  152a 5f            	clrw	x
11101  152b cf0006        	ldw	_stRepFail+6,x
11102                     ; 4182 	m_nWakeupReportFlg = ReadReportFlag();
11104  152e cd0000        	call	_ReadReportFlag
11106  1531 c700a5        	ld	_m_nWakeupReportFlg,a
11107                     ; 4183 	ReadGroup(1, ADDRESS_GUARD_EN, &g_nGuardEnFlg);
11109  1534 ae0000        	ldw	x,#_g_nGuardEnFlg
11110  1537 89            	pushw	x
11111  1538 ae1000        	ldw	x,#4096
11112  153b 89            	pushw	x
11113  153c a601          	ld	a,#1
11114  153e cd0000        	call	_ReadGroup
11116  1541 5b04          	addw	sp,#4
11117                     ; 4184 	g_nAlmRepFailCnt = (g_nGuardEnFlg>>6);
11119  1543 c60000        	ld	a,_g_nGuardEnFlg
11120  1546 4e            	swap	a
11121  1547 a40c          	and	a,#12
11122  1549 44            	srl	a
11123  154a 44            	srl	a
11124  154b c70000        	ld	_g_nAlmRepFailCnt,a
11125                     ; 4191 	HD_InitializeGsm();
11127  154e cd0000        	call	_HD_InitializeGsm
11129                     ; 4195 	if(FALSE == ReadParameterForType((u8 *)&stOptValve, OPTVALVE_LEN, OPT_VALVE_PRAA))
11131  1551 4b06          	push	#6
11132  1553 4b0a          	push	#10
11133  1555 ae0000        	ldw	x,#_stOptValve
11134  1558 cd0000        	call	_ReadParameterForType
11136  155b 4d            	tnz	a
11137  155c 85            	popw	x
11138  155d 2618          	jrne	L5774
11139                     ; 4197 		stOptValve.nOptFlg    = CTL_VAVLE_ENABLE;
11141  155f 35aa0001      	mov	_stOptValve+1,#170
11142                     ; 4198 		stOptValve.nEnableFlg = CTL_VAVLE_ENABLE;
11144  1563 35aa0000      	mov	_stOptValve,#170
11145                     ; 4199 		stOptValve.nStartHour = 0x02;
11147  1567 35020005      	mov	_stOptValve+5,#2
11148                     ; 4200 		stOptValve.nEndHour   = 0x04;
11150  156b 35040006      	mov	_stOptValve+6,#4
11151                     ; 4201 		stOptValve.nVavleStat = 0;
11153  156f 725f0007      	clr	_stOptValve+7
11154                     ; 4202 		stOptValve.nVavleCycle= 0;
11156  1573 725f0009      	clr	_stOptValve+9
11157  1577               L5774:
11158                     ; 4205 	if((MAX_REP_TIMES > stOptValve.nRepFailCnt)&&(CTL_VALVE_OVER == stOptValve.nOptFlg))
11160  1577 c60008        	ld	a,_stOptValve+8
11161  157a a103          	cp	a,#3
11162  157c 240c          	jruge	L7774
11164  157e c60001        	ld	a,_stOptValve+1
11165  1581 a1ee          	cp	a,#238
11166  1583 2605          	jrne	L7774
11167                     ; 4207 		g_OptValveRepFlg = TRUE;
11169  1585 350100ae      	mov	_g_OptValveRepFlg,#1
11172  1589 81            	ret	
11173  158a               L7774:
11174                     ; 4209 	else if(MAX_REP_TIMES <= stOptValve.nRepFailCnt)
11176  158a c60008        	ld	a,_stOptValve+8
11177  158d a103          	cp	a,#3
11178  158f 2508          	jrult	L1005
11179                     ; 4211 		stOptValve.nOptFlg = 0;   /* 超出上报次数后，认为上报成功不在上报 */ 
11181  1591 725f0001      	clr	_stOptValve+1
11182                     ; 4212 		stOptValve.nRepFailCnt = 0;
11184  1595 725f0008      	clr	_stOptValve+8
11185  1599               L1005:
11186                     ; 4214 	return ;
11189  1599 81            	ret	
11613                     	xdef	_fixTaskGsmProc
11614                     	xdef	_ReportTimeOutPro
11615                     	xdef	_M590_ConnectServer
11616                     	xdef	_M590_HandShake
11617                     	xdef	_M590_Init
11618                     	xdef	_AT_CmdFailProc
11619                     	xdef	_SIMGetRegisterStat
11620                     	xdef	_UC_CommATExt
11621                     	xdef	_QH_SearchStrVal
11622                     	xdef	_QH_bufbuf
11623                     	xdef	_UC_SleepProc
11624                     	xdef	_UC_SetSleepCnt
11625                     	xdef	_PackAtCmdExt
11626                     	xdef	_PackTcpSendData
11627                     	xdef	_PackAtCmdTcpsend
11628                     	xdef	_PackAtCmdParameter3
11629                     	xdef	_PackAtCmdParameter2
11630                     	xdef	_PackAtCmdParameter
11631                     	xdef	_PackAtCmd
11632                     	xdef	_AlmMakeFrame
11633                     	xdef	_BatteryVolRepPro
11634                     	xdef	_UpLinkSaveReportTime
11635                     	xdef	_MeterTnNumTransform
11636                     	xdef	_VavleStatTransform
11637                     	xdef	_UC_CommAT
11638                     	xdef	_SIMGL868_GetCCID
11639                     	xdef	_g_nOwedRepFlg
11640                     	xdef	_m_nAlmRepFlg
11641                     	xdef	_m_nGmTn_2
11642                     	xdef	_m_nGmTn_1
11643                     	xdef	_m_nMasterType
11644                     	xdef	_m_nLedFlashFlg
11645                     	xdef	_m_nDataRepSucFlg
11646                     	xdef	_m_nRepIndex
11647                     	xdef	_m_nIpAddBk
11648                     	xdef	_g_BatRepFlg
11649                     	xdef	_g_nReportFlg
11650                     	xdef	_m_dwTimeCnt
11651                     	xdef	_m_nGprsStep
11652                     	xdef	_m_nWakeupReportFlg
11653                     	xdef	_m_nCcidBuf
11654                     	xdef	_m_nPtrcoVerBuf
11655                     	xdef	_aucAtPPortBk
11656                     	xdef	_aucAtPServerBk
11657                     	xdef	_g_nPwdBuf
11658                     	xdef	_g_nUsrBuf
11659                     	xref	_HD_DecodeParameter
11660                     	xref	_HD_ProtolProc
11661                     	xref	_HD_TimeOutReUpLoad
11662                     	xref	_HD_ClaReportTimeToSec
11663                     	xref	_HD_InitializeGsm
11664                     	xref	_ALM_GetBatStatus
11665                     	xref	_g_nAlmRepFailCnt
11666                     	xref	_g_nGuardEnFlg
11667                     	xref	_LP_SetLowPwrStartFlg
11668                     	xref	_STM8_RTC_Get
11669                     	xref	_stRepFail
11670                     	xref	_tyRecord
11671                     	xref	_ReadAlmRecord
11672                     	xref	_AddAlmRecord
11673                     	xref	_EditRecord
11674                     	xref	_SaveByte
11675                     	xref	_ReadGroup
11676                     	xref	_ReadReportFlag
11677                     	xref	_SaveReportFlag
11678                     	xref	_SaveParameterForType
11679                     	xref	_ReadParameterForType
11680                     	xref	_ReadRecord
11681                     	xdef	_JX_StringCat
11682                     	xdef	_JX_Strlen
11683                     	xdef	_GetIsmiCcidDat
11684                     	xdef	_GetGprsConntStat
11685                     	xdef	_GetOnLineStatus
11686                     	xdef	_GetLedFlg
11687                     	xdef	_FrameSendFunc
11688                     	xdef	_M590_CloseConnect
11689                     	xdef	_M590_TcpSendDatLen
11690                     	xdef	_SetLogonMode
11691                     	xdef	_WatitDataSendOk
11692                     	xdef	_ClaReportTimeToSec
11693                     	xdef	_SetReportIndex
11694                     	xdef	_GetReportFailFlag
11695                     	xdef	_ReWriteRepFlg
11696                     	xdef	_GetTermReportTime
11697                     	xdef	_UC_SleepFunc
11698                     	xdef	_InitializeGsm
11699                     	xdef	_fixTaskGsm
11700                     	xdef	_GetReportFlag
11701                     	xdef	_m_nUploadMode
11702                     	xdef	_g_dwTmAddress
11703                     	xdef	_g_OptValveRepFlg
11704                     	xdef	_g_nSignal
11705                     	xdef	_g_wTmReportCnt
11706                     	xdef	_aucAtPPort1
11707                     	xdef	_aucAtPServer1
11708                     	xdef	_g_dwCommDelay
11709                     	xdef	_m_nImsiBufXJ
11710                     	xdef	_m_nImsiBuf
11711                     	xdef	_m_nVerBuf
11712                     	xdef	_g_nApnType
11713                     	xdef	_m_nRepFailFlg
11714                     	xdef	_g_nDatRepCnt
11715                     	xdef	_m_nRepEnableFlg
11716                     	xdef	_g_dwRepTick
11717                     	switch	.bss
11718  0000               _stOptValve:
11719  0000 000000000000  	ds.b	10
11720                     	xdef	_stOptValve
11721  000a               _stLastReportT:
11722  000a 000000000000  	ds.b	8
11723                     	xdef	_stLastReportT
11724  0012               _stTimeNow:
11725  0012 000000000000  	ds.b	7
11726                     	xdef	_stTimeNow
11727                     	xdef	_g_nApnBuf
11728                     	xref	_GetUartRxBuf
11729                     	xref	_ClearRxBuff
11730                     	xref	_CheckRevDataLen
11731                     	xref	_TurnBusUartOn
11732                     	xref	_StartSendBusUartGroup
11733                     	xref	_SetBusUart
11734                     	xref	_FeedSoftWareIwdg
11735                     	xdef	_SIMGK7M_GetCIMI
11736                     	xdef	_SIMGL868_UpdateSignal
11737  0019               _tyGSMFlag:
11738  0019 00            	ds.b	1
11739                     	xdef	_tyGSMFlag
11740                     	xref	_aucUartTxBuffer
11741  001a               _tyReportParameter:
11742  001a 000000000000  	ds.b	39
11743                     	xdef	_tyReportParameter
11744  0041               _tyGprs:
11745  0041 000000000000  	ds.b	22
11746                     	xdef	_tyGprs
11747  0057               _ucErrorGsm:
11748  0057 00            	ds.b	1
11749                     	xdef	_ucErrorGsm
11750  0058               _tyTimerReport:
11751  0058 00000000      	ds.b	4
11752                     	xdef	_tyTimerReport
11753  005c               _tyReport:
11754  005c 000000000000  	ds.b	10
11755                     	xdef	_tyReport
11756  0066               _ucStepReveive:
11757  0066 00            	ds.b	1
11758                     	xdef	_ucStepReveive
11759  0067               _ucStepGsm:
11760  0067 00            	ds.b	1
11761                     	xdef	_ucStepGsm
11762  0068               _ucStatusGsm:
11763  0068 00            	ds.b	1
11764                     	xdef	_ucStatusGsm
11765  0069               _nLogonModeBk:
11766  0069 00            	ds.b	1
11767                     	xdef	_nLogonModeBk
11768  006a               _ucLogonMode:
11769  006a 00            	ds.b	1
11770                     	xdef	_ucLogonMode
11771  006b               _ucNumberMessage:
11772  006b 00            	ds.b	1
11773                     	xdef	_ucNumberMessage
11774                     	xdef	_aucAtRCmd
11775                     	xdef	_aucAtCmd
11776                     	xdef	_aucAtShutDown
11777                     	xdef	_aucAtMytimeupdate
11778                     	xdef	_aucAtMylacid
11779                     	xdef	_aucAtMycged
11780                     	xdef	_aucAtTcpsends
11781                     	xdef	_aucAtTcprecv_S
11782                     	xdef	_aucAtTcplisten
11783                     	xdef	_aucAtSignal
11784                     	xdef	_aucAtGprsstatus
11785                     	xdef	_aucAtCloselisten
11786                     	xdef	_aucAtCloseclient
11787                     	xdef	_aucAtClientstatus
11788                     	xdef	_aucAtFtpstatus
11789                     	xdef	_aucAtFtpput
11790                     	xdef	_aucAtFtplogout
11791                     	xdef	_aucAtFtplogin
11792                     	xdef	_aucAtFtpget
11793                     	xdef	_aucAtDnsserver
11794                     	xdef	_aucAtDns
11795                     	xdef	_aucAtXisp
11796                     	xdef	_aucAtXiic
11797                     	xdef	_aucAtUdpsetup
11798                     	xdef	_aucAtUdpsend
11799                     	xdef	_aucAtUdprecv
11800                     	xdef	_aucAtUdpclose
11801                     	xdef	_aucAtTcpclose
11802                     	xdef	_aucAtXgauth
11803                     	xdef	_aucAtTcpsetup
11804                     	xdef	_aucAtTcpsend
11805                     	xdef	_aucAtTcprecv
11806                     	xdef	_aucAtIpstatus
11807                     	xdef	_aucAtCusd
11808                     	xdef	_aucAtCgatt
11809                     	xdef	_aucAtPdpUn
11810                     	xdef	_aucAtPdpCm
11811                     	xdef	_aucAtCpbw
11812                     	xdef	_aucAtCpbs
11813                     	xdef	_aucAtCpbr
11814                     	xdef	_aucAtCpbf
11815                     	xdef	_aucAtCnum
11816                     	xdef	_aucAtCsms
11817                     	xdef	_aucAtCsmp
11818                     	xdef	_aucAtCsdh
11819                     	xdef	_aucAtCscs
11820                     	xdef	_aucAtCscb
11821                     	xdef	_aucAtCsca
11822                     	xdef	_aucAtCpms
11823                     	xdef	_aucAtCnmi
11824                     	xdef	_aucAtCmss
11825                     	xdef	_aucAtCmgw
11826                     	xdef	_aucAtCmgs
11827                     	xdef	_aucAtCmgr
11828                     	xdef	_aucAtCmgl
11829                     	xdef	_aucAtCmgf
11830                     	xdef	_aucAtCmgd
11831                     	xdef	_aucAtXbandsel
11832                     	xdef	_aucAtCsq
11833                     	xdef	_aucAtCops
11834                     	xdef	_aucAtIpr
11835                     	xdef	_aucAtIcf
11836                     	xdef	_aucAtEnpwrsavE
11837                     	xdef	_aucAtCreg
11838                     	xdef	_aucAtCpwroff
11839                     	xdef	_aucAtCpwd
11840                     	xdef	_aucAtCpin
11841                     	xdef	_aucAtCpas
11842                     	xdef	_aucAtCmux
11843                     	xdef	_aucAtCmee
11844                     	xdef	_aucAtClck
11845                     	xdef	_aucAtCipstatus
11846                     	xdef	_aucAtCfun
11847                     	xdef	_aucAtCeer
11848                     	xdef	_aucAtCclk
11849                     	xdef	_aucAtGetvers
11850                     	xdef	_aucAtCimi
11851                     	xdef	_aucAtCgsn
11852                     	xdef	_aucAtCgmm
11853                     	xdef	_aucAtCgmi
11854                     	xdef	_aucAtCcid
11855                     	xdef	_aucAtI
11856                     	xdef	_aucAtS_D
11857                     	xdef	_aucAtS_O
11858                     	xdef	_aucAtS_Plus
11859                     	xdef	_aucAtS_D2
11860                     	xdef	_aucATS_W
11861                     	xdef	_aucATS_V
11862                     	xdef	_aucATS_E
11863                     	xdef	_aucATS_A
11864                     	xdef	_aucAtNull
11865                     	xdef	_aucAtInit
11866                     	xdef	_aucAtrError
11867                     	xdef	_aucAtrIpr
11868                     	xdef	_aucAtrTcpclose
11869                     	xdef	_aucAtrTcprecv
11870                     	xdef	_aucAtrTcpsend
11871                     	xdef	_aucAtrTcpsetup
11872                     	xdef	_aucAtrXiic
11873                     	xdef	_aucAtrOk
11874                     	xdef	_aucAtrNeoway
11875                     	xdef	_aucAtrCreg
11876                     	xdef	_aucAtrCpinReady
11877                     	xdef	_aucAtrCclk
11878                     	xdef	_aucAtrPppFail
11879                     	xdef	_aucAtrInit
11880                     	xdef	_aucAtPPort2
11881                     	xdef	_aucAtPTimeServer2
11882                     	xdef	_aucAtPTimeServer1
11883                     	xdef	_aucAtPBaudrate
11884                     	xdef	_aucAtPAscii_Equal0
11885                     	xdef	_aucAtPAscii_Equal1
11886                     	xdef	_aucAtPAscii_0
11887                     	xdef	_aucAtPAscii_1
11888                     	xdef	_aucAtPAscii_Question
11889                     	xref	_JX_ByteToBcd
11890                     	xref	_TM_DiffSecond
11891                     	xref	_TM_TimeChangeAToB
11892                     	xref	_TM_IsValidTimePro
11893                     	xref	_JX_BL_Change
11894                     	xref	_MemcpyFunc
11895                     	xref	_MemsetFunc
11896                     	xref	_delay_ms
11897                     	xref	_GetSysTemTick
11898                     	xref	_GPIO_WriteBit
11899                     	switch	.const
11900  0497               L5244:
11901  0497 4c696e6b2043  	dc.b	"Link Closed",0
11902  04a3               L3734:
11903  04a3 434f4e4e4543  	dc.b	"CONNECT FAIL",0
11904  04b0               L1734:
11905  04b0 414c52454144  	dc.b	"ALREADY CONNECT",0
11906  04c0               L7634:
11907  04c0 434f4e4e4543  	dc.b	"CONNECT OK",0
11908  04cb               L5424:
11909  04cb 524541445900  	dc.b	"READY",0
11910  04d1               L3604:
11911  04d1 383900        	dc.b	"89",0
11912  04d4               L5204:
11913  04d4 343600        	dc.b	"46",0
11914  04d7               L7673:
11915  04d7 2b4353513a00  	dc.b	"+CSQ:",0
11916  04dd               L3373:
11917  04dd 2b435245473a  	dc.b	"+CREG: 0,5",0
11918  04e8               L1373:
11919  04e8 2b435245473a  	dc.b	"+CREG: 0,1",0
11920  04f3               L5373:
11921  04f3 4552524f5200  	dc.b	"ERROR",0
11922  04f9               L3244:
11923  04f9 3e00          	dc.b	">",0
11924  04fb               L7324:
11925  04fb 4f4b00        	dc.b	"OK",0
11926                     	xref.b	c_lreg
11946                     	xref	c_lmod
11947                     	xref	c_lzmp
11948                     	xref	c_lrzmp
11949                     	xref	c_itolx
11950                     	xref	c_lsbc
11951                     	xref	c_ladd
11952                     	xref	c_smul
11953                     	xref	c_lsub
11954                     	xref	c_lcmp
11955                     	xref	c_sdivx
11956                     	xref	c_smodx
11957                     	xref	c_xymvx
11958                     	xref	c_ltor
11959                     	xref	c_rtol
11960                     	xref	c_lmul
11961                     	end
