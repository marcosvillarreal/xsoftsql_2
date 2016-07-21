/****************************************************************************
*
*  (C) COPYRIGHT 1998-2000, MICROSOFT CORP.
*
*  FILE:        wiadef.h
*
*  VERSION:     2.0
*
*  DATE:        7/27/2000
*
*  DESCRIPTION:
*    Defines WIA constants.
*
*****************************************************************************/

#ifndef _WIADEF_H_
#define _WIADEF_H_

//
// Set packing
//
#include <pshpack8.h>

//
// Include COM definitions
//
#ifndef _NO_COM
#include <objbase.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

/**************************************************************************
*
* WIA Errors
*
***************************************************************************/

//
// Define the facility code. Move this to sdk\inc???
//

#define FACILITY_WIA 33

//
// Definitions for WIA_ERRORs and WIA_STATUSs. Applications can test for these returns
// on API return, to keep users informed of conditions which a user
// could correct.
//

#define BASE_VAL_WIA_ERROR   0x00000000
#define BASE_VAL_WIA_SUCCESS 0x00000000

#define WIA_ERROR_GENERAL_ERROR              MAKE_HRESULT(SEVERITY_ERROR, FACILITY_WIA, (BASE_VAL_WIA_ERROR + 1))
#define WIA_ERROR_PAPER_JAM                  MAKE_HRESULT(SEVERITY_ERROR, FACILITY_WIA, (BASE_VAL_WIA_ERROR + 2))
#define WIA_ERROR_PAPER_EMPTY                MAKE_HRESULT(SEVERITY_ERROR, FACILITY_WIA, (BASE_VAL_WIA_ERROR + 3))
#define WIA_ERROR_PAPER_PROBLEM              MAKE_HRESULT(SEVERITY_ERROR, FACILITY_WIA, (BASE_VAL_WIA_ERROR + 4))
#define WIA_ERROR_OFFLINE                    MAKE_HRESULT(SEVERITY_ERROR, FACILITY_WIA, (BASE_VAL_WIA_ERROR + 5))
#define WIA_ERROR_BUSY                       MAKE_HRESULT(SEVERITY_ERROR, FACILITY_WIA, (BASE_VAL_WIA_ERROR + 6))
#define WIA_ERROR_WARMING_UP                 MAKE_HRESULT(SEVERITY_ERROR, FACILITY_WIA, (BASE_VAL_WIA_ERROR + 7))
#define WIA_ERROR_USER_INTERVENTION          MAKE_HRESULT(SEVERITY_ERROR, FACILITY_WIA, (BASE_VAL_WIA_ERROR + 8))
#define WIA_ERROR_ITEM_DELETED               MAKE_HRESULT(SEVERITY_ERROR, FACILITY_WIA, (BASE_VAL_WIA_ERROR + 9))
#define WIA_ERROR_DEVICE_COMMUNICATION       MAKE_HRESULT(SEVERITY_ERROR, FACILITY_WIA, (BASE_VAL_WIA_ERROR + 10))
#define WIA_ERROR_INVALID_COMMAND            MAKE_HRESULT(SEVERITY_ERROR, FACILITY_WIA, (BASE_VAL_WIA_ERROR + 11))
#define WIA_ERROR_INCORRECT_HARDWARE_SETTING MAKE_HRESULT(SEVERITY_ERROR, FACILITY_WIA, (BASE_VAL_WIA_ERROR + 12))
#define WIA_ERROR_DEVICE_LOCKED              MAKE_HRESULT(SEVERITY_ERROR, FACILITY_WIA, (BASE_VAL_WIA_ERROR + 13))
#define WIA_ERROR_EXCEPTION_IN_DRIVER        MAKE_HRESULT(SEVERITY_ERROR, FACILITY_WIA, (BASE_VAL_WIA_ERROR + 14))
#define WIA_ERROR_INVALID_DRIVER_RESPONSE    MAKE_HRESULT(SEVERITY_ERROR, FACILITY_WIA, (BASE_VAL_WIA_ERROR + 15))


#define WIA_STATUS_END_OF_MEDIA              MAKE_HRESULT(SEVERITY_SUCCESS, FACILITY_WIA, (BASE_VAL_WIA_SUCCESS + 1))

//
// Returned by SelectDeviceDlg and SelectDeviceDlgId when there are no devices avaiable
//
#define WIA_S_NO_DEVICE_AVAILABLE            MAKE_HRESULT(SEVERITY_ERROR, FACILITY_WIA, (BASE_VAL_WIA_ERROR + 21))

//
// SelectDeviceDlg & GetImageDlg flags
//

#define WIA_SELECT_DEVICE_NODEFAULT          0x00000001

//
// GetImageDlg & DeviceDlg flags
//

#define WIA_DEVICE_DIALOG_SINGLE_IMAGE       0x00000002  // Only allow one image to be selected
#define WIA_DEVICE_DIALOG_USE_COMMON_UI      0x00000004  // Give preference to the system-provided UI, if available

//**************************************************************************
//
// Image types
//
//**************************************************************************

DEFINE_GUID(WiaImgFmt_UNDEFINED, 0xb96b3ca9,0x0728,0x11d3,0x9d,0x7b,0x00,0x00,0xf8,0x1e,0xf3,0x2e);
DEFINE_GUID(WiaImgFmt_RAWRGB, 0xbca48b55,0xf272,0x4371,0xb0,0xf1,0x4a,0x15,0xd,0x5,0x7b,0xb4);
DEFINE_GUID(WiaImgFmt_MEMORYBMP, 0xb96b3caa,0x0728,0x11d3,0x9d,0x7b,0x00,0x00,0xf8,0x1e,0xf3,0x2e);
DEFINE_GUID(WiaImgFmt_BMP, 0xb96b3cab,0x0728,0x11d3,0x9d,0x7b,0x00,0x00,0xf8,0x1e,0xf3,0x2e);
DEFINE_GUID(WiaImgFmt_EMF, 0xb96b3cac,0x0728,0x11d3,0x9d,0x7b,0x00,0x00,0xf8,0x1e,0xf3,0x2e);
DEFINE_GUID(WiaImgFmt_WMF, 0xb96b3cad,0x0728,0x11d3,0x9d,0x7b,0x00,0x00,0xf8,0x1e,0xf3,0x2e);
DEFINE_GUID(WiaImgFmt_JPEG, 0xb96b3cae,0x0728,0x11d3,0x9d,0x7b,0x00,0x00,0xf8,0x1e,0xf3,0x2e);
DEFINE_GUID(WiaImgFmt_PNG, 0xb96b3caf,0x0728,0x11d3,0x9d,0x7b,0x00,0x00,0xf8,0x1e,0xf3,0x2e);
DEFINE_GUID(WiaImgFmt_GIF, 0xb96b3cb0,0x0728,0x11d3,0x9d,0x7b,0x00,0x00,0xf8,0x1e,0xf3,0x2e);
DEFINE_GUID(WiaImgFmt_TIFF, 0xb96b3cb1,0x0728,0x11d3,0x9d,0x7b,0x00,0x00,0xf8,0x1e,0xf3,0x2e);
DEFINE_GUID(WiaImgFmt_EXIF, 0xb96b3cb2,0x0728,0x11d3,0x9d,0x7b,0x00,0x00,0xf8,0x1e,0xf3,0x2e);
DEFINE_GUID(WiaImgFmt_PHOTOCD, 0xb96b3cb3,0x0728,0x11d3,0x9d,0x7b,0x00,0x00,0xf8,0x1e,0xf3,0x2e);
DEFINE_GUID(WiaImgFmt_FLASHPIX, 0xb96b3cb4,0x0728,0x11d3,0x9d,0x7b,0x00,0x00,0xf8,0x1e,0xf3,0x2e);
DEFINE_GUID(WiaImgFmt_ICO, 0xb96b3cb5,0x0728,0x11d3,0x9d,0x7b,0x00,0x00,0xf8,0x1e,0xf3,0x2e);
// Canon Image File Format
DEFINE_GUID(WiaImgFmt_CIFF,0x9821a8ab,0x3a7e,0x4215,0x94,0xe0,0xd2,0x7a,0x46,0x0c,0x03,0xb2);
// Quickdraw Image Format
DEFINE_GUID(WiaImgFmt_PICT,0xa6bc85d8,0x6b3e,0x40ee,0xa9,0x5c,0x25,0xd4,0x82,0xe4,0x1a,0xdc);
// JPEG 2000 baseline file format
DEFINE_GUID(WiaImgFmt_JPEG2K,0x344ee2b2,0x39db,0x4dde,0x81,0x73,0xc4,0xb7,0x5f,0x8f,0x1e,0x49);
// JPEG 2000 extended file format
DEFINE_GUID(WiaImgFmt_JPEG2KX,0x43e14614,0xc80a,0x4850,0xba,0xf3,0x4b,0x15,0x2d,0xc8,0xda,0x27);


//**************************************************************************
//
// Document and other types
//
// Note: HTML, AVI, and MPEG used to have different GUIDs. Use the GUIDs
//       defined below from now on.
//
//**************************************************************************

DEFINE_GUID(WiaImgFmt_RTF, 0x573dd6a3,0x4834,0x432d,0xa9,0xb5,0xe1,0x98,0xdd,0x9e,0x89,0xd);
DEFINE_GUID(WiaImgFmt_XML, 0xb9171457,0xdac8,0x4884,0xb3,0x93,0x15,0xb4,0x71,0xd5,0xf0,0x7e);
DEFINE_GUID(WiaImgFmt_HTML, 0xc99a4e62,0x99de,0x4a94,0xac,0xca,0x71,0x95,0x6a,0xc2,0x97,0x7d);
DEFINE_GUID(WiaImgFmt_TXT, 0xfafd4d82,0x723f,0x421f,0x93,0x18,0x30,0x50,0x1a,0xc4,0x4b,0x59);
DEFINE_GUID(WiaImgFmt_MPG, 0xecd757e4,0xd2ec,0x4f57,0x95,0x5d,0xbc,0xf8,0xa9,0x7c,0x4e,0x52);
DEFINE_GUID(WiaImgFmt_AVI, 0x32f8ca14,0x87c,0x4908,0xb7,0xc4,0x67,0x57,0xfe,0x7e,0x90,0xab);
DEFINE_GUID(WiaImgFmt_ASF, 0x8d948ee9,0xd0aa,0x4a12,0x9d,0x9a,0x9c,0xc5,0xde,0x36,0x19,0x9b);
DEFINE_GUID(WiaImgFmt_SCRIPT, 0xfe7d6c53,0x2dac,0x446a,0xb0,0xbd,0xd7,0x3e,0x21,0xe9,0x24,0xc9);
DEFINE_GUID(WiaImgFmt_EXEC, 0x485da097,0x141e,0x4aa5,0xbb,0x3b,0xa5,0x61,0x8d,0x95,0xd0,0x2b);
DEFINE_GUID(WiaImgFmt_UNICODE16,0x1b7639b6,0x6357,0x47d1,0x9a,0x07,0x12,0x45,0x2d,0xc0,0x73,0xe9);
DEFINE_GUID(WiaImgFmt_DPOF,0x369eeeab,0xa0e8,0x45ca,0x86,0xa6,0xa8,0x3c,0xe5,0x69,0x7e,0x28);


