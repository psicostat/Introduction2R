# Dataframe {#dataframe}




Il `dataframe` è uno degli oggetti più interessanti ed anche utilizzati del linguaggio R. Inoltre, se vi capiterà di utilizzare altri linguaggi di programmazione sopratutto mirati all'analisi dati (Matlab ad esempio) noterete come vi mancherà un oggetto potente e intuitivo come il dataframe.

Come vedremo ci sono molte somiglianze tra il `dataframe` e la `matrice`. Quando necessario, si farà riferimento al capitolo precedente per far notare quali aspetti sono in comune tra queste due strutture di dati.

Il `dataframe` come dice il nome fa riferimento ad una struttura per i dati. Dati in questo caso è volutamente generico perchè il dataframe rispetto alla matrice può contenere nello stesso oggetto, tipi diversi di dato come fattori, caratteri e numeri. Può essere utile pensare al dataframe esattamente come ad una normale tabella che si può creare un un foglio di calcolo (Excel) dove possiamo mettere *nomi*, *date*, *numeri*, etc. 

La struttura di base di un dataframe è quindi la stessa di una matrice ma contiene i nomi delle colonne (e anche delle righe eventualmente) di default. Un esempio di dataframe è rappresentato nella tabella \@ref(tab:ex-dataframe)

<!-- TODO fare meglio la tabella -->

<table class="table table-striped table-hover table-condensed" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:ex-dataframe)Esempio di dataframe</caption>
 <thead>
  <tr>
   <th style="text-align:center;"> colonna1 </th>
   <th style="text-align:center;"> colonna2 </th>
   <th style="text-align:center;"> colonna3 </th>
   <th style="text-align:center;"> colonna4 </th>
   <th style="text-align:center;"> colonna5 </th>
   <th style="text-align:center;"> colonna6 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> 1.43 </td>
   <td style="text-align:center;"> -0.08 </td>
   <td style="text-align:center;"> 1.30 </td>
   <td style="text-align:center;"> -1.51 </td>
   <td style="text-align:center;"> 0.66 </td>
   <td style="text-align:center;"> a </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 1.44 </td>
   <td style="text-align:center;"> 1.84 </td>
   <td style="text-align:center;"> 1.17 </td>
   <td style="text-align:center;"> 0.52 </td>
   <td style="text-align:center;"> -0.33 </td>
   <td style="text-align:center;"> b </td>
  </tr>
  <tr>
   <td style="text-align:center;"> -0.79 </td>
   <td style="text-align:center;"> -0.06 </td>
   <td style="text-align:center;"> 0.65 </td>
   <td style="text-align:center;"> -1.15 </td>
   <td style="text-align:center;"> -0.91 </td>
   <td style="text-align:center;"> c </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 0.93 </td>
   <td style="text-align:center;"> 0.41 </td>
   <td style="text-align:center;"> 0.27 </td>
   <td style="text-align:center;"> -0.62 </td>
   <td style="text-align:center;"> 0.05 </td>
   <td style="text-align:center;"> d </td>
  </tr>
  <tr>
   <td style="text-align:center;"> -1.12 </td>
   <td style="text-align:center;"> -2.61 </td>
   <td style="text-align:center;"> 0.02 </td>
   <td style="text-align:center;"> 1.46 </td>
   <td style="text-align:center;"> -1.11 </td>
   <td style="text-align:center;"> e </td>
  </tr>
  <tr>
   <td style="text-align:center;"> -1.07 </td>
   <td style="text-align:center;"> -0.06 </td>
   <td style="text-align:center;"> 0.09 </td>
   <td style="text-align:center;"> -0.20 </td>
   <td style="text-align:center;"> 0.02 </td>
   <td style="text-align:center;"> f </td>
  </tr>
  <tr>
   <td style="text-align:center;"> -1.49 </td>
   <td style="text-align:center;"> -0.05 </td>
   <td style="text-align:center;"> 0.52 </td>
   <td style="text-align:center;"> -0.30 </td>
   <td style="text-align:center;"> 0.99 </td>
   <td style="text-align:center;"> g </td>
  </tr>
  <tr>
   <td style="text-align:center;"> -1.14 </td>
   <td style="text-align:center;"> -0.23 </td>
   <td style="text-align:center;"> 0.24 </td>
   <td style="text-align:center;"> -1.42 </td>
   <td style="text-align:center;"> -1.29 </td>
   <td style="text-align:center;"> h </td>
  </tr>
  <tr>
   <td style="text-align:center;"> -0.29 </td>
   <td style="text-align:center;"> -0.43 </td>
   <td style="text-align:center;"> 0.68 </td>
   <td style="text-align:center;"> 1.67 </td>
   <td style="text-align:center;"> 0.69 </td>
   <td style="text-align:center;"> i </td>
  </tr>
  <tr>
   <td style="text-align:center;"> -1.56 </td>
   <td style="text-align:center;"> -0.51 </td>
   <td style="text-align:center;"> -0.04 </td>
   <td style="text-align:center;"> -0.35 </td>
   <td style="text-align:center;"> -1.67 </td>
   <td style="text-align:center;"> j </td>
  </tr>
