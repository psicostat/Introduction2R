# Primi Passi in R {#first-comands}



Ora che abbiamo iniziato a famigliarizzare con il nostro stumento di lavoro possiamo finalmente dare fuoco alle polveri e concentraci sulla scrittura di codici!

In questo capitolo muoveremo i primi passi in R. Inizieremo vedendo come utilizzare operatori matematici, relazionali e logici per compiere semplici operazioni in R. Imparare R è un lungo percorso (scoop: questo percorso non termina mai dato che R è sempre in continuo sviiluppo). Soprattutto all'inizio può sembrare eccessivamente difficile poichè è si incontrano per la prima volta molti comandi e concetti di programmazione. Tuttavia, una volta famigliarizzato con gli apetti di base, la progressione diventa sempre più veloce (inarrestabile direi!).

In questo capitolo introdurremo per la prima volta molti elementi che saranno poi ripresi e approfonditi nei seguenti capitoli. Quindi non preoccuparti se non tutto ti sarà chiaro fin da subito. Imparare il tuo primo linguaggio di programmazione è difficile ma da qualche parte bisogna pure iniziare. Pronto per le tue prime linee di codice? Let's become a useR!

## Operatori Matematici {#math-operators}

R è un'ottima calcolatrice. Nella Tabella \@ref(tab:table-math-operators) sono elencati i principali operatori matematici e funzioni usate in R.

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:table-math-operators)Operatori Matematici</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Funzione </th>
   <th style="text-align:left;"> Nome </th>
   <th style="text-align:left;"> Esempio </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> x + y </td>
   <td style="text-align:left;"> Addizione </td>
   <td style="text-align:left;"> &gt; 5 + 3 <br>[1] 8 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x - y </td>
   <td style="text-align:left;"> Sottrazione </td>
   <td style="text-align:left;"> &gt; 7 - 2 <br>[1] 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x * y </td>
   <td style="text-align:left;"> Moltiplicazione </td>
   <td style="text-align:left;"> &gt; 4 * 3 <br>[1] 12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x / y </td>
   <td style="text-align:left;"> Divisione </td>
   <td style="text-align:left;"> &gt; 8 / 3 <br>[1] 2.666667 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x %% y </td>
   <td style="text-align:left;"> Resto della divisione </td>
   <td style="text-align:left;"> &gt; 7 %% 5 <br>[1] 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x %/% y </td>
   <td style="text-align:left;"> Divisione intera </td>
   <td style="text-align:left;"> &gt; 7 %/% 5 <br>[1] 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x ^ y </td>
   <td style="text-align:left;"> Potenza </td>
   <td style="text-align:left;"> &gt; 3 ^ 3 <br>[1] 27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> abs(x) </td>
   <td style="text-align:left;"> Valore assoluto </td>
   <td style="text-align:left;"> &gt; abs(3-5^2) <br>[1] 22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> sign(x) </td>
   <td style="text-align:left;"> Segno di un'espressione </td>
   <td style="text-align:left;"> &gt; sign(-8) <br>[1] -1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> sqrt(x) </td>
   <td style="text-align:left;"> Radice quadrata </td>
   <td style="text-align:left;"> &gt; sqrt(25) <br>[1] 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> log(x) </td>
   <td style="text-align:left;"> Logaritmo naturale </td>
   <td style="text-align:left;"> &gt; log(10) <br>[1] 2.302585 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> exp(x) </td>
   <td style="text-align:left;"> Esponenziale </td>
   <td style="text-align:left;"> &gt; exp(1) <br>[1] 2.718282 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> sin(x)<br>cos(x)<br>tan(x)<br>asin(x)<br>acos(x)<br>atan(x) </td>
   <td style="text-align:left;"> Funzioni trigonometriche </td>
   <td style="text-align:left;"> &gt;sin(pi/2) <br>[1]1 <br>&gt;cos(pi/2) <br>[1]6.123234e-17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> factorial(x) </td>
   <td style="text-align:left;"> Fattoriale </td>
   <td style="text-align:left;"> &gt; factorial(6) <br>[1] 720 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> choose(n, k) </td>
   <td style="text-align:left;"> Coefficiente binomiale </td>
   <td style="text-align:left;"> &gt; choose(5,3) <br>[1] 10 </td>
  </tr>
</tbody>
</table>

