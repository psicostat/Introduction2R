# Fattori {#factor}




In questo capitolo vedremo i *fattori*, una speciale tipologia di vettori utilizzata per salvare informazioni riguardanti una variabile categoriale (nominale o ordinale). Tuttavia, prima di introdurre i fattori, descriveremo che cosa sono gli attributi di un oggetto. Questi ci permetteranno successivamente di capire meglio il funzionamento dei fattori.


## Attributi di un Oggetto {#attributes}

In R, gli oggetti possiedono quelli che sono definiti *attributi*, ovvero delle utili informazioni riguardanti l'oggetto stesso, una sorta di *metadata*. Queste informazioni non interferiscono con i valori contenuti negli oggetti nè vengono normalmente mostrati nell'output di un oggetto. Tuttavia, si rivelano particolarmente utili in alcune circostanze e permettono di fornire speciali informazioni associate ad un determinato oggetto.

Gli oggetti possiedono diversi attributi a seconda della loro tipologia. Tuttavia, tra quelli principalmente usati troviamo:

- **Classe** (`class`) - la classe (o tipologia) di un oggetto. Ci permette di verificare la tipologia di struttura dati di un particolare oggetto.
- **Nomi** (`names`) -  nomi degli elementi di un oggetto. Permette ad esempio di assegnare dei nomi agli elementi un vettore o alle righe e colonne di una matrice o dataframe.
- **Dimensione** (`dim`) - la dimensione dell'oggetto. Questo attributo non è disponibile per i vettori ma sarà particolarmente importante nel caso delle matrici e dataframe.

Per valutare ee eventualmente modifiacare gli attributi di un oggetto esistono delle specifiche funzioni dedicate. Ad esempio abbiamo:

- `attributes()` - elenca tutti gli attributi di un oggetto
- `class()` - accede all'attributo `class` di un oggetto
- `names()` - accede all'attributo `names` di un oggetto
- `dim()` - accede all'attributo `dim` di un oggetto

Vediamo ora alcuni utilizzi degli attributi con i vettori. Gli attributi nel caso delle altre tipologie di oggetti, invece, saranno trattati nei rispettivi capitoli. 


### Attributi di un Vettore

Vediamo come inizialmente un generico vettore non possiede alcun attributo vettore.


```r
my_vector <- 1:10

attributes(my_vector)
## NULL
```


#### Classe {-}

Eseguendo la funzione `class()`, tuttavia, otteniamo comunque la precisa tipologia di vettore, nel presente caso `"integer"`.


```r
class(my_vector)
## [1] "integer"
```

#### Dimensione {-}

Abbiamo anticipato come l'attributo `dim` non sia disponibile per i vettori, mentre diverrà molo importante nel caso di matrici e dataframe. Tuttavia un analogo valore della dimensione di un vettore è dato dalla sua lunghezza, valutata con la funzione `length()`.


```
## NULL
## [1] 10
```

#### Nomi Elementi{-}

Inizialmente gli elementi di un vettore non possiedono nomi.


```r
names(my_vector)
## NULL
```

Per impostare i nomi degli elementi, sarà quindi necessario assegnare a `names(nome_vettore)` un vettore di caratteri, contenente i nomi desiderati, della stessa lunghezza del vettore che stiamo rinominando.


```r
names(my_vector) <- paste0("Item_", 1:10)
my_vector
##  Item_1  Item_2  Item_3  Item_4  Item_5  Item_6  Item_7  Item_8  Item_9 Item_10 
##       1       2       3       4       5       6       7       8       9      10
```

Questa procedura ci pemette di ottenere quello che viene definito un *named vector*. Possiamo vedere come i nomi degli elementi compaiano ora tra gli attributi dell'oggetto.


```
## $names
##  [1] "Item_1"  "Item_2"  "Item_3"  "Item_4"  "Item_5"  "Item_6"  "Item_7" 
##  [8] "Item_8"  "Item_9"  "Item_10"
```

:::{.trick title="Selezione Named Vectors" data-latex="[Selezione Named Vectors]"}
Una particolare utlizzo dei named vectors riguarda la selezione dei valori tramite i nomi degli elementi. Nota che per un corretto funzionameto è necessario che tutti gli elementi possiedano nomi differenti.