</tbody>
</table>

Come si vede abbiamo colonne con un nome che contengono sia numeri che caratteri. Questo non era chiaramente possibile con le matrici.

## Creazione di un dataframe

Il comando per creare un dataframe è il comando `data.frame()` tuttavia la creazione è leggermente diversa rispetto alla matrice. Pensando all'analogia con il foglio di calcolo Excel, intuitivamente è più facile immaginare la creazione di una dataframe mettendo insieme colonne relativamente indipendenti (dove una può contenere dei nomi, un'altra delle date e così via) piuttosto che un insieme di numeri inseriti per riga o per colonna come per le matrici.

Infatti il modo di creare un `dataframe` è priprio questo ovvero specificando `nomecolonna = valori` all'interno del comando `data.frame()`. Vediamo un esempio in R:


```r

dat <- data.frame(
  
  Id = c("subj_1","subj_2","subj_3"),
  age = c(21,23,19),
  sex = c("F","M","F"),
  item1 = c(2,1,1),
  item2 = c(0,2,1),
  item3 = c(2,0,1)
  
)

dat
##       Id age sex item1 item2 item3
## 1 subj_1  21   F     2     0     2
## 2 subj_2  23   M     1     2     0
## 3 subj_3  19   F     1     1     1
```

In questo caso abbiamo creato un ipotetico dataframe dove in ogni riga abbiamo un soggetto e ogni colonna rappresenta una data caratteristica del soggetto come il genere, l'età e così via.

Un aspetto importante adesso è proprio quello che il dataframe è stato pensato per gestire dati complessi ed eterogenei come quelli che si trovano in un'analisi di dati reale. Una convenzione molto utile da ricordare infatti è quella che le righe di un dataframe rappresentano le **osservazioni** (ad esempio persone) e le colonne rappresentano **variabili** ovvero delle proprietà misurate su quelle osservazioni.

Una distinzione fondamentale nella pratica di analisi dei dati è quella tra dati in forma **long** (oppure lunga) o dati in forma **wide** (oppure larga). Non c'è un formato corretto o sbagliato ma dipende dal tipo di analisi e dal software o pacchetto che si utilizza. Alcune operazioni o analisi richiedono il dataset in forma **long** altre in forma **wide**. Mantenendo l'esempio di soggetti e caratteristiche misurate sui soggetti i due formati sono definiti come:

- **Wide**: ogni singola riga rappresenta un soggetto e ogni sua risposta o variabile misurata sarà riportata in una diversa colonna. Il dataset creato in precedenza era infatti proprio nel formato wide:


```r
data_wide<-data.frame(
  Id=c("subj_1","subj_2","subj_3"),
  age=c(21,23,19),
  sex=c("F","M","F"),
  item_1=c(2,1,1),
  item_2=c(0,2,1),
  item_3=c(2,0,1)
  )

data_wide
##       Id age sex item_1 item_2 item_3
## 1 subj_1  21   F      2      0      2
## 2 subj_2  23   M      1      2      0
## 3 subj_3  19   F      1      1      1
```