//**************************************************************************
//
// Audio types
//
//**************************************************************************

DEFINE_GUID(WiaAudFmt_WAV, 0xf818e146,0x07af,0x40ff,0xae,0x55,0xbe,0x8f,0x2c,0x06,0x5d,0xbe);
DEFINE_GUID(WiaAudFmt_MP3, 0x0fbc71fb,0x43bf,0x49f2,0x91,0x90,0xe6,0xfe,0xcf,0xf3,0x7e,0x54);
DEFINE_GUID(WiaAudFmt_AIFF, 0x66e2bf4f,0xb6fc,0x443f,0x94,0xc8,0x2f,0x33,0xc8,0xa6,0x5a,0xaf);
DEFINE_GUID(WiaAudFmt_WMA, 0xd61d6413,0x8bc2,0x438f,0x93,0xad,0x21,0xbd,0x48,0x4d,0xb6,0xa1);


//**************************************************************************
//
// WIA Events
//
//**************************************************************************

//
// Event registration flags, used by RegisterEventLaunch,
// RegisterEventCallbackInterface and RegisterEventCallbackCLSID.
//

#define  WIA_REGISTER_EVENT_CALLBACK        0x00000001
#define  WIA_UNREGISTER_EVENT_CALLBACK      0x00000002
#define  WIA_SET_DEFAULT_HANDLER            0x00000004

//
// Event type : individual bits of the possible event type combinations
//

#define  WIA_NOTIFICATION_EVENT             0x00000001
#define  WIA_ACTION_EVENT                   0x00000002

//
// Flag to indicate the corresponding persistent handler is default
//

#define  WIA_IS_DEFAULT_HANDLER             0x00000001

//
// Event GUIDs
//

DEFINE_GUID(WIA_EVENT_DEVICE_DISCONNECTED,  0x143e4e83, 0x6497, 0x11d2, 0xa2, 0x31, 0x0, 0xc0, 0x4f, 0xa3, 0x18, 0x9);
DEFINE_GUID(WIA_EVENT_DEVICE_CONNECTED,     0xa28bbade, 0x64b6, 0x11d2, 0xa2, 0x31, 0x0, 0xc0, 0x4f, 0xa3, 0x18, 0x9);
DEFINE_GUID(WIA_EVENT_ITEM_DELETED,         0x1d22a559, 0xe14f, 0x11d2, 0xb3, 0x26, 0x00, 0xc0, 0x4f, 0x68, 0xce, 0x61);
DEFINE_GUID(WIA_EVENT_ITEM_CREATED,         0x4c8f4ef5, 0xe14f, 0x11d2, 0xb3, 0x26, 0x00, 0xc0, 0x4f, 0x68, 0xce, 0x61);
DEFINE_GUID(WIA_EVENT_TREE_UPDATED,         0xc9859b91, 0x4ab2, 0x4cd6, 0xa1, 0xfc, 0x58, 0x2e, 0xec, 0x55, 0xe5, 0x85);
DEFINE_GUID(WIA_EVENT_VOLUME_INSERT,        0x9638bbfd, 0xd1bd, 0x11d2, 0xb3, 0x1f, 0x00, 0xc0, 0x4f, 0x68, 0xce, 0x61);
DEFINE_GUID(WIA_EVENT_SCAN_IMAGE,           0xa6c5a715, 0x8c6e, 0x11d2, 0x97, 0x7a, 0x0, 0x0, 0xf8, 0x7a, 0x92, 0x6f);
DEFINE_GUID(WIA_EVENT_SCAN_PRINT_IMAGE,     0xb441f425, 0x8c6e, 0x11d2, 0x97, 0x7a, 0x0, 0x0, 0xf8, 0x7a, 0x92, 0x6f);
DEFINE_GUID(WIA_EVENT_SCAN_FAX_IMAGE,       0xc00eb793, 0x8c6e, 0x11d2, 0x97, 0x7a, 0x0, 0x0, 0xf8, 0x7a, 0x92, 0x6f);
DEFINE_GUID(WIA_EVENT_SCAN_OCR_IMAGE,       0x9d095b89, 0x37d6, 0x4877, 0xaf, 0xed, 0x62, 0xa2, 0x97, 0xdc, 0x6d, 0xbe);
DEFINE_GUID(WIA_EVENT_SCAN_EMAIL_IMAGE,     0xc686dcee, 0x54f2, 0x419e, 0x9a, 0x27, 0x2f, 0xc7, 0xf2, 0xe9, 0x8f, 0x9e);
DEFINE_GUID(WIA_EVENT_SCAN_FILM_IMAGE,      0x9b2b662c, 0x6185, 0x438c, 0xb6, 0x8b, 0xe3, 0x9e, 0xe2, 0x5e, 0x71, 0xcb);
DEFINE_GUID(WIA_EVENT_SCAN_IMAGE2,          0xfc4767c1, 0xc8b3, 0x48a2, 0x9c, 0xfa, 0x2e, 0x90, 0xcb, 0x3d, 0x35, 0x90);
DEFINE_GUID(WIA_EVENT_SCAN_IMAGE3,          0x154e27be, 0xb617, 0x4653, 0xac, 0xc5, 0xf, 0xd7, 0xbd, 0x4c, 0x65, 0xce);
DEFINE_GUID(WIA_EVENT_SCAN_IMAGE4,          0xa65b704a, 0x7f3c, 0x4447, 0xa7, 0x5d, 0x8a, 0x26, 0xdf, 0xca, 0x1f, 0xdf);
DEFINE_GUID(WIA_EVENT_STORAGE_CREATED,      0x353308b2, 0xfe73, 0x46c8, 0x89, 0x5e, 0xfa, 0x45, 0x51, 0xcc, 0xc8, 0x5a);
DEFINE_GUID(WIA_EVENT_STORAGE_DELETED,      0x5e41e75e, 0x9390, 0x44c5, 0x9a, 0x51, 0xe4, 0x70, 0x19, 0xe3, 0x90, 0xcf);
DEFINE_GUID(WIA_EVENT_STI_PROXY,            0xd711f81f, 0x1f0d, 0x422d, 0x86, 0x41, 0x92, 0x7d, 0x1b, 0x93, 0xe5, 0xe5);
DEFINE_GUID(WIA_EVENT_CANCEL_IO,            0xc860f7b8, 0x9ccd, 0x41ea, 0xbb, 0xbf, 0x4d, 0xd0, 0x9c, 0x5b, 0x17, 0x95);

//
// Power management event GUIDs, sent by the WIA service to drivers
//

DEFINE_GUID(WIA_EVENT_POWER_SUSPEND,    0xa0922ff9, 0xc3b4, 0x411c, 0x9e, 0x29, 0x03, 0xa6, 0x69, 0x93, 0xd2, 0xbe);
DEFINE_GUID(WIA_EVENT_POWER_RESUME,     0x618f153e, 0xf686, 0x4350, 0x96, 0x34, 0x41, 0x15, 0xa3, 0x04, 0x83, 0x0c);


//
// No action handler and prompt handler
//

DEFINE_GUID(WIA_EVENT_HANDLER_NO_ACTION, 0xe0372b7d, 0xe115, 0x4525, 0xbc, 0x55, 0xb6, 0x29, 0xe6, 0x8c, 0x74, 0x5a);
DEFINE_GUID(WIA_EVENT_HANDLER_PROMPT, 0x5f4baad0, 0x4d59, 0x4fcd, 0xb2, 0x13, 0x78, 0x3c, 0xe7, 0xa9, 0x2f, 0x22);

#define WIA_EVENT_DEVICE_DISCONNECTED_STR   L"Device Disconnected"
#define WIA_EVENT_DEVICE_CONNECTED_STR      L"Device Connected"


//**************************************************************************
//
// WIA Commands
//
//**************************************************************************

DEFINE_GUID(WIA_CMD_SYNCHRONIZE, 0x9b26b7b2, 0xacad, 0x11d2, 0xa0, 0x93, 0x00, 0xc0, 0x4f, 0x72, 0xdc, 0x3c);
DEFINE_GUID(WIA_CMD_TAKE_PICTURE, 0xaf933cac, 0xacad, 0x11d2, 0xa0, 0x93, 0x00, 0xc0, 0x4f, 0x72, 0xdc, 0x3c);
DEFINE_GUID(WIA_CMD_DELETE_ALL_ITEMS, 0xe208c170, 0xacad, 0x11d2, 0xa0, 0x93, 0x00, 0xc0, 0x4f, 0x72, 0xdc, 0x3c);
DEFINE_GUID(WIA_CMD_CHANGE_DOCUMENT, 0x04e725b0, 0xacae, 0x11d2, 0xa0, 0x93, 0x00, 0xc0, 0x4f, 0x72, 0xdc, 0x3c);
DEFINE_GUID(WIA_CMD_UNLOAD_DOCUMENT, 0x1f3b3d8e, 0xacae, 0x11d2, 0xa0, 0x93, 0x00, 0xc0, 0x4f, 0x72, 0xdc, 0x3c);
DEFINE_GUID(WIA_CMD_DIAGNOSTIC, 0x10ff52f5, 0xde04, 0x4cf0, 0xa5, 0xad, 0x69, 0x1f, 0x8d, 0xce, 0x01, 0x41);

//
// The following are private commands for debugging use only.
//

DEFINE_GUID(WIA_CMD_DELETE_DEVICE_TREE, 0x73815942, 0xdbea, 0x11d2, 0x84, 0x16, 0x00, 0xc0, 0x4f, 0xa3, 0x61, 0x45);
DEFINE_GUID(WIA_CMD_BUILD_DEVICE_TREE, 0x9cba5ce0, 0xdbea, 0x11d2, 0x84, 0x16, 0x00, 0xc0, 0x4f, 0xa3, 0x61, 0x45);


//**************************************************************************
//
// WIA Icons
//
//   Event   : -1000 to -1499 (Standard), -1500 to -1999 (Custom)
//   Command : -2000 to -2499 (Standard), -2500 to -2999 (Custom)
//
//**************************************************************************

