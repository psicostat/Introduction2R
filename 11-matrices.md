# Matrici {#matrix}



## Creazione di una matrice

<!-- TODO sistema le cross-ref -->

La matrice è una struttura di dati **bidimensionale** che può contenere solo una tipologia di dato. Nel capitolo \@ref(data-type) sono state introdotte le varie tipologie di dato e come per i vettori, possiamo avere delle matrici di soli numeri o di soli caratteri. Il comando per creare una matrice in R è `matrix()` e contiene diversi argomenti:


```r
nome_matrice <- matrix(data, nrow = "numero righe", ncol = "numero colonne", byrow = FALSE)
```

* L'argomento `data` sono i valori con cui vogliamo popolare la matrice e sono considerati come un vettore.
* Gli argomenti `nrow` e `ncol` sono rispettivamente il numero di colonne e il numero di righe della matrice
* L'argomento `byrow` indica se la matrice deve essere popolata per riga oppure per colonna.

Creiamo come esempio una matrice vuota con soli valori `NA` con 5 righe e 5 colonne


```r
mat <- matrix(data = NA, nrow = 5, ncol = 5, byrow = FALSE)
mat
##      [,1] [,2] [,3] [,4] [,5]
## [1,]   NA   NA   NA   NA   NA
## [2,]   NA   NA   NA   NA   NA
## [3,]   NA   NA   NA   NA   NA
## [4,]   NA   NA   NA   NA   NA
## [5,]   NA   NA   NA   NA   NA
```

L'argomento `byrow = FALSE` è il default per il comando `matrix()` quindi R popola le matrici per colonna, se non espressamente richiesto.
A questo punto popoliamo la matrice con i valori che vanno da 1 a 25.


```r
# Dati per popolare la matrice
vec <- 1:25
vec
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25

# Matrice popolata per riga
mat_bycol <- matrix(data = vec, nrow = 5, ncol = 5, byrow = TRUE)
mat_bycol
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    2    3    4    5
## [2,]    6    7    8    9   10
## [3,]   11   12   13   14   15
## [4,]   16   17   18   19   20
## [5,]   21   22   23   24   25

# Matrice popolata per colonna
mat_byrow <- matrix(data = vec, nrow = 5, ncol = 5, byrow = FALSE)
mat_byrow
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    6   11   16   21
## [2,]    2    7   12   17   22
## [3,]    3    8   13   18   23
## [4,]    4    9   14   19   24
## [5,]    5   10   15   20   25
```

Come si vede la matrice ora è popolata dai numeri che abbiamo creato e viene di default, popolata per colonna. Allo stesso modo possiamo semplicemente impostare `byrow = TRUE` per popolare la matrice per riga.

E' importante tenere in considerazione che l'argomento `data` deve essere compatibile con gli argomenti `nrow` e `ncol`. In altre parole **non posso fornire più o meno dati di quelli che la matrice può contenere**. E' invece possibile specificare qualsiasi combinazione di righe e colonne rispettando che il numero totale di elementi corrisponda agli spazi disponibili.


```r
vec <- 1:16

# Numero non compatibile
mat <- matrix(vec, ncol = 5, nrow = 5, byrow = FALSE)
## Warning in matrix(vec, ncol = 5, nrow = 5, byrow = FALSE): data length [16] is
## not a sub-multiple or multiple of the number of rows [5]
mat
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    6   11   16    5
## [2,]    2    7   12    1    6
## [3,]    3    8   13    2    7
## [4,]    4    9   14    3    8
## [5,]    5   10   15    4    9

# Matrice non quadrata con lo stesso vettore
mat <- matrix(vec, ncol = 2, nrow = 8, byrow = FALSE)
mat
##      [,1] [,2]
## [1,]    1    9
## [2,]    2   10
## [3,]    3   11
## [4,]    4   12
## [5,]    5   13
## [6,]    6   14
## [7,]    7   15
## [8,]    8   16
```

Abbiamo visto che possiamo facilmente popolare una matrice con un vettore. Allo stesso modo possiamo vettorizzare una matrice (in altri termini "srotolare" la matrice) per ritornare al vettore originale. Con il comando `c(matrice)` oppure forzando la tipologia di oggetto a vettore con `vector(matrice)` o `as.vector(matrice)`.


