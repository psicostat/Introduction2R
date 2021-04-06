# Dataframe {#dataframe}




I `dataframe` sono uno degli oggetti più utilizzati in R per rappresentare i propri dati. In modo analogo alle matrici, i `dataframe` sono una struttura **bidimensionale** dove i dati sono disposti secondo righe e colonne. Può essere utile pensare al dataframe esattamente come ad una normale tabella che si può creare in un foglio di calcolo (e.g., Excel) dove possiamo inserire i nostri dati. Dati in questo caso è volutamente generico poichè i dataframe, a differenza delle matrici, possono contenere nello stesso oggetto tipi diversi di dati (e.g., *nomi*, *date* e *numeri*).

La struttura di base di un dataframe è quindi la stessa di una matrice ma ci permette di includere diversi tipi di dati nello stesso oggetto come caratteri e valori numerici. Questo ci consente di raccogliere in un unico oggetto tutte le caratteristiche delle unità statistiche (variabili numeriche, categoriali, nominali etc.) che intendiamo successivamente analizzare. Un aspetto cruciale quindi è proprio quello che il dataframe è stato pensato per gestire dati complessi ed eterogenei come quelli che si trovano in un’analisi di dati reale. Se vi capiterà di utilizzare altri linguaggi di programmazione sopratutto mirati all'analisi dati (e.g., Matlab) noterete come vi mancherà un oggetto potente e intuitivo come il dataframe.

In genere in un dataframe le righe rappresentano le unità statitiche (ad esempio persone o osservazioni) e le colonne rappresentano variabili ovvero delle proprietà misurate su quelle unità statistiche. Esistono tuttavia due formati principali di dataframe a seconda del modo in cui vengono organizzati i dati. Abbiamo i dataframe in forma **wide** (oppure larga) oppure i dataframe in forma **long** (oppure lunga). Valutiamo la differenza tra i due formati ipotizzando dei dati dove per ogni soggetto abbiamo misuriamo l'età, il genere, e la risposta a tre item di un questionario.


#### Wide Dataframe {-}

Nel formato **wide**, ogni singola riga del dataframe rappresenta un soggetto e ogni sua risposta o variabile misurata sarà riportata in una diversa colonna.  In Tabelle \@ref(tab:table-wide-db) vengono presentati i darti dell'esempio in un formato wide.

<table class="table table-striped table-hover table-condensed" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:table-wide-db)Dataframe nel formato wong</caption>
 <thead>
  <tr>
   <th style="text-align:center;"> Id </th>
   <th style="text-align:center;"> age </th>
   <th style="text-align:center;"> gender </th>
   <th style="text-align:center;"> item_1 </th>
   <th style="text-align:center;"> item_2 </th>
   <th style="text-align:center;"> item_3 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> subj_1 </td>
   <td style="text-align:center;"> 21 </td>
   <td style="text-align:center;"> F </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 0 </td>
   <td style="text-align:center;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> subj_2 </td>
   <td style="text-align:center;"> 23 </td>
   <td style="text-align:center;"> M </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> subj_3 </td>
   <td style="text-align:center;"> 19 </td>
   <td style="text-align:center;"> F </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 1 </td>
  </tr>
</tbody>
</table>

Osserviamo come ogni soggetto si identificato da un codice riportato nella variabile *Id* e le risposte ai tre item siano riportate in tre diverse variabili *item_1*, *item_2* e *item_3*.

#### Long Dataframe {-}

Nel formato **long**, ogni singola riga rappresenta una singola osservazione. Quindi i dati di ogni soggetto saranno riportati su più righe e le variabili che non cambiano tra le osservazioni saranno ripetute.  In Tabelle \@ref(tab:table-long-db) vengono presentati i darti dell'esempio in un formato lide.

<table class="table table-striped table-hover table-condensed" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:table-long-db)Dataframe nel formato long</caption>
 <thead>
  <tr>
   <th style="text-align:center;"> Id </th>
   <th style="text-align:center;"> age </th>
   <th style="text-align:center;"> gender </th>
   <th style="text-align:center;"> item </th>
   <th style="text-align:center;"> response </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> subj_1 </td>
   <td style="text-align:center;"> 21 </td>
   <td style="text-align:center;"> F </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> subj_1 </td>
   <td style="text-align:center;"> 21 </td>
   <td style="text-align:center;"> F </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> subj_1 </td>
   <td style="text-align:center;"> 21 </td>
   <td style="text-align:center;"> F </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> subj_2 </td>
   <td style="text-align:center;"> 23 </td>
   <td style="text-align:center;"> M </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> subj_2 </td>
   <td style="text-align:center;"> 23 </td>
   <td style="text-align:center;"> M </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> subj_2 </td>
   <td style="text-align:center;"> 23 </td>
   <td style="text-align:center;"> M </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> subj_3 </td>
   <td style="text-align:center;"> 19 </td>
   <td style="text-align:center;"> F </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> subj_3 </td>
   <td style="text-align:center;"> 19 </td>
   <td style="text-align:center;"> F </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> subj_3 </td>
   <td style="text-align:center;"> 19 </td>
   <td style="text-align:center;"> F </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 1 </td>
  </tr>