```r
my_vector[c("Item_3", "Item_5")]
## Item_3 Item_5 
##      3      5
```

Nel caso dei vettori questo approccio è raramente utilizzato mentre vedremo che sarà molto comune per la selezione delle variabili di un dataframe.
:::

## Fattori

I fattori sono quindi una speciale tipologia di vettori che, attraverso l'uso degli attributi, permettono di salvare in modo efficiente le variabili categoriali (nominali o ordinali). Il comando usato per creare un fattore in R è `factor()` e contiene diversi argomenti:


```r
nome_fattore <- factor(x, levels = , ordered = FALSE)
```

- `x` - i dati della nostra variabile categoriale
- `levels`- i possibili livelli della nostra variabile categoriale
- `ordered` - valore logico che indica se si tratta di una variabile nominale (`FALSE`) o ordinale (`TRUE`)

Ad esempio potremmo creare la variabile `colore_occhi` in cui registrare il colore degli occhi dei membri di una classe:

```r
# Creo i dati
my_values <- rep(c("verde", "marrone", "azzurro"), times = 3)
my_values
## [1] "verde"   "marrone" "azzurro" "verde"   "marrone" "azzurro" "verde"  
## [8] "marrone" "azzurro"

# Creo il fattore
my_factor <- factor(my_values)
my_factor
## [1] verde   marrone azzurro verde   marrone azzurro verde   marrone azzurro
## Levels: azzurro marrone verde
```

Nota come non sia necessario specificare l'argomento `levels`. I livelli della variabile, infatti, vengono determinati automaticamente a partire dai dati presenti e ordinati in ordine alfabetico. Tuttavia, specificare i livelli nella creazione di un fattore ci permette di definire a piacere l'ordine dei livelli ed anche includere eventuali livelli non presenti nei dati.

### Funzionamento Fatori

Cerchiamo ora di capire meglio la struttura dei fattori e l'utilizzo degli attributi. 


```r
attributes(my_factor)
## $levels
## [1] "azzurro" "marrone" "verde"  
## 
## $class
## [1] "factor"
```

Vediamo come la classe dell'oggetto sia `factor` e abbiamo aunceh un ulteriore attributo `levels` dove sono salvati i posibili livelli della nostra variabile. Ma attenzione adesso a cosa otteniamo quando valutiamo la tipologia di dati contenuti nel fattore e la sua sruttura.


```r
# Tipologia dati
typeof(my_factor)
## [1] "integer"

# Sstrutura
str(my_factor)
##  Factor w/ 3 levels "azzurro","marrone",..: 3 2 1 3 2 1 3 2 1
```

Ci saremmo aspettati di ottenere `character` pensando che all'interno del fattore fossero salvati vari valori della nostra variabile come stringhe. Invece il fattore è formato da `integer` e possimao osservare come effetivamente l'output del comando `str()` riporta dei valori numerici (oltre ai livelli della variabile). Come spiegarsi tutto questo?

La soluzione è molto semplice. Nel creare un fattore, R valuta i livelli presennti creando l'attributo `levels` e poi sostituisce ad ogni elemento un valore numerico che indica il livello della variabile. Pertanto nel nostro esempio avremmo che il valore `1` è associato al livello `"azzurro"`, il valore `2` a `"marrone"` e il valore `3` a `"verde"`. Questo approccio permette di ottimizzare l'uso della memoria tuttavia inizialmete potrebbe risultare poco intuitivo e causa di errori.

:::{.warning title="Attenti alla Conversione" data-latex="[Attenti alla Conversione]"}
Uno dei principali errori riguarda la conversione da un fattore ad un normale vettore.  Nel caso volessimo ottenere un vettore di caratteri possimo usare la funzione `as.character()` ottenendo il risultato voluto.

```r
as.character(my_factor)
## [1] "verde"   "marrone" "azzurro" "verde"   "marrone" "azzurro" "verde"  
## [8] "marrone" "azzurro"
```
Tuttavia, se volessimo ottenere un vettore numerico, dobbiamo prestare particolare attenzione. Considera il seguente esempio dove abbiamo gli anni di istruzione di alcuni partecipanti ad uno studio. Potremmo eseguire alcune analissi considerando questa variable come categoriale per poi ritrasformarla in una variebile numerica per compiere altre analisi. Osserva cosa succede