- **Long**: ogni singola riga rappresenta una singola osservazione. Quindi i dati di ogni soggetto saranno riportati su più righe e le variabili che non cambiano tra le osservazioni saranno ripetute.


```r
data_long<-data.frame(Id=rep(c("subj_1","subj_2","subj_3"),each=3),
                      age=rep(c(21,23,19),each=3),
                      sex=rep(c("F","M","F"),each=3),
                      item=rep(1:3,3),
                      response=c(2,1,1,0,2,1,2,0,1))
data_long
##       Id age sex item response
## 1 subj_1  21   F    1        2
## 2 subj_1  21   F    2        1
## 3 subj_1  21   F    3        1
## 4 subj_2  23   M    1        0
## 5 subj_2  23   M    2        2
## 6 subj_2  23   M    3        1
## 7 subj_3  19   F    1        2
## 8 subj_3  19   F    2        0
## 9 subj_3  19   F    3        1
```
Come potete vedere, nel dataset in forma **long** ogni soggetto ha 3 righe perchè oltre al genere e l'età che sono uniche, ci sono 3 variabili diverse misurate sulla stessa persona.

:::{.tip title="Long o Wide?" data-latex="[Long o Wide?]"}
I dati in forma long e wide hanno delle proprietà diverse sopratutto in riferimento all'utilizzo. La tipologia di dato e il risultato finale è esattamente lo stesso tuttavia alcuni software o alcuni pacchetti di R funzionano solo con dataset organizzati in un certo modo.
Il consiglio però è di abituarsi il più possibile a ragionare in forma **long** perchè la maggior parte dei moderni pacchetti per l'analisi dati e per la creazione di grafici richiedono i dati in questo formato. Ci sono comunque delle funzioni (più avanzate) per passare velocemente da un formato all'altro.
:::

Come per le `matrici`, anche i dataframe richiedono che tutte le colonne (variabili) abbiano lo stesso numero di elementi.

**Nota:** di default R considera una variabile stringa all'interno di un DataFrame come una variabile categoriale. E' possibile cambiare questa opzione specificando `stringsAsFactors=FALSE`.

### Esercizi {-}

1. Crea il dataframe `data_wide` riportato precedentemente
2. Crea il dataframe `data_long` riportato precedentemente

## Proprietà di un dataframe

In modo simile alle matrici, i dataframe contengono dei metadati per assegnare dei nomi alle righe `rownames()` e alle colonne `colnames()`. Inoltre il dataframe ha una dimensione intesa come numero di righe e colonne esattamente come la matrice. Di default il dataframe richiede dei nomi solo alle colonne ma è possibile anche nominare le righe. Utilizzando il dataframe precedente:


```r
data_long
##       Id age sex item response
## 1 subj_1  21   F    1        2
## 2 subj_1  21   F    2        1
## 3 subj_1  21   F    3        1
## 4 subj_2  23   M    1        0
## 5 subj_2  23   M    2        2
## 6 subj_2  23   M    3        1
## 7 subj_3  19   F    1        2
## 8 subj_3  19   F    2        0
## 9 subj_3  19   F    3        1

# Controllo dei nomi

rownames(data_long)
## [1] "1" "2" "3" "4" "5" "6" "7" "8" "9"
colnames(data_long)
## [1] "Id"       "age"      "sex"      "item"     "response"
names(data_long) # nel caso dei dataframe questo è analogo a colnames()
## [1] "Id"       "age"      "sex"      "item"     "response"

# Dimensioni

nrow(data_long)
## [1] 9
ncol(data_long)
## [1] 5
```

## Indicizzazione di dataframe

Ancora di più che per le matrici, è nell'indicizzazione che si vede la vera potenza dei dataframe. Rimandendo su un'indicizzazione tramiti indici di riga e colonna il funzionamento è esattamente analogo a quello della matrice, quindi `dataframe[riga, colonna]`:


