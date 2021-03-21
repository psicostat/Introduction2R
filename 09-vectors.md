# Vettori {#vector}




I vettori sono la struttura dati più semplice tra quelle presenti in R. Un vettore non è altro che un insieme di elementi disposti in uno specifico ordine e possiamo quindi immaginarlo in modo simile a quanto rappresentato in Figura \@ref(fig:vector). 

<div class="figure" style="text-align: center">
<img src="images/vector.png" alt="Rappresentazione struttura di un vettore di lunghezza *n*" width="65%" />
<p class="caption">(\#fig:vector)Rappresentazione struttura di un vettore di lunghezza *n*</p>
</div>

Due caratteristiche importanti di un vettore sono:

- la **lunghezza** - il numero di elementi da cui è formato il vettore
- la **tipologia** - la tipologia di dati da cui è formato il vettore. Un vettore infatti deve esssere formato da **elementi dello stesso tipo** e pertanto esistono diversi vettori a seconda della tipologia di dati da cui è formato (valori numerici, valori interi, valori logici, valori carattere).  


E' fondamentale inoltre sottolineare come ogni **elemento** di un vettore sia caratterizzato da:

- un **valore** - ovvero il valore dell'elemento che può essere di qualsiasi tipo ad esempio un numero o una serie di caratteri.
- un **indice di posizione** - ovvero un numero intero positivo che identifica la sua posizione all'interno del vettore.

Notiamo quindi come i vettori $x$ e $y$ così definiti:
$$
x = [1, 3, 5];\ \ \ y = [3, 1, 5],
$$
sebbene includano gli stessi elementi, non sono identici poichè differiscono per la loro disposizione. Tutto questo ci serve solo per ribadire come l'ordine degli elementi sia fondamentale per la valutazione di un vettore.


Vedimao ora come creare dei vettori in R e come compiere le comuni operazini di selezione e manipolazione di vettori. Successivamente approfondiremo le caratteristiche dei vettori valutandone le diverse tipologie.

## Creazione di Vettori

In realtà abbiamo già incontrato dei vettori nei precedenti capitoli poichè anche le variabili con un singolo valore altro non sono che un vettore di lunghezza 1. Tuttavia, per creare dei vettori di più elementi dobbiamo utilizzare il comando `c()`, ovvero *"combine"*, indicando tra le parentesi i valori degli elementi nella sucessione desiderata e separati da una virgola. Avremo quindi la seguente sintassi:


```r
nome_vettore <- c(x_1, x_2, x_3, ..., x_n)
```

Nota come gli elementi di un vettore debbano essere tutti della stessa tipologia ad esempio vaolri numerici o valori carattere.

:::{.design title="Sequenze - ':', seq() e rep() " data-latex="[Sequenze - ':', seq() e rep() ]"}
In altrentativa è possibile utilizzare qualsiasi funzione che restituisca come output una sequenza di valori sotto forma di vettore. Tra le funzioni più usate per creare delle sequenze abbiammo:

- `<from>:<to>` - Genera una sequenza di valori numerici crescenti (o decrescenti) dal primo valore indicato (`<from>`) al secondo valore indicato (`<to>`) a step di 1 (o -1 ).

```r
# sequenza crescente
1:5
## [1] 1 2 3 4 5

# sequenza decrescente
2:-2
## [1]  2  1  0 -1 -2

# sequenza con valori decimali
5.3:10
## [1] 5.3 6.3 7.3 8.3 9.3
```

- `seq(from = , to = , by = , length.out = )` - Genera una sequenza regolare di valori numerici compresi tra `from` e `to` con incrementi indicati da `by`, oppure di lunghezza conplessiva indicata da `length.out` (vedi `?seq()` per maggiori dettagli).

```r
# sequenza a incrementi di 2
seq(from = 0, to = 10, by = 2)
## [1]  0  2  4  6  8 10

# sequenza di 5 elementi
seq(from = 0, to = 1, length.out = 5)
## [1] 0.00 0.25 0.50 0.75 1.00
```

- `rep(x, times = , each = )` - Genera una sequenza di valori ripetendo i valori contenuti in `x`. I valori di `x` posssono essere ripetuti nello stesso ordine più volte specificando `times` oppure ripetuti ciascuno più volte specificando `each` (vedi `?rep()` per maggiori dettagli).

```r
# sequenza a incrementi di 2
rep(c("foo", "bar"), times = 3)
## [1] "foo" "bar" "foo" "bar" "foo" "bar"

# sequenza di 5 elementi
rep(1:3, each = 2)
## [1] 1 1 2 2 3 3
```
:::

### Esercizi {-}

1. Crea il vettore `x` contenente i numeri 4, 6, 12, 34, 8
2. Crea il vettore `y` contenente tutti i numeri pari compresi tra 1 e 25 (`?seq()`)
3. Crea il vettore `z` contenente tutti i primi 10 multipli di 7 partendo da 13 (`?seq()`)
4. Crea il vettore `s` in cui le lettere `"A"`,`"B"` e `"C"` vengono ripetute nel medesimo ordine 4 volte (`?rep()`).
5. Crea il vettore `t` in cui le letter `"A"`,`"B"` e `"C"` vengono ripetute ognuna 4 volte (`?rep()`).
6. Genera il seguente output in modo pigro, ovvero scrivendo meno codice possibile ;)

```
## [1] "foo" "foo" "bar" "bar" "foo" "foo" "bar" "bar"
```


## Selezione Elementi di un Vettore

**Working in Progress**

In R per selezioneare gli elementi di un vettore si deve indicare all'interno delle parentesi quadre la **posizione degli elementi** da selezionare, non il valore dell'elemento stesso:

