; It is recommended to edit this file with Pycharm/AHK's native editor. Other editors might not support some of the unicode here.
; To be able to run this file, you need to install autohotkey v1.1
; https://autohotkey.com/download/

; directives should be at the start of the code to prevent unwanted behaviour.
#NOENV  ; Generaly recommended for AHK scripts. See more here: https://www.autohotkey.com/docs/commands/_NoEnv.htm
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force  ; Whenever you run this script again, replaces the previous instance without asking first.
#Hotstring c ; All hostrings will be case sensetive by default.
SetTitleMatchMode, 2

; to add the program "X" look up its "process name" and add in the same format.
; web browsers
GroupAdd, LatexTextConversionGroup, ahk_exe chrome.exe
GroupAdd, LatexTextConversionGroup, ahk_exe firefox.exe
GroupAdd, LatexTextConversionGroup, ahk_exe opera.exe
; currently full openning to a browser may interfer with Google Docs, Wolfram etc...
; you may want to disable your browser (msedge temporaryly disabled).
;GroupAdd, LatexTextConversionGroup, ahk_exe msedge.exe
; interpreters
;currently messes up coding on pycharm especialy _stuff in function names.
;GroupAdd, LatexTextConversionGroup, ahk_exe pycharm64.exe
; communication apps
GroupAdd, LatexTextConversionGroup, ahk_exe whatsapp.exe
GroupAdd, LatexTextConversionGroup, WhatsApp
GroupAdd, LatexTextConversionGroup, ahk_exe discord.exe
; text editors
GroupAdd, LatexTextConversionGroup, ahk_exe winword.exe
GroupAdd, LatexTextConversionGroup, ahk_exe POWERPNT.EXE
GroupAdd, LatexTextConversionGroup, ahk_exe OUTLOOK.EXE
GroupAdd, LatexTextConversionGroup, ahk_exe EXCEL.EXE
GroupAdd, LatexTextConversionGroup, OneNote
; microsoft office
GroupAdd, OfficeGroup, ahk_exe ahk_exe WINWORD.EXE
GroupAdd, OfficeGroup, ahk_exe POWERPNT.EXE
GroupAdd, OfficeGroup, ahk_exe OUTLOOK.EXE
GroupAdd, OfficeGroup, ahk_exe EXCEL.EXE
GroupAdd, OfficeGroup, OneNote

; different script modes are defined here
enabled := true ; this enables / disables all non-mode shortcuts.
,classic_mode := true ; this mode lets you use the original shortcuts as well. They take priority if they clash.
global_mode := false ; this mode lets you use AHKLatex everywhere, not just inside the above apps.

F6:: enabled := enabled ? false : true
F7::
{
 global_mode := global_mode ? false : true
 text = enabled (F6): %enabled%`nglobal_mode (F7): %global_mode%`nclassic_mode (F8): %classic_mode%
 splash(text)
 return
}
F8::
{
 classic_mode := classic_mode ? false : true
 text = enabled (F6): %enabled%`nglobal_mode (F7): %global_mode%`nclassic_mode (F8): %classic_mode%
 splash(text)
 return
}

; The following is useful in case you don't know the current state.
; F9:: msgbox, enabled (F6): %enabled%`nglobal_mode (F7): %global_mode%`nclassic_mode (F8): %classic_mode%
F9::
{
 text = enabled (F6): %enabled%`nglobal_mode (F7): %global_mode%`nclassic_mode (F8): %classic_mode%
 splash(text)
 return
}


