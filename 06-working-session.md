# Sessione di Lavoro {#working-session}



In queso capitolo introdurremo alcuni concetti molto importanti che riguardano le sessioni di lavoro in R o RStudio. In particolare parleremo dell'*environment*, della *working directory* e dell'utilizzo di pacchetti.

Infine, disuteremo di alcuni aspetti generali della programmazione quali la gestione dei messaggi di errore o *warnings* e  vedremo alcune buone norme riguardanti l'organizzazione degli scripts e l'uso degli *RStudio Projects* per essere ordinati ed efficaci nelle proprie sessioni di lavoro.

## Environment

Nel Capitolo \@ref(objects-section), abbiamo visto come sia possibile assegnare dei valori a degli oggetti. Questi oggetti vengono creati nel nostro ambiente di lavoro (o meglio *Environment*) e potranno essere utilizzati in seguito.

Il nostro Enviroment raccoglie quindi tutti gli oggetti che vengono creati durante la nostra sessione di lavoro. E' possibile valutare gli oggetti attualmente presenti osservando il pannello *Environment* in alto a destra (vedi Figura \@ref(fig:environment2)) oppure utilizzadno il comando `ls()`, ovvero *list objects*.

<div class="figure" style="text-align: center">
<img src="images/environment.png" alt="*Environment* - Elenco degli oggetti e variabili presenti nel'ambiente di lavoro" width="60%" />
<p class="caption">(\#fig:environment2)*Environment* - Elenco degli oggetti e variabili presenti nel'ambiente di lavoro</p>
</div>

All'inizio della sessione di lavoro il nostro Environment sarà vuoto (vedi Figura \@ref(environment-empty)). Il comando `ls()` non restituirà alcun oggeto ma per indicare l'assenza di oggerri userà la risposta `character(0)`, ovvero un vettore di tipo caratteri di lunghezza zero (vedi Capitolo TODO).

<div class="figure" style="text-align: center">
<img src="images/environment-empty.png" alt="*Environment* vuoto ad inizio sessione di lavoro" width="60%" />
<p class="caption">(\#fig:environment-empty)*Environment* vuoto ad inizio sessione di lavoro</p>
</div>


```r
# Environment vuoto
ls()
## character(0)
```

### Aggiungere Oggetti all'Environment

Una volta creati degli oggetti, questi saranno presenti nel nostro Environment e il comando `ls()` restituirà un vettore di caretteri in cui vengono elencati tutti i loro nomi.


```r
# Creo oggetti
x <-  c(2,4,6,8)
y <-  27
word <- "Hello Word!"

# Lista nomi oggetti nell'Environment
ls()
## [1] "word" "x"    "y"
```

Nel pannello in alto a destra (vedi Figura \@ref(fig:environment-object)), possiamo trovare un elenco degli oggetti attualmente presenti nel nostro Environment. Insieme al nome vengono riportate anche alcune utili inforamzioni a seconda del tipo di oggetto. Vediamo come nel nostro esempio, nel caso di variabili con un singolo valore (e.g., `word` e `y`) venganno presentati direttamente gli stessi valori. Mentre, nel caso di vettori  (e.g., `x`) vengano fornite anche informazioni riguardanti la tipologia di vettore e la sua dimensione (vedi Capitolo TODO), nell'esempio abbiimao un vettore numerico (`num`) di 4 elementi (`[1:4]`).

<div class="figure" style="text-align: center">
<img src="images/environment-objects.png" alt="*Environment* contenente gli oggetti creati" width="60%" />
<p class="caption">(\#fig:environment-object)*Environment* contenente gli oggetti creati</p>
</div>

### Rimuovere Oggetti dall'Environment

Per rimuovere un oggetto dal proprio environment è possibile utilizzare il comando `remove()` oppure la sua abbreviazione `rm()`, indicando tra parentesi il nome dell'oggetto che si intende rimuovere. E' possibile indicare più di un oggetto separando i loro nomi con la virgola.


```r
# Rimuovo un oggetto
rm(word)
ls()
## [1] "x" "y"

# Rimuovo più oggetti contemporaneamente
rm(x,y)
ls()
## character(0)
```

:::{.trick title="rm(list=ls())" data-latex="[rm(list=ls())]"}
Qualora fosse necessario eliminare tutti gli oggetti attualmete presenti nel nosto ambiente di lavoro è possibile ricorrere alla formula `rm(list=ls())`. In questo modo si avrà la certezza di pulire l'ambiente da ogni oggetto e di ripristinarlo alle condizioni iniziali della sessione.
:::

:::{.design title="Mantenere Ordinato l'Environment" data-latex="[Mantenere Ordinato l'Environment]"}
Avere cura di mantenre il proprio Environment ordinato ed essere consapevoli degli oggetti attualmente presenti è importante. Questo ci permette di evitare di compiere due errori comuni.

- **Utilizzare oggetti non ancora creati**. In questo caso l'errore è facilemente individuabile dat che sarà lo stesso R ad avvisarci che  *"object '<nome-oggetto>' not found"*. In questo caso dovremmo semplicemente eseguire il comando per creare l'oggetto richieto.

```r
oggetto_non_esistente
## Error in eval(expr, envir, enclos): object 'oggetto_non_esistente' not found
```

- **Utilizzare oggetti con "*vecchi*" valori**. Se non si ha cura di mantenere ordinato il proprio ambiente di lavoro potrebbe accadere che diversi oggetti vengano creati durante successive sessioni di lavoro. A questo punto si corre il rischio di perdere il controllo rispetto al vero contenuto degli oggetti e potremmo quindi utilizzare degli oggetti pensando che contengano un certo valore, quando invece si riferisono a tutt'altro. Questo comporta che qualsiasi nostro risultato perda di significato. Bisogna prestare molta attenzione perchè R non potrà avvisarci di questo errore (per lui sono solo numeri), siamo noi che dobbiamo essere consapevoli del fatto che i comandi eseguiti abbiano senso oppure no.

Per mantere un Environmet ordinato vi consigliamo innanzitutto di non salvare automaticamente il vostro *workspace* quando terminate una sessione di lavoro. E' possibile settare tale opzione nelle impostazioni generali di R selezionando *"Never"* alla voce *"save workspace to .RData on exit"* come riportato nella Figura seguente.

<center>
![](images/save-rdata.png){ width=75%}
</center>

Questo vi permetterà di iniziare ogni nuova sessione di lavoro in un Environment vuoto, evitando che vecchi oggetti si accumulino nel corso delle diverse sesssioni di lavoro. Durante le vostre sessioni, inoltre, sarà utile eseguire il comando `rm(list=ls())` quando inizierete un nuovo compito in modo da eliminare tutti i vecchi oggetti.

#### Environment una  Memoria a Breve Termine {-}

Notiamo quindi come l'Environment sia qualcosa di transitorio. Gli oggetti vengono salvati nella memoria primaria del computer (RAM, possiamo pensarla in modo analogo alla  memoria a breve termine dei modelli cognitivi) e verranno cancellati al comando `rm(list=ls())` o al termine di ogni sessione di lavoro.

Il fatto di partire ogni volta da un Environment vuoto, vi costringerà a raccogliere tutti i passi delle vostre analisi all'interno di uno script in modo ordinato evitando di fare affidamento su vecchi oggetti. Tutti gli oggetti necessari durante le analisi, infattii, dovranno essere ricreati ad ogni sessione, garantendo la riproducibilità e correttezza del lavro (almeno dal punto di vista di programmazione). Idealmente dovrebbe essere posibile, in una sessione di lavoro, partire da un Environment vuoto ed eseguire in ordine tutti i comandi contenuti in uno script fino ad ottenere i risultati desiderati.

E' facile intuire come in certe situazioni questa non sia la soluzione più efficiente. Alcuni comandi, infatti, potrebbero richiedere molti minuti (o anche giorni) per essere eseguiti. In questi casi sarebbe conveniente, pertanto, salvare i risultati ottenuti per poterli utilizzare anche in sessioni successive, senza la necessità di dover eseguire nuovamente tutti i comadi. Vedremo nel Capitolo TODO come sarà possibile salvare permanentemente gli oggetti creati nella memoria secondaria del computer (hard-disk, nella nostra analogia la memoria a lungo termine) e come caricarli in una successiva sessione di lavoro.

:::

## Working Directory

Il concetto di *working directory* è molto importante ma spesso poco conosciuto. La *working directory* è la posizione all'interno del computer in cui ci troviamo durante la nostra sessione di lavoro e da cui eseguiamo i nostri comandi.

### Organizzazione Computer

L'idea intuitiva che abbiamo comunemente del funzionamento del computer è fuorviante. Spesso si pensa che il Desktop rispecchi l'organizzazione del nostro intero computer e che tutte le azioni siano gestite attraverso l'interfaccia punta-e-clicca a cui ormai siamo abituati dai moderni sistemi operativi. 

Senza entrare nel dettaglio, è più corretto pensare all'organizzazione del cumputer come ad un insieme di cartelle e sottocartelle che contengono tutti i nostri file e al funzionamento del computer come ad un insieme di processi (o comandi) che vengono eseguiti. Gli stessi programmi che installiamo non sono altro che delle cartelle in cui sono contenuti tutti gli script che determinano il loro funzionamento. Anche il Desktop non è altro che una semplice cartella mentre quello che vediamo noi è un programma definito dal sistema operativo che visualizza il contenuto di quella cartella sul nostro schermo e ci permette di interfacciarci con il mouse.

Tutto quello che è presente nel nostro computer, compresi i nostri file, i  programmi e lo stesso sistema operativo in uso, tutto è organizzato in un articolato sistema di cartelle e sottocartelle. Approsimativamente possiamo pensare all'organizzazione del nostro computer in modo simile alla Figura \@ref(fig:file-system).

<div class="figure" style="text-align: center">
<img src="images/File-System.png" alt="Organizzazione Computer (from: https://en.wikipedia.org/wiki/Operating_system)" width="35%" />
<p class="caption">(\#fig:file-system)Organizzazione Computer (from: https://en.wikipedia.org/wiki/Operating_system)</p>
</div>

Ai livelli più bassi troviamo tutti i file di sistema ai quali gli utenti possono accedere solo con speciali autorizzazioni. Al livello superiore troviamo tutte i file riguardanti i programmi e applicazioni installati che in genere sono utilizzabili da più utenti sullo stesso computer. Infine troviamo tutte le cartelle e file che riguardano lo specifico utente.

###  Absolute Path e Relative Path 

Questo ampio preambolo riguardante l'organizzazione in cartelle e sottocartelle, ci serve perchè è la struttura che il computer utilizza per orientarsi tra tutti file quando esegue dei comandi attraverso un'interfaccia a riga di comando (e.g., R). Se vogliamo ad esempio caricare dei dati da uno specifico file in R devo fornire il *path* (o indirizzo) corretto che mi indichi esattamente la posizione del file all'interno della struttura di cartelle del computer. Ad esempio, immaginiamo di avere dei dati `My-data.Rda` salvato nella cartella `Introduction2R` nel proprio Desktop.

```
Desktop
 |
 |-  Introduction2R
 |    |
 |    |- Dati
 |    |   |- My-data.Rda
```

Per indicare la posizione del File potrei utilizzare un:

- **absolute path** - la posizione *"assoluta"* del file rispetto alla *root directory* del sistema ovvero la cartella principale dell'intero computer.

```r
# Mac
"/Users/<username>/Desktop/Introduction2R/Dati/My-data.Rda"

# Windows Vista
"c:\Users\<username>\Desktop\Introduction2R\Dati\My-data.Rda"

```

- **relative path** - la posizione del file rispetto alla nostra attuale posizione nel computer da cui stiamo eseguendo il comando, ovvero rispetto alla **working directory** della nostra sessione di lavoro. In questo riprendendo il precedente esempio se la nostra working directory fosse la cartella `Desktop/Introduction2R` avremmo i seguenti relative path:

```r
# Mac
"Dati/My-data.Rda"

# Windows Vista
"Dati\My-data.Rda"

```

Nota come sia preferibile l'utilizzo dei relative path poichè gli absolute path sono unici per il singolo computer di riferimento e non possono essere quindi utilizzati su altri computer.

:::{.warning title='"Error: No such file or directory"' data-latex='["Error: No such file or directory"]'}
Qualora si utilizzasse un relative path per indicare la posizione di un file, è importante che la working directory attualment in uso sia effettivamente quella prevista. Se ci trovassimo in una divesa cartella, ovviamente il "relative path" indicato non sarebbe più valido e R ci mostrerebbe un messaggio di errore.

Riprendendo l'esempio precedente, supponiamo che la nostra attuale working directory sia `Desktop` invece di `Desktop/Introduction2R`. Eseguendo il comadno `load()` per caricare i dati utilizzando il  relative path ora non più valido ottengo:


```r
load("Dati/My-data.Rda")
## Warning in readChar(con, 5L, useBytes = TRUE): cannot open compressed file
## 'Dati/My-data.Rda', probable reason 'No such file or directory'
## Error in readChar(con, 5L, useBytes = TRUE): cannot open the connection
```

Il messaggio di errore mi indica che R non è stato in grado di trovare il file seguendo le mie indicazioni. E' pertanto fondamentale essere sempre consapevoli di quale sia l'attuale working directory in cui si sta svolgendo la sessione di lavoro.

Ovviamente otterrei lo stesso errore anche usando un absolute path se questo contenesse degli errori.
:::

:::{.design title="The Garden of Forking Paths" data-latex="[The Garden of Forking Paths]"}
Come avrai notato dagli esempi precedenti, sia la struttura in cui vengono organizzati i file nel computer sia la sintassi utilizzata per indicare i path è differente in base al sistema operativo utilizzato.

#### Mac OS e Linux{-}

- Il carattere utilizzato per separare la cartelle nella definizione del path è `"/"`:

```r
"Introduction2R/Dati/My-data.Rda"
```
- Iniziando il path con il carattere `"/"` si indica la root-directory:

```r
"/Users/<username>/Desktop/Introduction2R/Dati/My-data.Rda"
```
- Iniziando il path con il carattere `"~"` si indica la cartella *home* dell'utente ovvero `/Users/<username>/`:

```r
"~/Desktop/Introduction2R/Dati/My-data.Rda"
```

#### Windows {-}
- Il carattere utilizzato per separare la cartelle nella definizione del path è `"\"`:

```r
"Introduction2R\Dati\My-data.Rda"
```
:::

### Working Directory in R 

Vediamo ora i comandi utilizzati in R per valutare e cambiare la working directory nella propria sessione di lavoro.

#### Attuale Working Directory {-}

In R è possibile valutare l'attuale working directory utilizzando il comando `getwd()` che restituirà l'absolute path dell'attuale posizione.


```r
getwd()
## [1] "/Users/<username>/Desktop/Introduction2R"
```

In alternativa, l'attuale working directory è anche riportata in alto a sinistra della Console come mostrato in Figura \@ref(fig:current-wd).

<div class="figure" style="text-align: center">
<img src="images/current-wd.png" alt="Workig directory dell'attuale sessione di lavoro" width="95%" />
<p class="caption">(\#fig:current-wd)Workig directory dell'attuale sessione di lavoro</p>
</div>

Premendo la freccia al suo fianco il pannello *Files* in basso a destra sarà reindirizzato direttamento alla workig directory dell'attuale sessione di lavoro. In questo modo sarà facile navigare tra i file e cartelle presenti al suo interno (vedi Figura \@ref(fig:current-folder)). 

<div class="figure" style="text-align: center">
<img src="images/current-folder.png" alt="Workig directory dell'attuale sessione di lavoro" width="65%" />
<p class="caption">(\#fig:current-folder)Workig directory dell'attuale sessione di lavoro</p>
</div>

#### Cambiare Working Directory {-}

Per cambiare la working directory è possibile utilizzare il comando `setwd()` indicando il path (absolute o relative) della nuova working directory. Nota come, nel caso in cui venga indicato un relative path, questo dovrà indicare la posizione della nuova working directory rispetto alla vecchia working directory.


```r
getwd()
## [1] "/Users/<username>/Desktop/Introduction2R"

setwd("Dati/")

getwd()
## [1] "/Users/<username>/Desktop/Introduction2R/Dati"
```

In alternativa è possibile selezionare l'opzione *"Choose Directory"* dal menù *"Session"* > *"Set Working Directory"* come mostrato in Figura \@ref(fig:set-wd). Verrà quindi richiesto di selezionare la working directory desiderata e preme "*Open*".

<div class="figure" style="text-align: center">
<img src="images/set-wd.png" alt="Definire la working directory" width="95%" />
<p class="caption">(\#fig:set-wd)Definire la working directory</p>
</div>

:::{.trick title="Show me the Path" data-latex="[Show me the Path]"}
Nota come sia possibile nel digitare il path sfruttare l'autocompletamento. All'interno delle virgolette `""` premi il tasto `Tab` per visualizzare i suggerimenti dei path relativi alla attuale working directory.

<center>
![](images/path-autocomplete.png){ width=75% }
</center>
<br>

E' possibile inoltre utilizzare i caratteri speciali `"./"` e `"../"` per indicare rispettivamente l'attuale working directory e la cartella del livello superiore (i.e., *parent folder*) che include l'attuale working directory.


```r
getwd()
## [1] "/Users/<username>/Desktop/Introduction2R"

setwd("../")

getwd()
## [1] "/Users/<username>/Desktop/"
```

:::

## R-packages

- scaricare
- library
- uso funzioni
- aggiornare i pacchetti

- box tip per l'uso di ::

## Errors and warnings

## Sessione di lavoro

- pulizia script
- Salvare script
- commenti 
- sezioni script
- settings
- sintassi (gli spazi e gli indent corretti alineamenti)
- idea di organizzare in vairi script, cartelle

### R projects




## Problema + Google = Soluzione

Quando si approccia la scrittura di codice, anche molto semplice la cosa che sicuramente capiterà più spesso sarà riscontrare **errori** e quindi trovare il modo per risolverli.

> Qualche programmatore esperto direbbe che l'essenza stessa di programmare è in realtà risolvere gli errori che il codice produce.

L'**errore non è quindi un difetto o un imprevisto**, ma parte integrante della scrittura del codice. L'importante è capire come gestirlo.

Abbiamo tutti le immagini in testa di programmatori da film che scrivono codice alla velocità della luce, quando nella realtà dobbiamo spesso affrontare **bug**, **errori di output** o altri problemi vari. Una serie di skills utili da imparare sono:

  * Comprendere a fondo gli **errori** (non banale)
  * Sapere **come e dove cercare una soluzione** (ancora meno banale) 
  * In caso non si trovi una soluzione direttamente, chiedere aiuto in modo efficace

#### Comprendere gli errori{-}
  
Rispetto agli errori, R è solitamente abbastanza esplicito nel farci capire il problema. Ad esempio usare una funzione di un pacchetto che non è stato caricato di solito fornisce un messaggio del tipo `Error in funzione : could not find function "funzione"`. 

#### Ricercare soluzioni{-}

Altre situazioni o messaggi potrebbero non essere altrettanto immediati, in quel caso Google è il nostro miglior amico.

Cercando infatti il messaggio di errore/warning su Google, al 99% avremo altre persone che hanno avuto lo stesso problema e probabilmente anche una soluzione.

:::{.trick title="Ricerca su Google" data-latex="[Ricerca su Google]"}
Il modo migliore per cercare è copiare e incollare su Google direttamente l'output di errore di R come ad esempio `Error in funzione : could not find function "funzione"` piuttosto che descrivere a parole il problema. I messaggi di errore sono standard per tutti, la tua descrizione invece no.
:::

Cercando in questo modo vedrete che molti dei risultati saranno esattamente riferiti al vostro errore:

<center>

![](images/stack_question.png)
</center>

#### Chiedere una soluzione

Se invece il vostro probelma non è un messaggio di errore ma un utilizzo specifico di R allora il consiglio è di usare una ricerca del tipo: `argomento + breve descrizione problema + R`. Nelle sezioni successive vedrete nel dettaglio altri aspetti della programmazione ma se volete ad esempio calcolare la **media** in R potrete scrivere `compute mean in R`. 
Mi raccomando, fate tutte le ricerche in **inglese** perchè le possibilità di trovare una soluzione sono molto più alte.

Dopo qualche ricerca, vi renderete conto che il sito che vedrete più spesso si chiama [**Stack Overflow**](https://stackoverflow.com/). Questo è una manna dal cielo per tutti i programmatori, a qualsiasi livello di expertise. E' una community dove tramite domande e risposte, si impara a risolvere i vari problemi ed anche a trovare nuovi modi di fare la stessa cosa. E' veramente utile oltre che un ottimo modo per imparare.

L'ultimo punto di questa piccola guida alla ricerca di soluzioni, riguarda il fatto di dover non solo cercare ma anche chiedere. Dopo aver cercato vari post di persone che richiedevano aiuto per un problema noterete che le domande e le risposte hanno sempre una struttura simile. Questo non è solo un fatto stilistico ma anzi è molto utile per uniformare e rendere chiara la domanda ma sopratutto la risposta, in uno spirito di condivisione. C'è anche una [guida dedicata](https://stackoverflow.com/help/how-to-ask) per scrivere la domanda perfetta.

In generale[^stack]:

- Titolo: un super riassunto del problema
- Contesto: linguaggio (es. R), quale sistema operativo (es. Windows)
- Descrizione del problema/richiesta: in modo chiaro e semplice ma non troppo generico
- Codice ed eventuali dati per capire il problema

L'ultimo punto di questa lista è forse il più importante e si chiama in gergo tecnico [**REPREX**](https://community.rstudio.com/t/faq-whats-a-reproducible-example-reprex-and-how-do-i-create-one/5219) (**Rep**roducible **Ex**ample). E' un tema leggermente più avanzato ma l'idea di fondo è quella di fornire tutte le informazioni possibili per poter riprodurre (e quindi eventualmente trovare una soluzione) il codice di qualcuno nel proprio computer.

Se vi dico "R non mi fa creare un nuovo oggetto, quale è l'errore?" è diverso da dire "il comando `oggetto -> 10` mi da questo errore `Error in 10 <- oggetto : invalid (do_set) left-hand side to assignment`, come posso risolvere?"

:::{.tip title="My title" data-latex="[My title]"}
Ci sono anche diversi pacchetti in R che rendono automatico creare questi esempi di codice da poter condividere, come il pacchetto [`reprex`](https://www.tidyverse.org/help/).
:::

[^stack]: Fonte: [Writing the perfect question - Jon Skeet](https://codeblog.jonskeet.uk/2010/08/29/writing-the-perfect-question/)