```r
data_long
##       Id age sex item response
## 1 subj_1  21   F    1        2
## 2 subj_1  21   F    2        1
## 3 subj_1  21   F    3        1
## 4 subj_2  23   M    1        0
## 5 subj_2  23   M    2        2
## 6 subj_2  23   M    3        1
## 7 subj_3  19   F    1        2
## 8 subj_3  19   F    2        0
## 9 subj_3  19   F    3        1

# Seleziono 1 riga e 4 colonna

data_long[1,4]
## [1] 1

# Seleziono 1 riga e tutte le colonne

data_long[1, ]
##       Id age sex item response
## 1 subj_1  21   F    1        2

# Seleziono righe 1 e 3 e tutte le colonne

data_long[c(1,3), ]
##       Id age sex item response
## 1 subj_1  21   F    1        2
## 3 subj_1  21   F    3        1
```

La reale differenza tra matrici e dataframe sta nel poter accedere direttamente alle colonne tramite il loro nome e utilizzando l'operatore `$`. Con la scrittura `dataframe$nomevariabile` accediamo direttamente a quella specifica colonna senza utilizzare indici e parentesi quadre.


```r

# Seleziono la variabile ID (soggetto)
data_long$Id
## [1] "subj_1" "subj_1" "subj_1" "subj_2" "subj_2" "subj_2" "subj_3" "subj_3"
## [9] "subj_3"

# Seleziono la variabile Sex
data_long$sex
## [1] "F" "F" "F" "M" "M" "M" "F" "F" "F"

# Analogalmente
data_long[, 1] # seleziono id con indice di colonna
## [1] "subj_1" "subj_1" "subj_1" "subj_2" "subj_2" "subj_2" "subj_3" "subj_3"
## [9] "subj_3"
data_long[, 3] # seleziono sex con indice di colonna
## [1] "F" "F" "F" "M" "M" "M" "F" "F" "F"
```

Un ulteriore differenza rispetto alle matrici è quella della **combinazione di dataframe** o della **creazione di nuove righe o colonne**. Sono sempre valide le indicazioni riguardo a `cbind()` e `rbind()` ma nel caso di nuove colonne è possibile utilizzare l'operatore `$`. Con la scrittura `dataframe$name <- new_var` otteniamo che nel dataframe in oggetto ci sarà una nuova colonna chiamata `name` che prende i valori all'interno di `new_var`. 

Attenzione che mentre la scrittura `dataframe$name <- new_var` aggiunge direttamente la colonna al dataframe, usando `cbind()` dobbiamo assegnare l'operazione ad un nuovo oggetto `dataframe <- cbind(dataframe, new_var)`. In quest'ultimo caso il nome della colonna sarà `new_var`. Se vogliamo anche rinominare la colonna possiamo usare la sintassi `cbind(dataframe, "nome" = new_var)` oppure chiamare l'oggetto direttamente con il nome desiderato:


```r
data_wide
##       Id age sex item_1 item_2 item_3
## 1 subj_1  21   F      2      0      2
## 2 subj_2  23   M      1      2      0
## 3 subj_3  19   F      1      1      1

# Aggiungiamo una colonna item4 al nostro dataset

new_var <- c(3, 4, 7)

data_wide$item_4 <- new_var

# Equivalente a

data_wide$item_4 <- c(3, 4, 7)

# Equivalente a 

cbind(data_wide, new_var) # senza specificare il nome
##       Id age sex item_1 item_2 item_3 item_4 new_var
## 1 subj_1  21   F      2      0      2      3       3
## 2 subj_2  23   M      1      2      0      4       4
## 3 subj_3  19   F      1      1      1      7       7
cbind(data_wide, "item_4" = new_var) # specificando anche il nome
##       Id age sex item_1 item_2 item_3 item_4 item_4
## 1 subj_1  21   F      2      0      2      3      3
## 2 subj_2  23   M      1      2      0      4      4
## 3 subj_3  19   F      1      1      1      7      7
```

Leggermente più complessa (e inusuale) è l'aggiunta di righe ad un dataframe. Al contrario della matrice che di base non aveva nomi per le colonne e solo numeri o stringhe come tipologia di dato, per combinare per riga due dataframe dobbiamo avere:

