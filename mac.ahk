; This script assumes that Alt and Ctrl characters have been swapped using a third-party tool

; -----KEY GUIDE-----
; # Win. (the key with the Windows logo) therefore `Send #e` would hold down Win and then press E.
; + Shift. For example, `Send, +abC` would send the text "AbC", and `Send, !+a` would press Alt+Shift+A.
; ^ Alt (because of remapkey). For example, `Send, This is text!a` would send the keys "This is text" and then press Alt+A. Note: !A produces a different effect in some programs than !a. This is because !A presses Alt+Shift+A and !a presses Alt+A. If in doubt, use lowercase.
; ! Ctrl (because of remapkey). For example, `Send, ^!a` would press Ctrl+Alt+A, and Send, ^{Home} would send Ctrl+Home. Note: ^A produces a different effect in some programs than ^a. This is because ^A presses Ctrl+Shift+A and ^a presses Ctrl+A. If in doubt, use lowercase.Sends Ctrl. For example, Send, ^!a would press Ctrl+Alt+A, and Send, ^{Home} would send Ctrl+Home. Note: ^A produces a different effect in some programs than ^a. This is because ^A presses Ctrl+Shift+A and ^a presses Ctrl+A. If in doubt, use lowercase.
; & An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey.

; #Warn  ; Uncomment to enable warnings to assist with detecting common errors.
SendMode("Input")  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

; Uncomment for key history
; #InstallKeybdHook
; KeyHistory

; App and tab switching
Ctrl & Tab::AltTab
!Tab::Send("^{Tab}")

; Quit the active app
^q::Send("!{f4}")

; Insertion point movement
^Left::
{
    Suspend(true)
    Send("{Home}")
    Suspend(false)
    return
}
^Right::
{
    Suspend(true)
    Send("{End}")
    Suspend(false)
    return
}
^Up::
{
    Suspend(true)
    Send("^{Home}")
    Suspend(false)
    return
}
^Down::
{
    Suspend(true)
    Send("^{End}")
    Suspend(false)
    return
}
#Backspace:: ; Opt + Backspace to delete the word to the left of cursor
{
    Suspend(true)

    if WinActive("ahk_class ConsoleWindowClass") ; CMD window class
    {
        Send("^{BS}")
    }
    else
    {
        Send("{Shift Down}") ; Begin selection
        Send("^{Left}") ; Move to the start of the line, thereby selecting everything from the cursor to the start of the line
        Send("{Shift Up}") ; End selection
        Send("{Backspace}") ; Delete the selected content
    }

    Suspend(false)
    return
}
+^Left::
{
    Suspend(true)
    Send("+{Home}")
    Suspend(false)
    return
}
+^Right::
{
    Suspend(true)
    Send("+{End}")
    Suspend(false)
    return
}
+^Up::
{
    Suspend(true)
    Send("+^{Home}")
    Suspend(false)
    return
}
+^Down::
{
    Suspend(true)
    Send("+^{End}")
    Suspend(false)
    return
}
#Left::
{
    Suspend(true)
    Send("^{Left}")
    Suspend(false)
    return
}
#Right::
{
    Suspend(true)
    Send("^{Right}")
    Suspend(false)
    return
}
^Backspace:: ; Cmd + Backspace to delete whole line left of the cursor
{
    Suspend(true)

    if WinActive("ahk_class ConsoleWindowClass") ; CMD window class
    ; switch keyboard layout will also be activated if you use windows 10/11
    ; you should put the shortcut to sth like alt + shift or disable it
    {
        Send("^{BS}")  ; This sends the original Ctrl+Backspace
    }
    else
    {
        Send("{Shift Down}") ; Begin selection
        Send("{Home}") ; Move to the start of the line, thereby selecting everything from the cursor to the start of the line
        Send("{Shift Up}") ; End selection
        Send("{Backspace}") ; Delete the selected content
    }

    Suspend(false)
    return
}
+#Left::
{
    Suspend(true)
    Send("+^{Left}")
    Suspend(false)
    return
}
+#Right::
{
    Suspend(true)
    Send("+^{Right}")
    Suspend(false)
    return
}