```r
# Creo la mia variabile come fattore
school_years<-factor(c(11, 8, 4, 8, 11, 4, 11, 8))
school_years
## [1] 11 8  4  8  11 4  11 8 
## Levels: 4 8 11

# Trasformo in un vettore numerico
as.numeric(school_years)
## [1] 3 2 1 2 3 1 3 2
```
In modo forse inaspettato non otteniamo i valori originali (i.e., 4, 8, 11) ma dei valori differenti. Questi in realtà sono i valori numerici che R ha usato per associare ogni elemento al corripondente livello. Per ottenre i valori corretti dobbiamo eseguire il seguente comando:

```r
as.numeric(as.character(school_years))
## [1] 11  8  4  8 11  4 11  8
```
Questo ci permette di sostituire prime i valori con le giuste *etichette*, ovvero i livelli della variabile, e successivamente convertire il tutto in un vettore numerico.

E' importante prestare molta attenzione in questi casi poichè un eventuale errore potrebbe non risultare subito evidente.
:::

### Operazioni Fattori

Ora che abbiamo capito il funzionamento dei fattori vediamo alcune comuni operazioni.


#### Rinominare i Livelli {-}

E possibile rinominare i livelli di un fattore  utilizzando la funzione `labels()` quesa ci permette di accedere agli attuali livelli ed eventualmente ssostituirli.


```r
my_factor
## [1] verde   marrone azzurro verde   marrone azzurro verde   marrone azzurro
## Levels: azzurro marrone verde
# Attuli livelli
levels(my_factor)
## [1] "azzurro" "marrone" "verde"

# Rinomino i livelli
levels(my_factor) <- c("brown", "blue", "green")
my_factor
## [1] green blue  brown green blue  brown green blue  brown
## Levels: brown blue green
```

#### Ordinare i Livelli {-}

E' importante non confondere l'ordinare i livelli con il rinominarli. Infatti, mentre nel primo caso viene solo modificato l'ordine dei livelli, nel secondo caso verrebbero modificati anche tutti gli effettivi valori degli elementi. In genere è preferibile quindi ridefinire il fattore specificando l'argomento `levels`. 

Vediamo un esempio dove raccogliamo i dati riguardanti i dosaggi di un farmaco:


```r
dosage <- factor(rep(c("medium", "low", "high"), times = 2))
dosage
## [1] medium low    high   medium low    high  
## Levels: high low medium
```

Non avendo specificato l'attributo `levels` i livelli siano stati definiti automaticamente in ordine alfabetico. Osserviamo cosa succede se per erroe rinominiamo i livelli invece di riordinarli correttamente.


```r
# Creo una copia
dosage_wrong <- dosage

# ERRORE: rinomino i livelli
levels(dosage_wrong) <- c("low", "medium", "high")
dosage_wrong
## [1] high   medium low    high   medium low   
## Levels: low medium high
```

Nota come questo sia un grave errore poichè rinominado i livelli abbiamo modificato anche gli effettivi valori degli elementi. Adesso i valori sono tutti diversi e insensati.

Per riordinare corretamente i livelli riutilizziamo la funzione `factor()` specificando i livelli nell'ordine desiderato.

```r
dosage <- factor(dosage, levels = c("low", "medium", "high"))
dosage
## [1] medium low    high   medium low    high  
## Levels: low medium high
```
Così facendo abbiamo riordinato i livelli a nostro piacimento senza modificare gli effettivi valori.

#### Extra {-}

Sono possibili diverse operazioni con i fattori. Ad esempio, possiamo essere interessati a eliminare un certo livello di un fattore:

- se facciamo un subset di un fattore e non abbiamo più valori associati a quel livello
- se vogliamo semplicemente rimuovere un livello e le rispettive osservazioni

In questi casi possiamo usare la funzione `droplevels(x, exclude = ...)` che permette di rimuovere determinati livelli:


```
## [1] "a" "b" "c"
## [1] "a" "b" "c"
```

