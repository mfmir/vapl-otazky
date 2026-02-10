#import "macros.typ": *
= Lehké otázky

== (L1) Množinu modelů nad konečným jazykem lze axiomatizovat výrokem v CNF, výrokem v DNF.

Mějme konečný jazyk $PP$ a libovolnou $M subs MP$. Pak existují $phi_"DNF" "a" phi_"CNF"$ takové, že $M = MP(phi_"DNF") = MP(phi_"CNF")$; konkrétně:

$ phi_"DNF" = or.big_(v in M) and.big_(p in PP) p^(v(p)) $
$ phi_"CNF" = and.big_(v in overline(M)) or.big_(p in PP) overline(p^(v(p))) = and.big_(v in.not M) or.big_(p in PP) p^(1 - v(p)) $

_Důkaz_: Pro DNF, každá elementární konjunkce popisuje jeden model. CNF je duální k $phi_"DNF"$ sestrojenému pro doplněk $M' = overline(M)$; každá klauzule v konjunkci "zakazuje jeden nemodel". Každý výrok má svoji pravdivostní funkci, pro kterou zvládneme jednotlivým popisem/zákazem modelu/nemodelu vytvořit správnou formuli..

== (L2) 2-SAT, algoritmus implikačního grafu, jeho korektnost

2-SAT je sat kde má každá klauzule nejvýše dva literály. 2-klauzuli $cl_1 or cl_2$ lze chápat jako implikace $cln_1 impl cl_2 "a" cln_2 impl cl_1$. Implikační graf je graf, kde vrcholy jsou literály a hrany jsou dány implikacemi. Chceme najít komponenty silné souvislosti v tomto grafu, neboť všechny literály v této komponentě musí být ohodnoceny stejně (jinak by se nám rozbil implikační řetízek). Dvojice opačných literálů v jedné komponentě tedy znamená nesplnitelnost.

Výrok $phi$ je splnitelný, když v implikačním grafu žádná komponenta silné souvislosti neobsahuje zároveň $cln$~a~$cl$.

_Důkaz_: Mějme implikační graf $G_phi$. Vytvořme $G_phi^*$ _kontrakcí_ komponent silné souvislosti (čímž odstraníme cykly). $G_phi^*$ je DAG, zvolme na něm topologické uspořádání. Pak dokola volím první neohodnocenou komponentu a nastavím literály v ní na 0, literály v opačné komponentě na 1. Proč pak $phi$ platí?

Jednotková klauzule musí platit, protože v $G_phi$ máme $cln impl cl$ a tato hrana je i v $G_phi^*$, tudíž v topologickém uspořádání $cln$ předchází $cl$.

Podobně pro 2-klauzule. Pokud mám $cl_1 or cl_2$, tak v $G_phi$ je $cln_1 impl cl_2 "a" cln_2 impl cl_1$. Pokud jsme $cl_1$ ohodnotili dříve, pak to kvůli topologickému uspořádání bylo $cln_1 = 0$, tedy $cl_1$ platí. Podobně i v opačném případě.

== (L3) Horn-SAT, Algoritmus jednotkové propagace, jeho korektnost

Viz (P8) co to je Horn-SAT. _Jednotková propagace:_ pokud náš výrok obsahuje jednotkovou klauzuli, víme, jak musí být ohodnocena výroková proměnná v této klauzuli -- tuto znalost můžeme propagovat, využít k zjednodušení výroku:
- každá výroková proměnná obsahující pozitivní literál je splněna a můžeme ji z výroku odstranit
- negativní literál nemůže být splněn, můžeme ho tedy odebrat ze všech klauzulí, které ho obsahují.

Výsledkem je zjednodušený výrok označený $phi^cl$ pro jednotkovou klauzuli (literál) $cl$ co jsme odstranili. Všimněme si, že $phi^cl$ neobsahuje $cl$, ani $cln$ a zřejmě platí, že modely $phi$ jsou právě modely ${phi^cl, cl}$, neboli modely $phi^cl$ v původním jazyce $PP$, ve kterých platí $cl$.

Nyní algoritmus:

`IN`: $phi$ v Horn-SAT. `OUT`: Model, nebo informace, že neexistuje

1. Pokud $phi$ obsahuje (jednotkové klauzule) $cl "i" cln$, pak není splnitelný
2. Pokud $phi$ neobsahuje jednotkovou klauzuli, ohodnoť všechny zbývající proměnné 0 (konec)\*
3. Pokud $phi$ obsahuje jednotkovou klauzuli $cl$, ohodnoť $cl = 1$, proveď _jednotkovou propagaci_, nahraď $phi$ výrokem $phi^cl$
4. Opakuj