:::{.tip title="Le prime funzioni" data-latex="[Le prime funzioni]"}
Nota come per svolgere operazioni come la radice quadrata o il valore assoluto vengono utlizzate delle specifiche funzioni. In R le funzioni sono richiamate digitando `<nome-funnzione>()` (e.g., `sqrt(25)`) indicando all'interno delle parentesi tonde gli argomenti della funzione. Approfondiremo le funzioni nel Capitolo \@ref(functions-def). 
:::

### Ordine Operazioni

Nello svolgere le operazioni, R segue lo stesso l'ordine usato nelle normali espressioni matematiche. Quindi l'ordine di precedenza degli operatori è:

1. `^` (potenza)
2. `%%` (resto della divisione) e `%/%` (divisione intera) 
3. `*` (moltiplicazione) e `/`(divisione)
4. `+` (addizione) e `-`(sotttrazione)

Nota che in presenza di funzioni (e.g., `abs()`, `sin()`), R per prima cosa sostituisca le funzioni con il loro risultato per poi procedere con l'esecuzione delle operazioni nell'ordine indicato precedentemente.

L'ordine di esecuzione delle operazioni può essere controllato attraverso l'uso delle **parentesi tondone** `()`. R eseguirà tutte le operazioni incluse nelle parentesi seguendo lo stesso ordine  inndicato sopra. Utilizzando più gruppi di parentesi possiamo ottenere i risultati desiderati.

:::{.warning title="Le parentesi" data-latex="[Le parentesi]"}
Nota che in R solo le **parentesi tonde** `()` sono utilizzate per gestire l'ordine con cui sono eseguite le oprazioni.

**Parentesi quadre** `[]` e **parentesi graffe** `{}` sono invece speciali operatori utilizzati in R per altre ragioni come la selezione di elementi e la definizione di blocchi di codici. Argomenti che approfondiremo rispettivamente nel Capitolo \@ref(vector-selection) e Capitolo TODO. 
:::

### Esercizi{-}