* Lo stesso numero di colonne (come per le matrici)
* Lo stesso nome delle colonne tra i due dataframe


```r
data_wide
##       Id age sex item_1 item_2 item_3 item_4
## 1 subj_1  21   F      2      0      2      3
## 2 subj_2  23   M      1      2      0      4
## 3 subj_3  19   F      1      1      1      7

# Nuovo dataset con le stesse colonne ma chiamate in un modo diverso

new_row <- data.frame(
  Id = "subj_4",
  gender = "M", # gender invece che sex
  age = 44,
  item_1 = 2,
  item_2 = 7,
  item_3 = 3,
  item_4 = 1
)

new_row
##       Id gender age item_1 item_2 item_3 item_4
## 1 subj_4      M  44      2      7      3      1

rbind(data_wide, new_row) # Errore
## Error in match.names(clabs, names(xi)): names do not match previous names

# Nuovo dataset con le stesse colonne con il nome corretto

new_row <- data.frame(
  Id = "subj_4",
  sex = "M",
  age = 44,
  item_1 = 2,
  item_2 = 7,
  item_3 = 3,
  item_4 = 1
)

new_row
##       Id sex age item_1 item_2 item_3 item_4
## 1 subj_4   M  44      2      7      3      1

rbind(data_wide, new_row) # Corretto
##       Id age sex item_1 item_2 item_3 item_4
## 1 subj_1  21   F      2      0      2      3
## 2 subj_2  23   M      1      2      0      4
## 3 subj_3  19   F      1      1      1      7
## 4 subj_4  44   M      2      7      3      1
```

## Indicizzazione avanzata

Quello che avevamo accennato per le matrici rispetto all'indicizzazione avanzata per *nome* e per *operazioni logiche* qui è invece molto utile e rilevante. Quando trattiamo dati che non sono solo numerici e sopratutto hanno delle proprietà come "soggetti", "età", "genere", è intuitivo pensare un modo altrettanto logico e intuitivo di lavorare con queste strutture di dati. Per rendere il tutto più intuitivo facciamo un esempio con un dataset fittizio dove sono inseriti i nostri amici su Facebook ed alcune caratteristiche su di loro in particolare:

* Nome
* Età (`age`)
* Genere (`sex`)
* Data iscrizione a Facebook (`facebook`)
* Numero di fratelli/sorelle (`nsiblings`)
* Numero di foto assieme a noi (`foto`)

Vediamo il dataset in R:


```
##         nome age sex facebook nsiblings foto
## 1    Filippo  17   M       17         0   13
## 2    Claudio  51   M       51         4   14
## 3   Giovanni  55   M       55         2   11
## 4  Francesco  23   M       23         3   18
## 5      Luigi  18   M       18         5   17
## 6    Giacomo  34   M       34         1    2
## 7  Gianmarco  49   M       49         4   20
## 8      Bruna  47   F       47         3   12
## 9     Franco  44   M       44         3    7
## 10   Elettra  56   F       56         5    0
## 11     Livia  32   F       32         2    2
## 12      Anna  56   F       56         3    2
## 13      Luca  25   M       25         5    2
## 14    Giulia  52   F       52         4   18
## 15     Alice  42   F       42         4   15
```

Ora se volessimo usare l'indicizzazione standard possiamo semplicemente usare la sintassi solita `dataframe[riga/e, colonna/e]`. Tuttavia se volessimo trovare tutte le informazioni associate alla nostra amica **Elettra**, usare gli indici di riga/colonna diventa scomodo. Quello che è stato introdotto nei capitolo iniziali rispetto agli operatori logici qui diventa molto rilevante. Possiamo infatti "interrogare" il nostro dataframe dicendo di farci vedere tutte le informazioni che rispettano una specifica richiesta.

La sintassi "Tutte le informazioni riguardo Elettra" diventa **tutte le colonne (informazioni) solo per la riga dove il nome è Elettra**. In R questo può essere controllato in questo modo:


