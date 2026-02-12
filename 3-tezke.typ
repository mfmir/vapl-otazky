#import "macros.typ": *

= Těžké otázky

K získání známky 3 není třeba znát důkazy z této kategorie, proto jsou uvedeny pouze myšlenky důkazů.

== (T1) Věta o korektnosti tablo metody ve výrokové logice

Je-li výrok $phi$ tablo dokazatelný z teorie $T$, potom je $phi$ pravdivý v teorii $T$. $T tack phi => T models phi$.

Důkaz sporem. Kdyby $phi$ v $T$ neplatilo (a přesto bychom ho tablem dokázali), existoval by model, který by odpovídal nějaké nesporné větvi tabla, avšak všechny větve v tablu jsou sporné.

== (T2) Věta o korektnosti tablo metody v predikátové logice

Je-li _sentence_ $phi$ tablo dokazatelná z teorie $T$, potom je $phi$ pravdivá v teorii $T$. $T tack phi => T models phi$.

Obdoba z výrokové logiky. $phi$ musí být sentence, protože v tablu jsou vždy pouze sentence. Důkaz sporem, akorát model není ohodnocení, ale struktura.

== (T3) Věta o úplnosti tablo metody ve výrokové logice

Je-li výrok $phi$ pravdivý v teorii $T$, potom je $phi$ tablo dokazatelné z $T$. $T models phi => T tack phi$.

Důkaz sporem. Dokončené tablo je nutně sporné. Kdyby nebylo, byla by v něm dokončená nesporná větev. Ta by odpovídala nějakému modelu (třeba kanonickému), ve kterém $phi$ neplatí.

Kanonický model je model odpovídající dané větvi tabla, pokud je na větvi položka T$p$ (pro nějakou proměnnou $p$), je v kanonickém modelu $p$ nastavena na 1, jinak je nastavena na 0 (tedy pokud je na větvi položka F$p$, nebo pokud na větvi položka obsahující samotné $p$ není).

== (T4) Věta o úplnosti tablo metody v predikátové logice

Je-li _sentence_ $phi$ pravdivá v teorii $T$, potom je $phi$ tablo dokazatelné z $T$. $T models phi => T tack phi$.

Obdoba z výrokové logiky. Důkaz sporem, akorát model není ohodnocení, ale struktura. Kdyby tablo nebylo sporné, byla by v něm dokončená nesporná větev odpovídající kanonickému modelu, ve kterém $phi$ neplatí.

Kanonický model (struktura) pro danou (dokončenou nespornou) větev:
- pro univerzum vezmeme všechny konstantní (i pomocné) a funkční symboly a rekurzivně je na sebe aplikujeme; univerzum obsahuje textové řetězce, univerzum bude vždy nekonečné, protože pomocných symbolů je nekonečně mnoho
- relace $R(...)$ platí právě když na větvi je položka T$R(...)$
- funkce vrací prvek z univerza vzniklý spojením funkčního symbolu a symbolů parametrů; příklad v Pythonu pro binární funkci $g$:
```py
def g(a: str, b: str) -> str:
    return f"g({a}, {b})"

g("d", "c0")  # -> "g(d, c0)"
# Jak "d", tak i "c0" a "g(d, c0)" jsou prvky univerza.
# Stejně tak třeba "g(g(c0, c0), d)" bude.
# d je příklad symbolu z původního jazyka L, c0 je pomocná konstanta z rozšířeného L_C, v univerzu bude obojí
```

== (T5) Věta o konečnosti sporu, důsledky o konečnosti a systematičnosti důkazů

Konečnost sporu: Je-li $union.big_(i>=0) tau_i$ sporné tablo, potom existuje $n in NN$ takové, že $tau_n$ je sporné _konečné_ tablo.

Konečnost důkazu: Pokud $T tack phi$, potom existuje i _konečný_ tablo důkaz $phi$ z $T$.

Systematičnost důkazu: Pokud $T tack phi$, potom _systematické_ tablo je konečným tablo důkazem $phi$ z $T$.

Tedy pokud dojdeme ke sporu, bude to po konečně mnoha krocích. Dokonce i v případě, kdy je teorie nekonečná. Systematické tablo je algoritmus, který takové tablo sestrojí.

