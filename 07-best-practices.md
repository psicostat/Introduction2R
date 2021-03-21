# Sessione di Lavoro {#working-session}



In questo capitolo, discuteremo di alcuni aspetti generali delle sessioni di lavoro in R. Descriveremo delle buone abitudini riguardanti l'organizzazione degli scripts e l'uso degli *RStudio Projects* per essere ordinati ed efficaci nel proprio lavoro. Infine approfondiremo l'uso dei messaggi di R ed in particolare come comportarsi in caso di errori.

## Organizzazione Script

Abbiamo visto che idealmente tutti i passaggi delle nostre analisi devono essere raccolti in modo ordinato all'interno di uno script. Eseguendo in ordine linea per linea i comandi, dovrebbe essere possibile svolgere tutte le analisi fino ad ottenere i risultati desiderati.

Vediamo ora una serie di buone regole per organizzare in modo ordinato il codice all'interno di uno script e facilitare la sua lettura.

### Creare delle Sezioni

Per mantenere chiara l'oreganizzazione degli script e facilitare la sua comprensione, è utile suddividere il codice in sezioni dove vengono eseguiti i diversi step delle analisi. In RStudio è possibile creare una sezione aggiungendo al termine di una linea di commento i caratteri `####` o `----`. Il testo del commento verrà considerao il titolo della sezione e comparirà una piccola freccia a lato del numero di riga. E' possibile utilizzare a piacere i caratteri `#` o `-` per creare lo stile desiderato, l'importante è che la linea si concluda con almeno quattro caratteri identici.



```r
# Sezione 1 ####

# Sezione 2 ----

#----    Sezione 3    ----

####   Sezione non valida   --##

```

A titolo del tutto esemplificativo prendiamo in esempio la divisione in sezioni utilizzata nello script in Figura \@ref(fig:script-template).