```r
# nomi sono nella colonna "nome"
dat$nome
##  [1] "Filippo"   "Claudio"   "Giovanni"  "Francesco" "Luigi"     "Giacomo"  
##  [7] "Gianmarco" "Bruna"     "Franco"    "Elettra"   "Livia"     "Anna"     
## [13] "Luca"      "Giulia"    "Alice"
```



```r
# Per sapere quale riga corrisponde ad elettra
dat$nome == "Elettra"
##  [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
## [13] FALSE FALSE FALSE

which(dat$nome == "Elettra") # Elettra è la riga 10
## [1] 10
```
Praticamente con `dat$nome == "Elettra"` otteniamo una serie di `TRUE` e `FALSE` in base a se il nome è "Elettra" oppure no. Combinando questo con l'indicizzazione classica `dataframe[riga/e, colonna/e]` possiamo usare gli operatori logici per interrogare il dataset.


```r
dat[dat$nome == "Elettra", ]
##       nome age sex facebook nsiblings foto
## 10 Elettra  56   F       56         5    0
```

Ora la sintassi `dataframe[riga/e, colonna/e]` assume un significato molto diverso ovvero:

```r
dataframe[operazioni_logiche_righe, operazioni_logiche_colonne]
```

Utilizzando gli operatori booleani **AND**(`$`) **OR**(`|`) e **NOT**(`!`) possiamo inoltre combinare più operazioni logiche insieme per ottenere indicizzazioni più complesse, ma sempre intuitive dal punto di vista della scrittura. Ad esempio: "Gli amici con età maggiore di 20 anni e con più di 5 foto assieme a noi". In questo caso un amico per ottenere un valore `TRUE` ed essere così inserito nei risultati deve rispettare due condizioni:


```r
dat[dat$age > 20 & dat$foto > 5, ]
##         nome age sex facebook nsiblings foto
## 2    Claudio  51   M       51         4   14
## 3   Giovanni  55   M       55         2   11
## 4  Francesco  23   M       23         3   18
## 7  Gianmarco  49   M       49         4   20
## 8      Bruna  47   F       47         3   12
## 9     Franco  44   M       44         3    7
## 14    Giulia  52   F       52         4   18
## 15     Alice  42   F       42         4   15
```

Possiamo chiaramente eseguire selezioni sulle colonne, per esempio sapere solo il numero di fratelli/sorelle degli amici che rispettano la condizione precedente:


```r
dat[dat$age > 20 & dat$foto > 5, "nsiblings"]
## [1] 4 2 3 4 3 3 4 4
```

Un ultimo aspetto da notare riguarda il tipo di output che otteniamo. Se la nostra selezione comprende più di 1 riga/colonna otteniamo un `dataframe` che è considerato un subset di quello iniziale. Se come nell'ultimo esempio otteniamo una singola colonna (o variabile) allora il risultato è un semplice vettore.


```r
res1 <- dat[dat$age > 20 & dat$foto > 5, ]
res2 <- dat[dat$age > 20 & dat$foto > 5, "nsiblings"]

str(res1) # è un dataframe
## 'data.frame':	8 obs. of  6 variables:
##  $ nome     : chr  "Claudio" "Giovanni" "Francesco" "Gianmarco" ...
##  $ age      : int  51 55 23 49 47 44 52 42
##  $ sex      : chr  "M" "M" "M" "M" ...
##  $ facebook : int  51 55 23 49 47 44 52 42
##  $ nsiblings: int  4 2 3 4 3 3 4 4
##  $ foto     : int  14 11 18 20 12 7 18 15
str(res2) # è un vettore
##  int [1:8] 4 2 3 4 3 3 4 4
```

Allo stesso modo di selezionare una specifica colonna o riga possiamo eliminare una osservazione. Il concetto di eliminazione o sovrascrittura in R è diverso da quello di un normale file perchè tutte le operazioni che facciamo solitamente portano a tre strade:

1. Eseguiamo le operazioni in modalità "volatile" senza assegnare il risultato
2. Creiamo un nuovo oggetto `B` che deriva da applicare ad `A` una certa operazione `B <- funzione(A)`
3. Assegnamo ad `A` una serie di operazioni su se stesso, di fatto sovrascrivendo l'oggetto `A <- funzione(A)`