#define WIA_ICON_DEVICE_DISCONNECTED    (L"sti.dll,-1001")
#define WIA_ICON_DEVICE_CONNECTED       (L"sti.dll,-1001")
#define WIA_ICON_ITEM_DELETED           (L"sti.dll,-1001")
#define WIA_ICON_ITEM_CREATED           (L"sti.dll,-1001")
#define WIA_ICON_VOLUME_INSERT          (L"sti.dll,-1001")
#define WIA_ICON_SCAN_BUTTON_PRESS      (L"sti.dll,-1001")
#define WIA_ICON_SYNCHRONIZE            (L"sti.dll,-2000")
#define WIA_ICON_TAKE_PICTURE           (L"sti.dll,-2001")
#define WIA_ICON_DELETE_ALL_ITEMS       (L"sti.dll,-2002")
#define WIA_ICON_CHANGE_DOCUMENT        (L"sti.dll,-2003")
#define WIA_ICON_UNLOAD_DOCUMENT        (L"sti.dll,-2004")
#define WIA_ICON_DELETE_DEVICE_TREE     (L"sti.dll,-2005")
#define WIA_ICON_BUILD_DEVICE_TREE      (L"sti.dll,-2006")


//**************************************************************************
//
// WIA Callbacks
//
//**************************************************************************

//
// IImageTransfer TYMED
//

#define TYMED_CALLBACK                          128
#define TYMED_MULTIPAGE_FILE                    256
#define TYMED_MULTIPAGE_CALLBACK                512

//
// IImageTransfer Callback Status. Messages must be a single value
//

#define IT_MSG_DATA_HEADER                      0x0001
#define IT_MSG_DATA                             0x0002
#define IT_MSG_STATUS                           0x0003
#define IT_MSG_TERMINATION                      0x0004
#define IT_MSG_NEW_PAGE                         0x0005
#define IT_MSG_FILE_PREVIEW_DATA                0x0006
#define IT_MSG_FILE_PREVIEW_DATA_HEADER         0x0007

//
//  Flags may be bit field combinations
//

#define IT_STATUS_TRANSFER_FROM_DEVICE          0x0001
#define IT_STATUS_PROCESSING_DATA               0x0002
#define IT_STATUS_TRANSFER_TO_CLIENT            0x0004

//
// IWIAEventCallback codes
//

#define WIA_MAJOR_EVENT_DEVICE_CONNECT          0x01
#define WIA_MAJOR_EVENT_DEVICE_DISCONNECT       0x02
#define WIA_MAJOR_EVENT_PICTURE_TAKEN           0x03
#define WIA_MAJOR_EVENT_PICTURE_DELETED         0x04

//
// Device connection status
//

#define  WIA_DEVICE_NOT_CONNECTED               0
#define  WIA_DEVICE_CONNECTED                   1


//**************************************************************************
//
// WIA Enumeration Flags
//
//**************************************************************************

//
// EnumDeviceCapabilities flags
//

#define WIA_DEVICE_COMMANDS 1
#define WIA_DEVICE_EVENTS 2

//
// EnumDeviceInfo Flags
//

#define WIA_DEVINFO_ENUM_LOCAL                  0x00000010


//**************************************************************************
//
// WIA Item constants
//
//**************************************************************************

//
// Item Types
//

#define WiaItemTypeFree                         0x00000000
#define WiaItemTypeImage                        0x00000001
#define WiaItemTypeFile                         0x00000002
#define WiaItemTypeFolder                       0x00000004
#define WiaItemTypeRoot                         0x00000008
#define WiaItemTypeAnalyze                      0x00000010
#define WiaItemTypeAudio                        0x00000020
#define WiaItemTypeDevice                       0x00000040
#define WiaItemTypeDeleted                      0x00000080
#define WiaItemTypeDisconnected                 0x00000100
#define WiaItemTypeHPanorama                    0x00000200
#define WiaItemTypeVPanorama                    0x00000400
#define WiaItemTypeBurst                        0x00000800
#define WiaItemTypeStorage                      0x00001000
#define WiaItemTypeTransfer                     0x00002000
#define WiaItemTypeGenerated                    0x00004000
#define WiaItemTypeHasAttachments               0x00008000
#define WiaItemTypeVideo                        0x00010000

//
// 0x00020000 has been reserved for the TWAIN compatiblity layer
// pass-through feature.
//

#define WiaItemTypeRemoved                      0x80000000

#define WiaItemTypeMask                         0x8003FFFF

//
// Big max device specific item context
//

#define WIA_MAX_CTX_SIZE                        0x01000000


//**************************************************************************
//
// WIA Properties
//
//**************************************************************************

//
// Property access flags
//

#define WIA_PROP_READ            0x01
#define WIA_PROP_WRITE           0x02
#define WIA_PROP_RW              (WIA_PROP_READ | WIA_PROP_WRITE)
#define WIA_PROP_SYNC_REQUIRED   0x04

#define WIA_PROP_NONE            0x08
#define WIA_PROP_RANGE           0x10
#define WIA_PROP_LIST            0x20
#define WIA_PROP_FLAG            0x40

#define WIA_PROP_CACHEABLE       0x10000

//
// Item access flags
//

#define WIA_ITEM_CAN_BE_DELETED  0x80
#define WIA_ITEM_READ            WIA_PROP_READ
#define WIA_ITEM_WRITE           WIA_PROP_WRITE
#define WIA_ITEM_RD              (WIA_ITEM_READ | WIA_ITEM_CAN_BE_DELETED)
#define WIA_ITEM_RWD             (WIA_ITEM_READ | WIA_ITEM_WRITE | WIA_ITEM_CAN_BE_DELETED)

#ifndef __WIAPROP_H_INCLUDED
#define __WIAPROP_H_INCLUDED

//
// Device information properties
//

#define WIA_RESERVED_FOR_SMALL_NEW_PROPS        256
#define WIA_RESERVED_FOR_NEW_PROPS              1024
#define WIA_RESERVED_FOR_ALL_MS_PROPS           (1024*32)

#define WIA_DIP_FIRST                           2
#define WIA_DIP_DEV_ID                          2
#define WIA_DIP_VEND_DESC                       3
#define WIA_DIP_DEV_DESC                        4
#define WIA_DIP_DEV_TYPE                        5
#define WIA_DIP_PORT_NAME                       6
#define WIA_DIP_DEV_NAME                        7
#define WIA_DIP_SERVER_NAME                     8
#define WIA_DIP_REMOTE_DEV_ID                   9
#define WIA_DIP_UI_CLSID                        10
#define WIA_DIP_HW_CONFIG                       11
#define WIA_DIP_BAUDRATE                        12
#define WIA_DIP_STI_GEN_CAPABILITIES            13
#define WIA_DIP_WIA_VERSION                     14
#define WIA_DIP_DRIVER_VERSION                  15
#define WIA_DIP_LAST                            15

#define WIA_NUM_DIP          1 + WIA_DIP_LAST - WIA_DIP_FIRST

#define WIA_DIP_DEV_ID_STR                      L"Unique Device ID"
#define WIA_DIP_VEND_DESC_STR                   L"Manufacturer"
#define WIA_DIP_DEV_DESC_STR                    L"Description"
#define WIA_DIP_DEV_TYPE_STR                    L"Type"
#define WIA_DIP_PORT_NAME_STR                   L"Port"
#define WIA_DIP_DEV_NAME_STR                    L"Name"
#define WIA_DIP_SERVER_NAME_STR                 L"Server"
#define WIA_DIP_REMOTE_DEV_ID_STR               L"Remote Device ID"
#define WIA_DIP_UI_CLSID_STR                    L"UI Class ID"
#define WIA_DIP_HW_CONFIG_STR                   L"Hardware Configuration"
#define WIA_DIP_BAUDRATE_STR                    L"BaudRate"
#define WIA_DIP_STI_GEN_CAPABILITIES_STR        L"STI Generic Capabilities"
#define WIA_DIP_WIA_VERSION_STR                 L"WIA Version"
#define WIA_DIP_DRIVER_VERSION_STR              L"Driver Version"


//
// Constant arrays for device information property init
//

#ifdef WIA_DECLARE_DEVINFO_PROP_ARRAY

PROPSPEC g_psDeviceInfo[WIA_NUM_DIP] =
{
    {PRSPEC_PROPID, WIA_DIP_DEV_ID},
    {PRSPEC_PROPID, WIA_DIP_VEND_DESC},
    {PRSPEC_PROPID, WIA_DIP_DEV_DESC},
    {PRSPEC_PROPID, WIA_DIP_DEV_TYPE},
    {PRSPEC_PROPID, WIA_DIP_PORT_NAME},
    {PRSPEC_PROPID, WIA_DIP_DEV_NAME},
    {PRSPEC_PROPID, WIA_DIP_SERVER_NAME},
    {PRSPEC_PROPID, WIA_DIP_REMOTE_DEV_ID},
    {PRSPEC_PROPID, WIA_DIP_UI_CLSID},
    {PRSPEC_PROPID, WIA_DIP_HW_CONFIG},
    {PRSPEC_PROPID, WIA_DIP_BAUDRATE},
    {PRSPEC_PROPID, WIA_DIP_STI_GEN_CAPABILITIES},
    {PRSPEC_PROPID, WIA_DIP_WIA_VERSION},
    {PRSPEC_PROPID, WIA_DIP_DRIVER_VERSION},
};

PROPID g_piDeviceInfo[WIA_NUM_DIP] =
{
    WIA_DIP_DEV_ID,
    WIA_DIP_VEND_DESC,
    WIA_DIP_DEV_DESC,
    WIA_DIP_DEV_TYPE,
    WIA_DIP_PORT_NAME,
    WIA_DIP_DEV_NAME,
    WIA_DIP_SERVER_NAME,
    WIA_DIP_REMOTE_DEV_ID,
    WIA_DIP_UI_CLSID,
    WIA_DIP_HW_CONFIG,
    WIA_DIP_BAUDRATE,
    WIA_DIP_STI_GEN_CAPABILITIES,
    WIA_DIP_WIA_VERSION,
    WIA_DIP_DRIVER_VERSION,
};

LPOLESTR g_pszDeviceInfo[WIA_NUM_DIP] =
{
    WIA_DIP_DEV_ID_STR,
    WIA_DIP_VEND_DESC_STR,
    WIA_DIP_DEV_DESC_STR,
    WIA_DIP_DEV_TYPE_STR,
    WIA_DIP_PORT_NAME_STR,
    WIA_DIP_DEV_NAME_STR,
    WIA_DIP_SERVER_NAME_STR,
    WIA_DIP_REMOTE_DEV_ID_STR,
    WIA_DIP_UI_CLSID_STR,
    WIA_DIP_HW_CONFIG_STR,
    WIA_DIP_BAUDRATE_STR,
    WIA_DIP_STI_GEN_CAPABILITIES_STR,
    WIA_DIP_WIA_VERSION_STR,
    WIA_DIP_DRIVER_VERSION_STR,
};

#else

extern PROPSPEC             g_psDeviceInfo[WIA_NUM_DIP];
extern PROPID               g_piDeviceInfo[WIA_NUM_DIP];
extern LPOLESTR             g_pszDeviceInfo[WIA_NUM_DIP];