<div class="figure" style="text-align: center">
<img src="images/script-template.png" alt="Esempio di suddivisione in sezioni di uno script" width="85%" style="background-color: #999999; padding:2px" />
<p class="caption">(\#fig:script-template)Esempio di suddivisione in sezioni di uno script</p>
</div>

- **Titolo** - Un titolo esplicativo del contenuto dello script. E' possibile utilizzare altri caratteri all'interno dei commenti per creare l'effetto desiderato.
- **Intorduzione** - Descrizione e utili informazioni che riguardano sia l'obbiettivo del lavoro che l'esecuzione del codice (e.g., dove sono disponibili i dati, eventuali specifiche tecniche). Potrebbe essere utile anche indicare l'autore e la data del lavoro.
- **Setting** -  Sezione fondamentale in cui si predispone l'abiente di lavoro. Le operazioni da svolgere sono:
  1. `rm(list = ls())` per pulire l'Environment da eventuali oggetti in modo da eseguire lo script partendo da un ambiente vuoto (vedi Capitolo \@ref(environment)).
  2. `setwd()` per settare la working directory per assicuraci che i comandi siano eseguiti dalla  correttta posizione nel nostro computer (vedi Capitolo \@ref(working-directory)).
  3. `library()` per caricare i pacchetti utilizzati nel corso delle analisi (vedi Capitolo \@ref(packages)).
- **Caricare e Pulire i Dati** - Generica sezione in cui eseguire l'importazione e pulizia dei dati.
- **Codifica e Scoring dei Dati** - Generica sezione in cui eseguire la codifica ed eventuale scoring dei dati.
- **Analisi Descrittive** - Generica sezione in cui eseguire le analisi descrittive.
- **Analisi Inferenziali** - Generica sezione in cui eseguire le analisi inferenziali

Oltre che a mantenere ordinato e chiaro il codice, suddividere il proprio script in sezioni ci permette anche di navigare facilmente tra le diverse parti del codice. Possiamo infatti sfruttare l'indice che automaticamente viene creato. L'indice è consultabile premendo il tasto in alto a destra dello script da cui successivamente selezionare la sezione desiderata (vedi Figura \@ref(fig:toc-side)).

<div class="figure" style="text-align: center">
<img src="images/toc-side.png" alt="Indice in alto per navigazione sezioni" width="85%" style="background-color: #999999; padding:2px" />
<p class="caption">(\#fig:toc-side)Indice in alto per navigazione sezioni</p>
</div>

In alternativa, è possibile utilizzare il menù in basso a sinistra dello script (vedi Figura \@ref(fig:toc-bottom)).

<div class="figure" style="text-align: center">
<img src="images/toc-bottom.png" alt="Menù in basso per navigazione sezioni" width="85%" style="background-color: #999999; padding:2px" />
<p class="caption">(\#fig:toc-bottom)Menù in basso per navigazione sezioni</p>
</div>

Infine, un altro vantaggio è quello di poter compattare o espandere le sezioni di codice all'interno dell'editor, utilizzando le frecce a lato del numero di riga (vedi Figura \@ref(fig:section-closed)).

<div class="figure" style="text-align: center">
<img src="images/section-closed.png" alt="Compattare ed espandere le sezioni di codice" width="85%" style="background-color: #999999; padding:2px" />
<p class="caption">(\#fig:section-closed)Compattare ed espandere le sezioni di codice</p>
</div>

### Sintassi

Elenchiamo qui altre buone norme nella scrittura del codice che ne facilitano la comprensione.

#### Commenti {-}

L'uso dei commenti è molto importante, ci permette di documentare le varie parti del codice e chiarire eventuli comandi difficili da capire. Tuttavia, non è necessario commentare ogni singola riga di codice ed anzi è meglio evitare di commentare laddove i comandi sono facilemtne interpetabili semplicemnte leggendo il codice.

La capacità di scrivere commenti utili ed eviare quelli rindondanti si impara con l'esperienza. In generale un commento non dovrebbe indicare *"che cosa"* ma piuttosto il *"perchè"* di quella parte di codice. Infatti il cosa è facilmente interpretabile dal codice stesso mentre il perchè potrebbe essere meno ovvio e soprattutto più utile per la comprensione dell'intero script. Ad esempio:

```r
x <- 10 # assegno a x il valore 10
x <- 10 # definisco massimo numero risposte
```
Il primo commento è inutile poichè è facilmente comprensibile dal codice stesso, mentre il secondo commento è motlo utile perchè chiarisce il significato della variabile e mi faciliterà nella comprensione del codice. 

#### Spazie, Indentazione ed allineamento {-}

In quasi tutti i linguaggi di programmazione gli spazi sono ignorati
R a differenza di altri linguaggi di programmazione non è 

#### Nomi Oggetti {-}
#### Esplicitare Argomenti {-}

Un'altra buona norma per mantenere 
- sintassi (gli spazi e gli indent corretti alineamenti)
- pulizia script
- comments
- nomi informativi (snake_case)
- funzioni esspliciti


## R projects

### Più di uno script

- idea di organizzare in vairi script, cartelle

- working directory tutto in funzione alla cartella

## Messages, Warnings e Errors

R utilizza la console per comunicare con noi durante le nostre sessioni di lavoro. Oltre a fornirci i risultati dei nostri comandi, R ci segnala anche altre utili informazioni attraverso diverse tipologie di messaggi. In particolare abbiamo:

- **Messages**: dei semplici messaggi che ci possono aggiornare ad esempio sullo stato di avanzamento di un dato compito oppure fornire suggerimenti sull'uso di una determinata funzione o pacchetto (spesso vengono mostrati quando viene caricato un pacchetto).
- **Warnings**: questi messaggi sono utlizzati da R per dirci che c'è stato qualche cosa di strano che ha messo in allerta R. R ci avvisa che, sebbene il comando sia stato eseguito ed abbiamo ottenuto un risultato, ci sono stati dei comportamenti inusuali o magari eventuali correzioni apportate in automatico. Nel caso di warnings non ci dobbiamo allramre, è importante controllare che i comandi siano corretti e che abbiamo effetivamente ottenuto il risultato desiderato. Una volta sicuri dei risultati possiamo procedere tranquillamente.
- **Errors**: R ci avvisa di eventuali errori e problemi che non permettono di eseguire il comando. in questo caso non otterremo nnessun risultato ma sarà necessario capire e risolvere il problema per poi rieseguire nuovamente il comando e procedere.

Notiamo quindi come non tutti i messaggi che R ci manda sono dei messaggi di errore. E' quindi importante non spaventarsi ma leggere con attenzione  i messaggi, molte volte si tratta semplicemente di avvertimenti o suggerimenti.


Tuttavia gli errori rappresentano sempre il maggiore dei problemi perchè non è possibile procedere nel lavoro senza averli prima risolti. E' importante ricordare che i messaggi di errore non sono delle critiche che R ci rivolge perchè sbagliamo. Al contrario, sono delle richieste di aiuto fatte da R perchè non sa come comportarsi. Per quanto super potente, R è un seplice programma che non può interpretare le nostre richieste ma si basa sull'uso dei comandi che seguono una rigida sintassi. A volte è sufficiente una virgola mancante o un charattere al posto di un numero per mandare in confusione R e richiedere il nostro intervento risolutore. 

### Risolvere gli Errori

Quando si approccia la scrittura di codice, anche molto semplice, la cosa che sicuramente capiterà più spesso sarà riscontrare  messaggi di **errore** e quindi trovare il modo per risolverli.

> Qualche programmatore esperto direbbe che l'essenza stessa di programmare è in realtà risolvere gli errori che il codice produce.

L'**errore non è quindi un difetto o un imprevisto**, ma parte integrante della scrittura del codice. L'importante è capire come gestirlo.

Abbiamo tutti le immagini in testa di programmatori da film che scrivono codice alla velocità della luce, quando nella realtà dobbiamo spesso affrontare **bug**, **errori di output** o altri problemi vari. Una serie di skills utili da imparare sono:

  * Comprendere a fondo gli **errori** (non banale)
  * Sapere **come e dove cercare una soluzione** (ancora meno banale) 
  * In caso non si trovi una soluzione direttamente, chiedere aiuto in modo efficace

#### Comprendere gli errori{-}
  
Leggere con attenzione i messaggi di errore è molto importante. R è solitamente abbastanza esplicito nel farci capire il problema. Ad esempio usare una funzione di un pacchetto che non è stato caricato di solito fornisce un messaggio del tipo `Error in funzione : could not find function "funzione"`.

Tuttavia, in altre situazioni i messaggi potrebbero non essere altrettanto chiari. Seppur esplicito R è anche molto sintetico e quindi l'utilzzo di un linguaggio molto specifico (e almeno inizialmente poco familiare), potrebbe rendere difficile capire il loro significato o addirittura renderli del tutto incomprensibili. Man mano che diventerete più esperti in R, diventerà sempre più semplice ed immmediato capire quale sia il problema e anche come risolverlo. Ma nel caso non si conosca la soluzione è necessario cercarla in altro modo.

#### Problema + Google = Soluzione {-}

In qualsiasi situazione Google è il nostro miglior amico.

Cercando infatti il messaggio di errore/warning su Google, al 99% avremo altre persone che hanno avuto lo stesso problema e probabilmente anche una soluzione.

:::{.tip title="Ricerca su Google" data-latex="[Ricerca su Google]"}
Il modo migliore per cercare è copiare e incollare su Google direttamente l'output di errore di R come ad esempio `Error in funzione : could not find function "funzione"` piuttosto che descrivere a parole il problema. I messaggi di errore sono standard per tutti, la tua descrizione invece no.
:::

Cercando in questo modo vedrete che molti dei risultati saranno esattamente riferiti al vostro errore:

<center>

![](images/stack_question.png)
</center>

#### Chiedere una soluzione {-}

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

:::{.trick title="reprex" data-latex="[reprex]"}
Ci sono anche diversi pacchetti in R che rendono automatico creare questi esempi di codice da poter condividere, come il pacchetto [`reprex`](https://www.tidyverse.org/help/).
:::

[^stack]: Fonte: [Writing the perfect question - Jon Skeet](https://codeblog.jonskeet.uk/2010/08/29/writing-the-perfect-question/)

