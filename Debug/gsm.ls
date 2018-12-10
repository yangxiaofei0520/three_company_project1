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
2777  0448 30            	dc.b	48
2778  0449 2e            	dc.b	46
2779  044a 31            	dc.b	49
2780  044b 2e            	dc.b	46
2781  044c 31            	dc.b	49
2782  044d 20            	dc.b	32
2783  044e 20            	dc.b	32
2784  044f 31            	dc.b	49
2785  0450 38            	dc.b	56
2786  0451 30            	dc.b	48
2787  0452 31            	dc.b	49
2788  0453 32            	dc.b	50
2789  0454 30            	dc.b	48
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
3284                     	switch	.const
3285  045f               L02:
3286  045f 00015180      	dc.l	86400
3287                     ; 249 s32 ClaReportTimeToSec(u8 nCycle)
3287                     ; 250 {
3288                     	switch	.text
3289  003a               _ClaReportTimeToSec:
3291  003a 88            	push	a
3292  003b 5210          	subw	sp,#16
3293       00000010      OFST:	set	16
3296                     ; 251 	s32 dwTemp = 0;
3298  003d 5f            	clrw	x
3299  003e 1f0f          	ldw	(OFST-1,sp),x
3300  0040 1f0d          	ldw	(OFST-3,sp),x
3301                     ; 254 	if(FALSE == ReadRecord(0, (u8*)&stRecord, sizeof(stRecord)))
3303  0042 4b0c          	push	#12
3304  0044 96            	ldw	x,sp
3305  0045 1c0002        	addw	x,#OFST-14
3306  0048 89            	pushw	x
3307  0049 4f            	clr	a
3308  004a cd0000        	call	_ReadRecord
3310  004d 5b03          	addw	sp,#3
3311  004f 4d            	tnz	a
3312  0050 2602          	jrne	L5112
3313                     ; 256 		stRecord.nStatus = VALVE_OPEN;
3315  0052 6b0b          	ld	(OFST-5,sp),a
3316  0054               L5112:
3317                     ; 262 	if((0x41 == nCycle)||(OLD_VAVLE_CLOSE == stRecord.nStatus)||(VALVE_CLOSE == GetBoardVavleStat())) //(0x41 == nCycle)
3319  0054 7b11          	ld	a,(OFST+1,sp)
3320  0056 a141          	cp	a,#65
3321  0058 270c          	jreq	L1212
3323  005a 7b0b          	ld	a,(OFST-5,sp)
3324  005c a108          	cp	a,#8
3325  005e 2706          	jreq	L1212
3327  0060 cd0000        	call	_GetBoardVavleStat
3329  0063 4a            	dec	a
3330  0064 2612          	jrne	L7112
3331  0066               L1212:
3332                     ; 270 		dwTemp = 3600;
3334  0066 ae0e10        	ldw	x,#3600
3335  0069               LC003:
3336  0069 1f0f          	ldw	(OFST-1,sp),x
3337  006b 5f            	clrw	x
3338  006c               LC002:
3339  006c 1f0d          	ldw	(OFST-3,sp),x
3341  006e               L5212:
3342                     ; 303 	return dwTemp;
3344  006e 96            	ldw	x,sp
3345  006f 1c000d        	addw	x,#OFST-3
3346  0072 cd0000        	call	c_ltor
3350  0075 5b11          	addw	sp,#17
3351  0077 81            	ret	
3352  0078               L7112:
3353                     ; 272 	else if((0xC1 == nCycle)||(0x81 == nCycle))/* 每天 不支持每月，每月也当做每天上报 */
3355  0078 7b11          	ld	a,(OFST+1,sp)
3356  007a a1c1          	cp	a,#193
3357  007c 2704          	jreq	L1312
3359  007e a181          	cp	a,#129
3360  0080 260a          	jrne	L7212
3361  0082               L1312:
3362                     ; 274 		dwTemp = 3600UL*24;
3364  0082 ae5180        	ldw	x,#20864
3365  0085 1f0f          	ldw	(OFST-1,sp),x
3366  0087 ae0001        	ldw	x,#1
3368  008a 20e0          	jp	LC002
3369  008c               L7212:
3370                     ; 276 	else if(30 >= nCycle)/* 每1-10天上报则按以下方式获取上报数据 */
3372  008c a11f          	cp	a,#31
3373  008e 2420          	jruge	L5312
3374                     ; 278 		if(6 == nCycle)
3376  0090 a106          	cp	a,#6
3377  0092 2605          	jrne	L7312
3378                     ; 280 			dwTemp = 3600UL*6;
3380  0094 ae5460        	ldw	x,#21600
3382  0097 20d0          	jp	LC003
3383  0099               L7312:
3384                     ; 294 			dwTemp = 3600UL*24*nCycle;
3386  0099 b703          	ld	c_lreg+3,a
3387  009b 3f02          	clr	c_lreg+2
3388  009d 3f01          	clr	c_lreg+1
3389  009f 3f00          	clr	c_lreg
3390  00a1 ae045f        	ldw	x,#L02
3391  00a4 cd0000        	call	c_lmul
3393  00a7 96            	ldw	x,sp
3394  00a8 1c000d        	addw	x,#OFST-3
3395  00ab cd0000        	call	c_rtol
3397  00ae 20be          	jra	L5212
3398  00b0               L5312:
3399                     ; 301 		dwTemp = 5UL*60;
3401  00b0 ae012c        	ldw	x,#300
3402  00b3 20b4          	jp	LC003
3405                     	switch	.const
3406  0463               L5412_nBuf:
3407  0463 00            	dc.b	0
3408  0464 000000000000  	ds.b	9
3607                     ; 315 void UpLinkSaveReportTime(void)
3607                     ; 316 {
3608                     	switch	.text
3609  00b5               _UpLinkSaveReportTime:
3611  00b5 5221          	subw	sp,#33
3612       00000021      OFST:	set	33
3615                     ; 319 	u8 nBuf[10] = {0};
3617  00b7 96            	ldw	x,sp
3618  00b8 1c0018        	addw	x,#OFST-9
3619  00bb 90ae0463      	ldw	y,#L5412_nBuf
3620  00bf a60a          	ld	a,#10
3621  00c1 cd0000        	call	c_xymvx
3623                     ; 320 	s32 dwOffsetSec = 0, dwCycle = 0;
3625  00c4 5f            	clrw	x
3626  00c5 1f03          	ldw	(OFST-30,sp),x
3627  00c7 1f01          	ldw	(OFST-32,sp),x
3630  00c9 1f07          	ldw	(OFST-26,sp),x
3631  00cb 1f05          	ldw	(OFST-28,sp),x
3632                     ; 322 	STM8_RTC_Get(&stReportTime);
3634  00cd 96            	ldw	x,sp
3635  00ce 1c0011        	addw	x,#OFST-16
3636  00d1 cd0000        	call	_STM8_RTC_Get
3638                     ; 323 	TM_TimeChangeAToB(&stReportTime,&stTime);
3640  00d4 96            	ldw	x,sp
3641  00d5 1c0009        	addw	x,#OFST-24
3642  00d8 89            	pushw	x
3643  00d9 1c0008        	addw	x,#8
3644  00dc cd0000        	call	_TM_TimeChangeAToB
3646  00df 85            	popw	x
3647                     ; 333 	g_wTmReportCnt++;
3649  00e0 ce00ab        	ldw	x,_g_wTmReportCnt
3650  00e3 5c            	incw	x
3651  00e4 cf00ab        	ldw	_g_wTmReportCnt,x
3652                     ; 341 	MemcpyFunc((u8*)nBuf, (u8*)&stLastReportT, 8);
3654  00e7 4b08          	push	#8
3655  00e9 ae000a        	ldw	x,#_stLastReportT
3656  00ec 89            	pushw	x
3657  00ed 96            	ldw	x,sp
3658  00ee 1c001b        	addw	x,#OFST-6
3659  00f1 cd0000        	call	_MemcpyFunc
3661  00f4 5b03          	addw	sp,#3
3662                     ; 342 	MemcpyFunc(&nBuf[8], (u8*)&g_wTmReportCnt, 2);
3664  00f6 4b02          	push	#2
3665  00f8 ae00ab        	ldw	x,#_g_wTmReportCnt
3666  00fb 89            	pushw	x
3667  00fc 96            	ldw	x,sp
3668  00fd 1c0023        	addw	x,#OFST+2
3669  0100 cd0000        	call	_MemcpyFunc
3671  0103 5b03          	addw	sp,#3
3672                     ; 343 	SaveParameterForType(nBuf, 10, LT_REP_TIME);
3674  0105 4b05          	push	#5
3675  0107 4b0a          	push	#10
3676  0109 96            	ldw	x,sp
3677  010a 1c001a        	addw	x,#OFST-7
3678  010d cd0000        	call	_SaveParameterForType
3680  0110 c60001        	ld	a,_stOptValve+1
3681  0113 a1ee          	cp	a,#238
3682  0115 85            	popw	x
3683                     ; 346 	if((CTL_VALVE_OVER == stOptValve.nOptFlg)&&(MAX_REP_TIMES > stOptValve.nRepFailCnt))
3685  0116 2624          	jrne	L5422
3687  0118 c60008        	ld	a,_stOptValve+8
3688  011b a103          	cp	a,#3
3689  011d 241d          	jruge	L5422
3690                     ; 348 		stOptValve.nRepFailCnt++;
3692  011f 725c0008      	inc	_stOptValve+8
3693                     ; 349 		stOptValve.nRepFailCnt = ((stOptValve.nRepFailCnt>MAX_REP_TIMES)?MAX_REP_TIMES:stOptValve.nRepFailCnt);
3695  0123 c60008        	ld	a,_stOptValve+8
3696  0126 a104          	cp	a,#4
3697  0128 2502          	jrult	L63
3698  012a a603          	ld	a,#3
3699  012c               L63:
3700  012c c70008        	ld	_stOptValve+8,a
3701                     ; 350 		SaveParameterForType((u8*)&stOptValve, OPTVALVE_LEN, OPT_VALVE_PRAA);
3703  012f 4b06          	push	#6
3704  0131 4b0a          	push	#10
3705  0133 ae0000        	ldw	x,#_stOptValve
3706  0136 cd0000        	call	_SaveParameterForType
3708  0139 85            	popw	x
3709                     ; 351 		return ;
3711  013a 2045          	jra	L07
3712  013c               L5422:
3713                     ; 355 	if((NO_ALARM != (ALM_GetBatStatus())&ALARM_MASK) 
3713                     ; 356 		&& (ALARM_REP_FLG != (g_nGuardEnFlg&ALARM_REP_FLG))
3713                     ; 357 		&& (MAX_REP_TIMES > g_nAlmRepFailCnt)&&(m_nAlmRepFlg))
3715  013c cd0000        	call	_ALM_GetBatStatus
3717  013f 4d            	tnz	a
3718  0140 2705          	jreq	L44
3719  0142 ae0001        	ldw	x,#1
3720  0145 2001          	jra	L05
3721  0147               L44:
3722  0147 5f            	clrw	x
3723  0148               L05:
3724  0148 01            	rrwa	x,a
3725  0149 a50f          	bcp	a,#15
3726  014b 2737          	jreq	L7422
3728  014d 7202000032    	btjt	_g_nGuardEnFlg,#1,L7422
3730  0152 c60000        	ld	a,_g_nAlmRepFailCnt
3731  0155 a103          	cp	a,#3
3732  0157 242b          	jruge	L7422
3734  0159 c600c4        	ld	a,_m_nAlmRepFlg
3735  015c 2726          	jreq	L7422
3736                     ; 359 		g_nAlmRepFailCnt++;
3738  015e 725c0000      	inc	_g_nAlmRepFailCnt
3739                     ; 360 		g_nAlmRepFailCnt = ((g_nAlmRepFailCnt>MAX_REP_TIMES)?MAX_REP_TIMES:g_nAlmRepFailCnt);
3741  0162 c60000        	ld	a,_g_nAlmRepFailCnt
3742  0165 a104          	cp	a,#4
3743  0167 2502          	jrult	L25
3744  0169 a603          	ld	a,#3
3745  016b               L25:
3746  016b c70000        	ld	_g_nAlmRepFailCnt,a
3747                     ; 361 		g_nGuardEnFlg |=(g_nAlmRepFailCnt<<6); /* 记录上报告警失败次数 */
3749  016e 97            	ld	xl,a
3750  016f a640          	ld	a,#64
3751  0171 42            	mul	x,a
3752  0172 9f            	ld	a,xl
3753  0173 ca0000        	or	a,_g_nGuardEnFlg
3754  0176 c70000        	ld	_g_nGuardEnFlg,a
3755                     ; 362 		SaveByte(ADDRESS_GUARD_EN, g_nGuardEnFlg);
3757  0179 88            	push	a
3758  017a ae1000        	ldw	x,#4096
3759  017d cd0000        	call	_SaveByte
3761  0180 84            	pop	a
3762                     ; 363 		return ;
3763  0181               L07:
3766  0181 5b21          	addw	sp,#33
3767  0183 81            	ret	
3768  0184               L7422:
3769                     ; 367 	if(m_nRepFailFlg)
3771  0184 c600bd        	ld	a,_m_nRepFailFlg
3772  0187 27f8          	jreq	L07
3773                     ; 369 		MemcpyFunc((u8*)&stRepFail.stTime, (u8*)&stReportTime, sizeof(stRepFail.stTime));
3775  0189 4b06          	push	#6
3776  018b 96            	ldw	x,sp
3777  018c 1c0012        	addw	x,#OFST-15
3778  018f 89            	pushw	x
3779  0190 ae0000        	ldw	x,#_stRepFail
3780  0193 cd0000        	call	_MemcpyFunc
3782  0196 5b03          	addw	sp,#3
3783                     ; 370 		stRepFail.nSigal = JX_ByteToBcd(g_nSignal);			//信号大小,固定值
3785  0198 c60000        	ld	a,_g_nSignal
3786  019b cd0000        	call	_JX_ByteToBcd
3788  019e c70008        	ld	_stRepFail+8,a
3789                     ; 371 		AddAlmRecord((u8*)&stRepFail, sizeof(stRepFail));
3791  01a1 4b09          	push	#9
3792  01a3 ae0000        	ldw	x,#_stRepFail
3793  01a6 cd0000        	call	_AddAlmRecord
3795  01a9 84            	pop	a
3796                     ; 374 		if(m_nWakeupReportFlg&THIRD_REP_FAIL)
3798  01aa 720700a506    	btjf	_m_nWakeupReportFlg,#3,L3522
3799                     ; 376 			m_nWakeupReportFlg = 0;
3801  01af 725f00a5      	clr	_m_nWakeupReportFlg
3803  01b3 201a          	jra	L5522
3804  01b5               L3522:
3805                     ; 386 		else if(m_nWakeupReportFlg&SECOND_REP_FAIL)
3807  01b5 720500a506    	btjf	_m_nWakeupReportFlg,#2,L7522
3808                     ; 388 			m_nWakeupReportFlg |= THIRD_REP_FAIL;
3810  01ba 721600a5      	bset	_m_nWakeupReportFlg,#3
3812  01be 200f          	jra	L5522
3813  01c0               L7522:
3814                     ; 390 		else if(m_nWakeupReportFlg&FIRST_REP_FAIL)
3816  01c0 720300a506    	btjf	_m_nWakeupReportFlg,#1,L3622
3817                     ; 392 			m_nWakeupReportFlg |= SECOND_REP_FAIL;
3819  01c5 721400a5      	bset	_m_nWakeupReportFlg,#2
3821  01c9 2004          	jra	L5522
3822  01cb               L3622:
3823                     ; 396 			m_nWakeupReportFlg |= FIRST_REP_FAIL;
3825  01cb 721200a5      	bset	_m_nWakeupReportFlg,#1
3826  01cf               L5522:
3827                     ; 398 		SaveReportFlag(m_nWakeupReportFlg);
3829  01cf c600a5        	ld	a,_m_nWakeupReportFlg
3830  01d2 cd0000        	call	_SaveReportFlag
3832                     ; 399 		m_nRepFailFlg = FALSE;
3834  01d5 725f00bd      	clr	_m_nRepFailFlg
3835                     ; 401 }
3837  01d9 20a6          	jra	L07
3870                     ; 411 void BatteryVolRepPro(void)
3870                     ; 412 {
3871                     	switch	.text
3872  01db               _BatteryVolRepPro:
3876                     ; 413 	if((ALARM_MASK&ALM_GetBatStatus())&&(g_BatRepFlg)
3876                     ; 414 		&&((OTHER_REP == m_nUploadMode)||(MAX_REP_TIMES <= g_nAlmRepFailCnt)))
3878  01db cd0000        	call	_ALM_GetBatStatus
3880  01de a50f          	bcp	a,#15
3881  01e0 2730          	jreq	L7722
3883  01e2 c600b3        	ld	a,_g_BatRepFlg
3884  01e5 272b          	jreq	L7722
3886  01e7 c600c3        	ld	a,_m_nUploadMode
3887  01ea 2707          	jreq	L1032
3889  01ec c60000        	ld	a,_g_nAlmRepFailCnt
3890  01ef a103          	cp	a,#3
3891  01f1 251f          	jrult	L7722
3892  01f3               L1032:
3893                     ; 416 		g_dwRepTick = GetSysTemTick();
3895  01f3 cd0000        	call	_GetSysTemTick
3897  01f6 ae00b5        	ldw	x,#_g_dwRepTick
3898  01f9 cd0000        	call	c_rtol
3900                     ; 417 		g_nDatRepCnt = 0;
3902  01fc 725f00b4      	clr	_g_nDatRepCnt
3903                     ; 418 		m_nRepEnableFlg = TRUE; //上报超时使能		
3905  0200 350100ba      	mov	_m_nRepEnableFlg,#1
3906                     ; 419 		SetLogonMode(UP_UPLOAD_BAT_VAL);
3908  0204 a604          	ld	a,#4
3909  0206 cd0033        	call	_SetLogonMode
3911                     ; 420 		g_BatRepFlg = FALSE;
3913  0209 725f00b3      	clr	_g_BatRepFlg
3914                     ; 421 		m_nAlmRepFlg = TRUE;
3916  020d 350100c4      	mov	_m_nAlmRepFlg,#1
3919  0211 81            	ret	
3920  0212               L7722:
3921                     ; 425 		SetLogonMode(UP_HEARTBEAT);
3923  0212 a601          	ld	a,#1
3925                     ; 427 	return ;
3928  0214 cc0033        	jp	_SetLogonMode
4071                     ; 439 u8 AlmMakeFrame(u8* pnOutBuf)
4071                     ; 440 {
4072                     	switch	.text
4073  0217               _AlmMakeFrame:
4075  0217 89            	pushw	x
4076  0218 520b          	subw	sp,#11
4077       0000000b      OFST:	set	11
4080                     ; 441 	u8 i = 0, nAtReportLen = 0;
4084  021a 0f01          	clr	(OFST-10,sp)
4085                     ; 444 	for(i = 0; i < MAX_ALM_NUM; i++)  //  wTemp
4087  021c 0f02          	clr	(OFST-9,sp)
4088  021e               L7632:
4089                     ; 447 		if(FALSE == ReadAlmRecord(i, (u8*)&stRecord, sizeof(stRecord)))
4091  021e 4b09          	push	#9
4092  0220 96            	ldw	x,sp
4093  0221 1c0004        	addw	x,#OFST-7
4094  0224 89            	pushw	x
4095  0225 7b05          	ld	a,(OFST-6,sp)
4096  0227 cd0000        	call	_ReadAlmRecord
4098  022a 5b03          	addw	sp,#3
4099  022c 4d            	tnz	a
4100  022d 260c          	jrne	L5732
4101                     ; 449 			MemsetFunc((u8*)&stRecord, 0xFF, sizeof(stRecord));
4103  022f 4b09          	push	#9
4104  0231 4bff          	push	#255
4105  0233 96            	ldw	x,sp
4106  0234 1c0005        	addw	x,#OFST-6
4107  0237 cd0000        	call	_MemsetFunc
4109  023a 85            	popw	x
4110  023b               L5732:
4111                     ; 452 		JX_BL_Change(2,(u8*)&stRecord.wError);
4113  023b 96            	ldw	x,sp
4114  023c 1c0009        	addw	x,#OFST-2
4115  023f 89            	pushw	x
4116  0240 ae0002        	ldw	x,#2
4117  0243 cd0000        	call	_JX_BL_Change
4119  0246 85            	popw	x
4120                     ; 453 		MemcpyFunc(&pnOutBuf[i*9], (u8*)&stRecord, sizeof(stRecord));
4122  0247 4b09          	push	#9
4123  0249 96            	ldw	x,sp
4124  024a 1c0004        	addw	x,#OFST-7
4125  024d 89            	pushw	x
4126  024e 7b05          	ld	a,(OFST-6,sp)
4127  0250 97            	ld	xl,a
4128  0251 a609          	ld	a,#9
4129  0253 42            	mul	x,a
4130  0254 72fb0f        	addw	x,(OFST+4,sp)
4131  0257 cd0000        	call	_MemcpyFunc
4133  025a 5b03          	addw	sp,#3
4134                     ; 454 		nAtReportLen = (i+1)*9;
4136  025c 7b02          	ld	a,(OFST-9,sp)
4137  025e 97            	ld	xl,a
4138  025f a609          	ld	a,#9
4139  0261 42            	mul	x,a
4140  0262 9f            	ld	a,xl
4141  0263 ab09          	add	a,#9
4142  0265 6b01          	ld	(OFST-10,sp),a
4143                     ; 444 	for(i = 0; i < MAX_ALM_NUM; i++)  //  wTemp
4145  0267 0c02          	inc	(OFST-9,sp)
4148  0269 7b02          	ld	a,(OFST-9,sp)
4149  026b a103          	cp	a,#3
4150  026d 25af          	jrult	L7632
4151                     ; 457 	return nAtReportLen;	
4153  026f 7b01          	ld	a,(OFST-10,sp)
4156  0271 5b0d          	addw	sp,#13
4157  0273 81            	ret	
4208                     ; 469 void FrameSendFunc(u8 Size, u8 nComChannel, u8* pnPoint)
4208                     ; 470 {
4209                     	switch	.text
4210  0274               _FrameSendFunc:
4212  0274 89            	pushw	x
4213       00000000      OFST:	set	0
4216                     ; 472 	if(COM_1 == nComChannel)
4218  0275 9f            	ld	a,xl
4219  0276 4a            	dec	a
4220  0277 2614          	jrne	L1242
4221                     ; 474 		*pnPoint++ = AT_TAIL_0;				//数据发送规定
4223  0279 1e05          	ldw	x,(OFST+5,sp)
4224  027b a60d          	ld	a,#13
4225  027d f7            	ld	(x),a
4226  027e 5c            	incw	x
4227  027f 1f05          	ldw	(OFST+5,sp),x
4228                     ; 475 		SetBusUart(nComChannel, PARITY_NULL);	//设置串口通道号
4230  0281 5f            	clrw	x
4231  0282 7b02          	ld	a,(OFST+2,sp)
4232  0284 95            	ld	xh,a
4233  0285 cd0000        	call	_SetBusUart
4235                     ; 476 		StartSendBusUartGroup(Size + 1);
4237  0288 7b01          	ld	a,(OFST+1,sp)
4238  028a 4c            	inc	a
4241  028b 200b          	jra	L3242
4242  028d               L1242:
4243                     ; 480 		SetBusUart(nComChannel, PARITY_EVEN);	//设置串口通道号  
4245  028d ae0003        	ldw	x,#3
4246  0290 7b02          	ld	a,(OFST+2,sp)
4247  0292 95            	ld	xh,a
4248  0293 cd0000        	call	_SetBusUart
4250                     ; 481 		StartSendBusUartGroup(Size);
4252  0296 7b01          	ld	a,(OFST+1,sp)
4254  0298               L3242:
4255  0298 cd0000        	call	_StartSendBusUartGroup
4256                     ; 483 }
4259  029b 85            	popw	x
4260  029c 81            	ret	
4314                     ; 493 void GetIsmiCcidDat(void)
4314                     ; 494 {
4315                     	switch	.text
4316  029d               _GetIsmiCcidDat:
4318  029d 5203          	subw	sp,#3
4319       00000003      OFST:	set	3
4322                     ; 495 	u8 nOptCmd = 0, nOptRlt = 0, nCnt = 0;
4324  029f 0f01          	clr	(OFST-2,sp)
4329  02a1 0f02          	clr	(OFST-1,sp)
4330                     ; 497 	if(g_nSignal <= 0)
4332  02a3 c60000        	ld	a,_g_nSignal
4333  02a6 2653          	jrne	L5442
4334                     ; 499 		TurnBusUartOn();
4336  02a8 cd0000        	call	_TurnBusUartOn
4338                     ; 500 		SetPortGsmResetDisable();
4340  02ab 4b00          	push	#0
4341  02ad 4b40          	push	#64
4342  02af ae5005        	ldw	x,#20485
4343  02b2 cd0000        	call	_GPIO_WriteBit
4345  02b5 85            	popw	x
4346                     ; 501 		SetPortGsmPowerOn();		   //供电
4348  02b6 4b01          	push	#1
4349  02b8 4b10          	push	#16
4350  02ba ae500a        	ldw	x,#20490
4351  02bd cd0000        	call	_GPIO_WriteBit
4353  02c0 85            	popw	x
4354                     ; 502 		SetPortSoftSwitchOn();
4356  02c1 ad3b          	call	LC004
4357                     ; 504 		SetPortSoftSwitchOff();
4359  02c3 4b00          	push	#0
4360  02c5 4b20          	push	#32
4361  02c7 ae5005        	ldw	x,#20485
4362  02ca cd0000        	call	_GPIO_WriteBit
4364  02cd 85            	popw	x
4365                     ; 505 		UC_SleepFunc(2500);
4367  02ce ae09c4        	ldw	x,#2500
4368  02d1 ad39          	call	LC005
4369                     ; 506 		SetPortSoftSwitchOn();
4371  02d3 ad29          	call	LC004
4372  02d5               L7442:
4373                     ; 510 			UC_SleepFunc(500); 
4375  02d5 ae01f4        	ldw	x,#500
4376  02d8 ad32          	call	LC005
4377                     ; 511 			SIMGK7M_GetCIMI(m_nImsiBuf, sizeof(m_nImsiBuf));
4379  02da 4b18          	push	#24
4380  02dc ae0085        	ldw	x,#_m_nImsiBuf
4381  02df cd0d60        	call	_SIMGK7M_GetCIMI
4383  02e2 84            	pop	a
4384                     ; 512 			nOptRlt = SIMGL868_GetCCID(m_nCcidBuf, sizeof(m_nCcidBuf));
4386  02e3 4b18          	push	#24
4387  02e5 ae006d        	ldw	x,#_m_nCcidBuf
4388  02e8 cd0db5        	call	_SIMGL868_GetCCID
4390  02eb 5b01          	addw	sp,#1
4391  02ed 6b03          	ld	(OFST+0,sp),a
4392                     ; 513 		}while((3 > nCnt++)&&(FALSE == nOptRlt));
4394  02ef 7b02          	ld	a,(OFST-1,sp)
4395  02f1 0c02          	inc	(OFST-1,sp)
4396  02f3 a103          	cp	a,#3
4397  02f5 2404          	jruge	L5442
4399  02f7 7b03          	ld	a,(OFST+0,sp)
4400  02f9 27da          	jreq	L7442
4401  02fb               L5442:
4402                     ; 516 }
4405  02fb 5b03          	addw	sp,#3
4406  02fd 81            	ret	
4408  02fe               LC004:
4409  02fe 4b01          	push	#1
4410  0300 4b20          	push	#32
4411  0302 ae5005        	ldw	x,#20485
4412  0305 cd0000        	call	_GPIO_WriteBit
4414  0308 85            	popw	x
4415                     ; 507 		UC_SleepFunc(500); 
4417  0309 ae01f4        	ldw	x,#500
4418  030c               LC005:
4419  030c 89            	pushw	x
4420  030d 5f            	clrw	x
4421  030e 89            	pushw	x
4422  030f cd075f        	call	_UC_SleepFunc
4424  0312 5b04          	addw	sp,#4
4425  0314 81            	ret	
4476                     ; 531 u8  JX_Strlen(char* pbSrc)
4476                     ; 532 {
4477                     	switch	.text
4478  0315               _JX_Strlen:
4480  0315 89            	pushw	x
4481  0316 5203          	subw	sp,#3
4482       00000003      OFST:	set	3
4485                     ; 533 	u8 nLoop = 0;
4487                     ; 534 	char* pBuf = (char*)pbSrc;
4489  0318 1e04          	ldw	x,(OFST+1,sp)
4490  031a 1f01          	ldw	(OFST-2,sp),x
4491                     ; 536 	nLoop = 0;
4493  031c 0f03          	clr	(OFST+0,sp)
4494  031e               L3052:
4495                     ; 539 		nLoop++;
4497  031e 0c03          	inc	(OFST+0,sp)
4498                     ; 540 	}while(pBuf[nLoop] != 0);
4500  0320 7b01          	ld	a,(OFST-2,sp)
4501  0322 97            	ld	xl,a
4502  0323 7b02          	ld	a,(OFST-1,sp)
4503  0325 1b03          	add	a,(OFST+0,sp)
4504  0327 2401          	jrnc	L461
4505  0329 5c            	incw	x
4506  032a               L461:
4507  032a 02            	rlwa	x,a
4508  032b f6            	ld	a,(x)
4509  032c 26f0          	jrne	L3052
4510                     ; 542 	return nLoop;
4512  032e 7b03          	ld	a,(OFST+0,sp)
4515  0330 5b05          	addw	sp,#5
4516  0332 81            	ret	
4582                     ; 554 void  JX_StringCat(char* pbSrc,char * pnStr, u8 nLen)
4582                     ; 555 {
4583                     	switch	.text
4584  0333               _JX_StringCat:
4586  0333 89            	pushw	x
4587  0334 89            	pushw	x
4588       00000002      OFST:	set	2
4591                     ; 556 	u8 nLoop = 0, i = 0;
4595                     ; 558 	nLoop = 0;
4597                     ; 559 	for(nLoop = 0; nLoop < 254; nLoop++)
4599  0335 0f02          	clr	(OFST+0,sp)
4600  0337               L1452:
4601                     ; 561 		if(pbSrc[nLoop] == 0)
4603  0337 7b03          	ld	a,(OFST+1,sp)
4604  0339 97            	ld	xl,a
4605  033a 7b04          	ld	a,(OFST+2,sp)
4606  033c 1b02          	add	a,(OFST+0,sp)
4607  033e 2401          	jrnc	L071
4608  0340 5c            	incw	x
4609  0341               L071:
4610  0341 02            	rlwa	x,a
4611  0342 f6            	ld	a,(x)
4612  0343 2708          	jreq	L5452
4613                     ; 563 			break;
4615                     ; 559 	for(nLoop = 0; nLoop < 254; nLoop++)
4617  0345 0c02          	inc	(OFST+0,sp)
4620  0347 7b02          	ld	a,(OFST+0,sp)
4621  0349 a1fe          	cp	a,#254
4622  034b 25ea          	jrult	L1452
4623  034d               L5452:
4624                     ; 566 	for(i = 0; i < nLen; i++)
4626  034d 0f01          	clr	(OFST-1,sp)
4628  034f 201a          	jra	L5552
4629  0351               L1552:
4630                     ; 568 		pbSrc[nLoop++] = pnStr[i];
4632  0351 7b02          	ld	a,(OFST+0,sp)
4633  0353 0c02          	inc	(OFST+0,sp)
4634  0355 5f            	clrw	x
4635  0356 97            	ld	xl,a
4636  0357 72fb03        	addw	x,(OFST+1,sp)
4637  035a 89            	pushw	x
4638  035b 7b09          	ld	a,(OFST+7,sp)
4639  035d 97            	ld	xl,a
4640  035e 7b0a          	ld	a,(OFST+8,sp)
4641  0360 1b03          	add	a,(OFST+1,sp)
4642  0362 2401          	jrnc	L271
4643  0364 5c            	incw	x
4644  0365               L271:
4645  0365 02            	rlwa	x,a
4646  0366 f6            	ld	a,(x)
4647  0367 85            	popw	x
4648  0368 f7            	ld	(x),a
4649                     ; 566 	for(i = 0; i < nLen; i++)
4651  0369 0c01          	inc	(OFST-1,sp)
4652  036b               L5552:
4655  036b 7b01          	ld	a,(OFST-1,sp)
4656  036d 1109          	cp	a,(OFST+7,sp)
4657  036f 25e0          	jrult	L1552
4658                     ; 571 	return ;
4661  0371 5b04          	addw	sp,#4
4662  0373 81            	ret	
4717                     ; 579 void PackAtCmd(u8 Cmd)
4717                     ; 580 {
4718                     	switch	.text
4719  0374               _PackAtCmd:
4721  0374 88            	push	a
4722  0375 5204          	subw	sp,#4
4723       00000004      OFST:	set	4
4726                     ; 583 	point = aucUartTxBuffer;
4728  0377 ae0000        	ldw	x,#_aucUartTxBuffer
4729                     ; 584 	if (Cmd > AT_CMD_S_D)		//有包头?
4731  037a a108          	cp	a,#8
4732  037c 2508          	jrult	L3062
4733                     ; 586 		*point++ = AT_HEAD_0;
4735  037e a641          	ld	a,#65
4736  0380 f7            	ld	(x),a
4737  0381 5c            	incw	x
4738                     ; 587 		*point++ = AT_HEAD_1;
4740  0382 a654          	ld	a,#84
4741  0384 f7            	ld	(x),a
4742  0385 5c            	incw	x
4743  0386               L3062:
4744  0386 1f03          	ldw	(OFST-1,sp),x
4745                     ; 589 	length = JX_Strlen((char const *)aucAtCmd[Cmd] );
4747  0388 7b05          	ld	a,(OFST+1,sp)
4748  038a 5f            	clrw	x
4749  038b 97            	ld	xl,a
4750  038c 58            	sllw	x
4751  038d de037b        	ldw	x,(_aucAtCmd,x)
4752  0390 ad83          	call	_JX_Strlen
4754  0392 5f            	clrw	x
4755  0393 97            	ld	xl,a
4756  0394 1f01          	ldw	(OFST-3,sp),x
4757                     ; 590 	MemcpyFunc( (u8 *)point, aucAtCmd[Cmd], length);		//复制字符串到缓冲中
4759  0396 7b02          	ld	a,(OFST-2,sp)
4760  0398 88            	push	a
4761  0399 7b06          	ld	a,(OFST+2,sp)
4762  039b 5f            	clrw	x
4763  039c 97            	ld	xl,a
4764  039d 58            	sllw	x
4765  039e de037b        	ldw	x,(_aucAtCmd,x)
4766  03a1 89            	pushw	x
4767  03a2 1e06          	ldw	x,(OFST+2,sp)
4768  03a4 cd0000        	call	_MemcpyFunc
4770  03a7 5b03          	addw	sp,#3
4771                     ; 591 	point += length;
4773  03a9 1e03          	ldw	x,(OFST-1,sp)
4774  03ab 72fb01        	addw	x,(OFST-3,sp)
4775                     ; 592 	*point++ = AT_TAIL_0;		//包尾
4777  03ae a60d          	ld	a,#13
4778  03b0 f7            	ld	(x),a
4779  03b1 5c            	incw	x
4780                     ; 593 	*point++ = AT_TAIL_1;
4782  03b2 a60a          	ld	a,#10
4783  03b4 f7            	ld	(x),a
4784  03b5 5c            	incw	x
4785  03b6 1f03          	ldw	(OFST-1,sp),x
4786                     ; 594 	if (Cmd > AT_CMD_S_D)		//有包头?
4788  03b8 7b05          	ld	a,(OFST+1,sp)
4789  03ba a108          	cp	a,#8
4790  03bc 1e01          	ldw	x,(OFST-3,sp)
4791  03be 2505          	jrult	L5062
4792                     ; 596 		length += 4;
4794  03c0 1c0004        	addw	x,#4
4796  03c3 2003          	jra	L7062
4797  03c5               L5062:
4798                     ; 600 		length += 2;
4800  03c5 1c0002        	addw	x,#2
4801  03c8               L7062:
4802  03c8 1f01          	ldw	(OFST-3,sp),x
4803                     ; 602 	SetBusUart(COM_1, PARITY_NULL);		//设置串口通道号
4805  03ca 5f            	clrw	x
4806  03cb a601          	ld	a,#1
4807  03cd 95            	ld	xh,a
4808  03ce cd0000        	call	_SetBusUart
4810                     ; 604 	StartSendBusUartGroup(length);
4812  03d1 7b02          	ld	a,(OFST-2,sp)
4813  03d3 cd0000        	call	_StartSendBusUartGroup
4815                     ; 605 }
4818  03d6 5b05          	addw	sp,#5
4819  03d8 81            	ret	
4891                     ; 612 void PackAtCmdParameter(u8 Cmd, u8 *Parameter)
4891                     ; 613 {
4892                     	switch	.text
4893  03d9               _PackAtCmdParameter:
4895  03d9 88            	push	a
4896  03da 5206          	subw	sp,#6
4897       00000006      OFST:	set	6
4900                     ; 616 	point = aucUartTxBuffer; 
4902  03dc ae0000        	ldw	x,#_aucUartTxBuffer
4903                     ; 617 	if (Cmd > AT_CMD_S_A)		//有包头? AT_CMD_S_D
4905  03df 4d            	tnz	a
4906  03e0 2708          	jreq	L1462
4907                     ; 619 		*point++ = AT_HEAD_0;
4909  03e2 a641          	ld	a,#65
4910  03e4 f7            	ld	(x),a
4911  03e5 5c            	incw	x
4912                     ; 620 		*point++ = AT_HEAD_1;
4914  03e6 a654          	ld	a,#84
4915  03e8 f7            	ld	(x),a
4916  03e9 5c            	incw	x
4917  03ea               L1462:
4918  03ea 1f05          	ldw	(OFST-1,sp),x
4919                     ; 622 	length1 = JX_Strlen( (char const *)aucAtCmd[Cmd] );
4921  03ec 7b07          	ld	a,(OFST+1,sp)
4922  03ee 5f            	clrw	x
4923  03ef 97            	ld	xl,a
4924  03f0 58            	sllw	x
4925  03f1 de037b        	ldw	x,(_aucAtCmd,x)
4926  03f4 cd0315        	call	_JX_Strlen
4928  03f7 5f            	clrw	x
4929  03f8 97            	ld	xl,a
4930  03f9 1f03          	ldw	(OFST-3,sp),x
4931                     ; 623 	MemcpyFunc( (u8 *)point, aucAtCmd[Cmd], length1);		//复制字符串到缓冲中
4933  03fb 7b04          	ld	a,(OFST-2,sp)
4934  03fd 88            	push	a
4935  03fe 7b08          	ld	a,(OFST+2,sp)
4936  0400 5f            	clrw	x
4937  0401 97            	ld	xl,a
4938  0402 58            	sllw	x
4939  0403 de037b        	ldw	x,(_aucAtCmd,x)
4940  0406 89            	pushw	x
4941  0407 1e08          	ldw	x,(OFST+2,sp)
4942  0409 cd0000        	call	_MemcpyFunc
4944  040c 5b03          	addw	sp,#3
4945                     ; 624 	point += length1;
4947  040e 1e05          	ldw	x,(OFST-1,sp)
4948  0410 72fb03        	addw	x,(OFST-3,sp)
4949  0413 1f05          	ldw	(OFST-1,sp),x
4950                     ; 625 	length2 = JX_Strlen( (char const *)Parameter);
4952  0415 1e0a          	ldw	x,(OFST+4,sp)
4953  0417 cd0315        	call	_JX_Strlen
4955  041a 5f            	clrw	x
4956  041b 97            	ld	xl,a
4957  041c 1f01          	ldw	(OFST-5,sp),x
4958                     ; 626 	MemcpyFunc( (u8 *)point, Parameter, length2);		//复制字符串到缓冲中
4960  041e 7b02          	ld	a,(OFST-4,sp)
4961  0420 88            	push	a
4962  0421 1e0b          	ldw	x,(OFST+5,sp)
4963  0423 89            	pushw	x
4964  0424 1e08          	ldw	x,(OFST+2,sp)
4965  0426 cd0000        	call	_MemcpyFunc
4967  0429 5b03          	addw	sp,#3
4968                     ; 627 	point += length2;
4970  042b 1e05          	ldw	x,(OFST-1,sp)
4971  042d 72fb01        	addw	x,(OFST-5,sp)
4972                     ; 628 	*point++ = AT_TAIL_0;		//包尾
4974  0430 a60d          	ld	a,#13
4975  0432 f7            	ld	(x),a
4976  0433 5c            	incw	x
4977                     ; 629 	*point++ = AT_TAIL_1;
4979  0434 a60a          	ld	a,#10
4980  0436 f7            	ld	(x),a
4981  0437 5c            	incw	x
4982  0438 1f05          	ldw	(OFST-1,sp),x
4983                     ; 630 	length1 += length2;
4985  043a 1e03          	ldw	x,(OFST-3,sp)
4986  043c 72fb01        	addw	x,(OFST-5,sp)
4987  043f 1f03          	ldw	(OFST-3,sp),x
4988                     ; 631 	if (Cmd > AT_CMD_S_A)		//有包头? AT_CMD_S_D
4990  0441 7b07          	ld	a,(OFST+1,sp)
4991  0443 2705          	jreq	L3462
4992                     ; 633 		length1 += 4;
4994  0445 1c0004        	addw	x,#4
4996  0448 2003          	jra	L5462
4997  044a               L3462:
4998                     ; 637 		length1 += 2;
5000  044a 1c0002        	addw	x,#2
5001  044d               L5462:
5002  044d 1f03          	ldw	(OFST-3,sp),x
5003                     ; 639 	SetBusUart(COM_1, PARITY_NULL);		//设置串口通道号
5005  044f 5f            	clrw	x
5006  0450 a601          	ld	a,#1
5007  0452 95            	ld	xh,a
5008  0453 cd0000        	call	_SetBusUart
5010                     ; 641 	StartSendBusUartGroup(length1);
5012  0456 7b04          	ld	a,(OFST-2,sp)
5013  0458 cd0000        	call	_StartSendBusUartGroup
5015                     ; 642 }
5018  045b 5b07          	addw	sp,#7
5019  045d 81            	ret	
5102                     ; 650 void PackAtCmdParameter2(u8 Cmd, u8 *Parameter1, u8 *Parameter2)
5102                     ; 651 {
5103                     	switch	.text
5104  045e               _PackAtCmdParameter2:
5106  045e 88            	push	a
5107  045f 5206          	subw	sp,#6
5108       00000006      OFST:	set	6
5111                     ; 654 	point = aucUartTxBuffer;
5113  0461 ae0000        	ldw	x,#_aucUartTxBuffer
5114                     ; 655 	if (Cmd > AT_CMD_S_D)		//有包头?
5116  0464 a108          	cp	a,#8
5117  0466 2508          	jrult	L3072
5118                     ; 657 		*point++ = AT_HEAD_0;
5120  0468 a641          	ld	a,#65
5121  046a f7            	ld	(x),a
5122  046b 5c            	incw	x
5123                     ; 658 		*point++ = AT_HEAD_1;
5125  046c a654          	ld	a,#84
5126  046e f7            	ld	(x),a
5127  046f 5c            	incw	x
5128  0470               L3072:
5129  0470 1f05          	ldw	(OFST-1,sp),x
5130                     ; 661 	length1 = JX_Strlen( (char const *)aucAtCmd[Cmd] );
5132  0472 7b07          	ld	a,(OFST+1,sp)
5133  0474 5f            	clrw	x
5134  0475 97            	ld	xl,a
5135  0476 58            	sllw	x
5136  0477 de037b        	ldw	x,(_aucAtCmd,x)
5137  047a cd0508        	call	LC006
5138  047d 1f01          	ldw	(OFST-5,sp),x
5139                     ; 662 	MemcpyFunc( (u8 *)point, aucAtCmd[Cmd], length1);		//复制字符串到缓冲中
5141  047f 7b02          	ld	a,(OFST-4,sp)
5142  0481 88            	push	a
5143  0482 7b08          	ld	a,(OFST+2,sp)
5144  0484 5f            	clrw	x
5145  0485 97            	ld	xl,a
5146  0486 58            	sllw	x
5147  0487 de037b        	ldw	x,(_aucAtCmd,x)
5148  048a 89            	pushw	x
5149  048b 1e08          	ldw	x,(OFST+2,sp)
5150  048d cd0000        	call	_MemcpyFunc
5152  0490 5b03          	addw	sp,#3
5153                     ; 663 	point += length1;
5155  0492 1e05          	ldw	x,(OFST-1,sp)
5156  0494 72fb01        	addw	x,(OFST-5,sp)
5157  0497 1f05          	ldw	(OFST-1,sp),x
5158                     ; 668 	length2 = JX_Strlen( (char const *)Parameter1);
5160  0499 1e0a          	ldw	x,(OFST+4,sp)
5161  049b ad6b          	call	LC006
5162  049d 1f03          	ldw	(OFST-3,sp),x
5163                     ; 669 	MemcpyFunc( (u8 *)point, Parameter1, length2);		//复制字符串到缓冲中
5165  049f 7b04          	ld	a,(OFST-2,sp)
5166  04a1 88            	push	a
5167  04a2 1e0b          	ldw	x,(OFST+5,sp)
5168  04a4 89            	pushw	x
5169  04a5 1e08          	ldw	x,(OFST+2,sp)
5170  04a7 cd0000        	call	_MemcpyFunc
5172  04aa 5b03          	addw	sp,#3
5173                     ; 670 	length1 += length2;
5175  04ac 1e01          	ldw	x,(OFST-5,sp)
5176  04ae 72fb03        	addw	x,(OFST-3,sp)
5177  04b1 1f01          	ldw	(OFST-5,sp),x
5178                     ; 671 	point += length2;
5180  04b3 1e05          	ldw	x,(OFST-1,sp)
5181  04b5 72fb03        	addw	x,(OFST-3,sp)
5182                     ; 672 	*point++ = ',';			//2个参数之间只能用逗号连接
5184  04b8 a62c          	ld	a,#44
5185  04ba f7            	ld	(x),a
5186  04bb 5c            	incw	x
5187  04bc 1f05          	ldw	(OFST-1,sp),x
5188                     ; 673 	length2 = JX_Strlen( (char const *)Parameter2);
5190  04be 1e0c          	ldw	x,(OFST+6,sp)
5191  04c0 ad46          	call	LC006
5192  04c2 1f03          	ldw	(OFST-3,sp),x
5193                     ; 674 	MemcpyFunc( (u8 *)point, Parameter2, length2);		//复制字符串到缓冲中
5195  04c4 7b04          	ld	a,(OFST-2,sp)
5196  04c6 88            	push	a
5197  04c7 1e0d          	ldw	x,(OFST+7,sp)
5198  04c9 89            	pushw	x
5199  04ca 1e08          	ldw	x,(OFST+2,sp)
5200  04cc cd0000        	call	_MemcpyFunc
5202  04cf 5b03          	addw	sp,#3
5203                     ; 675 	length1 += length2;
5205  04d1 1e01          	ldw	x,(OFST-5,sp)
5206  04d3 72fb03        	addw	x,(OFST-3,sp)
5207  04d6 1f01          	ldw	(OFST-5,sp),x
5208                     ; 676 	point += length2;
5210  04d8 1e05          	ldw	x,(OFST-1,sp)
5211  04da 72fb03        	addw	x,(OFST-3,sp)
5212                     ; 677 	*point++ = AT_TAIL_0;		//包尾
5214  04dd a60d          	ld	a,#13
5215  04df f7            	ld	(x),a
5216  04e0 5c            	incw	x
5217                     ; 678 	*point++ = AT_TAIL_1;
5219  04e1 a60a          	ld	a,#10
5220  04e3 f7            	ld	(x),a
5221  04e4 5c            	incw	x
5222  04e5 1f05          	ldw	(OFST-1,sp),x
5223                     ; 680 	if (Cmd > AT_CMD_S_D)		//有包头?
5225  04e7 7b07          	ld	a,(OFST+1,sp)
5226  04e9 a108          	cp	a,#8
5227  04eb 1e01          	ldw	x,(OFST-5,sp)
5228  04ed 2505          	jrult	L5072
5229                     ; 685 		length1 += 5;
5231  04ef 1c0005        	addw	x,#5
5233  04f2 2003          	jra	L7072
5234  04f4               L5072:
5235                     ; 693 		length1 += 3;
5237  04f4 1c0003        	addw	x,#3
5238  04f7               L7072:
5239  04f7 1f01          	ldw	(OFST-5,sp),x
5240                     ; 696 	SetBusUart(COM_1, PARITY_NULL);		//设置串口通道号
5242  04f9 5f            	clrw	x
5243  04fa a601          	ld	a,#1
5244  04fc 95            	ld	xh,a
5245  04fd cd0000        	call	_SetBusUart
5247                     ; 697 	StartSendBusUartGroup(length1);
5249  0500 7b02          	ld	a,(OFST-4,sp)
5250  0502 cd0000        	call	_StartSendBusUartGroup
5252                     ; 698 }
5255  0505 5b07          	addw	sp,#7
5256  0507 81            	ret	
5258  0508               LC006:
5259  0508 cd0315        	call	_JX_Strlen
5261  050b 5f            	clrw	x
5262  050c 97            	ld	xl,a
5263  050d 81            	ret	
5369                     ; 706 void PackAtCmdParameter3(u8 Cmd, u8 *Parameter1, u8 *Parameter2, u8 *Parameter3)
5369                     ; 707 {
5370                     	switch	.text
5371  050e               _PackAtCmdParameter3:
5373  050e 88            	push	a
5374  050f 5206          	subw	sp,#6
5375       00000006      OFST:	set	6
5378                     ; 708 	u16 length0 = 0, length1 = 0, length2 = 0, length3 = 0;
5386                     ; 711 	if((NULL == Parameter1)||(NULL == Parameter2)||(NULL == Parameter3))
5388  0511 1e0a          	ldw	x,(OFST+4,sp)
5389  0513 2603cc05ee    	jreq	L472
5391  0518 1e0c          	ldw	x,(OFST+6,sp)
5392  051a 27f9          	jreq	L472
5394  051c 1e0e          	ldw	x,(OFST+8,sp)
5395                     ; 713 		return;
5397  051e 27f5          	jreq	L472
5398                     ; 716 	point = aucUartTxBuffer;
5400  0520 ae0000        	ldw	x,#_aucUartTxBuffer
5401                     ; 717 	if (Cmd > AT_CMD_S_D)		//有包头?
5403  0523 7b07          	ld	a,(OFST+1,sp)
5404  0525 a108          	cp	a,#8
5405  0527 2508          	jrult	L3672
5406                     ; 719 		*point++ = AT_HEAD_0;
5408  0529 a641          	ld	a,#65
5409  052b f7            	ld	(x),a
5410  052c 5c            	incw	x
5411                     ; 720 		*point++ = AT_HEAD_1;
5413  052d a654          	ld	a,#84
5414  052f f7            	ld	(x),a
5415  0530 5c            	incw	x
5416  0531               L3672:
5417  0531 1f05          	ldw	(OFST-1,sp),x
5418                     ; 722 	length0 = JX_Strlen( (char const *)aucAtCmd[Cmd] );
5420  0533 7b07          	ld	a,(OFST+1,sp)
5421  0535 5f            	clrw	x
5422  0536 97            	ld	xl,a
5423  0537 58            	sllw	x
5424  0538 de037b        	ldw	x,(_aucAtCmd,x)
5425  053b cd05f1        	call	LC007
5426  053e 1f01          	ldw	(OFST-5,sp),x
5427                     ; 723 	MemcpyFunc( (u8 *)point, aucAtCmd[Cmd], length0);		//复制字符串到缓冲中
5429  0540 7b02          	ld	a,(OFST-4,sp)
5430  0542 88            	push	a
5431  0543 7b08          	ld	a,(OFST+2,sp)
5432  0545 5f            	clrw	x
5433  0546 97            	ld	xl,a
5434  0547 58            	sllw	x
5435  0548 de037b        	ldw	x,(_aucAtCmd,x)
5436  054b 89            	pushw	x
5437  054c 1e08          	ldw	x,(OFST+2,sp)
5438  054e cd0000        	call	_MemcpyFunc
5440  0551 5b03          	addw	sp,#3
5441                     ; 724 	point += length0;
5443  0553 1e05          	ldw	x,(OFST-1,sp)
5444  0555 72fb01        	addw	x,(OFST-5,sp)
5445  0558 1f05          	ldw	(OFST-1,sp),x
5446                     ; 729 	length1 = JX_Strlen( (char *)Parameter1);//(char const *)
5448  055a 1e0a          	ldw	x,(OFST+4,sp)
5449  055c cd05f1        	call	LC007
5450  055f 1f03          	ldw	(OFST-3,sp),x
5451                     ; 730 	MemcpyFunc( (u8 *)point, Parameter1, length1);		//复制字符串到缓冲中
5453  0561 7b04          	ld	a,(OFST-2,sp)
5454  0563 88            	push	a
5455  0564 1e0b          	ldw	x,(OFST+5,sp)
5456  0566 89            	pushw	x
5457  0567 1e08          	ldw	x,(OFST+2,sp)
5458  0569 cd0000        	call	_MemcpyFunc
5460  056c 5b03          	addw	sp,#3
5461                     ; 731 	length0 += length1;
5463  056e 1e01          	ldw	x,(OFST-5,sp)
5464  0570 72fb03        	addw	x,(OFST-3,sp)
5465  0573 1f01          	ldw	(OFST-5,sp),x
5466                     ; 732 	point += length1;
5468  0575 1e05          	ldw	x,(OFST-1,sp)
5469  0577 72fb03        	addw	x,(OFST-3,sp)
5470                     ; 733 	*point++ = ',';			//2个参数之间只能用逗号连接
5472  057a a62c          	ld	a,#44
5473  057c f7            	ld	(x),a
5474  057d 5c            	incw	x
5475  057e 1f05          	ldw	(OFST-1,sp),x
5476                     ; 735 	length2 = JX_Strlen( (char const *)Parameter2);
5478  0580 1e0c          	ldw	x,(OFST+6,sp)
5479  0582 ad6d          	call	LC007
5480  0584 1f03          	ldw	(OFST-3,sp),x
5481                     ; 736 	MemcpyFunc( (u8 *)point, Parameter2, length2);		//复制字符串到缓冲中
5483  0586 7b04          	ld	a,(OFST-2,sp)
5484  0588 88            	push	a
5485  0589 1e0d          	ldw	x,(OFST+7,sp)
5486  058b 89            	pushw	x
5487  058c 1e08          	ldw	x,(OFST+2,sp)
5488  058e cd0000        	call	_MemcpyFunc
5490  0591 5b03          	addw	sp,#3
5491                     ; 737 	length0 += length2+1;
5493  0593 1e03          	ldw	x,(OFST-3,sp)
5494  0595 5c            	incw	x
5495  0596 72fb01        	addw	x,(OFST-5,sp)
5496  0599 1f01          	ldw	(OFST-5,sp),x
5497                     ; 738 	point += length2;
5499  059b 1e05          	ldw	x,(OFST-1,sp)
5500  059d 72fb03        	addw	x,(OFST-3,sp)
5501                     ; 739 	*point++ = ',';			//2个参数之间只能用逗号连接
5503  05a0 a62c          	ld	a,#44
5504  05a2 f7            	ld	(x),a
5505  05a3 5c            	incw	x
5506  05a4 1f05          	ldw	(OFST-1,sp),x
5507                     ; 741 	length3 = JX_Strlen( (char const *)Parameter3);
5509  05a6 1e0e          	ldw	x,(OFST+8,sp)
5510  05a8 ad47          	call	LC007
5511  05aa 1f03          	ldw	(OFST-3,sp),x
5512                     ; 742 	MemcpyFunc( (u8 *)point, Parameter3, length3);		//复制字符串到缓冲中
5514  05ac 7b04          	ld	a,(OFST-2,sp)
5515  05ae 88            	push	a
5516  05af 1e0f          	ldw	x,(OFST+9,sp)
5517  05b1 89            	pushw	x
5518  05b2 1e08          	ldw	x,(OFST+2,sp)
5519  05b4 cd0000        	call	_MemcpyFunc
5521  05b7 5b03          	addw	sp,#3
5522                     ; 743 	length0 += length3+1;
5524  05b9 1e03          	ldw	x,(OFST-3,sp)
5525  05bb 5c            	incw	x
5526  05bc 72fb01        	addw	x,(OFST-5,sp)
5527  05bf 1f01          	ldw	(OFST-5,sp),x
5528                     ; 744 	point += length3;
5530  05c1 1e05          	ldw	x,(OFST-1,sp)
5531  05c3 72fb03        	addw	x,(OFST-3,sp)
5532                     ; 746 	*point++ = AT_TAIL_0;		//包尾
5534  05c6 a60d          	ld	a,#13
5535  05c8 f7            	ld	(x),a
5536  05c9 5c            	incw	x
5537                     ; 747 	*point++ = AT_TAIL_1;
5539  05ca a60a          	ld	a,#10
5540  05cc f7            	ld	(x),a
5541  05cd 5c            	incw	x
5542  05ce 1f05          	ldw	(OFST-1,sp),x
5543                     ; 749 	if (Cmd > AT_CMD_S_D)		//有包头?
5545  05d0 7b07          	ld	a,(OFST+1,sp)
5546  05d2 a108          	cp	a,#8
5547  05d4 1e01          	ldw	x,(OFST-5,sp)
5548  05d6 2505          	jrult	L5672
5549                     ; 754 		length0 += 5;
5551  05d8 1c0005        	addw	x,#5
5553  05db 2003          	jra	L7672
5554  05dd               L5672:
5555                     ; 762 		length0 += 3;
5557  05dd 1c0003        	addw	x,#3
5558  05e0               L7672:
5559  05e0 1f01          	ldw	(OFST-5,sp),x
5560                     ; 765 	SetBusUart(COM_1, PARITY_NULL);		//设置串口通道号
5562  05e2 5f            	clrw	x
5563  05e3 a601          	ld	a,#1
5564  05e5 95            	ld	xh,a
5565  05e6 cd0000        	call	_SetBusUart
5567                     ; 766 	StartSendBusUartGroup(length0);
5569  05e9 7b02          	ld	a,(OFST-4,sp)
5570  05eb cd0000        	call	_StartSendBusUartGroup
5572                     ; 767 }
5573  05ee               L472:
5576  05ee 5b07          	addw	sp,#7
5577  05f0 81            	ret	
5579  05f1               LC007:
5580  05f1 cd0315        	call	_JX_Strlen
5582  05f4 5f            	clrw	x
5583  05f5 97            	ld	xl,a
5584  05f6 81            	ret	
5655                     ; 774 void PackAtCmdTcpsend(u8 Length)
5655                     ; 775 {
5656                     	switch	.text
5657  05f7               _PackAtCmdTcpsend:
5659  05f7 88            	push	a
5660  05f8 520b          	subw	sp,#11
5661       0000000b      OFST:	set	11
5664                     ; 778 	point = aucUartTxBuffer;
5666  05fa ae0000        	ldw	x,#_aucUartTxBuffer
5667                     ; 779 	*point++ = AT_HEAD_0;
5669  05fd a641          	ld	a,#65
5670  05ff f7            	ld	(x),a
5671  0600 5c            	incw	x
5672                     ; 780 	*point++ = AT_HEAD_1;
5674  0601 a654          	ld	a,#84
5675  0603 f7            	ld	(x),a
5676  0604 5c            	incw	x
5677  0605 1f0a          	ldw	(OFST-1,sp),x
5678                     ; 781 	length1 = JX_Strlen( (char const *)aucAtCmd[AT_CMD_TCPSEND] );
5680  0607 ae0257        	ldw	x,#_aucAtTcpsend
5681  060a cd0315        	call	_JX_Strlen
5683  060d 5f            	clrw	x
5684  060e 97            	ld	xl,a
5685  060f 1f01          	ldw	(OFST-10,sp),x
5686                     ; 782 	MemcpyFunc( (u8 *)point, aucAtCmd[AT_CMD_TCPSEND], length1);		//复制字符串到缓冲中
5688  0611 7b02          	ld	a,(OFST-9,sp)
5689  0613 88            	push	a
5690  0614 ae0257        	ldw	x,#_aucAtTcpsend
5691  0617 89            	pushw	x
5692  0618 1e0d          	ldw	x,(OFST+2,sp)
5693  061a cd0000        	call	_MemcpyFunc
5695  061d 5b03          	addw	sp,#3
5696                     ; 783 	point += length1;
5698  061f 1e0a          	ldw	x,(OFST-1,sp)
5699  0621 72fb01        	addw	x,(OFST-10,sp)
5700  0624 1f0a          	ldw	(OFST-1,sp),x
5701                     ; 799 	if (Length > 99)
5703  0626 7b0c          	ld	a,(OFST+1,sp)
5704  0628 a164          	cp	a,#100
5705  062a 2532          	jrult	L1203
5706                     ; 801 		length2 = 3;		
5708  062c ae0003        	ldw	x,#3
5709  062f 1f03          	ldw	(OFST-8,sp),x
5710                     ; 802 		buffer[0] = '0' + Length / 100;
5712  0631 ae0064        	ldw	x,#100
5713  0634 9093          	ldw	y,x
5714  0636 5f            	clrw	x
5715  0637 97            	ld	xl,a
5716  0638 65            	divw	x,y
5717  0639 9f            	ld	a,xl
5718  063a ab30          	add	a,#48
5719  063c 6b05          	ld	(OFST-6,sp),a
5720                     ; 803 		buffer[1] = '0' + (Length%100) / 10;
5722  063e 7b0c          	ld	a,(OFST+1,sp)
5723  0640 5f            	clrw	x
5724  0641 97            	ld	xl,a
5725  0642 a664          	ld	a,#100
5726  0644 cd0000        	call	c_smodx
5728  0647 a60a          	ld	a,#10
5729  0649 cd0000        	call	c_sdivx
5731  064c 1c0030        	addw	x,#48
5732  064f 01            	rrwa	x,a
5733  0650 6b06          	ld	(OFST-5,sp),a
5734                     ; 804 		buffer[2] = '0' + Length % 10;
5736  0652 7b0c          	ld	a,(OFST+1,sp)
5737  0654 ad64          	call	LC008
5738  0656 909f          	ld	a,yl
5739  0658 ab30          	add	a,#48
5740  065a 6b07          	ld	(OFST-4,sp),a
5742  065c 2025          	jra	L3203
5743  065e               L1203:
5744                     ; 806 	else if (Length > 9) 	//10~39?
5746  065e a10a          	cp	a,#10
5747  0660 2518          	jrult	L5203
5748                     ; 808 		length2 = 2;
5750  0662 ae0002        	ldw	x,#2
5751  0665 1f03          	ldw	(OFST-8,sp),x
5752                     ; 809 		buffer[0] = '0' + Length / 10;
5754  0667 ad51          	call	LC008
5755  0669 9f            	ld	a,xl
5756  066a ab30          	add	a,#48
5757  066c 6b05          	ld	(OFST-6,sp),a
5758                     ; 810 		buffer[1] = '0' + Length % 10;
5760  066e 7b0c          	ld	a,(OFST+1,sp)
5761  0670 ad48          	call	LC008
5762  0672 909f          	ld	a,yl
5763  0674 ab30          	add	a,#48
5764  0676 6b06          	ld	(OFST-5,sp),a
5766  0678 2009          	jra	L3203
5767  067a               L5203:
5768                     ; 814 		length2 = 1;
5770  067a ae0001        	ldw	x,#1
5771  067d 1f03          	ldw	(OFST-8,sp),x
5772                     ; 815 		buffer[0] = '0' + Length;
5774  067f ab30          	add	a,#48
5775  0681 6b05          	ld	(OFST-6,sp),a
5776  0683               L3203:
5777                     ; 819 	MemcpyFunc( (u8 *)point, buffer, length2);		//复制字符串到缓冲中
5779  0683 7b04          	ld	a,(OFST-7,sp)
5780  0685 88            	push	a
5781  0686 96            	ldw	x,sp
5782  0687 1c0006        	addw	x,#OFST-5
5783  068a 89            	pushw	x
5784  068b 1e0d          	ldw	x,(OFST+2,sp)
5785  068d cd0000        	call	_MemcpyFunc
5787  0690 5b03          	addw	sp,#3
5788                     ; 820 	point += length2;
5790  0692 1e0a          	ldw	x,(OFST-1,sp)
5791  0694 72fb03        	addw	x,(OFST-8,sp)
5792                     ; 821 	*point++ = AT_TAIL_0;		//包尾
5794  0697 a60d          	ld	a,#13
5795  0699 f7            	ld	(x),a
5796  069a 5c            	incw	x
5797                     ; 822 	*point++ = AT_TAIL_1;
5799  069b a60a          	ld	a,#10
5800  069d f7            	ld	(x),a
5801  069e 5c            	incw	x
5802  069f 1f0a          	ldw	(OFST-1,sp),x
5803                     ; 823 	length1 += length2;
5805  06a1 1e01          	ldw	x,(OFST-10,sp)
5806  06a3 72fb03        	addw	x,(OFST-8,sp)
5807                     ; 824 	length1 += 2+2;            //头和尾 长度
5809  06a6 1c0004        	addw	x,#4
5810  06a9 1f01          	ldw	(OFST-10,sp),x
5811                     ; 825 	SetBusUart(COM_1, PARITY_NULL);		//设置串口通道号
5813  06ab 5f            	clrw	x
5814  06ac a601          	ld	a,#1
5815  06ae 95            	ld	xh,a
5816  06af cd0000        	call	_SetBusUart
5818                     ; 827 	StartSendBusUartGroup(length1);
5820  06b2 7b02          	ld	a,(OFST-9,sp)
5821  06b4 cd0000        	call	_StartSendBusUartGroup
5823                     ; 828 }
5826  06b7 5b0c          	addw	sp,#12
5827  06b9 81            	ret	
5829  06ba               LC008:
5830  06ba ae000a        	ldw	x,#10
5831  06bd 9093          	ldw	y,x
5832  06bf 5f            	clrw	x
5833  06c0 97            	ld	xl,a
5834  06c1 65            	divw	x,y
5835  06c2 81            	ret	
5869                     ; 835 void PackTcpSendData(u8 nLen)
5869                     ; 836 {	
5870                     	switch	.text
5871  06c3               _PackTcpSendData:
5873  06c3 88            	push	a
5874       00000000      OFST:	set	0
5877                     ; 837 	aucUartTxBuffer[nLen] = AT_TAIL_0; //包尾
5879  06c4 5f            	clrw	x
5880  06c5 97            	ld	xl,a
5881  06c6 a60d          	ld	a,#13
5882  06c8 d70000        	ld	(_aucUartTxBuffer,x),a
5883                     ; 838 	SetBusUart(COM_1, PARITY_NULL);		//设置串口通道号
5885  06cb 5f            	clrw	x
5886  06cc a601          	ld	a,#1
5887  06ce 95            	ld	xh,a
5888  06cf cd0000        	call	_SetBusUart
5890                     ; 839 	StartSendBusUartGroup(nLen+1);
5892  06d2 7b01          	ld	a,(OFST+1,sp)
5893  06d4 4c            	inc	a
5894  06d5 cd0000        	call	_StartSendBusUartGroup
5896                     ; 840 }
5899  06d8 84            	pop	a
5900  06d9 81            	ret	
5945                     ; 852 void PackAtCmdExt(void)
5945                     ; 853 {
5946                     	switch	.text
5947  06da               _PackAtCmdExt:
5949  06da 5204          	subw	sp,#4
5950       00000004      OFST:	set	4
5953                     ; 854 	u16 length = 0;
5955  06dc 5f            	clrw	x
5956  06dd 1f01          	ldw	(OFST-3,sp),x
5957                     ; 855 	u8 *point  = NULL;
5959                     ; 856 	point = aucUartTxBuffer;
5961  06df ae0000        	ldw	x,#_aucUartTxBuffer
5962                     ; 858 		*point++ = AT_HEAD_0;
5964  06e2 a641          	ld	a,#65
5965  06e4 f7            	ld	(x),a
5966  06e5 5c            	incw	x
5967                     ; 859 		*point++ = AT_HEAD_1;
5969  06e6 a654          	ld	a,#84
5970  06e8 f7            	ld	(x),a
5971  06e9 5c            	incw	x
5972                     ; 861 	*point++ = AT_TAIL_0;		//包尾
5974  06ea a60d          	ld	a,#13
5975  06ec f7            	ld	(x),a
5976  06ed 5c            	incw	x
5977                     ; 862 	*point++ = AT_TAIL_1;
5979  06ee a60a          	ld	a,#10
5980  06f0 f7            	ld	(x),a
5981  06f1 5c            	incw	x
5982  06f2 1f03          	ldw	(OFST-1,sp),x
5983                     ; 864 		length += 2;
5985  06f4 1e01          	ldw	x,(OFST-3,sp)
5986  06f6 1c0002        	addw	x,#2
5987  06f9 1f01          	ldw	(OFST-3,sp),x
5988                     ; 866 	SetBusUart(COM_1, PARITY_NULL);		//设置串口通道号
5990  06fb 5f            	clrw	x
5991  06fc a601          	ld	a,#1
5992  06fe 95            	ld	xh,a
5993  06ff cd0000        	call	_SetBusUart
5995                     ; 867 	StartSendBusUartGroup(length);
5997  0702 7b02          	ld	a,(OFST-2,sp)
5998  0704 cd0000        	call	_StartSendBusUartGroup
6000                     ; 868 }
6003  0707 5b04          	addw	sp,#4
6004  0709 81            	ret	
6037                     ; 879 void  UC_SetSleepCnt(uint32_t dwWaitmS)
6037                     ; 880 {
6038                     	switch	.text
6039  070a               _UC_SetSleepCnt:
6041       00000000      OFST:	set	0
6044                     ; 881 	m_dwTimeCnt = (dwWaitmS);
6046  070a 1e05          	ldw	x,(OFST+5,sp)
6047  070c cf00a9        	ldw	_m_dwTimeCnt+2,x
6048  070f 1e03          	ldw	x,(OFST+3,sp)
6049  0711 cf00a7        	ldw	_m_dwTimeCnt,x
6050                     ; 882 }
6053  0714 81            	ret	
6056                     	switch	.data
6057  00cb               L1013_dwTime:
6058  00cb 00000000      	dc.l	0
6097                     ; 893 uint8_t  UC_SleepProc(void)
6097                     ; 894 {
6098                     	switch	.text
6099  0715               _UC_SleepProc:
6101  0715 5204          	subw	sp,#4
6102       00000004      OFST:	set	4
6105                     ; 896 	uint32_t  dwTimeNow = 0;
6107  0717 5f            	clrw	x
6108  0718 1f03          	ldw	(OFST-1,sp),x
6109  071a 1f01          	ldw	(OFST-3,sp),x
6110                     ; 899 	dwTimeNow = GetSysTemTick();
6112  071c cd0000        	call	_GetSysTemTick
6114  071f 96            	ldw	x,sp
6115  0720 5c            	incw	x
6116  0721 cd0000        	call	c_rtol
6118                     ; 901 	if (dwTime < dwTimeNow)
6120  0724 ae00cb        	ldw	x,#L1013_dwTime
6121  0727 cd0000        	call	c_ltor
6123  072a 96            	ldw	x,sp
6124  072b 5c            	incw	x
6125  072c cd0000        	call	c_lcmp
6127  072f 240a          	jruge	L1213
6128                     ; 903 		 if(dwTimeNow - dwTime > m_dwTimeCnt)
6130  0731 96            	ldw	x,sp
6131  0732 5c            	incw	x
6132  0733 cd0000        	call	c_ltor
6134  0736 ae00cb        	ldw	x,#L1013_dwTime
6137                     ; 905 			dwTime = GetSysTemTick();
6140                     ; 906 			return TRUE;
6142  0739 2008          	jp	LC009
6143  073b               L1213:
6144                     ; 909 	else if ((dwTime - dwTimeNow) > m_dwTimeCnt)
6146  073b ae00cb        	ldw	x,#L1013_dwTime
6147  073e cd0000        	call	c_ltor
6149  0741 96            	ldw	x,sp
6150  0742 5c            	incw	x
6153                     ; 911 		dwTime = GetSysTemTick();
6157                     ; 912 		return TRUE;
6159  0743               LC009:
6160  0743 cd0000        	call	c_lsub
6161  0746 ae00a7        	ldw	x,#_m_dwTimeCnt
6162  0749 cd0000        	call	c_lcmp
6163  074c 230e          	jrule	L5213
6165  074e cd0000        	call	_GetSysTemTick
6166  0751 ae00cb        	ldw	x,#L1013_dwTime
6167  0754 cd0000        	call	c_rtol
6169  0757 a601          	ld	a,#1
6171  0759               L043:
6173  0759 5b04          	addw	sp,#4
6174  075b 81            	ret	
6175  075c               L5213:
6176                     ; 915 	return FALSE;
6178  075c 4f            	clr	a
6180  075d 20fa          	jra	L043
6228                     ; 927 uint8_t  UC_SleepFunc(uint32_t dwWaitmS)
6228                     ; 928 {
6229                     	switch	.text
6230  075f               _UC_SleepFunc:
6232  075f 5208          	subw	sp,#8
6233       00000008      OFST:	set	8
6236                     ; 929 	uint32_t dwTime = 0, dwNowTime = 0;
6238  0761 96            	ldw	x,sp
6239  0762 5c            	incw	x
6240  0763 cd0000        	call	c_ltor
6244  0766 96            	ldw	x,sp
6245  0767 1c0005        	addw	x,#OFST-3
6246  076a cd0000        	call	c_ltor
6248                     ; 932 	dwTime = GetSysTemTick();	
6250  076d cd0000        	call	_GetSysTemTick
6252  0770 96            	ldw	x,sp
6253  0771 5c            	incw	x
6254  0772 cd0000        	call	c_rtol
6256  0775               L1513:
6257                     ; 936 		dwNowTime = GetSysTemTick();
6259  0775 cd0000        	call	_GetSysTemTick
6261  0778 96            	ldw	x,sp
6262  0779 1c0005        	addw	x,#OFST-3
6263  077c cd0000        	call	c_rtol
6265                     ; 937 		if (dwTime < dwNowTime)
6267  077f 96            	ldw	x,sp
6268  0780 5c            	incw	x
6269  0781 cd0000        	call	c_ltor
6271  0784 96            	ldw	x,sp
6272  0785 1c0005        	addw	x,#OFST-3
6273  0788 cd0000        	call	c_lcmp
6275  078b 96            	ldw	x,sp
6276  078c 240a          	jruge	L5513
6277                     ; 939 			 if(dwNowTime - dwTime > dwWaitmS)
6279  078e 1c0005        	addw	x,#OFST-3
6280  0791 cd0000        	call	c_ltor
6282  0794 96            	ldw	x,sp
6283  0795 5c            	incw	x
6286                     ; 941 				break;
6288  0796 200a          	jra	L3513
6289  0798               L5513:
6290                     ; 944 		else if ((dwTime - dwNowTime) > dwWaitmS)
6292  0798 1c0001        	addw	x,#OFST-7
6293  079b cd0000        	call	c_ltor
6295  079e 96            	ldw	x,sp
6296  079f 1c0005        	addw	x,#OFST-3
6299                     ; 946 			break;
6300  07a2               L3513:
6301  07a2 cd0000        	call	c_lsub
6302  07a5 96            	ldw	x,sp
6303  07a6 1c000b        	addw	x,#OFST+3
6304  07a9 cd0000        	call	c_lcmp
6305  07ac 2304          	jrule	L1613
6306                     ; 954         return 0;
6308  07ae 4f            	clr	a
6311  07af 5b08          	addw	sp,#8
6312  07b1 81            	ret	
6313  07b2               L1613:
6314                     ; 952 		FeedSoftWareIwdg();
6316  07b2 cd0000        	call	_FeedSoftWareIwdg
6319  07b5 20be          	jra	L1513
6396                     	switch	.const
6397  046d               L453:
6398  046d 00004001      	dc.l	16385
6399  0471               L653:
6400  0471 00000401      	dc.l	1025
6401                     ; 967 int8_t  *QH_bufbuf(int8_t* pbSrc, uint32_t wSrcLen, int8_t* pbSub, uint32_t wSubLen)
6401                     ; 968 {
6402                     	switch	.text
6403  07b7               _QH_bufbuf:
6405  07b7 89            	pushw	x
6406  07b8 5207          	subw	sp,#7
6407       00000007      OFST:	set	7
6410                     ; 969 	int8_t  *pbSrcEnd = pbSrc + wSrcLen;
6412  07ba 72fb0e        	addw	x,(OFST+7,sp)
6413  07bd 1f05          	ldw	(OFST-2,sp),x
6414                     ; 970 	u8 nLoop = 0;
6416                     ; 972 	if ((pbSrc == NULL) || (pbSub == NULL) || (wSrcLen > 16384) || (wSubLen > 1024))
6418  07bf 1e08          	ldw	x,(OFST+1,sp)
6419  07c1 2603cc084f    	jreq	LC010
6421  07c6 1e10          	ldw	x,(OFST+9,sp)
6422  07c8 27f9          	jreq	LC010
6424  07ca 96            	ldw	x,sp
6425  07cb 1c000c        	addw	x,#OFST+5
6426  07ce cd0000        	call	c_ltor
6428  07d1 ae046d        	ldw	x,#L453
6429  07d4 cd0000        	call	c_lcmp
6431  07d7 2476          	jruge	LC010
6433  07d9 96            	ldw	x,sp
6434  07da 1c0012        	addw	x,#OFST+11
6435  07dd cd0000        	call	c_ltor
6437  07e0 ae0471        	ldw	x,#L653
6438  07e3 cd0000        	call	c_lcmp
6440  07e6 255e          	jrult	L3323
6441                     ; 974 		return (NULL);
6443  07e8 2065          	jp	LC010
6444  07ea               L1323:
6445                     ; 979 		nLoop = 0;
6447  07ea 0f07          	clr	(OFST+0,sp)
6448  07ec               L7323:
6449                     ; 982 			if(pbSrc[nLoop] != pbSub[nLoop])
6451  07ec 7b10          	ld	a,(OFST+9,sp)
6452  07ee 97            	ld	xl,a
6453  07ef 7b11          	ld	a,(OFST+10,sp)
6454  07f1 1b07          	add	a,(OFST+0,sp)
6455  07f3 2401          	jrnc	L063
6456  07f5 5c            	incw	x
6457  07f6               L063:
6458  07f6 02            	rlwa	x,a
6459  07f7 f6            	ld	a,(x)
6460  07f8 6b04          	ld	(OFST-3,sp),a
6461  07fa 7b08          	ld	a,(OFST+1,sp)
6462  07fc 97            	ld	xl,a
6463  07fd 7b09          	ld	a,(OFST+2,sp)
6464  07ff 1b07          	add	a,(OFST+0,sp)
6465  0801 2401          	jrnc	L263
6466  0803 5c            	incw	x
6467  0804               L263:
6468  0804 02            	rlwa	x,a
6469  0805 f6            	ld	a,(x)
6470  0806 1104          	cp	a,(OFST-3,sp)
6471  0808 2615          	jrne	L3423
6472                     ; 984 				break;
6474                     ; 986 			nLoop++;
6476  080a 0c07          	inc	(OFST+0,sp)
6477                     ; 987 		}while(nLoop<wSubLen);
6479  080c 7b07          	ld	a,(OFST+0,sp)
6480  080e b703          	ld	c_lreg+3,a
6481  0810 3f02          	clr	c_lreg+2
6482  0812 3f01          	clr	c_lreg+1
6483  0814 3f00          	clr	c_lreg
6484  0816 96            	ldw	x,sp
6485  0817 1c0012        	addw	x,#OFST+11
6486  081a cd0000        	call	c_lcmp
6488  081d 25cd          	jrult	L7323
6489  081f               L3423:
6490                     ; 988 		if(wSubLen <=nLoop)
6492  081f 7b07          	ld	a,(OFST+0,sp)
6493  0821 b703          	ld	c_lreg+3,a
6494  0823 3f02          	clr	c_lreg+2
6495  0825 3f01          	clr	c_lreg+1
6496  0827 3f00          	clr	c_lreg
6497  0829 96            	ldw	x,sp
6498  082a 5c            	incw	x
6499  082b cd0000        	call	c_rtol
6501  082e 96            	ldw	x,sp
6502  082f 1c0012        	addw	x,#OFST+11
6503  0832 cd0000        	call	c_ltor
6505  0835 96            	ldw	x,sp
6506  0836 5c            	incw	x
6507  0837 cd0000        	call	c_lcmp
6509  083a 2205          	jrugt	L7423
6510                     ; 990 			return pbSrc;
6512  083c 1e08          	ldw	x,(OFST+1,sp)
6514  083e               L463:
6516  083e 5b09          	addw	sp,#9
6517  0840 81            	ret	
6518  0841               L7423:
6519                     ; 992 		pbSrc++;
6521  0841 1e08          	ldw	x,(OFST+1,sp)
6522  0843 5c            	incw	x
6523  0844 1f08          	ldw	(OFST+1,sp),x
6524  0846               L3323:
6525                     ; 977 	while ((pbSrc+wSubLen) <= pbSrcEnd)
6527  0846 1e08          	ldw	x,(OFST+1,sp)
6528  0848 72fb14        	addw	x,(OFST+13,sp)
6529  084b 1305          	cpw	x,(OFST-2,sp)
6530  084d 239b          	jrule	L1323
6531                     ; 995 	return (NULL);
6533  084f               LC010:
6535  084f 5f            	clrw	x
6537  0850 20ec          	jra	L463
6620                     ; 1037 u8  QH_SearchStrVal(int8_t* pStart, int8_t* pEnd, uint32_t *dwVal)
6620                     ; 1038 {
6621                     	switch	.text
6622  0852               _QH_SearchStrVal:
6624  0852 89            	pushw	x
6625  0853 520b          	subw	sp,#11
6626       0000000b      OFST:	set	11
6629                     ; 1039 	u8 fGetFirst = FALSE, fRtnVal = FALSE;
6631  0855 0f0a          	clr	(OFST-1,sp)
6634  0857 0f05          	clr	(OFST-6,sp)
6635                     ; 1040 	uint32_t  val = 0;
6637  0859 5f            	clrw	x
6638  085a 1f08          	ldw	(OFST-3,sp),x
6639  085c 1f06          	ldw	(OFST-5,sp),x
6640                     ; 1044 	if ((pStart == NULL) || (pEnd == NULL) || (dwVal == NULL))
6642  085e 1e0c          	ldw	x,(OFST+1,sp)
6643  0860 2708          	jreq	L1133
6645  0862 1e10          	ldw	x,(OFST+5,sp)
6646  0864 2704          	jreq	L1133
6648  0866 1e12          	ldw	x,(OFST+7,sp)
6649  0868 265a          	jrne	L7133
6650  086a               L1133:
6651                     ; 1046 		return (fRtnVal);
6653  086a 4f            	clr	a
6655  086b 2070          	jra	L073
6656  086d               L5133:
6657                     ; 1051 		nByteTemp = *pStart++;
6659  086d f6            	ld	a,(x)
6660  086e 5c            	incw	x
6661  086f 1f0c          	ldw	(OFST+1,sp),x
6662  0871 6b0b          	ld	(OFST+0,sp),a
6663                     ; 1053 		if (fGetFirst == FALSE)
6665  0873 0d0a          	tnz	(OFST-1,sp)
6666  0875 260c          	jrne	L3233
6667                     ; 1055 			if (nByteTemp>='0' && nByteTemp<='9')
6669  0877 a130          	cp	a,#48
6670  0879 2f08          	jrslt	L3233
6672  087b a13a          	cp	a,#58
6673  087d 2e04          	jrsge	L3233
6674                     ; 1057 				fGetFirst = TRUE;
6676  087f a601          	ld	a,#1
6677  0881 6b0a          	ld	(OFST-1,sp),a
6678  0883               L3233:
6679                     ; 1061 		if (fGetFirst == TRUE)
6681  0883 7b0a          	ld	a,(OFST-1,sp)
6682  0885 4a            	dec	a
6683  0886 263c          	jrne	L7133
6684                     ; 1063 			if (nByteTemp>='0' && nByteTemp<='9')
6686  0888 7b0b          	ld	a,(OFST+0,sp)
6687  088a a130          	cp	a,#48
6688  088c 2f3c          	jrslt	L1233
6690  088e a13a          	cp	a,#58
6691  0890 2e38          	jrsge	L1233
6692                     ; 1065 				val = val*10 + nByteTemp - '0';
6694  0892 b703          	ld	c_lreg+3,a
6695  0894 48            	sll	a
6696  0895 4f            	clr	a
6697  0896 a200          	sbc	a,#0
6698  0898 b702          	ld	c_lreg+2,a
6699  089a b701          	ld	c_lreg+1,a
6700  089c b700          	ld	c_lreg,a
6701  089e 96            	ldw	x,sp
6702  089f 5c            	incw	x
6703  08a0 cd0000        	call	c_rtol
6705  08a3 96            	ldw	x,sp
6706  08a4 1c0006        	addw	x,#OFST-5
6707  08a7 cd0000        	call	c_ltor
6709  08aa a60a          	ld	a,#10
6710  08ac cd0000        	call	c_smul
6712  08af 96            	ldw	x,sp
6713  08b0 5c            	incw	x
6714  08b1 cd0000        	call	c_ladd
6716  08b4 a630          	ld	a,#48
6717  08b6 cd0000        	call	c_lsbc
6719  08b9 96            	ldw	x,sp
6720  08ba 1c0006        	addw	x,#OFST-5
6721  08bd cd0000        	call	c_rtol
6723                     ; 1066 				fRtnVal = TRUE;
6725  08c0 a601          	ld	a,#1
6726  08c2 6b05          	ld	(OFST-6,sp),a
6728  08c4               L7133:
6729                     ; 1049 	while (pStart < pEnd)
6731  08c4 1e0c          	ldw	x,(OFST+1,sp)
6732  08c6 1310          	cpw	x,(OFST+5,sp)
6733  08c8 25a3          	jrult	L5133
6734  08ca               L1233:
6735                     ; 1076 	*dwVal = val;
6737  08ca 1e12          	ldw	x,(OFST+7,sp)
6738  08cc 7b09          	ld	a,(OFST-2,sp)
6739  08ce e703          	ld	(3,x),a
6740  08d0 7b08          	ld	a,(OFST-3,sp)
6741  08d2 e702          	ld	(2,x),a
6742  08d4 7b07          	ld	a,(OFST-4,sp)
6743  08d6 e701          	ld	(1,x),a
6744  08d8 7b06          	ld	a,(OFST-5,sp)
6745  08da f7            	ld	(x),a
6746                     ; 1077 	return (fRtnVal);
6748  08db 7b05          	ld	a,(OFST-6,sp)
6750  08dd               L073:
6752  08dd 5b0d          	addw	sp,#13
6753  08df 81            	ret	
6932                     ; 1089 uint8_t  UC_CommAT(u8 nCmd, u8 *pnParameter, uint8_t *pnMatch1, uint8_t *pnMatch2, uint8_t *pnMatch3, 
6932                     ; 1090 					 uint8_t *pnMatch4, uint8_t **pnOutMatchPtr, uint32_t dwWaitmS)
6932                     ; 1091 {
6933                     	switch	.text
6934  08e0               _UC_CommAT:
6936  08e0 88            	push	a
6937  08e1 5213          	subw	sp,#19
6938       00000013      OFST:	set	19
6941                     ; 1092 	uint32_t  dwTimeOut = 0, dwTime = 0, dwNowTime = 0;
6943  08e3 96            	ldw	x,sp
6944  08e4 5c            	incw	x
6945  08e5 cd0000        	call	c_ltor
6949  08e8 96            	ldw	x,sp
6950  08e9 1c0005        	addw	x,#OFST-14
6951  08ec cd0000        	call	c_ltor
6955  08ef 96            	ldw	x,sp
6956  08f0 1c0009        	addw	x,#OFST-10
6957  08f3 cd0000        	call	c_ltor
6959                     ; 1093 	uint8_t   *pnMatchTagStr = NULL, nRtnVal = 0, *pnDat = NULL;
6961  08f6 5f            	clrw	x
6962  08f7 1f0e          	ldw	(OFST-5,sp),x
6965  08f9 0f0d          	clr	(OFST-6,sp)
6968                     ; 1094 	uint8_t   nData = 0, nStrLen = 0, nTxRxLen = 0;
6974                     ; 1097 	dwTime = GetSysTemTick();	
6976  08fb cd0000        	call	_GetSysTemTick
6978  08fe 96            	ldw	x,sp
6979  08ff 1c0005        	addw	x,#OFST-14
6980  0902 cd0000        	call	c_rtol
6982                     ; 1098 	dwTimeOut = (dwWaitmS);
6984  0905 1e25          	ldw	x,(OFST+18,sp)
6985  0907 1f03          	ldw	(OFST-16,sp),x
6986  0909 1e23          	ldw	x,(OFST+16,sp)
6987  090b 1f01          	ldw	(OFST-18,sp),x
6988                     ; 1100 	if((NULL != pnParameter)&&(nCmd < AT_CMD_NULL))
6990  090d 1e17          	ldw	x,(OFST+4,sp)
6991  090f 2714          	jreq	L3343
6993  0911 7b14          	ld	a,(OFST+1,sp)
6994  0913 a1ff          	cp	a,#255
6995  0915 240e          	jruge	L3343
6996                     ; 1103 		ClearRxBuff();
6998  0917 cd0000        	call	_ClearRxBuff
7000                     ; 1104 		PackAtCmdParameter(nCmd, pnParameter);                
7002  091a 1e17          	ldw	x,(OFST+4,sp)
7003  091c 89            	pushw	x
7004  091d 7b16          	ld	a,(OFST+3,sp)
7005  091f cd03d9        	call	_PackAtCmdParameter
7007  0922 85            	popw	x
7009  0923 200e          	jra	L5343
7010  0925               L3343:
7011                     ; 1106 	else if (nCmd < AT_CMD_NULL)
7013  0925 7b14          	ld	a,(OFST+1,sp)
7014  0927 a1ff          	cp	a,#255
7015  0929 2408          	jruge	L5343
7016                     ; 1109 		ClearRxBuff();
7018  092b cd0000        	call	_ClearRxBuff
7020                     ; 1110 		PackAtCmd(nCmd);
7022  092e 7b14          	ld	a,(OFST+1,sp)
7023  0930 cd0374        	call	_PackAtCmd
7025  0933               L5343:
7026                     ; 1115 	nTxRxLen = 0;
7028  0933 0f12          	clr	(OFST-1,sp)
7029                     ; 1116 	pnDat = GetUartRxBuf();
7031  0935 cd0000        	call	_GetUartRxBuf
7033  0938 1f10          	ldw	(OFST-3,sp),x
7035  093a cc0a84        	jra	L5443
7036  093d               L1443:
7037                     ; 1121 		FeedSoftWareIwdg();
7039  093d cd0000        	call	_FeedSoftWareIwdg
7041                     ; 1123 		dwNowTime = GetSysTemTick();
7043  0940 cd0000        	call	_GetSysTemTick
7045  0943 96            	ldw	x,sp
7046  0944 1c0009        	addw	x,#OFST-10
7047  0947 cd0000        	call	c_rtol
7049                     ; 1124 		if (dwTime < dwNowTime)
7051  094a 96            	ldw	x,sp
7052  094b 1c0005        	addw	x,#OFST-14
7053  094e cd0000        	call	c_ltor
7055  0951 96            	ldw	x,sp
7056  0952 1c0009        	addw	x,#OFST-10
7057  0955 cd0000        	call	c_lcmp
7059  0958 96            	ldw	x,sp
7060  0959 241a          	jruge	L1543
7061                     ; 1126 			 if(dwNowTime - dwTime > dwTimeOut)
7063  095b 1c0009        	addw	x,#OFST-10
7064  095e cd0000        	call	c_ltor
7066  0961 96            	ldw	x,sp
7067  0962 1c0005        	addw	x,#OFST-14
7068  0965 cd0000        	call	c_lsub
7070  0968 96            	ldw	x,sp
7071  0969 5c            	incw	x
7072  096a cd0000        	call	c_lcmp
7074  096d 2320          	jrule	L5543
7075                     ; 1128 				ClearRxBuff(); 
7077  096f cd0000        	call	_ClearRxBuff
7079                     ; 1129 				break;
7081  0972 cc0a9b        	jra	L5333
7082  0975               L1543:
7083                     ; 1132 		else if ((dwTime - dwNowTime) > dwTimeOut)
7085  0975 1c0005        	addw	x,#OFST-14
7086  0978 cd0000        	call	c_ltor
7088  097b 96            	ldw	x,sp
7089  097c 1c0009        	addw	x,#OFST-10
7090  097f cd0000        	call	c_lsub
7092  0982 96            	ldw	x,sp
7093  0983 5c            	incw	x
7094  0984 cd0000        	call	c_lcmp
7096  0987 2306          	jrule	L5543
7097                     ; 1134 			ClearRxBuff();
7099  0989 cd0000        	call	_ClearRxBuff
7101                     ; 1135 			break;
7103  098c cc0a9b        	jra	L5333
7104  098f               L5543:
7105                     ; 1138 		if (0 == (nTxRxLen = CheckRevDataLen()))
7107  098f cd0000        	call	_CheckRevDataLen
7109  0992 6b12          	ld	(OFST-1,sp),a
7110  0994 27a4          	jreq	L5443
7111                     ; 1140 			continue;
7113                     ; 1143 		nData = *(pnDat + nTxRxLen - 1); 		//不需要判断头,尾之类
7115  0996 7b10          	ld	a,(OFST-3,sp)
7116  0998 97            	ld	xl,a
7117  0999 7b11          	ld	a,(OFST-2,sp)
7118  099b 1b12          	add	a,(OFST-1,sp)
7119  099d 2401          	jrnc	L224
7120  099f 5c            	incw	x
7121  09a0               L224:
7122  09a0 02            	rlwa	x,a
7123  09a1 5a            	decw	x
7124  09a2 f6            	ld	a,(x)
7125  09a3 6b13          	ld	(OFST+0,sp),a
7126                     ; 1159 		HD_DecodeParameter(pnDat, CheckRevDataLen());
7128  09a5 cd0000        	call	_CheckRevDataLen
7130  09a8 88            	push	a
7131  09a9 1e11          	ldw	x,(OFST-2,sp)
7132  09ab cd0000        	call	_HD_DecodeParameter
7134  09ae 84            	pop	a
7135                     ; 1163 		if ( (nData == AT_TAIL_0) || (nData == AT_TAIL_1) ) 	//0d0a
7137  09af 7b13          	ld	a,(OFST+0,sp)
7138  09b1 a10d          	cp	a,#13
7139  09b3 2704          	jreq	L5643
7141  09b5 a10a          	cp	a,#10
7142  09b7 2681          	jrne	L5443
7143  09b9               L5643:
7144                     ; 1165 			if (pnMatch1 != NULL)
7146  09b9 1e19          	ldw	x,(OFST+6,sp)
7147  09bb 2730          	jreq	L7643
7148                     ; 1167 				nStrLen = (u8)JX_Strlen((char *)pnMatch1);
7150  09bd cd0315        	call	_JX_Strlen
7152  09c0 6b13          	ld	(OFST+0,sp),a
7153                     ; 1168 				if	((nTxRxLen >= nStrLen) && 
7153                     ; 1169 					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch1, nStrLen)) != NULL))
7155  09c2 7b12          	ld	a,(OFST-1,sp)
7156  09c4 1113          	cp	a,(OFST+0,sp)
7157  09c6 2525          	jrult	L7643
7159  09c8 7b13          	ld	a,(OFST+0,sp)
7160  09ca cd0aaf        	call	LC012
7161  09cd 89            	pushw	x
7162  09ce be00          	ldw	x,c_lreg
7163  09d0 89            	pushw	x
7164  09d1 1e1d          	ldw	x,(OFST+10,sp)
7165  09d3 89            	pushw	x
7166  09d4 7b18          	ld	a,(OFST+5,sp)
7167  09d6 cd0aaf        	call	LC012
7168  09d9 89            	pushw	x
7169  09da be00          	ldw	x,c_lreg
7170  09dc 89            	pushw	x
7171  09dd 1e1a          	ldw	x,(OFST+7,sp)
7172  09df cd07b7        	call	_QH_bufbuf
7174  09e2 5b0a          	addw	sp,#10
7175  09e4 1f0e          	ldw	(OFST-5,sp),x
7176  09e6 2705          	jreq	L7643
7177                     ; 1171 					nRtnVal = 1;
7179  09e8 a601          	ld	a,#1
7180                     ; 1172 					goto  __UC_CommAT_Exit;
7182  09ea cc0a80        	jp	LC011
7183  09ed               L7643:
7184                     ; 1175 			if (pnMatch2 != NULL)
7186  09ed 1e1b          	ldw	x,(OFST+8,sp)
7187  09ef 272f          	jreq	L3743
7188                     ; 1177 				nStrLen = (u8)JX_Strlen((char *)pnMatch2);
7190  09f1 cd0315        	call	_JX_Strlen
7192  09f4 6b13          	ld	(OFST+0,sp),a
7193                     ; 1178 				if	((nTxRxLen >= nStrLen) && 
7193                     ; 1179 					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch2, nStrLen)) != NULL))
7195  09f6 7b12          	ld	a,(OFST-1,sp)
7196  09f8 1113          	cp	a,(OFST+0,sp)
7197  09fa 2524          	jrult	L3743
7199  09fc 7b13          	ld	a,(OFST+0,sp)
7200  09fe cd0aaf        	call	LC012
7201  0a01 89            	pushw	x
7202  0a02 be00          	ldw	x,c_lreg
7203  0a04 89            	pushw	x
7204  0a05 1e1f          	ldw	x,(OFST+12,sp)
7205  0a07 89            	pushw	x
7206  0a08 7b18          	ld	a,(OFST+5,sp)
7207  0a0a cd0aaf        	call	LC012
7208  0a0d 89            	pushw	x
7209  0a0e be00          	ldw	x,c_lreg
7210  0a10 89            	pushw	x
7211  0a11 1e1a          	ldw	x,(OFST+7,sp)
7212  0a13 cd07b7        	call	_QH_bufbuf
7214  0a16 5b0a          	addw	sp,#10
7215  0a18 1f0e          	ldw	(OFST-5,sp),x
7216  0a1a 2704          	jreq	L3743
7217                     ; 1181 					nRtnVal = 2;
7219  0a1c a602          	ld	a,#2
7220                     ; 1182 					goto  __UC_CommAT_Exit;
7222  0a1e 2060          	jp	LC011
7223  0a20               L3743:
7224                     ; 1185 			if (pnMatch3 != NULL)
7226  0a20 1e1d          	ldw	x,(OFST+10,sp)
7227  0a22 272d          	jreq	L7743
7228                     ; 1187 				nStrLen = (u8)JX_Strlen((char *)pnMatch3);
7230  0a24 cd0315        	call	_JX_Strlen
7232  0a27 6b13          	ld	(OFST+0,sp),a
7233                     ; 1188 				if	((nTxRxLen >= nStrLen) && 
7233                     ; 1189 					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch3, nStrLen)) != NULL))
7235  0a29 7b12          	ld	a,(OFST-1,sp)
7236  0a2b 1113          	cp	a,(OFST+0,sp)
7237  0a2d 2522          	jrult	L7743
7239  0a2f 7b13          	ld	a,(OFST+0,sp)
7240  0a31 ad7c          	call	LC012
7241  0a33 89            	pushw	x
7242  0a34 be00          	ldw	x,c_lreg
7243  0a36 89            	pushw	x
7244  0a37 1e21          	ldw	x,(OFST+14,sp)
7245  0a39 89            	pushw	x
7246  0a3a 7b18          	ld	a,(OFST+5,sp)
7247  0a3c ad71          	call	LC012
7248  0a3e 89            	pushw	x
7249  0a3f be00          	ldw	x,c_lreg
7250  0a41 89            	pushw	x
7251  0a42 1e1a          	ldw	x,(OFST+7,sp)
7252  0a44 cd07b7        	call	_QH_bufbuf
7254  0a47 5b0a          	addw	sp,#10
7255  0a49 1f0e          	ldw	(OFST-5,sp),x
7256  0a4b 2704          	jreq	L7743
7257                     ; 1191 					nRtnVal = 3;
7259  0a4d a603          	ld	a,#3
7260                     ; 1192 					goto  __UC_CommAT_Exit;
7262  0a4f 202f          	jp	LC011
7263  0a51               L7743:
7264                     ; 1195 			if (pnMatch4 != NULL)
7266  0a51 1e1f          	ldw	x,(OFST+12,sp)
7267  0a53 272f          	jreq	L5443
7268                     ; 1197 				nStrLen = (u8)JX_Strlen((char *)pnMatch4);
7270  0a55 cd0315        	call	_JX_Strlen
7272  0a58 6b13          	ld	(OFST+0,sp),a
7273                     ; 1198 				if	((nTxRxLen >= nStrLen) && 
7273                     ; 1199 					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch4, nStrLen)) != NULL))
7275  0a5a 7b12          	ld	a,(OFST-1,sp)
7276  0a5c 1113          	cp	a,(OFST+0,sp)
7277  0a5e 2524          	jrult	L5443
7279  0a60 7b13          	ld	a,(OFST+0,sp)
7280  0a62 ad4b          	call	LC012
7281  0a64 89            	pushw	x
7282  0a65 be00          	ldw	x,c_lreg
7283  0a67 89            	pushw	x
7284  0a68 1e23          	ldw	x,(OFST+16,sp)
7285  0a6a 89            	pushw	x
7286  0a6b 7b18          	ld	a,(OFST+5,sp)
7287  0a6d ad40          	call	LC012
7288  0a6f 89            	pushw	x
7289  0a70 be00          	ldw	x,c_lreg
7290  0a72 89            	pushw	x
7291  0a73 1e1a          	ldw	x,(OFST+7,sp)
7292  0a75 cd07b7        	call	_QH_bufbuf
7294  0a78 5b0a          	addw	sp,#10
7295  0a7a 1f0e          	ldw	(OFST-5,sp),x
7296  0a7c 2706          	jreq	L5443
7297                     ; 1201 					nRtnVal = 4;
7299  0a7e a604          	ld	a,#4
7300  0a80               LC011:
7301  0a80 6b0d          	ld	(OFST-6,sp),a
7302                     ; 1202 					goto  __UC_CommAT_Exit;
7304  0a82 2017          	jra	L5333
7305  0a84               L5443:
7306                     ; 1118 	while ((dwTimeOut <= dwWaitmS) && (nTxRxLen < NUMBER_UART_RX))
7308  0a84 96            	ldw	x,sp
7309  0a85 5c            	incw	x
7310  0a86 cd0000        	call	c_ltor
7312  0a89 96            	ldw	x,sp
7313  0a8a 1c0023        	addw	x,#OFST+16
7314  0a8d cd0000        	call	c_lcmp
7316  0a90 2209          	jrugt	L5333
7318  0a92 7b12          	ld	a,(OFST-1,sp)
7319  0a94 a1c0          	cp	a,#192
7320  0a96 2403cc093d    	jrult	L1443
7321  0a9b               L5333:
7322                     ; 1211 __UC_CommAT_Exit:
7322                     ; 1212 	if ((pnOutMatchPtr != NULL) && (pnMatchTagStr != NULL))
7324  0a9b 1e21          	ldw	x,(OFST+14,sp)
7325  0a9d 2709          	jreq	L1153
7327  0a9f 1e0e          	ldw	x,(OFST-5,sp)
7328  0aa1 2705          	jreq	L1153
7329                     ; 1214 		*pnOutMatchPtr = pnMatchTagStr;
7331  0aa3 1e21          	ldw	x,(OFST+14,sp)
7332  0aa5 160e          	ldw	y,(OFST-5,sp)
7333  0aa7 ff            	ldw	(x),y
7334  0aa8               L1153:
7335                     ; 1216 	if (nTxRxLen > 0)
7337  0aa8 0d12          	tnz	(OFST-1,sp)
7338                     ; 1221 	return (nRtnVal); 
7340  0aaa 7b0d          	ld	a,(OFST-6,sp)
7343  0aac 5b14          	addw	sp,#20
7344  0aae 81            	ret	
7346  0aaf               LC012:
7347  0aaf b703          	ld	c_lreg+3,a
7348  0ab1 3f02          	clr	c_lreg+2
7349  0ab3 3f01          	clr	c_lreg+1
7350  0ab5 3f00          	clr	c_lreg
7351  0ab7 be02          	ldw	x,c_lreg+2
7352  0ab9 81            	ret	
7554                     ; 1233 uint8_t  UC_CommATExt(u8 nCmd, u8 *pnParameter1, u8 *pnParameter2, u8 *pnParameter3, uint8_t *pnMatch1, uint8_t *pnMatch2, uint8_t *pnMatch3, 
7554                     ; 1234 					 uint8_t *pnMatch4, uint8_t **pnOutMatchPtr, uint32_t dwWaitmS)
7554                     ; 1235 {
7555                     	switch	.text
7556  0aba               _UC_CommATExt:
7558  0aba 88            	push	a
7559  0abb 5213          	subw	sp,#19
7560       00000013      OFST:	set	19
7563                     ; 1236 	uint32_t  dwTimeOut = 0, dwTime = 0, dwNowTime = 0;
7565  0abd 96            	ldw	x,sp
7566  0abe 5c            	incw	x
7567  0abf cd0000        	call	c_ltor
7571  0ac2 96            	ldw	x,sp
7572  0ac3 1c0005        	addw	x,#OFST-14
7573  0ac6 cd0000        	call	c_ltor
7577  0ac9 96            	ldw	x,sp
7578  0aca 1c0009        	addw	x,#OFST-10
7579  0acd cd0000        	call	c_ltor
7581                     ; 1237 	uint8_t   *pnMatchTagStr = NULL, nRtnVal = 0;
7583  0ad0 5f            	clrw	x
7584  0ad1 1f0d          	ldw	(OFST-6,sp),x
7587  0ad3 0f0f          	clr	(OFST-4,sp)
7588                     ; 1238 	uint8_t   nData = 0, *pnDat = NULL, nTxRxLen = 0, nStrLen = 0;
7596                     ; 1241 	dwTime = GetSysTemTick();	
7598  0ad5 cd0000        	call	_GetSysTemTick
7600  0ad8 96            	ldw	x,sp
7601  0ad9 1c0005        	addw	x,#OFST-14
7602  0adc cd0000        	call	c_rtol
7604                     ; 1242 	dwTimeOut = (dwWaitmS);
7606  0adf 1e29          	ldw	x,(OFST+22,sp)
7607  0ae1 1f03          	ldw	(OFST-16,sp),x
7608  0ae3 1e27          	ldw	x,(OFST+20,sp)
7609  0ae5 1f01          	ldw	(OFST-18,sp),x
7610                     ; 1245 	ClearRxBuff();
7612  0ae7 cd0000        	call	_ClearRxBuff
7614                     ; 1247 	if(AT_CMD_TCPSEND == nCmd)
7616  0aea 7b14          	ld	a,(OFST+1,sp)
7617  0aec a13d          	cp	a,#61
7618  0aee 2608          	jrne	L3263
7619                     ; 1249 		PackAtCmdTcpsend(ucNumberMessage);
7621  0af0 c6006b        	ld	a,_ucNumberMessage
7622  0af3 cd05f7        	call	_PackAtCmdTcpsend
7625  0af6 2045          	jra	L5263
7626  0af8               L3263:
7627                     ; 1251 	else if((AT_CMD_NULL == nCmd)&&(NULL != pnParameter1)) /* 特殊处理需要发送的数据 */
7629  0af8 4c            	inc	a
7630  0af9 260a          	jrne	L7263
7632  0afb 1e17          	ldw	x,(OFST+4,sp)
7633  0afd 2706          	jreq	L7263
7634                     ; 1253 		PackTcpSendData(*pnParameter1);
7636  0aff f6            	ld	a,(x)
7637  0b00 cd06c3        	call	_PackTcpSendData
7640  0b03 2038          	jra	L5263
7641  0b05               L7263:
7642                     ; 1255 	else if((NULL != pnParameter1)&&(NULL != pnParameter2)&&(NULL == pnParameter3))
7644  0b05 1e17          	ldw	x,(OFST+4,sp)
7645  0b07 2717          	jreq	L3363
7647  0b09 1e19          	ldw	x,(OFST+6,sp)
7648  0b0b 2713          	jreq	L3363
7650  0b0d 1e1b          	ldw	x,(OFST+8,sp)
7651  0b0f 260f          	jrne	L3363
7652                     ; 1257 		PackAtCmdParameter2(nCmd, pnParameter1, pnParameter2);
7654  0b11 1e19          	ldw	x,(OFST+6,sp)
7655  0b13 89            	pushw	x
7656  0b14 1e19          	ldw	x,(OFST+6,sp)
7657  0b16 89            	pushw	x
7658  0b17 7b18          	ld	a,(OFST+5,sp)
7659  0b19 cd045e        	call	_PackAtCmdParameter2
7661  0b1c 5b04          	addw	sp,#4
7663  0b1e 201d          	jra	L5263
7664  0b20               L3363:
7665                     ; 1259 	else if((NULL != pnParameter1)&&(NULL != pnParameter2)&&(NULL != pnParameter3))
7667  0b20 1e17          	ldw	x,(OFST+4,sp)
7668  0b22 2603cc0cc0    	jreq	L625
7670  0b27 1e19          	ldw	x,(OFST+6,sp)
7671  0b29 27f9          	jreq	L625
7673  0b2b 1e1b          	ldw	x,(OFST+8,sp)
7674  0b2d 27f5          	jreq	L625
7675                     ; 1261 		PackAtCmdParameter3(nCmd, pnParameter1, pnParameter2, pnParameter3);
7677  0b2f 89            	pushw	x
7678  0b30 1e1b          	ldw	x,(OFST+8,sp)
7679  0b32 89            	pushw	x
7680  0b33 1e1b          	ldw	x,(OFST+8,sp)
7681  0b35 89            	pushw	x
7682  0b36 7b1a          	ld	a,(OFST+7,sp)
7683  0b38 cd050e        	call	_PackAtCmdParameter3
7685  0b3b 5b06          	addw	sp,#6
7687  0b3d               L5263:
7688                     ; 1268 	nTxRxLen = 0;
7690  0b3d 0f12          	clr	(OFST-1,sp)
7691                     ; 1269 	pnDat = GetUartRxBuf();
7693  0b3f cd0000        	call	_GetUartRxBuf
7695  0b42 1f10          	ldw	(OFST-3,sp),x
7696                     ; 1270 	UC_SleepFunc(10);
7698  0b44 ae000a        	ldw	x,#10
7699  0b47 89            	pushw	x
7700  0b48 5f            	clrw	x
7701  0b49 89            	pushw	x
7702  0b4a cd075f        	call	_UC_SleepFunc
7704  0b4d 5b04          	addw	sp,#4
7706  0b4f cc0c9a        	jra	L5463
7707                     ; 1265 		return nRtnVal;
7709  0b52               L3463:
7710                     ; 1276 		FeedSoftWareIwdg();
7712  0b52 cd0000        	call	_FeedSoftWareIwdg
7714                     ; 1278 		dwNowTime = GetSysTemTick();
7716  0b55 cd0000        	call	_GetSysTemTick
7718  0b58 96            	ldw	x,sp
7719  0b59 1c0009        	addw	x,#OFST-10
7720  0b5c cd0000        	call	c_rtol
7722                     ; 1279 		if (dwTime < dwNowTime)
7724  0b5f 96            	ldw	x,sp
7725  0b60 1c0005        	addw	x,#OFST-14
7726  0b63 cd0000        	call	c_ltor
7728  0b66 96            	ldw	x,sp
7729  0b67 1c0009        	addw	x,#OFST-10
7730  0b6a cd0000        	call	c_lcmp
7732  0b6d 96            	ldw	x,sp
7733  0b6e 2417          	jruge	L1563
7734                     ; 1281 			 if(dwNowTime - dwTime > dwTimeOut)
7736  0b70 1c0009        	addw	x,#OFST-10
7737  0b73 cd0000        	call	c_ltor
7739  0b76 96            	ldw	x,sp
7740  0b77 1c0005        	addw	x,#OFST-14
7741  0b7a cd0000        	call	c_lsub
7743  0b7d 96            	ldw	x,sp
7744  0b7e 5c            	incw	x
7745  0b7f cd0000        	call	c_lcmp
7747  0b82 2317          	jrule	L5563
7748                     ; 1284 				break;
7750  0b84 cc0cb1        	jra	L5153
7751  0b87               L1563:
7752                     ; 1287 		else if ((dwTime - dwNowTime) > dwTimeOut)
7754  0b87 1c0005        	addw	x,#OFST-14
7755  0b8a cd0000        	call	c_ltor
7757  0b8d 96            	ldw	x,sp
7758  0b8e 1c0009        	addw	x,#OFST-10
7759  0b91 cd0000        	call	c_lsub
7761  0b94 96            	ldw	x,sp
7762  0b95 5c            	incw	x
7763  0b96 cd0000        	call	c_lcmp
7765  0b99 22e9          	jrugt	L5153
7766                     ; 1290 			break;
7768  0b9b               L5563:
7769                     ; 1293 		if (0 == (nTxRxLen = CheckRevDataLen()))
7771  0b9b cd0000        	call	_CheckRevDataLen
7773  0b9e 6b12          	ld	(OFST-1,sp),a
7774  0ba0 27ad          	jreq	L5463
7775                     ; 1295 			continue;
7777                     ; 1298 		nData = *(pnDat + nTxRxLen - 1); 		//不需要判断头,尾之类
7779  0ba2 7b10          	ld	a,(OFST-3,sp)
7780  0ba4 97            	ld	xl,a
7781  0ba5 7b11          	ld	a,(OFST-2,sp)
7782  0ba7 1b12          	add	a,(OFST-1,sp)
7783  0ba9 2401          	jrnc	L005
7784  0bab 5c            	incw	x
7785  0bac               L005:
7786  0bac 02            	rlwa	x,a
7787  0bad 5a            	decw	x
7788  0bae f6            	ld	a,(x)
7789  0baf 6b13          	ld	(OFST+0,sp),a
7790                     ; 1307 				HD_DecodeParameter(pnDat, CheckRevDataLen());
7792  0bb1 cd0000        	call	_CheckRevDataLen
7794  0bb4 88            	push	a
7795  0bb5 1e11          	ldw	x,(OFST-2,sp)
7796  0bb7 cd0000        	call	_HD_DecodeParameter
7798  0bba 84            	pop	a
7799                     ; 1311 		if ( (2 <= nTxRxLen)||((nData == AT_TAIL_0) || (nData == AT_TAIL_1)|| (nData == '>')) ) 	// (2 <= nTxRxLen)&& 此处特殊处理发送长度时回复的'>'
7801  0bbb 7b12          	ld	a,(OFST-1,sp)
7802  0bbd a102          	cp	a,#2
7803  0bbf 240e          	jruge	L5663
7805  0bc1 7b13          	ld	a,(OFST+0,sp)
7806  0bc3 a10d          	cp	a,#13
7807  0bc5 2708          	jreq	L5663
7809  0bc7 a10a          	cp	a,#10
7810  0bc9 2704          	jreq	L5663
7812  0bcb a13e          	cp	a,#62
7813  0bcd 2680          	jrne	L5463
7814  0bcf               L5663:
7815                     ; 1313 			if (pnMatch1 != NULL)
7817  0bcf 1e1d          	ldw	x,(OFST+10,sp)
7818  0bd1 2730          	jreq	L3763
7819                     ; 1315 				nStrLen = (u8)JX_Strlen((char *)pnMatch1);
7821  0bd3 cd0315        	call	_JX_Strlen
7823  0bd6 6b13          	ld	(OFST+0,sp),a
7824                     ; 1316 				if	((nTxRxLen >= nStrLen) && 
7824                     ; 1317 					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch1, nStrLen)) != NULL))
7826  0bd8 7b12          	ld	a,(OFST-1,sp)
7827  0bda 1113          	cp	a,(OFST+0,sp)
7828  0bdc 2525          	jrult	L3763
7830  0bde 7b13          	ld	a,(OFST+0,sp)
7831  0be0 cd0cc5        	call	LC014
7832  0be3 89            	pushw	x
7833  0be4 be00          	ldw	x,c_lreg
7834  0be6 89            	pushw	x
7835  0be7 1e21          	ldw	x,(OFST+14,sp)
7836  0be9 89            	pushw	x
7837  0bea 7b18          	ld	a,(OFST+5,sp)
7838  0bec cd0cc5        	call	LC014
7839  0bef 89            	pushw	x
7840  0bf0 be00          	ldw	x,c_lreg
7841  0bf2 89            	pushw	x
7842  0bf3 1e1a          	ldw	x,(OFST+7,sp)
7843  0bf5 cd07b7        	call	_QH_bufbuf
7845  0bf8 5b0a          	addw	sp,#10
7846  0bfa 1f0d          	ldw	(OFST-6,sp),x
7847  0bfc 2705          	jreq	L3763
7848                     ; 1319 					nRtnVal = 1;
7850  0bfe a601          	ld	a,#1
7851                     ; 1320 					goto  __UC_CommAT_Exit;
7853  0c00 cc0c96        	jp	LC013
7854  0c03               L3763:
7855                     ; 1323 			if (pnMatch2 != NULL)
7857  0c03 1e1f          	ldw	x,(OFST+12,sp)
7858  0c05 272f          	jreq	L7763
7859                     ; 1325 				nStrLen = (u8)JX_Strlen((char *)pnMatch2);
7861  0c07 cd0315        	call	_JX_Strlen
7863  0c0a 6b13          	ld	(OFST+0,sp),a
7864                     ; 1326 				if	((nTxRxLen >= nStrLen) && 
7864                     ; 1327 					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch2, nStrLen)) != NULL))
7866  0c0c 7b12          	ld	a,(OFST-1,sp)
7867  0c0e 1113          	cp	a,(OFST+0,sp)
7868  0c10 2524          	jrult	L7763
7870  0c12 7b13          	ld	a,(OFST+0,sp)
7871  0c14 cd0cc5        	call	LC014
7872  0c17 89            	pushw	x
7873  0c18 be00          	ldw	x,c_lreg
7874  0c1a 89            	pushw	x
7875  0c1b 1e23          	ldw	x,(OFST+16,sp)
7876  0c1d 89            	pushw	x
7877  0c1e 7b18          	ld	a,(OFST+5,sp)
7878  0c20 cd0cc5        	call	LC014
7879  0c23 89            	pushw	x
7880  0c24 be00          	ldw	x,c_lreg
7881  0c26 89            	pushw	x
7882  0c27 1e1a          	ldw	x,(OFST+7,sp)
7883  0c29 cd07b7        	call	_QH_bufbuf
7885  0c2c 5b0a          	addw	sp,#10
7886  0c2e 1f0d          	ldw	(OFST-6,sp),x
7887  0c30 2704          	jreq	L7763
7888                     ; 1329 					nRtnVal = 2;
7890  0c32 a602          	ld	a,#2
7891                     ; 1330 					goto  __UC_CommAT_Exit;
7893  0c34 2060          	jp	LC013
7894  0c36               L7763:
7895                     ; 1333 			if (pnMatch3 != NULL)
7897  0c36 1e21          	ldw	x,(OFST+14,sp)
7898  0c38 272d          	jreq	L3073
7899                     ; 1335 				nStrLen = (u8)JX_Strlen((char *)pnMatch3);
7901  0c3a cd0315        	call	_JX_Strlen
7903  0c3d 6b13          	ld	(OFST+0,sp),a
7904                     ; 1336 				if	((nTxRxLen >= nStrLen) && 
7904                     ; 1337 					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch3, nStrLen)) != NULL))
7906  0c3f 7b12          	ld	a,(OFST-1,sp)
7907  0c41 1113          	cp	a,(OFST+0,sp)
7908  0c43 2522          	jrult	L3073
7910  0c45 7b13          	ld	a,(OFST+0,sp)
7911  0c47 ad7c          	call	LC014
7912  0c49 89            	pushw	x
7913  0c4a be00          	ldw	x,c_lreg
7914  0c4c 89            	pushw	x
7915  0c4d 1e25          	ldw	x,(OFST+18,sp)
7916  0c4f 89            	pushw	x
7917  0c50 7b18          	ld	a,(OFST+5,sp)
7918  0c52 ad71          	call	LC014
7919  0c54 89            	pushw	x
7920  0c55 be00          	ldw	x,c_lreg
7921  0c57 89            	pushw	x
7922  0c58 1e1a          	ldw	x,(OFST+7,sp)
7923  0c5a cd07b7        	call	_QH_bufbuf
7925  0c5d 5b0a          	addw	sp,#10
7926  0c5f 1f0d          	ldw	(OFST-6,sp),x
7927  0c61 2704          	jreq	L3073
7928                     ; 1339 					nRtnVal = 3;
7930  0c63 a603          	ld	a,#3
7931                     ; 1340 					goto  __UC_CommAT_Exit;
7933  0c65 202f          	jp	LC013
7934  0c67               L3073:
7935                     ; 1343 			if (pnMatch4 != NULL)
7937  0c67 1e23          	ldw	x,(OFST+16,sp)
7938  0c69 272f          	jreq	L5463
7939                     ; 1345 				nStrLen = (u8)JX_Strlen((char *)pnMatch4);
7941  0c6b cd0315        	call	_JX_Strlen
7943  0c6e 6b13          	ld	(OFST+0,sp),a
7944                     ; 1346 				if	((nTxRxLen >= nStrLen) && 
7944                     ; 1347 					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch4, nStrLen)) != NULL))
7946  0c70 7b12          	ld	a,(OFST-1,sp)
7947  0c72 1113          	cp	a,(OFST+0,sp)
7948  0c74 2524          	jrult	L5463
7950  0c76 7b13          	ld	a,(OFST+0,sp)
7951  0c78 ad4b          	call	LC014
7952  0c7a 89            	pushw	x
7953  0c7b be00          	ldw	x,c_lreg
7954  0c7d 89            	pushw	x
7955  0c7e 1e27          	ldw	x,(OFST+20,sp)
7956  0c80 89            	pushw	x
7957  0c81 7b18          	ld	a,(OFST+5,sp)
7958  0c83 ad40          	call	LC014
7959  0c85 89            	pushw	x
7960  0c86 be00          	ldw	x,c_lreg
7961  0c88 89            	pushw	x
7962  0c89 1e1a          	ldw	x,(OFST+7,sp)
7963  0c8b cd07b7        	call	_QH_bufbuf
7965  0c8e 5b0a          	addw	sp,#10
7966  0c90 1f0d          	ldw	(OFST-6,sp),x
7967  0c92 2706          	jreq	L5463
7968                     ; 1349 					nRtnVal = 4;
7970  0c94 a604          	ld	a,#4
7971  0c96               LC013:
7972  0c96 6b0f          	ld	(OFST-4,sp),a
7973                     ; 1350 					goto  __UC_CommAT_Exit;
7975  0c98 2017          	jra	L5153
7976  0c9a               L5463:
7977                     ; 1273 	while ((dwTimeOut <= dwWaitmS) && (nTxRxLen < NUMBER_UART_RX))
7979  0c9a 96            	ldw	x,sp
7980  0c9b 5c            	incw	x
7981  0c9c cd0000        	call	c_ltor
7983  0c9f 96            	ldw	x,sp
7984  0ca0 1c0027        	addw	x,#OFST+20
7985  0ca3 cd0000        	call	c_lcmp
7987  0ca6 2209          	jrugt	L5153
7989  0ca8 7b12          	ld	a,(OFST-1,sp)
7990  0caa a1c0          	cp	a,#192
7991  0cac 2403cc0b52    	jrult	L3463
7992  0cb1               L5153:
7993                     ; 1359 __UC_CommAT_Exit:
7993                     ; 1360 	if ((pnOutMatchPtr != NULL) && (pnMatchTagStr != NULL))
7995  0cb1 1e25          	ldw	x,(OFST+18,sp)
7996  0cb3 2709          	jreq	L5173
7998  0cb5 1e0d          	ldw	x,(OFST-6,sp)
7999  0cb7 2705          	jreq	L5173
8000                     ; 1362 		*pnOutMatchPtr = pnMatchTagStr;
8002  0cb9 1e25          	ldw	x,(OFST+18,sp)
8003  0cbb 160d          	ldw	y,(OFST-6,sp)
8004  0cbd ff            	ldw	(x),y
8005  0cbe               L5173:
8006                     ; 1364 	if (nTxRxLen > 0)
8008  0cbe 0d12          	tnz	(OFST-1,sp)
8009                     ; 1369 	return (nRtnVal); 
8012  0cc0               L625:
8014  0cc0 7b0f          	ld	a,(OFST-4,sp)
8016  0cc2 5b14          	addw	sp,#20
8017  0cc4 81            	ret	
8019  0cc5               LC014:
8020  0cc5 b703          	ld	c_lreg+3,a
8021  0cc7 3f02          	clr	c_lreg+2
8022  0cc9 3f01          	clr	c_lreg+1
8023  0ccb 3f00          	clr	c_lreg
8024  0ccd be02          	ldw	x,c_lreg+2
8025  0ccf 81            	ret	
8057                     ; 1378 uint8_t  SIMGetRegisterStat(void)
8057                     ; 1379 {
8058                     	switch	.text
8059  0cd0               _SIMGetRegisterStat:
8061  0cd0 88            	push	a
8062       00000001      OFST:	set	1
8065                     ; 1380 	uint8_t  nTmp = 0;
8067  0cd1 0f01          	clr	(OFST+0,sp)
8068                     ; 1383 	nTmp = UC_CommAT(AT_CMD_CREG,	NULL, "+CREG: 0,1", "+CREG: 0,5", "ERROR", NULL, NULL, 1000);
8070  0cd3 ae03e8        	ldw	x,#1000
8071  0cd6 89            	pushw	x
8072  0cd7 5f            	clrw	x
8073  0cd8 89            	pushw	x
8074  0cd9 89            	pushw	x
8075  0cda 89            	pushw	x
8076  0cdb ae04f3        	ldw	x,#L1473
8077  0cde 89            	pushw	x
8078  0cdf ae04dd        	ldw	x,#L7373
8079  0ce2 89            	pushw	x
8080  0ce3 ae04e8        	ldw	x,#L5373
8081  0ce6 89            	pushw	x
8082  0ce7 5f            	clrw	x
8083  0ce8 89            	pushw	x
8084  0ce9 a61a          	ld	a,#26
8085  0ceb cd08e0        	call	_UC_CommAT
8087  0cee 5b10          	addw	sp,#16
8088  0cf0 6b01          	ld	(OFST+0,sp),a
8089                     ; 1384 	if((nTmp != 1)&&(nTmp != 2))
8091  0cf2 a101          	cp	a,#1
8092  0cf4 2709          	jreq	L3473
8094  0cf6 a102          	cp	a,#2
8095  0cf8 2705          	jreq	L3473
8096                     ; 1386 		return SIM_REG_FAILURE;
8098  0cfa a602          	ld	a,#2
8101  0cfc 5b01          	addw	sp,#1
8102  0cfe 81            	ret	
8103  0cff               L3473:
8104                     ; 1388 	return SIM_REG_SUCCESS;
8106  0cff a601          	ld	a,#1
8109  0d01 5b01          	addw	sp,#1
8110  0d03 81            	ret	
8166                     	switch	.const
8167  0475               L245:
8168  0475 00000020      	dc.l	32
8169                     ; 1397 uint8_t  SIMGL868_UpdateSignal(void)
8169                     ; 1398 {
8170                     	switch	.text
8171  0d04               _SIMGL868_UpdateSignal:
8173  0d04 5208          	subw	sp,#8
8174       00000008      OFST:	set	8
8177                     ; 1399 	uint32_t  dwSignalStr = 0;
8179  0d06 5f            	clrw	x
8180  0d07 1f03          	ldw	(OFST-5,sp),x
8181  0d09 1f01          	ldw	(OFST-7,sp),x
8182                     ; 1403 	if (UC_CommAT(AT_CMD_CSQ, NULL, "+CSQ:", NULL, NULL, NULL, &pnRecvBuf, 1000) == 1)
8184  0d0b ae03e8        	ldw	x,#1000
8185  0d0e 89            	pushw	x
8186  0d0f 5f            	clrw	x
8187  0d10 89            	pushw	x
8188  0d11 96            	ldw	x,sp
8189  0d12 1c000b        	addw	x,#OFST+3
8190  0d15 89            	pushw	x
8191  0d16 5f            	clrw	x
8192  0d17 89            	pushw	x
8193  0d18 89            	pushw	x
8194  0d19 89            	pushw	x
8195  0d1a ae04d7        	ldw	x,#L3773
8196  0d1d 89            	pushw	x
8197  0d1e 5f            	clrw	x
8198  0d1f 89            	pushw	x
8199  0d20 a61f          	ld	a,#31
8200  0d22 cd08e0        	call	_UC_CommAT
8202  0d25 5b10          	addw	sp,#16
8203  0d27 4a            	dec	a
8204  0d28 2632          	jrne	L1773
8205                     ; 1405 		pnRecvBufEnd = (uint8_t  *)(pnRecvBuf + JX_Strlen((char *)pnRecvBuf));
8207  0d2a 1e07          	ldw	x,(OFST-1,sp)
8208  0d2c cd0315        	call	_JX_Strlen
8210  0d2f 5f            	clrw	x
8211  0d30 97            	ld	xl,a
8212  0d31 72fb07        	addw	x,(OFST-1,sp)
8213  0d34 1f05          	ldw	(OFST-3,sp),x
8214                     ; 1406 		if (((uint32_t)(pnRecvBufEnd - pnRecvBuf) < 32) && (pnRecvBuf != NULL) &&
8214                     ; 1407 			(QH_SearchStrVal((int8_t *)pnRecvBuf, (int8_t *)pnRecvBufEnd, &dwSignalStr) == TRUE))
8216  0d36 72f007        	subw	x,(OFST-1,sp)
8217  0d39 cd0000        	call	c_itolx
8219  0d3c ae0475        	ldw	x,#L245
8220  0d3f cd0000        	call	c_lcmp
8222  0d42 2418          	jruge	L1773
8224  0d44 1e07          	ldw	x,(OFST-1,sp)
8225  0d46 2714          	jreq	L1773
8227  0d48 96            	ldw	x,sp
8228  0d49 5c            	incw	x
8229  0d4a 89            	pushw	x
8230  0d4b 1e07          	ldw	x,(OFST-1,sp)
8231  0d4d 89            	pushw	x
8232  0d4e 1e0b          	ldw	x,(OFST+3,sp)
8233  0d50 cd0852        	call	_QH_SearchStrVal
8235  0d53 5b04          	addw	sp,#4
8236  0d55 4a            	dec	a
8237  0d56 2604          	jrne	L1773
8238                     ; 1409 			return ((uint8_t)dwSignalStr);
8240  0d58 7b04          	ld	a,(OFST-4,sp)
8242  0d5a 2001          	jra	L645
8243  0d5c               L1773:
8244                     ; 1413 	return (0);
8246  0d5c 4f            	clr	a
8248  0d5d               L645:
8250  0d5d 5b08          	addw	sp,#8
8251  0d5f 81            	ret	
8316                     ; 1422 uint8_t  SIMGK7M_GetCIMI(u8 *pnOutBuf, u8 nLen)
8316                     ; 1423 {
8317                     	switch	.text
8318  0d60               _SIMGK7M_GetCIMI:
8320  0d60 89            	pushw	x
8321  0d61 5204          	subw	sp,#4
8322       00000004      OFST:	set	4
8325                     ; 1427 	if (UC_CommAT(AT_CMD_CIMI, NULL, "46", NULL, NULL, NULL, &pnRecvBuf, 1000) == 1)
8327  0d63 ae03e8        	ldw	x,#1000
8328  0d66 89            	pushw	x
8329  0d67 5f            	clrw	x
8330  0d68 89            	pushw	x
8331  0d69 96            	ldw	x,sp
8332  0d6a 1c0007        	addw	x,#OFST+3
8333  0d6d 89            	pushw	x
8334  0d6e 5f            	clrw	x
8335  0d6f 89            	pushw	x
8336  0d70 89            	pushw	x
8337  0d71 89            	pushw	x
8338  0d72 ae04d4        	ldw	x,#L1304
8339  0d75 89            	pushw	x
8340  0d76 5f            	clrw	x
8341  0d77 89            	pushw	x
8342  0d78 a60d          	ld	a,#13
8343  0d7a cd08e0        	call	_UC_CommAT
8345  0d7d 5b10          	addw	sp,#16
8346  0d7f 4a            	dec	a
8347  0d80 262f          	jrne	L7204
8348                     ; 1429 		pnRecvBufEnd = (uint8_t  *)(pnRecvBuf + JX_Strlen((char *)pnRecvBuf));
8350  0d82 1e03          	ldw	x,(OFST-1,sp)
8351  0d84 cd0315        	call	_JX_Strlen
8353  0d87 5f            	clrw	x
8354  0d88 97            	ld	xl,a
8355  0d89 72fb03        	addw	x,(OFST-1,sp)
8356  0d8c 1f01          	ldw	(OFST-3,sp),x
8357                     ; 1430 		if (((uint32_t)(pnRecvBufEnd - pnRecvBuf) < 32) && (pnRecvBuf != NULL))
8359  0d8e 72f003        	subw	x,(OFST-1,sp)
8360  0d91 cd0000        	call	c_itolx
8362  0d94 ae0475        	ldw	x,#L245
8363  0d97 cd0000        	call	c_lcmp
8365  0d9a 2415          	jruge	L7204
8367  0d9c 1e03          	ldw	x,(OFST-1,sp)
8368  0d9e 2711          	jreq	L7204
8369                     ; 1432 			MemcpyFunc(pnOutBuf, pnRecvBuf, nLen);
8371  0da0 7b09          	ld	a,(OFST+5,sp)
8372  0da2 88            	push	a
8373  0da3 1e04          	ldw	x,(OFST+0,sp)
8374  0da5 89            	pushw	x
8375  0da6 1e08          	ldw	x,(OFST+4,sp)
8376  0da8 cd0000        	call	_MemcpyFunc
8378  0dab 5b03          	addw	sp,#3
8379                     ; 1433 			return TRUE;
8381  0dad a601          	ld	a,#1
8383  0daf 2001          	jra	L065
8384  0db1               L7204:
8385                     ; 1437 	return (0);
8387  0db1 4f            	clr	a
8389  0db2               L065:
8391  0db2 5b06          	addw	sp,#6
8392  0db4 81            	ret	
8457                     ; 1445 uint8_t  SIMGL868_GetCCID(u8 *pnOutBuf, u8 nLen)
8457                     ; 1446 {
8458                     	switch	.text
8459  0db5               _SIMGL868_GetCCID:
8461  0db5 89            	pushw	x
8462  0db6 5204          	subw	sp,#4
8463       00000004      OFST:	set	4
8466                     ; 1450 	if (UC_CommAT(AT_CMD_CCID, NULL, "89", NULL, NULL, NULL, &pnRecvBuf, 1000) == 1)
8468  0db8 ae03e8        	ldw	x,#1000
8469  0dbb 89            	pushw	x
8470  0dbc 5f            	clrw	x
8471  0dbd 89            	pushw	x
8472  0dbe 96            	ldw	x,sp
8473  0dbf 1c0007        	addw	x,#OFST+3
8474  0dc2 89            	pushw	x
8475  0dc3 5f            	clrw	x
8476  0dc4 89            	pushw	x
8477  0dc5 89            	pushw	x
8478  0dc6 89            	pushw	x
8479  0dc7 ae04d1        	ldw	x,#L7604
8480  0dca 89            	pushw	x
8481  0dcb 5f            	clrw	x
8482  0dcc 89            	pushw	x
8483  0dcd a609          	ld	a,#9
8484  0dcf cd08e0        	call	_UC_CommAT
8486  0dd2 5b10          	addw	sp,#16
8487  0dd4 4a            	dec	a
8488  0dd5 262f          	jrne	L5604
8489                     ; 1452 		pnRecvBufEnd = (uint8_t  *)(pnRecvBuf + JX_Strlen((char *)pnRecvBuf));
8491  0dd7 1e03          	ldw	x,(OFST-1,sp)
8492  0dd9 cd0315        	call	_JX_Strlen
8494  0ddc 5f            	clrw	x
8495  0ddd 97            	ld	xl,a
8496  0dde 72fb03        	addw	x,(OFST-1,sp)
8497  0de1 1f01          	ldw	(OFST-3,sp),x
8498                     ; 1453 		if (((uint32_t)(pnRecvBufEnd - pnRecvBuf) < 32) && (pnRecvBuf != NULL))
8500  0de3 72f003        	subw	x,(OFST-1,sp)
8501  0de6 cd0000        	call	c_itolx
8503  0de9 ae0475        	ldw	x,#L245
8504  0dec cd0000        	call	c_lcmp
8506  0def 2415          	jruge	L5604
8508  0df1 1e03          	ldw	x,(OFST-1,sp)
8509  0df3 2711          	jreq	L5604
8510                     ; 1455 			MemcpyFunc(pnOutBuf, pnRecvBuf, nLen);
8512  0df5 7b09          	ld	a,(OFST+5,sp)
8513  0df7 88            	push	a
8514  0df8 1e04          	ldw	x,(OFST+0,sp)
8515  0dfa 89            	pushw	x
8516  0dfb 1e08          	ldw	x,(OFST+4,sp)
8517  0dfd cd0000        	call	_MemcpyFunc
8519  0e00 5b03          	addw	sp,#3
8520                     ; 1456 			return TRUE;
8522  0e02 a601          	ld	a,#1
8524  0e04 2001          	jra	L275
8525  0e06               L5604:
8526                     ; 1460 	return (0);
8528  0e06 4f            	clr	a
8530  0e07               L275:
8532  0e07 5b06          	addw	sp,#6
8533  0e09 81            	ret	
8536                     	switch	.data
8537  00cf               L3704_nFailCnt:
8538  00cf 00            	dc.b	0
8647                     ; 1472 u8 AT_CmdFailProc(u8 nCmd, u8 *pnParameter, uint8_t *pnMatch1, uint8_t *pnMatch2, uint8_t *pnMatch3, 
8647                     ; 1473 					 uint8_t *pnMatch4, uint8_t **pnOutMatchPtr, uint32_t dwWaitmS)
8647                     ; 1474 {
8648                     	switch	.text
8649  0e0a               _AT_CmdFailProc:
8651  0e0a 88            	push	a
8652       00000000      OFST:	set	0
8655                     ; 1477 	if(1 != UC_CommAT(nCmd, pnParameter, pnMatch1, pnMatch2, pnMatch3, pnMatch4, pnOutMatchPtr, dwWaitmS))
8657  0e0b 1e12          	ldw	x,(OFST+18,sp)
8658  0e0d 89            	pushw	x
8659  0e0e 1e12          	ldw	x,(OFST+18,sp)
8660  0e10 89            	pushw	x
8661  0e11 1e12          	ldw	x,(OFST+18,sp)
8662  0e13 89            	pushw	x
8663  0e14 1e12          	ldw	x,(OFST+18,sp)
8664  0e16 89            	pushw	x
8665  0e17 1e12          	ldw	x,(OFST+18,sp)
8666  0e19 89            	pushw	x
8667  0e1a 1e12          	ldw	x,(OFST+18,sp)
8668  0e1c 89            	pushw	x
8669  0e1d 1e12          	ldw	x,(OFST+18,sp)
8670  0e1f 89            	pushw	x
8671  0e20 1e12          	ldw	x,(OFST+18,sp)
8672  0e22 89            	pushw	x
8673  0e23 cd08e0        	call	_UC_CommAT
8675  0e26 5b10          	addw	sp,#16
8676  0e28 4a            	dec	a
8677  0e29 271d          	jreq	L5414
8678                     ; 1479 		nFailCnt++;
8680  0e2b 725c00cf      	inc	L3704_nFailCnt
8681                     ; 1480 		if(TO_MAXCNT < nFailCnt)
8683  0e2f c600cf        	ld	a,L3704_nFailCnt
8684  0e32 a103          	cp	a,#3
8685  0e34 2519          	jrult	L1514
8686                     ; 1482 			nFailCnt = 0;
8688  0e36 725f00cf      	clr	L3704_nFailCnt
8689                     ; 1483 			m_nGprsStep = INIT_PWR_OFF;
8691  0e3a 725f00a6      	clr	_m_nGprsStep
8692                     ; 1484 			ucStatusGsm = GSM_INIT;
8694  0e3e 35010068      	mov	_ucStatusGsm,#1
8695                     ; 1485 			stRepFail.wError |= (1<<ATCMD_ERROR);
8697  0e42 72120006      	bset	_stRepFail+6,#1
8698  0e46 2007          	jra	L1514
8699  0e48               L5414:
8700                     ; 1490 		nFailCnt = 0;
8702  0e48 c700cf        	ld	L3704_nFailCnt,a
8703                     ; 1491 		return TRUE;
8705  0e4b 4c            	inc	a
8708  0e4c 5b01          	addw	sp,#1
8709  0e4e 81            	ret	
8710  0e4f               L1514:
8711                     ; 1494 	return FALSE;
8713  0e4f 4f            	clr	a
8716  0e50 5b01          	addw	sp,#1
8717  0e52 81            	ret	
8720                     	switch	.data
8721  00d0               L3514_nFailCnt:
8722  00d0 00            	dc.b	0
8723  00d1               L5514_nCnt:
8724  00d1 00            	dc.b	0
8796                     	switch	.const
8797  0479               L276:
8798  0479 0e6e          	dc.w	L7514
8799  047b 0e86          	dc.w	L1614
8800  047d 0eba          	dc.w	L3614
8801  047f 0ed2          	dc.w	L5614
8802  0481 0ee2          	dc.w	L7614
8803  0483 0f17          	dc.w	L1714
8804  0485 0f3e          	dc.w	L3714
8805  0487 0f6b          	dc.w	L5714
8806  0489 0f8d          	dc.w	L7714
8807  048b 0fac          	dc.w	L1024
8808  048d 0fd0          	dc.w	L3024
8809                     ; 1506 u8 M590_Init(void)
8809                     ; 1507 {
8810                     	switch	.text
8811  0e53               _M590_Init:
8813  0e53 88            	push	a
8814       00000001      OFST:	set	1
8817                     ; 1508 	uint8_t nSig = 0, nTmp = 0, nResult = 0;
8823                     ; 1512 	if(FALSE == UC_SleepProc())
8825  0e54 cd0715        	call	_UC_SleepProc
8827  0e57 4d            	tnz	a
8828  0e58 2603          	jrne	L3324
8829                     ; 1514 		return FALSE;
8833  0e5a 5b01          	addw	sp,#1
8834  0e5c 81            	ret	
8835  0e5d               L3324:
8836                     ; 1517 	switch(m_nGprsStep)
8838  0e5d c600a6        	ld	a,_m_nGprsStep
8840                     ; 1637 		default:
8840                     ; 1638 			break;
8841  0e60 a10b          	cp	a,#11
8842  0e62 2503cc102d    	jruge	L7324
8843  0e67 5f            	clrw	x
8844  0e68 97            	ld	xl,a
8845  0e69 58            	sllw	x
8846  0e6a de0479        	ldw	x,(L276,x)
8847  0e6d fc            	jp	(x)
8848  0e6e               L7514:
8849                     ; 1519 		case INIT_PWR_OFF:			
8849                     ; 1520 			SetPortGsmPowerOff();		   //断电			
8851  0e6e 4b00          	push	#0
8852  0e70 4b10          	push	#16
8853  0e72 ae500a        	ldw	x,#20490
8854  0e75 cd0000        	call	_GPIO_WriteBit
8856  0e78 85            	popw	x
8857                     ; 1521 			UC_SetSleepCnt(5000);
8859  0e79 ae1388        	ldw	x,#5000
8860  0e7c cd1031        	call	LC017
8861                     ; 1522 			m_nGprsStep = INIT_PWR_ON;
8863  0e7f 350100a6      	mov	_m_nGprsStep,#1
8864                     ; 1523 			break;
8866  0e83 cc102d        	jra	L7324
8867  0e86               L1614:
8868                     ; 1525 		case INIT_PWR_ON:
8868                     ; 1526 			TurnBusUartOn();	           //硬件串口波特率,115200 BAUDRATE_38400
8870  0e86 cd0000        	call	_TurnBusUartOn
8872                     ; 1527 			SetPortGsmResetEnable();       //软件复位			
8874  0e89 4b01          	push	#1
8875  0e8b 4b40          	push	#64
8876  0e8d ae5005        	ldw	x,#20485
8877  0e90 cd0000        	call	_GPIO_WriteBit
8879  0e93 85            	popw	x
8880                     ; 1529 			SetPortGsmResetDisable();
8882  0e94 4b00          	push	#0
8883  0e96 4b40          	push	#64
8884  0e98 ae5005        	ldw	x,#20485
8885  0e9b cd0000        	call	_GPIO_WriteBit
8887  0e9e 85            	popw	x
8888                     ; 1530 			SetPortGsmPowerOn();		   //供电
8890  0e9f 4b01          	push	#1
8891  0ea1 4b10          	push	#16
8892  0ea3 ae500a        	ldw	x,#20490
8893  0ea6 cd0000        	call	_GPIO_WriteBit
8895  0ea9 85            	popw	x
8896                     ; 1531 			SetPortSoftSwitchOn();
8898  0eaa cd1044        	call	LC019
8899                     ; 1532 			UC_SetSleepCnt(3000);
8901  0ead ae0bb8        	ldw	x,#3000
8902  0eb0 cd1031        	call	LC017
8903                     ; 1533 			m_nGprsStep = INIT_SWITCH_OFF;
8905  0eb3 350200a6      	mov	_m_nGprsStep,#2
8906                     ; 1534 			break;
8908  0eb7 cc102d        	jra	L7324
8909  0eba               L3614:
8910                     ; 1536 		case INIT_SWITCH_OFF:
8910                     ; 1537 			SetPortSoftSwitchOff();
8912  0eba 4b00          	push	#0
8913  0ebc 4b20          	push	#32
8914  0ebe ae5005        	ldw	x,#20485
8915  0ec1 cd0000        	call	_GPIO_WriteBit
8917  0ec4 85            	popw	x
8918                     ; 1538 			UC_SetSleepCnt(3000);
8920  0ec5 ae0bb8        	ldw	x,#3000
8921  0ec8 cd1031        	call	LC017
8922                     ; 1539 			m_nGprsStep = INIT_SWITCH_ON;
8924  0ecb 350300a6      	mov	_m_nGprsStep,#3
8925                     ; 1540 			break;
8927  0ecf cc102d        	jra	L7324
8928  0ed2               L5614:
8929                     ; 1542 		case INIT_SWITCH_ON:
8929                     ; 1543 			SetPortSoftSwitchOn();
8931  0ed2 cd1044        	call	LC019
8932                     ; 1544 			UC_SetSleepCnt(4000);
8934  0ed5 ae0fa0        	ldw	x,#4000
8935  0ed8 cd1031        	call	LC017
8936                     ; 1545 			m_nGprsStep = INIT_PBREADY_1;
8938  0edb 350400a6      	mov	_m_nGprsStep,#4
8939                     ; 1546 			break;
8941  0edf cc102d        	jra	L7324
8942  0ee2               L7614:
8943                     ; 1548 		case INIT_PBREADY_1: /* 等待模块上电稳定初始化OK */
8943                     ; 1549 			//SetPortSoftSwitchOn();
8943                     ; 1550 			//SetPortSoftSwitchOff();
8943                     ; 1551 			UC_SetSleepCnt(100);
8945  0ee2 ae0064        	ldw	x,#100
8946  0ee5 cd1031        	call	LC017
8947                     ; 1555 			if(FALSE == AT_CmdFailProc(AT_CMD_I, NULL, "OK", "ERROR", NULL, NULL, NULL, 3000))
8949  0ee8 ae0bb8        	ldw	x,#3000
8950  0eeb 89            	pushw	x
8951  0eec 5f            	clrw	x
8952  0eed 89            	pushw	x
8953  0eee 89            	pushw	x
8954  0eef 89            	pushw	x
8955  0ef0 89            	pushw	x
8956  0ef1 ae04f3        	ldw	x,#L1473
8957  0ef4 89            	pushw	x
8958  0ef5 ae04fb        	ldw	x,#L3424
8959  0ef8 89            	pushw	x
8960  0ef9 5f            	clrw	x
8961  0efa 89            	pushw	x
8962  0efb a608          	ld	a,#8
8963  0efd cd0e0a        	call	_AT_CmdFailProc
8965  0f00 5b10          	addw	sp,#16
8966  0f02 4d            	tnz	a
8967  0f03 2607          	jrne	L1424
8968                     ; 1557 				stRepFail.wError |= (1<<REP_NO_GPRS_MODE);
8970  0f05 72100007      	bset	_stRepFail+7,#0
8971                     ; 1558 				return FALSE;
8975  0f09 5b01          	addw	sp,#1
8976  0f0b 81            	ret	
8977  0f0c               L1424:
8978                     ; 1561 			stRepFail.wError &= ~((u16)(1<<REP_NO_GPRS_MODE));
8980  0f0c 72110007      	bres	_stRepFail+7,#0
8981                     ; 1562 			m_nGprsStep = INIT_SET_IPR;
8983  0f10 350500a6      	mov	_m_nGprsStep,#5
8984                     ; 1563 			break;
8986  0f14 cc102d        	jra	L7324
8987  0f17               L1714:
8988                     ; 1565 		case INIT_SET_IPR:
8988                     ; 1566 			if(FALSE == AT_CmdFailProc(AT_CMD_IPR, NULL, "OK", "ERROR", NULL, NULL, NULL, 3000))
8990  0f17 ae0bb8        	ldw	x,#3000
8991  0f1a 89            	pushw	x
8992  0f1b 5f            	clrw	x
8993  0f1c 89            	pushw	x
8994  0f1d 89            	pushw	x
8995  0f1e 89            	pushw	x
8996  0f1f 89            	pushw	x
8997  0f20 ae04f3        	ldw	x,#L1473
8998  0f23 89            	pushw	x
8999  0f24 ae04fb        	ldw	x,#L3424
9000  0f27 89            	pushw	x
9001  0f28 5f            	clrw	x
9002  0f29 89            	pushw	x
9003  0f2a a61d          	ld	a,#29
9004  0f2c cd0e0a        	call	_AT_CmdFailProc
9006  0f2f 5b10          	addw	sp,#16
9007  0f31 4d            	tnz	a
9008  0f32 2603          	jrne	L5424
9009                     ; 1568 				return FALSE;
9013  0f34 5b01          	addw	sp,#1
9014  0f36 81            	ret	
9015  0f37               L5424:
9016                     ; 1570 			m_nGprsStep = INIT_CPIN_2;
9018  0f37 350600a6      	mov	_m_nGprsStep,#6
9019                     ; 1571 			break;
9021  0f3b cc102d        	jra	L7324
9022  0f3e               L3714:
9023                     ; 1573 		case INIT_CPIN_2:/* 检查 SIM 卡状态 */	
9023                     ; 1574 			UC_SetSleepCnt(100);
9025  0f3e ae0064        	ldw	x,#100
9026  0f41 cd1031        	call	LC017
9027                     ; 1575 			if(FALSE == AT_CmdFailProc(AT_CMD_CPIN,	NULL, "READY", "ERROR", NULL, NULL, NULL, 1000))
9029  0f44 ae03e8        	ldw	x,#1000
9030  0f47 89            	pushw	x
9031  0f48 5f            	clrw	x
9032  0f49 89            	pushw	x
9033  0f4a 89            	pushw	x
9034  0f4b 89            	pushw	x
9035  0f4c 89            	pushw	x
9036  0f4d ae04f3        	ldw	x,#L1473
9037  0f50 89            	pushw	x
9038  0f51 ae04cb        	ldw	x,#L1524
9039  0f54 89            	pushw	x
9040  0f55 5f            	clrw	x
9041  0f56 89            	pushw	x
9042  0f57 a617          	ld	a,#23
9043  0f59 cd0e0a        	call	_AT_CmdFailProc
9045  0f5c 5b10          	addw	sp,#16
9046  0f5e 4d            	tnz	a
9047  0f5f 2603          	jrne	L7424
9048                     ; 1577 				return FALSE;
9052  0f61 5b01          	addw	sp,#1
9053  0f63 81            	ret	
9054  0f64               L7424:
9055                     ; 1579 			m_nGprsStep = INIT_IMSI_3;
9057  0f64 350700a6      	mov	_m_nGprsStep,#7
9058                     ; 1580 			break;
9060  0f68 cc102d        	jra	L7324
9061  0f6b               L5714:
9062                     ; 1582 		case INIT_IMSI_3:/* 读取 SIM 卡的 内置IMSI号 */
9062                     ; 1583 			nResult = SIMGK7M_GetCIMI(m_nImsiBuf, sizeof(m_nImsiBuf));
9064  0f6b 4b18          	push	#24
9065  0f6d ae0085        	ldw	x,#_m_nImsiBuf
9066  0f70 cd0d60        	call	_SIMGK7M_GetCIMI
9068  0f73 5b01          	addw	sp,#1
9069  0f75 6b01          	ld	(OFST+0,sp),a
9070                     ; 1584 			if((3 < nCnt++)||(nResult))
9072  0f77 cd103a        	call	LC018
9073  0f7a 2404          	jruge	L5524
9075  0f7c 7b01          	ld	a,(OFST+0,sp)
9076  0f7e 2708          	jreq	L3524
9077  0f80               L5524:
9078                     ; 1586 				nCnt = 0;
9080  0f80 725f00d1      	clr	L5514_nCnt
9081                     ; 1587 				m_nGprsStep = INIT_CCID_4;
9083  0f84 350800a6      	mov	_m_nGprsStep,#8
9084  0f88               L3524:
9085                     ; 1589 			UC_SetSleepCnt(100);
9087  0f88 ae0064        	ldw	x,#100
9089                     ; 1590 			break;
9091  0f8b 203f          	jp	LC015
9092  0f8d               L7714:
9093                     ; 1592 		case INIT_CCID_4:/* 读取 SIM 卡的 CCID */
9093                     ; 1593 			nResult = SIMGL868_GetCCID(m_nCcidBuf, sizeof(m_nCcidBuf));
9095  0f8d 4b18          	push	#24
9096  0f8f ae006d        	ldw	x,#_m_nCcidBuf
9097  0f92 cd0db5        	call	_SIMGL868_GetCCID
9099  0f95 5b01          	addw	sp,#1
9100  0f97 6b01          	ld	(OFST+0,sp),a
9101                     ; 1594 			if((3 < nCnt++)||(nResult))
9103  0f99 cd103a        	call	LC018
9104  0f9c 2404          	jruge	L1624
9106  0f9e 7b01          	ld	a,(OFST+0,sp)
9107  0fa0 2727          	jreq	L3624
9108  0fa2               L1624:
9109                     ; 1596 				nCnt = 0;
9111  0fa2 725f00d1      	clr	L5514_nCnt
9112                     ; 1597 				m_nGprsStep = INIT_CSQ_5;
9114  0fa6 350900a6      	mov	_m_nGprsStep,#9
9115                     ; 1599 			UC_SetSleepCnt(8000);
9117                     ; 1600 			break;
9119  0faa 201d          	jp	L3624
9120  0fac               L1024:
9121                     ; 1601 		case INIT_CSQ_5:/* 读取信号强度经验证此处最少延时6S查询三次，才能获得相对稳定信号 */
9121                     ; 1602 			nSig = SIMGL868_UpdateSignal();
9123  0fac cd0d04        	call	_SIMGL868_UpdateSignal
9125  0faf 6b01          	ld	(OFST+0,sp),a
9126                     ; 1603 			if((3 < nCnt++)||((15 <= nSig)&&(32 > nSig)))
9128  0fb1 cd103a        	call	LC018
9129  0fb4 240a          	jruge	L5624
9131  0fb6 7b01          	ld	a,(OFST+0,sp)
9132  0fb8 a10f          	cp	a,#15
9133  0fba 250d          	jrult	L3624
9135  0fbc a120          	cp	a,#32
9136  0fbe 2409          	jruge	L3624
9137  0fc0               L5624:
9138                     ; 1605 				m_nGprsStep = INIT_CREG_6;
9140  0fc0 350a00a6      	mov	_m_nGprsStep,#10
9141                     ; 1606 				g_nSignal = nSig;
9143  0fc4 7b01          	ld	a,(OFST+0,sp)
9144  0fc6 c70000        	ld	_g_nSignal,a
9145  0fc9               L3624:
9146                     ; 1608 			UC_SetSleepCnt(8000);
9149  0fc9 ae1f40        	ldw	x,#8000
9151  0fcc               LC015:
9152  0fcc ad63          	call	LC017
9153                     ; 1609 			break;
9155  0fce 205d          	jra	L7324
9156  0fd0               L3024:
9157                     ; 1611 		case INIT_CREG_6:   /* 已注册上 GSM 网络 */
9157                     ; 1612 			nTmp = UC_CommAT(AT_CMD_CREG,	NULL, "+CREG: 0,1", "+CREG: 0,5", "ERROR", NULL, NULL, 1000);
9159  0fd0 ae03e8        	ldw	x,#1000
9160  0fd3 89            	pushw	x
9161  0fd4 5f            	clrw	x
9162  0fd5 89            	pushw	x
9163  0fd6 89            	pushw	x
9164  0fd7 89            	pushw	x
9165  0fd8 ae04f3        	ldw	x,#L1473
9166  0fdb 89            	pushw	x
9167  0fdc ae04dd        	ldw	x,#L7373
9168  0fdf 89            	pushw	x
9169  0fe0 ae04e8        	ldw	x,#L5373
9170  0fe3 89            	pushw	x
9171  0fe4 5f            	clrw	x
9172  0fe5 89            	pushw	x
9173  0fe6 a61a          	ld	a,#26
9174  0fe8 cd08e0        	call	_UC_CommAT
9176  0feb 5b10          	addw	sp,#16
9177  0fed 6b01          	ld	(OFST+0,sp),a
9178                     ; 1613 			if((nTmp != 1)&&(nTmp != 2))
9180  0fef a101          	cp	a,#1
9181  0ff1 2724          	jreq	L7624
9183  0ff3 a102          	cp	a,#2
9184  0ff5 2720          	jreq	L7624
9185                     ; 1615 				if(TO_MAXCNT < nFailCnt++)
9187  0ff7 c600d0        	ld	a,L3514_nFailCnt
9188  0ffa 725c00d0      	inc	L3514_nFailCnt
9189  0ffe a103          	cp	a,#3
9190  1000 250c          	jrult	L1724
9191                     ; 1617 					stRepFail.wError |= (1<<REP_REG_FAIL);
9193  1002 72120007      	bset	_stRepFail+7,#1
9194                     ; 1618 					nFailCnt = 0;
9196  1006 725f00d0      	clr	L3514_nFailCnt
9197                     ; 1619 					m_nGprsStep = INIT_PWR_OFF;
9199  100a 725f00a6      	clr	_m_nGprsStep
9200  100e               L1724:
9201                     ; 1621 				UC_SetSleepCnt(1000);
9203  100e ae03e8        	ldw	x,#1000
9204  1011 ad1e          	call	LC017
9205                     ; 1622 				return FALSE;
9207  1013 4f            	clr	a
9210  1014 5b01          	addw	sp,#1
9211  1016 81            	ret	
9212  1017               L7624:
9213                     ; 1626 				nFailCnt = 0;
9215  1017 725f00d0      	clr	L3514_nFailCnt
9216                     ; 1629 			m_nGprsStep = PPP_CGATT_0;
9218  101b 725f00a6      	clr	_m_nGprsStep
9219                     ; 1633 			stRepFail.wError &= ~((u16)(1<<REP_REG_FAIL));
9221  101f 72130007      	bres	_stRepFail+7,#1
9222                     ; 1634 			UC_SetSleepCnt(100);
9224  1023 ae0064        	ldw	x,#100
9225  1026 ad09          	call	LC017
9226                     ; 1635 			return TRUE;
9228  1028 a601          	ld	a,#1
9231  102a 5b01          	addw	sp,#1
9232  102c 81            	ret	
9233                     ; 1637 		default:
9233                     ; 1638 			break;
9235  102d               L7324:
9236                     ; 1640 	return FALSE;
9238  102d 4f            	clr	a
9241  102e 5b01          	addw	sp,#1
9242  1030 81            	ret	
9244  1031               LC017:
9245  1031 89            	pushw	x
9246  1032 5f            	clrw	x
9247  1033 89            	pushw	x
9248  1034 cd070a        	call	_UC_SetSleepCnt
9250  1037 5b04          	addw	sp,#4
9251  1039 81            	ret	
9252  103a               LC018:
9253  103a c600d1        	ld	a,L5514_nCnt
9254  103d 725c00d1      	inc	L5514_nCnt
9255  1041 a104          	cp	a,#4
9256  1043 81            	ret	
9257  1044               LC019:
9258  1044 4b01          	push	#1
9259  1046 4b20          	push	#32
9260  1048 ae5005        	ldw	x,#20485
9261  104b cd0000        	call	_GPIO_WriteBit
9263  104e 85            	popw	x
9264  104f 81            	ret	
9297                     ; 1652 s8 M590_HandShake(void)
9297                     ; 1653 {
9298                     	switch	.text
9299  1050               _M590_HandShake:
9303                     ; 1655 	if(FALSE == UC_SleepProc())
9305  1050 cd0715        	call	_UC_SleepProc
9307  1053 4d            	tnz	a
9308  1054 2601          	jrne	L1234
9309                     ; 1657 		return FALSE;
9313  1056 81            	ret	
9314  1057               L1234:
9315                     ; 1659 	switch(m_nGprsStep)
9317  1057 c600a6        	ld	a,_m_nGprsStep
9319                     ; 1714 	default:
9319                     ; 1715 		break;
9320  105a 2715          	jreq	L5724
9321  105c 4a            	dec	a
9322  105d 273d          	jreq	L7724
9323  105f 4a            	dec	a
9324  1060 2765          	jreq	L1034
9325  1062 4a            	dec	a
9326  1063 2603cc10ef    	jreq	L3034
9327  1068 4a            	dec	a
9328  1069 2603cc1142    	jreq	L5034
9329  106e cc116c        	jra	L5234
9330  1071               L5724:
9331                     ; 1662 	case PPP_CGATT_0: /* GPRS附着 */		
9331                     ; 1663 		UC_SetSleepCnt(100);
9333  1071 ae0064        	ldw	x,#100
9334  1074 cd116e        	call	LC020
9335  1077 89            	pushw	x
9336  1078 5f            	clrw	x
9337  1079 89            	pushw	x
9338  107a 89            	pushw	x
9339  107b 89            	pushw	x
9340  107c 89            	pushw	x
9341  107d ae04f3        	ldw	x,#L1473
9342  1080 89            	pushw	x
9343  1081 ae04fb        	ldw	x,#L3424
9344  1084 89            	pushw	x
9345  1085 ae0002        	ldw	x,#_aucAtPAscii_1
9346  1088 89            	pushw	x
9347  1089 a637          	ld	a,#55
9348  108b cd0e0a        	call	_AT_CmdFailProc
9350  108e 5b10          	addw	sp,#16
9351  1090 4d            	tnz	a
9352  1091 2602          	jrne	L7234
9353                     ; 1666 			return ERROR;
9355  1093 4a            	dec	a
9358  1094 81            	ret	
9359  1095               L7234:
9360                     ; 1668 		m_nGprsStep = PPP_CSTT_1;
9362  1095 350100a6      	mov	_m_nGprsStep,#1
9363                     ; 1669 		break;
9365  1099 cc116c        	jra	L5234
9366  109c               L7724:
9367                     ; 1670 	case PPP_CSTT_1: /* 设置APN */
9367                     ; 1671 		UC_SetSleepCnt(100);
9369  109c ae0064        	ldw	x,#100
9370  109f cd116e        	call	LC020
9371  10a2 89            	pushw	x
9372  10a3 5f            	clrw	x
9373  10a4 89            	pushw	x
9374  10a5 89            	pushw	x
9375  10a6 89            	pushw	x
9376  10a7 89            	pushw	x
9377  10a8 ae04f3        	ldw	x,#L1473
9378  10ab 89            	pushw	x
9379  10ac ae04fb        	ldw	x,#L3424
9380  10af 89            	pushw	x
9381  10b0 ae0001        	ldw	x,#_g_nApnBuf
9382  10b3 89            	pushw	x
9383  10b4 a639          	ld	a,#57
9384  10b6 cd0e0a        	call	_AT_CmdFailProc
9386  10b9 5b10          	addw	sp,#16
9387  10bb 4d            	tnz	a
9388  10bc 2602          	jrne	L1334
9389                     ; 1675 			return ERROR;
9391  10be 4a            	dec	a
9394  10bf 81            	ret	
9395  10c0               L1334:
9396                     ; 1677 		m_nGprsStep = PPP_CIICR_2;
9398  10c0 350200a6      	mov	_m_nGprsStep,#2
9399                     ; 1678 		break;
9401  10c4 cc116c        	jra	L5234
9402  10c7               L1034:
9403                     ; 1680 	case PPP_CIICR_2: /* 激活移动场景，开启 GPRS 或 CSD 无线连接 */
9403                     ; 1681 		UC_SetSleepCnt(3000);
9405  10c7 ae0bb8        	ldw	x,#3000
9406  10ca cd116e        	call	LC020
9407  10cd 89            	pushw	x
9408  10ce 5f            	clrw	x
9409  10cf 89            	pushw	x
9410  10d0 89            	pushw	x
9411  10d1 89            	pushw	x
9412  10d2 89            	pushw	x
9413  10d3 ae04f3        	ldw	x,#L1473
9414  10d6 89            	pushw	x
9415  10d7 ae04fb        	ldw	x,#L3424
9416  10da 89            	pushw	x
9417  10db 5f            	clrw	x
9418  10dc 89            	pushw	x
9419  10dd a644          	ld	a,#68
9420  10df cd0e0a        	call	_AT_CmdFailProc
9422  10e2 5b10          	addw	sp,#16
9423  10e4 4d            	tnz	a
9424  10e5 2602          	jrne	L3334
9425                     ; 1684 			return ERROR;
9427  10e7 4a            	dec	a
9430  10e8 81            	ret	
9431  10e9               L3334:
9432                     ; 1686 		m_nGprsStep = PPP_CIFSR_3;
9434  10e9 350300a6      	mov	_m_nGprsStep,#3
9435                     ; 1687 		break;
9437  10ed 207d          	jra	L5234
9438  10ef               L3034:
9439                     ; 1689 	case PPP_CIFSR_3: /* 获取IP */
9439                     ; 1690 		UC_SetSleepCnt(100);
9441  10ef ae0064        	ldw	x,#100
9442  10f2 ad7a          	call	LC020
9443  10f4 89            	pushw	x
9444  10f5 5f            	clrw	x
9445  10f6 89            	pushw	x
9446  10f7 89            	pushw	x
9447  10f8 89            	pushw	x
9448  10f9 89            	pushw	x
9449  10fa ae04f3        	ldw	x,#L1473
9450  10fd 89            	pushw	x
9451  10fe ae04fb        	ldw	x,#L3424
9452  1101 89            	pushw	x
9453  1102 5f            	clrw	x
9454  1103 89            	pushw	x
9455  1104 a643          	ld	a,#67
9456  1106 cd08e0        	call	_UC_CommAT
9458  1109 5b10          	addw	sp,#16
9459  110b a102          	cp	a,#2
9460  110d 2629          	jrne	L5334
9461                     ; 1693 			if(TO_MAXCNT < m_nCnt++)
9463  110f c600ca        	ld	a,L1071_m_nCnt
9464  1112 725c00ca      	inc	L1071_m_nCnt
9465  1116 a103          	cp	a,#3
9466  1118 2510          	jrult	L7334
9467                     ; 1695 				m_nCnt = 0;
9469  111a 725f00ca      	clr	L1071_m_nCnt
9470                     ; 1696 				m_nGprsStep = INIT_PWR_OFF;
9472  111e 725f00a6      	clr	_m_nGprsStep
9473                     ; 1697 				ucStatusGsm = GSM_INIT;
9475  1122 35010068      	mov	_ucStatusGsm,#1
9476                     ; 1698 				stRepFail.wError |= (1<<ATCMD_ERROR);
9478  1126 72120006      	bset	_stRepFail+6,#1
9479  112a               L7334:
9480                     ; 1700 			UC_SetSleepCnt(1000);
9482  112a ae03e8        	ldw	x,#1000
9483  112d 89            	pushw	x
9484  112e 5f            	clrw	x
9485  112f 89            	pushw	x
9486  1130 cd070a        	call	_UC_SetSleepCnt
9488  1133 5b04          	addw	sp,#4
9489                     ; 1701 			return ERROR;
9491  1135 a6ff          	ld	a,#255
9494  1137 81            	ret	
9495  1138               L5334:
9496                     ; 1703 		m_nCnt = 0;
9498  1138 725f00ca      	clr	L1071_m_nCnt
9499                     ; 1704 		m_nGprsStep = PPP_ATE0_4;
9501  113c 350400a6      	mov	_m_nGprsStep,#4
9502                     ; 1705 		break;		
9504  1140 202a          	jra	L5234
9505  1142               L5034:
9506                     ; 1706 	case PPP_ATE0_4: /* 关闭回显 */
9506                     ; 1707 		UC_SetSleepCnt(100);
9508  1142 ae0064        	ldw	x,#100
9509  1145 ad27          	call	LC020
9510  1147 89            	pushw	x
9511  1148 5f            	clrw	x
9512  1149 89            	pushw	x
9513  114a 89            	pushw	x
9514  114b 89            	pushw	x
9515  114c 89            	pushw	x
9516  114d ae04f3        	ldw	x,#L1473
9517  1150 89            	pushw	x
9518  1151 ae04fb        	ldw	x,#L3424
9519  1154 89            	pushw	x
9520  1155 ae0004        	ldw	x,#_aucAtPAscii_0
9521  1158 89            	pushw	x
9522  1159 a601          	ld	a,#1
9523  115b cd0e0a        	call	_AT_CmdFailProc
9525  115e 5b10          	addw	sp,#16
9526  1160 4d            	tnz	a
9527  1161 2602          	jrne	L1434
9528                     ; 1710 			return ERROR;
9530  1163 4a            	dec	a
9533  1164 81            	ret	
9534  1165               L1434:
9535                     ; 1712 		m_nGprsStep = PPP_CGATT_0;
9537  1165 725f00a6      	clr	_m_nGprsStep
9538                     ; 1713 		return TRUE;
9540  1169 a601          	ld	a,#1
9543  116b 81            	ret	
9544                     ; 1714 	default:
9544                     ; 1715 		break;
9546  116c               L5234:
9547                     ; 1792 	return FALSE;
9549  116c 4f            	clr	a
9552  116d 81            	ret	
9554  116e               LC020:
9555  116e 89            	pushw	x
9556  116f 5f            	clrw	x
9557  1170 89            	pushw	x
9558  1171 cd070a        	call	_UC_SetSleepCnt
9560  1174 5b04          	addw	sp,#4
9561                     ; 1664 		if(FALSE == AT_CmdFailProc(AT_CMD_CGATT, (u8 *)aucAtPAscii_1, "OK", "ERROR", NULL, NULL, NULL, 1000))
9563  1176 ae03e8        	ldw	x,#1000
9564  1179 81            	ret	
9593                     ; 1804 u8 M590_CloseConnect(void)
9593                     ; 1805 {	
9594                     	switch	.text
9595  117a               _M590_CloseConnect:
9599                     ; 1807 		SetIO_LEDOff();
9601  117a 4b00          	push	#0
9602  117c 4b04          	push	#4
9603  117e ae5005        	ldw	x,#20485
9604  1181 cd0000        	call	_GPIO_WriteBit
9606  1184 4f            	clr	a
9607  1185 85            	popw	x
9608                     ; 1811 		SetLogonMode(UP_LOGIN);
9610  1186 cd0033        	call	_SetLogonMode
9612                     ; 1814 	m_nGprsStep = INIT_PWR_OFF;
9614  1189 725f00a6      	clr	_m_nGprsStep
9615                     ; 1817 	FeedSoftWareIwdg();
9617  118d cd0000        	call	_FeedSoftWareIwdg
9619                     ; 1820 	UC_CommAT(AT_CMD_TCPCLOSE, NULL, "OK", "ERROR", NULL, NULL, NULL, 1000);
9621  1190 ae03e8        	ldw	x,#1000
9622  1193 89            	pushw	x
9623  1194 5f            	clrw	x
9624  1195 89            	pushw	x
9625  1196 89            	pushw	x
9626  1197 89            	pushw	x
9627  1198 89            	pushw	x
9628  1199 ae04f3        	ldw	x,#L1473
9629  119c 89            	pushw	x
9630  119d ae04fb        	ldw	x,#L3424
9631  11a0 89            	pushw	x
9632  11a1 5f            	clrw	x
9633  11a2 89            	pushw	x
9634  11a3 a63b          	ld	a,#59
9635  11a5 cd08e0        	call	_UC_CommAT
9637  11a8 5b10          	addw	sp,#16
9638                     ; 1821 	delay_ms(50);
9640  11aa ad5e          	call	LC021
9641  11ac 89            	pushw	x
9642  11ad 5f            	clrw	x
9643  11ae 89            	pushw	x
9644  11af 89            	pushw	x
9645  11b0 89            	pushw	x
9646  11b1 89            	pushw	x
9647  11b2 ae04f3        	ldw	x,#L1473
9648  11b5 89            	pushw	x
9649  11b6 ae04fb        	ldw	x,#L3424
9650  11b9 89            	pushw	x
9651  11ba 5f            	clrw	x
9652  11bb 89            	pushw	x
9653  11bc a657          	ld	a,#87
9654  11be cd08e0        	call	_UC_CommAT
9656  11c1 5b10          	addw	sp,#16
9657                     ; 1825 	delay_ms(50);
9659  11c3 ae0032        	ldw	x,#50
9660  11c6 cd0000        	call	_delay_ms
9662                     ; 1828 	FeedSoftWareIwdg();
9664  11c9 cd0000        	call	_FeedSoftWareIwdg
9666                     ; 1831 	UC_CommAT(AT_CMD_CGATT, (u8 *)aucAtPAscii_0, "OK", "ERROR", NULL, NULL, NULL, 1000);
9668  11cc ae03e8        	ldw	x,#1000
9669  11cf 89            	pushw	x
9670  11d0 5f            	clrw	x
9671  11d1 89            	pushw	x
9672  11d2 89            	pushw	x
9673  11d3 89            	pushw	x
9674  11d4 89            	pushw	x
9675  11d5 ae04f3        	ldw	x,#L1473
9676  11d8 89            	pushw	x
9677  11d9 ae04fb        	ldw	x,#L3424
9678  11dc 89            	pushw	x
9679  11dd ae0004        	ldw	x,#_aucAtPAscii_0
9680  11e0 89            	pushw	x
9681  11e1 a637          	ld	a,#55
9682  11e3 cd08e0        	call	_UC_CommAT
9684  11e6 5b10          	addw	sp,#16
9685                     ; 1832 	delay_ms(50);
9687  11e8 ad20          	call	LC021
9688  11ea 89            	pushw	x
9689  11eb 5f            	clrw	x
9690  11ec 89            	pushw	x
9691  11ed 89            	pushw	x
9692  11ee 89            	pushw	x
9693  11ef 89            	pushw	x
9694  11f0 ae04f3        	ldw	x,#L1473
9695  11f3 89            	pushw	x
9696  11f4 ae04fb        	ldw	x,#L3424
9697  11f7 89            	pushw	x
9698  11f8 5f            	clrw	x
9699  11f9 89            	pushw	x
9700  11fa a619          	ld	a,#25
9701  11fc cd08e0        	call	_UC_CommAT
9703  11ff 5b10          	addw	sp,#16
9704                     ; 1836 	delay_ms(50);
9706  1201 ae0032        	ldw	x,#50
9707  1204 cd0000        	call	_delay_ms
9709                     ; 1839 	return TRUE;	
9711  1207 a601          	ld	a,#1
9714  1209 81            	ret	
9716  120a               LC021:
9717  120a ae0032        	ldw	x,#50
9718  120d cd0000        	call	_delay_ms
9720                     ; 1835 	UC_CommAT(AT_CMD_CPWROFF, NULL, "OK", "ERROR", NULL, NULL, NULL, 1000);
9722  1210 ae03e8        	ldw	x,#1000
9723  1213 81            	ret	
9768                     ; 1851 u8 M590_ConnectServer(u8 nBkFlg)
9768                     ; 1852 {
9769                     	switch	.text
9770  1214               _M590_ConnectServer:
9772  1214 88            	push	a
9773       00000001      OFST:	set	1
9776                     ; 1853 	u8 nRef = 0;
9778  1215 0f01          	clr	(OFST+0,sp)
9779                     ; 1863 	if(FALSE == nBkFlg)
9781  1217 4d            	tnz	a
9782  1218 263a          	jrne	L1734
9783                     ; 1865 		nRef = UC_CommATExt(AT_CMD_TCPSETUP, (u8 *)aucAtPServer1, (u8 *)aucAtPPort1, NULL,"CONNECT OK", "ALREADY CONNECT", "CONNECT FAIL", "ERROR", NULL, 20000);
9785  121a ae4e20        	ldw	x,#20000
9786  121d 89            	pushw	x
9787  121e 5f            	clrw	x
9788  121f 89            	pushw	x
9789  1220 89            	pushw	x
9790  1221 ae04f3        	ldw	x,#L1473
9791  1224 89            	pushw	x
9792  1225 ae04a3        	ldw	x,#L7734
9793  1228 89            	pushw	x
9794  1229 ae04b0        	ldw	x,#L5734
9795  122c 89            	pushw	x
9796  122d ae04c0        	ldw	x,#L3734
9797  1230 89            	pushw	x
9798  1231 5f            	clrw	x
9799  1232 89            	pushw	x
9800  1233 ae0049        	ldw	x,#_aucAtPPort1
9801  1236 89            	pushw	x
9802  1237 ae0035        	ldw	x,#_aucAtPServer1
9803  123a 89            	pushw	x
9804  123b a63e          	ld	a,#62
9805  123d cd0aba        	call	_UC_CommATExt
9807  1240 5b14          	addw	sp,#20
9808  1242 6b01          	ld	(OFST+0,sp),a
9809                     ; 1866 		if((1 != nRef)&&(2 != nRef))
9811  1244 a101          	cp	a,#1
9812  1246 2746          	jreq	L3044
9814  1248 a102          	cp	a,#2
9815  124a 2742          	jreq	L3044
9816                     ; 1868 			stRepFail.wError |= (1<<REP_CONNECT_FAIL);
9818  124c 72140007      	bset	_stRepFail+7,#2
9819                     ; 1869 			return FALSE;
9821  1250 4f            	clr	a
9824  1251 5b01          	addw	sp,#1
9825  1253 81            	ret	
9826  1254               L1734:
9827                     ; 1874 		nRef = UC_CommATExt(AT_CMD_TCPSETUP, (u8 *)aucAtPServerBk, (u8 *)aucAtPPortBk, NULL,"CONNECT OK", "ALREADY CONNECT", "CONNECT FAIL", "ERROR", NULL, 20000);
9829  1254 ae4e20        	ldw	x,#20000
9830  1257 89            	pushw	x
9831  1258 5f            	clrw	x
9832  1259 89            	pushw	x
9833  125a 89            	pushw	x
9834  125b ae04f3        	ldw	x,#L1473
9835  125e 89            	pushw	x
9836  125f ae04a3        	ldw	x,#L7734
9837  1262 89            	pushw	x
9838  1263 ae04b0        	ldw	x,#L5734
9839  1266 89            	pushw	x
9840  1267 ae04c0        	ldw	x,#L3734
9841  126a 89            	pushw	x
9842  126b 5f            	clrw	x
9843  126c 89            	pushw	x
9844  126d ae0065        	ldw	x,#_aucAtPPortBk
9845  1270 89            	pushw	x
9846  1271 ae0051        	ldw	x,#_aucAtPServerBk
9847  1274 89            	pushw	x
9848  1275 a63e          	ld	a,#62
9849  1277 cd0aba        	call	_UC_CommATExt
9851  127a 5b14          	addw	sp,#20
9852  127c 6b01          	ld	(OFST+0,sp),a
9853                     ; 1875 		if((1 != nRef)&&(2 != nRef))
9855  127e a101          	cp	a,#1
9856  1280 270c          	jreq	L3044
9858  1282 a102          	cp	a,#2
9859  1284 2708          	jreq	L3044
9860                     ; 1877 			stRepFail.wError |= (1<<REP_CONNECT_FAIL);
9862  1286 72140007      	bset	_stRepFail+7,#2
9863                     ; 1878 			return FALSE;
9865  128a 4f            	clr	a
9868  128b 5b01          	addw	sp,#1
9869  128d 81            	ret	
9870  128e               L3044:
9871                     ; 1881 	UC_SleepFunc(100);
9873  128e ae0064        	ldw	x,#100
9874  1291 89            	pushw	x
9875  1292 5f            	clrw	x
9876  1293 89            	pushw	x
9877  1294 cd075f        	call	_UC_SleepFunc
9879  1297 5b04          	addw	sp,#4
9880                     ; 1883 	stRepFail.wError &= ~((u16)(1<<REP_CONNECT_FAIL));
9882  1299 72150007      	bres	_stRepFail+7,#2
9883                     ; 1884 	return TRUE;	
9885  129d a601          	ld	a,#1
9888  129f 5b01          	addw	sp,#1
9889  12a1 81            	ret	
9931                     ; 1896 s8 M590_TcpSendDatLen(u8 nLen)
9931                     ; 1897 {
9932                     	switch	.text
9933  12a2               _M590_TcpSendDatLen:
9935  12a2 88            	push	a
9936  12a3 88            	push	a
9937       00000001      OFST:	set	1
9940                     ; 1898 	s8 nRef = FALSE;
9942  12a4 0f01          	clr	(OFST+0,sp)
9943                     ; 1900 	if(0 == nLen)
9945  12a6 4d            	tnz	a
9946                     ; 1902 		return FALSE;
9949  12a7 2739          	jreq	L677
9950                     ; 1905 	ucNumberMessage = nLen;
9952  12a9 7b02          	ld	a,(OFST+1,sp)
9953  12ab c7006b        	ld	_ucNumberMessage,a
9954                     ; 1908 	nRef = UC_CommATExt(AT_CMD_TCPSEND, NULL, NULL, NULL, ">", "ERROR", "Link Closed", NULL, NULL, 4000);
9956  12ae ae0fa0        	ldw	x,#4000
9957  12b1 89            	pushw	x
9958  12b2 5f            	clrw	x
9959  12b3 89            	pushw	x
9960  12b4 89            	pushw	x
9961  12b5 89            	pushw	x
9962  12b6 ae0497        	ldw	x,#L1344
9963  12b9 89            	pushw	x
9964  12ba ae04f3        	ldw	x,#L1473
9965  12bd 89            	pushw	x
9966  12be ae04f9        	ldw	x,#L7244
9967  12c1 89            	pushw	x
9968  12c2 5f            	clrw	x
9969  12c3 89            	pushw	x
9970  12c4 89            	pushw	x
9971  12c5 89            	pushw	x
9972  12c6 a63d          	ld	a,#61
9973  12c8 cd0aba        	call	_UC_CommATExt
9975  12cb 5b14          	addw	sp,#20
9976  12cd 6b01          	ld	(OFST+0,sp),a
9977                     ; 1909 	UC_SleepFunc(100);
9979  12cf ae0064        	ldw	x,#100
9980  12d2 89            	pushw	x
9981  12d3 5f            	clrw	x
9982  12d4 89            	pushw	x
9983  12d5 cd075f        	call	_UC_SleepFunc
9985  12d8 5b04          	addw	sp,#4
9986                     ; 1911 	if(1 == nRef)
9988  12da 7b01          	ld	a,(OFST+0,sp)
9989  12dc a101          	cp	a,#1
9990  12de 2604          	jrne	L3344
9991                     ; 1913 		return TRUE;	
9993  12e0 a601          	ld	a,#1
9995  12e2               L677:
9997  12e2 85            	popw	x
9998  12e3 81            	ret	
9999  12e4               L3344:
10000                     ; 1915 	else if((2 == nRef) || (3 == nRef))
10002  12e4 a102          	cp	a,#2
10003  12e6 2704          	jreq	L1444
10005  12e8 a103          	cp	a,#3
10006  12ea 2604          	jrne	L7344
10007  12ec               L1444:
10008                     ; 1917 		return -1;
10010  12ec a6ff          	ld	a,#255
10012  12ee 20f2          	jra	L677
10013  12f0               L7344:
10014                     ; 1921 		return FALSE;
10016  12f0 4f            	clr	a
10018  12f1 20ef          	jra	L677
10042                     ; 1934 u8 WatitDataSendOk(void)
10042                     ; 1935 {
10043                     	switch	.text
10044  12f3               _WatitDataSendOk:
10048                     ; 1937 	if(1 != UC_CommAT(AT_CMD_NULL, NULL, "OK", "ERROR", NULL, NULL, NULL, 20000))
10050  12f3 ae4e20        	ldw	x,#20000
10051  12f6 89            	pushw	x
10052  12f7 5f            	clrw	x
10053  12f8 89            	pushw	x
10054  12f9 89            	pushw	x
10055  12fa 89            	pushw	x
10056  12fb 89            	pushw	x
10057  12fc ae04f3        	ldw	x,#L1473
10058  12ff 89            	pushw	x
10059  1300 ae04fb        	ldw	x,#L3424
10060  1303 89            	pushw	x
10061  1304 5f            	clrw	x
10062  1305 89            	pushw	x
10063  1306 a6ff          	ld	a,#255
10064  1308 cd08e0        	call	_UC_CommAT
10066  130b 5b10          	addw	sp,#16
10067  130d 4a            	dec	a
10068  130e 2702          	jreq	L5544
10069                     ; 1942 		return FALSE;
10071  1310 4f            	clr	a
10074  1311 81            	ret	
10075  1312               L5544:
10076                     ; 1944 	return TRUE;
10078  1312 4c            	inc	a
10081  1313 81            	ret	
10126                     ; 1958 void ReWriteRepFlg(void)
10126                     ; 1959 {
10127                     	switch	.text
10128  1314               _ReWriteRepFlg:
10130  1314 520d          	subw	sp,#13
10131       0000000d      OFST:	set	13
10134                     ; 1960 	u8 nLoop = 0;
10136                     ; 1963 	for(nLoop = 0; nLoop <= m_nRepIndex; nLoop++)
10138  1316 0f01          	clr	(OFST-12,sp)
10140  1318 2031          	jra	L3054
10141  131a               L7744:
10142                     ; 1965 		ReadRecord(nLoop, (u8*)&stRecord, sizeof(stRecord));
10144  131a 4b0c          	push	#12
10145  131c 96            	ldw	x,sp
10146  131d 1c0003        	addw	x,#OFST-10
10147  1320 89            	pushw	x
10148  1321 7b04          	ld	a,(OFST-9,sp)
10149  1323 cd0000        	call	_ReadRecord
10151  1326 5b03          	addw	sp,#3
10152                     ; 1966 		stRecord.nRepFlg = FALSE;		
10154  1328 0f0d          	clr	(OFST+0,sp)
10155                     ; 1967 		if(FALSE == EditRecord(nLoop,(u8*)&stRecord, sizeof(stRecord)))
10157  132a 4b0c          	push	#12
10158  132c 96            	ldw	x,sp
10159  132d 1c0003        	addw	x,#OFST-10
10160  1330 89            	pushw	x
10161  1331 7b04          	ld	a,(OFST-9,sp)
10162  1333 cd0000        	call	_EditRecord
10164  1336 5b03          	addw	sp,#3
10165  1338 4d            	tnz	a
10166  1339 260e          	jrne	L7054
10167                     ; 1969 			EditRecord(nLoop,(u8*)&stRecord, sizeof(stRecord));
10169  133b 4b0c          	push	#12
10170  133d 96            	ldw	x,sp
10171  133e 1c0003        	addw	x,#OFST-10
10172  1341 89            	pushw	x
10173  1342 7b04          	ld	a,(OFST-9,sp)
10174  1344 cd0000        	call	_EditRecord
10176  1347 5b03          	addw	sp,#3
10177  1349               L7054:
10178                     ; 1963 	for(nLoop = 0; nLoop <= m_nRepIndex; nLoop++)
10180  1349 0c01          	inc	(OFST-12,sp)
10181  134b               L3054:
10184  134b 7b01          	ld	a,(OFST-12,sp)
10185  134d c100bc        	cp	a,_m_nRepIndex
10186  1350 23c8          	jrule	L7744
10187                     ; 1972 }
10190  1352 5b0d          	addw	sp,#13
10191  1354 81            	ret	
10215                     ; 3823 u8 GetLedFlg(void)
10215                     ; 3824 {
10216                     	switch	.text
10217  1355               _GetLedFlg:
10221                     ; 3825 	return m_nLedFlashFlg;
10223  1355 c600bf        	ld	a,_m_nLedFlashFlg
10226  1358 81            	ret	
10250                     ; 3836 u8 GetGprsConntStat(void)
10250                     ; 3837 {
10251                     	switch	.text
10252  1359               _GetGprsConntStat:
10256                     ; 3838 	return ucStatusGsm;
10258  1359 c60068        	ld	a,_ucStatusGsm
10261  135c 81            	ret	
10285                     ; 3850 u8 GetOnLineStatus(void)
10285                     ; 3851 {
10286                     	switch	.text
10287  135d               _GetOnLineStatus:
10291                     ; 3852 	return ucLogonMode;
10293  135d c6006a        	ld	a,_ucLogonMode
10296  1360 81            	ret	
10320                     ; 3864 u16 GetTermReportTime(void)
10320                     ; 3865 {
10321                     	switch	.text
10322  1361               _GetTermReportTime:
10326                     ; 3866 	return g_wTmReportCnt;
10328  1361 ce00ab        	ldw	x,_g_wTmReportCnt
10331  1364 81            	ret	
10334                     	switch	.data
10335  00d2               L1554_dwDelayCnt:
10336  00d2 00000000      	dc.l	0
10384                     ; 3878 void ReportTimeOutPro(void)
10384                     ; 3879 {
10385                     	switch	.text
10386  1365               _ReportTimeOutPro:
10388  1365 5204          	subw	sp,#4
10389       00000004      OFST:	set	4
10392                     ; 3881 	u32 dwTemp = 0;
10394  1367 5f            	clrw	x
10395  1368 1f03          	ldw	(OFST-1,sp),x
10396  136a 1f01          	ldw	(OFST-3,sp),x
10397                     ; 3883 	if(FALSE != bNeedReport)
10399  136c c60019        	ld	a,_tyGSMFlag
10400  136f 2626          	jrne	L6401
10401                     ; 3885 		return ;
10403                     ; 3889 	dwTemp = GetSysTemTick();
10405  1371 cd0000        	call	_GetSysTemTick
10407  1374 96            	ldw	x,sp
10408  1375 5c            	incw	x
10409  1376 cd0000        	call	c_rtol
10411                     ; 3890 	if(REPROT_DELAY < dwTemp-dwDelayCnt)
10413  1379 96            	ldw	x,sp
10414  137a 5c            	incw	x
10415  137b cd0000        	call	c_ltor
10417  137e ae00d2        	ldw	x,#L1554_dwDelayCnt
10418  1381 cd0000        	call	c_lsub
10420  1384 cd0000        	call	c_lrzmp
10422  1387 270e          	jreq	L6401
10423                     ; 3892 		if(0 == dwDelayCnt)
10425  1389 cd0000        	call	c_lzmp
10427  138c 260c          	jrne	L7754
10428                     ; 3894 			dwDelayCnt = GetSysTemTick();
10430  138e cd0000        	call	_GetSysTemTick
10432  1391 ae00d2        	ldw	x,#L1554_dwDelayCnt
10433  1394 cd0000        	call	c_rtol
10435                     ; 3895 			return ;
10436  1397               L6401:
10439  1397 5b04          	addw	sp,#4
10440  1399 81            	ret	
10441                     ; 3900 		return ;
10443  139a               L7754:
10444                     ; 3903 	LP_SetLowPwrStartFlg(LP_GPRS_FLG_OK);
10446  139a a601          	ld	a,#1
10447  139c cd0000        	call	_LP_SetLowPwrStartFlg
10449                     ; 3904 	M590_CloseConnect();
10451  139f cd117a        	call	_M590_CloseConnect
10453                     ; 3910 	if(KEY_WUAKEUP_FLG != (m_nWakeupReportFlg&KEY_WUAKEUP_FLG))
10455  13a2 720000a50d    	btjt	_m_nWakeupReportFlg,#0,L1064
10456                     ; 3912 		if(m_nDataRepSucFlg)
10458  13a7 c600be        	ld	a,_m_nDataRepSucFlg
10459  13aa 2703          	jreq	L3064
10460                     ; 3914 			ReWriteRepFlg();
10462  13ac cd1314        	call	_ReWriteRepFlg
10464  13af               L3064:
10465                     ; 3916 		UpLinkSaveReportTime();
10467  13af cd00b5        	call	_UpLinkSaveReportTime
10470  13b2 200a          	jra	L5064
10471  13b4               L1064:
10472                     ; 3920 		m_nWakeupReportFlg &=(~(KEY_WUAKEUP_FLG));
10474  13b4 721100a5      	bres	_m_nWakeupReportFlg,#0
10475                     ; 3921 		SaveReportFlag(m_nWakeupReportFlg); 
10477  13b8 c600a5        	ld	a,_m_nWakeupReportFlg
10478  13bb cd0000        	call	_SaveReportFlag
10480  13be               L5064:
10481                     ; 3924 	UC_SleepFunc(1000);
10483  13be ae03e8        	ldw	x,#1000
10484  13c1 89            	pushw	x
10485  13c2 5f            	clrw	x
10486  13c3 89            	pushw	x
10487  13c4 cd075f        	call	_UC_SleepFunc
10489  13c7 5b04          	addw	sp,#4
10490                     ; 3925 	g_nReportFlg  = FALSE;
10492  13c9 725f00ad      	clr	_g_nReportFlg
10493                     ; 3926 	return ;
10495  13cd 20c8          	jra	L6401
10528                     ; 3940 void SetReportIndex(u8 nDat)
10528                     ; 3941 {
10529                     	switch	.text
10530  13cf               _SetReportIndex:
10534                     ; 3942 	m_nRepIndex = nDat;
10536  13cf c700bc        	ld	_m_nRepIndex,a
10537                     ; 3943 }
10540  13d2 81            	ret	
10564                     ; 3954 u8 GetReportFlag(void)
10564                     ; 3955 {
10565                     	switch	.text
10566  13d3               _GetReportFlag:
10570                     ; 3956 	return g_nReportFlg;
10572  13d3 c600ad        	ld	a,_g_nReportFlg
10575  13d6 81            	ret	
10599                     ; 3968 u8 GetReportFailFlag(void)
10599                     ; 3969 {
10600                     	switch	.text
10601  13d7               _GetReportFailFlag:
10605                     ; 3970 	return m_nWakeupReportFlg;
10607  13d7 c600a5        	ld	a,_m_nWakeupReportFlg
10610  13da 81            	ret	
10613                     	switch	.data
10614  00d6               L3464_nFailCnt:
10615  00d6 00            	dc.b	0
10664                     	switch	.const
10665  048f               L0601:
10666  048f 0001d4c0      	dc.l	120000
10667                     ; 3982 void fixTaskGsmProc(void)
10667                     ; 3983 {
10668                     	switch	.text
10669  13db               _fixTaskGsmProc:
10671  13db 5205          	subw	sp,#5
10672       00000005      OFST:	set	5
10675                     ; 3984 	s8 nResult = 0;	
10677  13dd 0f05          	clr	(OFST+0,sp)
10678                     ; 3988 	m_nLedFlashFlg = TRUE;
10680  13df 350100bf      	mov	_m_nLedFlashFlg,#1
10681                     ; 3992 	if(REPROT_TIMEOUT+g_dwCommDelay < GetSysTemTick())
10683  13e3 cd0000        	call	_GetSysTemTick
10685  13e6 96            	ldw	x,sp
10686  13e7 5c            	incw	x
10687  13e8 cd0000        	call	c_rtol
10689  13eb ae00af        	ldw	x,#_g_dwCommDelay
10690  13ee cd0000        	call	c_ltor
10692  13f1 ae048f        	ldw	x,#L0601
10693  13f4 cd0000        	call	c_ladd
10695  13f7 96            	ldw	x,sp
10696  13f8 5c            	incw	x
10697  13f9 cd0000        	call	c_lcmp
10699  13fc 2409          	jruge	L3764
10700                     ; 3994 		bNeedReport = FALSE;
10702  13fe 725f0019      	clr	_tyGSMFlag
10703                     ; 3995 		M590_CloseConnect();
10705  1402 cd117a        	call	_M590_CloseConnect
10707                     ; 3996 		return ;
10709  1405 205d          	jra	L7764
10710  1407               L3764:
10711                     ; 3999 	switch (ucStatusGsm)			//发送数据
10713  1407 c60068        	ld	a,_ucStatusGsm
10715                     ; 4050 		break;
10716  140a a002          	sub	a,#2
10717  140c 2712          	jreq	L7464
10718  140e 4a            	dec	a
10719  140f 271b          	jreq	L1564
10720  1411 4a            	dec	a
10721  1412 274a          	jreq	L3564
10722                     ; 4001 	default:
10722                     ; 4002 		if(FALSE != M590_Init())
10724  1414 cd0e53        	call	_M590_Init
10726  1417 4d            	tnz	a
10727  1418 274a          	jreq	L7764
10728                     ; 4004 			ucStatusGsm = GSM_SHAKEHAND;
10730  141a 35020068      	mov	_ucStatusGsm,#2
10731  141e 2044          	jra	L7764
10732  1420               L7464:
10733                     ; 4008 	case GSM_SHAKEHAND:		
10733                     ; 4009 		if(TRUE == (nResult = M590_HandShake()))
10735  1420 cd1050        	call	_M590_HandShake
10737  1423 4a            	dec	a
10738  1424 263e          	jrne	L7764
10739                     ; 4011 			ucStatusGsm = GSM_DAIL;
10741  1426 35030068      	mov	_ucStatusGsm,#3
10742  142a 2038          	jra	L7764
10743  142c               L1564:
10744                     ; 4015 	case GSM_DAIL:
10744                     ; 4016 		if(TRUE == M590_ConnectServer(m_nIpAddBk))
10746  142c c600bb        	ld	a,_m_nIpAddBk
10747  142f cd1214        	call	_M590_ConnectServer
10749  1432 4a            	dec	a
10750  1433 2606          	jrne	L5074
10751                     ; 4018 			ucStatusGsm = GSM_SEND;
10753  1435 35040068      	mov	_ucStatusGsm,#4
10755  1439 2029          	jra	L7764
10756  143b               L5074:
10757                     ; 4022 			nFailCnt++;
10759  143b 725c00d6      	inc	L3464_nFailCnt
10760                     ; 4023 			if(TO_MAXCNT < nFailCnt)
10762  143f c600d6        	ld	a,L3464_nFailCnt
10763  1442 a103          	cp	a,#3
10764  1444 251e          	jrult	L7764
10765                     ; 4025 				nFailCnt = 0;
10767  1446 725f00d6      	clr	L3464_nFailCnt
10768                     ; 4028 				if(FALSE == m_nIpAddBk)
10770  144a c600bb        	ld	a,_m_nIpAddBk
10771  144d 2606          	jrne	L3174
10772                     ; 4030 					m_nIpAddBk = TRUE;
10774  144f 350100bb      	mov	_m_nIpAddBk,#1
10775                     ; 4031 					break;
10777  1453 200f          	jra	L7764
10778  1455               L3174:
10779                     ; 4033 				M590_CloseConnect();
10781  1455 cd117a        	call	_M590_CloseConnect
10783                     ; 4034 				ucStatusGsm = GSM_SHAKEHAND;
10785  1458 35020068      	mov	_ucStatusGsm,#2
10786  145c 2006          	jra	L7764
10787  145e               L3564:
10788                     ; 4039 	case GSM_SEND:		//发送数据.3
10788                     ; 4040 #ifdef  JASON130_PTR   //130协议
10788                     ; 4041 		JASON_130TimeOutReUpLoad();
10788                     ; 4042 		JASON_130ProtolProc();
10788                     ; 4043 #elif defined(XINJIANG_PTR)   //新疆协议
10788                     ; 4044 		XJ_TimeOutReUpLoad();
10788                     ; 4045 		XJ_ProtolProc();
10788                     ; 4046 #elif defined(HEDA_PTR)   //和达协议	
10788                     ; 4047 		HD_TimeOutReUpLoad();
10790  145e cd0000        	call	_HD_TimeOutReUpLoad
10792                     ; 4048 		HD_ProtolProc();
10794  1461 cd0000        	call	_HD_ProtolProc
10796                     ; 4050 		break;
10798  1464               L7764:
10799                     ; 4052 	return ;
10802  1464 5b05          	addw	sp,#5
10803  1466 81            	ret	
10881                     	switch	.const
10882  0493               L4211:
10883  0493 0000003d      	dc.l	61
10884                     ; 4064 void fixTaskGsm(void)
10884                     ; 4065 {
10885                     	switch	.text
10886  1467               _fixTaskGsm:
10888  1467 5217          	subw	sp,#23
10889       00000017      OFST:	set	23
10892                     ; 4066 	s32 dwReport = 0, dwOffset = 0;	
10894  1469 96            	ldw	x,sp
10895  146a 5c            	incw	x
10896  146b cd0000        	call	c_ltor
10900  146e 96            	ldw	x,sp
10901  146f 1c0005        	addw	x,#OFST-18
10902  1472 cd0000        	call	c_ltor
10904                     ; 4070 	STM8_RTC_Get(&stReportTime);
10906  1475 96            	ldw	x,sp
10907  1476 1c0009        	addw	x,#OFST-14
10908  1479 cd0000        	call	_STM8_RTC_Get
10910                     ; 4071 	TM_TimeChangeAToB(&stReportTime,&stTimeNowTm);
10912  147c 96            	ldw	x,sp
10913  147d 1c0010        	addw	x,#OFST-7
10914  1480 89            	pushw	x
10915  1481 1d0007        	subw	x,#7
10916  1484 cd0000        	call	_TM_TimeChangeAToB
10918  1487 c600a5        	ld	a,_m_nWakeupReportFlg
10919  148a a50f          	bcp	a,#15
10920  148c 85            	popw	x
10921                     ; 4074 	if((FALSE != (m_nWakeupReportFlg&REPORT_FLG))
10921                     ; 4075 		||FALSE == TM_IsValidTimePro(&stLastReportT)
10921                     ; 4076 		||(2015 >= stTimeNowTm.wYear)||(TRUE == g_OptValveRepFlg)
10921                     ; 4077 #ifdef PURCHASE_MODE
10921                     ; 4078 		|| (OWED_STAT_FLG == (tyParameter.nOverBuyFlg&(OWED_REP_SUCC|OWED_REP_FAIL|OWED_STAT_FLG)))
10921                     ; 4079 #endif
10921                     ; 4080 		||((ALARM_MASK&ALM_GetBatStatus()&&(MAX_REP_TIMES > g_nAlmRepFailCnt)&&(ALARM_REP_FLG != (ALARM_REP_FLG&g_nGuardEnFlg)))))
10923  148d 2629          	jrne	L5474
10925  148f ae000a        	ldw	x,#_stLastReportT
10926  1492 cd0000        	call	_TM_IsValidTimePro
10928  1495 4d            	tnz	a
10929  1496 2720          	jreq	L5474
10931  1498 1e10          	ldw	x,(OFST-7,sp)
10932  149a a307e0        	cpw	x,#2016
10933  149d 2519          	jrult	L5474
10935  149f c600ae        	ld	a,_g_OptValveRepFlg
10936  14a2 4a            	dec	a
10937  14a3 2713          	jreq	L5474
10939  14a5 cd0000        	call	_ALM_GetBatStatus
10941  14a8 a50f          	bcp	a,#15
10942  14aa 271c          	jreq	L3474
10944  14ac c60000        	ld	a,_g_nAlmRepFailCnt
10945  14af a103          	cp	a,#3
10946  14b1 2415          	jruge	L3474
10948  14b3 7202000010    	btjt	_g_nGuardEnFlg,#1,L3474
10949  14b8               L5474:
10950                     ; 4082 		g_nReportFlg  = TRUE;
10952  14b8 350100ad      	mov	_g_nReportFlg,#1
10953                     ; 4083 	    m_nUploadMode = OTHER_REP;
10955  14bc 725f00c3      	clr	_m_nUploadMode
10956                     ; 4084 		fixTaskGsmProc();
10958  14c0               LC022:
10960  14c0 cd13db        	call	_fixTaskGsmProc
10963  14c3               L5574:
10964                     ; 4161 	ReportTimeOutPro();
10966  14c3 cd1365        	call	_ReportTimeOutPro
10968                     ; 4162 	return ;
10970  14c6 2050          	jra	L0411
10971  14c8               L3474:
10972                     ; 4133 		if(FALSE == g_nReportFlg)
10974  14c8 c600ad        	ld	a,_g_nReportFlg
10975  14cb 2656          	jrne	L7574
10976                     ; 4135 			dwReport = HD_ClaReportTimeToSec();
10978  14cd cd0000        	call	_HD_ClaReportTimeToSec
10980  14d0 96            	ldw	x,sp
10981  14d1 5c            	incw	x
10982  14d2 cd0000        	call	c_rtol
10984                     ; 4136 			dwOffset = TM_DiffSecond(&stLastReportT, &stTimeNowTm);
10986  14d5 96            	ldw	x,sp
10987  14d6 1c0010        	addw	x,#OFST-7
10988  14d9 89            	pushw	x
10989  14da ae000a        	ldw	x,#_stLastReportT
10990  14dd cd0000        	call	_TM_DiffSecond
10992  14e0 85            	popw	x
10993  14e1 96            	ldw	x,sp
10994  14e2 1c0005        	addw	x,#OFST-18
10995  14e5 cd0000        	call	c_rtol
10997                     ; 4138 			if((60 < (dwOffset%dwReport)) ||
10997                     ; 4139 				((TRUE == ReadRecord(0, (u8*)&tyRecord, sizeof(tyRecord)))&&(FALSE == tyRecord.nRepFlg)))
10999  14e8 96            	ldw	x,sp
11000  14e9 1c0005        	addw	x,#OFST-18
11001  14ec cd0000        	call	c_ltor
11003  14ef 96            	ldw	x,sp
11004  14f0 5c            	incw	x
11005  14f1 cd0000        	call	c_lmod
11007  14f4 ae0493        	ldw	x,#L4211
11008  14f7 cd0000        	call	c_lcmp
11010  14fa 2e14          	jrsge	L3674
11012  14fc 4b0c          	push	#12
11013  14fe ae0000        	ldw	x,#_tyRecord
11014  1501 89            	pushw	x
11015  1502 4f            	clr	a
11016  1503 cd0000        	call	_ReadRecord
11018  1506 5b03          	addw	sp,#3
11019  1508 4a            	dec	a
11020  1509 2610          	jrne	L1674
11022  150b c6000b        	ld	a,_tyRecord+11
11023  150e 260b          	jrne	L1674
11024  1510               L3674:
11025                     ; 4141 				LP_SetLowPwrStartFlg(LP_GPRS_FLG_OK);
11027  1510 a601          	ld	a,#1
11028  1512 cd0000        	call	_LP_SetLowPwrStartFlg
11030                     ; 4144 				M590_CloseConnect();
11032  1515 cd117a        	call	_M590_CloseConnect
11034                     ; 4145 				return ;
11035  1518               L0411:
11038  1518 5b17          	addw	sp,#23
11039  151a 81            	ret	
11040  151b               L1674:
11041                     ; 4149 				m_nUploadMode = TIME_DAT_REP;
11043  151b a601          	ld	a,#1
11044  151d c700c3        	ld	_m_nUploadMode,a
11045                     ; 4150 				g_nReportFlg  = TRUE;
11047  1520 c700ad        	ld	_g_nReportFlg,a
11048  1523               L7574:
11049                     ; 4153 		if(TRUE == g_nReportFlg)
11051  1523 4a            	dec	a
11052  1524 269d          	jrne	L5574
11053                     ; 4155 			fixTaskGsmProc();
11055  1526 2098          	jp	LC022
11092                     ; 4174 void InitializeGsm(void)
11092                     ; 4175 {	
11093                     	switch	.text
11094  1528               _InitializeGsm:
11098                     ; 4176 	tyGSMFlag = 0xFF;
11100  1528 35ff0019      	mov	_tyGSMFlag,#255
11101                     ; 4177 	ucStatusGsm    = GSM_INIT;
11103  152c 35010068      	mov	_ucStatusGsm,#1
11104                     ; 4178 	ucStepGsm      = 0;
11106  1530 725f0067      	clr	_ucStepGsm
11107                     ; 4179 	m_nGprsStep    = INIT_PWR_ON;
11109  1534 350100a6      	mov	_m_nGprsStep,#1
11110                     ; 4180 	stRepFail.wError = 0;
11112  1538 5f            	clrw	x
11113  1539 cf0006        	ldw	_stRepFail+6,x
11114                     ; 4182 	m_nWakeupReportFlg = ReadReportFlag();
11116  153c cd0000        	call	_ReadReportFlag
11118  153f c700a5        	ld	_m_nWakeupReportFlg,a
11119                     ; 4183 	ReadGroup(1, ADDRESS_GUARD_EN, &g_nGuardEnFlg);
11121  1542 ae0000        	ldw	x,#_g_nGuardEnFlg
11122  1545 89            	pushw	x
11123  1546 ae1000        	ldw	x,#4096
11124  1549 89            	pushw	x
11125  154a a601          	ld	a,#1
11126  154c cd0000        	call	_ReadGroup
11128  154f 5b04          	addw	sp,#4
11129                     ; 4184 	g_nAlmRepFailCnt = (g_nGuardEnFlg>>6);
11131  1551 c60000        	ld	a,_g_nGuardEnFlg
11132  1554 4e            	swap	a
11133  1555 a40c          	and	a,#12
11134  1557 44            	srl	a
11135  1558 44            	srl	a
11136  1559 c70000        	ld	_g_nAlmRepFailCnt,a
11137                     ; 4191 	HD_InitializeGsm();
11139  155c cd0000        	call	_HD_InitializeGsm
11141                     ; 4195 	if(FALSE == ReadParameterForType((u8 *)&stOptValve, OPTVALVE_LEN, OPT_VALVE_PRAA))
11143  155f 4b06          	push	#6
11144  1561 4b0a          	push	#10
11145  1563 ae0000        	ldw	x,#_stOptValve
11146  1566 cd0000        	call	_ReadParameterForType
11148  1569 4d            	tnz	a
11149  156a 85            	popw	x
11150  156b 2618          	jrne	L1005
11151                     ; 4197 		stOptValve.nOptFlg    = CTL_VAVLE_ENABLE;
11153  156d 35aa0001      	mov	_stOptValve+1,#170
11154                     ; 4198 		stOptValve.nEnableFlg = CTL_VAVLE_ENABLE;
11156  1571 35aa0000      	mov	_stOptValve,#170
11157                     ; 4199 		stOptValve.nStartHour = 0x02;
11159  1575 35020005      	mov	_stOptValve+5,#2
11160                     ; 4200 		stOptValve.nEndHour   = 0x04;
11162  1579 35040006      	mov	_stOptValve+6,#4
11163                     ; 4201 		stOptValve.nVavleStat = 0;
11165  157d 725f0007      	clr	_stOptValve+7
11166                     ; 4202 		stOptValve.nVavleCycle= 0;
11168  1581 725f0009      	clr	_stOptValve+9
11169  1585               L1005:
11170                     ; 4205 	if((MAX_REP_TIMES > stOptValve.nRepFailCnt)&&(CTL_VALVE_OVER == stOptValve.nOptFlg))
11172  1585 c60008        	ld	a,_stOptValve+8
11173  1588 a103          	cp	a,#3
11174  158a 240c          	jruge	L3005
11176  158c c60001        	ld	a,_stOptValve+1
11177  158f a1ee          	cp	a,#238
11178  1591 2605          	jrne	L3005
11179                     ; 4207 		g_OptValveRepFlg = TRUE;
11181  1593 350100ae      	mov	_g_OptValveRepFlg,#1
11184  1597 81            	ret	
11185  1598               L3005:
11186                     ; 4209 	else if(MAX_REP_TIMES <= stOptValve.nRepFailCnt)
11188  1598 c60008        	ld	a,_stOptValve+8
11189  159b a103          	cp	a,#3
11190  159d 2508          	jrult	L5005
11191                     ; 4211 		stOptValve.nOptFlg = 0;   /* 超出上报次数后，认为上报成功不在上报 */ 
11193  159f 725f0001      	clr	_stOptValve+1
11194                     ; 4212 		stOptValve.nRepFailCnt = 0;
11196  15a3 725f0008      	clr	_stOptValve+8
11197  15a7               L5005:
11198                     ; 4214 	return ;
11201  15a7 81            	ret	
11625                     	xdef	_fixTaskGsmProc
11626                     	xdef	_ReportTimeOutPro
11627                     	xdef	_M590_ConnectServer
11628                     	xdef	_M590_HandShake
11629                     	xdef	_M590_Init
11630                     	xdef	_AT_CmdFailProc
11631                     	xdef	_SIMGetRegisterStat
11632                     	xdef	_UC_CommATExt
11633                     	xdef	_QH_SearchStrVal
11634                     	xdef	_QH_bufbuf
11635                     	xdef	_UC_SleepProc
11636                     	xdef	_UC_SetSleepCnt
11637                     	xdef	_PackAtCmdExt
11638                     	xdef	_PackTcpSendData
11639                     	xdef	_PackAtCmdTcpsend
11640                     	xdef	_PackAtCmdParameter3
11641                     	xdef	_PackAtCmdParameter2
11642                     	xdef	_PackAtCmdParameter
11643                     	xdef	_PackAtCmd
11644                     	xdef	_AlmMakeFrame
11645                     	xdef	_BatteryVolRepPro
11646                     	xdef	_UpLinkSaveReportTime
11647                     	xdef	_MeterTnNumTransform
11648                     	xdef	_VavleStatTransform
11649                     	xdef	_UC_CommAT
11650                     	xdef	_SIMGL868_GetCCID
11651                     	xdef	_g_nOwedRepFlg
11652                     	xdef	_m_nAlmRepFlg
11653                     	xdef	_m_nGmTn_2
11654                     	xdef	_m_nGmTn_1
11655                     	xdef	_m_nMasterType
11656                     	xdef	_m_nLedFlashFlg
11657                     	xdef	_m_nDataRepSucFlg
11658                     	xdef	_m_nRepIndex
11659                     	xdef	_m_nIpAddBk
11660                     	xdef	_g_BatRepFlg
11661                     	xdef	_g_nReportFlg
11662                     	xdef	_m_dwTimeCnt
11663                     	xdef	_m_nGprsStep
11664                     	xdef	_m_nWakeupReportFlg
11665                     	xdef	_m_nCcidBuf
11666                     	xdef	_m_nPtrcoVerBuf
11667                     	xdef	_aucAtPPortBk
11668                     	xdef	_aucAtPServerBk
11669                     	xdef	_g_nPwdBuf
11670                     	xdef	_g_nUsrBuf
11671                     	xref	_HD_DecodeParameter
11672                     	xref	_HD_ProtolProc
11673                     	xref	_HD_TimeOutReUpLoad
11674                     	xref	_HD_ClaReportTimeToSec
11675                     	xref	_HD_InitializeGsm
11676                     	xref	_ALM_GetBatStatus
11677                     	xref	_g_nAlmRepFailCnt
11678                     	xref	_g_nGuardEnFlg
11679                     	xref	_LP_SetLowPwrStartFlg
11680                     	xref	_STM8_RTC_Get
11681                     	xref	_stRepFail
11682                     	xref	_tyRecord
11683                     	xref	_ReadAlmRecord
11684                     	xref	_AddAlmRecord
11685                     	xref	_EditRecord
11686                     	xref	_SaveByte
11687                     	xref	_ReadGroup
11688                     	xref	_ReadReportFlag
11689                     	xref	_SaveReportFlag
11690                     	xref	_SaveParameterForType
11691                     	xref	_ReadParameterForType
11692                     	xref	_ReadRecord
11693                     	xdef	_GetIsmiCcidDat
11694                     	xdef	_GetGprsConntStat
11695                     	xdef	_GetOnLineStatus
11696                     	xdef	_GetLedFlg
11697                     	xdef	_FrameSendFunc
11698                     	xdef	_M590_CloseConnect
11699                     	xdef	_M590_TcpSendDatLen
11700                     	xdef	_SetLogonMode
11701                     	xdef	_WatitDataSendOk
11702                     	xdef	_ClaReportTimeToSec
11703                     	xdef	_SetReportIndex
11704                     	xdef	_GetReportFailFlag
11705                     	xdef	_ReWriteRepFlg
11706                     	xdef	_GetTermReportTime
11707                     	xdef	_UC_SleepFunc
11708                     	xdef	_InitializeGsm
11709                     	xdef	_fixTaskGsm
11710                     	xdef	_GetReportFlag
11711                     	xdef	_g_dwTmAddress
11712                     	xdef	_g_OptValveRepFlg
11713                     	xdef	_g_nSignal
11714                     	xdef	_g_wTmReportCnt
11715                     	xdef	_aucAtPPort1
11716                     	xdef	_aucAtPServer1
11717                     	xdef	_g_dwCommDelay
11718                     	xdef	_m_nImsiBufXJ
11719                     	xdef	_m_nImsiBuf
11720                     	xdef	_m_nVerBuf
11721                     	xdef	_g_nApnType
11722                     	xdef	_m_nRepFailFlg
11723                     	xdef	_g_nDatRepCnt
11724                     	xdef	_m_nRepEnableFlg
11725                     	xdef	_g_dwRepTick
11726                     	switch	.bss
11727  0000               _stOptValve:
11728  0000 000000000000  	ds.b	10
11729                     	xdef	_stOptValve
11730  000a               _stLastReportT:
11731  000a 000000000000  	ds.b	8
11732                     	xdef	_stLastReportT
11733  0012               _stTimeNow:
11734  0012 000000000000  	ds.b	7
11735                     	xdef	_stTimeNow
11736                     	xdef	_g_nApnBuf
11737                     	xref	_GetUartRxBuf
11738                     	xref	_ClearRxBuff
11739                     	xref	_CheckRevDataLen
11740                     	xref	_TurnBusUartOn
11741                     	xref	_StartSendBusUartGroup
11742                     	xref	_SetBusUart
11743                     	xref	_FeedSoftWareIwdg
11744                     	xdef	_JX_StringCat
11745                     	xdef	_JX_Strlen
11746                     	xdef	_SIMGK7M_GetCIMI
11747                     	xdef	_SIMGL868_UpdateSignal
11748  0019               _tyGSMFlag:
11749  0019 00            	ds.b	1
11750                     	xdef	_tyGSMFlag
11751                     	xref	_aucUartTxBuffer
11752                     	xdef	_m_nUploadMode
11753  001a               _tyReportParameter:
11754  001a 000000000000  	ds.b	39
11755                     	xdef	_tyReportParameter
11756  0041               _tyGprs:
11757  0041 000000000000  	ds.b	22
11758                     	xdef	_tyGprs
11759  0057               _ucErrorGsm:
11760  0057 00            	ds.b	1
11761                     	xdef	_ucErrorGsm
11762  0058               _tyTimerReport:
11763  0058 00000000      	ds.b	4
11764                     	xdef	_tyTimerReport
11765  005c               _tyReport:
11766  005c 000000000000  	ds.b	10
11767                     	xdef	_tyReport
11768  0066               _ucStepReveive:
11769  0066 00            	ds.b	1
11770                     	xdef	_ucStepReveive
11771  0067               _ucStepGsm:
11772  0067 00            	ds.b	1
11773                     	xdef	_ucStepGsm
11774  0068               _ucStatusGsm:
11775  0068 00            	ds.b	1
11776                     	xdef	_ucStatusGsm
11777  0069               _nLogonModeBk:
11778  0069 00            	ds.b	1
11779                     	xdef	_nLogonModeBk
11780  006a               _ucLogonMode:
11781  006a 00            	ds.b	1
11782                     	xdef	_ucLogonMode
11783  006b               _ucNumberMessage:
11784  006b 00            	ds.b	1
11785                     	xdef	_ucNumberMessage
11786                     	xdef	_aucAtRCmd
11787                     	xdef	_aucAtCmd
11788                     	xdef	_aucAtShutDown
11789                     	xdef	_aucAtMytimeupdate
11790                     	xdef	_aucAtMylacid
11791                     	xdef	_aucAtMycged
11792                     	xdef	_aucAtTcpsends
11793                     	xdef	_aucAtTcprecv_S
11794                     	xdef	_aucAtTcplisten
11795                     	xdef	_aucAtSignal
11796                     	xdef	_aucAtGprsstatus
11797                     	xdef	_aucAtCloselisten
11798                     	xdef	_aucAtCloseclient
11799                     	xdef	_aucAtClientstatus
11800                     	xdef	_aucAtFtpstatus
11801                     	xdef	_aucAtFtpput
11802                     	xdef	_aucAtFtplogout
11803                     	xdef	_aucAtFtplogin
11804                     	xdef	_aucAtFtpget
11805                     	xdef	_aucAtDnsserver
11806                     	xdef	_aucAtDns
11807                     	xdef	_aucAtXisp
11808                     	xdef	_aucAtXiic
11809                     	xdef	_aucAtUdpsetup
11810                     	xdef	_aucAtUdpsend
11811                     	xdef	_aucAtUdprecv
11812                     	xdef	_aucAtUdpclose
11813                     	xdef	_aucAtTcpclose
11814                     	xdef	_aucAtXgauth
11815                     	xdef	_aucAtTcpsetup
11816                     	xdef	_aucAtTcpsend
11817                     	xdef	_aucAtTcprecv
11818                     	xdef	_aucAtIpstatus
11819                     	xdef	_aucAtCusd
11820                     	xdef	_aucAtCgatt
11821                     	xdef	_aucAtPdpUn
11822                     	xdef	_aucAtPdpCm
11823                     	xdef	_aucAtCpbw
11824                     	xdef	_aucAtCpbs
11825                     	xdef	_aucAtCpbr
11826                     	xdef	_aucAtCpbf
11827                     	xdef	_aucAtCnum
11828                     	xdef	_aucAtCsms
11829                     	xdef	_aucAtCsmp
11830                     	xdef	_aucAtCsdh
11831                     	xdef	_aucAtCscs
11832                     	xdef	_aucAtCscb
11833                     	xdef	_aucAtCsca
11834                     	xdef	_aucAtCpms
11835                     	xdef	_aucAtCnmi
11836                     	xdef	_aucAtCmss
11837                     	xdef	_aucAtCmgw
11838                     	xdef	_aucAtCmgs
11839                     	xdef	_aucAtCmgr
11840                     	xdef	_aucAtCmgl
11841                     	xdef	_aucAtCmgf
11842                     	xdef	_aucAtCmgd
11843                     	xdef	_aucAtXbandsel
11844                     	xdef	_aucAtCsq
11845                     	xdef	_aucAtCops
11846                     	xdef	_aucAtIpr
11847                     	xdef	_aucAtIcf
11848                     	xdef	_aucAtEnpwrsavE
11849                     	xdef	_aucAtCreg
11850                     	xdef	_aucAtCpwroff
11851                     	xdef	_aucAtCpwd
11852                     	xdef	_aucAtCpin
11853                     	xdef	_aucAtCpas
11854                     	xdef	_aucAtCmux
11855                     	xdef	_aucAtCmee
11856                     	xdef	_aucAtClck
11857                     	xdef	_aucAtCipstatus
11858                     	xdef	_aucAtCfun
11859                     	xdef	_aucAtCeer
11860                     	xdef	_aucAtCclk
11861                     	xdef	_aucAtGetvers
11862                     	xdef	_aucAtCimi
11863                     	xdef	_aucAtCgsn
11864                     	xdef	_aucAtCgmm
11865                     	xdef	_aucAtCgmi
11866                     	xdef	_aucAtCcid
11867                     	xdef	_aucAtI
11868                     	xdef	_aucAtS_D
11869                     	xdef	_aucAtS_O
11870                     	xdef	_aucAtS_Plus
11871                     	xdef	_aucAtS_D2
11872                     	xdef	_aucATS_W
11873                     	xdef	_aucATS_V
11874                     	xdef	_aucATS_E
11875                     	xdef	_aucATS_A
11876                     	xdef	_aucAtNull
11877                     	xdef	_aucAtInit
11878                     	xdef	_aucAtrError
11879                     	xdef	_aucAtrIpr
11880                     	xdef	_aucAtrTcpclose
11881                     	xdef	_aucAtrTcprecv
11882                     	xdef	_aucAtrTcpsend
11883                     	xdef	_aucAtrTcpsetup
11884                     	xdef	_aucAtrXiic
11885                     	xdef	_aucAtrOk
11886                     	xdef	_aucAtrNeoway
11887                     	xdef	_aucAtrCreg
11888                     	xdef	_aucAtrCpinReady
11889                     	xdef	_aucAtrCclk
11890                     	xdef	_aucAtrPppFail
11891                     	xdef	_aucAtrInit
11892                     	xdef	_aucAtPPort2
11893                     	xdef	_aucAtPTimeServer2
11894                     	xdef	_aucAtPTimeServer1
11895                     	xdef	_aucAtPBaudrate
11896                     	xdef	_aucAtPAscii_Equal0
11897                     	xdef	_aucAtPAscii_Equal1
11898                     	xdef	_aucAtPAscii_0
11899                     	xdef	_aucAtPAscii_1
11900                     	xdef	_aucAtPAscii_Question
11901                     	xref	_JX_ByteToBcd
11902                     	xref	_TM_DiffSecond
11903                     	xref	_TM_TimeChangeAToB
11904                     	xref	_TM_IsValidTimePro
11905                     	xref	_JX_BL_Change
11906                     	xref	_MemcpyFunc
11907                     	xref	_MemsetFunc
11908                     	xref	_delay_ms
11909                     	xref	_GetBoardVavleStat
11910                     	xref	_GetSysTemTick
11911                     	xref	_GPIO_WriteBit
11912                     	switch	.const
11913  0497               L1344:
11914  0497 4c696e6b2043  	dc.b	"Link Closed",0
11915  04a3               L7734:
11916  04a3 434f4e4e4543  	dc.b	"CONNECT FAIL",0
11917  04b0               L5734:
11918  04b0 414c52454144  	dc.b	"ALREADY CONNECT",0
11919  04c0               L3734:
11920  04c0 434f4e4e4543  	dc.b	"CONNECT OK",0
11921  04cb               L1524:
11922  04cb 524541445900  	dc.b	"READY",0
11923  04d1               L7604:
11924  04d1 383900        	dc.b	"89",0
11925  04d4               L1304:
11926  04d4 343600        	dc.b	"46",0
11927  04d7               L3773:
11928  04d7 2b4353513a00  	dc.b	"+CSQ:",0
11929  04dd               L7373:
11930  04dd 2b435245473a  	dc.b	"+CREG: 0,5",0
11931  04e8               L5373:
11932  04e8 2b435245473a  	dc.b	"+CREG: 0,1",0
11933  04f3               L1473:
11934  04f3 4552524f5200  	dc.b	"ERROR",0
11935  04f9               L7244:
11936  04f9 3e00          	dc.b	">",0
11937  04fb               L3424:
11938  04fb 4f4b00        	dc.b	"OK",0
11939                     	xref.b	c_lreg
11959                     	xref	c_lmod
11960                     	xref	c_lzmp
11961                     	xref	c_lrzmp
11962                     	xref	c_itolx
11963                     	xref	c_lsbc
11964                     	xref	c_ladd
11965                     	xref	c_smul
11966                     	xref	c_lsub
11967                     	xref	c_lcmp
11968                     	xref	c_sdivx
11969                     	xref	c_smodx
11970                     	xref	c_xymvx
11971                     	xref	c_ltor
11972                     	xref	c_rtol
11973                     	xref	c_lmul
11974                     	end