\*To funguje díky "hornovskosti" výroku. Pokud ve výroku není jednotkový literál, pak každá klauzule obsahuje alespoň dva literály a nejvýše jeden z nich může být pozitivní. Když tedy nastavíme všechny zbývající literály na 0, určitě tím splníme všechny klauzule.

== (L4) Vlastnosti extenze o definice

Pro teorii $T$ a její extenzi o definice $T'$ (viz P16):
- Každý model $T$ lze jednoznačně expandovat#footnote[Viz P14. Nevím co znamená jednoznačně.] na model $T'$
- $T'$ je konzervativní extenze $T$
- Pro každou $L'$-formuli $phi'$ existuje $L$-formule $phi$: $T' models phi' eqviv phi$

Lze expandovat, protože do modelu přidáme nový symbol a jeho interpretaci tak, jak je definována.

Konzervativní, protože nové symboly lze nahradit jejich definicí a v původním jazyce tak dostaneme stejné důsledky.

Formule v původním jazyce existuje ze stejného důvodu. Je třeba dát pozor na navázání volných proměnných.#footnote[Tbh tady hodně haluzim, ty skripta to moc nevysvětlujou.]


== (L5) Vztah definovatelných množin a automorfismů

_Automorfismus_ je izomorfismus struktury $cA$ na $cA$. Viz (P15) pro definovatelné množiny.

Je-li $D subs A^n$ _definovatelná_ ve struktuře $cA$, potom pro každý automorfismus $h in "Aut"(cA)$ platí $h[D] = D$ (kde $h[D]$ značí ${h(overline(a)) | overline(a) in D}$). Je-li $D$ definovatelná s parametry $b$, platí totéž pro automorfismy identické na $overline(b)$ _($thin$fixující $overline(b)$)_, tj. takové, že $h(overline(b)) = overline(b)$.

_Důkaz:_ Jen verze s parametry. Nechť $D = phi^(cA, overline(b))(overline(x), overline(y))$. Potom pro každé $overline(a) in A^n$ platí ekvivalence:

$ overline(a) in D &arrow.l.r.double&& cA models phi[e(overline(x)\/overline(a), overline(y)\/overline(b))]\
&arrow.l.r.double&& cA models phi[h(e(overline(x)\/overline(a), overline(y)\/overline(b)))]\
&arrow.l.r.double&& cA models phi[e(overline(x)\/h(overline(a)), overline(y)\/h(overline(b)))]\
&arrow.l.r.double&& cA models phi[e(overline(x)\/h(overline(a)), overline(y)\/overline(b))]\
&arrow.l.r.double&& h(overline(a)) in D
$

== (L6) Tablo metoda v jazyce s rovností

Pro teorii $T$ v jazyce $L$ s rovností: $T* =$ rozšíření o generální uzávěry axiomů rovnosti (viz P7) pro jazyk $L$, tablo důkaz z teorie $T$ je tablo důkaz z teorie $T*$.

Při získávání kanonického modelu nejdříve najdeme model $cB$ a přidáme relaci $scripts(=)^B$: $\"s_1\" scripts(=)^B \"s_2\" <=>$ na větvi $V$ je položka T$s_1 = s_2$. Kanonický model pak získáme jako faktorstrukturu $cB slash_(scripts(=)^B)$. Kanonický model pak může být i konečný.

== (L7) Věta o kompaktnosti a její aplikace <L7>

_Věta o kompaktnosti:_ Teorie má model, právě tehdy, když každá její konečná část má model.

_Důkaz_: Model teorie je modelem každé její části. Pokud $T$ nemá model, je sporná, tedy $T tack fal$. Vezměme nějaký její _konečný_ tablo důkaz $fal "z" T$. K jeho konstrukci stačí konečně mnoho $alpha in T$, ty tvoří konečnou podteorii $T'$, která nemá model. $qed$

Důsledek: Teorie konečných grafů není axiomatizovatelná: Mějme $T$ a její modely, všechny konečné grafy.
1. Vytvoříme $T^*$. Přidáme do ní _nekonečně mnoho_ nových axiomů říkajících, že:\
 $exists x_1$ (existuje alespoň jeden prvek)\
 $exists x_1, x_2: x_1 neq x_2$ (existují alespoň dva prvky)\
 $dots$
2. Každá konečná podmnožina $T^*$ má model. Řekněme, že největší axiom vybrán v něm je $exists x_1, dots, x_n$. Konečný graf s $n$ vrcholy toto určitě splňuje.
3. Podle věty o kompaktnosti má celá rozšířená teorie $T^*$ model. Ale tento model musí splňovat všechny přidané axiomy, tedy obsahovat nekonečně mnoho prvků - je to nekonečný graf. Zároveň ale musí být modelem původní teorie T, tedy konečným grafem. Spor!