; WinActive checks if the active window is in the group defined above.
#If enabled and (WinActive("ahk_group LatexTextConversionGroup") or global_mode)
    ;enter math mode. match trigger sequence with Lyx math mode trigger
    ^m::
    {

      SetDefaultKeyboard(0x0409)
      ifWinActive ahk_group OfficeGroup
      { ;msgbox, in office
        SendInput != ;enter math mode (in office and oneone) . match trigger sequence with Lyx math mode triggering
        return
      }
      else if !WinActive("Lyx")
      { ;msgbox, global mode NOT lyx.
        Send ^{enter}
        Send a ; I know this looks weird, but LtR->RtL works on a text that exists, otherwise it will just delete the empty space.
        Send {lctrl down}{lshift down}{lctrl up}{lshift up}
        Send {Backspace}
        return
      }
      else ;this is for lyx (to avoid interference in case user is in global mode).
      { ;msgbox, Lyx (In Global mode)
        SendInput ^m
        ;splash ("m math mode")
        return
      }
    }

    ; hotstrings:
    ; ?o means the shortcuts will happen in the middle of the word, as long as you type a space afterwards.
    ; The space will not appear in the text itself, it is just a distinguisher.

    ; highschool math
    :?o:\ne::≠
    :?o:\le::≤
    :?o:\ll::≪
    :?o:\ge::≥
    :?o:\gg::≫
    :?o:\pm::±
    :?o:\mp::∓
    :?o:\sqrt::√
    :?o:\3root::∛
    :?o:\4root::∜
    :?o:\sum::∑
    :?o:\prod::∏
    :?o:\coprod::⨿ ; replace with ∐ if you want.
    :?o:\lfloor::⌊
    :?o:\rfloor::⌋
    :?o:\lceil::⌈
    :?o:\rceil::⌉
    :?o:\angle::∡
    :?o:\angle2::∢
    :?o:\cis::∠
    :?o:\deg::°
    :?o:\perp::⊥
    :?o:\cdot::·
    :?o:\ndiv::∤
    :?o:\times::⨯
    :?o:\infty::∞
    :?o:\inf::∞
    :?o:\Re::ℜ
    :?o:\Im::ℑ

    ; fractions
    :?o:\half::½
    :?o:\12::½
    :?o:\13::⅓
    :?o:\23::⅔
    :?o:\14::¼
    :?o:\16::⅙
    :?o:\18::⅛
    :?o:\110::⅒

    ; shapes
    :?o:\triangle::∆
    :?o:\square::□
    :?o:\blacksquare::∎
    :?o:\qed::∎

    ; logic
    :?o:\land::∧
    :?o:\wedge::∧
    :?o:\lor::∨
    :?o:\vee::∨
    :?o:\lnot::¬
    :?o:\neq::≠
    :?o:\iff::⟺
    :?o:\LeftRightarrow::⟺
    :?o:\all::∀
    :?o:\forall::∀
    :?o:\exists::∃
    :?o:\nexists::∄
    :?o:\to::⟶
    :?o:\rightarrow::⟶
    :?o:\To::⟹
    :?o:\implies::⟹
    :?o:\Rightarrow::⟹
    :?o:\from::⟵
    :?o:\gets::⟵
    :?o:\leftarrow::⟵
    :?o:\From::⟸
    :?o:\impliedby::⟸
    :?o:\Leftarrow::⟸
    :?o:\hookrightarrow::↪

    ; set theory
    :?o:\in::∈
    :?o:\nin::∉
    :?o:\notin::∉
    :?o:\ni::∋
    :?o:\notni::∌
    :?o:\subset::⊂
    :?o:\subseteq::⊆
    :?o:\subsetneq::⊊
    :?o:\superset::⊃
    :?o:\supset::⊃
    :?o:\supseteq::⊇
    :?o:\superseteq::⊇
    :?o:\supersetneq::⊋
    :?o:\supsetneq::⊋
    :?o:\cup::∪
    :?o:\bigcup::⋃
    :?o:\cap::∩
    :?o:\bigcap::⋂
    :?o:\emptyset::∅

    ; cardinality
    :?o:\aleph::ℵ
    :?o:\beth::ℶ
    :?o:\mfc::𝔠

    ; relations
    :?o:\prec::≺
    :?o:\preceq::≼
    :?o:\precneq::⋨
    :?o:\succ::≻
    :?o:\succeq::≽
    :?o:\succneq::⋩
    :?o:\approx::≈
    :?o:\propto::∝

    ; double stroke capital characters, i.e. mathbb.
    :?o:\mbn::ℕ
    :?o:\mbz::ℤ
    :?o:\mbq::ℚ
    :?o:\mbr::ℝ
    :?o:\mbc::ℂ
    :?o:\mbf::𝔽
    :?o:\mbk::𝕂
    :?o:\mbs::𝕊
    :?o:\mba::𝔸
    :?o:\mbh::ℍ
    :?o:\nodd::ℕodd
    :?o:\neven::ℕeven

    ; mathfrak
    :?o:\mfn::𝔑
    :?o:\mfj::𝔍
    :?o:\mfr::ℜ
    :?o:\Re::ℜ
    :?o:\mfi::ℑ
    :?o:\Im::ℑ
    :?o:\mfc::𝔠

    ; mathcal
    :?o:\mcp::𝒫
    :?o:\mco::𝒪

    ; linear algebra
    :?o:\langle::⟨
    :?o:\rangle::⟩
    :?o:\oplus::⨁ ;⊕
    :?o:\otimes::⨂ ;⊗

    ; group theory
    :?o:\lhd::⊲
    :?o:\rhd::⊳
    :?o:\unlhd::⊴
    :?o:\lhdeq::⊴
    :?o:\unrhd::⊵
    :?o:\rhdeq::⊵
    :?o:\rtimes::⋊

    ; number theory
    :?o:\equiv::≡

    ; calculus
    :?o:\int::∫
    :?o:\iint::∬
    :?o:\iiint::∭
    :?o:\lint::∮
    :?o:\liint::∯
    :?o:\liiint::∰
    :?o:\partial::∂
    :?o:\nabla::∇
    :?o:\Delta::∆

    ; greek
    :?o:\alpha::𝛼
    :?o:\beta::𝛽
    :?o:\gamma::𝛾
    :?o:\delta::𝛿
    :?o:\epsilon::𝜀
    :?o:\zeta::𝜁
    :?o:\eta::𝜂
    :?o:\theta::𝜃
    :?o:\iota::𝜄
    :?o:\kappa::𝜅
    :?o:\lambda::λ
    :?o:\mu::𝜇
    :?o:\nu::𝜈
    :?o:\xi::𝜉
    :?o:\omicron::𝜊
    :?o:\pi::𝜋
    :?o:\rho::𝜌
    :?o:\sigma::𝜎
    :?o:\tau::𝜏
    :?o:\upsilon::𝜐
    :?o:\phi::𝜑
    :?o:\varphi::𝜙
    :?o:\chi::𝜒
    :?o:\psi::𝜓
    :?o:\omega::𝜔

    :?o:\Alpha::𝛢
    :?o:\Beta::𝛣
    :?o:\Gamma::𝛤
    :?o:\Delta::∆
    :?o:\Epsilon::𝛦
    :?o:\Zeta::𝛧
    :?o:\Eta::𝛨
    :?o:\Theta::𝛩
    :?o:\Iota::𝛪
    :?o:\Kappa::𝛫
    :?o:\Lambda::𝛬
    :?o:\Mu::𝛭
    :?o:\Nu::𝛮
    :?o:\Xi::𝛯
    :?o:\Omicron::𝛰
    :?o:\Pi::𝛱
    :?o:\Rho::𝛲
    :?o:\Sigma::𝛴
    :?o:\Tau::𝛵
    :?o:\Upsilon::𝛶
    :?o:\Phi::𝛷
    :?o:\Varphi::𝛷
    :?o:\Chi::𝛸
    :?o:\Psi::𝛹
    :?o:\Omega::𝛺

    ; functions and morphisms
    :?o:\mapsto::↦
    :?o:\onto::↠
    :?o:\epimorph::↠
    :?o:\into::↣ ; some use ↪
    :?o:\monomorph::↣
    :?o:\isomorph::⥲
    :?o:\cong::≅
    :?o:\circ::⚬

    ; "?*" means the replacement will happen even in the middle of the word.
    ; subscripts.
    :?*:_0::{U+2080} ; X₀
    :?*:_1::{U+2081} ; X₁
    :?*:_2::{U+2082} ; X₂
    :?*:_3::{U+2083} ; X₃
    :?*:_4::{U+2084} ; X₄
    :?*:_5::{U+2085} ; X₅
    :?*:_6::{U+2086} ; X₆
    :?*:_7::{U+2087} ; X₇
    :?*:_8::{U+2088} ; X₈
    :?*:_9::{U+2089} ; X₉
    :?*:_+::{U+208A} ; X₊, this requires the shift key as well.
    :?*:_-::{U+208B} ; X₋
    :?*:_a::{U+2090} ; Xₐ
    :?*:_x::{U+2093} ; Xₓ
    :?*:_h::{U+2095} ; Xₕ
    :?*:_k::{U+2096} ; Xₖ
    :?*:_l::{U+2097} ; Xₗ
    :?*:_m::{U+2098} ; Xₘ
    :?*:_n::{U+2099} ; Xₙ
    :?*:_p::{U+209A} ; Xₚ
    :?*:_s::{U+209B} ; Xₛ
    :?*:_t::{U+209C} ; Xₜ
    :?*:_i::{U+1D62} ; Xᵢ
    :?*:_j::{U+2C7C} ; Xⱼ
    :?*:_\beta::{U+1D66} ; Xᵦ


    ; superscripts.
    :?*:^-1::{U+207B}{U+00B9} ; X⁻¹
    :?*:^0::{U+2070} ; X⁰
    :?*:^1::{U+00B9} ; X¹
    :?*:^2::{U+00B2} ; X²
    :?*:^3::{U+00B3} ; X³
    :?*:^4::{U+2074} ; X⁴
    :?*:^5::{U+2075} ; X⁵
    :?*:^6::{U+2076} ; X⁶
    :?*:^7::{U+2077} ; X⁷
    :?*:^8::{U+2078} ; X⁸
    :?*:^9::{U+2079} ; X⁹
    :?*:^+::{U+207A} ; X⁺, this requires the shift key as well.
    :?o:^-::{U+207B} ; X⁻ ; this used ?o mode to allow X⁻¹ (as a direct sequence).
    :?*:^n::{U+207F} ; Xⁿ
    :?*:^m::{U+1D50} ; Xᵐ
    :?*:^a::{U+1D43} ; Xᵃ
    :?*:^x::{U+02E3} ; Xˣ
    :?*:^i::{U+2071} ; Xⁱ
    :?*:^j::{U+1D36} ; Xᴶ
    :?*:^k::{U+1D4F} ; Xᵏ
    :?*:^p::{U+1D56} ; Xᵖ
    :?*:^t::{U+1D57} ; Xᵗ
    :?*:^(::{U+207D} ; X⁽
    :?*:^)::{U+207E} ; X⁾
    :?*:^*::{U+20F0} ; X⃰, this requires the shift key as well.


    ; ?o means the shortcuts will happen in the middle of the word, as long as you type a space afterwards.
    ; The space will not appear in the text itself, it is just a distinguisher.
    ; Other combining characters.
    :?o:\overline::{U+0305} ; X̅
    :?o:\not::{U+20E5} ; ⃥=, may not work in many applications.
    :?o:\hat::{U+0302} ; X̂
    :?o:\dot::{U+0307} ; Ẋ