```r
# Da matrice a vettore
c(mat)
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16
as.vector(mat)
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16
```

:::{.tip title="Matrice di caratteri" data-latex="[Matrice di caratteri]"}
La matrice è una tipologia di oggetto molto importante sia in R ma anche nella matematica, ad esempio nell'algebra lineare. Come vedremo ci sono diverse operazioni matematice (somma, moltiplicazione, inversione, etc.) che si possono eseguire. Abbiamo inoltre accennato che la matrice può contenere anche valori non numerici.


```r
# Creare una matrice di caratteri

chr_mat <- matrix(data = "chr", nrow = 5, ncol = 5, byrow = FALSE)
chr_mat
##      [,1]  [,2]  [,3]  [,4]  [,5] 
## [1,] "chr" "chr" "chr" "chr" "chr"
## [2,] "chr" "chr" "chr" "chr" "chr"
## [3,] "chr" "chr" "chr" "chr" "chr"
## [4,] "chr" "chr" "chr" "chr" "chr"
## [5,] "chr" "chr" "chr" "chr" "chr"

# Popolare una matrice di caratteri
vec_chr <- c("a", "b", "c", "d", "e", "f", "g", "h", "i", "l", "m", "n", "o", "p", "q", "r")

chr_mat <- matrix(vec_chr, nrow = 4, ncol = 4, byrow = FALSE)
chr_mat
##      [,1] [,2] [,3] [,4]
## [1,] "a"  "e"  "i"  "o" 
## [2,] "b"  "f"  "l"  "p" 
## [3,] "c"  "g"  "m"  "q" 
## [4,] "d"  "h"  "n"  "r"
```

Per questo tipo di matrice valgono tutte le proprietà che vedremo o abbiamo visto fino ad ora. Tuttavia, non è molto frequente l'utilizzo di matrici di caratteri visto che chiaramente tutte le operazioni comuni non sono possibili.
:::

### Esercizi {-}

1. Crea la matrice `A` così definita: 

$$
\begin{matrix}
2 & 34 & 12 & 7\\
46 & 93 & 27 & 99\\
23  & 38 & 7 & 04
\end{matrix}
$$

2. Crea la matrice `B` contenente tutti i primi 12 numeri dispari disposti su 4 righe e 3 colonne.
3. Crea la matrice `C` contenente i primi 12 multipli di 9 disposti su 3 righe e 4 colonne.
4. Crea la matrice `D`  formata da 3 colonne in cui le lettere `"A"`,`"B"` e `"C"` vengano ripetute 4 volte ciascuna rispettivamente nella prima, seconda e terza colonna.
5. Crea la matrice `E`  formata da 3 righe in cui le lettere `"A"`,`"B"` e `"C"` vengano ripetute 4 volte ciascuna rispettivamente nella prima, seconda e terza riga.

## Proprietà della matrice{#mat-prop}

La matrice essendo **bidimensionale** è formata da due elementi, righe e colonne. Sapendo il numero di righe e colonne infatti sappiamo la quantità di elementi nella matrice. Per ottenere queste informazioni possiamo usare i comandi `ncol()` e `nrow()`.


```r
vec <- 1:25
mat <- matrix(vec, ncol = 5, nrow = 5, byrow = FALSE)

# Numero di righe
nrow(mat)
## [1] 5

# Numero di colonne
ncol(mat)
## [1] 5
```

Come avete notato, la matrice viene principalmente gestita tramite indici numerici, nella sezione successiva vedremo come accedere ad ogni elemento di una matrice. In R, possiamo però anche assegnare dei nomi alle proprietà (o dimensioni) della matrice. Con i comandi `rownames()` e `colnames()` possiamo accedere ai nomi di righe e colonne o assegnarne di nuovi. Un comando più rapido è `dimnames()` che restituisce direttamente i nomi di riga e/o colonna.


```r
vec <- 1:25
mat <- matrix(vec, ncol = 5, nrow = 5, byrow = FALSE)

# Nome di righe
rownames(mat)
## NULL

# Nome di colonne
colnames(mat)
## NULL
```

