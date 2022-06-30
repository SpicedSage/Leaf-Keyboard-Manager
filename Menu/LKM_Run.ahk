; Db library
#include ../Scripts/AHKDb.ahk

#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Gui Main:New 
Gui Main:Default

Gui Main:Add, Text, x10 y15 vLayoutLabel, Layout
Gui Main:Add, CheckBox, -Wrap w15 x147 y15 gLayoutToggle vLayoutCheck
Gui Main:Add, ListBox, x10 y35 w150 h75 vLayoutChoice, QWERTY (US)|Dvorak (US Standard)|Dvorak (One-Handed Left)|Dvorak (One-Handed Right)|Dvorak (Programmer)

Gui Main:Add, Text, x170 y15 vAddonLabel, Addons
Gui Main:Add, CheckBox, -Wrap w15 x305 y15 gAddonToggle vAddonCheck
Gui Main:Add, ListBox, x170 y35 w150 h75 vAddonChoice, Swap Ctrl and Caps Lock|Omnikey Modifiers

Gui Main:Add, CheckBox, x10 y110 gStatusToggle vStatusCheck, Active

Gui Main:Add, Text, x84 y110 w236 Wrap, Layout changes full keyboard. Addons change only a small number of keys.

Gui Main:Add, Button, Default x6 y160 w75, Save
Gui Main:Add, Button, Default x87 y160 w75, Reset
Gui Main:Add, Button, Default x168 y160 w75, Settings
Gui Main:Add, Button, Default x249 y160 w75, Close

Gui Main:Submit, NoHide
f_StatusToggle(StatusCheck, LayoutCheck, AddonCheck)

Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

MainButtonClose:
    Gui Main:Hide
Return

MainButtonSave:
    Gui Main:Submit, NoHide
Return

LayoutToggle:
    Gui Main:Submit, NoHide
    f_LayoutToggle(LayoutCheck)
Return

AddonToggle:
    Gui Main:Submit, NoHide
    f_AddonToggle(AddonCheck)
Return

StatusToggle:
    Gui Main:Submit, NoHide
    f_StatusToggle(StatusCheck, LayoutCheck, AddonCheck)
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

f_LayoutToggle(LCheck) {
    if ( LCheck ) {
        GuiControl Enable, LayoutChoice
    } else {
        GuiControl Disable, LayoutChoice
    }
}

f_AddonToggle(ACheck) {
    if ( ACheck ) {
        GuiControl Enable, AddonChoice
    } else {
        GuiControl Disable, AddonChoice
    }
}

f_StatusToggle(SCheck, LCheck, ACheck){
    if ( SCheck ) {
        GuiControl Enable, LayoutCheck
        GuiControl Enable, LayoutLabel
        f_LayoutToggle(LCheck)

        GuiControl Enable, AddonCheck
        GuiControl Enable, AddonLabel
        f_AddonToggle(ACheck)
    } else {
        GuiControl Disable, LayoutCheck
        GuiControl Disable, LayoutLabel
        f_LayoutToggle(0)

        GuiControl Disable, AddonCheck
        GuiControl Disable, AddonLabel
        f_AddonToggle(0)
    }
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!Esc::
    Gui Main:Show, w330 h200, Leaf Keyboard Manager
Return