Nel caso dei dataframe possiamo usare l'operatore `-` (meno) per escludere una certa selezione:


```
##       Id age sex item_1 item_2 item_3 item_4
## 2 subj_2  23   M      1      2      0      4
## 3 subj_3  19   F      1      1      1      7
##       Id age item_1 item_2 item_3 item_4
## 1 subj_1  21      2      0      2      3
## 2 subj_2  23      1      2      0      4
## 3 subj_3  19      1      1      1      7
##       Id sex item_1 item_2 item_3 item_4
## 2 subj_2   M      1      2      0      4
```

E' possibile anche escludere (ed eliminare in un certo senso) delle informazioni usando gli operatori logici in gli operatori **NOT**(`!`) e diverso da (`!=`):


```r

# Seleziono tutto tranne il soggetto 2

data_wide[!data_wide$Id == "subj_2", ] # modo 1
##       Id age sex item_1 item_2 item_3 item_4
## 1 subj_1  21   F      2      0      2      3
## 3 subj_3  19   F      1      1      1      7

data_wide[data_wide$Id != "subj_2", ] # modo 2
##       Id age sex item_1 item_2 item_3 item_4
## 1 subj_1  21   F      2      0      2      3
## 3 subj_3  19   F      1      1      1      7
```


:::{.warning title="Attenzione ad eliminare" data-latex="[Attenzione ad eliminare]"}
L'utilizzo dell'operatore `-` è sempre in qualche modo pericoloso, sopratutto se l'oggetto che viene creato (o sovrascritto) viene poi utilizzato in altre operazioni. Eliminare delle informazioni, tranne quando è veramente necessario, non è mai una buona cosa. Se dovete selezionare una parte dei dati è sempre meglio creare un nuovo dataframe (o un nuovo oggetto in generale) e mantendere una versione di quello originale sempre disponibile. 
:::

Nella tabella \@ref(tab:frame-tab) è contenuto un riassunto delle principali operazioni che si possono eseguire con i dataframe:

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:frame-tab)Operazioni con dataframe</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Operazione </th>
   <th style="text-align:left;"> Nome </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> nome_DataFrame &lt;- cbind(nome_DataFrame, nuova_variabile) <br> nome_DataFrame$nome_variabile &lt;- dati </td>
   <td style="text-align:left;"> Per aggiungere una nuova variabile al DataFrame (deve avere lo stesso numero di righe) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nome_DataFrame &lt;- rbind(nome_DataFrame, nuova_variabile) </td>
   <td style="text-align:left;"> Per aggiungere delle osservazioni (i nuovi dati devono essere coerenti con la struttura del DataFrame) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nrow(nome_DataFrame) </td>
   <td style="text-align:left;"> Per valutare il numero di osservazioni del DataFrame </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ncol(nome_DataFrame) </td>
   <td style="text-align:left;"> Per valutare il numero di variabili del DataFrame </td>
  </tr>
  <tr>
   <td style="text-align:left;"> holder(nome_DataFrame) </td>
   <td style="text-align:left;"> Nomi delle colonne del DataFrame </td>
  </tr>
  <tr>
   <td style="text-align:left;"> rownames(nome_DataFrame) </td>
   <td style="text-align:left;"> Nomi delle righe del DataFrame </td>
  </tr>
</tbody>
</table>


### Esercizi {-}

Facendo riferimento ai dataframe `data_long` e `data_wide`: 

1. Utilizzando gli **indici numerici** di riga e di colonna seleziona i dati del soggetto `subj_2` riguardanti le variabili `item` e `response` dal DataFrame `data_long`.
2. Compi la stessa selezione dell'esercizio precedente usando però questa volta una condizione logica per gli indici di riga e indicando direttamente il nome delle variabili per gli indici di colonna.
3. Considerando il DataFrame `data_wide` seleziona le variabili `Id` e `sex` dei soggetti che hanno risposto 1 alla variabile `item_1`.
4. Considerando il DataFrame `data_long` seleziona solamente i dati riguardanti le ragazze con etè superiore ai 20 anni.
5. Elimina dal DataFrame `data_long` le osservazioni riguardanti il soggetto `subj_2` e la variabile `"sex"`.
6. Aggiungi sia al DataFrame `data_wide` che `data_long` la variabile numerica `"memory_pre"`.