Non essendo impostati, ottieniamo un `NULL` come output. Se impostare i nomi di righe e/o colonne, è sufficiente assegnare a `rownames(matrice)` o `colnames(matrice)` un vettore di caratteri della stessa lunghezza della dimensione che stiamo rinominando. Se impostiamo un unico carattere, tutte le righe/colonne avranno lo stesso valore. Questo ci fa capire che R richiede che tutte le righe/colonne abbiano un nome.

<!-- TODO Vedi se introdotto il comando letters -->


```r
vec <- 1:25
mat <- matrix(vec, ncol = 5, nrow = 5, byrow = FALSE)

dimnames(mat)
## NULL

# Assegnamo i nomi

row_names <- letters[1:5]
col_names <- letters[6:10]

colnames(mat) <- col_names
rownames(mat) <- row_names
dimnames(mat)
## [[1]]
## [1] "a" "b" "c" "d" "e"
## 
## [[2]]
## [1] "f" "g" "h" "i" "j"
mat
##   f  g  h  i  j
## a 1  6 11 16 21
## b 2  7 12 17 22
## c 3  8 13 18 23
## d 4  9 14 19 24
## e 5 10 15 20 25
```

## Indicizzazione di matrici

L'aspetto sicuramente più importante (e divertente) riguardo le matrici è accedere ai vari elementi. Indipendentemente da cosa la matrice contenga infatti possiamo pensare ai valori come ad una griglia dove l'incrocio tra righe $i$ e colonne $j$ crea una cella unica $ij$ che contiene uno specifico valore. Un modo utile per capire questo concetto è immaginare una matrice $i \times j$ dove ogni elemento è il numero di riga $i$ e il numero di colonna $j$:


```
##      [,1] [,2] [,3] [,4] [,5]
## [1,] "11" "12" "13" "14" "15"
## [2,] "21" "22" "23" "24" "25"
## [3,] "31" "32" "33" "34" "35"
## [4,] "41" "42" "43" "44" "45"
## [5,] "51" "52" "53" "54" "55"
```

In questa matrice è chiaro che il primo elemento è nella prima riga e nella prima colonna, il secondo elemento (per riga) è nella prima riga e nella seconda colonna e così via.

Questo introduce un aspetto fondamentale di come funzionano le matrici e i vettori (e come vedremo anche i `dataframe`) ovvero si può fare riferimento agli indici di riga e colonna per accedere a qualsiasi elemento.



In sostanza, per accedere ad una matrice usiamo le parentesi quadre `matrice[]` e in ordine forniamo il numero di riga e il numero di colonna. L'ordine `[riga, colonna]` è arbitrario e deve essere rispettato.


```r
vec <- 1:25
mat <- matrix(vec, ncol = 5, nrow = 5, byrow = FALSE)

mat
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    6   11   16   21
## [2,]    2    7   12   17   22
## [3,]    3    8   13   18   23
## [4,]    4    9   14   19   24
## [5,]    5   10   15   20   25

# Selezioniamo l'elemento alla riga 3 e colonna 5

mat[3,5]
## [1] 23

# Selezioniamo l'elemento alla riga 10 e colonna 1

mat[10,1]
## Error in mat[10, 1]: subscript out of bounds
```

Come vedete, possiamo accedere a qualsiasi elemento. Se indichiamo un indice che non è presente nella matrice in oggetto, chiaramente otteniamo un errore.

## Indicizzazione avanzata

Oltre a selezionare uno specifico elemento possiamo essere interessati a selezionare più elementi insieme. La sintassi rimane la stessa quindi `matrice[riga, colonna]` ma possiamo combinare le conoscenze sui vettori e sulla creazione di oggetti. Quello che possiamo fare:

* Selezionare **tutti gli elementi di una riga o colonna**
* Selezionare la **diagonale** della matrice
* Selezionare **solo alcune righe e/o colonne**
* Selezionare elementi con **operazioni logiche**

Per selezionare **tutti** gli elementi di una riga o colonna si usa la sintassi `matrice[, colonna]` o `matrice[riga, ]` per selezionare rispettivamente tutte le righe ma solo una o più colonne e tutte le colonne ma solo una o più righe. Lasciando vuoto il posto prima o dopo la virgola diciamo ad R di selezionare tutto.