Calcola il risultato delle seguenti operazioni utilizzando R ([soluzioni](https://github.com/psicostat/Introduction2R/blob/master/exercises/chapter-03-first-comands.R)):

1. $\frac{(45+21)^3+\frac{3}{4}}{\sqrt{32-\frac{12}{17}}}$

2. $\frac{\sqrt{7-\pi}}{3\ (45-34)}$

3. $\sqrt[3]{12-e^2}+\ln(10\pi)$

4. $\frac{\sin(\frac{3}{4}\pi)^2+\cos(\frac{3}{2}\pi)}{\log_7{e^{\frac{3}{2}}}}$

5. $\frac{\sum_{n=1}^{10} n}{10}$

Note per la risoluzione degli esercizi:

- In R la radice quadrata si ottine con la funzione `sqrt()` mentre per radici di indici diversi si utilizza la notazione esponenziale ($\sqrt[3]{x}$ è dato da `x^(1/3)`).
- Il valore di $\pi$ si ottiene con `pi`.
- Il valore di $e$ si ottiene con `exp(1)`.
- In R per i logaritmi si usa la funzione `log(x, base=a)`, di base viene  considerato il logaritmo naturale.


## Operatori Relazionali e Logici {#operators-rel-log}

Queste operazioni al momento potrebbero sembrare non particolrmente interessanti ma si riveleranno molto utili nei capitoli successivi ad esempio per la selezione di elementi (vedi Capitolo \@ref(vector-selection-advanced)) o la definizionne di algoritmi (vedi Capitolo TODO).

### Operatori Relazionali

In R è possibile valutare se una data relazione è vera o falsa. Ad esempio, posiamo valutare se "*2 è minore di 10*" o se "*4 numero è un numero pari*".

R valuterà le proposizioni e ci restituirà il valore `TRUE` se la proposizione è vera oppure `FALSE` se la proposizione è falsa. Nella Tabella \@ref(tab:relational-operators) sono elencati gli operatori relazionali.

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:relational-operators)Operatori Relazionali</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Funzione </th>
   <th style="text-align:left;"> Nome </th>
   <th style="text-align:left;"> Esempio </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> x == y </td>
   <td style="text-align:left;"> Uguale </td>
   <td style="text-align:left;"> &gt; 5 == 3 <br>[1] FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x != y </td>
   <td style="text-align:left;"> Diverso </td>
   <td style="text-align:left;"> &gt; 7 != 2 <br>[1] TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x &gt; y </td>
   <td style="text-align:left;"> Maggiore </td>
   <td style="text-align:left;"> &gt; 4 &gt; 3 <br>[1] TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x &gt;= y </td>
   <td style="text-align:left;"> Maggiore o uguale </td>
   <td style="text-align:left;"> &gt; -2 &gt;= 3 <br>[1] FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x &lt; y </td>
   <td style="text-align:left;"> Minore </td>
   <td style="text-align:left;"> &gt; 7 &lt; 5 <br>[1] FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x &lt;= y </td>
   <td style="text-align:left;"> Minore o uguale </td>
   <td style="text-align:left;"> &gt; 7 &lt;= 7 <br>[1] TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x %in% y </td>
   <td style="text-align:left;"> inclusione </td>
   <td style="text-align:left;"> &gt; 5 %in% c(3, 5, 8) <br>[1] TRUE </td>
  </tr>
</tbody>
</table>

:::{.warning title="'==' non è uguale a '='" data-latex="['==' non è uguale a '=']"}
Attenzione che per valutare l'uguaglianza tra due valori non bisogna utilizzare `=` ma `==`. Questo è un'errore molto comune ceh si commmette in continuazione.

L'operatore `=` è utilizzato in R per assegnare un valore ad una variablie. Argomento che vederemo nel Capitolo \@ref(assign).
:::

:::{.tip title="TRUE-T-1; FALSE-F-0" data-latex="[TRUE-T-1; FALSE-F-0]"}
Nota che in qualsiasi linguaggio di Programmazione, ai valori TRUE e FALSE sono associati rispettivament i valori numerici 1 e 0. Questi sono definiti [valori booleani](https://it.wikipedia.org/wiki/Variabile_booleana).


```r
TRUE == 1   # TRUE
TRUE == 2   # FALSE
TRUE == 0   # FALSE
FALSE == 0  # TRUE
FALSE == 1  # FALSE
```

In R è possibile anche abbreviare TRUE e FALSE rispettivamente in T e F, sebbene sia una pratica non consigliata poichè potrebbe nonn essere chiara e creare fraintendimenti. Infatti mentre TRUE e FALSE sono parole riservate (vedi Capitolo \@ref(objects-names)) T a F non lo sono.


```r
T == 1      # TRUE
T == TRUE   # TRUE
F == 0      # TRUE
F == FALSE  # TRUE
```

:::

### Operatori Logici

In R è possibile congiungere più relazioni per valutare una desiderata proposizione. Ad esempio potremmo valutare se "*17 è maggiore di 10 e minore di 20*". Per unire più relazioni in un'unica proposizione che R valuterà come `TRUE` o `FALSE`, vengono utilizati gli operatori logici riportati in Tabella \@ref(tab:logical-operators).

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:logical-operators)Operatori Logici</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Funzione </th>
   <th style="text-align:left;"> Nome </th>
   <th style="text-align:left;"> Esempio </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> !x </td>
   <td style="text-align:left;"> Negazione </td>
   <td style="text-align:left;"> &gt; !TRUE <br>[1] FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x &amp; y </td>
   <td style="text-align:left;"> Congiunzione </td>
   <td style="text-align:left;"> &gt; TRUE &amp; FALSE <br>[1] FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x | y </td>
   <td style="text-align:left;"> Disgiunzione Inclusiva </td>
   <td style="text-align:left;"> &gt; TRUE | FALSE <br>[1] TRUE </td>
  </tr>
</tbody>
</table>

Questi operatori sono anche definiti [operatori booleani](https://it.wikipedia.org/wiki/Espressione_booleana) e seguono le comuni definizioni degli operatori logici. In particolare abbiamo che:

- Nel caso della **congiunzione logica** `&`, affinchè la proposizione sia vera è necessario che entrambe le relazioni siano vere. Negli altri casi la proposizione sarà valutarta falsa (vedi Tabella \@ref(tab:and-operator)).

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:and-operator)Congiunzione '&amp;'</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> x </th>
   <th style="text-align:left;"> y </th>
   <th style="text-align:left;"> x &amp; y </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;width: 100px; "> TRUE </td>
   <td style="text-align:left;width: 100px; "> TRUE </td>
   <td style="text-align:left;width: 100px; "> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;width: 100px; "> TRUE </td>
   <td style="text-align:left;width: 100px; "> FALSE </td>
   <td style="text-align:left;width: 100px; "> FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;width: 100px; "> FALSE </td>
   <td style="text-align:left;width: 100px; "> TRUE </td>
   <td style="text-align:left;width: 100px; "> FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;width: 100px; "> FALSE </td>
   <td style="text-align:left;width: 100px; "> FALSE </td>
   <td style="text-align:left;width: 100px; "> FALSE </td>
  </tr>
</tbody>
</table>

- Nel caso della **disgiunzione inclusiva logica** `|`, affinchè la proposizione sia vera è necessario che almeno una relaziona sia vera. La proposizione sarà valutarta falsa solo quando entrambe le relazioni sono false (vedi Tabella \@ref(tab:or-operator)).

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:or-operator)Disgiunzione inclusiva '|'</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> x </th>
   <th style="text-align:left;"> y </th>
   <th style="text-align:left;"> x | y </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;width: 100px; "> TRUE </td>
   <td style="text-align:left;width: 100px; "> TRUE </td>
   <td style="text-align:left;width: 100px; "> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;width: 100px; "> TRUE </td>
   <td style="text-align:left;width: 100px; "> FALSE </td>
   <td style="text-align:left;width: 100px; "> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;width: 100px; "> FALSE </td>
   <td style="text-align:left;width: 100px; "> TRUE </td>
   <td style="text-align:left;width: 100px; "> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;width: 100px; "> FALSE </td>
   <td style="text-align:left;width: 100px; "> FALSE </td>
   <td style="text-align:left;width: 100px; "> FALSE </td>
  </tr>
