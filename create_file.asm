.386
.model flat,stdcall
option casemap:none
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
include    windows.inc
include    user32.inc
include    kernel32.inc
include    comdlg32.inc
includelib user32.lib
includelib kernel32.lib
includelib comdlg32.lib
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
ICO_MAIN    equ     1000
DLG_MAIN    equ     100
IDC_FILE    equ     101
IDC_BROWSE  equ     102
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	.data?