```r
vec <- 1:25
mat <- matrix(vec, ncol = 5, nrow = 5, byrow = FALSE)

mat
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    6   11   16   21
## [2,]    2    7   12   17   22
## [3,]    3    8   13   18   23
## [4,]    4    9   14   19   24
## [5,]    5   10   15   20   25

# Selezioniamo tutta la prima riga

mat[1, ]
## [1]  1  6 11 16 21

# Selezioniamo tutta la terza colonna

mat[, 2]
## [1]  6  7  8  9 10
```

:::{.tip title="Matrici e vettori" data-latex="[Matrici e vettori]"}
Selezionando solo una riga/colonna ci rendiamo conto che otteniamo una cosa molto simile ad un **vettore**. Infatti, un vettore può essere anche visto come una matrice con una sola riga o colonna. In R comunque sia il vettore che una matrice con una sola dimensione sono trattati allo stesso modo.
:::

Riguardo la **diagonale** di una matrice essa può essere vista, dal punto di vista prettamente pratico, come l'insieme di elementi associati allo stesso indice di riga e colonna. Il comando `diag(matrice)` permette di estrarre la diagonale di una matrice e trattarla come un semplice vettore:


```r

# Matrice quadrata
vec <- 1:25
mat <- matrix(vec, ncol = 5, nrow = 5, byrow = FALSE)

mat
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    6   11   16   21
## [2,]    2    7   12   17   22
## [3,]    3    8   13   18   23
## [4,]    4    9   14   19   24
## [5,]    5   10   15   20   25

diag(mat)
## [1]  1  7 13 19 25

# Matrice non quadrata

vec <- 1:16
mat <- matrix(vec, ncol = 2, nrow = 8, byrow = FALSE)
mat
##      [,1] [,2]
## [1,]    1    9
## [2,]    2   10
## [3,]    3   11
## [4,]    4   12
## [5,]    5   13
## [6,]    6   14
## [7,]    7   15
## [8,]    8   16

diag(mat)
## [1]  1 10
```

Per selezionare più righe e colonne insieme possiamo usare diversi metodi. Essenzialmente se devo selezionare più elementi devo fornire ad R più indici insieme. E' chiaro però che la notazione `matrice[riga, colonna]` non è direttamente compatibile se vogliamo più elementi. La scrittura `matrice[riga1, riga2, colonna]` infatti è sbagliata perchè R si aspetta una sola virgola che separa righe e colonne. Il modo più rapido è quindi combinare gli indici che vogliamo in un vettore (usando il comando `c()` ad esempio) e poi selezionare gli elementi. Se le colonne sono indicizzate come numeri in successione, ad esempio seleziono le prime 3 colonne posso utilizzare la scrittura compatta `1:3` che è equivalente a `c(1,2,3)`


```r
vec <- 1:25
mat <- matrix(vec, ncol = 5, nrow = 5, byrow = FALSE)
mat
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    6   11   16   21
## [2,]    2    7   12   17   22
## [3,]    3    8   13   18   23
## [4,]    4    9   14   19   24
## [5,]    5   10   15   20   25

# Prime 2 righe e prime 2 colonne

mat[c(1,2), c(1,2)]
##      [,1] [,2]
## [1,]    1    6
## [2,]    2    7

# Riga 1 e 4, colonna 4 e 5

mat[c(1,4), c(4,5)]
##      [,1] [,2]
## [1,]   16   21
## [2,]   19   24

# Prime tre righe e quinta colonna

mat[1:3, 5]
## [1] 21 22 23
```

Essendo la matrice (principalmente) formata da elementi numerici, possiamo anche eseguire le principali operazioni sia matematiche (e.g. somma, differenza, moltiplicazione) ma anche quelle logiche come "quali elementi della matrice sono maggiori di x?". 

Allo stesso modo possiamo selezionare (e quindi estrarre) gli elementi che rispettano una certa condizione usando la sintassi `matrice[operazione logica]`. Le operazioni logiche complesse sono molto utili sopratutto con i `dataframe` come vedremo nelle prossime sezioni.