#endif


//
// Common device properties
//

#define WIA_DPA_FIRST                           WIA_DIP_FIRST + WIA_RESERVED_FOR_NEW_PROPS
#define WIA_DPA_FIRMWARE_VERSION                WIA_DPA_FIRST + 0
#define WIA_DPA_CONNECT_STATUS                  WIA_DPA_FIRST + 1
#define WIA_DPA_DEVICE_TIME                     WIA_DPA_FIRST + 2
#define WIA_DPA_LAST                            WIA_DPA_FIRST + 3

#define WIA_DPA_FIRMWARE_VERSION_STR            L"Firmware Version"
#define WIA_DPA_CONNECT_STATUS_STR              L"Connect Status"
#define WIA_DPA_DEVICE_TIME_STR                 L"Device Time"

#define WIA_NUM_DPA (1 + WIA_DPA_LAST - WIA_DPA_FIRST)


//
// Camera device properties
//

#define WIA_DPC_FIRST                           WIA_DPA_FIRST + WIA_RESERVED_FOR_NEW_PROPS
#define WIA_DPC_PICTURES_TAKEN                  WIA_DPC_FIRST + 0
#define WIA_DPC_PICTURES_REMAINING              WIA_DPC_FIRST + 1
#define WIA_DPC_EXPOSURE_MODE                   WIA_DPC_FIRST + 2
#define WIA_DPC_EXPOSURE_COMP                   WIA_DPC_FIRST + 3
#define WIA_DPC_EXPOSURE_TIME                   WIA_DPC_FIRST + 4
#define WIA_DPC_FNUMBER                         WIA_DPC_FIRST + 5
#define WIA_DPC_FLASH_MODE                      WIA_DPC_FIRST + 6
#define WIA_DPC_FOCUS_MODE                      WIA_DPC_FIRST + 7
#define WIA_DPC_FOCUS_MANUAL_DIST               WIA_DPC_FIRST + 8
#define WIA_DPC_ZOOM_POSITION                   WIA_DPC_FIRST + 9
#define WIA_DPC_PAN_POSITION                    WIA_DPC_FIRST + 10
#define WIA_DPC_TILT_POSITION                   WIA_DPC_FIRST + 11
#define WIA_DPC_TIMER_MODE                      WIA_DPC_FIRST + 12
#define WIA_DPC_TIMER_VALUE                     WIA_DPC_FIRST + 13
#define WIA_DPC_POWER_MODE                      WIA_DPC_FIRST + 14
#define WIA_DPC_BATTERY_STATUS                  WIA_DPC_FIRST + 15
#define WIA_DPC_THUMB_WIDTH                     WIA_DPC_FIRST + 16
#define WIA_DPC_THUMB_HEIGHT                    WIA_DPC_FIRST + 17
#define WIA_DPC_PICT_WIDTH                      WIA_DPC_FIRST + 18
#define WIA_DPC_PICT_HEIGHT                     WIA_DPC_FIRST + 19
#define WIA_DPC_DIMENSION                       WIA_DPC_FIRST + 20
#define WIA_DPC_COMPRESSION_SETTING             WIA_DPC_FIRST + 21
#define WIA_DPC_FOCUS_METERING                  WIA_DPC_FIRST + 22
#define WIA_DPC_TIMELAPSE_INTERVAL              WIA_DPC_FIRST + 23
#define WIA_DPC_TIMELAPSE_NUMBER                WIA_DPC_FIRST + 24
#define WIA_DPC_BURST_INTERVAL                  WIA_DPC_FIRST + 25
#define WIA_DPC_BURST_NUMBER                    WIA_DPC_FIRST + 26
#define WIA_DPC_EFFECT_MODE                     WIA_DPC_FIRST + 27
#define WIA_DPC_DIGITAL_ZOOM                    WIA_DPC_FIRST + 28
#define WIA_DPC_SHARPNESS                       WIA_DPC_FIRST + 29
#define WIA_DPC_CONTRAST                        WIA_DPC_FIRST + 30
#define WIA_DPC_CAPTURE_MODE                    WIA_DPC_FIRST + 31
#define WIA_DPC_CAPTURE_DELAY                   WIA_DPC_FIRST + 32
#define WIA_DPC_EXPOSURE_INDEX                  WIA_DPC_FIRST + 33
#define WIA_DPC_EXPOSURE_METERING_MODE          WIA_DPC_FIRST + 34
#define WIA_DPC_FOCUS_METERING_MODE             WIA_DPC_FIRST + 35
#define WIA_DPC_FOCUS_DISTANCE                  WIA_DPC_FIRST + 36
#define WIA_DPC_FOCAL_LENGTH                    WIA_DPC_FIRST + 37
#define WIA_DPC_RGB_GAIN                        WIA_DPC_FIRST + 38
#define WIA_DPC_WHITE_BALANCE                   WIA_DPC_FIRST + 39
#define WIA_DPC_UPLOAD_URL                      WIA_DPC_FIRST + 40
#define WIA_DPC_ARTIST                          WIA_DPC_FIRST + 41
#define WIA_DPC_COPYRIGHT_INFO                  WIA_DPC_FIRST + 42
#define WIA_DPC_LAST                            WIA_DPC_FIRST + 42

#define WIA_DPC_PICTURES_TAKEN_STR              L"Pictures Taken"
#define WIA_DPC_PICTURES_REMAINING_STR          L"Pictures Remaining"
#define WIA_DPC_EXPOSURE_MODE_STR               L"Exposure Mode"
#define WIA_DPC_EXPOSURE_COMP_STR               L"Exposure Compensation"
#define WIA_DPC_EXPOSURE_TIME_STR               L"Exposure Time"
#define WIA_DPC_FNUMBER_STR                     L"F Number"
#define WIA_DPC_FLASH_MODE_STR                  L"Flash Mode"
#define WIA_DPC_FOCUS_MODE_STR                  L"Focus Mode"
#define WIA_DPC_FOCUS_MANUAL_DIST_STR           L"Focus Manual Dist"
#define WIA_DPC_ZOOM_POSITION_STR               L"Zoom Position"
#define WIA_DPC_PAN_POSITION_STR                L"Pan Position"
#define WIA_DPC_TILT_POSITION_STR               L"Tilt Position"
#define WIA_DPC_TIMER_MODE_STR                  L"Timer Mode"
#define WIA_DPC_TIMER_VALUE_STR                 L"Timer Value"
#define WIA_DPC_POWER_MODE_STR                  L"Power Mode"
#define WIA_DPC_BATTERY_STATUS_STR              L"Battery Status"
#define WIA_DPC_THUMB_WIDTH_STR                 L"Thumbnail Width"
#define WIA_DPC_THUMB_HEIGHT_STR                L"Thumbnail Height"
#define WIA_DPC_PICT_WIDTH_STR                  L"Picture Width"
#define WIA_DPC_PICT_HEIGHT_STR                 L"Picture Height"
#define WIA_DPC_DIMENSION_STR                   L"Dimension"
#define WIA_DPC_COMPRESSION_SETTING_STR         L"Compression Setting"
#define WIA_DPC_FOCUS_METERING_MODE_STR         L"Focus Metering Mode"
#define WIA_DPC_TIMELAPSE_INTERVAL_STR          L"Timelapse Interval"
#define WIA_DPC_TIMELAPSE_NUMBER_STR            L"Timelapse Number"
#define WIA_DPC_BURST_INTERVAL_STR              L"Burst Interval"
#define WIA_DPC_BURST_NUMBER_STR                L"Burst Number"
#define WIA_DPC_EFFECT_MODE_STR                 L"Effect Mode"
#define WIA_DPC_DIGITAL_ZOOM_STR                L"Digital Zoom"
#define WIA_DPC_SHARPNESS_STR                   L"Sharpness"
#define WIA_DPC_CONTRAST_STR                    L"Contrast"
#define WIA_DPC_CAPTURE_MODE_STR                L"Capture Mode"
#define WIA_DPC_CAPTURE_DELAY_STR               L"Capture Delay"
#define WIA_DPC_EXPOSURE_INDEX_STR              L"Exposure Index"
#define WIA_DPC_EXPOSURE_METERING_MODE_STR      L"Exposure Metering Mode"
#define WIA_DPC_FOCUS_DISTANCE_STR              L"Focus Distance"
#define WIA_DPC_FOCAL_LENGTH_STR                L"Focus Length"
#define WIA_DPC_RGB_GAIN_STR                    L"RGB Gain"
#define WIA_DPC_WHITE_BALANCE_STR               L"White Balance"
#define WIA_DPC_UPLOAD_URL_STR                  L"Upload URL"
#define WIA_DPC_ARTIST_STR                      L"Artist"
#define WIA_DPC_COPYRIGHT_INFO_STR              L"Copyright Info"

#define WIA_NUM_DPC (1 + WIA_DPC_LAST - WIA_DPC_FIRST)


//
// Scanner device properties
//

#define WIA_DPS_FIRST                                  WIA_DPC_FIRST + WIA_RESERVED_FOR_NEW_PROPS
#define WIA_DPS_HORIZONTAL_BED_SIZE                    WIA_DPS_FIRST + 0
#define WIA_DPS_VERTICAL_BED_SIZE                      WIA_DPS_FIRST + 1
#define WIA_DPS_HORIZONTAL_SHEET_FEED_SIZE             WIA_DPS_FIRST + 2
#define WIA_DPS_VERTICAL_SHEET_FEED_SIZE               WIA_DPS_FIRST + 3
#define WIA_DPS_SHEET_FEEDER_REGISTRATION              WIA_DPS_FIRST + 4
#define WIA_DPS_HORIZONTAL_BED_REGISTRATION            WIA_DPS_FIRST + 5
#define WIA_DPS_VERTICAL_BED_REGISTRATION              WIA_DPS_FIRST + 6
#define WIA_DPS_PLATEN_COLOR                           WIA_DPS_FIRST + 7
#define WIA_DPS_PAD_COLOR                              WIA_DPS_FIRST + 8
#define WIA_DPS_FILTER_SELECT                          WIA_DPS_FIRST + 9
#define WIA_DPS_DITHER_SELECT                          WIA_DPS_FIRST + 10
#define WIA_DPS_DITHER_PATTERN_DATA                    WIA_DPS_FIRST + 11
#define WIA_DPS_DOCUMENT_HANDLING_CAPABILITIES         WIA_DPS_FIRST + 12
#define WIA_DPS_DOCUMENT_HANDLING_STATUS               WIA_DPS_FIRST + 13
#define WIA_DPS_DOCUMENT_HANDLING_SELECT               WIA_DPS_FIRST + 14
#define WIA_DPS_DOCUMENT_HANDLING_CAPACITY             WIA_DPS_FIRST + 15
#define WIA_DPS_OPTICAL_XRES                           WIA_DPS_FIRST + 16
#define WIA_DPS_OPTICAL_YRES                           WIA_DPS_FIRST + 17
#define WIA_DPS_ENDORSER_CHARACTERS                    WIA_DPS_FIRST + 18
#define WIA_DPS_ENDORSER_STRING                        WIA_DPS_FIRST + 19
#define WIA_DPS_SCAN_AHEAD_PAGES                       WIA_DPS_FIRST + 20
#define WIA_DPS_MAX_SCAN_TIME                          WIA_DPS_FIRST + 21
#define WIA_DPS_PAGES                                  WIA_DPS_FIRST + 22
#define WIA_DPS_PAGE_SIZE                              WIA_DPS_FIRST + 23
#define WIA_DPS_PAGE_WIDTH                             WIA_DPS_FIRST + 24
#define WIA_DPS_PAGE_HEIGHT                            WIA_DPS_FIRST + 25
#define WIA_DPS_PREVIEW                                WIA_DPS_FIRST + 26
#define WIA_DPS_TRANSPARENCY                           WIA_DPS_FIRST + 27
#define WIA_DPS_TRANSPARENCY_SELECT                    WIA_DPS_FIRST + 28
#define WIA_DPS_SHOW_PREVIEW_CONTROL                   WIA_DPS_FIRST + 29
#define WIA_DPS_MIN_HORIZONTAL_SHEET_FEED_SIZE         WIA_DPS_FIRST + 30
#define WIA_DPS_MIN_VERTICAL_SHEET_FEED_SIZE           WIA_DPS_FIRST + 31
#define WIA_DPS_LAST                                   WIA_DPS_FIRST + 31

