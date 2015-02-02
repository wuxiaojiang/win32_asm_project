.386
.model flat,stdcall
option casemap:none
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
include windows.inc
include user32.inc
include kernel32.inc
includelib user32.lib
includelib kernel32.lib
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	.data?
hWnd         dd        ?
szBuffer     db        256 dup (?)
        .const
szCaption    db        '发送程序',0
szStart      db        'Press OK to start SendMessage,Param : %08x!',0
szReturn     db        '发送信息返回!',0
szDestClass  db        'MyClass',0
szText       db        '内容发送到其他窗口',0
szNotFound   db        '未找到窗口!',0
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	.code
start:
         invoke FindWindow,addr szDestClass,NULL
         .if    eax
                mov hWnd,eax
		invoke wsprintf,addr szBuffer,addr szStart,szText
		invoke MessageBox,NULL,offset szBuffer,offset szCaption,MB_OK
		invoke SendMessage,hWnd,WM_SETTEXT,0,addr szText
		invoke MessageBox,NULL,offset szReturn,offset szCaption,MB_OK
	.else
		invoke MessageBox,NULL,offset szNotFound,offset szCaption,MB_OK
	.endif
	invoke ExitProcess,NULL
        end start