```r
vec <- 1:25
mat <- matrix(vec, ncol = 5, nrow = 5, byrow = FALSE)
mat
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    6   11   16   21
## [2,]    2    7   12   17   22
## [3,]    3    8   13   18   23
## [4,]    4    9   14   19   24
## [5,]    5   10   15   20   25

# Quali elementi sono > 5
mat > 5
##       [,1] [,2] [,3] [,4] [,5]
## [1,] FALSE TRUE TRUE TRUE TRUE
## [2,] FALSE TRUE TRUE TRUE TRUE
## [3,] FALSE TRUE TRUE TRUE TRUE
## [4,] FALSE TRUE TRUE TRUE TRUE
## [5,] FALSE TRUE TRUE TRUE TRUE

# Quali elementi sono < 1
mat > 5
##       [,1] [,2] [,3] [,4] [,5]
## [1,] FALSE TRUE TRUE TRUE TRUE
## [2,] FALSE TRUE TRUE TRUE TRUE
## [3,] FALSE TRUE TRUE TRUE TRUE
## [4,] FALSE TRUE TRUE TRUE TRUE
## [5,] FALSE TRUE TRUE TRUE TRUE

# Quali elementi sono = 0
mat == 5
##       [,1]  [,2]  [,3]  [,4]  [,5]
## [1,] FALSE FALSE FALSE FALSE FALSE
## [2,] FALSE FALSE FALSE FALSE FALSE
## [3,] FALSE FALSE FALSE FALSE FALSE
## [4,] FALSE FALSE FALSE FALSE FALSE
## [5,]  TRUE FALSE FALSE FALSE FALSE

# Selezioniamo gli elementi

mat[mat > 5]
##  [1]  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25

mat[mat == 0]
## integer(0)
```

Un ultimo aspetto da considerare, anche se non molto diffuso consiste nell'**indicizzare una matrice in base ai nomi delle righe e/o colonne**. Come abbiamo visto nella sezione \@ref(mat-prop) possiamo assegnare dei nomi (quindi delle stringhe) alle righe e colonne. Possiamo quindi selezionare la riga 1 sia con il suo indice `matrice[1, ]` ma anche con il nome assegnato `matrice["nome",]`. Queste sono operazioni fondamentali con i **dataframe** ma meno utili con le matrici.


```r
vec <- 1:25
mat <- matrix(vec, ncol = 5, nrow = 5, byrow = FALSE)
row_names <- letters[1:5]
col_names <- letters[6:10]
colnames(mat) <- col_names
rownames(mat) <- row_names
mat
##   f  g  h  i  j
## a 1  6 11 16 21
## b 2  7 12 17 22
## c 3  8 13 18 23
## d 4  9 14 19 24
## e 5 10 15 20 25

# Selezioniamo la riga "a"

mat["a", ]
##  f  g  h  i  j 
##  1  6 11 16 21

# Selezioniamo le colonne "i" e "j"

mat[, c("i", "j")]
##    i  j
## a 16 21
## b 17 22
## c 18 23
## d 19 24
## e 20 25
```

## Combinare matrici

Abbiamo visto nel capitolo \@ref(vector) come si possano fare diverse operazioni tra vettori, in particolare combinare ovvero unire vettori diversi. Anche per le matrici è possibile combinare matrici diverse, rispettando alcune regole:

* Posso unire matrici per riga ovvero aggiungo una o più righe ad una matrice, oppure per colonna ovvero aggiungo una o più colonne
* Posso unire matrici che abbiamo la stessa dimensione (i.e., numero di righe e/o colonne) rispetto alla dimensione che voglio combinare
* Le matrici che unisco devono essere della stessa tipologia (numeri o caratteri)

Se partiamo da una matrice `mat` per unire a `mat` un'altra matrice `new_mat` possiamo usare il comando `cbind(mat, new_mat)` se vogliamo unire le due matrici per colonna invece `rbind(mat, new_mat)` se vogliamo unire per riga. E' utile pensare all'unione come un collage tra matrici, in figura\@ref(fig:mat-comb) è presente uno schema utile per capire visivamente questo concetto.