Come vedete nonostante non ci siano più valori `c`, abbiamo il fattore ha comunque associati tutti i valori iniziali:


```
##  [1] a a a a a a a a a a b b b b b
## Levels: a b
```

Possiamo anche direttamente eliminare un livello ma in corrispondenza dei valori associati avremmo degli `NA`:


```
## [1] b b b b b c c
## Levels: b c
```

Come è possibile eliminare un livello, è anche possibile aggiungere un livello ad un fattore usando semplicemente il comando `factor()` e specificando tutti i livello più quello/i aggiuntivi:


```
##  [1] <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> b    b    b    b    b   
## [16] c    c   
## Levels: b c nuovolivello
```

In questo caso abbiamo usato la funzione `c(vecchi_livelli, nuovo_livello)` per creare un vettore di nuovi livelli da usare in questo caso. In alternativa possiamo anche usare il metodo di assegnazione `levels(x) <-` specificando ancora un vettore di livelli oppure specificando un singolo valore assegnando al nuovo indice:



E' possibile inoltre combinare due fattori in modo da ottenerne uno unico unendo quindi i livelli e i rispettivi valori numerici. Semplicemente usando il comando `c(fac1, fac2)`:


```
##  [1] a a a a a b b b b b c c c c c d d d d d
## Levels: a b c d
```

<!-- TODO rbind() con nuovi livelli  -->

### Fattori Ordinali

Vediamo infine un esempio di variabile categoriale ordinale. Riprendendo l'esempio precedente rigurdo i dosaggio del farmaco, è chiaro che esiste una relazionee ordinale tra i veri livelli della variabile. Per creare una variabile ordinale possiamo specificare l'argomento `ordered = TRUE`:


```r
dosage_ord <- factor(dosage, levels = c("low", "medium", "high"), ordered = TRUE)
dosage_ord
## [1] medium low    high   medium low    high  
## Levels: low < medium < high
```

Notiamo come la natura ordinale dei livelli sia specificata sia quando vengono riportati i livelli sia nella classe dell'oggetto 


```r
# Categoriale nominale
class(dosage)
## [1] "factor"

# Categoriale ordinale
class(dosage_ord)
## [1] "ordered" "factor"
```

:::{.tip title="Codifica Tipologia Variabli" data-latex="[Codifica Tipologia Variabli]"}
In R è importante codificare correttamente le differenii varibili specificando la loro tipologia. Distinnguendo appropriatamente le variabili categoriali (nominali e ordinali) rispetto alle varibili numeriche e alle semplici variabili di caratteri abbiamo numerosi vantaggi. In R, infatti, molti pacchetti e funzioni adottano particolari accorgimenti a seconda della tipologia di variabile fornendoci output e risultati coerenti alla natura della variabile. 

Nota ad esempio comee l'output della funzione `summary()` cambi a seconda della tipologia di varibile.

```r
# Variabile numerica
summary(1:15)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##     1.0     4.5     8.0     8.0    11.5    15.0

# Variabile Categoriale
summary(dosage)
##    low medium   high 
##      2      2      2
```

Questo risulterà particolarmente importante nell'esecuzione di analisi statistiche e nella creazione di grafici e tabelle.
:::

### Esercizi {-}

Esegui i seguenti esercizi ([soluzioni](https://github.com/psicostat/Introduction2R/blob/master/exercises/chapter-08-factors.R)):

1. Crea la variabile categoriale `genere` così definita:

```
## [1] M F M F M F F F M
## Levels: F M
```
2. Rinomina i livelli della variabile `genere` rispettivamente in `"donne"` e `"uomini"`.
3. Crea la variabile categoriale `intervento` così definita:

```
## [1] CBT         Psicanalisi CBT         Psicanalisi CBT         Psicanalisi
## [7] Controllo   Controllo   CBT        
## Levels: CBT Controllo Psicanalisi
```
4. Correggi nella variabile `intervento` la 7° e 8° osservazione con la voce `Farmaci`.
5. Aggiungi alla variabile `intervento` le seguenti nuove osservazioni:

```
## [1] "Farmaci"   "Controllo" "Farmaci"
```
    