</tbody>
</table>

Osserviamo come le risposte di ogni soggetto siano distribuite su più righe. Le caratterische che non variano vengono ripetute ad ogni riga (*Id*, *age* e *gender*) mentre le risposte agli item vengono registrate utilizzando due colonne *item*, ovvero il numero dell'item, e *response* l'effettiva risposta di quel partecipante a quello specifico item.

:::{.tip title="Long o Wide?" data-latex="[Long o Wide?]"}
I dati in forma long e wide hanno delle proprietà diverse sopratutto in riferimento all'utilizzo. La tipologia di dato e il risultato finale è esattamente lo stesso tuttavia alcuni software o alcuni pacchetti di R funzionano solo con dataset organizzati in un certo modo.

Non c'è quindi un formato corretto o sbagliato ma dipende dal tipo di analisi e dal software o pacchetto che si utilizza. Alcune operazioni o analisi richiedono il dataset in forma **long** altre in forma **wide**.

Il consiglio però è di abituarsi il più possibile a ragionare in forma **long** perchè la maggior parte dei moderni pacchetti per l'analisi dati e per la creazione di grafici richiedono i dati in questo formato. Ci sono comunque delle funzioni (più avanzate) per passare velocemente da un formato all'altro.
:::

Nota come nei precedenti esempi abbiamo utilizzato sia colonne che contengono valori numerici numeri sia colonne con caratteri. Questo non era chiaramente possibile con le matrici. Ricorda tuttavia che, come per le matrici, anche i dataframe richiedono che tutte le colonne (variabili) abbiano lo stesso numero di elementi.


Vedremo ora come creare dei dataframe in R e come compiere le comuni operazini di selezione. Infine descriveremo alcune semplici manipolazioni e operazioni con i dataframe. Come vedremo ci sono molte somiglianze nell'utilizzo dei dataframe e delle matrici. Quando necessario, si farà riferimento al capitolo precedente per far notare aspetti in comune e differenze tra queste due strutture di dati.

## Creazione di un dataframe

Il comando per creare un dataframe è il comando `data.frame()`:


```r
nome_df <- data.frame(
  variable1 = c(...),
  variable2 = c(...),
  ...)
```

La creazione è leggermente diversa rispetto al caso delle matrici. Intuitivamente è più facile immaginarla come l'unione di diverse colonne  (dove una può contenere dei nomi, un'altra delle date e così via) piuttosto che un insieme di valori inseriti per riga o per colonna come per le matrici. Infatti per creare un `dataframe` è proprio necessario specificare le colonne una alla volta, indicando `nome_colonna = valori` all'interno del comando `data.frame()`. Vediamo un esempio in R, 


```r
my_data <- data.frame(
  Id = c(1:5),
  names = c("Alice", "Bruno", "Carla", "Diego", "Elisa"),
  gender = factor(c("F","M","F", "M", "F")),
  age = c(22, 25, 23, 22, 24),
  faculty = factor(c("Psicologia", "Ingegneria", "Medicina", "Lettere", "Psicologia"))
)

my_data
##   Id names gender age    faculty
## 1  1 Alice      F  22 Psicologia
## 2  2 Bruno      M  25 Ingegneria
## 3  3 Carla      F  23   Medicina
## 4  4 Diego      M  22    Lettere
## 5  5 Elisa      F  24 Psicologia
```

In questo caso abbiamo creato un ipotetico dataframe dove in ogni riga abbiamo un soggetto e ogni colonna rappresenta una data caratteristica del soggetto come il genere, l'età e così via.

:::{.tip title="ID" data-latex="[ID]"}
E' sempre consigliato definire una colonna (e.g., `Id`) in cui assegnnare un idenificativo univoco ad ogni soggetto. Questo ci permetto di poterlo indentificare senza correre il rischio di compiere errori. Ad esempio l'utlizzo del nome (o anche nome e cognome) potrebbe non essere indicato poichè più persone potrebbero avere lo stesso nome e non saremo quindi in grado di discriminare i due soggetti.
:::

:::{.warning title="stringsAsFactors" data-latex="[stringsAsFactors]"}
Una variabile di caratteri all'interno di un DataFrame è considerata di default come una semplice varibile nominale. E' possibile specificare l'argomento `stringsAsFactors = TRUE` per ottenere che tutte le variabili di caratteri siano considerate come delle variabili catgoriali creando automaticamente dei fattori (vedi Capitolo TODO).

Nota come il comportamento di default sia differente a seconda della versione di R. Versioni precedenti a R 4.0 avevano infatti come default `stringsAsFactors = TRUE` mentre dalla 4.0 in poi abbiamo `stringsAsFactors = FALSE`.