#define WIA_DPS_HORIZONTAL_BED_SIZE_STR                L"Horizontal Bed Size"
#define WIA_DPS_VERTICAL_BED_SIZE_STR                  L"Vertical Bed Size"
#define WIA_DPS_HORIZONTAL_SHEET_FEED_SIZE_STR         L"Horizontal Sheet Feed Size"
#define WIA_DPS_VERTICAL_SHEET_FEED_SIZE_STR           L"Vertical Sheet Feed Size"
#define WIA_DPS_SHEET_FEEDER_REGISTRATION_STR          L"Sheet Feeder Registration"
#define WIA_DPS_HORIZONTAL_BED_REGISTRATION_STR        L"Horizontal Bed Registration"
#define WIA_DPS_VERTICAL_BED_REGISTRATION_STR          L"Vertical Bed Registration"
#define WIA_DPS_PLATEN_COLOR_STR                       L"Platen Color"
#define WIA_DPS_PAD_COLOR_STR                          L"Pad Color"
#define WIA_DPS_FILTER_SELECT_STR                      L"Filter Select"
#define WIA_DPS_DITHER_SELECT_STR                      L"Dither Select"
#define WIA_DPS_DITHER_PATTERN_DATA_STR                L"Dither Pattern Data"
#define WIA_DPS_DOCUMENT_HANDLING_CAPABILITIES_STR     L"Document Handling Capabilities"
#define WIA_DPS_DOCUMENT_HANDLING_STATUS_STR           L"Document Handling Status"
#define WIA_DPS_DOCUMENT_HANDLING_SELECT_STR           L"Document Handling Select"
#define WIA_DPS_DOCUMENT_HANDLING_CAPACITY_STR         L"Document Handling Capacity"
#define WIA_DPS_OPTICAL_XRES_STR                       L"Horizontal Optical Resolution"
#define WIA_DPS_OPTICAL_YRES_STR                       L"Vertical Optical Resolution"
#define WIA_DPS_ENDORSER_CHARACTERS_STR                L"Endorser Characters"
#define WIA_DPS_ENDORSER_STRING_STR                    L"Endorser String"
#define WIA_DPS_SCAN_AHEAD_PAGES_STR                   L"Scan Ahead Pages"
#define WIA_DPS_MAX_SCAN_TIME_STR                      L"Max Scan Time"
#define WIA_DPS_PAGES_STR                              L"Pages"
#define WIA_DPS_PAGE_SIZE_STR                          L"Page Size"
#define WIA_DPS_PAGE_WIDTH_STR                         L"Page Width"
#define WIA_DPS_PAGE_HEIGHT_STR                        L"Page Height"
#define WIA_DPS_PREVIEW_STR                            L"Preview"
#define WIA_DPS_TRANSPARENCY_STR                       L"Transparency Adapter"
#define WIA_DPS_TRANSPARENCY_SELECT_STR                L"Transparency Adapter Select"
#define WIA_DPS_SHOW_PREVIEW_CONTROL_STR               L"Show preview control"
#define WIA_DPS_MIN_HORIZONTAL_SHEET_FEED_SIZE_STR     L"Minimum Horizontal Sheet Feed Size"
#define WIA_DPS_MIN_VERTICAL_SHEET_FEED_SIZE_STR       L"Minimum Vertical Sheet Feed Size"

#define WIA_NUM_DPS (1 + WIA_DPS_LAST - WIA_DPS_FIRST)


//
// File System Properties
//
#define WIA_DPF_FIRST                           WIA_DPS_FIRST + WIA_RESERVED_FOR_SMALL_NEW_PROPS
#define WIA_DPF_MOUNT_POINT                     WIA_DPF_FIRST + 0
#define WIA_DPF_LAST                            WIA_DPF_FIRST + 0

#define WIA_DPF_MOUNT_POINT_STR                 L"Directory mount point"

#define WIA_NUM_DPF (1 + WIA_DPF_LAST - WIA_DPF_FIRST)

//
// Video Camera properties.
//
//
#define WIA_DPV_FIRST                           WIA_DPF_FIRST + WIA_RESERVED_FOR_SMALL_NEW_PROPS
#define WIA_DPV_LAST_PICTURE_TAKEN              WIA_DPV_FIRST + 0
#define WIA_DPV_IMAGES_DIRECTORY                WIA_DPV_FIRST + 1
#define WIA_DPV_DSHOW_DEVICE_PATH               WIA_DPV_FIRST + 2
#define WIA_DPV_LAST                            WIA_DPV_FIRST + 2

#define WIA_DPV_LAST_PICTURE_TAKEN_STR          L"Last Picture Taken"
#define WIA_DPV_IMAGES_DIRECTORY_STR            L"Images Directory"
#define WIA_DPV_DSHOW_DEVICE_PATH_STR           L"Directshow Device Path"

#define WIA_NUM_DPV (1 + WIA_DPV_LAST - WIA_DPV_FIRST)


//
// Common item properties
//

#define WIA_IPA_FIRST                           WIA_DPS_FIRST + WIA_RESERVED_FOR_NEW_PROPS
#define WIA_IPA_ITEM_NAME                       WIA_IPA_FIRST + 0
#define WIA_IPA_FULL_ITEM_NAME                  WIA_IPA_FIRST + 1
#define WIA_IPA_ITEM_TIME                       WIA_IPA_FIRST + 2
#define WIA_IPA_ITEM_FLAGS                      WIA_IPA_FIRST + 3
#define WIA_IPA_ACCESS_RIGHTS                   WIA_IPA_FIRST + 4
#define WIA_IPA_DATATYPE                        WIA_IPA_FIRST + 5
#define WIA_IPA_DEPTH                           WIA_IPA_FIRST + 6
#define WIA_IPA_PREFERRED_FORMAT                WIA_IPA_FIRST + 7
#define WIA_IPA_FORMAT                          WIA_IPA_FIRST + 8
#define WIA_IPA_COMPRESSION                     WIA_IPA_FIRST + 9
#define WIA_IPA_TYMED                           WIA_IPA_FIRST + 10
#define WIA_IPA_CHANNELS_PER_PIXEL              WIA_IPA_FIRST + 11
#define WIA_IPA_BITS_PER_CHANNEL                WIA_IPA_FIRST + 12
#define WIA_IPA_PLANAR                          WIA_IPA_FIRST + 13
#define WIA_IPA_PIXELS_PER_LINE                 WIA_IPA_FIRST + 14
#define WIA_IPA_BYTES_PER_LINE                  WIA_IPA_FIRST + 15
#define WIA_IPA_NUMBER_OF_LINES                 WIA_IPA_FIRST + 16
#define WIA_IPA_GAMMA_CURVES                    WIA_IPA_FIRST + 17
#define WIA_IPA_ITEM_SIZE                       WIA_IPA_FIRST + 18
#define WIA_IPA_COLOR_PROFILE                   WIA_IPA_FIRST + 19
#define WIA_IPA_MIN_BUFFER_SIZE                 WIA_IPA_FIRST + 20
// Note:  BUFFER_SIZE and MIN_BUFFER_SIZE have the same propids
#define WIA_IPA_BUFFER_SIZE                     WIA_IPA_FIRST + 20
#define WIA_IPA_REGION_TYPE                     WIA_IPA_FIRST + 21
#define WIA_IPA_ICM_PROFILE_NAME                WIA_IPA_FIRST + 22
#define WIA_IPA_APP_COLOR_MAPPING               WIA_IPA_FIRST + 23
#define WIA_IPA_PROP_STREAM_COMPAT_ID           WIA_IPA_FIRST + 24
#define WIA_IPA_FILENAME_EXTENSION              WIA_IPA_FIRST + 25
#define WIA_IPA_SUPPRESS_PROPERTY_PAGE          WIA_IPA_FIRST + 26
#define WIA_IPA_LAST                            WIA_IPA_FIRST + 26

#define  WIA_IPA_ITEM_NAME_STR                  L"Item Name"
#define  WIA_IPA_FULL_ITEM_NAME_STR             L"Full Item Name"
#define  WIA_IPA_ITEM_TIME_STR                  L"Item Time Stamp"
#define  WIA_IPA_ITEM_FLAGS_STR                 L"Item Flags"
#define  WIA_IPA_ACCESS_RIGHTS_STR              L"Access Rights"
#define  WIA_IPA_DATATYPE_STR                   L"Data Type"
#define  WIA_IPA_DEPTH_STR                      L"Bits Per Pixel"
#define  WIA_IPA_PREFERRED_FORMAT_STR           L"Preferred Format"
#define  WIA_IPA_FORMAT_STR                     L"Format"
#define  WIA_IPA_COMPRESSION_STR                L"Compression"
#define  WIA_IPA_TYMED_STR                      L"Media Type"
#define  WIA_IPA_CHANNELS_PER_PIXEL_STR         L"Channels Per Pixel"
#define  WIA_IPA_BITS_PER_CHANNEL_STR           L"Bits Per Channel"
#define  WIA_IPA_PLANAR_STR                     L"Planar"
#define  WIA_IPA_PIXELS_PER_LINE_STR            L"Pixels Per Line"
#define  WIA_IPA_BYTES_PER_LINE_STR             L"Bytes Per Line"
#define  WIA_IPA_NUMBER_OF_LINES_STR            L"Number of Lines"
#define  WIA_IPA_GAMMA_CURVES_STR               L"Gamma Curves"
#define  WIA_IPA_ITEM_SIZE_STR                  L"Item Size"
#define  WIA_IPA_COLOR_PROFILE_STR              L"Color Profiles"
#define  WIA_IPA_MIN_BUFFER_SIZE_STR            L"Buffer Size"
#define  WIA_IPA_REGION_TYPE_STR                L"Region Type"
#define  WIA_IPA_ICM_PROFILE_NAME_STR           L"Color Profile Name"
#define  WIA_IPA_APP_COLOR_MAPPING_STR          L"Application Applies Color Mapping"
#define  WIA_IPA_PROP_STREAM_COMPAT_ID_STR      L"Stream Compatibility ID"
#define  WIA_IPA_FILENAME_EXTENSION_STR         L"Filename extension"
#define  WIA_IPA_SUPPRESS_PROPERTY_PAGE_STR     L"Suppress a property page"

