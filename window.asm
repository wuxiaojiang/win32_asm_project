.386
.model flat,stdcall
option casemap:none
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
include kernel32.inc
include user32.inc
include windows.inc
include gdi32.inc
includelib kernel32.lib
includelib user32.lib
includelib gdi32.lib
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      .data?
hInstance dd ?
hWinMain dd ?
      .const
szClass db 'my class',0
szCaption db 'my first window',0
szText db 'by biopunk',0
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      .code
_ProcWinMain proc use ebx edi esi,hWnd,uMsg,wParam,lParam
             local @stPs:PAINTSTRUCT
             local @stRect:RECT
             local @hDc
            
             mov eax,uMsg
;************************************************************
            .if eax == WM_PAINT
                invoke BeginPaint,hWnd,addr @stPs
                mov @hDc,eax
            
                invoke GetClientRect,hWnd,addr @stRect
                invoke DrawText,@hDc,addr szText,-1,addr @stRect,DT_SINGLELINE or DT_CENTER or DT_VCENTER
                invoke Endpaint,hWnd,addr @stPs
            
            .elseif eax == WM_CLOSE
                    invoke DestroyWindows,hWinMain
                    invoke PostQuitMessage,NULL
            .else
                    invoke DefWindowProc,hWnd,uMsg,wParam,lParam
                    ret
            .endif
;**************************************************************************************************************
             xor eax,eax
             ret
_ProcWinMain endp
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
_WinMain proc
         local @stWndClass:WNDCLASSEX
         local @stMsg:Msg
         
         invoke GetModuleHandle,NULL
         mov hInstance,eax
         invoke RtlZeroMemory,addr @stWndClass,sizeof @stWndClass
         

             
             
             
            
