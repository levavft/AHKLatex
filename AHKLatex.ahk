﻿; It is recommended to edit this file with UltraEdit/pycharm. Other editors might not support some of the unicode here.
; To be able to run this file, you need to install autohotkey v1.1
; https://autohotkey.com/download/
#NOENV  ; Generaly recommended for AHK scripts. See more here: https://www.autohotkey.com/docs/commands/_NoEnv.htm
#SingleInstance force  ; Whenever you run this script again, replaces the previous instance without asking first.

; to add the program "X" look up its "process name" and add in the same format.
; web browsers
GroupAdd, LatexTextConversionGroup, ahk_exe chrome.exe
GroupAdd, LatexTextConversionGroup, ahk_exe firefox.exe
GroupAdd, LatexTextConversionGroup, ahk_exe opera.exe
; interpreters
GroupAdd, LatexTextConversionGroup, ahk_exe pycharm64.exe
; communication apps
GroupAdd, LatexTextConversionGroup, ahk_exe whatsapp.exe
GroupAdd, LatexTextConversionGroup, ahk_exe discord.exe

; TODO: create keystroke mode - e.g. instead of the shortcut being the letters in english, let it be the specific keys,
; iregardless of the language setting.
; relevant links for this:
; https://autohotkey.com/board/topic/22316-how-to-map-keys-by-scancode/
; https://www.win.tue.nl/~aeb/linux/kbd/scancodes-1.html
; https://www.autohotkey.com/docs/commands/GetKey.htm

; TODO: check if there's a way to create activation / deactivation sequences.


#IfWinActive ahk_group LatexTextConversionGroup ; next hotkeys only trigger when the focused application is in the group.

; relevant links for improving this:
; http://elyxer.nongnu.org/lyx/Math.html
; https://en.wikipedia.org/wiki/Mathematical_operators_and_symbols_in_Unicode
; https://en.wikipedia.org/wiki/List_of_mathematical_symbols_by_subject

; highschool math
::\le::≤
::\ll::≪
::\ge::≥
::\gg::≫
::\pm::±
::\mp::∓
::\sqrt::√
::\3root::∛
::\4root::∜
::\sum::∑
::\prod::∏
::\coprod::⨿ ; replace with ∐ if you want.
::\lfloor::⌊
::\rfloor::⌋
::\lceil::⌈
::\rceil::⌉
::\angle::∡
::\angle2::∢
::\cis::∠
::\deg::°
::\perp::⊥
::\cdot::·
::\ndiv::∤
::\times::⨯
::\infty::∞
::\inf::∞
::\Re::ℜ
::\Im::ℑ

; fractions
::\half::½
::\12::½
::\23::⅔
::\14::¼
::\16::⅙
::\18::⅛
::\110::⅒

; shapes
::\triangle::∆
::\square::□
::\blacksquare::∎
::\qed::∎

; logic
::\land::∧
::\wedge::∧
::\lor::∨
::\vee::∨
::\lnot::¬
::\neq::≠
::\iff::⟺
::\LeftRightarrow::⟺
::\all::∀
::\forall::∀
::\exists::∃
::\nexists::∄
::\to::⟶
::\rightarrow::⟶
::\To::⟹
::\Rightarrow::⟹
::\from::⟵
::\leftarrow::⟵
::\From::⟸
::\Leftarrow::⟸
::\hookrightarrow::↪

; set theory
::\in::∈
::\nin::∉
::\notin::∉
::\ni::∋
::\notni::∌
::\subset::⊂
::\subseteq::⊆
::\subsetneq::⊊
::\superset::⊃
::\supset::⊃
::\supseteq::⊇
::\superseteq::⊇
::\supersetneq::⊋
::\supsetneq::⊋
::\cup::∪
::\bigcup::⋃
::\cap::∩
::\bigcap::⋂
::\emptyset::∅

; cardinality
::\aleph::ℵ
::\beth::ℶ
::\mfc::𝔠

; relations
::\prec::≺
::\preceq::≼
::\precneq::⋨
::\succ::≻
::\succeq::≽
::\succneq::⋩
::\approx::≈
::\propto::∝

; double stroke capital characters, i.e. mathbb.
::\mbn::ℕ
::\mbz::ℤ
::\mbq::ℚ
::\mbr::ℝ
::\mbc::ℂ
::\mbf::𝔽
::\mbk::𝕂
::\mbs::𝕊
::\mba::𝔸
::\mbh::ℍ
::\nodd::ℕodd
::\neven::ℕeven