#define  WIA_NUM_IPA (1 + WIA_IPA_LAST - WIA_IPA_FIRST)


//
// Camera item properties
//

#define WIA_IPC_FIRST                          WIA_IPA_FIRST + WIA_RESERVED_FOR_NEW_PROPS
#define WIA_IPC_THUMBNAIL                      WIA_IPC_FIRST + 0
#define WIA_IPC_THUMB_WIDTH                    WIA_IPC_FIRST + 1
#define WIA_IPC_THUMB_HEIGHT                   WIA_IPC_FIRST + 2
#define WIA_IPC_AUDIO_AVAILABLE                WIA_IPC_FIRST + 3
#define WIA_IPC_AUDIO_DATA_FORMAT              WIA_IPC_FIRST + 4
#define WIA_IPC_AUDIO_DATA                     WIA_IPC_FIRST + 5
#define WIA_IPC_NUM_PICT_PER_ROW               WIA_IPC_FIRST + 6
#define WIA_IPC_SEQUENCE                       WIA_IPC_FIRST + 7
#define WIA_IPC_TIMEDELAY                      WIA_IPC_FIRST + 8
#define WIA_IPC_LAST                           WIA_IPC_FIRST + 8

#define WIA_IPC_THUMBNAIL_STR                  L"Thumbnail Data"
#define WIA_IPC_THUMB_WIDTH_STR                L"Thumbnail Width"
#define WIA_IPC_THUMB_HEIGHT_STR               L"Thumbnail Height"
#define WIA_IPC_AUDIO_AVAILABLE_STR            L"Audio Available"
#define WIA_IPC_AUDIO_DATA_FORMAT_STR          L"Audio Format"
#define WIA_IPC_AUDIO_DATA_STR                 L"Audio Data"
#define WIA_IPC_NUM_PICT_PER_ROW_STR           L"Pictures per Row"
#define WIA_IPC_SEQUENCE_STR                   L"Sequence Number"
#define WIA_IPC_TIMEDELAY_STR                  L"Time Delay"

#define WIA_NUM_IPC (1 + WIA_IPC_LAST - WIA_IPC_FIRST)


//
// Scanner item properties
//
#define WIA_IPS_FIRST                          WIA_IPC_FIRST + WIA_RESERVED_FOR_NEW_PROPS
#define WIA_IPS_CUR_INTENT                     WIA_IPS_FIRST + 0
#define WIA_IPS_XRES                           WIA_IPS_FIRST + 1
#define WIA_IPS_YRES                           WIA_IPS_FIRST + 2
#define WIA_IPS_XPOS                           WIA_IPS_FIRST + 3
#define WIA_IPS_YPOS                           WIA_IPS_FIRST + 4
#define WIA_IPS_XEXTENT                        WIA_IPS_FIRST + 5
#define WIA_IPS_YEXTENT                        WIA_IPS_FIRST + 6
#define WIA_IPS_PHOTOMETRIC_INTERP             WIA_IPS_FIRST + 7
#define WIA_IPS_BRIGHTNESS                     WIA_IPS_FIRST + 8
#define WIA_IPS_CONTRAST                       WIA_IPS_FIRST + 9
#define WIA_IPS_ORIENTATION                    WIA_IPS_FIRST + 10
#define WIA_IPS_ROTATION                       WIA_IPS_FIRST + 11
#define WIA_IPS_MIRROR                         WIA_IPS_FIRST + 12
#define WIA_IPS_THRESHOLD                      WIA_IPS_FIRST + 13
#define WIA_IPS_INVERT                         WIA_IPS_FIRST + 14
#define WIA_IPS_WARM_UP_TIME                   WIA_IPS_FIRST + 15
#define WIA_IPS_LAST                           WIA_IPS_FIRST + 15

#define WIA_IPS_CUR_INTENT_STR                 L"Current Intent"
#define WIA_IPS_XRES_STR                       L"Horizontal Resolution"
#define WIA_IPS_YRES_STR                       L"Vertical Resolution"
#define WIA_IPS_XPOS_STR                       L"Horizontal Start Position"
#define WIA_IPS_YPOS_STR                       L"Vertical Start Position"
#define WIA_IPS_XEXTENT_STR                    L"Horizontal Extent"
#define WIA_IPS_YEXTENT_STR                    L"Vertical Extent"
#define WIA_IPS_PHOTOMETRIC_INTERP_STR         L"Photometric Interpretation"
#define WIA_IPS_BRIGHTNESS_STR                 L"Brightness"
#define WIA_IPS_CONTRAST_STR                   L"Contrast"
#define WIA_IPS_ORIENTATION_STR                L"Orientation"
#define WIA_IPS_ROTATION_STR                   L"Rotation"
#define WIA_IPS_MIRROR_STR                     L"Mirror"
#define WIA_IPS_THRESHOLD_STR                  L"Threshold"
#define WIA_IPS_INVERT_STR                     L"Invert"
#define WIA_IPS_WARM_UP_TIME_STR               L"Lamp Warm up Time"

#define WIA_NUM_IPS (1 + WIA_IPS_LAST - WIA_IPS_FIRST)

//**************************************************************************
//
// Vendor defined property area
//
//**************************************************************************

#define WIA_PRIVATE_DEVPROP    (WIA_IPS_FIRST + WIA_RESERVED_FOR_ALL_MS_PROPS)
#define WIA_PRIVATE_ITEMPROP   (WIA_PRIVATE_DEVPROP + WIA_RESERVED_FOR_ALL_MS_PROPS)


//**************************************************************************
//
// WIA Property Constants
//
//**************************************************************************

//
// WIA_DPC_WHITE_BALANCE constants
//

#define WHITEBALANCE_MANUAL        1
#define WHITEBALANCE_AUTO          2
#define WHITEBALANCE_ONEPUSH_AUTO      3
#define WHITEBALANCE_DAYLIGHT          4
#define WHITEBALANCE_FLORESCENT        5
#define WHITEBALANCE_TUNGSTEN          6
#define WHITEBALANCE_FLASH         7

//
// WIA_DPC_FOCUS_MODE constants
//

#define FOCUSMODE_MANUAL        1
#define FOCUSMODE_AUTO          2
#define FOCUSMODE_MACROAUTO     3

//
// WIA_DPC_EXPOSURE_METERING_MODE constants
//

#define EXPOSUREMETERING_AVERAGE    1
#define EXPOSUREMETERING_CENTERWEIGHT   2
#define EXPOSUREMETERING_MULTISPOT  3
#define EXPOSUREMETERING_CENTERSPOT 4

//
// WIA_DPC_FLASH_MODE constants
//

#define FLASHMODE_AUTO          1
#define FLASHMODE_OFF           2
#define FLASHMODE_FILL          3
#define FLASHMODE_REDEYE_AUTO       4
#define FLASHMODE_REDEYE_FILL       5
#define FLASHMODE_EXTERNALSYNC      6

//
// WIA_DPC_EXPOSURE_MODE constants
//

#define EXPOSUREMODE_MANUAL     1
#define EXPOSUREMODE_AUTO       2
#define EXPOSUREMODE_APERTURE_PRIORITY  3
#define EXPOSUREMODE_SHUTTER_PRIORITY   4
#define EXPOSUREMODE_PROGRAM_CREATIVE   5
#define EXPOSUREMODE_PROGRAM_ACTION 6
#define EXPOSUREMODE_PORTRAIT       7

//
// WIA_DPC_CAPTURE_MODE constants
//

#define CAPTUREMODE_NORMAL      1
#define CAPTUREMODE_BURST       2
#define CAPTUREMODE_TIMELAPSE       3

//
// WIA_DPC_EFFECT_MODE constants
//

#define EFFECTMODE_STANDARD     1
#define EFFECTMODE_BW           2
#define EFFECTMODE_SEPIA        3

//
// WIA_DPC_FOCUS_METERING_MODE constants
//

#define FOCUSMETERING_CENTERSPOT    1
#define FOCUSMETERING_MULTISPOT     2

//
// WIA_DPC_POWER_MODE constants
//

#define POWERMODE_LINE              1
#define POWERMODE_BATTERY           2

//
// WIA_DPS_SHEET_FEEDER_REGISTRATION and
// WIA_DPS_HORIZONTAL_BED_REGISTRATION constants
//

#define  LEFT_JUSTIFIED             0
#define  CENTERED                   1
#define  RIGHT_JUSTIFIED            2

//
// WIA_DPS_VERTICAL_BED_REGISTRATION constants
//

#define  TOP_JUSTIFIED              0
#define  CENTERED                   1
#define  BOTTOM_JUSTIFIED           2

//
// WIA_DPS_ORIENTATION and WIA_DPS_ROTATION constants
//

#define  PORTRAIT                   0
#define  LANSCAPE                   1
#define  ROT180                     2
#define  ROT270                     3

//
// WIA_DPS_MIRROR flags
//

#define  MIRRORED                   0x01

//
// WIA_DPS_DOCUMENT_HANDLING_CAPABILITIES flags
//

#define  FEED                       0x01
#define  FLAT                       0x02
#define  DUP                        0x04
#define  DETECT_FLAT                0x08
#define  DETECT_SCAN                0x10
#define  DETECT_FEED                0x20
#define  DETECT_DUP                 0x40
#define  DETECT_FEED_AVAIL          0x80
#define  DETECT_DUP_AVAIL           0x100

//
// WIA_DPS_DOCUMENT_HANDLING_STATUS flags
//

#define  FEED_READY                 0x01
#define  FLAT_READY                 0x02
#define  DUP_READY                  0x04
#define  FLAT_COVER_UP              0x08
#define  PATH_COVER_UP              0x10
#define  PAPER_JAM                  0x20

//
// WIA_DPS_DOCUMENT_HANDLING_SELECT flags
//