Taky (T13).

== (L8) Korektnost rezoluce ve výrokové logice

Je-li CNF formule S rezolucí zamítnutelná, je S nesplnitelná.

_Důkaz_: Nechť $S scripts(tack)_R square$ a důkaz $C_0, C_1, dots, C_n = square$. Pro spor nechť je $S$ splnitelná, tedy $cV models S$ pro nějaké ohodnocení $cV$. Indukcí podle $i$ dokážeme $cV models C_i$.

- pro $i = 0$ platí, neb $C_0 in S$
- pro $i > 0$ nastanou dva případy:
  - $C_i in S$, pak $cV models C_i$ z předpokladu $cV models S$
  - $C_i$ je rezolventou $C_j, C_k "kde" j,k < i$. Z indukčního předpokladu víme $cV models C_j "a" cV models C_k$. $cV models C_i$ plyne z korektnosti rezolučního pravidla.#footnote[Ve skriptech je to do "dokázáno" jako pozorování co přímo plyne z definice.]

== (L9) Korektnost rezoluce v predikátové logice

Mějme $C_1, C_2$ a jejich rezolventu $C$. Platí-li ve struktuře $cA$ klauzule $C_1, C_2$, platí v ní i $C$.

_Důkaz:_ Z rezolučního pravidla víme $C = C'_1 sigma union C'_2 sigma$, kde $sigma$ je nejobecnější unifikace množiny výrazů $S = {A_1, dots, A_n, B_1, dots, B_n}$, neboli $S sigma = {A_1 sigma}$. Protože $C_1, C_2$ jsou otevřené formule platné v $cA$, platí v $cA$ i jejich instance po substituci $sigma$, tj. $cA models C_1 sigma$ a $cA models C_2 sigma$. Víme také $C_1 sigma = C'_1 sigma union {A_1 sigma}$ a podobně $C_2 sigma = C'_2 sigma union {not A_1 sigma}$. // wtf?

Chceme ukázat $cA models C[e]$ pro libovolné ohodnocení $e$. Pokud $cA models A_1 sigma[e]$, potom $cA tack.r.double.not not A_1 sigma[e]$ a musí být $cA models C'_2 sigma[e]$. Tedy i $cA models C[e]$. V opačném případě $cA tack.r.double.not A_1 sigma[e] dots$ pak opět $cA models C[e]$.

Korektnost je stejná jako v (L8).

== (L10) Nestandardní model přirozených čísel

Nechť $underline(NN) = sl NN, S, +, dot, 0, <= sr$ je standardní model přirozených čísel. $Th(underline(NN))$ je množina všech sentencí pravdivých v $underline(NN)$. Pro $n in NN$ definujeme $n$-tý numerál jako term $n = S(S(dots (S(0)) dots))$. Vezměme nový konstantní symbol $c$ a vyjádřeme, že je ostře větší než každý $n$-tý numerál:#footnote[Znaménko $<$ přitom není v jazyce, takže nevím, jak jde tohle udělat? Idk takhle to je ve skriptech.] $ T = Th(underline(NN)) union {underline(n) < c | n in NN} $

Každá konečná část teorie $T$ má model. Z (L7) tedy plyne, že i $T$ má model.

== (L11) Existence spočetného algebraicky uzavřeného tělesa

$cA$ je algebraicky uzavřené, pokud každý polynom nenulového stupně v něm má kořen. Např. $RR$ není, protože $x^2 + 1 = 0$; $CC$ už je.

Algebraickou uzavřenost lze vyjádřit $psi_n$ pro každé $n > 0$:

$ (forall x_(n-1))dots(forall x_0)(exists y)(y^n + x_(n-1) dot y^(n-1) + dots + x_1 dot y + x_0) = 0 $

_Důkaz:_ Dle Löwenheim-Skolemovy věty s rovností (T10) "Je-li $L$ spočetný jazyk s rovností, pak ke každé nekonečné $L$-struktuře existuje elementárně ekvivalentní spočetně nekonečná struktura.": Najdeme spočetnou $cB equiv cA$. Protože v $cA$ platí pro každé $n in NN$ sentence "existuje alespoň $n$ prvků", což lze pomocí rovnosti snadno zapsat, platí tato sentence i v $cB$, $cB$ tedy nemůže být konečná a musí být spočetně nekonečná.

