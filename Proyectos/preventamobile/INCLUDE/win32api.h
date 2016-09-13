*-- CONSTANTES API WIN32


#DEFINE W32_ERROR	0


*-- CONSTANTES PARA CreateFont
*-- varias
#DEFINE PROOF_QUALITY       2
#DEFINE ANTIALIASED_QUALITY	4
#DEFINE TRANSPARENT			1
#DEFINE OPAQUE				2

*-- OutputPrecision
#DEFINE OUT_CHARACTER_PRECIS	2
#DEFINE OUT_DEFAULT_PRECIS		0
#DEFINE OUT_DEVICE_PRECIS		5
#DEFINE OUT_OUTLINE_PRECIS		8
#DEFINE OUT_RASTER_PRECIS		6
#DEFINE OUT_STRING_PRECIS		1
#DEFINE OUT_STROKE_PRECIS		3
#DEFINE OUT_TT_ONLY_PRECIS		7
#DEFINE OUT_TT_PRECIS			4

*-- ClipPrecision
#DEFINE CLIP_DEFAULT_PRECIS		0
#DEFINE CLIP_STROKE_PRECIS		2

*-- Constantes para GetDeviceCaps
#DEFINE LOGPIXELSX          88
#DEFINE LOGPIXELSY          90

*-- fdwPitchAndFamily (algunas)
#DEFINE DEFAULT_PITCH		0
#DEFINE FIXED_PITCH			1
#DEFINE VARIABLE_PITCH		2

*-- fdwCharSet
#DEFINE ANSI_CHARSET		0
#DEFINE DEFAULT_CHARSET		1
#DEFINE SYMBOL_CHARSET		2
#DEFINE OEM_CHARSET			255

*-- fnWeight
#DEFINE FW_DONTCARE		0
#DEFINE FW_THIN			100
#DEFINE FW_EXTRALIGHT	200
#DEFINE FW_LIGHT		300
#DEFINE FW_NORMAL		400
#DEFINE FW_MEDIUM		500
#DEFINE FW_SEMIBOLD		600
#DEFINE FW_BOLD			700
#DEFINE FW_EXTRABOLD	800
#DEFINE FW_HEAVY		900
#DEFINE FW_REGULAR		FW_NORMAL
#DEFINE FW_BLACK		FW_HEAVY
#DEFINE FW_DEMIBOLD		FW_SEMIBOLD
#DEFINE FW_ULTRABOLD	FW_EXTRABOLD
#DEFINE FW_ULTRALIGHT	FW_EXTRALIGHT
*-- FIN: CONSTANTES PARA CreateFont

#DEFINE DT_LEFT				0
#DEFINE DT_CENTER			1
#DEFINE DT_RIGHT			2
#DEFINE DT_BOTTOM			8
#DEFINE DT_WORDBREAK		16

*-- CONSTANTES PARA REGION
#DEFINE RGN_AND		1
#DEFINE RGN_OR		2
#DEFINE RGN_XOR		3
#DEFINE RGN_DIFF	4
#DEFINE RGN_COPY	5
#DEFINE RGN_MAX		RGN_COPY
#DEFINE RGN_MIN		RGN_AND
#DEFINE RGN_ERROR	ERROR

*-- CONSTANTES PARA BRUSH
#DEFINE WHITE_BRUSH			0
#DEFINE LTGRAY_BRUSH		1
#DEFINE IEB_BRUSH			1
#DEFINE GRAY_BRUSH			2
#DEFINE OBJ_BRUSH			2
#DEFINE DKGRAY_BRUSH		3
#DEFINE BLACK_BRUSH			4
#DEFINE NULL_BRUSH			5
#DEFINE HOLLOW_BRUSH		NULL_BRUSH
#DEFINE DC_BRUSH			18

