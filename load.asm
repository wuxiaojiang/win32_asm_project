.386
.model flat,stdcall
option casemap:none
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
include    windows.inc
include    kernel32.inc
include    user32.inc
includelib kernel32.lib
includelib user32.lib
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	.const
szPath    db     'C:\Windows\system32\calc.exe',0
szCaption db     '信息',0
szF       db     '加载失败',0
;szS       db     '加载成功 ',0
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	.code
_load proc 
      local @msg
      local @stSTARTUPINFO:STARTUPINFO
      local @stPROCESS_INFORMATION : PROCESS_INFORMATION
      
      mov  @stSTARTUPINFO.dwFlags,TRUE
      mov  @stSTARTUPINFO.wShowWindow,STARTF_USESHOWWINDOW
      mov  @stSTARTUPINFO.cb,sizeof @stSTARTUPINFO
      invoke CreateProcessA,offset szPath,NULL,NULL,NULL,FALSE,DEBUG_PROCESS,NULL,NULL,addr @stSTARTUPINFO,addr @stPROCESS_INFORMATION
      .if eax == NULL
          invoke MessageBoxA,NULL,offset szF,offset szCaption,MB_OK
      .else
          mov eax,@stPROCESS_INFORMATION
          mov @msg,eax
          invoke MessageBoxA,NULL,@msg,offset szCaption,MB_OK
          ret
       .endif

      xor eax,eax
      ret
_load endp

start:
      call _load
      invoke ExitProcess,NULL
      end start