; mathfrak
::\mfn::𝔑
::\mfj::𝔍
::\mfr::ℜ
::\Re::ℜ
::\mfi::ℑ
::\Im::ℑ
::\mfc::𝔠

; mathcal
::\mcp::𝒫
::\mco::𝒪

; linear algebra
::\langle::⟨
::\rangle::⟩
::\oplus::⨁ ;⊕
::\otimes::⨂ ;⊗

; group theory
::\lhd::⊲
::\rhd::⊳
::\unlhd::⊴
::\lhdeq::⊴
::\unrhd::⊵
::\rhdeq::⊵
::\rtimes::⋊

; number theory
::\equiv::≡

; calculus
::\int::∫
::\iint::∬
::\iiint::∭
::\lint::∮
::\liint::∯
::\liiint::∰
::\partial::∂
::\nabla::∇
::\Delta::∆

; greek
::\alpha::𝛼
::\beta::𝛽
::\gamma::𝛾
::\delta::𝛿
::\epsilon::𝜀
::\zeta::𝜁
::\eta::𝜂
::\theta::𝜃
::\iota::𝜄
::\kappa::𝜅
::\lambda::𝜆
::\mu::𝜇
::\nu::𝜈
::\xi::𝜉
::\omicron::𝜊
::\pi::𝜋
::\rho::𝜌
::\sigma::𝜎
::\tau::𝜏
::\upsilon::𝜐
::\phi::𝜑
::\varphi::𝜙
::\chi::𝜒
::\psi::𝜓
::\omega::𝜔

::\Alpha::𝛢
::\Beta::𝛣
::\Gamma::𝛤
::\Delta::∆
::\Epsilon::𝛦
::\Zeta::𝛧
::\Eta::𝛨
::\Theta::𝛩
::\Iota::𝛪
::\Kappa::𝛫
::\Lambda::𝛬
::\Mu::𝛭
::\Nu::𝛮
::\Xi::𝛯
::\Omicron::𝛰
::\Pi::𝛱
::\Rho::𝛲
::\Sigma::𝛴
::\Tau::𝛵
::\Upsilon::𝛶
::\Phi::𝛷
::\Varphi::𝛷
::\Chi::𝛸
::\Psi::𝛹
::\Omega::𝛺

; functions and morphisms
::\mapsto::↦
::\onto::↠
::\epimorph::↠
::\into::↣ ; some use ↪
::\monomorph::↣
::\isomorph::⥲
::\cong::≅
::\circ::⚬

; subscripts and superscripts
; for more information about these unicode characters: https://en.wikipedia.org/wiki/Unicode_subscripts_and_superscripts
^!0::Send {U+2080} ; this means, you need to click: ctrl+alt+0 to get the 0 subscript, i.e. X₀
^!1::Send {U+2081}
^!2::Send {U+2082}
^!3::Send {U+2083}
^!4::Send {U+2084}
^!5::Send {U+2085}
^!6::Send {U+2086}
^!7::Send {U+2087}
^!8::Send {U+2088}
^!9::Send {U+2089}
^!+::Send {U+208A}
^!-::Send {U+208B}
^!h::Send {U+2095}
^!k::Send {U+2096}
^!m::Send {U+2098}
^!n::Send {U+2099}
^!p::Send {U+209A}
^!s::Send {U+209B}
^!t::Send {U+209C}

^#0::Send {U+2070} ; this means, you need to click: ctrl+winkey+0 to get the 0 superscript, i.e. X⁰
^#1::Send {U+00B9}
^#2::Send {U+00B2}
^#3::Send {U+00B3}
^#4::Send {U+2074}
^#5::Send {U+2075}
^#6::Send {U+2076}
^#7::Send {U+2077}
^#8::Send {U+2078}
^#9::Send {U+2079}
^#+::Send {U+207A} ; this requires the shift key as well
^#-::Send {U+207B}
^#n::Send {U+207F}
^#i::Send {U+2071}
^#*::Send {U+20F0}

; Other combining characters.
; To add more look at: https://en.wikipedia.org/wiki/Combining_character
!#o::Send {U+0305} ; winkey+alt+o, overline, i.e. X̅
!#n::Send {U+20E5} ; not, i.e. ⃥=
!#h::Send {U+0302} ; hat, i.e. X̂
!#d::Send {U+0307} ; dot, i.e. Ẋ

#IfWinActive