Presta quindi molta attenzione quando utilizzi codici e soluzioni scritte prima della versione 4.0.
:::

### Esercizi {-}

Esegui i seguenti esercizi ([soluzioni](https://github.com/psicostat/Introduction2R/blob/master/exercises/chapter-10.R)):

1. Crea il dataframe `data_wide` riportato in Tabella \@ref(tab:table-wide-db)
2. Crea il dataframe `data_long` riportato in Tabella \@ref(tab:table-long-db)

## Selezione Elementi {#sel-df}

Per selezionare uno o pù valori da un dataframe è possibile, in modo analogo alle matrici, utilizzare gli indici di riga e di colonna all'interno delle parentesi quadre:


```r
nome_dataframe[<indice-riga>, <indice-colonna>]
```

Ricordiamo che l'ordine `[<indice-riga>, <indice-colonna>]` è prestabilito e deve essere rispettato affinché la selezione avvenga correttamente. Possiamo quindi eseguire diverse tipologie di selezioni a seconda delle necessità ussanto le stesse procedure viste per le matrici. Ad esempio, riprendeno il dataframe `my_data` creato precedentemente possiamo selezionare:  





```r
my_data
##    Id    names gender age    faculty
## 1   1    Alice      F  22 Psicologia
## 2   2    Bruno      M  25 Ingegneria
## 3   3    Carla      F  23   Medicina
## 4   4    Diego      M  22    Lettere
## 5   5    Elisa      F  24 Psicologia
## 6   6 Fabrizio      M  35    Lettere
## 7   7   Gloria      F  26 Ingegneria
## 8   8   Herman      M  20 Psicologia
## 9   9    Irene      F  23 Statistica
## 10 10     Luca      M  22 Ingegneria

# Valore 3° riga e 2° colonna
my_data[3,4]
## [1] 23

# Tutte le variabili della 1° e 3° riga
my_data[c(2,3), ]
##   Id names gender age    faculty
## 2  2 Bruno      M  25 Ingegneria
## 3  3 Carla      F  23   Medicina

# Tutti i valori della 5° variabile
my_data[ , 5]
##  [1] Psicologia Ingegneria Medicina   Lettere    Psicologia Lettere   
##  [7] Ingegneria Psicologia Statistica Ingegneria
## Levels: Ingegneria Lettere Medicina Psicologia Statistica

# I valori della 2° e 4° variabile per la 3° e 5° riga
my_data[c(3,5), c(2,4)]
##   names age
## 3 Carla  23
## 5 Elisa  24
```

Tuttavia, nell'utilizzo dei dataframe è più comune indicare i nomi delle variabili e le condizioni logico relazionali per selezionare i valori di interesse. 

#### Selezione Colonne con Nomi delle Variabili {-} 

Una granade differenza tra le matrici ed i dataframe sta nel poter accedere alle colonne utilizzando l'operatore `$` ed indicando il loro nome attraverso la seguente sintassi:


```r
nome_dataframe$nome_variabile
```

In questo modo accediamo direttamente a quella specifica colonna senza utilizzare indici e parentesi quadre. Ad esempio:


```r
# Seleziono la variabile "names"
my_data$names
##  [1] "Alice"    "Bruno"    "Carla"    "Diego"    "Elisa"    "Fabrizio"
##  [7] "Gloria"   "Herman"   "Irene"    "Luca"

# Seleziono la variabile "gender"
my_data$faculty
##  [1] Psicologia Ingegneria Medicina   Lettere    Psicologia Lettere   
##  [7] Ingegneria Psicologia Statistica Ingegneria
## Levels: Ingegneria Lettere Medicina Psicologia Statistica
```

In alternativa è possibile utilizzare la normale procedura di selezione tramite parentesi quadre indicando al cposto degli indici di colonna i nomi delle variabili desiderate. Questo ci permette di selezionare anche più variabili contemporaneamente, ad esempio:


```r
# Seleziono solo la variabile "names"
my_data[ , "names"]
##  [1] "Alice"    "Bruno"    "Carla"    "Diego"    "Elisa"    "Fabrizio"
##  [7] "Gloria"   "Herman"   "Irene"    "Luca"

# Seleziono la variabile "names", "gender" e "faculty"
my_data[, c("names", "gender", "faculty")]
##       names gender    faculty
## 1     Alice      F Psicologia
## 2     Bruno      M Ingegneria
## 3     Carla      F   Medicina
## 4     Diego      M    Lettere
## 5     Elisa      F Psicologia
## 6  Fabrizio      M    Lettere
## 7    Gloria      F Ingegneria
## 8    Herman      M Psicologia
## 9     Irene      F Statistica
## 10     Luca      M Ingegneria
```

Nota come i nomi delle variabili debbano essere forniti come delle stringhe. 

#### Selezione Righe con Condizioni Logiche {-}

Avevamo visto precedentemete nel caso dei vettori e delle matrici come sia possibile costruire delle preposizioni logiche per selezionare solo i valori che rispettino una data condizione. Ora questa funzione si rivela particolarmente utile poichè ci permette di *interrogare* il nostro dataframe in modo semplice ed intuitivo. Utilizzando una condizione logica possiamo, infatti, *filtrare* le oservazioni che soddisfano una data condizione ed ottenere solo le informazioni di interesse.

Nella canonica sintassi `[<indice-riga>, <indice-colonna>]`, gli indici di riga  vengono sostituiti con una condizione logica che ci permette di filtrare le righe e al posto degli indici di colonna vengono indicati i nomi delle variabili di interesse. Utilizzeremo quindi la seguente sintassi:


```r
nome_dataframe[<condizione_logica_righe>, <nomi_variabili>]
```

Vediamo ora degli esempi di selezione:


```r
# Tutti i dati di "Diego" (Id == 4)
my_data[my_data$Id == 4, ]
##   Id names gender age faculty
## 4  4 Diego      M  22 Lettere

# Tutti i dai delle ragazze
my_data[my_data$gender == "F", ]
##   Id  names gender age    faculty
## 1  1  Alice      F  22 Psicologia
## 3  3  Carla      F  23   Medicina
## 5  5  Elisa      F  24 Psicologia
## 7  7 Gloria      F  26 Ingegneria
## 9  9  Irene      F  23 Statistica

# Le facoltà dei soggeti con più di 24 anni
my_data[my_data$age > 24, c("age", "faculty")]
##   age    faculty
## 2  25 Ingegneria
## 6  35    Lettere
## 7  26 Ingegneria
```

Nota come, nel definire una condizione logica utilizzano le variabili dello stesso dataframe, sia comunque necessario indicare sempre anche il nome del dataframe. Nel caso precendente avremmo ottenuto un errore indicando semplicemente `age > 24` poichè così indichiamo l'oggetto `age` (che non esiste) e non la variabile `age` contenuta in `my_data`.


```r
my_data[age > 24, c("age", "faculty")]
## Error in `[.data.frame`(my_data, age > 24, c("age", "faculty")): object 'age' not found
```

In modo analogo a quanto visto con i vettori, utlizzando la condizione `my_data$age > 24` otteniamo un vettore di valori `TRUE` e `FALSE` a seconda che la condizione sia rispettata o meno.

Utilizzando gli operatori logici **AND**(`&`) **OR**(`|`) e **NOT**(`!`) possiamo combinare più operazioni logiche insieme per ottenere indicizzazioni più complesse, ma sempre intuitive dal punto di vista della scrittura. Ad esempio, per selezionare "I soggetti tra i 20 e i 25 anni iscrittti a psicologia " eseguiremo:


```r
my_data[my_data$age >= 20 & my_data$age <=25 & my_data$faculty == "Psicologia", ]
##   Id  names gender age    faculty
## 1  1  Alice      F  22 Psicologia
## 5  5  Elisa      F  24 Psicologia
## 8  8 Herman      M  20 Psicologia
```

Utilizzando questo metodo di indicizzazione possiamo apprezzare la vera potenza dei dataframe. Abbiamo, infatti, un metodo molto semplice ed intuitivo per lavorare con strutture di dati complesse formate da diverse tipologie di dati.

:::{.design title="Output Selezione" data-latex="[Output Selezione]"}
Due aspetti importanti riguardanti il risultato di una selezione sono la tipologia di ouput ottenuto e come salvarla.

#### Tiplogia Output {-}

In modo analogo alle matrici, i comandi di selezione non restituiscono sempre la  stessa tipologia di oggetto. Infatti, quando selezioniamo una singola variabile otteniamo come risultato un vettore mentre selezionando due o più variabili oteniamo un dataframe.


```r
# Singola variabile
class(my_data$age)
## [1] "numeric"

# Più variabili
class(my_data[ , c("names", "age")])
## [1] "data.frame"
```

#### Salvare Selezione {-}

Come per tutte le altre tipologie di oggetti, le operazioni di selezione non modificano l'oggetto iniziale. Pertanto è necessario salvare il risultato della selezione se si desidera mantenere le modifiche. In questo caso, è cosigliabile creare un nuovo oggetto e non sovrascrivere l'oggetto iniziale poichè non ci permetterebbe di compiere nuove selezioni od operazioni su tutti i dati iniziali. E' buona norma quindi mantenere sempre un dataframe con la versione dei dati originali.
:::


### Utilizzi Avanzati Selezione

Vediamo ora alcuni utilizzi avanzati della selezione di elementi di un dataframe.

#### Modificare gli Elementi {-}

In modo analogo agli altri oggetti, possiamo modificare dei valori selezionando il vecchio valore della matrice e utilizzo la funzione `<-` (o `=`) per assegnare il nuovo valore.


```r
my_data[1:5, ]
##   Id names gender age    faculty
## 1  1 Alice      F  22 Psicologia
## 2  2 Bruno      M  25 Ingegneria
## 3  3 Carla      F  23   Medicina
## 4  4 Diego      M  22    Lettere
## 5  5 Elisa      F  24 Psicologia

# Sostituisco il nome "Diego" con "Davide"
my_data[4, "names"] <- "Davide"

my_data[1:5]
##    Id    names gender age    faculty
## 1   1    Alice      F  22 Psicologia
## 2   2    Bruno      M  25 Ingegneria
## 3   3    Carla      F  23   Medicina
## 4   4   Davide      M  22    Lettere
## 5   5    Elisa      F  24 Psicologia
## 6   6 Fabrizio      M  35    Lettere
## 7   7   Gloria      F  26 Ingegneria
## 8   8   Herman      M  20 Psicologia
## 9   9    Irene      F  23 Statistica
## 10 10     Luca      M  22 Ingegneria
```


#### Eliminare Righe o Colonne {-}

In modo analogo agli altri oggetti, per **eliminare** delle righe (o delle colonne) da un dataframe, è necessario indicare all'interno delle parentesi quadre gli indici di riga (o di colonna) che si intende eliminare, preceduti dall'operatore `-` (*meno*). Nel caso di più righe (o colone) è possibile indicare il meno solo prima del comando `c()`.


```r
# Elimino le variabili "gender" e "age"
my_data[ , c("gender", "age")]
##    gender age
## 1       F  22
## 2       M  25
## 3       F  23
## 4       M  22
## 5       F  24
## 6       M  35
## 7       F  26
## 8       M  20
## 9       F  23
## 10      M  22

# Elimino le prime 5 osservazioni
my_data[-c(1:5), ]
##    Id    names gender age    faculty
## 6   6 Fabrizio      M  35    Lettere
## 7   7   Gloria      F  26 Ingegneria
## 8   8   Herman      M  20 Psicologia
## 9   9    Irene      F  23 Statistica
## 10 10     Luca      M  22 Ingegneria

# Elimino le prime 5 osservazioni e la variabile "names"
my_data[-c(1:5), -3]
##    Id    names age    faculty
## 6   6 Fabrizio  35    Lettere
## 7   7   Gloria  26 Ingegneria
## 8   8   Herman  20 Psicologia
## 9   9    Irene  23 Statistica
## 10 10     Luca  22 Ingegneria
```

E' possibile anche escludere (ed eliminare in un certo senso) delle informazioni usando gli operatori logici in gli operatori **NOT**(`!`) e diverso da (`!=`):


```r
# Seleziono tutto tranne gli studenti di psicologia

# Modo 1 (valuto disuguaglianza)
my_data[my_data$faculty != "Psicologia", ]
##    Id    names gender age    faculty
## 2   2    Bruno      M  25 Ingegneria
## 3   3    Carla      F  23   Medicina
## 4   4   Davide      M  22    Lettere
## 6   6 Fabrizio      M  35    Lettere
## 7   7   Gloria      F  26 Ingegneria
## 9   9    Irene      F  23 Statistica
## 10 10     Luca      M  22 Ingegneria

# Modo 1 (nego l'uguaglianza)
my_data[!my_data$faculty == "Psicologia", ]
##    Id    names gender age    faculty
## 2   2    Bruno      M  25 Ingegneria
## 3   3    Carla      F  23   Medicina
## 4   4   Davide      M  22    Lettere
## 6   6 Fabrizio      M  35    Lettere
## 7   7   Gloria      F  26 Ingegneria
## 9   9    Irene      F  23 Statistica
## 10 10     Luca      M  22 Ingegneria
```

Nota come l'operazione di eliminazione sia comunque un'operazione di selezione. Pertanto è necessario salvare il risultato ottenuto se si desidera mantenere le modifiche.

:::{.warning title="Attenzione ad Eliminare" data-latex="[Attenzione ad Esliminare]"}
L'utilizzo dell'operatore `-` è sempre in qualche modo pericoloso, sopratutto se l'oggetto che viene creato (o sovrascritto) viene poi utilizzato in altre operazioni. Eliminare delle informazioni, tranne quando è veramente necessario, non è mai una buona cosa. Se dovete selezionare una parte dei dati è sempre meglio creare un nuovo dataframe (o un nuovo oggetto in generale) e mantendere una versione di quello originale sempre disponibile. 
:::

### Esercizi {-}

Facendo riferimento ai dataframe `data_long` e `data_wide` precedentemente creati, esegui i seguenti esercizi ([soluzioni](https://github.com/psicostat/Introduction2R/blob/master/exercises/chapter-10.R)): 

1. Utilizzando gli **indici numerici** di riga e di colonna seleziona i dati del soggetto `subj_2` riguardanti le variabili `item` e `response` dal DataFrame `data_long`.
2. Compi la stessa selezione dell'esercizio precedente usando però questa volta una condizione logica per gli indici di riga e indicando direttamente il nome delle variabili per gli indici di colonna.
3. Considerando il DataFrame `data_wide` seleziona le variabili `Id` e `gender` dei soggetti che hanno risposto 1 alla variabile `item_1`.
4. Considerando il DataFrame `data_long` seleziona solamente i dati riguardanti le ragazze con etè superiore ai 20 anni.
5. Elimina dal DataFrame `data_long` le osservazioni riguardanti il soggetto `subj_2` e la variabile `"gender"`.

## Funzioni ed Operazioni

- head
- tail
- str

Vediamo ora alcune funzioni frequentemente usate e le comuni operazioni eseguite con i dataframe (vedi Tabella \@ref(tab:table-df-functions)).

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:table-df-functions)Funzioni e operazioni con dataframe</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Funzione </th>
   <th style="text-align:left;"> Descrizione </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> nrow(nome_df) </td>
   <td style="text-align:left;"> Numero di osservazioni del dataframe </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ncol(nome_df) </td>
   <td style="text-align:left;"> Numero di variabili del dataframe </td>
  </tr>
  <tr>
   <td style="text-align:left;"> colnames(nome_df) </td>
   <td style="text-align:left;"> Nomi delle colonne del dataframe </td>
  </tr>
  <tr>
   <td style="text-align:left;"> rownames(nome_df) </td>
   <td style="text-align:left;"> Nomi delle righe del dataframe </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nome_df &lt;-<br> cbind(nome_df, dati) <br> nome_df$nome_var &lt;-<br> dati </td>
   <td style="text-align:left;"> Aggiungi una nuova variabile al dataframe (deve avere lo stesso numero di righe) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nome_df &lt;- rbind(nome_df, dati) </td>
   <td style="text-align:left;"> Aggiungi delle osservazioni (i nuovi dati devono essere coerenti con la struttura del dataframe) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> head(nome_df) </td>
   <td style="text-align:left;"> Prime righe del dataframe </td>
  </tr>
  <tr>
   <td style="text-align:left;"> tail(nome_df) </td>
   <td style="text-align:left;"> Ultime righe del dataframe </td>
  </tr>
  <tr>
   <td style="text-align:left;"> str(nome_df) </td>
   <td style="text-align:left;"> Struttura del dataframe </td>
  </tr>
  <tr>
   <td style="text-align:left;"> summary(nome_df) </td>
   <td style="text-align:left;"> Summary del dataframe </td>
  </tr>
</tbody>
</table>

Descriviamo ora nel dettaglio alcuni particolari utilizzi, considrando come esempio una versione ridotta del dataframe `my_data` precedentemente creata.


```r
data_short <- my_data[1:5, ]
data_short
##   Id  names gender age    faculty
## 1  1  Alice      F  22 Psicologia
## 2  2  Bruno      M  25 Ingegneria
## 3  3  Carla      F  23   Medicina
## 4  4 Davide      M  22    Lettere
## 5  5  Elisa      F  24 Psicologia
```


### Attributi di un Dataframe {#mat-prop}

Abbiamo visto nel Capitolo TODO che gli oggetti in R possiedono quelli che sono definiti *attibuti* ovvero delle utili informazioni riguardanti l'oggetto stesso, una sorta di *metadata*. Vediamo ora, in modo analogo alle matrici, come valutare la dimensione di un dataframe e i nomi delle righe e delle colonne. 

#### Dimensione {-}

Ricordiamo che un daaframe è un oggetto **bidimensionale** formato da righe e colonne. Per ottenere il numero di righe e di colonne di un dataframe, possiamo usare rispettivamente i comandi `nrow()` e `ncol()`.


```r
# Numero di righe
nrow(my_data)
## [1] 10

# Numero di colonne
ncol(my_data)
## [1] 5
```

In alternativa, come per le matrici, è possibile usare la funzione `dim()`che restituisce un vettore con due valori dove il primo rappresenta il numero di righe e il secondo il numero di colonne. 

#### Nomi Righe e Colonne {-}

In modo simile alle matrici, è possibile accedere ai nomi delle righe e delle colonne utilizzando rispettivamente le funzioni `rownames()` e `colnames()`. Di default il dataframe richiede dei nomi solo alle colonne mentre il alle righe viene assegnato un nome in accordo con l'indice di riga. Tuttavia, è possibile anche nominare le righe con valori arbitrari sebbene sia una funzione raramente utilizzata.


```r
# Controllo i nomi attuali
rownames(data_short)
## [1] "1" "2" "3" "4" "5"
colnames(data_short)
## [1] "Id"      "names"   "gender"  "age"     "faculty"
```

Per impostare i nomi di righe e/o colonne, sarà quindi necessario assegnare a `rownames(nome_dataframe)` e `colnames(nome_dataframe)` un vettore di caratteri della stessa lunghezza della dimensione che stiamo rinominando.


```r
# Assegnamo i nomi alle righe
rownames(data_short) <- paste0("Subj_", 1:nrow(data_short))

# Assegno i nomi alle colonne
colnames(data_short) <- c("Id", "Nome", "Genere", "Eta", "Facolta")

data_short
##        Id   Nome Genere Eta    Facolta
## Subj_1  1  Alice      F  22 Psicologia
## Subj_2  2  Bruno      M  25 Ingegneria
## Subj_3  3  Carla      F  23   Medicina
## Subj_4  4 Davide      M  22    Lettere
## Subj_5  5  Elisa      F  24 Psicologia
```

Infine, nota come la funzione `names()` nel caso dei dataframe sia analoga alla funzione `colnames()` e sia possibile usare il vaore `NULL` per eliminare ad esempio i nomi delle righe.

```r
names(data_short)
## [1] "Id"      "Nome"    "Genere"  "Eta"     "Facolta"

rownames(data_short) <- NULL
data_short
##   Id   Nome Genere Eta    Facolta
## 1  1  Alice      F  22 Psicologia
## 2  2  Bruno      M  25 Ingegneria
## 3  3  Carla      F  23   Medicina
## 4  4 Davide      M  22    Lettere
## 5  5  Elisa      F  24 Psicologia
```


### Unire Dataframe

In modo analogo alle matrici è possibile unire più dataframe utilizzando le funzioni `cbind()` e `rbind()` per cui valgono gli stesssi accorgimenti riguardanti la dimensione rispettivamente di righe e colonne. Tuttavia, nel caso dei dataframe è possibile creare una nuova colonna anche utilizzando l'operatore `$`. Descriviamo ora in modo accurato i differenti utilizzi.

#### `dataframe$name <- new_var` {-}

Con la scrittura `dataframe$name <- new_var` aggiungiamo al dataframe in oggetto una nuova colonna chiamata `name` che prende i valori all'interno di `new_var`. Sarà necessario che la nuova variabile abbia lo stesso numero di valori delle righe del dataframe.


```r
# Aggiungiamo la colonna "media"
data_short$Media <- c(27.5, 23.6, 28.3, 29.2, 24.8)

# Equivalente a
media_voti <- c(27.5, 23.6, 28.3, 29.2, 24.8)
data_short$Media <- media_voti

data_short
##   Id   Nome Genere Eta    Facolta Media
## 1  1  Alice      F  22 Psicologia  27.5
## 2  2  Bruno      M  25 Ingegneria  23.6
## 3  3  Carla      F  23   Medicina  28.3
## 4  4 Davide      M  22    Lettere  29.2
## 5  5  Elisa      F  24 Psicologia  24.8
```

#### `cbind()` {-}

Con la funzione `cbind()` possiamo aggiungere una o più variabili al nostro dataframe. Nota come a differenza dell'utilizzo dell'operatore `$,`usando `cbind()` il risultato non venga automaticamente salvato ma sia necessario assegnare l'operazione ad un nuovo oggetto `dataframe <- cbind(dataframe, new_var)`. In quest'ultimo caso il nome della colonna sarà `new_var`. Se vogliamo anche rinominare la colonna possiamo usare la sintassi `cbind(dataframe, "nome" = new_var)` oppure chiamare l'oggetto direttamente con il nome desiderato:


```r
# aggiungo la variabile Numero_esami
numero_esami <- c(12, 14, 13, 10, 8)

cbind(data_short, numero_esami) # senza specificare il nome
##   Id   Nome Genere Eta    Facolta Media numero_esami
## 1  1  Alice      F  22 Psicologia  27.5           12
## 2  2  Bruno      M  25 Ingegneria  23.6           14
## 3  3  Carla      F  23   Medicina  28.3           13
## 4  4 Davide      M  22    Lettere  29.2           10
## 5  5  Elisa      F  24 Psicologia  24.8            8

cbind(data_short, "N_esami" = numero_esami) # specificando anche il nome
##   Id   Nome Genere Eta    Facolta Media N_esami
## 1  1  Alice      F  22 Psicologia  27.5      12
## 2  2  Bruno      M  25 Ingegneria  23.6      14
## 3  3  Carla      F  23   Medicina  28.3      13
## 4  4 Davide      M  22    Lettere  29.2      10
## 5  5  Elisa      F  24 Psicologia  24.8       8
```

Anche in questo caso sarà necessario che le nuove variabili abbia lo stesso numero di valori delle righe del dataframe.

#### `rbind()` {-}

Leggermente più complessa (e inusuale) è l'aggiunta di righe ad un dataframe. Al contrario della matrice che di base non aveva nomi per le colonne e solo numeri o stringhe come tipologia di dato, per combinare per riga due dataframe dobbiamo avere la stessa struttura. Ovvero:

* Lo stesso numero di colonne (come per le matrici)
* Lo stesso nome delle colonne


```r
data_short
##   Id   Nome Genere Eta    Facolta Media
## 1  1  Alice      F  22 Psicologia  27.5
## 2  2  Bruno      M  25 Ingegneria  23.6
## 3  3  Carla      F  23   Medicina  28.3
## 4  4 Davide      M  22    Lettere  29.2
## 5  5  Elisa      F  24 Psicologia  24.8

# Nuovo dataset con le stesse colonne ma diverso nome
new_row <- data.frame(
  Id = 6,
  Nome = "Marta",
  Sex = "F",      # Sex invece di Genere
  Eta = 44,
  Facolta = "Filosofia",
  Media = 28.7
)

new_row
##   Id  Nome Sex Eta   Facolta Media
## 1  6 Marta   F  44 Filosofia  28.7

rbind(data_short, new_row) # Errore
## Error in match.names(clabs, names(xi)): names do not match previous names

# Nuovo dataset con le stesse colonne con il nome corretto
new_row <- data.frame(
  Id = 6,
  Nome = "Marta",
  Genere = "F", 
  Eta = 44,
  Facolta = "Filosofia",
  Media = 28.7
)

rbind(data_short, new_row)
##   Id   Nome Genere Eta    Facolta Media
## 1  1  Alice      F  22 Psicologia  27.5
## 2  2  Bruno      M  25 Ingegneria  23.6
## 3  3  Carla      F  23   Medicina  28.3
## 4  4 Davide      M  22    Lettere  29.2
## 5  5  Elisa      F  24 Psicologia  24.8
## 6  6  Marta      F  44  Filosofia  28.7
```

Anche in questo caso sarà necessario salvare il risultato ottenuto per mantenere i cambiamenti.

### Informazioni Dataframe

Vediamo infine alcune funzioni molto comuni usate per otttenere informazioin riassuntive riguardo ai dati contenuti in un dataframe:

- `head()` (o `tail()`) ci permete di visualizzare le prime (o le ulitme righe del nostro dataframe)

```r
head(my_data)
##   Id    names gender age    faculty
## 1  1    Alice      F  22 Psicologia
## 2  2    Bruno      M  25 Ingegneria
## 3  3    Carla      F  23   Medicina
## 4  4   Davide      M  22    Lettere
## 5  5    Elisa      F  24 Psicologia
## 6  6 Fabrizio      M  35    Lettere
```
- `str()` ci permete di valutare la struttura del dataset ottenendo utli informazini quali in numero di osservazioni, il numero di variabili e la ipologia di variabili

```r
str(my_data)
## 'data.frame':	10 obs. of  5 variables:
##  $ Id     : int  1 2 3 4 5 6 7 8 9 10
##  $ names  : chr  "Alice" "Bruno" "Carla" "Davide" ...
##  $ gender : Factor w/ 2 levels "F","M": 1 2 1 2 1 2 1 2 1 2
##  $ age    : num  22 25 23 22 24 35 26 20 23 22
##  $ faculty: Factor w/ 5 levels "Ingegneria","Lettere",..: 4 1 3 2 4 2 1 4 5 1
```
- `summary()` ci permete avere delle informazioni riassuntive delle variabili a seconda della loro tipologia

```r
summary(my_data)
##        Id           names           gender      age              faculty 
##  Min.   : 1.00   Length:10          F:5    Min.   :20.00   Ingegneria:3  
##  1st Qu.: 3.25   Class :character   M:5    1st Qu.:22.00   Lettere   :2  
##  Median : 5.50   Mode  :character          Median :23.00   Medicina  :1  
##  Mean   : 5.50                             Mean   :24.20   Psicologia:3  
##  3rd Qu.: 7.75                             3rd Qu.:24.75   Statistica:1  
##  Max.   :10.00                             Max.   :35.00
```


### Esercizi {-}

Facendo riferimento ai dataframe `data_long` e `data_wide` ([soluzioni](https://github.com/psicostat/Introduction2R/blob/master/exercises/chapter-10.R)): 

1. Aggiungi sia al DataFrame `data_wide` che `data_long` la variabile numerica `"memory_pre"`.

```
##       Id memory_pre
## 1 subj_1          3
## 2 subj_2          2
## 3 subj_3          1
```

2. Aggiungi sia al DataFrame `data_wide` che `data_long` la variabile categoriale `"gruppo"`.


```
##       Id      gruppo
## 1 subj_1 trattamento
## 2 subj_2 trattemento
## 3 subj_3   controllo
```

3. Aggiungi al DataFrame `data_wide` i dati del soggetto `subj_4` e `subj_5`.


```
##       Id age gender item_1 item_2 item_3 memory_pre      gruppo
## 1 subj_4  25      F      1      0      2          1 trattemento
## 2 subj_5  22      M      1      1      0          3   controllo
```

4. Considerando il DataFrame `datawide` calcola la variabile `"memory_post"` data dalla somma degli item.
5. Considerando il DataFrame `data_wide` cambia i nomi delle variabili `item_1`, `item_2` e `item_3` rispettivamente in `problem_1`, `problem_2` e `problem_3`.