<div class="figure" style="text-align: center">
<img src="images/matrix_comb.png" alt="Schema per la combinazione di matrici" width="50%" />
<p class="caption">(\#fig:mat-comb)Schema per la combinazione di matrici</p>
</div>

Vediamo in R:


```r
vec <- 1:25
mat <- matrix(vec, ncol = 5, nrow = 5, byrow = FALSE)

# Nuova matrice da aggiungere
new_vec <- 11:20
new_mat <- matrix(new_vec, ncol = 2, nrow = 5, byrow = FALSE)

mat
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    6   11   16   21
## [2,]    2    7   12   17   22
## [3,]    3    8   13   18   23
## [4,]    4    9   14   19   24
## [5,]    5   10   15   20   25
new_mat
##      [,1] [,2]
## [1,]   11   16
## [2,]   12   17
## [3,]   13   18
## [4,]   14   19
## [5,]   15   20

# Combiniamo per colonna

cbind(mat, new_mat)
##      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
## [1,]    1    6   11   16   21   11   16
## [2,]    2    7   12   17   22   12   17
## [3,]    3    8   13   18   23   13   18
## [4,]    4    9   14   19   24   14   19
## [5,]    5   10   15   20   25   15   20

# Combiniamo per riga

rbind(mat, new_mat)
## Error in rbind(mat, new_mat): number of columns of matrices must match (see arg 2)

# Scambiamo il numero di colonne e righe, per far combaciare le due matrici

new_vec <- 11:20
new_mat <- matrix(new_vec, ncol = 5, nrow = 2, byrow = FALSE)
mat
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    6   11   16   21
## [2,]    2    7   12   17   22
## [3,]    3    8   13   18   23
## [4,]    4    9   14   19   24
## [5,]    5   10   15   20   25
new_mat
##      [,1] [,2] [,3] [,4] [,5]
## [1,]   11   13   15   17   19
## [2,]   12   14   16   18   20

rbind(mat, new_mat)
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    6   11   16   21
## [2,]    2    7   12   17   22
## [3,]    3    8   13   18   23
## [4,]    4    9   14   19   24
## [5,]    5   10   15   20   25
## [6,]   11   13   15   17   19
## [7,]   12   14   16   18   20
```

Possiamo combinare quindi per riga/colonna solo se le righe/colonne delle due matrici sono equivalenti. Otteniamo un errore quando cerchiamo di combinare matrici di dimensioni diverse.

Un ultimo aspetto utile è l'estensione dei comandi `cbind()` ed `rbind()`. Fino ad ora li abbiamo utilizzati con due elementi: matrice di partenza e matrice da aggiungere ma possono essere utilizzati con elementi multipli. Se vogliamo combinare $n$ matrici possiamo usare il comando `cbind(mat1, mat2, mat3, ...)` o `rbind(mat1, mat2, mat3, ...)`. In questo caso il risultato finale dipende dall'ordine degli argomenti quindi prima la `mat1`, poi la `mat2` e così via.

Ci sono molte altre operazioni da eseguire con le matrici. La tabella \@ref(tab:table-matrix-operators) riassume quelle che abbiamo visto e anche alcune operazioni più legate al mondo dell'algebra.

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:table-matrix-operators)Operazioni con matrici</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Operazione </th>
   <th style="text-align:left;"> Nome </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> &lt;nuova-matrice&gt; &lt;- cbind(&lt;matrice1&gt;, &lt;matrice2&gt;) </td>
   <td style="text-align:left;"> Per unire due matrici creando nuove colonne (le matrici devono avere lo stesso numero di righe) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> &lt;nuova-matrice&gt; &lt;- rbind(&lt;matrice1&gt;, &lt;matrice2&gt;) </td>
   <td style="text-align:left;"> Per unire due matrici creando nuove righe (le matrici devono avere lo stesso numero di colonne) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nrow(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Per valutare il numero di righe della matrice </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ncol(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Per valutare il numero di colonne della matrice </td>
  </tr>
  <tr>
   <td style="text-align:left;"> dim(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Per valutare la dimensione della matrice (righe e colonne) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> t(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Per ottenere la trasposta della matrice </td>
  </tr>
  <tr>
   <td style="text-align:left;"> diag(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Ottenere un vettore con gli elementi della diagonale della matrice </td>
  </tr>
  <tr>
   <td style="text-align:left;"> det(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Ottenere il determinante della matrice (la matrice deve essere quadrata) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> solve(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Ottenere l'inversa della matrice </td>
  </tr>
  <tr>
   <td style="text-align:left;"> colnames(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Nomi delle colonne della matrice </td>
  </tr>
  <tr>
   <td style="text-align:left;"> rownames(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Nomi delle righe della matrice </td>
  </tr>
  <tr>
   <td style="text-align:left;"> matrice1 + matrice2 </td>
   <td style="text-align:left;"> Somma elemento per elemento di due matrici </td>
  </tr>
  <tr>
   <td style="text-align:left;"> matrice1 - matrice2 </td>
   <td style="text-align:left;"> Differenza elemento per elemento tra due matrici </td>
  </tr>
  <tr>
   <td style="text-align:left;"> matrice1 * matrice2 </td>
   <td style="text-align:left;"> Prodotto elemento per elemento tra due matrici </td>
  </tr>
  <tr>
   <td style="text-align:left;"> matrice1 / matrice2 </td>
   <td style="text-align:left;"> Rapporto elemento per elemento tra due matrici </td>
  </tr>
  <tr>
   <td style="text-align:left;"> matrice1 %*% matrice2 </td>
   <td style="text-align:left;"> Prodotto matriciale </td>
  </tr>
</tbody>
</table>

### Esercizi {-}

Utilizzando la matrice creata `A` creata negli esercizi precedenti:

1. Utilizzando gli indici di riga e di colonna selziona il numero 27 della matrice `A`
2. Selziona gli elementi compresi tra la seconda e quarta riga, seconda e terza colonna della matrice `B`
3. Seleziona solo gli elementi pari della matrice `A` (Nota: utilizza l'operazione resto `%%`)
4. Elimina dalla matrice `C` la terza riga e la terza colonna
5. Seleziona tutti gli elementi della seconda e terza riga della matrice `B`
6. Seleziona tutti gli elementi diversi da  “B” appartenenti alla matrice `D`
7. Crea la matrice `G` unendo alla matrice `A` le prime due colonne della matrice `C`
8. Crea la matrice `H` unendo alla matrice `C` le prime due righe della matrice trasposta di `B`
9. Ridefinisci la matrice `A` eliminando la seconda colonna. Ridefinisci la matrice `B` eliminando la prima riga. Verifica che le  matrici così ottenute abbiano la stessa dimensione.
10. Commenta i differenti risultati che otteniamo nelle operazioni `A*B`, `B*A`, `A%*%B` e `B%*%A`.
11. Assegna i seguenti nomi alle colonne e alle righe della matrice `C`: `"col\_1", "col\_2", "col\_3", "col\_4", "row\_1", "row\_2", "row\_3"`.


<!--

### Esercizi {-}

1. Crea la matrice `A` così definita: 

$$
\begin{matrix}
2 & 34 & 12 & 7\\
46 & 93 & 27 & 99\\
23  & 38 & 7 & 04
\end{matrix}
$$

2. Crea la matrice `B` contenente tutti i primi 12 numeri dispari disposti su 4 righe e 3 colonne.
3. Crea la matrice `C` contenente i primi 12 multipli di 9 disposti su 3 righe e 4 colonne.
4. Crea la matrice `D`  formata da 3 colonne in cui le lettere `"A"`,`"B"` e `"C"` vengano ripetute 4 volte ciascuna rispettivamente nella prima, seconda e terza colonna.
5. Crea la matrice `E`  formata da 3 righe in cui le lettere `"A"`,`"B"` e `"C"` vengano ripetute 4 volte ciascuna rispettivamente nella prima, seconda e terza riga.

## Selezione di Elementi di una Matrice

In R per selezioneare gli elementi di matrice si deve indicare all'interno delle parentesi quadre l'indice di riga e l'indice di colonna (**separati da virgola**) degli elementi da selezionare oppure la condizione logica che devono rispettare.

`<nome-matrice>[<indice-riga>, <indice-colonna>]`

**Nota:** per selezionare tutti gli elementi di una data riga o di una data colonna basta lasciare vuoto rispettivamente l'indice di riga o l'indice di colonna.

### Esercizi {-}

1. Utilizzando gli indici di riga e di colonna selziona il numero 27 della matrice `A`
2. Selziona gli elementi compresi tra la seconda e quarta riga, seconda e terza colonna della matrice `B`
3. Seleziona solo gli elementi pari della matrice `A` (Nota: utilizza l'operazione resto `%%`)
4. Elimina dalla matrice `C` la terza riga e la terza colonna
5. Seleziona tutti gli elementi della seconda e terza riga della matrice `B`
6. Seleziona tutti gli elementi diversi da  “B” appartenenti alla matrice `D`

## Funzioni ed Operazioni tra Matrici


<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-19)Operazioni con matrici</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Operazione </th>
   <th style="text-align:left;"> Nome </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> &lt;nuova-matrice&gt; &lt;- cbind(&lt;matrice1&gt;, &lt;matrice2&gt;) </td>
   <td style="text-align:left;"> Per unire due matrici creando nuove colonne (le matrici devono avere lo stesso numero di righe) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> &lt;nuova-matrice&gt; &lt;- rbind(&lt;matrice1&gt;, &lt;matrice2&gt;) </td>
   <td style="text-align:left;"> Per unire due matrici creando nuove righe (le matrici devono avere lo stesso numero di colonne) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nrow(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Per valutare il numero di righe della matrice </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ncol(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Per valutare il numero di colonne della matrice </td>
  </tr>
  <tr>
   <td style="text-align:left;"> dim(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Per valutare la dimensione della matrice (righe e colonne) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> t(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Per ottenere la trasposta della matrice </td>
  </tr>
  <tr>
   <td style="text-align:left;"> diag(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Ottenere un vettore con gli elementi della diagonale della matrice </td>
  </tr>
  <tr>
   <td style="text-align:left;"> det(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Ottenere il determinante della matrice (la matrice deve essere quadrata) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> solve(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Ottenere l'inversa della matrice </td>
  </tr>
  <tr>
   <td style="text-align:left;"> colnames(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Nomi delle colonne della matrice </td>
  </tr>
  <tr>
   <td style="text-align:left;"> rownames(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Nomi delle righe della matrice </td>
  </tr>
  <tr>
   <td style="text-align:left;"> matrice1 + matrice2 </td>
   <td style="text-align:left;"> Somma elemento per elemento di due matrici </td>
  </tr>
  <tr>
   <td style="text-align:left;"> matrice1 - matrice2 </td>
   <td style="text-align:left;"> Differenza elemento per elemento tra due matrici </td>
  </tr>
  <tr>
   <td style="text-align:left;"> matrice1 * matrice2 </td>
   <td style="text-align:left;"> Prodotto elemento per elemento tra due matrici </td>
  </tr>
  <tr>
   <td style="text-align:left;"> matrice1 / matrice2 </td>
   <td style="text-align:left;"> Rapporto elemento per elemento tra due matrici </td>
  </tr>
  <tr>
   <td style="text-align:left;"> matrice1 %*% matrice2 </td>
   <td style="text-align:left;"> Prodotto matriciale </td>
  </tr>
</tbody>
</table>

**Note:**

- Per il significato di determinante di una matrice considera: <https://it.wikipedia.org/wiki/Determinante>
- Per il significato di matrice inversa considera: <https://it.wikipedia.org/wiki/Matrice_invertibile>
- Per  compiere operazioni elemento per elemento tra due matrici, esse devono avere la stessa dimensione
- Per compiere il prodotto matriciale il numero di colonne della prima matrice deve essere uguale al numero di righe della seconda matrice (vedi <https://it.wikipedia.org/wiki/Moltiplicazione_di_matrici>). 
- E' possibile assegnare nomi alle colonne e righe di una matrice rispettivamente atttraverso i comandi:

```r
colnames(<nome-matrice>)<-c("nome-1",...,"nome-s")}

rownames(<nome-matrice>)<-c("nome-1",...,"nome-n")}
```

### Esercizi {-}

1. Crea la matrice `G` unendo alla matrice `A` le prime due colonne della matrice `C`
2. Crea la matrice `H` unendo alla matrice `C` le prime due righe della matrice trasposta di `B`
3. Ridefinisci la matrice `A` eliminando la seconda colonna. Ridefinisci la matrice `B` eliminando la prima riga. Verifica che le  matrici così ottenute abbiano la stessa dimensione.
4. Commenta i differenti risultati che otteniamo nelle operazioni `A*B`, `B*A`, `A%*%B` e `B%*%A`.
5. Assegna i seguenti nomi alle colonne e alle righe della matrice `C`: `"col\_1", "col\_2", "col\_3", "col\_4", "row\_1", "row\_2", "row\_3"`.

-->