Systematické tablo: Vstup: uspořádaná teorie $T = {alpha_1, alpha_2, ...}$, počáteční položka $R$ (typicky F$phi$).
- $P =$  nejvyšší nejlevější neredukovaná položka na bezesporné větvi
- Pokud jsme našli $P$: redukujeme $P$ přidáním atomického tabla na každou bezespornou větev pod~$P$
- Pokud ještě zbývá axiom $alpha_i$ z $T$: na každou bezespornou větev připojíme T$alpha_i$
- Pokud jsou všechny větve sporné: skončili jsme, máme systematický tablo důkaz
// viz Rozhodnutelnost, tam je podobná věc "buď vrátí ano, nebo nedoběhne"
- Opakujeme#footnote[Pokud bude teorie nekonečná a nikdy nenastane spor, budeme cyklit donekonečna. Není to v rozporu s žádnou s předem uvedených vět. Viz P21.]

== (T6) Věta o úplnosti rezoluce ve výrokové logice

Je-li formule $S$ (v CNF množinové reprezentaci) nesplnitelná, je rezolucí zamítnutelná. $S scripts(tack)_R square$.

Důkaz indukcí podle počtu proměnných od $|Var(S)|$ směrem k nule. Podle věty o kompaktnosti, BÚNO $S$ je konečná.

== (T7) [WIP] Věta o úplnosti rezoluce v predikátové logice

Je-li CNF formule $S$ nesplnitelná, potom je zamítnutelná rezolucí.

Lifting lemma: Pro klauzule $C_1$ a $C_2$ s disjunktními množinami proměnných#footnote[Proměnná reprezentuje prvek z univerza, nejedná se o atomický výrok.], pro jejich základní instance $C_1^*$ a $C_2^*$, pro jejich rezolventu $C^*$: existuje rezolventa $C$ klauzulí $C_1$ a $C_2$ taková, že $C^*$ je základní instance $C$.

Základní instance: Pro otevřenou formuli $phi$ proměnných $x_1, ..., x_n$: instance $phi(x_1 slash t_1, ..., x_n slash t_n)$ je _základní instance_, jsou-li termy $t_1, ..., t_n$ konstantní. ${x_1 slash t_1, ..., x_n slash t_n}$ nazýváme _základní substituce_.

Základní instance umožňuje převést výraz z predikátové logiky do výrokové nahrazením atomických sentencí za atomické výroky. Lifting lemma to aplikuje na klauzule a jejich rezolventy.#footnote[Moc tomu nerozumim no.]

== (T8) Skolemova věta

Každá teorie má otevřenou konzervativní extenzi.

Důkaz odpovídá algoritmu používanému před rezolucí. Uděláme generální uzávěr, převedeme do prenexní normální formy, změníme na Skolemovu variantu, odstraníme zbývající kvantifikátory.

Generální uzávěr: Přidání $(forall x)$ pro všechny volné proměnné $x$.

Prenexní normální forma (PNF): Formule s kvantifikátory pouze na začátku. Kvantifikátory jsou _kvantifikátorový prefix_ a zbytek je _otevřené jádro_.

Skolemova varianta: Nahrazení každého $(exists x)$ za $f_x (...)$, kde argumenty jsou všechny předchozí $(forall amogus)$.

