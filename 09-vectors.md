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

## Creazione

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

Famigliarizza con la creazione di vettori ([soluzioni](https://github.com/psicostat/Introduction2R/blob/master/exercises/chapter-07.R)):

1. Crea il vettore `x` contenente i numeri 4, 6, 12, 34, 8
2. Crea il vettore `y` contenente tutti i numeri pari compresi tra 1 e 25 (`?seq()`)
3. Crea il vettore `z` contenente tutti i primi 10 multipli di 7 partendo da 13 (`?seq()`)
4. Crea il vettore `s` in cui le lettere `"A"`,`"B"` e `"C"` vengono ripetute nel medesimo ordine 4 volte (`?rep()`)
5. Crea il vettore `t` in cui le letter `"A"`,`"B"` e `"C"` vengono ripetute ognuna 4 volte (`?rep()`)
6. Genera il seguente output in modo pigro, ovvero scrivendo meno codice possibile ;)

```
## [1] "foo" "foo" "bar" "bar" "foo" "foo" "bar" "bar"
```


## Selezione Elementi

Una volta creato un vettore potrebbe essere necessario selezionare uno o più dei suoi elementi. In R per selezionare gli elementi di un vettore si utilizzano le **parentesi quadre** `[]` dopo il nome del vettore, indicando al loro interno **l'indice di posizione** degli elementi desiderati:


```r
nome_vettore[<indice-posizione>]
```

Attenzione, non devo quindi indicare il valore dell'elemento desiderato ma il suo indice di posizione. Ad esempio: 


```r
# dato il vettore
my_numbers <- c(2,4,6,8)

# per selezionare il valore 4 utilizzo il suo indice di posizione ovvero 2
my_numbers[2]
## [1] 4

# Se utilizzassi il suo valore (ovvero 4) 
# otterrei l'elemento che occupa la 4° posizione
my_numbers[4]
## [1] 8
```

Per selezionare più elementi è necessario indicare tra le parentesi quadre tutti gli indici di posizione degli elementi desiderati. Nota come non sia possibile fornire semplicemente i singoli indici numerici ma questi devono essere raccolti in un vettore, ad esempio usando la funzione `c()`. Praticamente usiamo un vetore di indici per selezionare gli elemeni desiderati dal nostro vettore iniziale.


```r
# ERRATA selezione più valori 
my_numbers[1,2,3]
## Error in my_numbers[1, 2, 3]: incorrect number of dimensions

# CORRETTA selezione più valori
my_numbers[c(1,2,3)]
## [1] 2 4 6
my_numbers[1:3]
## [1] 2 4 6
```

:::{.tip title="Selezionare non è Modificare" data-latex="[Selezionare non è Modificare]"}
Nota come l'operazione di selezione non modifichi l'oggetto iniziale. Pertanto è necessario salvare il risultato della selezione se si desidera mantenere le modifiche.


```r
my_words <- c("foo", "bar", "baz", "qux")

# Seleziono i primi 2 elementi
my_words[1:2]
## [1] "foo" "bar"

# Ho ancora tutti gli elementi nell'oggetto my_words
my_words
## [1] "foo" "bar" "baz" "qux"

# Salvo i risultati
my_words <- my_words[1:2]
my_words
## [1] "foo" "bar"
```

:::

:::{.warning title="Casi Estremi nella Selezione" data-latex="[Casi Estremi nella Selezione]"}
Cosa accade se utiliziamo un indice di posizione maggiore del numero di elementi del nostro vettore?

```r
# Il mio vettore
my_numbers <- c(2,4,6,8)

my_numbers[10]
## [1] NA
```
R non restituisce un errore ma il valore `NA` ovvero *Not Available*, per indicare che nessun valore è disponibile.

Osserviamo infine anche altri comportamenti particolari o possibili errori nella selezione di elementi. 

- L'indice di posizione deve essere un valore numerico e non un carattere.

```r
# ERRATA selezione più valori 
my_numbers["3"]
## [1] NA

# CORRETTA selezione più valori
my_numbers[3]
## [1] 6
```
- I numeri decimali vengono ignorati e non "arrotondati"

```r
my_numbers[2.2]
## [1] 4
my_numbers[2.8]
## [1] 4
```
- Utilizzando il valore 0 ottengo un vettore vuoto

```r
my_numbers[0]
## numeric(0)
```
:::

### Utilizzi Avanzati Selezione

Vediamo ora alcuni utilizzi avanzati della selezione di elementi di un vettore. In particolare impareremo a:

- utilizzare gli operatori relazionali e logici per selezionare gli elementi di un vettore
- modificare l'ordine degli elemennti
- creare nuove combinazioni
- sostituire degli elementi
- eliminare degli elementi

#### Operatori Relazionali e Logici {-}

Un'utile funzione è quella di selezionare tra gli elementi di un vetore quelli che rispetano una certa condizione. Per fare questo dobbiamo specificare all'interno delle parentesi quadre la proposizione di interesse utilizzando gli operatori relazionali e logici (vedi Capitolo \@ref(operators-rel-log)). 

Possiamo ad esempio selezionare da un vettore numerico tutti gli elementi maggiori di un certo valore, oppure selezionare da un vettore di caratteri tutti gli elementi uguali ad una data stringa.

```r
# Vettore numerico - seleziono elemeni maggiori di 0
my_numbers <- -5:5
my_numbers[my_numbers >= 0]
## [1] 0 1 2 3 4 5

# Vettore caratteri - seleziono elemeni uguali a "bar"
my_words <- rep(c("foo", "bar"), times = 4)
my_words[my_words == "bar"]
## [1] "bar" "bar" "bar" "bar"
```

Per capire meglio questa operazione è importante notare come nello stesso comando ci siano in realtà due passaggi distinti:

- **Vettore logico** (vedi Capitolo TODO) - quando un vettore è valutato in una proposizione, R restituisce un nuovo vettore che contiene per ogni elemento del vettore iniziale la risposta (`TRUE` o `FALSE`) alla nostra proposizione.
- **Selezione** - utilizziamo il vettore logico ottenuto per selezionare gli elementi dal vettore iniziale. Gli elementi associati al valore `TRUE` sono selezionati mentre quelli associati al valore `FALSE` sono scartati.

Rendiamo espliciti questi due passaggi nel seguente codice: 

```r
# Vettore logico
condition <- my_words == "bar"
condition
## [1] FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE

# Selezione
my_words[condition]
## [1] "bar" "bar" "bar" "bar"
```

#### Ordinare gli Elementi {-}

Gli indici di posizione possono essere utilizzati per ordinare gli elementi di un vettore a seconda delle necessità.


```r
messy_vector <- c(5,1,7,3)

# Altero l'ordine degli elementi
messy_vector[c(4,2,3,1)]
## [1] 3 1 7 5

# Ordino gli elementi per valori crescenti
messy_vector[c(2,4,1,3)]
## [1] 1 3 5 7
```

:::{.trick title="sort() vs order()" data-latex="[sort() vs order()]"}
Per ordinare gli elementi di un vettore in ordine crescente o decrescente (sia alfabetico che numerico), è possibile utilizzare la funzione `sort()` specificando l'argomento `decreasing`. Vedi l'help page della funzione per ulteriori informazioni (`?sort()`).


```r
# Ordine alfabetico
my_letters <- c("cb", "bc", "ab", "ba", "cb", "ab")
sort(my_letters)
## [1] "ab" "ab" "ba" "bc" "cb" "cb"

# ordine decrescente
sort(messy_vector, decreasing = TRUE)
## [1] 7 5 3 1
```

Nota come esista anche la funzione `order()` ma questa sia un false-friend perchè non ci fornisce direttamente un vettore con gli elementi ordinati ma bensì gli indici di posizione per riordinare gli elementi (`?order()`). Vediamo nel seguente esempio come utilizzare questa funzione:

```r
# Indici di posizione per riordinare gli elementi
order(messy_vector)
## [1] 2 4 1 3
# Riordino il vettore usando gli indici di posizione
messy_vector[order(messy_vector)]
## [1] 1 3 5 7
```
:::

#### Combinazioni di Elementi {-}

Gli stessi indici di posizione possono essere richiamati più volte per ripetere gli elementi nelle combinazioni desiderate formando un nuovo vettore.

```r
my_numbers <- c(5,6,7,8)
# Ottengo un nuovo vettore con la combinazioen desiderata
my_numbers[c(1,2,2,3,3,3,4)]
## [1] 5 6 6 7 7 7 8
```

#### Modificare gli Elementi {-}

Un importante utilizzo degli indici riguarda la modifica di un elemento di un vettore. Per sostituire un vecchio valore con un nuovo valore, posso utilizzare la funzione *assign* (`<-` o `=`) come nell'esempio:


```r
my_names <- c("Andrea", "Bianca", "Carlo")

# Modifico il  nome "Bianca" in "Beatrice"
my_names[2] <- "Beatrice"
my_names
## [1] "Andrea"   "Beatrice" "Carlo"
```

Per sostituire il valore viene indicato alla sinistra dell'operatore *assign* il valore che si vuole modificare e  alla destra il nuovo valore. Nota come questa operazione possa essere usata per aggiungere anche nuovi elementi al vettore.


```r
my_names[4]
## [1] NA

# Aggiungo il nome "Daniela"
my_names[4] <- "Daniela"
my_names
## [1] "Andrea"   "Beatrice" "Carlo"    "Daniela"
```


#### Eliminare gli Elementi {-}

Per **eliminare degli elementi** da un vettore, si indicano all'interno delle parentesi quadre gli indici di posizione degli elementi da eliminare preceduti dall'operatore `-` (*meno*). Nel caso di più elementi è anche possibile indicare il meno solo prima del comando `c()`, ad esempio il comando `x[c(-2,-4)]` diviene `x[-c(2,4)]`.


```r
my_words <- c("foo", "bar", "baz", "qux")

# Elimino "bar"
my_words[-2]
## [1] "foo" "baz" "qux"

# Elimino "foo" e "baz"
my_words[-c(1,3)]    # oppure my_words[c(-1, -3)]
## [1] "bar" "qux"
```

Nota come l'operazione di eliminazione sia comunque un'operazione di selezione. Pertanto è necessario salvare il risultato ottenuto se si desidera mantenere le modifiche.


```r
# Elimino "foo" e "baz"
my_words[-c(1,3)]
## [1] "bar" "qux"

# Ho ancora tutti gli elementi nell'oggetto my_words
my_words
## [1] "foo" "bar" "baz" "qux"

# Salvo i risultati
my_words <- my_words[-c(1,3)]
my_words
## [1] "bar" "qux"
```

<!-- %  TODO funzione ?which() -->


### Esercizi {-}

1. Del vettore `x` seleziona il 2°, 3° e 5° elemento
2. Del vettore `x` seleziona i valori 34 e 4
3. Dato il vettore `my_vector = c(2,4,6,8)` commenta il risultato del comando `my_vector[my_vector]`
4. Del vettore `y` seleziona tutti i valori minori di 13 o maggiori di 19
5. Del vettore `z` seleziona tutti i valori compresi tra 24 e 50
6. Del vettore `s` seleziona tutti gli elementi uguali ad  `"A"`
7. Del vettore `t` seleziona tutti gli elementi diversi da  `"B"`
8. Crea un nuovo vettore `u` identico a `s` ma dove le `"A"` sono sostituite con la lettera `"U"`
9. Elimina dal vettore `z` i valori 28 e 42


## Funzioni ed Operazioni

Vediamo ora alcune utili funzioni e comuni operazioni che è possibile svolgere con i vettori (vedi Tabella \@ref(tab:table-vector-operators)).

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:table-vector-operators)Operazioni con vettori</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Funzione </th>
   <th style="text-align:left;"> Descrizione </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> nuovo_vettore &lt;- c(vettore1, vettore2) </td>
   <td style="text-align:left;"> Unire più vettori in un unico vettore </td>
  </tr>
  <tr>
   <td style="text-align:left;"> length(nome_vettore) </td>
   <td style="text-align:left;"> Valutare il numero di elementi contenuti in un vettore </td>
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