#If

#If enabled and classic_mode and (WinActive("ahk_group LatexTextConversionGroup") or global_mode)
    ::\-::−
    :?o:\ss::⊆
    ::\nss::⊈
    ::\nl::≮
    ::\u::∪
    ::\a::∀
    ::\e::∃
    ::\nex::∄
    ::\so::|
    ::\es::∅
    ::\ep::ε
    ::\om::Ω
    ::\n::ℕ
    ::\rr::ℝ
    ::\c::ℂ
    ::\r::𝓡
    ::\q::ℚ
    ::\z::ℤ
    ::\s::𝕊
    ::\ah::ℵ₀
    ::\p::𝒫
    ::\eq::≡
    ::\sig::∑
    :?o:\tr::∆
    ::\an::∡
    ::\ang2::∡
    :?o:\ang::∢
    :?o:\t::⨯
    ::\black::∎
    :?o:\bl::∎
    :?o:\f::𝑓
    ::\gf::𝑔
    ::\x::𝑥
    :?*:\אז::⟵

    ;currencies
    :?*:\eur::{U+20AC} ; €
    :?*:\ils::{U+20AA} ; ₪
    :?*:\nis::{U+20AA} ; ₪

    ;symbols
    :?*:\play::{U+23F5} ; ⏵
    :?*:\ff::{U+23E9} ; ⏩
    :?*:\bb::{U+23EA} ; ⏪

    ::\ש::
      {
        SetDefaultKeyboard(0x0409)
        Send ^{enter}a
        Send {lctrl down}{lshift down}{lctrl up}{lshift up}
        Send {Backspace}
        splash("math mode")
        return
      }
      ::\g::
      {
        Send {lalt down}{lshift down}{lalt up}{lshift up} ; switching back to hebrew "old school".
        return
      }
