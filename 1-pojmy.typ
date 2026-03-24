#import "macros.typ": *

= Pojmy

== (P1) Model ve výrokové logice, pravdivostní funkce výroku

Pravdivostní funkce $f_(phi, PP): {0,1}^(|PP|) arrow {0, 1}$ je definována induktivně:
- Je-li $phi$ $i$-tý prvovýrok z $PP$, pak $f_(phi, PP)(x_0, dots, x_(n-1)) = x_i$
- Je-li $phi = not phi'$, pak $f_(phi, PP)(x_0, dots, x_(n-1)) = f_not (f_(phi, PP)(x_0, dots, x_(n-1)))$
- Je-li $phi = (phi' square thin phi'')$, pak $f_(phi, PP)(x_0, dots, x_(n-1)) = f_square (f_(phi', PP)(x_0, dots, x_(n-1)), f_(phi'', PP)(x_0, dots, x_(n-1)))$

$square in {or, and, impl, eqviv}$ a mají pravdivostní funkce podle tabulek.

Model jazyka je libovolné ohodnocení $v: PP arrow {0, 1}$. Pro $PP = {p, q}$ např. $v = {(p, 0), (q, 1)}$.

Všechny modely jazyka $PP$ jsou $MP = {v | v: PP arrow {0, 1}} = {0,1}^PP$ (množina funkcí, resp. množina množin dvojic).

Pro jednoduchost píšeme $v = (0, 1)$. Tedy ztotožňujeme ${0, 1}^PP$ a ${0, 1}^(|PP|)$. To můžeme udělat díky uspořádání jazyka $iota: {0, ..., n-1} arrow PP$.

Mějme výrok $phi$ v $PP$ a model $v in MP$. Pokud platí $f_(phi, PP)(v) = 1$, říkáme, že výrok $phi$ _platí_ v modelu $v$, píšeme $v models p$. Množina všech modelů výroku je $MP (phi) = {v in MP | v models phi} = f_(phi, PP)^(-1)[1]$.

== (P2) Sémantické pojmy v logice, vzhledem k teorii

Výrok $phi$ je:
- _pravdivý_, _tautologie_, _platí_, _$models phi$_, pokud $MP (phi) = MP$
- _lživý_, _sporný_, pokud $MP (phi) = emptyset$ (_být lživý_ není totéž co _nebýt pravdivý_)
- _nezávislý_, pokud platí v nějakém modelu a neplatí v nějakém jiném modelu, $emptyset subset.neq MP(phi) subset.neq MP$, resp. není lživý, ani pravdivý
- _splnitelný_, pokud má nějaký model, tj. není _lživý_, $MP (phi) neq emptyset$


Mějme teorii $T$ v jazyce $PP$, pak je výrok $phi$:
- _pravdivý v/důsledek $T$_, $T models phi$, pokud $phi$ platí v každém modelu teorie, resp. $MP(T) subs MP(phi)$
- _lživý/sporný v $T$_, pokud neplatí v žádném modelu, resp. $MP(phi) inter MP(T) = MP(phi, T) = emptyset$
- _nezávislý v $T$_, pokud není _pravdivý_ ani _lživý_, resp. $emptyset subset.neq MP(T, phi), subset.neq MP(T)$
- _splnitelný/konzistentní v T_, pokud platí v nějakém modelu $T$, resp. není lživý v $T$, $MP(T, phi) neq emptyset$

== (P3) Ekvivalence výroků resp. výrokových teorií, T-ekvivalence

Pokud jsou $phi$ a $psi$ logicky ekvivalentní, $MP(phi) = MP(psi)$, píšeme $phi ~ psi$.

Pokud jsou výroky ekvivalentní v $T$, _$T$-ekvivalentní_, $MP(T, phi) = MP(T, psi)$, píšeme $phi thin scripts(tilde)_(T) psi$.


== (P4) Sémantické pojmy o teorii

Dvě teorie jsou ekvivalentní, $T tilde T'$, právě když $MP(T) = MP(T')$.

Teorie $T$ je:
- _sporná_, jestliže v ní platí $fal$, ekvivalentně jestliže nemá žádný model, ekv. v ní platí všechny výroky
- _bezesporná_, pokud není sporná, tj. má model
- _kompletní_, jestliže není sporná a každý výrok v ní je pravdivý nebo lživý (nemá žádné nezávislé výroky), ekvivalentně má právě jeden model


== (P5) Extenze teorie, odpovídající sémantická kritéria
// TODO predikátová logika & FmL meme

Důsledek teorie $T$ je každý výrok, který v $T$ platí: $CsqP(T) = {phi in VFP | T models phi}$. Pokud je $T$ teorie v jazyce $PP$, můžeme psát $CsqP(T) = {phi in VFP | MP(T) subs MP(phi)}$. Důsledky:
- $T subs CsqP(T)$
- $CsqP(T) = CsqP(CsqP(T))$
- pokud $T subs T'$, pak $CsqP(T) subs CsqP(T')$
- $phi in CsqP({phi_1, dots, phi_n})$ právě když je výrok $(phi_1 and dots and phi_n) impl phi$ tautologie

Rozšířením, neboli extenzí teorie $T$ myslíme jakoukoliv teorii $T'$, která splňuje vše, co platí v teorii T (a něco navíc, nejde-li o triviální případ). Jinými slovy extenze má stejné důsledky jako původní teorie. Extenze teorie může přidat důsledky, na úkor možného odebrání modelů.