#define  FEEDER                     0x001
#define  FLATBED                    0x002
#define  DUPLEX                     0x004
#define  FRONT_FIRST                0x008
#define  BACK_FIRST                 0x010
#define  FRONT_ONLY                 0x020
#define  BACK_ONLY                  0x040
#define  NEXT_PAGE                  0x080
#define  PREFEED                    0x100
#define  AUTO_ADVANCE               0x200

//
// WIA_DPS_TRANSPARENCY flags
//

#define  LIGHT_SOURCE_PRESENT_DETECT 0x01
#define  LIGHT_SOURCE_PRESENT        0x02
#define  LIGHT_SOURCE_DETECT_READY   0x04
#define  LIGHT_SOURCE_READY          0x08

//
// WIA_DPS_TRANSPARENCY_SELECT flags
//

#define  LIGHT_SOURCE_SELECT        0x001

//
// WIA_DPS_SCAN_AHEAD_PAGES constants
//

#define  WIA_SCAN_AHEAD_ALL         0

//
// WIA_DPS_PAGES constants
//

#define  ALL_PAGES                  0

//
// WIA_DPS_PREVIEW constants
//

#define WIA_FINAL_SCAN              0
#define WIA_PREVIEW_SCAN            1

//
// WIA_DPS_SHOW_PREVIEW_CONTROL constants
//

#define WIA_SHOW_PREVIEW_CONTROL        0
#define WIA_DONT_SHOW_PREVIEW_CONTROL   1

//
// Predefined strings for WIA_DPS_ENDORSER_STRING
//

#define WIA_ENDORSER_TOK_DATE       L"$DATE$"
#define WIA_ENDORSER_TOK_TIME       L"$TIME$"
#define WIA_ENDORSER_TOK_PAGE_COUNT L"$PAGE_COUNT$"
#define WIA_ENDORSER_TOK_DAY        L"$DAY$"
#define WIA_ENDORSER_TOK_MONTH      L"$MONTH$"
#define WIA_ENDORSER_TOK_YEAR       L"$YEAR$"

//
// WIA_DPS_PAGE_SIZE constants
//

#define WIA_PAGE_A4         0
#define WIA_PAGE_LETTER     1
#define WIA_PAGE_CUSTOM     2

//
// WIA_IPA_COMPRESSION constants
//

#define WIA_COMPRESSION_NONE        0
#define WIA_COMPRESSION_BI_RLE4     1
#define WIA_COMPRESSION_BI_RLE8     2
#define WIA_COMPRESSION_G3          3
#define WIA_COMPRESSION_G4          4
#define WIA_COMPRESSION_JPEG        5


//
// WIA_IPA_PLANAR constants
//

#define WIA_PACKED_PIXEL            0
#define WIA_PLANAR                  1

//
// WIA_IPA_DATATYPE constants
//

#define WIA_DATA_THRESHOLD                      0
#define WIA_DATA_DITHER                         1
#define WIA_DATA_GRAYSCALE                      2
#define WIA_DATA_COLOR                          3
#define WIA_DATA_COLOR_THRESHOLD                4
#define WIA_DATA_COLOR_DITHER                   5

//
// WIA_IPA_SUPPRESS_PROPERTY_PAGE flags
//

#define WIA_PROPPAGE_SCANNER_ITEM_GENERAL       0x00000001
#define WIA_PROPPAGE_CAMERA_ITEM_GENERAL        0x00000002

//
// WIA_IPS_CUR_INTENT flags
//
#define WIA_INTENT_NONE                 0x00000000
#define WIA_INTENT_IMAGE_TYPE_COLOR     0x00000001
#define WIA_INTENT_IMAGE_TYPE_GRAYSCALE 0x00000002
#define WIA_INTENT_IMAGE_TYPE_TEXT      0x00000004
#define WIA_INTENT_IMAGE_TYPE_MASK      0x0000000F
#define WIA_INTENT_MINIMIZE_SIZE        0x00010000
#define WIA_INTENT_MAXIMIZE_QUALITY     0x00020000
#define WIA_INTENT_BEST_PREVIEW         0x00040000
#define WIA_INTENT_SIZE_MASK            0x000F0000

//
// WIA_IPS_PHOTOMETRIC_INTERP constants
//

#define WIA_PHOTO_WHITE_1      0   // default, white is 1, black is 0
#define WIA_PHOTO_WHITE_0      1   // default, white is 0, black is 1


//**************************************************************************
//
// WIA Extended Property Identifiers
//
//**************************************************************************

#define  WIA_RANGE_MIN                          0
#define  WIA_RANGE_NOM                          1
#define  WIA_RANGE_MAX                          2
#define  WIA_RANGE_STEP                         3
#define  WIA_RANGE_NUM_ELEMS                    4

#define  WIA_LIST_COUNT                         0
#define  WIA_LIST_NOM                           1
#define  WIA_LIST_VALUES                        2
#define  WIA_LIST_NUM_ELEMS                     2

#define  WIA_FLAG_NOM                           0
#define  WIA_FLAG_VALUES                        1
#define  WIA_FLAG_NUM_ELEMS                     2


//**************************************************************************
//
// Property id to string mapping
//
//**************************************************************************

#ifdef DEFINE_WIA_PROPID_TO_NAME