</tbody>
</table>

:::{.design title="Disgiunzione esclusiva" data-latex="[Disgiunzione esclusiva]"}

Per completezza ricordiamo che tra gli operatori logici esiste anche la **disgiunzione esclusiva**. La proposizione sarà valutata falsa se entrambe le relazioni sono vere oppure false. Affinchè la proposizione sia valutata vera una sola delle relazioni deve essere vera mentre l'altra deve essere falsa.

In R la disgiunzione esclusiva tra due ralazioni (x e y) è indicata con la funzione `xor(x, y)`. Tuttavia tale funzione è raramente usata.

<div style="width:360px;  margin-left: auto; margin-right: auto;">
Table: Disgiunzione esclusiva 'xor(x, y)'

|   x   |   y   | xor(x, y) |
|:-------|:-------|:-----------|
| TRUE  | TRUE  | FALSE     |
| TRUE  | FALSE | TRUE      |
| FALSE | TRUE  | TRUE      |
| FALSE | FALSE | FALSE     |
</div>
:::

### Ordine valutazione relazioni

Nel valutare le veridicità delle proposizioni R esegue le operazioni nel seguente ordine:

1. operatori matematici (e.g., `^`, `*`, `/`, `+`, `-`, etc.)
2. operatori relazionali (e.g., `<`, `>`, `<=`, `>=`, `==`, `!=`)
3. operatori logici (e.g., `!`, `&`, `|`)

La lista completa dell'ordine di esecuzione delle operazioni è riportata al seguente link [https://stat.ethz.ch/R-manual/R-devel/library/base/html/Syntax.html](https://stat.ethz.ch/R-manual/R-devel/library/base/html/Syntax.html). Ricordiamo che, in caso di dubbi riguardanti l'ordine di esecuzione delle operazioni, la cosa migliore è utilizzare le parentesi tonde `()` per disambiguare ogni possibile fraintendimento. 

:::{.warning title="L'operatore '%in%'" data-latex="[L'operatore '\\%in\\%']"}
Nota che l'operatore `%in%` che abbiamo precedentemente indicato tra gli operatori relazionali in realtà è un operatore speciale. In particolare, non segue le stesse regole degli altri operatori relazionlali per quanto riguarda l'ordine di esecuzione.

La soluzione migliore? Usa le parentesi!
:::

### Esercizi {-}

Esegui i seguenti esercizi utilizzando gli operatori relazionali e logici ([soluzioni](https://github.com/psicostat/Introduction2R/blob/master/exercises/chapter-03-first-comands.R)):

1. Definisici due relazioni false e due vere che ti permettano di valutare i risultati di tutti i possibili incroci che puoi ottenere con gli operatori logici `&` e `|`.
2. Definisci una proposizione che ti permetta di valutare se un numero è pari. Definisci un'altra proposizione per i nueri dispari (tip: cosa ti ricorda `%%`?).
3. Definisci una proposizione per valutare la seguente condizione (ricordati di testare tutti i possibili scenari) "*x è un numero compreso tra -4 e -2 oppure è un numero compreso tra 2 e 4*".
4. Esegui le seguenti operazioni `4 ^ 3 %in% c(2,3,4)` e `4 * 3 %in% c(2,3,4)`. Cosa osservi nell'ordine di esecuzione degli operatori?