Mejme teorii $T$ v jazyce $PP$
- _Extenze_ teorie $T$ je libovolná teorie $T'$ v jazyce $PP' supset.eq PP$ splňující $CsqP(T) subs "Csq"_PP' (T')$
- _Jednoduchá extenze_, pokud $PP = PP'$
- _Konzervativní extenze_, pokud $CsqP(T) = CsqP(T') = "Csq"_PP' (T') inter VFP$

Je-li $T$ teorie v jazyce $PP$ a $T'$ v jazyce $PP'$ obsahujícím jazyk $PP$, pak:
- $T'$ je _jednoduchou_ extenzí $T$, právě když $PP = PP'$ a $MP(T') subs MP(T)$.
- $T'$ je extenzí $T$, právě když $M_PP'(T') subs M_PP'(T)$. Uvažujeme tedy modely teorie $T$ nad rozšířeným jazykem $PP'$. Jinými slovy restrikce ("zapomenutí" hodnot pro nové výrokové proměnné) libovolného modelu $v in M_PP'(T')$ na původní jazyk $PP$ musí být modelem $T$. Píšeme $v scripts(harpoon.tr)_PP in MP(T)$, nebo ${v scripts(harpoon.tr)_PP in M_PP (T')} subs MP(T)$.
- $T'$ je _konzervativní_ extenzí $T$, pokud je extenzí a navíc platí, že každý model $T$ lze nějak expandovat na model $T'$ (v jazyce $PP'$). Můžeme psát $v scripts(harpoon.tr)_PP in MP(T)$, nebo ${v scripts(harpoon.tr)_PP in M_PP (T')} = MP(T)$.
- $T$ je extenzí $T'$ a naopak právě když mají stejný jazyk a modely, tedy $T ~ T'$.


== (P6) Tablo z teorie, tablo důkaz

Strom je neprázdná množina T#footnote[Protože matematici neznají víc jak 4 latinská písmenka] s částečným uspořádáním $scripts(<)_T$, které ma jediný minimální prvek _kořen_, a ve kterém je množina předků libovolného vrcholu dobře uspořádaná.
- _Větev_ stromu je maximální (tj. nelze do ní přidat další vrcholy stromu) lineárně uspořádaná podmnožina $T$
- _Uspořádaný strom_ je strom $T$ spolu s lineárním uspořádáním $scripts(<)_L$ množiny synů každého vrcholu. Uspořádání synů označíme _pravolevé_, zatímco $scripts(<)_T$ je _stromové_
- _Označkovaný strom_ je strom spolu s funkcí $text("label"): V(T) arrow text("Labels")$

_Položka_ je nápis T$phi$ nebo F$phi$, kde $phi$ je nějaký výrok.

_Konečné tablo z teorie $T$_ je uspořádaný, položkami označkovaný strom zkonstruovaný konečně mnoha z následujících pravidel:
- jednoprvkový strom označkovaný libovolnou položkou je tablo z teorie $T$
- pro libovolnou položku $P$ na libovolné větvi $V$ můžeme na konec větve $V$ připojit _atomické tablo_ pro položku $P$
- na konec libovolné větve můžeme připojit položku T$alpha$ pro axiom teorie $alpha in T$

Tablo může být konečné i nekonečné, každopádně vzniklo v spočetně mnoha krocích.

Tablo důkaz je v podstatě důkaz sporem, na začátek předpokládáme, že výrok neplatí a hledáme sporné tablo.

_Tablo důkaz_ výroku $phi$ z teorie $T$ je _sporné_ tablo z teorie $T$ s položkou F$phi$ v kořeni. Pokud existuje, je $phi$ _dokazatelný_ z $T$, píšeme $T tack phi$.#footnote[$tack$ označuje syntaktickou dokazatelnost, resp. existenci formálního důkazu, kdežto $models$ označuje sémantický vztah o pravdivosti ve strukturách. Gödelova věta o úplnosti říká, že pro výrokovou logiku tyto dva termíny splývají.]
- Tablo je _sporné_, pokud je každá jeho větev sporná
- Větev je _sporná_, pokud obsahuje položky T$psi$ a F$psi$ pro nějaký výrok $psi$, jinak je _bezesporná_
- Tablo je _dokončené_, pokud je každá jeho větev dokončená
- Větev je dokončená, pokud
  - je sporná, nebo
  - je každá její položka na této větvi _redukovaná_ a zároveň obsahuje položku T$alpha$ pro každý axiom $alpha in T$
- Položka $P$ je _redukovaná_ na větvi V procházející touto položkou, pokud
  - je tvaru T$p$ resp. F$p$ pro nějakou výrokovou proměnnou $p in PP$, nebo
  - vyskytuje se na V jako kořen atomického tabla

== (P7) Kongruence struktury, faktorstruktura, axiomy rovnosti

Mějme ekvivalenci $~$ na množině $A$, funkci $f: A^n arrow A$ a relaci $R subs A^n$. Říkáme, že $~$ je:
- _kongruencí_ pro funkci $f$, pokud pro všechna $a_i, b_i in A$ takové, že $a_i ~ b_i$ ($1 <= i <= n$), platí $f(a_1, dots, a_n) ~ f(b_1, dots, b_n)$
- _kongruencí_ pro relaci $R$, pokud pro všechna $a_i, b_i in A$ takové, že $a_i ~ b_i$ ($1 <= i <= n$), platí $(a_1, dots, a_n) in R$ právě tehdy, když $(b_1, dots, b_n) in R$

_Kongruence struktury_ $cA$ je ekvivalence $~$ na množině $A$, která je kongruencí pro všechny funkce a relace $cA$.

Mějme strukturu $cA$ a její kongruenci. _Faktorstruktura_ (_podílová struktura_) $cA$ podle $~$ je struktura $cA scripts(\/)_(~)$ v témž jazyce, jejíž univerzum $cA scripts(\/)_(~)$ je množina všech rozkladových tříd $A$ podle $~$ a jejíž funkce a relace jsou definované pomocí reprezentantů, tj:
- $f^(cA scripts(\/)_(~))([a_1]_~, dots, [a_n]_~) = [f^cA (a_1, dots, a_n)]_~$ pro každý n-ární funkční symbol $f$
- $R^(cA scripts(\/)_(~))([a_1]_~, dots, [a_n]_~)$ právě tehdy, když $R^cA (a_1, dots, a_n)$ pro každý n-ární relační symbol $R$

_Axiomy rovnosti_ pro jazyk $L$ s rovností jsou následující:\
(i) $x = x$\
(ii) $x_1 = y_1 and dots and x_n = y_n impl f(x_1, dots, x_n) = f(y_1, dots, y_n)$ pro každý n-ární funkční symbol $f$\
(iii) $x_1 = y_1 and dots and x_n = y_n impl (R(x_1, dots, x_n) impl R(y_1, dots, y_n))$ pro každý n-ární relační symbol $R$

Z axiomů (i) a (iii) tedy plyne, že relace $scripts(=)^cA$ je ekvivalence na $A$. Axiomy (ii) a (iii) vyjadřují, že $scripts(=)^cA$ je kongruencí $cA$.

== (P8) CNF a DNF, Hornův tvar. Množinová reprezentace CNF formule, splňující ohodnocení

_Literál_ $cl$ je buď prvovýrok $p$, nebo jeho negace $not p$. Pro prvovýrok $p$ označme $p^0 = not p$ a $p^1 = p$. Nápis $cln$ označuje opačný literál k $cl$.

_Klauzule_ je disjunkce literálů. Prázdnou klauzulí myslíme $fal$.#footnote[Reprezentuje disjunkci prázdné množiny literálů, žádný z disjunktů tedy není splněný.]

Výrok je v _konjunktivní normální formě, CNF_, pokud je konjunkcí klauzulí. Prázdný výrok v CNF je~$tu$.

_Elementární konjunkce_ je konjunkce literálů. Prázdnou elementární konjunkcí myslíme $tu$.

Výrok je v _disjunktní normální formě, DNF_, pokud je disjunkcí elementárních konjunkcí. Prázdný výrok v DNF je $fal$.

Výrok je _hornovský_, pokud je konjunkcí hornovských klauzulí, tj. klauzulí obsahujících nejvýše jeden pozitivní literál. Jejich význam vyplývá z ekvivalentního vyjádření implikace:

$ not p_1 or not p_2 or dots or not p_n or q ~ (p_1 and p_2 and dots and p_n) impl q $

Hornovské výroky tedy dobře modelují systémy, kde splnění určitých podmínek zaručuje
splnění jiné podmínky.

V _množinové reprezentaci_ odpovídají modely množinám literálů, které obsahují pro každou výrokovou proměnnou $p$ právě jeden z literálů $p, not p$:
- _(Částečné) ohodnocení_ $cal(V)$ je libovolná množina literálů, která je _konzistentní_, tj. neobsahuje dvojici opačných literálů
- Ohodnocení je _úplné_, pokud obsahuje pozitivní či negativní literál pro každou výrokovou proměnnou
- Ohodnocení $cal(V)$ _splňuje_ formuli $S$, píšeme $cal(V) models S$, pokud $V$ obsahuje nějaký literál z každé klauzule v $S$, tj: $cal(V) inter C neq emptyset "pro každou" C in S$.

Výrok $phi = (not p_1 or p_2) ∧ (not p_1 or not p_2 or p_3) ∧ (not p_3 or not p_4) ∧ (not p_4 or not p_5) ∧ p_4$ zapíšeme
v množinové reprezentaci takto:
$S = {{not p_1, p_2}, {not p_1, not p_2, p_3}, {not p_3, not p_4}, {not p_4, not p_5}, {p_4}}$

Ohodnocení $V = {not p_1, not p_3, p_4, not p_5}$ splňuje $S$, píšeme $V models S$. Není úplné, ale můžeme ho
rozšířit libovolným literálem pro $p_2$: platí $V union {p_2} models S$ i $V union {not p_2} models S$. Tato dvě úplná
ohodnocení odpovídají modelům $(0, 1, 0, 1, 0)$ a $(0, 0, 0, 1, 0)$.

== (P9) Rezoluční pravidlo, (nejobecnější) unifikace, rezoluční důkaz a zamítnutí.

_Rezoluční pravidlo:_ Mějme klauzule $C_1, C_2$ a literál $cl$ takový, že $cl in C_1 "a" cln in C_2$. Potom _rezolventa_ klauzulí $C_1 "a" C_2$ přes literál $cl$ je: $ C = (C_1 \\ {cl}) union (C_2 \\ {cln}) $

Pokud $cV models C_1$ a $cV models C_2$, tak $cV models C$, tedy rezoluční pravidlo je užitečné (zachovává splnitelnost).

_Rezoluční důkaz_ je konečná posloupnost klauzulí $C_0, C_1, dots, C_N = C$ taková, že pro každé $i$ buď $C_i in S$, nebo $C_i$ je rezolventou nějakých $C_j, C_k "kde" j,k < i$. Pokud rezoluční důkaz exituje, říkáme, že $C$ je _rezolucí dokazatelná_ z $S$, píšeme $S scripts(tack)_R C$. _Rezoluční zamítnutí_ CNF formule $S$ je rezoluční důkaz $square "z" S$, v tom případě je $S$ _rezolucí zamítnutelná_.

V predikátové logice, _substituce_ je konečná množina $sigma = {x_1 \/t_1, dots, x_n \/t_n}$, kde $x_i$ jsou navzájem různé proměnné a $t_i$ jsou termy (viz P11), přičemž vyžadujeme, aby $t_i$ nebyl roven proměnné $x_i$. Substituce je
- _základní_, pokud jsou všechny termy $t_i$ konstantní
- _přejmenování proměnných_, jsou-li všechny $t_i$ navzájem různé proměnné

_Instance_ výrazu $E$ při _substituci_ $sigma = {x_1 \/t_1, dots, x_n \/t_n}$ je výraz vzniklý z $E$ _simultánním_ nahrazením všech výskytů proměnných termy, označíme jej $E sigma$. Je-li $S$ množina výrazů, pak $S sigma = {E sigma | E in S}$.

Které substituce se nám hodí? Takové, po jejichž provedení se dané výrazy 'stanou stejnými', tj. _unifikovanými_.

Mějme konečnou množinu výrazů $S = {E_1, dots, E_n}$. Substituce $sigma$ je _unifikace_ pro $S$, pokud $E_1 sigma = dots = E_n sigma$, neboli $S sigma$ obsahuje jediný výraz. Unifikace pro $S$ je _nejobecnější_, pokud pro každou unifikaci $tau$ pro $S$ existuje substituce $lambda$ t.ž. $tau = sigma lambda$. Těch může být více, liší se ale pouze přejmenováním proměnných.

Uvažme množinu výrazů $S = {P(f(x), y), P(f(a), w)}$. Nejobecnější unifikací pro $S "je" sigma = {x\/a, y\/w}$. Jinou unifikací je $tau = {x\/a, y\/c, w\/b}$, není ale nejobecnější, nelze z ní získat např. unifikaci $rho = {x\/a, y\/c, w\/c}$. Unifikaci $tau$ naopak lze získat z nejobecnější unifikace pomocí substituce $lambda = {w\/b}, tau = sigma lambda$.

// todo: rezoluce v predikátové logice pořádně

== (P10) Signatura, jazyk, struktura

_Signatura_ je dvojice $sl cR, cF sr$, kde $cR, cF$ jsou disjunktní množiny symbolů (relační a funkční zahrnující konstantní) spolu s danými aritami (danými funkcí $text("ar"): cR union cF arrow NN$) a neobsahující symbol $=$, který je rezervovaný pro _rovnost_. Signatura se často zapisuje jen výčtem symbolů, je-li arita a to, zdali jsou relační/funkční, zřejmé z kontextu.

_Struktura_ v signatuře $sig$ je trojice $cA = sl A, cR^cA, cF^cA sr$, kde:
- $A$ je neprázdná množina, _doména_, _univerzum_
- $cR^cA = {R^cA | R in cR}$ kde $R^cA subs A^(ar(R))$ je je _interpretace_ relačního symbolu $R$
- $cF^cA = {f^cA | f in cF}$ kde $f^cA: A^ar(f) arrow A$ je interpretace funkčního symbolu $f$ (speciální pro konstantní symbol $c in cF$ máme $c^cA in A$)

Tady se střetávají symboly a významy, kupříkladu: symbol $+$ je binární funkce s aritou 2. Ve struktuře $sl NN, +^NN sr$ je $+^NN$ běžné sčítání: $+^NN (2,3)$ je rovno 5. Kdežto ve struktuře $sl ZZ_5, +^(ZZ_5) sr$ by to bylo sčítání modulo pěti: $+^(ZZ_5)(3,4)$ je rovno 2.

Do _jazyka_ patří následující:
- spočetně mnoho proměnných
- relační, funkční a konstantní symboly ze signatury,
- univerzální a existenční kvantifikátory $(exists x), (forall x)$ pro každou proměnnou $x in Var$ (kvantifikátor chápeme jako jeden symbol, ne jako symbol $exists$/$forall$ s nějakou proměnnou)
- symboly pro logické spojky a závorky
- informace, jestli je to jazyk _s rovností_ či bez

Do jazyka *nepatří* univerzum.

== (P11) Atomické formule, formule, sentence, otevřené formule

_Termy_ jazyka $L$ jsou konečné nápisy definované induktivně:
- každá proměnná a každý konstantní symbol z $L$ je term
- je-li $f$ funkční symbol z $L$ arit $n$ a jsou-li $t_1, dots, t_n$ termy, potom nápis $f(t_1, dots, t_n)$ je také term

Term tedy nemůže obsahovat relaci. Pokud term neobsahuje proměnnou, říkáme mu _konstantní_ či _ground_.

_Atomická formule_ jazyka $L$ je nápis $R(t_1, dots, t_n)$ kde $R$ je n-ární relační symbol z $L$ (včetně $=$ je-li to jazyk s rovností) a $t_i in text("Term")_L$. Často používáme infixový zápis, např. $t_1 <= t_2$.

_Formule_ jazyka $L$ jsou konečné nápisy definovány induktivně:
- každá atomická formula jazyka $L$ je formule
- je-li $phi$ formule, potom $(not phi)$ je formule
- jsou-li $phi, psi$ formule, pak $(phi and psi)$, atd... jsou formule
- je-li $phi$ formule a $x$ proměnná, pak $((exists x) phi)$ a $((forall x) phi)$ jsou formule

_Výskyt_ proměnné $x$ je _vázaný_, pokud se nachází v podvýroku (podstromu) začínajícím $(Q x)$.

Formule je _otevřená_, neobsahuje-li žádný kvantifikátor a _uzavřená_, neboli _sentence_, pokud nemá žádnou _volnou proměnnou_ (opak vázané).

Každá atomická formule je otevřená, otevřená formule je jen kombinací atomických formulí a logických spojek. Formule může být otevřená i uzavřená zároveň, v tom případě jsou všechny její termy konstantní.

== (P12) Pravdivostní hodnota formule ve struktuře při ohodnocení, platnost formule ve struktuře

_Model jazyka_ $L$, či _$L$-struktura_ je libovolná struktura v signatuře jazyka $L$. Třídu všech modelů označíme $M_L$.#footnote[Musíme říkat třída, protože neexistuje množina všech množin.]<trida>

Mějme term $t$ jazyka $L = sig$ (s rovností či bez), a $L$-strukturu $cA = struct$. _Ohodnocení proměnných_ v množině $A$ je libovolná funkce $e: Var arrow A$. (Za proměnnou "dosazuji" libovolný prvek univerza)

_Hodnota termu_ $t$ ve struktuře $cA$ při ohodnocení $e$, kterou značíme $t^cA [e]$ je dána induktivně:
- $x^cA [e] = e(x)$ pro proměnnou $x in Var$
- $c^cA [e] = c^cA$ pro konstantní symbol $c in cF$
- je-li $t = f(t_1, dots, t_n)$ složený term kde $f in cF$ je n-ární funkční symbol, pak: $t^cA [e] = f^cA (t^cA_1 [e], dots, t^cA_n [e])$

Hodnota konstanty na ohodnocení nezávisí. Hodnota termu závisí pouze na ohodnocení proměnných vyskytujících se v něm.

Mějme $phi$ v jazyce $L$, strukturu $cA in M_L$, a ohodnocení $e$. _Pravdivostní hodnota_ $phi$ v $cA$ při ohodnocení e, $PH^cA (phi)[e]$ je definována induktivně podle struktury formule:

- pro atomickou formuli $phi = R(t_1, dots, t_n)$ máme
$ PH^cA (phi)[e] = cases(
  1 "pokud" (t^cA_1 [e], dots, t^cA_n [e]) in R^cA,
  0 "jinak"
) $

Speciálně je-li $phi$ tvaru $t_1 = t_2$, jde o identitu na A, tj. obě strany rovnosti jsou ten stejný prvek $a in A$ (prostě, symbol rovnosti je speciálně rezervovaný; víme, že nebude použitý pro arbitrární relaci).

Pravdivostní hodnota negace je definována takto:

$ PH^cA (not phi)[e] = f_not (PH^cA (phi)[e]) = 1 - PH^cA (phi)[e] $

Obdobně pro binární logické spojky. Jsou-li $phi, psi$ a $square in {and, or, impl, eqviv}$, pak:

$ PH^cA (phi square psi)[e] = f_square (PH^cA (phi)[e], PH^cA (psi)[e]) $

Zbývá definovat pravdivostní hodnotu pro kvantifikátory. Změníme-li v ohodnocení $e: Var arrow A$ hodnotu pro proměnnou $x$ na $a$, výsledné ohodnocení zapíšeme jako $e(x\/a)$. Platí tedy $e(x\/a)(x) = a$. Pravdivostní hodnotu pro $(Q x)phi$ definujeme:

$ PH^cA ((forall x)phi)[e] = min_(a in A)(PH^cA (phi)[e(x\/a)]) $
$ PH^cA ((exists x)phi)[e] = max_(a in A)(PH^cA (phi)[e(x\/a)]) $

Tedy v ohodnocení $e$ projedeme všechny možné prvky $a in A$, nastavíme na ně $x$ a požadujeme, aby alespoň jednou/vždy byla pravdivostní hodnota rovna 1 (kvantifikátory hrají roli konjunkce/disjunkce přes všechny prvky struktury).

Mějme formuli $phi$ a strukturu $cA$ ve stejném jazyce.
- Je-li $e$ ohodnocení a $PH^cA (phi)[e] = 1$, potom říkáme, že $phi$ _platí_ v $cA$ při ohodnocení $e$, píšeme $cA models phi[e]$. V opačném případě neplatí, $cA tack.double.not phi[e]$
- Pokud $phi$ platí v $cA$ při každém ohodnocení $e: Var arrow A$, potom říkáme, že $phi$ _je pravdivá, platí_ v $cA$, píšeme $cA models phi$
- Pokud $cA models not phi$, tj. $phi$ neplatí v $cA$ při žádném ohodnocení (pro každé $e$ máme $cA tack.double.not phi[e]$), potom $phi$ _je lživá_ v $cA$ ("lživá" není totéž co "není pravdivá", to platí jen pro sentence)

== (P13) Kompletní teorie v predikátové logice, elementární ekvivalence

_Teorie_ jazyka $L$ je libovolná množina $T$ $L$-formulí, prvkům říkáme _axiomy_. Model teorie je $L$-struktura, ve které platí všechny axiomy teorie $T$, tj. $cA models phi$ pro všechna $phi in T$, což značíme $cA models T$. Třída#footnote(<trida>) modelů teorie je $M_L (T) = {cA in M_L | cA models T}$

Je-li $T$ teorie v jazyce $L$ a $phi$ $L$-formule, potom říkáme, že $phi$ je:
- _pravdivá, platí_ v $T$, $T models phi$, pokud $cA models phi$ pro všechna $cA in M(T)$, neboli $M(T) subs M(phi)$
- _lživá_ v T, pokud $T models not phi$, tj. pokud je lživá v každém modelu $T$, $M(T) inter M(phi) = emptyset$
- _nezávislá_ v $T$, pokud není ani pravdivá, ani lživá v $T$

Pokud máme prázdnou teorii, píšeme $models phi$, říkáme že $phi$ je pravdivé (v logice), tautologie. Teorie je _sporná_, právě když v ní platí každá formule, nebo ekvivalentně, právě když nemá žádný model; jinak je bezesporná. Sentencím pravdivým v $T$ říkáme důsledky $T$, množina všech důsledků je $ "Csq"_L (T) = {phi | phi "je sentence a" T models phi} $

Teorie je _kompletní_, je-li bezesporná a každá _sentence_ je v ní buď pravdivá, nebo lživá.

Nemůžeme říci, že teorie je _kompletní_, pokud má jediný model. Máme-li totiž jeden model, získáme z něj nekonečně mnoho jiných izomorfních modelů, tj. lišících se jen pojmenováním prvků univerza. Uvažovat jediný model "až na izomorfismus" by ale nebylo dostatečné.

Struktury $cA, cB$ v témž jazyce jsou _elementárně ekvivalentní_, pokud v nich platí tytéž sentence. Píšeme $cA equiv cB$.

Např. elementárně ekvivalentní, ale ne izomorfní, jsou struktury $sl QQ, <= sr$ a $sl RR, <= sr$.

== (P14) Podstruktura, generovaná podstruktura, expanze a redukt struktury.

Mějme $cA = struct$ v signatuře $sig$. Struktura $cB = sl B, cR^cB, cF^cB sr$ je (indukovaná) _podstruktura_ $cA$, značíme $cB subs cA$, jestliže:
- $emptyset neq B subs A$,
- $R^cB = R^cA inter B^(ar(R))$ pro každý relační symbol $R in cR$
- $f^cB = f^cA inter (B^(ar(f)) times B)$ pro každý funkční symbol $f in cF$ (tj. funkce $f^cB$ je restrikce $f^cA$ na množinu B a její výstupy jsou všechny také z $B$)
- speciálně, pro každý konstantní symbol $c in cF$ máme $c^cB = c^cA in B$

Jinak řečeno, vybereme nějakou podmnožinu B univerza A, vytvoříme z ní strukturu stejné signatury, která "zdědí" relace, funkce i konstanty. Potřebujeme, aby byla B _uzavřená_ na funkce. Co když máme množinu, která není uzavřená?

Mějme $cA = struct$ a neprázdnou množinu $X subs A$. Označme B jako nejmenší podmnožinu A, která obsahuje X a je uzavřená na všechny funkce struktury $cA$. Potom o podstruktuře $cA harpoon.tr B$ říkáme, že je _generovaná_ množinou $X$ a značíme ji $cA sl X sr$.

Mějme jazyky $L subs L'$, $L$-strukturu $cA$ a $L'$-strukturu $cA'$ na stejné doméně $A = A'$. Jestliže je interpretace každého symbolu z $L$ (relačního, funkčního, konstantního) stejná (relace, funkce, konstanta) v $cA$ i v $cA'$ potom říkáme, že struktura $cA'$ je _expanzí_ struktury $cA$ do jazyka $L'$ ($L'$-expanzí) a že struktura $cA$ je _reduktem_ struktury $cA'$ na jazyk $L$ ($L$-reduktem).

== (P15) Definovatelnost ve struktuře

Formuli s jednou volnou proměnnou $x$ můžeme chápat jako vlastnost prvků. V dané struktuře taková formule definuje množinu prvků, které tuto vlastnost splňují, tj. takových, že formule platí při ohodnocení $e$, ve kterém $e(x) = a$. Máme-li formuli se dvěma volnými proměnnými, definuje binární relaci, atp. Zápis $phi(x_1, dots, x_n)$ znamená, že $x_1, dots, x_n$ jsou právě všechny volné proměnné formule $phi$.

Mějme $phi(x_1, dots, x_n)$ a strukturu $cA$ v témž jazyce. _Množina definovaná formulí_ $phi(x_1, dots, x_n)$ ve struktuře $cA$, značíme $phi^cA (x_1, dots, x_n)$, je: $ phi^cA (x_1, dots, x_n) = {(a_1,dots,a_n) in A^n | A models phi[e(x_1\/a_1, dots, x_n\/a_n)]} $

Např. formule $not (exists y)E(x,y)$ definuje množinu izolovaných vrcholů v grafu.

Občas se hodí mluvit o vlastnostech prvků relativně k jiným prvkům dané struktury. To nelze vyjádřit čistě syntakticky, ale můžeme za některé z volných proměnných dosadit prvky struktury jako _parametry_. Zápisem $phi(overline(x), overline(y))$ myslíme, že formule $phi$ má volné proměnné $x_1, dots, x_n, y_1, dots, y_k$ (pro nějaká $n, k$).

Mějme formuli $phi(overline(x), overline(y))$, kde $|overline(x)|=n, |overline(y)|=k$, strukturu $cA$ v témž jazyce a k-tici prvků $overline(b) in A^k$. _Množina definovaná formulí $phi(overline(x), overline(y))$ s parametry $overline(b)$ ve struktuře $cA$_ značíme $phi^(cA,overline(b))(overline(x), overline(y))$ je: $ phi^(cA,overline(b))(overline(x), overline(y)) = {overline(a) in A^n | cA models phi[e(overline(x)\/overline(a), overline(y)\/overline(b))]} $

Např. pro $phi(x, y) = E(x, y)$ je $phi^(cal(G), v)(x,y)$ množina všech sousedů $v$.

== (P16) Extenze o definice

_Extenze o definice_ je druh konzervativní extenze, která do jazyka přidává nové funkční/relační/konstantní symboly a dává jim definici pomocí formule v původním jazyce.

Relační symbol se definuje jednoduše jako $R(x_1, ..., x_n) eqviv psi(x_1, ..., x_n)$.

Funkční symbol jako rovnost s výstupní hodnotou: $f(x_1, ..., x_n) = y eqviv psi(x_1, ..., x_n, y)$, navíc musí platit
- axiom existence (alespoň jedna výstupní hodnota): $(exists y) psi(x_1, ..., x_n, y)$,
- axiom jednoznačnosti (max jedna výstupní hodnota): $psi(x_1, ..., x_n, y) and psi(x_1, ..., x_n, z) impl y = z$.

Konstantní symbol je funkční symbol bez vstupních parametrů, tedy musí splňovat dva axiomy $(exists y) psi(y)$ a $psi(y) and psi(z) impl y = z$ a je definován $y = c eqviv psi(y)$. Např. v aritmetice lze definovat symbol $1$ jako $y = 1 eqviv y = S(0)$, tedy v každém modelu bude muset symbol $1$ být interpretován jako následník nuly.

Například v teorii grup můžeme zavést _binární_ funkční symbol $minus_b$ pomocí $+$ a unárního $-$ takto: $ x_1 minus_b x_2 = y eqviv x_1 + (-x_2) = y $

== (P17) Prenexní normální forma, Skolemova varianta

_Prenexní normální forma_ je "vytknutí kvantifikátorů", formule $phi$ je v _PNF_, je-li tvaru $ (Q_1 x_1)dots(Q_n x_n)phi' $ kde $Q_i$ je kvantifikátor a formule $phi'$ je otevřená. $phi'$ pak říkáme _otevřené jádro_ a $(Q_1 x_1)dots(Q_n x_n)$ je _kvantifikátorový prefix_. Jsou-li všechny kvantifikátory v PNF formuli univerzální, je pak $phi$ _univerzální formule_.

Mějme $L$-sentenci $phi$ v PNF, a nechť všechny její vázané proměnné jsou různé. Nechť existenční kvantifikátory v prefixu $phi$ jsou $(exists y_1),dots,(exists y_n)$ v tomto pořadí, a nechť pro každé $i$ jsou $(forall x_1),dots,(forall x_n_i)$ právě všechny univerzální kvantifikátory předcházející kvantifikátoru $(exists y_i)$ v prefixu $phi$. Označme $L'$ rozšíření $L$ o nové $n_i$-ární funkční symboly $f_1,...,f_n$, kde symbol $f_i$ je arity $n_i$ pro každé $i$. _Skolemova varianta_ sentence $phi$ je $L'$-sentence $phi_S$ vzniklá z $phi$ tak, že pro každé $i= 1, ...,n$:
- odstraníme z prefixu kvantifikátor $(exists y_i)$
- substituujeme za proměnnou $y_i$ term $f_i (x_1,dots,x_n_i)$

== (P18) Izomorfismus struktur, $omega$-kategorická teorie

Neformálně řečeno, struktury jsou _izomorfní_, pokud se liší jen pojmenováním konkrétních prvků.

Mějme struktury $cA,cB "jazyka" L = sig$. _Izomorfismus_ $cA "a" cB$ je bijekce $h: A arrow B$ splňující:
- Pro každý ($n$-ární) funkční symbol $f in cF$ a pro všechna $a_i in A$ platí: $ h(f^cA (a_1,dots,a_n)) = f^cB (h(a_1),dots,h(a_n)) $
- Pro každý ($n$-ární) relační symbol $R in cR$ a pro všechna $a_i in A$ platí: $ R^cA (a_1,dots,a_n) "právě když" R^cB (h(a_1),dots,h(a_n)) $

Pokud existuje, říkáme, že $cA "a" cB$ jsou izomorfní, píšeme $cA tilde.eq cB$. Býti izomorfní je ekvivalence.

_Izomorfní spektrum_ teorie $T$ je počet $I(kappa, T)$ modelů $T$ kardinality $kappa$ až na izomorfismus, pro každou kardinalitu $kappa$ (včetně nekonečných). Teorie $T$ je $kappa$-kategorická, pokud $I(kappa,T) = 1$.

Teď česky: $I(kappa,T)$ říká "kolik strukturně odlišných způsobů existuje, jak realizovat teorii $T$ na množině (univerzu) velikosti $kappa$?". Když je teorie $kappa$-kategorická, všechny modely jsou navzájem izomorfní, tedy "existuje jedno řešení", v kardinalitě $kappa$ má teorie "jedinečnou realizaci".

Teorie $T$ je $omega$-kategorická $<=>$ $I(omega, T) = 1$ $<=>$ $T$ má pouze jeden#footnote[Až na izomorfismus.] spočetně nekonečný model.#footnote[$omega$ tady značí nejmenší nekonečné ordinální (řadové) číslo. Prostě nekonečno.]

== (P19) Axiomatizovatelnost, konečná axiomatizovatelnost, otevřená axiomatizovatelnost

Za jakých okolností lze 'popsat' (axiomatizovat) třídu modelů respektive teorii. Zajímat nás bude také kdy si vystačíme s konečně mnoha axiomy, a kdy to lze pomocí otevřených axiomů (kterých může být i nekonečně mnoho).

Mějme třídu struktur $K subs M_L$ v nějakém jazyce $L$. $K$ je:
- _Axiomatizovatelná_, pokud existuje $L$-teorie $T$ taková, že $M_L (T) = K$
- _Konečně axiomatizovatelná_, pokud je axiomatizovatelná konečnou teorií
- _Otevřeně axiomatizovatelná_, pokud je axiomatizovatelná otevřenou teorií (otevřená teorie je teorie, jejíž všechny axiomy jsou otevřené formule. Formule je otevřená, neobsahuje-li žádný kvantifikátor)

// todo: fix links
Např. tělesa jsou konečně, ale ne otevřeně axiomatizovatelná (potřebujeme univerzální požadavek na existenci inverzního prvku). Dále pak teorie konečných grafů není axiomatizovatelná (viz L7).

== (P20) Rekurzivní axiomatizace, rekurzivní axiomatizovatelnost, rekurzivně spočetná kompletace

V dokazovacích systémech potřebujeme přístup k axiomům v teoriích (které můžou být nekonečné). Nabízí se _enumerátor_, nějaký algoritmus co každý axiom někdy vypíše (nutný předpoklad je, aby $T$ bylo spočetné, resp. aby jazyk byl spočetný). Pokud bychom ale dostali důkaz, který použil chybný axiom, který v T není, nikdy bychom se to nedozvěděli: nekonečně dlouho bychom čekali, zda jej enumerátor přeci jen nevypíše. Požadujeme proto silnější vlastnost, která umožňuje rozpoznat i chybné důkazy.

Teorie $T$ je _rekurzivně axiomatizovaná_, pokud existuje algoritmus, který pro každou formuli $phi$ odpoví, zdali $phi in T$.

// _Rekurzivní axiomatizace_ je pak už nějaká konkrétní množina axiomů, která axiomatizuje nějakou teorii a zároveň pro tuto teorii existuje ten algoritmus.

Třída $L$-struktur $K subs M_L$ je _rekurzivně axiomatizovatelná_, pokud existuje rekurzivně axiomatizovaná $L$-teorie $T$ taková, že $K = M_L (T)$. Teorie $T'$ je rekurzivně axiomatizovatelná, pokud je rekurzivně axiomatizovatelná třída jejích modelů, neboli pokud je $T'$ ekvivalentní nějaké rekurzivně axiomatizované teorii.

Jinak řečeno, _rekurzivní axiomatizace_ je vlastnost teorií, kdežto _rekurzivní axiomatizovatelnost_ je vlastnost struktur.

Řekneme, že teorie $T$ má rekurzivně spočetnou kompletaci, pokud má až na ekvivalenci jen spočetně mnoho kompletních jednoduchých extenzí a (nějaká) množina až na ekvivalenci všech kompletních jednoduchých extenzí teorie $T$ je rekurzivně spočetná, tj. existuje algoritmus, který pro danou vstupní dvojici přirozených čísel $(i, j)$ vypíše na výstup $i$-tý axiom $j$-té extenze (v nějakém pevně daném uspořádání, na což potřebujeme spočetný jazyk), nebo odpoví, že takový axiom už neexistuje (je-li extenzí méně než $j$, nebo má-li $j$-tá extenze méně než $i$ axiomů).

Je-li $cA$ konečná struktura v konečném jazyce s rovností, potom je teorie Th(A) rekurzivně axiomatizovatelná.

Důkaz: Očíslujme prvky domény jako $A = {a_1, dots, a_n}$. Teorii $Th(cA)$ (všechny sentence platné v $cA$) lze axiomatizovat jedinou sentencí, která je tvaru "existuje právě $n$ prvků $a_1,dots, a_n$ splňujících právě ty základní vztahy o funkčních hodnotách a relacích, které platí ve struktuře $cA$"

Algoritmus pro rozhodnutí $phi in Th(cA)$: Vstup: sentence $phi$
1. Získej všechna možná ohodnocení proměnných prvky ze struktury $cA$
2. Pro každé ohodnocení $e$ vyhodnoť $PH^cA (phi)[e]$
3. Pokud $phi$ platí pro všechna ohodnocení, vrať ANO
4. Jinak vrať NE

== (P21) Rozhodnutelná a částečně rozhodnutelná teorie

Také nás zajímá, zda můžeme v dané teorii $T$ "algoritmicky rozhodovat pravdu" (tj. platnost vstupní formule).

O teorii $T$ říkáme, že je:
- _rozhodnutelná_, pokud existuje algoritmus, který pro každou vstupní formuli $phi$ doběhne a odpoví, zda $T models phi$
- _částečně rozhodnutelná_, pokud existuje algoritmus, který pro každou vstupní formuli $phi$
  - pokud $T models phi$, doběhne a odpoví "ano"
  - pokud $T modelsnot phi$, buď nedoběhne, nebo odpoví "ne"