WIA_PROPID_TO_NAME g_wiaPropIdToName[] =
{
    {WIA_DIP_DEV_ID,                          WIA_DIP_DEV_ID_STR},
    {WIA_DIP_VEND_DESC,                       WIA_DIP_VEND_DESC_STR},
    {WIA_DIP_DEV_DESC,                        WIA_DIP_DEV_DESC_STR},
    {WIA_DIP_DEV_TYPE,                        WIA_DIP_DEV_TYPE_STR},
    {WIA_DIP_PORT_NAME,                       WIA_DIP_PORT_NAME_STR},
    {WIA_DIP_DEV_NAME,                        WIA_DIP_DEV_NAME_STR},
    {WIA_DIP_SERVER_NAME,                     WIA_DIP_SERVER_NAME_STR},
    {WIA_DIP_REMOTE_DEV_ID,                   WIA_DIP_REMOTE_DEV_ID_STR},
    {WIA_DIP_UI_CLSID,                        WIA_DIP_UI_CLSID_STR},
    {WIA_DIP_HW_CONFIG,                       WIA_DIP_HW_CONFIG_STR},
    {WIA_DIP_BAUDRATE,                        WIA_DIP_BAUDRATE_STR},
    {WIA_DIP_STI_GEN_CAPABILITIES,            WIA_DIP_STI_GEN_CAPABILITIES_STR},
    {WIA_DIP_WIA_VERSION,                     WIA_DIP_WIA_VERSION_STR},
    {WIA_DIP_DRIVER_VERSION,                  WIA_DIP_DRIVER_VERSION_STR},
    {WIA_DPA_FIRMWARE_VERSION,                WIA_DPA_FIRMWARE_VERSION_STR},
    {WIA_DPA_CONNECT_STATUS,                  WIA_DPA_CONNECT_STATUS_STR},
    {WIA_DPA_DEVICE_TIME,                     WIA_DPA_DEVICE_TIME_STR},
    {WIA_DPC_PICTURES_TAKEN,                  WIA_DPC_PICTURES_TAKEN_STR},
    {WIA_DPC_PICTURES_REMAINING,              WIA_DPC_PICTURES_REMAINING_STR},
    {WIA_DPC_EXPOSURE_MODE,                   WIA_DPC_EXPOSURE_MODE_STR},
    {WIA_DPC_EXPOSURE_COMP,                   WIA_DPC_EXPOSURE_COMP_STR},
    {WIA_DPC_EXPOSURE_TIME,                   WIA_DPC_EXPOSURE_TIME_STR},
    {WIA_DPC_FNUMBER,                         WIA_DPC_FNUMBER_STR},
    {WIA_DPC_FLASH_MODE,                      WIA_DPC_FLASH_MODE_STR},
    {WIA_DPC_FOCUS_MODE,                      WIA_DPC_FOCUS_MODE_STR},
    {WIA_DPC_FOCUS_MANUAL_DIST,               WIA_DPC_FOCUS_MANUAL_DIST_STR},
    {WIA_DPC_ZOOM_POSITION,                   WIA_DPC_ZOOM_POSITION_STR},
    {WIA_DPC_PAN_POSITION,                    WIA_DPC_PAN_POSITION_STR},
    {WIA_DPC_TILT_POSITION,                   WIA_DPC_TILT_POSITION_STR},
    {WIA_DPC_TIMER_MODE,                      WIA_DPC_TIMER_MODE_STR},
    {WIA_DPC_TIMER_VALUE,                     WIA_DPC_TIMER_VALUE_STR},
    {WIA_DPC_POWER_MODE,                      WIA_DPC_POWER_MODE_STR},
    {WIA_DPC_BATTERY_STATUS,                  WIA_DPC_BATTERY_STATUS_STR},
    {WIA_DPC_DIMENSION,                       WIA_DPC_DIMENSION_STR},
    {WIA_DPS_HORIZONTAL_BED_SIZE,             WIA_DPS_HORIZONTAL_BED_SIZE_STR},
    {WIA_DPS_VERTICAL_BED_SIZE,               WIA_DPS_VERTICAL_BED_SIZE_STR},
    {WIA_DPS_HORIZONTAL_SHEET_FEED_SIZE,      WIA_DPS_HORIZONTAL_SHEET_FEED_SIZE_STR},
    {WIA_DPS_VERTICAL_SHEET_FEED_SIZE,        WIA_DPS_VERTICAL_SHEET_FEED_SIZE_STR},
    {WIA_DPS_SHEET_FEEDER_REGISTRATION,       WIA_DPS_SHEET_FEEDER_REGISTRATION_STR},
    {WIA_DPS_HORIZONTAL_BED_REGISTRATION,     WIA_DPS_HORIZONTAL_BED_REGISTRATION_STR},
    {WIA_DPS_VERTICAL_BED_REGISTRATION,       WIA_DPS_VERTICAL_BED_REGISTRATION_STR},
    {WIA_DPS_PLATEN_COLOR,                    WIA_DPS_PLATEN_COLOR_STR},
    {WIA_DPS_PAD_COLOR,                       WIA_DPS_PAD_COLOR_STR},
    {WIA_DPS_FILTER_SELECT,                   WIA_DPS_FILTER_SELECT_STR},
    {WIA_DPS_DITHER_SELECT,                   WIA_DPS_DITHER_SELECT_STR},
    {WIA_DPS_DITHER_PATTERN_DATA,             WIA_DPS_DITHER_PATTERN_DATA_STR},
    {WIA_DPS_DOCUMENT_HANDLING_CAPABILITIES,  WIA_DPS_DOCUMENT_HANDLING_CAPABILITIES_STR},
    {WIA_DPS_DOCUMENT_HANDLING_STATUS,        WIA_DPS_DOCUMENT_HANDLING_STATUS_STR},
    {WIA_DPS_DOCUMENT_HANDLING_SELECT,        WIA_DPS_DOCUMENT_HANDLING_SELECT_STR},
    {WIA_DPS_DOCUMENT_HANDLING_CAPACITY,      WIA_DPS_DOCUMENT_HANDLING_CAPACITY_STR},
    {WIA_DPS_OPTICAL_XRES,                    WIA_DPS_OPTICAL_XRES_STR},
    {WIA_DPS_OPTICAL_YRES,                    WIA_DPS_OPTICAL_YRES_STR},
    {WIA_DPS_ENDORSER_CHARACTERS,             WIA_DPS_ENDORSER_CHARACTERS_STR},
    {WIA_DPS_ENDORSER_STRING,                 WIA_DPS_ENDORSER_STRING_STR},
    {WIA_DPS_SCAN_AHEAD_PAGES,                WIA_DPS_SCAN_AHEAD_PAGES_STR},
    {WIA_DPS_MAX_SCAN_TIME,                   WIA_DPS_MAX_SCAN_TIME_STR},
    {WIA_DPS_PAGES,                           WIA_DPS_PAGES_STR},
    {WIA_DPS_PAGE_SIZE,                       WIA_DPS_PAGE_SIZE_STR},
    {WIA_DPS_PAGE_WIDTH,                      WIA_DPS_PAGE_WIDTH_STR},
    {WIA_DPS_PAGE_HEIGHT,                     WIA_DPS_PAGE_HEIGHT_STR},
    {WIA_DPS_PREVIEW,                         WIA_DPS_PREVIEW_STR},
    {WIA_DPS_TRANSPARENCY,                    WIA_DPS_TRANSPARENCY_STR},
    {WIA_DPS_TRANSPARENCY_SELECT,             WIA_DPS_TRANSPARENCY_SELECT_STR},
    {WIA_DPS_SHOW_PREVIEW_CONTROL,            WIA_DPS_SHOW_PREVIEW_CONTROL_STR},
    {WIA_DPS_MIN_HORIZONTAL_SHEET_FEED_SIZE,  WIA_DPS_MIN_HORIZONTAL_SHEET_FEED_SIZE_STR},
    {WIA_DPS_MIN_VERTICAL_SHEET_FEED_SIZE,    WIA_DPS_MIN_VERTICAL_SHEET_FEED_SIZE_STR},
    {WIA_DPV_LAST_PICTURE_TAKEN,              WIA_DPV_LAST_PICTURE_TAKEN_STR},
    {WIA_DPV_IMAGES_DIRECTORY,                WIA_DPV_IMAGES_DIRECTORY_STR},
    {WIA_DPV_DSHOW_DEVICE_PATH,               WIA_DPV_DSHOW_DEVICE_PATH_STR},
    {WIA_DPF_MOUNT_POINT,                     WIA_DPF_MOUNT_POINT_STR},
    {WIA_IPA_ITEM_NAME,                       WIA_IPA_ITEM_NAME_STR},
    {WIA_IPA_FULL_ITEM_NAME,                  WIA_IPA_FULL_ITEM_NAME_STR},
    {WIA_IPA_ITEM_TIME,                       WIA_IPA_ITEM_TIME_STR},
    {WIA_IPA_ITEM_FLAGS,                      WIA_IPA_ITEM_FLAGS_STR},
    {WIA_IPA_ACCESS_RIGHTS,                   WIA_IPA_ACCESS_RIGHTS_STR},
    {WIA_IPA_DATATYPE,                        WIA_IPA_DATATYPE_STR},
    {WIA_IPA_DEPTH,                           WIA_IPA_DEPTH_STR},
    {WIA_IPA_PREFERRED_FORMAT,                WIA_IPA_PREFERRED_FORMAT_STR},
    {WIA_IPA_FORMAT,                          WIA_IPA_FORMAT_STR},
    {WIA_IPA_COMPRESSION,                     WIA_IPA_COMPRESSION_STR},
    {WIA_IPA_TYMED,                           WIA_IPA_TYMED_STR},
    {WIA_IPA_CHANNELS_PER_PIXEL,              WIA_IPA_CHANNELS_PER_PIXEL_STR},
    {WIA_IPA_BITS_PER_CHANNEL,                WIA_IPA_BITS_PER_CHANNEL_STR},
    {WIA_IPA_PLANAR,                          WIA_IPA_PLANAR_STR},
    {WIA_IPA_PIXELS_PER_LINE,                 WIA_IPA_PIXELS_PER_LINE_STR},
    {WIA_IPA_BYTES_PER_LINE,                  WIA_IPA_BYTES_PER_LINE_STR},
    {WIA_IPA_NUMBER_OF_LINES,                 WIA_IPA_NUMBER_OF_LINES_STR},
    {WIA_IPA_GAMMA_CURVES,                    WIA_IPA_GAMMA_CURVES_STR},
    {WIA_IPA_ITEM_SIZE,                       WIA_IPA_ITEM_SIZE_STR},
    {WIA_IPA_COLOR_PROFILE,                   WIA_IPA_COLOR_PROFILE_STR},
    {WIA_IPA_MIN_BUFFER_SIZE,                 WIA_IPA_MIN_BUFFER_SIZE_STR},
    {WIA_IPA_REGION_TYPE,                     WIA_IPA_REGION_TYPE_STR},
    {WIA_IPA_ICM_PROFILE_NAME,                WIA_IPA_ICM_PROFILE_NAME_STR},
    {WIA_IPA_APP_COLOR_MAPPING,               WIA_IPA_APP_COLOR_MAPPING_STR},
    {WIA_IPA_PROP_STREAM_COMPAT_ID,           WIA_IPA_PROP_STREAM_COMPAT_ID_STR},
    {WIA_IPA_FILENAME_EXTENSION,              WIA_IPA_FILENAME_EXTENSION_STR},
    {WIA_IPA_SUPPRESS_PROPERTY_PAGE,          WIA_IPA_SUPPRESS_PROPERTY_PAGE_STR},
    {WIA_IPC_THUMBNAIL,                       WIA_IPC_THUMBNAIL_STR},
    {WIA_IPC_THUMB_WIDTH,                     WIA_IPC_THUMB_WIDTH_STR},
    {WIA_IPC_THUMB_HEIGHT,                    WIA_IPC_THUMB_HEIGHT_STR},
    {WIA_IPC_AUDIO_AVAILABLE,                 WIA_IPC_AUDIO_AVAILABLE_STR},
    {WIA_IPC_AUDIO_DATA_FORMAT,               WIA_IPC_AUDIO_DATA_FORMAT_STR},
    {WIA_IPC_AUDIO_DATA,                      WIA_IPC_AUDIO_DATA_STR},
    {WIA_IPC_NUM_PICT_PER_ROW,                WIA_IPC_NUM_PICT_PER_ROW_STR},
    {WIA_IPC_SEQUENCE,                        WIA_IPC_SEQUENCE_STR},
    {WIA_IPC_TIMEDELAY,                       WIA_IPC_TIMEDELAY_STR},
    {WIA_IPS_CUR_INTENT,                      WIA_IPS_CUR_INTENT_STR},
    {WIA_IPS_XRES,                            WIA_IPS_XRES_STR},
    {WIA_IPS_YRES,                            WIA_IPS_YRES_STR},
    {WIA_IPS_XPOS,                            WIA_IPS_XPOS_STR},
    {WIA_IPS_YPOS,                            WIA_IPS_YPOS_STR},
    {WIA_IPS_XEXTENT,                         WIA_IPS_XEXTENT_STR},
    {WIA_IPS_YEXTENT,                         WIA_IPS_YEXTENT_STR},
    {WIA_IPS_PHOTOMETRIC_INTERP,              WIA_IPS_PHOTOMETRIC_INTERP_STR},
    {WIA_IPS_BRIGHTNESS,                      WIA_IPS_BRIGHTNESS_STR},
    {WIA_IPS_CONTRAST,                        WIA_IPS_CONTRAST_STR},
    {WIA_IPS_ORIENTATION,                     WIA_IPS_ORIENTATION_STR},
    {WIA_IPS_ROTATION,                        WIA_IPS_ROTATION_STR},
    {WIA_IPS_MIRROR,                          WIA_IPS_MIRROR_STR},
    {WIA_IPS_THRESHOLD,                       WIA_IPS_THRESHOLD_STR},
    {WIA_IPS_INVERT,                          WIA_IPS_INVERT_STR},
    {WIA_IPS_WARM_UP_TIME,                    WIA_IPS_WARM_UP_TIME_STR},
    {0,                                       L"Not a WIA property"}
};

#else

extern WIA_PROPID_TO_NAME g_wiaPropIdToName[];

#endif

#endif //WIAPROP_H_INCLUDED


//
//   Macro Helpers
//

#define WIA_PROP_LIST_COUNT(ppv) (((PROPVARIANT*)ppv)->cal.cElems - WIA_LIST_VALUES)

#define WIA_PROP_LIST_VALUE(ppv, index)                              \\
     ((index > ((PROPVARIANT*) ppv)->cal.cElems - WIA_LIST_VALUES) || (index < -WIA_LIST_NOM)) ?\\
     NULL :                                                          \\
     (((PROPVARIANT*) ppv)->vt == VT_UI1) ?                          \\
     ((PROPVARIANT*) ppv)->caub.pElems[WIA_LIST_VALUES + index] :    \\
     (((PROPVARIANT*) ppv)->vt == VT_UI2) ?                          \\
     ((PROPVARIANT*) ppv)->caui.pElems[WIA_LIST_VALUES + index] :    \\
     (((PROPVARIANT*) ppv)->vt == VT_UI4) ?                          \\
     ((PROPVARIANT*) ppv)->caul.pElems[WIA_LIST_VALUES + index] :    \\
     (((PROPVARIANT*) ppv)->vt == VT_I2) ?                           \\
     ((PROPVARIANT*) ppv)->cai.pElems[WIA_LIST_VALUES + index] :     \\
     (((PROPVARIANT*) ppv)->vt == VT_I4) ?                           \\
     ((PROPVARIANT*) ppv)->cal.pElems[WIA_LIST_VALUES + index] :     \\
     (((PROPVARIANT*) ppv)->vt == VT_R4) ?                           \\
     ((PROPVARIANT*) ppv)->caflt.pElems[WIA_LIST_VALUES + index] :   \\
     (((PROPVARIANT*) ppv)->vt == VT_R8) ?                           \\
     ((PROPVARIANT*) ppv)->cadbl.pElems[WIA_LIST_VALUES + index] :   \\
     (((PROPVARIANT*) ppv)->vt == VT_BSTR) ?                         \\
     (LONG)(((PROPVARIANT*) ppv)->cabstr.pElems[WIA_LIST_VALUES + index]) : \\
     NULL


//
//   End of Macro Helpers
//

#ifdef __cplusplus
};
#endif

//
// Reset packing
//
#include <poppack.h>

#endif // _WIADEF_H_
