# Vettori {#vector}




I vettori sono la struttura dati più semplice tra quelle presenti in R. Un vettore non è altro che un insieme di elementi disposti in uno specifico ordine e possiamo quindi immaginarlo in modo simile a quanto rappresentato in Figura \@ref(fig:vector). 

<div class="figure" style="text-align: center">
<img src="images/vector.png" alt="Rappresentazione della struttura di un vettore di lunghezza *n*" width="65%" />
<p class="caption">(\#fig:vector)Rappresentazione della struttura di un vettore di lunghezza *n*</p>
</div>

Due caratteristiche importanti di un vettore sono:

- la **lunghezza** - il numero di elementi da cui è formato il vettore
- la **tipologia** - la tipologia di dati da cui è formato il vettore. Un vettore infatti deve esssere formato da **elementi tutti dello stesso tipo** e pertanto esistono diversi vettori a seconda della tipologia di dati da cui è formato (valori numerici, valori interi, valori logici, valori carattere).  


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

Nota come gli elementi di un vettore debbano essere tutti della stessa tipologia ad esempio valori numerici o valori carattere.

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
- modificare l'ordine degli elementi
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
<caption>(\#tab:table-vector-operators)Funzioni e  operazioni con vettori</caption>
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

Tuttavia, compiere operazioni tra vettori di diversa lunghezza (anche se multipli) dovrebbe essere evitato perchè facile causa di errori ed incomprensioni. 
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

Abbiamo visto come sia necessario che in un vettore tutti gli elementi siano della stessa tipologia. Avremmo quindi diversi tipi di vettori a seconda della tiopologia di dati che contengono.

In R abbiamo 4 principali tipologie di dati, ovvero tipologie di valori che possono essere utilizzati:

- `character` - *Stringhe di caratteri* i cui valori alfannumerici vengono delimitati dalle doppie vigolette `"Hello world!"` o virgolette singole `'Hello world!'`.
- `double` - *Valori reali* con o senza cifre decimali ad esempio `27` o `93.46`.
- `integer` - *Valori interi* definiti apponendo la lettera `L` al numero desiderato, ad esempio `58L`.
- `logical` - *Valori logici* `TRUE` e `FALSE` usati nelle operazioni logiche.

Possiamo verificare la tipologia di un valore utlizzando la funzione `typeof()`.

```r
typeof("foo") 
## [1] "character"

typeof(2021)
## [1] "double"

typeof(2021L) # nota la lettera L
## [1] "integer"

typeof(TRUE)
## [1] "logical"
```

Esistono molte altre tipologie di dati tra cui `complex` (per rappresentare i numeri complessi del tipo $x + yi$) e `Raw` (usati per rappresenttare i valori come bytes) che però riguardano usi poco comuni o comunque molto avanzati di R e pertanto non verranno trattati.

:::{.design title="Tutta una Questione di Bit" data-latex="[Tutta una Questione di Bit]"}
Questa distinzione tra le varie tipologie di dati deriva dalla modalità con cui il computer rappresenta internamente i diversi valori. Sappiamo infatti che il computer non possiede caratteri ma solamente bits, ovvero successioni di 0 e 1 ad esempio 01000011. 

Senza scendere nel dettaglio, per ottimizzare l'uso della memoria i diversi valori vengono *"mappati"* utilizzando i bits in modo differente a seconda delle tipologie di dati. Pertanto in R il valore `24` sarà rappresentato diversamente a seconda che sia definitio come una stringa di caratteri (`"24"`), un numero intero (`24L`) o un numero double (`24`).

#### Integer vs Double {-}

In particolare un aspetto poco intuitivo riguarda la differenza tra valori `double` e `integer`. Mentre i valori interi possono essere rappresentati con precisione dal computer, non tutti i valori reali posssono essere rappresentati esattamente utilizzando il numero massimo di 64 bit. In questi casi i loro valori vengonno quindi approsimati e, sebbene questo venga fatto con molta precisione, a volte potrebbe portare a dei risultati inaspettati. Nota infatti come nell'esempio seguente non otteniamo zero, ma osserviamo un piccolo errore dovuto all'approsimazione dei valori `double`.

```r
my_value <- sqrt(2)^2 # dovrei ottenere 2
my_value - 2          # dovrei ottenre 0
## [1] 4.440892e-16
```

E' importante tenere a mente questo problema nei test di ugualianza dove l'utilizzo dell'operatore `==` potrebbe generare delle risposte inaspettate. In genere viene quindi preferita la funzione `all.equal()` che prevede un certo margine di tolleranza (vedi `?all.equal()` per ulteriori dettagli).

```r
my_value == 2          # Problema di approsimazione 
## [1] FALSE
all.equal(my_value, 2) # Test con tolleranza
## [1] TRUE
```

Ricorda infine che i computer hanno un limite rispetto al massimo valore e minimo valore che possono rappresentare sia per quanto riguarda i valori interi che i valori reali. Per approfondire vedi <https://stat.ethz.ch/pipermail/r-help/2012-January/300250.html>.
:::

Vediamo ora i diversi tipi di vettori a seconda della tipologia di dati utilizzati.

### Character

I vettori formati da stringhe di caratteri sono definiti vettori di caratteri. Per valutare la tipologia di un oggetto possiamo utilizzare la  funzione `class()`, mentre ricordiamo che la funzionne `typeof()` valuta la tipologia di dati. In questo caso otteniamo per entrambi il valore `character`. 


```r
my_words<-c("Foo","Bar","foo","bar")

class(my_words) # tipologia oggetto
## [1] "character"

typeof(my_words) # tipologia dati
## [1] "character"
```

Non è possibile eseguire operazioni aritmetiche con vettori di caratteri ma solo valutare relazioni di uguaglianza o disuguaglianza ripetto ad un'altra stringa.


```r
my_words + "foo"
## Error in my_words + "foo": non-numeric argument to binary operator

my_words == "foo"
## [1] FALSE FALSE  TRUE FALSE
```

### Numeric

In R, se non altrimenti specificato, ogni valore numerico viene rappresentato come un `double` indipendentemente che abbia o meno valori decimali. I vettori formati da valori double sono definiti vettori numerici. In R la tipologia del vettore è indicata con `numeric` mentre i dati sono `double`. 


```r
my_values <- c(1,2,3,4,5)
class(my_values)  # tipologia oggetto
## [1] "numeric"

typeof(my_values) # tipologia dati
## [1] "double"
```

I vettori numerici sono utilizzati per compiere qualsiasi tipo di operazioni matematiche o logico-relazionali. 


```r
my_values + 10
## [1] 11 12 13 14 15

my_values <= 3
## [1]  TRUE  TRUE  TRUE FALSE FALSE
```

### Integer

In R per specificare che un valore è un numero intero viene aggiunta la lettera `L` immediatamente dopo il numero. I vettori formati da valori interi sono definiti vettori di valori interi. In R la tipologia del vettore è indicata con `integer` allo stesso modo dei dati. 


```r
my_integers <- c(1L,2L,3L,4L,5L)
class(my_integers)  # tipologia oggetto
## [1] "integer"

typeof(my_integers) # tipologia dati
## [1] "integer"
```

Come per i vettori numerici, i vettori di valori interi possono esssere utilizzati per compiere qualsiasi tipo di operazioni matematiche o logico-relazionali. Nota tuttavia che operazioni tra integer e doubles restituiranno dei doubles ed anche nel caso di operazioni tra integers il risultato potrebbe non essere un integer.


```r
is.integer(5L * 5)   # integer e double
## [1] FALSE

is.integer(5L * 5L)  # integer e integer
## [1] TRUE

is.integer(5L / 5L)  # integer e integer
## [1] FALSE
```

### Logical

I vettori formati da valori logici (`TRUE` e `FALSE`) sono definiti vettori logici. In R la tipologia del vettore è indicata con `logical` allo stesso modo dei dati. 


```r
my_logical <- c(TRUE, FALSE, TRUE)
class(my_logical)  # tipologia oggetto
## [1] "logical"

typeof(my_logical) # tipologia dati
## [1] "logical"
```

I vettori di valori logici possono esssere utilizzati con gli operatori logici.


```r
my_logical & c(FALSE, TRUE, TRUE)
## [1] FALSE FALSE  TRUE

my_logical & c(0, 1, 3)
## [1] FALSE FALSE  TRUE
```

Tuttavia ricordiamo  che ai valori `TRUE` e `FALSE` sono associati rispettivamente i valori numerici 1 e 0 (o più precisamente i valori interi `1L` e `0L`). Pertanto è possibile eseguire anche operazioni matematiche dove verrano automaticamente considerati i rispettivi valori numerici. Ovviamente il risultato ottenuto sarà un valore numerico e non logico.


```r
TRUE * 10
## [1] 10

FALSE * 10
## [1] 0
```


:::{.trick title="sum() e mean()" data-latex="[sum() e mean()]"}
Utilizzando le funzioni `sum()` e `mean()` con un vettore logico, possiamo valutare rispettivamente il numero totale e la percentuale di elementi che hanno soddisfatto una certa condizione logica.


```r
my_values <- rnorm(50)  # genero dei numeri casuali 

sum(my_values > 0)      # totale numeri positivi
## [1] 28

mean(my_values > 0)      # percentuale numeri positivi
## [1] 0.56
```
:::


:::{.design title="is.* adn as.* Function Families" data-latex="[is.* adn as.* Function Families]"}
Esistono due famiglie di funzioni che permettono rispettivamene di testare e di modificare la tipologia dei dati.

#### is.* Family {-}

Per testare se un certo valore (o un vettore di valori) appartiene ad una specifica tipologia di dati, possimao utilizzare una tra le seguenti funzioni:

- `is.vector()` - valuta se un oggetto è un generico vettore di qualsiasi tipo

```r
is.vector("2021")   # TRUE
is.vector(2021)     # TRUE
is.vector(2021L)    # TRUE
is.vector(TRUE)     # TRUE
```

- `is.character()` - valuta se l'oggetto è una stringa

```r
is.character("2021") # TRUE
is.character(2021)   # FALSE
is.character(2021L)  # FALSE
is.character(TRUE)   # FALSE
```
- `is.numeric()` - valuta se l'oggetto è un valore numerico indipendentemente che sia un double o un integer

```r
is.numeric("2021")   # FALSE
is.numeric(2021)     # TRUE
is.numeric(2021L)    # TRUE
is.numeric(TRUE)     # FALSE
```
- `is.double()` - valuta se l'oggetto è un valore `double`

```r
is.double("2021")    # FALSE
is.double(2021)      # TRUE
is.double(2021L)     # FALSE
is.double(TRUE)      # FALSE
```
- `is.integer()` - valuta se l'oggetto è un valore intero

```r
is.integer("2021")   # FALSE
is.integer(2021)     # FALSE
is.integer(2021L)    # TRUE
is.integer(TRUE)     # FALSE
```
- `is.logical()` - valuta se l'oggetto è un valore logico

```r
is.logical("2021")   # FALSE
is.logical(2021)     # FALSE
is.logical(2021L)    # FALSE
is.logical(TRUE)     # TRUE
```

#### as.* Family {-}

Per modificare la tipologia di un certo valore (o un vettore di valori), possimao utilizzare una tra le seguenti funzioni:

- `as.character()` - trasforma l'oggetto in una stringa

```r
as.character(2021)
## [1] "2021"
as.character(2021L)
## [1] "2021"
as.character(TRUE)
## [1] "TRUE"
```
- `as.numeric()` - trasforma l'oggetto in un `double`

```r
as.numeric("foo")  # Non valido con stringhe di caratteri
## Warning: NAs introduced by coercion
## [1] NA
as.numeric("2021") # Valido per stinghe di cifre
## [1] 2021
as.numeric(2021L)
## [1] 2021
as.numeric(TRUE)
## [1] 1
```
- `as.double()` - trasforma l'oggetto in un `double`

```r
as.double("2021") # Valido per stinghe di cifre
## [1] 2021
as.double(2021L)
## [1] 2021
as.double(TRUE)
## [1] 1
```
- `as.integer()` - trasforma l'oggetto in un `integer`

```r
as.integer("2021") # Valido per stinghe di cifre
## [1] 2021
as.integer(2021.6) # Tronca la parte decimale
## [1] 2021
as.integer(TRUE)
## [1] 1
```
- `as.logical()` - trasforma un oggetto numerico in un valore logico qualsiasi valore diverso da 0 viene considerato `TRUE`

```r
as.logical("2021") # Non valido per le stringhe
## [1] NA
as.logical(0)
## [1] FALSE
as.logical(0.5)
## [1] TRUE
as.logical(2021L)
## [1] TRUE
```
:::

### Valori speciali

Vediamo infine alcuni valori speciali utilizzatti in R con dei particolari significati e che richiedono specifici accorgimenti quando vengono manipolati:

- `NULL`- rappresenta l'oggetto nullo, ovvero l'assenza di un oggetto. Spesso viene restituito dalle funzioni quano il loro output è indefinito.
- `NA` - rappresenta un dato mancate (*Not Available*). E' un valore costante di lunghezza 1 che può essere utlizzato per qualsiasi tipologia di dati.
- `NaN` - indica un risulato matematico che non può essere rappresentato come un valore numerico (*Not A Number*). E' un valore costante di lunghezza 1 che può essere utlizzato come valore numerico (non intero).

```r
0/0
## [1] NaN
sqrt(-1)
## Warning in sqrt(-1): NaNs produced
## [1] NaN
```
- `Inf` (o `-Inf`) - indica un risultato matematico inifinito (o infinito negativo). E' anche utilizzato per rappresentare numeri estremamente grandi.

```r
pi^650
## [1] Inf

-pi/0
## [1] -Inf
```

E' importante essere consapevoli delle caratteristiche di questi valori poichè presentano dei comportamenti peculiari che, se non corretamente gestiti, possono generare conseguenti errori nei codici. Descriviamo ora alcune delle carateristiche più importanti. 

#### Lunghezza Elementi {-}

Notiamo innanzitutto come mentre `NULL` sia effettivamente un oggetto nullo, ovvero privo di dimensione, `NA` sia uno speciale valore che rappresenta la presenza di un dato mancate. Pertanto `NA`, a differenza di `NULL`, è effettivamente un valore di lunghezza 1. 


```r
# Il valore NULL è un oggetto nullo
values_NULL <- c(1:5, NULL)
length(values_NULL)
## [1] 5
values_NULL # NULL non è presente
## [1] 1 2 3 4 5

# Il valore NA è un oggetto che testimonia un'assenza
values_NA <- c(1:5, NA)
length(values_NA)
## [1] 6
values_NA   # NA è presente
## [1]  1  2  3  4  5 NA
```

Allo stesso modo, anche i valori `NaN` e `Inf` sono effettivamente dei valori di lunghezza 1 usati per testimoniare speciali risultati numerici. 

```r
length(c(1:5, NaN))
## [1] 6
length(c(1:5, Inf))
## [1] 6
```

#### Propagazione Valori {-}

Altra importante caratteristica è quella che viene definita *propagazione* dei valori ovvero le operazioni che includono questi speciali valori resituiscono a loro volta lo stesso speciale. Ciò significa che questi valori si propagheranno di risultato in risultato all'interno del nostro codice se non opportunamente gestiti.

- `NULL`- osserviamo come se il valore `NULL` viene utilizzato in una qualsiasi operazione matematica il risultato sarà un vettore numerico vuoto di dimensione 0, il quale può essere interpretato in modo simile (seppur non identico) al valore `NULL`

```r
res_NULL <- NULL * 3
length(res_NULL)
## [1] 0
res_NULL
## numeric(0)
```
- `NA` - quando `NA` viene utilizzato in una qualsiasi operazione matematica il risultato sarà nuovamene un `NA`.

```r
NA * 3
## [1] NA
```
- `NaN` - quando `NaN` viene utilizzato in una qualsiasi operazione matematica il risultato sarà nuovamene un `NaN`.

```r
NaN * 3
## [1] NaN
```
- `Inf` (o `-Inf`) - qualora `Inf` (o `-Inf`) siano utilizzati in un'operazione matematica il risultato seguirà le comuni regole delle operazioni tra infiti.

```r
Inf - 3
## [1] Inf

Inf * -3
## [1] -Inf

Inf + Inf
## [1] Inf

Inf + -Inf
## [1] NaN

Inf * -Inf
## [1] -Inf

Inf / Inf
## [1] NaN
```

#### Testare Valori {-}

E' importante ricordare come per testare l apresenza di uno di questi valori speciali siano presenti delle funzioni specifiche della famiglia `is.*`. Non deve mai essere utlizzato il comune operatore di uguaglianza `==` poichè non fornisce i risultai corretti.

- `is.null`

```r
NULL == NULL     # logical(0)
is.null(NULL)    # TRUE
```
- `is.na` 

```r
NA == NA    # NA
is.na(NA)   # TRUE
```
- `is.nan` 

```r
NaN == NaN  # NA
is.nan(NaN) # TRUE
```
- `Inf`  

```r
Inf == Inf       # TRUE considero anche il segno
is.infinite(Inf) # TRUE sia per Inf che -Inf
```

#### Operatori Logici {-}

Un particolare comportamento riguarda i risultati ottenute con gli operatori logici dove la *propagazione* del valore non segue sempre le attese. Osserviamo i diversi casi:

- `NULL`-  ottenimo come da attese un vettore logico vuoto di dimensione 0

```r
TRUE & NULL  # logical(0)
TRUE | NULL  # logical(0)

FALSE & NULL # logical(0)
FALSE | NULL # logical(0)
```
- `NA` - non otteniamo come da attese sempre il valore `NA` ma in alcune condizioni la proposizione sara `TRUE` o `FALSE`

```r
TRUE & NA  # NA
TRUE | NA  # TRUE

FALSE & NA # FALSE
FALSE | NA # NA
```
- `NaN` - otteniamo gli stessi risultati del caso precedente utilizzando il valore `NA`

```r
TRUE & NaN  # NA
TRUE | NaN  # TRUE

FALSE & NaN # FALSE
FALSE | NaN # NA
```
- `Inf`  - essendo un valore numerico diverso da zero otteniamo i rissultati secondo le attese

```r
TRUE & Inf  # TRUE
TRUE | Inf  # TRUE

FALSE & Inf # FALSE
FALSE | Inf # TRUE
```

:::{.tip title="A Logical Solution" data-latex="[A Logical Solution]"}
Un comportamento tanto strano per quanto riguarda l'utilizzo del valore `NA` con gli operatori logici può essere spiegato dal fatto che il valore `NA` in realtà sia un valore logico che indica la mancanza di una risposta.

```r
is.logical(NA)
## [1] TRUE
```

Pertanto le proposizioni vengono correttamente seguendo le comuni regole. Nel caso di `TRUE | NA` la proposizione è giudicata `TRUE` perchè con l'operatore di disgiunzione è sufficiente che una delle due parti sia vera avvinchè la proposizione sia vera. Nel caso di `FALSE & NA`, invece, la proposizione è giudicata `FALSE` perchè con l'operatore di congiunzione è sufficiente che una delle due parti sia falsa avvinchè la proposizione sia falsa. LA non risposta indicata da `NA` i questi casi è ininfluente, mentre determina il risultato nei restanti casi quando la seconda parte  della proposizione deve essere necessariamente valutata. A questo punto gli operatori restituiscono `NA` poichè incapaci di determinare la risposta.

Per quanto riguarda il caso del valore `NaN` è sufficinete ricordare che tale valore sia comunque un valore numerico di cui però non è possibile identificare il valore.

```r
is.numeric(NaN)
## [1] TRUE
```
Tutti i valori numerici sono considerati validi nelle operazioni logiche, dove qualsiais numero diveros da zero è valutato `TRUE`. Pertanto viene seguito lo stesso ragionamento precedente, quando non è necessario valutare entrambe le parti della proposizione viene fornita una risposta, mentre si ottiene `NA` negli altri casi quando R è obbligato a valutare entrambe la parti ma è incapace di fornire una risspossta poichè non può determinare il valore di `NaN`.
:::

:::{.design title="L'importanza dei Dati Mancanti" data-latex="[L'importanza dei Dati Mancanti]"}
Lavorare in presenza di dati mancanti accadrà nella maggior parte dei casi. Molte delle funzioni presenti in R hanno già delle opzioni per rimuovere automaticamete eventuali dati mancanti così da poter ottenre correttamete i risultati.

```r
my_sample <- c(2,4,6,8, NA)
mean(my_sample)
## [1] NA
mean(my_sample, na.rm = TRUE)
## [1] 5
```
Tuttavia, è importante non  avvalersi in modo automatico di tali opzioni ma avere cura di valutare attentamente la presenza di dati mancanti. Questo ci permetterà di indagare possibili pattern riguardanti i dati mancanti e valutare la loro possibile influenza sui nostri risultati e la validità elle conclusioni.

Inoltre sarà fondamentale controllare sempre l'effittiva dimensione del campione utilizzato nelle vari analisi. Ad esempio se non valutato attentamente potremmo non ottenere il numero effettivo di valori su cui è stata calcolata precedentemente la media.

```r
length(my_sample)    # NA incluso
## [1] 5
length(my_sample[!is.na(my_sample)]) # NA escluso
## [1] 4
```

:::