Převod do PNF:
- $not(forall x) phi <=> (exists x) not phi$
- $(forall x) phi -> psi <=> (exists x)(phi -> psi)$
- $psi -> (forall x) phi <=> arrow.r.double (forall x)(psi -> phi)$
- ostatní jsou triviální
- $x$ nesmí být volná v $psi$, jinak bychom ji navázali $=>$ musíme vázané proměnné přejmenovat na něco unikátního, $(forall x) phi(x) <=> (forall amogus) phi(amogus)$
- pro opačný kvantifikátor $(forall#h(-0.13em)slash exists)$ to funguje stejně


== (T9) Herbrandova věta

Pro teorii $T$ v jazyce $L$ bez rovnosti s alespoň jedním konstantním symbolem: buď $T$ má _Herbrandův model_, nebo existuje konečně mnoho základních instancí (viz T7) axiomů $T$, jejichž konjunkce je nesplnitelná.

Herbrandův model: Kanonický model (viz T4), ale nijak nedefinujeme relace.

Tedy pokud je teorie splnitelná (má model), má i Herbrandův model, pokud splnitelná není, dosadíme do axiomů konstanty a vznikne spor.

Důkaz tablem. Herbrandův model tvoříme podobně jako kanonický model, nejprve je třeba $T$ uzemnit na $T_"ground"$ pomocí základních instancí.

// TODO nějaký dva crazy důsledky

== (T10) [WIP] Löwenheim-Skolemova věta včetně varianty s rovností, jejich důsledky

Pro spočetný jazyk bez rovnosti $L$: každá bezesporná teorie v jazyce $L$ má spočetně nekonečný model.

Důkaz systematickým tablem s F$fal$ v kořeni. Tablo bude dokončené#footnote[Bude dokončené? Skripta říkají "nějaké dokončené tablo", ale pokud bude teorie nekonečná, bude nutně takové existovat?] a univerzum výsledné struktury bude nekonečné, protože obsahuje nekonečno pomocných symbolů (viz T5).

== (T11) Vztah izomorfismu a elementární ekvivalence

Pro struktury $cA$ a $cB$: $cA tilde.eq cB => cA equiv cB$.

$cA tilde.eq cB <=>$ "$cA$ je izomorfní s $cB$" $<=>$ existuje bijekce $h: A -> B$ splňující
- $h(f^cA (a)) = f^cB (h(a))$
- $R^cA (a) <=> R^cB (h(a))$

$cA equiv cB <=>$ "$cA$ je elementárně ekvivalentní s $cB$" $<=>$ v $cA$ platí stejné sentence jako v $cB$.

// TODO něco víc

== (T12) Neaxiomatizovatelnost konečných modelů

idk asi (L7)

== (T13) Věta o konečné axiomatizovatelnosti

Mějme třídu struktur $K subs M_L$ a uvážíme její doplněk $overline(K) = M_L \\ K$. Potom $K$ je konečně axiomatizovatelné právě tehdy, když $K$ i $overline(K)$ jsou axiomatizovatelné.

_Důkaz:_ Je-li $K$ konečně axiomatizovatelná, pak je axiomatizovatelná i konečně mnoha sentencemi $phi_1, dots, phi_n$. K axiomatizaci $overline(K)$ nám postačí $psi = not(phi_1 and dots and phi_n), M(psi) = overline(K)$.

Nechť jsou teorie $T, S$ takové, že $M(T) = K$ a $M(S) = overline(K)$. Uvažme teorii $T union S$; ta je sporná, neboť: $ M(T union S) = M(T) inter M(S) = K inter overline(K) = emptyset $
Podle věty o kompaktnosti (L7) existují konečné podteorie $T' subs T$ a $S' subs S$ takové, že $ M(T' union S') = M(T') inter M(S') = emptyset $
Nutně ale $ M(T) subs M(T') subs overline(M(S')) subs overline(M(S)) = M(T) $
Tedy $M(T) = M(T')$, tedy $T'$ je hledaná konečná axiomatizace $K$.

== (T14) Rekurzivně axiomatizovaná teorie s rekurzivně spočetnou kompletací je rozhodnutelná

Řekneme, že teorie $T$ má _rekurzivně spočetnou kompletaci_, pokud má až na ekvivalenci jen spočetně mnoho kompletních jednoduchých extenzí a (nějaká) množina až na ekvivalenci všech kompletních jednoduchých extenzí teorie $T$ je rekurzivně spočetná, tj. existuje algoritmus, který pro danou vstupní dvojici přirozených
čísel $(i, j)$ vypíše na výstup $i$-tý axiom $j$-té extenze (v nějakém pevně daném uspořádání, na což potřebujeme, aby byl jazyk spočetný), nebo odpoví, že takový axiom už neexistuje (je-li extenzí méně než $j$, nebo má-li $j$-tá extenze méně než $i$ axiomů).

Pokud je teorie T rekurzivně axiomatizovaná a má rekurzivně spočetnou kompletaci, potom je T rozhodnutelná.

_Důkaz:_ Pro danou sentenci $phi$ buď $T tack phi$, nebo existuje protipříklad $cA modelsnot phi$, resp. kompletní jednoduchá extenze $T_i$ teorie $T$ takové, že $T_i tack.not phi$. Z kompletnosti však plyne, že $T_i tack not phi$. Náš algoritmus bude paralelně konstruovat tablo důkaz $phi$ z $T$ a postupně tablo důkazy $not phi$ ze všech kompletních jednoduchých extenzí $T_1, T_2, dots$ teorie $T$. Víme, že alespoň jedno z paralelně konstruovaných tabel je sporné (a můžeme předpokládat, že konečné, pokud neprodlužujeme sporné větve), tedy algoritmus jej po konečně mnoha krocích zkonstruuje.

To je vlastně podobné jako (L13), jen tady díky existenci algoritmu odpovídajícího na $(i, j)$ můžeme dělat dotazy i na extenze.