#If

; avoid calling this function with hewbrew code 040D. it may add a second annoying hebrew keyboard
; to your system (till next reboot you'll be toggling 3 languages instead of 2).
SetDefaultKeyboard(LocaleID){
	Global
	SPI_SETDEFAULTINPUTLANG := 0x005A
	SPIF_SENDWININICHANGE := 2
	Lan := DllCall("LoadKeyboardLayout", "Str", Format("{:08x}", LocaleID), "Int", 0)
	VarSetCapacity(Lan%LocaleID%, 4, 0)
	NumPut(LocaleID, Lan%LocaleID%)
	DllCall("SystemParametersInfo", "UInt", SPI_SETDEFAULTINPUTLANG, "UInt", 0, "UPtr", &Lan%LocaleID%, "UInt", SPIF_SENDWININICHANGE)
	WinGet, windows, List
	Loop %windows% {
		PostMessage 0x50, 0, %Lan%, , % "ahk_id " windows%A_Index%
	}
}

splash(textt){
   ;transparent popup text
   Progress, cw31373b CTFF0000 W300 H100 X100 Y300  ZX ZY  m b fs20 WS700 zh0,%textt%,, text popup, arial
   WinSet, Transparent, 125, text popup
   Sleep 2000
   Progress, Off
   return
}