`<nome-vettore>[<indice-posizione>]`\\
<!-- % esempio selezione con valori e non indici porta errore -->
<!-- % specificare selezione c() oppure senza c() che da errore dimensioni -->
In alternativa si puù definire la condizione logica che gli elementi che si vogliono selezionare devono rispettare.

Per *\textbf{**eliminare degli elementi** da un vettore si utilizza all'interno delle parentesi quadre l'operatore “-” insieme agli indici di posizione degli elementi da eliminare (esempio: `x[c(-2,-4)]` oppure `x[-c(2,4)]`).

<!-- % Maggiore descrizione eliminare -->
<!-- % funzione ?which() -->


### Esercizi {-}

1. Del vettore `x` seleziona il 2°, 3° e 5° elemento
2. Del vettore `y` seleziona tutti i valori minori di 13 o maggiori di 19
3. Del vettore `z` seleziona tutti i valori compresi tra 24 e 50
4. Elimina dal vettore `z` i valori 28 e 42
5. Del vettore `s` seleziona tutti gli elementi uguali ad  “A”
6. Del vettore `t` seleziona tutti gli elementi diversi da  “B”.

## Funzioni ed Operazioni tra Vettori

Per compiere operazioni tra vettori è necessario che essi abbiano identica lunghezza.

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:table-vector-operators)Operazioni con vettori</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Operazione </th>
   <th style="text-align:left;"> Nome </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> &lt;nuovo-vettore&gt; &lt;- c(&lt;vettore1&gt;, &lt;vettore2&gt;) </td>
   <td style="text-align:left;"> Per unire più vettori in un unico vettore </td>
  </tr>
  <tr>
   <td style="text-align:left;"> length(&lt;nome-vettore&gt;) </td>
   <td style="text-align:left;"> Per valutare il numero di elementi contenuti in un vettore </td>
  </tr>
  <tr>
   <td style="text-align:left;"> vettore1 + vettore2 </td>
   <td style="text-align:left;"> Somma di due vettori </td>
  </tr>
  <tr>
   <td style="text-align:left;"> vettore1 - vettore2 </td>
   <td style="text-align:left;"> Differenza tra due vettori </td>
  </tr>
  <tr>
   <td style="text-align:left;"> vettore1 * vettore2 </td>
   <td style="text-align:left;"> Prodotto tra due vettori </td>
  </tr>
  <tr>
   <td style="text-align:left;"> vettore1 / vettore2 </td>
   <td style="text-align:left;"> Rapporto tra due vettori </td>
  </tr>
</tbody>
</table>


**Nota:** In R il prodotto e rapporto tra vettori sono eseguiti  elemento per elemento (al contrario di molti altri software).

### Esercizi {-}

1. Crea il vettore `j` unendo i vettori `x` ed `z`.
2. Elimina gli ultimi tre elementi del vettore `j` e controlla che i vettori `j` e `y` abbiano la stessa lunghezza.
3. Calcola la somma tra i vettori `j` e `y`.
4. Moltiplica il vettore z per una costante `k=3`.
5. Calcola il prodotto tra i primi 10 elementi del vettore `y` ed il vettore `z`.

## Data Type {#data-type}

Working in progress.

Tipi di vettori

In R ci sono 4 tipi differenti di vettori: numerici, logici, caratteri e fattori.

### Vettori Numerici

I vettori numerici sono utilizzati per compiere operazioni aritmetiche, in R sono indicati come `num`. In R ci sono è possibil e specificare se i numeri contenuti nel vettore sono numeri interi, avremmo quindi un vettore di valori interi (indicato in R come `int`). Per fare ciò è possibile aggiungere `L` ad ogni valore numerico nel definire il vettore oppure usare la funzione `as.integer()` per trasformare un vettore numerico in un vettore intero.

**Esempio:**


```r
x <- c(4L, 6L, 12L, 34L, 8L)

x <- as.integer(c(4, 6, 12, 34, 8))
```

**Nota**: per trasformare un vettore intero in un vettore numerico è possibile usare la funzione `as.numeric()`.

### Vettori logici

I vettori logici sono formati dai volori `TRUE` e `FALSE`, che possono essere  abbreviati rispettivamente in `T` e `F`. In R i vettori logici sono indicati come `logi`. In genere, i vettori logici sono il risultato delle operazioni in cui viene chiesto ad R di valutare la condizione logica di una proposizione.

```r
x>10
## [1] FALSE FALSE  TRUE  TRUE FALSE
```

**Nota:** in R, come in molti altri software di programmazione, `TRUE` assume il valore numerico `1` e `FALSE` assume il valore `0`. 

```r
sum(x>10)
## [1] 2
```
E' possibile trasformare un vettore numerico in un vettor logico attraverso la funzione `as.logical()`, gli `0` assumeranno il valore `FALSE` mentre qualsiasi altro numero assumerà il valore `TRUE`.

```r
as.logical(c(1,0,.034,-1,0,8))
## [1]  TRUE FALSE  TRUE  TRUE FALSE  TRUE
```

### Vettori di caratteri

I vettori di caratteri contengono stringhe di caratteri e sono indicati in R con `chr}. Non è possibile eseguire operazioni aritmetiche con vettori di caratteri ma solo valutare se due stringhe sono uguali o differenti.


```r
j<-c("Hello","World","hello","world")
j=="hello"
## [1] FALSE FALSE  TRUE FALSE
```
Per trasformare un vettore qualsiasi in una vettore di caratteri e possibile usare la funzione `as.character()`.

```r
as.character(x)
## [1] "4"  "6"  "12" "34" "8"
as.character(x>10)
## [1] "FALSE" "FALSE" "TRUE"  "TRUE"  "FALSE"
```

### Valori speciali






