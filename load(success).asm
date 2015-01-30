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
	.data
szText    db     10 dup(?)
szFmat  db     '%d',0  
szFmat2 db     '%0x',0  
	.const
szPath    db     'C:\windows\system32\calc.exe',0
szF       db     '加载失败',0
szS       db     '加载成功 ',0
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	.code
_load proc
      local @msg 
      local @stSTARTUPINFO:STARTUPINFO
      local @stPROCESS_INFORMATION : PROCESS_INFORMATION
   
      invoke RtlZeroMemory ,addr @stSTARTUPINFO,sizeof @stSTARTUPINFO     
      mov  @stSTARTUPINFO.dwFlags,TRUE
      mov  @stSTARTUPINFO.wShowWindow,STARTF_USESHOWWINDOW
      mov  @stSTARTUPINFO.cb,sizeof @stSTARTUPINFO
      invoke RtlZeroMemory ,addr @stPROCESS_INFORMATION,sizeof @stPROCESS_INFORMATION
      invoke CreateProcessA,offset szPath,NULL,NULL,NULL,FALSE,DEBUG_PROCESS,NULL,NULL,addr @stSTARTUPINFO,addr @stPROCESS_INFORMATION
      .if eax == NULL
          invoke GetLastError
          invoke wsprintf,addr szText,addr szFmat2,eax
          invoke MessageBoxA,NULL,offset szText,offset szF,MB_OK
      .else
          mov eax,@stPROCESS_INFORMATION.dwProcessId
          invoke wsprintf,addr szText,addr szFmat,eax
          invoke MessageBoxA,NULL,offset szText,offset szS,MB_OK
          ret
       .endif

      xor eax,eax
      ret
_load endp

start:
      call _load
      invoke ExitProcess,NULL
      end start
      
