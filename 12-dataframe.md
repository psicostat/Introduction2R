# Dataframe {#dataframe}




Working in progress.

## Creazione di DataFrames

Uno degli oggetti più utilizzati in R sono i DataFrames. I DataFrames permettono di raccogliere all'interno di uno stesso oggetto vettori di diverso tipo (i.e., vettori numerici, logici, fattori o stringhe di caratteri). Per questo motivo, i DataFrames sono  utili per riportare tutti i dati riguardanti le diverse variabili misurate in un esperimento.

In genere ogni riga di un DataFrames rappresenta una singola osservazione e nelle colonne sono riportate i vari valori delle variabili misurate.

Esistono due formati principali di DataFrames:

- **Wide**: ogni singola riga rappresenta un soggetto e ogni sua risposta o variabile misurata sarà riportata in una diversa colonna.


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

In R per definire un DataFrame si utilizza il comando:

`<nome-DataFrame> <- data.frame(variabile_1=c(...), ..., variabile_s=c(...))`

All'interno vanno riportate le variabili che  si vogliono inserire separate da virgole. Ogni variabile deve avere la **stessa lunghezza**.

**Nota:** di default R considera una variabile stringa all'interno di un DataFrame come una variabile categoriale. E' possibile cambiare questa opzione specificando `stringsAsFactors=FALSE`.


### Esercizi {-}

1. Crea il dataframe `data_wide` riportato precedentemente
2. Crea il dataframe `data_long` riportato precedentemente

## Selezione di Elementi di un DataFrame

In R per selezioneare gli elementi di un DataFrame si può, analogamente alle matrici, indicare all'interno delle parentesi quadre l'indice di riga e l'indice di colonna (**separati da virgola**).

`<nome-DataFrame>[indice_riga , indice_colonna]`

Per accedere ad una specifica  variabile del DataFrame è possibile utilizzare l'operatore "$":

`<nome-DataFrame>$<nome-variabile>`

Per quanto riguarda l'indice di riga è possibile definire una condizione logica rispetto ad una variabile, mentre per l'indice di colonna si può indicare il nome delle  variabili:

`<nome-DataFrame>[condizione_logica , c("variabile_1", ..., "variebile_s")]`

**Nota:** per selezionare tutti gli elementi di una data riga basta lasciare vuoto l'indice di colonna.

**Esempio:** `data_wide[data_wide$sex=="F", c("Id","age")]`

### Esercizi {-}

1. Utilizzando gli **indici numerici** di riga e di colonna selziona i dati del soggetto `subj_2` riguardanti le variabili `item` e `response` dal DataFrame `data_long`.
2. Compi la stessa selezione dell'esercizio precedente usando però questa volta una condizione logica per gli indici di riga e indicando direttamente il nome delle variabili per gli indici di colonna.
3. Considerando il DataFrame `data_wide` seleziona le variabili `Id` e `sex` dei soggetti che hanno risposto 1 alla variabile `item_1`.
4. Considerando il DataFrame `data_long` seleziona solamente i dati riguardanti le ragazze con etè superiore ai 20 anni.
5. Elimina dal DataFrame `data_long` le osservazioni riguardanti il soggetto `subj_2` e la variabile `"sex"`.

## Funzioni con DataFrames

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:table-dataframe-operators)Operazioni con matrici</caption>
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


**Nota:** E' possibile assegnare nomi alle colonne e righe di un DataFrame allo stesso modo delle matrici, atttraverso i comandi


```r
colnames(nome_DataFrame)<-c("nome_1",...,"nome_s")
names(nome_DataFrame)<-c("nome_1",...,"nome_s")
rownames(nome_DataFrame)<-c("nome_1",...,"nome_n")
```

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


    