Nota che l'esecuzione di operazioni matematiche (e.g., `+`, `-`, `*`, `/` etc.) è possibile sia rispetto ad un singolo valore sia rispetto ad un altro vettore:

- **Singolo valore** - l'operazione sarà svolta per ogni elemento del vettore rispetto al singolo valore fornito. 
- **Altro vettore** - l'operazione sarà svolta per ogni coppia di elementi dei due vettori. E' quindi necessario che i due vettori abbiano la **stessa lunghezza**, ovvero lo stesso numero di elementi.


```r
x <- 1:5
y <- 1:5

# Sommo un valore singolo
x + 10
## [1] 11 12 13 14 15

# Somma di vettori (elemento per elemento)
x + y
## [1]  2  4  6  8 10
```

:::{.warning title="Vettori di Diversa Lunghezza" data-latex="[Vettori di Diversa Lunghezza]"}
Qualora i vettori differiscano per la loro lunghezza, R ci presenterà un warning avvisandoci del problema ma eseguirà comunque l'operazione utilizzando più volte il vettore più corto.

```r
x + c(1, 2)
## Warning in x + c(1, 2): longer object length is not a multiple of shorter object
## length
## [1] 2 4 4 6 6
```

Tuttavia, compiere operazioni tra vettori di diversa lunghezza (anche multipli) dovrebbe essere evitato perchè facile causa di errori e incomprensioni. 
:::