*-- CONSTANTES DE COLOR
#DEFINE W32_COLOR_3DDKSHADOW  21 
#DEFINE W32_COLOR_3DFACE  COLOR_BTNFACE 
#DEFINE W32_COLOR_3DLIGHT  22 
#DEFINE W32_COLOR_ACTIVEBORDER  10 
#DEFINE W32_COLOR_ACTIVECAPTION  2 
#DEFINE W32_COLOR_ADD  712 
#DEFINE W32_COLOR_APPWORKSPACE  12 
#DEFINE W32_COLOR_BACKGROUND  1 
#DEFINE W32_COLOR_BE_CONVERT  2 
#DEFINE W32_COLOR_BE_CONVERTED  4 
#DEFINE W32_COLOR_BE_CONVERTED_TEXT  5 
#DEFINE W32_COLOR_BE_CONVERT_TEXT  3 
#DEFINE W32_COLOR_BE_CURSOR  8 
#DEFINE W32_COLOR_BE_CURSOR_TEXT  9 
#DEFINE W32_COLOR_BE_INPUT  0 
#DEFINE W32_COLOR_BE_INPUT_TEXT  1 
#DEFINE W32_COLOR_BE_PRECONVERT  10 
#DEFINE W32_COLOR_BE_PRECONVERT_TEXT  11 
#DEFINE W32_COLOR_BE_UNCONVERT  6 
#DEFINE W32_COLOR_BE_UNCONVERT_TEXT  7 
#DEFINE W32_COLOR_BLUE  708 
#DEFINE W32_COLOR_BLUEACCEL  728 
#DEFINE W32_COLOR_BOX1  720 
#DEFINE W32_COLOR_BTNFACE  15 
#DEFINE W32_COLOR_BTNHIGHLIGHT  20 
#DEFINE W32_COLOR_BTNHILIGHT  W32_COLOR_BTNHIGHLIGHT 
#DEFINE W32_COLOR_BTNSHADOW  16 
#DEFINE W32_COLOR_BTNTEXT  18 
#DEFINE W32_COLOR_CAPTIONTEXT  9 
#DEFINE W32_COLOR_CURRENT  709 
#DEFINE W32_COLOR_CUSTOM1  721 
#DEFINE W32_COLOR_DESKTOP  W32_COLOR_BACKGROUND 
#DEFINE W32_COLOR_ELEMENT  716 
#DEFINE W32_COLOR_GRADIENTACTIVECAPTION  27 
#DEFINE W32_COLOR_GRADIENTINACTIVECAPTION  28 
#DEFINE W32_COLOR_GRAYTEXT  17 
#DEFINE W32_COLOR_GREEN  707 
#DEFINE W32_COLOR_GREENACCEL  727 
#DEFINE W32_COLOR_HIGHLIGHT  13 
#DEFINE W32_COLOR_HIGHLIGHTTEXT  14 
#DEFINE W32_COLOR_HOTLIGHT  26 
#DEFINE W32_COLOR_HUE  703 
#DEFINE W32_COLOR_HUEACCEL  723 
#DEFINE W32_COLOR_HUESCROLL  700 
#DEFINE W32_COLOR_INACTIVEBORDER  11 
#DEFINE W32_COLOR_INACTIVECAPTION  3 
#DEFINE W32_COLOR_INACTIVECAPTIONTEXT  19 
#DEFINE W32_COLOR_INFOBK  24 
#DEFINE W32_COLOR_INFOTEXT  23 
#DEFINE W32_COLOR_LUM  705 
#DEFINE W32_COLOR_LUMACCEL  725 
#DEFINE W32_COLOR_LUMSCROLL  702 
#DEFINE W32_COLOR_MATCH_VERSION  0x0200 
#DEFINE W32_COLOR_MENU  4 
#DEFINE W32_COLOR_MENUTEXT  7 
#DEFINE W32_COLOR_MIX  719 
#DEFINE W32_COLOR_PALETTE  718 
#DEFINE W32_COLOR_RAINBOW  710 
#DEFINE W32_COLOR_RED  706 
#DEFINE W32_COLOR_REDACCEL  726 
#DEFINE W32_COLOR_SAMPLES  717 
#DEFINE W32_COLOR_SAT  704 
#DEFINE W32_COLOR_SATACCEL  724 
#DEFINE W32_COLOR_SATSCROLL  701 
#DEFINE W32_COLOR_SAVE  711 
#DEFINE W32_COLOR_SCHEMES  715 
#DEFINE W32_COLOR_SCROLLBAR  0 
#DEFINE W32_COLOR_SOLID  713 
#DEFINE W32_COLOR_SOLID_LEFT  730 
#DEFINE W32_COLOR_SOLID_RIGHT  731 
#DEFINE W32_COLOR_TUNE  714 
#DEFINE W32_COLOR_WINDOW  5 
#DEFINE W32_COLOR_WINDOWFRAME  6 
#DEFINE W32_COLOR_WINDOWTEXT  8 
#DEFINE W32_COLOR_3DSHADOW  W32_COLOR_BTNSHADOW 
#DEFINE W32_COLOR_3DHIGHLIGHT  W32_COLOR_BTNHIGHLIGHT 
#DEFINE W32_COLOR_3DHILIGHT  W32_COLOR_BTNHIGHLIGHT 


#DEFINE LR_MONOCHROME          1 
#DEFINE LR_LOADFROMFILE       16 
#DEFINE LR_LOADTRANSPARENT    32 
#DEFINE LR_VGACOLOR          128 
#DEFINE LR_LOADMAP3DCOLORS  4096 


#DEFINE IMAGE_BITMAP  0

#DEFINE SRCCOPY  13369376 


#DEFINE BITMAP_STRU_SIZE   24 

