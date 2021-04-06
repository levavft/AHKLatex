; It is recommended to edit this file with UltraEdit/pycharm. Other editors might not support some of the unicode here.
; To be able to run this file, you need to install autohotkey v1.1
; https://autohotkey.com/download/
#NOENV  ; Generaly recommended for AHK scripts. See more here: https://www.autohotkey.com/docs/commands/_NoEnv.htm
#SingleInstance force  ; Whenever you run this script again, replaces the previous instance without asking first.

; to add the program "X" look up its "process name" and add in the same format.
; web browsers
GroupAdd, LatexTextConversionGroup, ahk_exe chrome.exe
GroupAdd, LatexTextConversionGroup, ahk_exe firefox.exe
GroupAdd, LatexTextConversionGroup, ahk_exe opera.exe
GroupAdd, LatexTextConversionGroup, ahk_exe msedge.exe
; interpreters
GroupAdd, LatexTextConversionGroup, ahk_exe pycharm64.exe
; communication apps
GroupAdd, LatexTextConversionGroup, ahk_exe whatsapp.exe
GroupAdd, LatexTextConversionGroup, ahk_exe discord.exe

; different script modes are defined here
enabled := true ; this enables / disables all non-mode shortcuts.
F6:: enabled := enabled ? false : true
global_mode := false ; this mode lets you use AHKLatex everywhere, not just inside the above apps.
F7:: global_mode := global_mode ? false : true
classic_mode := false ; this mode lets you use the original shortcuts as well. They take priority if they clash.
F8:: classic_mode := classic_mode ? false : true

; The following is useful in case you don't know the current state.
; Due to a quirk in AHK, initializing to false doesn't actually do anything. So at the start you'll see empty variables.
F9:: msgbox, enabled (F6): %enabled%`nglobal_mode (F7): %global_mode%`nclassic_mode (F8): %classic_mode%

; WinActive checks if the active window is in the group defined above.
#If enabled and (WinActive("ahk_group LatexTextConversionGroup") or global_mode)
#Hotstring c ; All the below hostrings will be case sensetive by default.
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
:?*:_h::{U+2095} ; Xₕ
:?*:_k::{U+2096} ; Xₖ
:?*:_m::{U+2098} ; Xₘ
:?*:_n::{U+2099} ; Xₙ
:?*:_p::{U+209A} ; Xₚ
:?*:_s::{U+209B} ; Xₛ
:?*:_t::{U+209C} ; Xₜ

; superscripts.
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
:?*:^-::{U+207B} ; X⁻
:?*:^n::{U+207F} ; Xⁿ
:?*:^i::{U+2071} ; Xⁱ
:?*:^*::{U+20F0} ; X⃰, this requires the shift key as well.

; ?o means the shortcuts will happen in the middle of the word, as long as you type a space afterwards.
; The space will not appear in the text itself, it is just a distinguisher.
; Other combining characters.
:?o:\overline::{U+0305} ; X̅
:?o:\not::{U+20E5} ; ⃥=, may not work in many applications.
:?o:\hat::{U+0302} ; X̂
:?o:\dot::{U+0307} ; Ẋ

#If ; end if