:::{.design title="Vectorized Operations" data-latex="[Vectorized Operations]"}
In R la maggior parte degli operatori sono *vettorizzati*, ovvero calcolano direttamente il risultato per ogni elemento di un vettore. Questo è un grandissimo vantaggio poichè ci permette di essere molto efficienti e coincisi nel codice.

Senza vettorizzazione, ogni operazione tra due vettori richiederebbe di specificare l'operazione per ogni elemento del vettore. Nel precedente esempio della somma tra `x` e `y` avremmo dovuto usare il seguente codice:

```r
z <- numeric(length(x))
for(i in seq_along(x)) {
      z[i] <- x[i] + y[i]
}
z
## [1]  2  4  6  8 10
```

Nota come questo sia valido anche per gli **operatori relazionali e logici**. Infatti valutando una proposizione rispetto ad un vettore, otterremmo una risposta per ogni elemento del vettore


```r
my_values <- 1:8

# Valori compresi tra 4 e 7
my_values >= 4 & my_values <= 7
## [1] FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE
```
:::

### Esercizi {-}

1. Crea il vettore `j` unendo i vettori `x` ed `z`.
2. Elimina gli ultimi tre elementi del vettore `j` e controlla che i vettori `j` e `y` abbiano la stessa lunghezza.
3. Calcola la somma tra i vettori `j` e `y`.
4. Moltiplica il vettore z per una costante `k=3`.
5. Calcola il prodotto tra i primi 10 elementi del vettore `y` ed il vettore `z`.

## Data Type {#data-type}

Working in progress.

Abbimao visto chè un'importante condizione dei vettori è che tutti gli elementi siano dello stesso tipo. Abbiamogià incontrato e osservato la differenza tra valori numerici e caratteri ma approfondiamo i diversi tipi e i relativi vatttori, relazioni tra tipologie di dati

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


is. vecor
### Valori speciali






