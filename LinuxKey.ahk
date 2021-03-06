﻿#SingleInstance force
if not A_IsAdmin ;running by administrator
{
   Run *RunAs "%A_ScriptFullPath%" 
   ExitApp 0
}


IfExist, Retro_Mario.ico
{
;freezing icon
menu, TRAY, Icon, Retro_Mario.ico, , 1
}
Menu, Tray, Icon,,, 1

global CLversion:="Copyright by Woyin" 

;The beginning of all things
#Include %A_ScriptDir%\lib\lib_init.ahk 
#include %A_ScriptDir%\lib\lib_keysFunction.ahk
#include %A_ScriptDir%\lib\lib_keysSet.ahk
;get the settings from capslock+settings.ini 
#include %A_ScriptDir%\lib\lib_settings.ahk 
;public functions
#Include %A_ScriptDir%\lib\lib_functions.ahk 
#include %A_ScriptDir%\lib\lib_loadAnimation.ahk

; language
#include %A_ScriptDir%\language\lang_func.ahk
#include %A_ScriptDir%\language\Simplified_Chinese.ahk

;change dir
;#include ..\userAHK
;#include *i main.ahk

#MaxHotkeysPerInterval 500
#NoEnv
;  #WinActivateForce
Process Priority,,High


start:
; Make some other Things
#Include %A_ScriptDir%\userAHK\main.ahk
;-------程序解释------------------------
; 该程序的逻辑与Mac上面的改变按键的逻辑不同
; Autohotkey 无法真正意义上实现Capslock的组合键，所以用了两个变量来间接判断Capslock按键到底是被触发了一次，还是按住后与其他组合键一起使用
; 判断是否触碰了一下啊就松开的通过KeyWait方法，对Capslock 点击松开进行判断，并通过SetTimer 来判断到底是按了一次还是长按，并调整相关的变量值
;--------------------------------------


;-----------------START-----------------
global CapsLockToChangeInputMethod, CapsLockStatus

CapsLock::
CapsLockToChangeInputMethod:=1 ;为是否切换输入法开关
CapsLockStatus:=1 ;为是否触发Capslock按键与其他组合键的开关 
SetTimer, noNeedToChangeInputMethod, -150 ; 200ms 犹豫操作时间,

KeyWait, CapsLock
;CapsLock:=0 ;Capslock最优先置空，来关闭 Capslock+ 功能的触发
if CapsLockToChangeInputMethod
{
;此处的逻辑是：在使用一次之后，立马将下面的语句，即改变输入法状态的语句，不再执行，直接输入windows+space键位
    Send #{Space}
    setCapsLockToChangeInputMethod()
}
CapsLockStatus:=0
return

; 改变输入法状态的开关
noNeedToChangeInputMethod:
    setCapsLockToChangeInputMethod()
return




;----------------------------keys-set-start-----------------------------
; 特殊在这个#If，表示后面的表达式如果成为true的时候，我们按下去的按键（大概是吧）将成为一个修饰按键，配合下面的其他键，组成了组合键
; 此处逻辑绕了一下。
; 先是通过lib/lib_keysSet.ahk 中的默认定义，为每个配合了CapsLock的组合键做一个默认值
; 然后又通过lib/lib_settings.ahk 中的方法，通过读取settings.ini 文件中[Keys] 段的值进行覆盖（用户自定义的覆盖）
; 这种做法本质上是以lib_keySet 作为系统默认配置（不需要修改），然后利用setting.ini 文件作为用户配置文件进行修改
#If CapsLockStatus ;when capslock key press and hold


<!WheelUp::
try
    runFunc(keyset.caps_lalt_wheelUp)

return

<!WheelDown::
try
    runFunc(keyset.caps_lalt_wheelDown)

return

a::
b::
c::
d::
e::
f::
g::
h::
i::
j::
k::
l::
n::
m::
o::
p::
q::
r::
s::
t::
u::
v::
w::
x::
y::
z::
1::
2::
3::
4::
5::
6::
7::
8::
9::
0::
f1::
f2::
f3::
f4::
f5::
f6::
f7::
f8::
f9::
f10::
f11::
f12::
space::
tab::
enter::
esc::
backspace::
ralt::
try
    runFunc(keyset["caps_" . A_ThisHotkey])

Return

`::
try
    runFunc(keyset.caps_backQuote)

return


-::
try
    runFunc(keyset.caps_minus)

return

=::
try
    runFunc(keyset.caps_equal)

Return


[::
try
    runFunc(keyset.caps_leftSquareBracket)

Return

]::
try
    runFunc(keyset.caps_rightSquareBracket)

Return

\::
try
    runFunc(keyset.caps_backslash)

return

`;::
try
    runFunc(keyset.caps_semicolon)

Return

'::
try
    runFunc(keyset.caps_quote)

return


,::
try
    runFunc(keyset.caps_comma)

Return

.::
try
    runFunc(keyset.caps_dot)

return

/::
try
    runFunc(keyset.caps_slash)

Return

;  RAlt::
;  try
;      runFunc(keyset.caps_ralt)
;  
;  return



;---------------------caps+lalt----------------

<!a::
try
    runFunc(keyset.caps_lalt_a)

return

<!b::
try
    runFunc(keyset.caps_lalt_b)

Return

<!c::
try
    runFunc(keyset.caps_lalt_c)

return

<!d::
try
    runFunc(keyset.caps_lalt_d)

Return

<!e::
try
    runFunc(keyset.caps_lalt_e)

Return