*-- SYSTEM METRICS
#DEFINE SM_ARRANGE				56
#DEFINE SM_CLEANBOOT			67
*#DEFINE SM_CMETRICS				76	&& EXISTE EN FOXPRO.H
*#DEFINE SM_CMETRICS				83	&& EXISTE EN FOXPRO.H
#DEFINE SM_CMONITORS			80
#DEFINE SM_CMOUSEBUTTONS		43
#DEFINE SM_CXBORDER				5
#DEFINE SM_CXCURSOR				13
#DEFINE SM_CXDLGFRAME			7
#DEFINE SM_CXDOUBLECLK			36
#DEFINE SM_CXDRAG				68
#DEFINE SM_CXEDGE				45
#DEFINE SM_CXFIXEDFRAME			SM_CXDLGFRAME
#DEFINE SM_CXFRAME				32
#DEFINE SM_CXFULLSCREEN			16
#DEFINE SM_CXHSCROLL			21
#DEFINE SM_CXHTHUMB				10
#DEFINE SM_CXICON				11
#DEFINE SM_CXICONSPACING		38
#DEFINE SM_CXMAXIMIZED			61
#DEFINE SM_CXMAXTRACK			59
#DEFINE SM_CXMENUCHECK			71
#DEFINE SM_CXMENUSIZE			54
#DEFINE SM_CXMIN				28
#DEFINE SM_CXMINIMIZED			57
#DEFINE SM_CXMINSPACING			47
#DEFINE SM_CXMINTRACK			34
#DEFINE SM_CXSCREEN				0
#DEFINE SM_CXSIZE				30
#DEFINE SM_CXSIZEFRAME			SM_CXFRAME
#DEFINE SM_CXSMICON				49
#DEFINE SM_CXSMSIZE				52
#DEFINE SM_CXVIRTUALSCREEN		78
#DEFINE SM_CXVSCROLL			2
#DEFINE SM_CYBORDER				6
#DEFINE SM_CYCAPTION			4
#DEFINE SM_CYCURSOR				14
#DEFINE SM_CYDLGFRAME			8
#DEFINE SM_CYDOUBLECLK			37
#DEFINE SM_CYDRAG				69
#DEFINE SM_CYEDGE				46
#DEFINE SM_CYFIXEDFRAME			SM_CYDLGFRAME
#DEFINE SM_CYFRAME				33
#DEFINE SM_CYFULLSCREEN			17
#DEFINE SM_CYHSCROLL			3
#DEFINE SM_CYICON				12
#DEFINE SM_CYICONSPACING		39
#DEFINE SM_CYKANJIWINDOW		18
#DEFINE SM_CYMAXIMIZED			62
#DEFINE SM_CYMAXTRACK			60
#DEFINE SM_CYMENU				15
#DEFINE SM_CYMENUCHECK			72
#DEFINE SM_CYMENUSIZE			55
#DEFINE SM_CYMIN				29
#DEFINE SM_CYMINIMIZED			58
#DEFINE SM_CYMINSPACING			48
#DEFINE SM_CYMINTRACK			35
#DEFINE SM_CYSCREEN				1
#DEFINE SM_CYSIZE				31
#DEFINE SM_CYSIZEFRAME			SM_CYFRAME
#DEFINE SM_CYSMCAPTION			51
#DEFINE SM_CYSMICON				50
#DEFINE SM_CYSMSIZE				53
#DEFINE SM_CYVIRTUALSCREEN		79
#DEFINE SM_CYVSCROLL			20
#DEFINE SM_CYVTHUMB				9
#DEFINE SM_DBCSENABLED			42
#DEFINE SM_DEBUG				22
#DEFINE SM_MENUDROPALIGNMENT	40
#DEFINE SM_MIDEASTENABLED		74
#DEFINE SM_MOUSEPRESENT			19
#DEFINE SM_MOUSEWHEELPRESENT	75
#DEFINE SM_NETWORK				63
#DEFINE SM_PENWINDOWS			41
#DEFINE SM_RESERVED1			24
#DEFINE SM_RESERVED2			25
#DEFINE SM_RESERVED3			26
#DEFINE SM_RESERVED4			27
#DEFINE SM_SAMEDISPLAYFORMAT	81
#DEFINE SM_SECURE				44
#DEFINE SM_SHOWSOUNDS			70
#DEFINE SM_SLOWMACHINE			73
#DEFINE SM_SWAPBUTTON			23
#DEFINE SM_XVIRTUALSCREEN		76
#DEFINE SM_YVIRTUALSCREEN		77


*-- CONSTANTES PARA EL PARÁMETRO ShowCmd DE ShellExecute
#DEFINE SW_HIDE             0
#DEFINE SW_SHOWNORMAL       1
#DEFINE SW_NORMAL           1
#DEFINE SW_SHOWMINIMIZED    2
#DEFINE SW_SHOWMAXIMIZED    3
#DEFINE SW_MAXIMIZE         3
#DEFINE SW_SHOWNOACTIVATE   4
#DEFINE SW_SHOW             5
#DEFINE SW_MINIMIZE         6
#DEFINE SW_SHOWMINNOACTIVE  7
#DEFINE SW_SHOWNA           8
#DEFINE SW_RESTORE          9
#DEFINE SW_SHOWDEFAULT      10