Tedy existuje spočetně nekonečná struktura $cA equiv CC$. Protože $CC$ je těleso a splňuje sentence $psi_n$ pro všechna $n > 0$, je i $cA$ algebraicky uzavřené těleso.

== (L12) Kritérium otevřené axiomatizovatelnosti.

Pokud je teorie $T$ otevřeně axiomatizovatelná, potom je každá podstruktura modelu $T$ také modelem $T$.

_Důkaz:_ Nechť $T$ je otevřená axiomatizace $T$. Mějme model $cA models T'$ a podstrukturu $cB subs cA$. Pro každou formuli $phi in T'$ platí $cB models phi$ (protože $cB subs cA$ má tytéž relace a funkce, resp. podstruktura zachovává atomické vlastnosti), neboť je $phi$ otevřená, tedy i $cB models T$.

== (L13) Rekurzivně axiomatizovaná teorie je částečně rozhodnutelná, kompletní je rozhodnutelná

Nechť $T$ je rekurzivně axiomatizovaná, potom:
- $T$ je částečně rozhodnutelná
- je-li $T$ navíc kompletní, potom je rozhodnutelná

Pro definice viz (P19)

_Důkaz:_ Algoritmem ukazujícím částečnou rozhodnutelnost je konstrukce systematického tabla z teorie $T$ pro položku F$phi$ (zde nám stačí enumerátor axiomů $T$, nebo postupně generujeme všechny sentence např. v lexikografickém pořadí a pro každou testujeme, zda je axiomem). Pokud $phi$ v $T$ platí, konstrukce skončí v konečně mnoha krocích a snadno ověříme, že je tablo sporné. Jinak ale skončit nemusí.

Je-li $T$ kompletní, víme, že platí právě jedna z následujících možností: buď $T models phi$, nebo $T models not phi$. Budeme tedy paralelně konstruovat tablo pro T$phi$ a pro F$phi$; jedna z konstrukcí po konečně mnoha krocích skončí.

== (L14) Teorie konečné struktury v končném jazyce s rovností je rozhodnutelná

Je-li $cA$ konečná struktura v konečném jazyce s rovností, potom je teorie $Th(cA)$ rekurzivně axiomatizovaná.

Z toho plyne, že $Th(cA)$ je rozhodnutelná, neboť platnost sentence $phi$ můžeme v $cA$ snadno ověřit.

_Důkaz:_ Očíslujeme prvky domény $A = {a_1, dots, a_n}$. Teorii $Th(cA)$ lze axiomatizovat jedinou sentencí, která je ve tvaru "existuje právě $n$ prvků $a_1, dots, a_n$ splňujících právě ty _základní vztahy_ o funkčních hodnotách a relacích, které platí ve struktuře $cA$".

Například, pokud $f^cA (a_4, a_2) = a_17$, přidáme do konjunkce atomickou formuli $f(x_a_4 , x_a_2 ) = x_a_17$ (kde $x_a_i$ jsou proměnné odpovídající jednotlivým prvkům). A pokud $(a_3, a_3, a_1) in.not R^cA$, přidáme $not R(x_a_3 , x_a_3 , x_a_1)$.

== (L15) Gödelovy věty neúplnosti

_Robinsonova aritmetika_ je teorie $Q$ v jazyce aritmetiky sestávající z následujících axiomů:

#align(center, table(
  columns: (auto, auto),
  stroke: none,
  $not S(x) = 0$,
  $S(x) = S(y) impl x = y$,
  $x + 0 = x$,
  $x + S(y) = S(x + y)$,
  $x dot 0 = 0$,
  $x dot S(y) = x dot y + x$,
  $not x = 0 impl (exists y)(x = S(y))$,
  $x <= y eqviv (exists z)(z + x = y)$
))

_První věta o neúplnosti_: Pro každou bezespornou rekurzivně axiomatizovanou extenzi $T$ Robinsonovy aritmetiky existuje sentence, která je pravdivá v $underline(NN)$, ale není dokazatelná v $T$.

_Peanova aritmetika_ je extenze Robinsonovy aritmetiky $Q$ o _schéma indukce_, tj. pro každou $L$-formuli $phi(x, overline(y))$ přidáme axiom: $ (phi(0, overline(y)) and (forall x)(phi(x, overline(y)) impl phi(S(x), overline(y)))) impl (forall x) phi(x, overline(y))) $

_Druhá věta o neúplnosti_: Pro každou bezespornou a rekurzivně axiomatizovanou extenzi T Peanovy aritmetiky platí, že $"Con"_T$ není dokazatelná v $T$. $"Con"_T$ je: $ not(exists y)"Prf"_T (0 = S(0), y) $ resp. není konzistentní.