```r
data.frame(Id=c("subj_1","subj_2","subj_3"),
                      memory_pre=c(3,2,1))
```

7. Aggiungi sia al DataFrame `data_wide` che `data_long` la variabile categoriale `"gruppo"`.


```r
data.frame(Id=c("subj_1","subj_2","subj_3"),
                      gruppo=c("trattamento","trattemento","controllo"))
```

8. Aggiungi al DataFrame `data_wide` i dati del soggetto `subj_4` e `subj_5`.


```r
data.frame(Id=c("subj_4","subj_5"),
           age=c(25,22),
           sex=c("F","M"),
           item_1=c(1,1),
           item_2=c(0,1),
           item_3=c(2,0),
           memory_pre=c(1,3),
           gruppo=c("trattemento","controllo"))
```

9. Considerando il DataFrame `datawide` calcola la variabile `"memory_post"` data dalla somma degli item.
10. Considerando il DataFrame `data_wide` cambia i nomi delle variabili `item_1`, `item_2` e `item_3` rispettivamente in `problem_1`, `problem_2` e `problem_3`.

<!--
## Funzioni con DataFrames

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-21)Operazioni con matrici</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Operazione </th>
   <th style="text-align:left;"> Nome </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> nome_DataFrame &lt;- cbind(nome_DataFrame, nuova_variabile) <br> nome_DataFrame$nome_variabile &lt;- dati </td>
   <td style="text-align:left;"> Per aggiungere una nuova variabile al DataFrame (deve avere lo stesso numero di righe) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nome_DataFrame &lt;- rbind(nome_DataFrame, nuova_variabile) </td>
   <td style="text-align:left;"> Per sggiungere delle osservazioni (i nuovi dati devono essere coerenti con la struttura del DataFrame) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nrow(nome_DataFrame) </td>
   <td style="text-align:left;"> Per valutare il numero di osservazioni del DataFrame </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ncol(nome_DataFrame) </td>
   <td style="text-align:left;"> Per valutare il numero di variabili del DataFrame </td>
  </tr>
  <tr>
   <td style="text-align:left;"> holder(nome_DataFrame) </td>
   <td style="text-align:left;"> Nomi delle colonne del DataFrame </td>
  </tr>
  <tr>
   <td style="text-align:left;"> rownames(nome_DataFrame) </td>
   <td style="text-align:left;"> Nomi delle righe del DataFrame </td>
  </tr>
</tbody>
</table>

### Esercizi {-}

1. Aggiungi sia al DataFrame `data_wide` che `data_long` la variabile numerica `"memory_pre"`.

```r
data.frame(Id=c("subj_1","subj_2","subj_3"),
                      memory_pre=c(3,2,1))
```

2. Aggiungi sia al DataFrame `data_wide` che `data_long` la variabile categoriale `"gruppo"`.

```r
data.frame(Id=c("subj_1","subj_2","subj_3"),
                      gruppo=c("trattamento","trattemento","controllo"))
```
3. Aggiungi al DataFrame `data_wide` i dati del soggetto `subj_4` e `subj_5`.

```r
data.frame(Id=c("subj_4","subj_5"),
           age=c(25,22),
           sex=c("F","M"),
           item_1=c(1,1),
           item_2=c(0,1),
           item_3=c(2,0),
           memory_pre=c(1,3),
           gruppo=c("trattemento","controllo"))
```
4. Considerando il DataFrame `datawide` calcola la variabile `"memory_post"` data dalla somma degli item.
5. Considerando il DataFrame `data_wide` cambia i nomi delle variabili `item_1`, `item_2` e `item_3` rispettivamente in `problem_1`, `problem_2` e `problem_3`.
-->