<!f::
try
    runFunc(keyset.caps_lalt_f)

Return

<!g::
try
    runFunc(keyset.caps_lalt_g)

Return

<!h::
try
    runFunc(keyset.caps_lalt_h)

return

<!i::
try
    runFunc(keyset.caps_lalt_i)

return

<!j::
try
    runFunc(keyset.caps_lalt_j)

return

<!k::
try
    runFunc(keyset.caps_lalt_k)

return

<!l::
try
    runFunc(keyset.caps_lalt_l)

return

<!m::
try
    runFunc(keyset.caps_lalt_m)

return

<!n::
try
    runFunc(keyset.caps_lalt_n)

Return

<!o::
try
    runFunc(keyset.caps_lalt_o)

return

<!p::
try
    runFunc(keyset.caps_lalt_p)

Return

<!q::
try
    runFunc(keyset.caps_lalt_q)

return

<!r::
try
    runFunc(keyset.caps_lalt_r)

Return

<!s::
try
    runFunc(keyset.caps_lalt_s)

Return

<!t::
try
    runFunc(keyset.caps_lalt_t)

Return

<!u::
try
    runFunc(keyset.caps_lalt_u)

return

<!v::
try
    runFunc(keyset.caps_lalt_v)

Return

<!w::
try
    runFunc(keyset.caps_lalt_w)

Return

<!x::
try
    runFunc(keyset.caps_lalt_x)

Return

<!y::
try
    runFunc(keyset.caps_lalt_y)

return

<!z::
try
    runFunc(keyset.caps_lalt_z)

Return

<!`::
    runFunc(keyset.caps_lalt_backquote)

return

<!1::
try
    runFunc(keyset.caps_lalt_1)

return

<!2::
try
    runFunc(keyset.caps_lalt_2)

return

<!3::
try
    runFunc(keyset.caps_lalt_3)

return

<!4::
try
    runFunc(keyset.caps_lalt_4)

return

<!5::
try
    runFunc(keyset.caps_lalt_5)

return

<!6::
try
    runFunc(keyset.caps_lalt_6)

return

<!7::
try
    runFunc(keyset.caps_lalt_7)

return

<!8::
try
    runFunc(keyset.caps_lalt_8)

return

<!9::
try
    runFunc(keyset.caps_lalt_9)

Return

<!0::
try
    runFunc(keyset.caps_lalt_0)

Return

<!-::
try
    runFunc(keyset.caps_lalt_minus)

return

<!=::
try
    runFunc(keyset.caps_lalt_equal)

Return

<!BackSpace::
try
    runFunc(keyset.caps_lalt_backspace)

Return

<!Tab::
try
    runFunc(keyset.caps_lalt_tab)

Return

<![::
try
    runFunc(keyset.caps_lalt_leftSquareBracket)

Return

<!]::
try
    runFunc(keyset.caps_lalt_rightSquareBracket)

Return

<!\::
try
    runFunc(keyset.caps_lalt_Backslash)

return

<!`;::
try
    runFunc(keyset.caps_lalt_semicolon)

Return

<!'::
try
    runFunc(keyset.caps_lalt_quote)

return

<!Enter::
try
    runFunc(keyset.caps_lalt_enter)

Return

<!,::
try
    runFunc(keyset.caps_lalt_comma)

Return

<!.::
try
    runFunc(keyset.caps_lalt_dot)

return

<!/::
try
    runFunc(keyset.caps_lalt_slash)

Return

<!Space::
try
    runFunc(keyset.caps_lalt_space)

Return

<!RAlt::
try
    runFunc(keyset.caps_lalt_ralt)

return

<!F1::
try
    runFunc(keyset.caps_lalt_f1)

return

<!F2::
try
    runFunc(keyset.caps_lalt_f2)

return

<!F3::
try
    runFunc(keyset.caps_lalt_f3)

return

<!F4::
try
    runFunc(keyset.caps_lalt_f4)

return

<!F5::
try
    runFunc(keyset.caps_lalt_f5)

return

<!F6::
try
    runFunc(keyset.caps_lalt_f6)

return

<!F7::
try
    runFunc(keyset.caps_lalt_f7)

return

<!F8::
try
    runFunc(keyset.caps_lalt_f8)

return

<!F9::
try
    runFunc(keyset.caps_lalt_f9)

return

<!F10::
try
    runFunc(keyset.caps_lalt_f10)

return

<!F11::
try
    runFunc(keyset.caps_lalt_f11)

return

<!F12::
try
    runFunc(keyset.caps_lalt_f12)

return


;  #s::
;      keyFunc_activateSideWin("l")
;  
;  return

;  #f::
;      keyFunc_activateSideWin("r")
;      
;  return

;  #e::
;      keyFunc_activateSideWin("u")
;  
;  return

;  #d::
;      keyFunc_activateSideWin("d")
;      
;  return

;  #w::
;      keyFunc_putWinToBottom()
;      
;  return

;  #a::
;      keyFunc_activateSideWin("fl")
;      
;  return

;  #g::
;      keyFunc_activateSideWin("fr")
;      
;  return

;  #z::
;      keyFunc_clearWinMinimizeStach()
;      
;  return

;  #x::
;      keyFunc_inWinMinimizeStack(true)
;      
;  return

;  #c::
;      keyFunc_inWinMinimizeStack()
;      
;  return

;  #v::
;      keyFunc_outWinMinimizeStack()
;      
;  return



#If




GuiClose:
GuiEscape:
Gui, Cancel
return
