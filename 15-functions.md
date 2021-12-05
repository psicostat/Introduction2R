# Definizione di Funzioni {#functions}



Nel Capitolo \@ref(functions-def) abbiamo introdotto il concetto di funzioni e abbiamo visto come queste siano utilizzate per manipolare gli oggetti in R ed eseguire innumerevoli compiti. Nel Capitolo \@ref(packages) abbiamo visto inoltre come sia possibile utilizzare i pacchetti per accedere a nuove funzioni estendendo quindi notevolmente le possibili applicazioni di R. In R, tuttavia, è anche possibile definire le proprie funzioni per eseguire determinati compiti a seconda delle proprie specifiche necessità. 

Questo è uno dei vantaggi principali di utilizzare un linguaggio di programmazione, ovvero il poter sviluppare funzioni ad-hoc a seconda delle proprie esigenze e non limitarsi a quelle prestabilite. In questo capitolo descriveremo come creare le proprie funzioni in R.

## Creazione di una Funzione

Il comando usato per creare una funzione in R è `function()` seguito da una coppia di parentesi graffe `{ }` al cui interno deve essere specificato il corpo della funzione:


```r
nome_funzione <- function( ){
  <corpo-funzione>
}
```

Nota come sia necessario assegnare la funzione ad un oggetto, ad esempio `my_function`, che diventerà il nome della nostra funzione. Per eseguire la funzione sarà sufficiente, come per ogni altra funzione, indicare il nome della funzione seguito dalle parentesi tonde, nel nostro caso `my_function()`. Vediamo alcuni esempi di semplici funzioni:


```r
# Definisco la funzione
my_greetings <- function(){
  print("Hello World!")
}

my_greetings()
## [1] "Hello World!"

# Definisco un'altra funzione
my_sum <- function(){
  x <- 7
  y <- 3
  
  x + y
}

my_sum()
## [1] 10
```

Quando chiamiamo la nostra funzione, R eseguirà il corpo della funzione e ci restituirà il risultato dell'ultimo comando eseguito. Le funzioni del precedente esempio, tuttavia, si rivelano poco utili poichè eseguono sempre le stesse operazioni senza che ci sia permesso di specificare gli input delle funzioni. Inoltre, sebbene siano funzioni molto semplici, potrebbe non risultare chiaro quale sia effettivamente l'output restituito dalla funzione. 

:::{design title="Nomi Funzioni" data-latex="[Nomi Funzioni]"}
Nel definire il nome di una funzione è utile seguire le stese indicazioni che riguardavano i nomi degli oggetti (vedi Capitolo \@ref(objects-names)). In questo caso affinché un nome sia **auto-descrittivo** si tende ad utilizzare verbi che riassumano l'azione eseguita dalla funzione.
:::

### Definire Input e Output 

Ricordiamo che in generale le funzioni, ricevuti degli oggetti in input, compiono determinate azioni e restituiscono dei nuovi oggetti in output. Input e ouput sono quindi due aspetti aspetti fondamentali di ogni funzione che richiedono particolare attenzione.

- **Input** - Abbiamo anche visto che in R gli input vengono specificati attraverso gli **argomenti** di una funzione (vedi Capitolo \@ref(function-arguments)). Per definire gli argomenti di una funzione, questi devono essere indicati all'interno delle parentesi tonde al momento della creazione della funzione
- **Output** - Per specificare l'output di una funzione si utilizza la funzione `return()`, indicando tra le parentesi il nome dell'oggetto che si desidera restituire come risultato della funzione.

La definizione di una funzione con tutti i suoi elementi seguirà quindi il seguente schema:

```r
nome_funzione <- function(argument_1, argument_2, ...){
  <corpo-funzione>
  
  return(<nome-output>)
}
```

Possiamo ora riscrivere le precedenti funzioni permettendo di personalizzare gli input e evidenziando quale sia output che viene restituito.


```r
# Ridefinisco my_greetings()
my_greetings <- function(name){
  greetings <- paste0("Hello ", name, "!")
  
  return(greetings)
}

my_greetings(name = "Psicostat")
## [1] "Hello Psicostat!"

# Ridefinisco my_sum()
my_sum <- function(x, y){
  result <- x + y
  
  return(result)
}

my_sum(x = 8, y = 6)
## [1] 14
```

:::{.design title="User Input" data-latex="[User Input]"}
Qualora fosse necessario è possibile fare in modo che sia la funzione stessa a chiedere all'utente di inserire delle specifiche informazioni attraverso la funzione `readline()`.

Utilizzando la funzione `readline()` comparirà nella console il messaggio che abbiamo impostato nell'argomento `prompt` (ricordati di concludere lasciando uno spazio). All'utente sarà richiesto di digitare una qualche sequenza alfanumeirca e premere successivamente *invio*. I valori inseriti dell'utente saranno salvati come una variabile caratteri nell'oggetto che abbiamo indicato e potranno essere utilizzati sucessivamente nella funzione.


```r
happy_birthday <- function(){
  name <- readline(prompt = "Inserisci il tuo nome: ")
  message <- paste0("Buon Compleanno ", name, "!")
  
  return(message)
}

happy_birthday()
```

Nota che questa funzione possona essere usata solo in sessioni interattive di R poichè è richiesta un 'azione diretta da parte dell'utente.
:::

#### Default Argomenti {-}

Abbiamo visto come aggiungere degli argomenti che devono essere definiti dall'utente nell'utilizzare la funzione. Qualora l'utente non specifichi uno o più argomenti R riporterà un messaggio di errore indicando come ci siano  degli argomenti non specificati e senza valori di default.


```r
my_sum(x = 5)
## Error in my_sum(x = 5): argument "y" is missing, with no default
```

Per assegnare dei valori di default agli argomenti di una funzione, è sufficiente indicare al momento della creazione all'interno delle parentesi tonde `nome_argomento = <valore-default>`. Se non altrimenti specificati, gli argomenti assumeranno i loro valori di default. Tuttavia, gli utenti sono liberi di specificare gli argomenti della funzione a seconda delle loro esigenze. Ad esempio impostiamo nella funzione `my_sum()` il valore di default `y = 10`.


```r
my_sum <- function(x, y = 10){
  result <- x + y
  
  return(result)
}

# Utilizzo il valore di default di y
my_sum(x = 5)
## [1] 15

# Specifico il valore id y
my_sum(x = 5,  y = 8)
## [1] 13
```

Questa pratica è molto usata per specificare comportamenti particolari delle funzioni. In genere le funzioni sono definite con un funzionameto di default ma alcuni argomenti possono essere specificati per particolari essigenze solo quando necessario.

:::{.trick title="match.arg()" data-latex="[match.arg()]"}
Per imporre la scelta di un argomento tra una limitata serie di valori è possibile indicare nella definizione dell'argomento un vettore con le possibili entrate. Successivamente la scelta deve essere validata attraverso la funzione `match.arg()` come nell esempio successivo:


```r
# Ridefinisco my_greetings()
my_greetings <- function(name, type = c("Hello", "Goodbye")){
  
  type <- match.arg(type)
  greetings <- paste0(type," ", name, "!")
  
  return(greetings)
}

# Scelta type
my_greetings(name = "Psicostat", type = "Goodbye")
## [1] "Goodbye Psicostat!"

# Valore default
my_greetings(name = "Psicostat")
## [1] "Hello Psicostat!"

# Valore non ammesso
my_greetings(name = "Psicostat", type = "Guten Tag")
## Error in match.arg(type): 'arg' should be one of "Hello", "Goodbye"
```

La funzione `match.arg()` permette di confrontare il valore specificato risspetto a quelli indicati nella definizione dell'argomento, riportando un errore in mancanza di un match. Osserva come se non specificato il valore di default sia il primo indicato nella definizione.
:::

### Esercizi {-}

Esegui i seguenti esercizi:

  1. definisci una funzione che trasformi la temperatura da Celsius a Fahrenheit 
  $$
  Fahrenheit = Celsius *1.8 + 32
  $$
  2. Definisci una funzione che permetta di fare gli auguri di buon natale e buona pasqua ad una persona.
  3. Definisci una funzione che, dato un vettore di valori numerici, calcoli il numero di elementi e la loro media.
  4. Definisci una funzione iterattiva che calcoli il prodotto di due valori. Gli input devono essere ottenuti conlla funzione `readline()`.
  5. Definisci una funzione che calcoli lo stipendio mensile sulla base delle ore svolte nel mese e la paga oraria.


## Lavorare con le Funzioni

Le funzioni sono sicuramente l'aspetto più utile e avanzato del linguaggio R e in generale dei linguaggi di programmazione. I pacchetti che sono sviluppati in R non sono altro che insieme di funzioni che lavorano assieme per uno scopo preciso. Oltre allo scopo della funzione è importante capire come gestire gli **errori e gli imprevisti**. Se la funzione infatti accetta degli argomenti, l'utente finale o noi stessi che la utilizziamo possiamo erroneamente usarla nel modo sbagliato. E' importante quindi capire come leggere gli errori ma sopratutto creare messaggi di errore o di avvertimento utili per l'utilizzo della funzione.

Prendiamo ad esempio la funzione somma `+`, anche se non sembra infatti l'operatore `+` è in realtà una funzione. Se volessimo scriverlo come una funzione simile a quelle viste in precedenza possiamo:


```r
my_sum <- function(x, y){
  res <- x + y
  return(res)
}

my_sum(1, 5)
## [1] 6
```

Abbiamo definito una (abbastanza inutile) funzione per calcolare la somma tra due numeri. Cosa succede se proviamo a sommare un numero con una stringa? Ovviamente è un'operazione che non ha senso e ci aspettiamo un qualche tipo di errore:


```r
my_sum("stringa", 5)
## Error in x + y: non-numeric argument to binary operator
```
In questo caso infatti, vediamo un messaggio denominato `Error...` con l'utile informazione che uno degli argomenti utilizzati risulta essere `non-numeric`. E' un messaggio semplice, mirato e sopratutto non fornisce un risultato perchè una condizione fondamentale (la somma vale solo per i numeri) non è rispettata. La funzione `+` ha già al suo interno questo controllo, ma se noi volessimo implementare un **controllo** e fornire un **messaggio** abbiamo a disposizione diverse opzioni:

- `stop(<message>, .call = TRUE)`: Se inserito all'interno di una funzione, interrompe l'esecuzione e fornisce il messaggio specificato denominato come `Error`.
- `stopifnot(expr1, expr2, ...)`: Se inserito all'interno di una funzione interrompe l'esecuzione se almeno una di una serie di condizioni risulta come **non VERA**.
- `warning()`: Restituisce un messaggio all'utente senza tuttavia interrompere l'esecuzione ma fornendo informazioni su un possibile problema che deriva dal tipo di input o da un possibile effetto collaterale della funzione.
- `message()`: Fornisce un semplice messaggio senza alterare l'esecuzione della funzione che può essere utile per informare rispetto ad operazioni eseguite

Tornando all'esempio della somma, immaginiamo di voler scrivere una funzione che somma solo numeri positivi. In altri termini vogliamo che i valori `x` e `y` in input siano solo posiviti per poter eseguire la funzione. Possiamo quindi inserire un `controllo condizionale` e usare la funzione `stop()` nel caso in cui la condizione non sia rispettata:


```r
my_positive_sum <- function(x, y){
  if(x < 0 | y < 0){
    stop("Gli argomenti devono essere numeri positivi!")
  }
  res <- x + y
  return(res)
}

my_positive_sum(10, 5)
## [1] 15
my_positive_sum(10, -5)
## Error in my_positive_sum(10, -5): Gli argomenti devono essere numeri positivi!
```

Un modo più rapido di gestire l'arresto dell'esecuzione è usare `stopifnot()`. La logica tuttavia è leggermente diversa rispetto ad usare un `if` + `stop()`. Nell'esempio precedente la logica è: "se x oppure y sono minori di 0, stop". Con `stopifnot()` utilizziamo una logica inversa, ovvero inseriamo quello che vogliamo sia **VERO** e fermiamo l'esecuzione se è **FALSO**. Nel nostro caso usiamo `stopifnot(x > 0, y > 0)` ovvero fermati se x oppure y *NON SONO* maggiori di 0. Rispetto a `stop()` non fornisce un messaggio personalizzato ma restituisce la prima delle condizioni specificate che non è rispettata:


```r
my_positive_sum <- function(x, y){
  stopifnot(x > 0, y > 0)
  res <- x + y
  return(res)
}
my_positive_sum(10, -5)
## Error in my_positive_sum(10, -5): y > 0 is not TRUE
```

Allo stesso modo immaginiamo (con molta immaginazione) che la nostra funzione non sia affidabile con numeri minori di 10, nel senso che qualche volta potrebbe sbagliare il risultato. In questo caso non vogliamo interrompere l'esecuzione ma fornire un messaggi di `warning`:


```r
my_positive_sum <- function(x, y){
  # Error
  if(x < 0 | y < 0){
    stop("Gli argomenti devono essere numeri positivi!")
  }
  # Warning
  if(x < 10 | y < 10){
    warning("Per qualche strano motivo la funzione non gestisce bene i numeri minori di 10, attenzione!! :)")
  }
  res <- x + y
  return(res)
}

my_positive_sum(15, 4)
## Warning in my_positive_sum(15, 4): Per qualche strano motivo la funzione non
## gestisce bene i numeri minori di 10, attenzione!! :)
## [1] 19
```

Come vedete, abbiamo il risultato (ovviamente corretto) ma anche un messaggio di `warning` che ci avverte di questa possibile (ma non critica) problematica.

Infine possiamo accompagnare il risultato alcune condizioni che si realizzano con un semplice messaggio che fornisce ulteriori informazioni con la funzione `message()`:


```r
my_positive_sum <- function(x, y){
  # Error
  if(x < 0 | y < 0){
    stop("Gli argomenti devono essere numeri positivi!")
  }
  # Warning
  if(x < 10 | y < 10){
    warning("Per qualche strano motivo la funzione non gestisce bene i numeri minori di 10, attenzione!! :)")
  }
  res <- x + y
  message("Ottimo lavoro! :)")
  return(res)
}

my_positive_sum(12, 10)
## Ottimo lavoro! :)
## [1] 22
```

Un ultimo aspetto importante riguarda cosa avviene se assegniamo il risultato di una funzione in presenza di errori, warning o messaggi. In generale, tranne che per la presenza di errori e quindi usando la funzione `stop()`, l'output rimane lo stesso e il messaggio è solo stampato nella console:


```r
res1 <- my_positive_sum(10,5)
## Warning in my_positive_sum(10, 5): Per qualche strano motivo la funzione non
## gestisce bene i numeri minori di 10, attenzione!! :)
## Ottimo lavoro! :)
res2 <- my_positive_sum(10,23)
## Ottimo lavoro! :)
res3 <- my_positive_sum(10,-1)
## Error in my_positive_sum(10, -1): Gli argomenti devono essere numeri positivi!

res1
## [1] 15
res2
## [1] 33
res3 # nessun output
## Error in eval(expr, envir, enclos): object 'res3' not found
```

Come vedete infatti, quando abbiamo un errore e fermiamo l'esecuzione, la funzione pur prevedendo un output, non fornisce risultato perchè è stata interrotta.

## Ambiente della funzione

Il concetto di `ambiente` in R è abbastanza complesso[^capitolo-7-hadley]. In parole semplici, tutte le operazioni che normalmente eseguiamo nella console o in uno script, avvengono in quello che si chiama `global environment`. Quando scriviamo ed eseguiamo una funzione, stiamo creando un oggetto funzione (nel `global environment`) che a sua volta crea un ambiente interno per eseguire le operazioni previste. Immaginiamo di avere questa funzione `my_fun()` che riceve un valore `x` e lo somma ad un valore `y` che non è un argomento.


```r
my_fun <- function(x){
  return(x + y)
}

my_fun(10)
## Error in my_fun(10): object 'y' not found
```
Chiaramente otteniamo un errore perchè l'oggetto `y` non è stato creato. Se però creiamo l'oggetto `y` all'interno della funzione, questa esegue regolarmente la somma MA non crea l'oggetto `y` nell'ambiente globale.


```r
my_fun <- function(x){
  y <- 1
  return(x + y)
}

my_fun(10)
## [1] 11
ls() # abbiamo solo la nostra funzione come oggetto
## [1] "my_fun"          "my_greetings"    "my_positive_sum" "my_sum"         
## [5] "res1"            "res2"
```

Da qui è chiaro che quello che avviene all'interno della funzione è in qualche modo compartimentalizzato rispetto all'ambiente globale. L'unico modo per influenzare l'ambiente globale è quello di assegnare il risultato della funzione, creando quindi un nuovo oggetto:


```r
res <- my_fun(10)
ls()
## [1] "my_fun"          "my_greetings"    "my_positive_sum" "my_sum"         
## [5] "res"             "res1"            "res2"
```

Altra cosa importante, sopratutto per gestire effetti collaterali riguarda il fatto che la funzione NON modifica gli oggetti presenti nell'ambiente globale:


```r
y <- 10 # ambiente globale

my_fun <- function(x){
  y <- 1 # ambiente funzione
  return(x + y) # questo si basa su y funzione
}

my_fun(1)
## [1] 2
y
## [1] 10
```

Come vedete, abbiamo creato un oggetto `y` dentro la funzione. Se eseguito nello stesso ambiente questo avrebbe sovrascritto il precedente valore. Il risultato si basa sul valore di `y` creato nell'ambiente funzione e l'`y` globale non è stato modificato.

Un ultimo punto importante riguarda invece il legame tra ambiente funzione e quello globale. Abbiamo visto la loro indipendenza che però non è totale. Se infatti all'interno della funzione utilizziamo una variabile definita solamente nell'ambiente globale, la funzione in automatico userà quel valore (se non specificato internamente). Questo è utile per far lavorare funzioni e variabili globali MA è sempre preferibile creare un ambiente funzione indipendente e fornire come **argomenti** tutte gli oggetti necessari.


```r
y <- 10

my_fun <- function(x){
  return(x + y) # viene utilizzato y globale
}

my_fun(1)
## [1] 11
```

Le cose importanti da ricordare quando si definiscono e utilizzano funzioni sono:

- Ogni volta che una funzione viene eseguita, l'ambiente interno viene ricreato e quindi è come ripartire da zero
- Gli oggetti creati all'interno della funzione hanno priorità rispetto a quelli nell'ambiente esterno
- Se la funzione utilizza un oggetto non definito internamente, automaticamente cercherà nell'ambiente principale


[^capitolo-7-hadley]: per una non semplice trattazione dell'argomento, il [capitolo 7](https://adv-r.hadley.nz/environments.html) del libro "Advanced R" di Hadley Wickam è un ottima risorsa.

## Best practice

Scrivere funzioni è sicuramente l'aspetto più importante quando si scrive del codice. Permette di automatizzare operazioni, ridurre la quantità di codice, rendere più chiaro il nostro script e riutilizzare una certa porzione di codice in altri contesti. Ci sono tuttavia delle convenzioni e degli accorgimenti per scrivere delle ottime e versatili funzioni:

- Quando serve una funzione?
- Scegliere il nome
- Semplificare la quantita di operazioni e output
- Commentare e documentare

### Quando serve una funzione?

[Hadley Wickam](https://r4ds.had.co.nz/functions.html#when-should-you-write-a-function) suggerisce che se ripetiamo una serie di operazioni più di 2 volte, forse è meglio scrivere una funzione. Immaginiamo di avere una serie di oggetti e voler eseguire la stessa operazione in tutti. Ad esempio vogliamo *centrare* (ovvero sottrarre a tutti i valori di un vettore la loro media) un vettore numerico:


```r
vec1 <- runif(10)
vec2 <- runif(10)
vec3 <- runif(10)
```

Abbiamo visto nei capitoli precedenti l'utilizzo dell'`apply` family e come si possa applicare una funzione ad una serie di oggetti. Pensiamo però ad un caso dove abbiamo uno script molto lungo e in diversi momenti eseguiamo una certa operazione:


```r
# Centriamo
vec1 - mean(vec2)
##  [1] -0.18853178 -0.10408462  0.14814783  0.38352436 -0.06313845  0.08299530
##  [7] -0.28173521  0.30159253 -0.27248970 -0.09635197
vec2 - mean(vec2)
##  [1] -0.090708998 -0.445927683 -0.001188793  0.126374024  0.165388422
##  [6] -0.420217628  0.197534359  0.099567857  0.310437430  0.058741011
vec3 - mean(vec3)
##  [1] -0.15537050  0.25271389  0.02985959 -0.10411656 -0.04848847 -0.05213546
##  [7] -0.13517389  0.21667716  0.05511704 -0.05908281
```

L'operazione viene eseguita correttamente ed è anche di facile comprensione. Tuttavia stiamo eseguendo sempre la stessa cosa, semplicemente cambiando un input (proprio la definizione di funzione) quindi possiamo:


```r
my_fun <- function(x){
  return(x - mean(x))
}

my_fun(vec1)
##  [1] -0.17952461 -0.09507745  0.15715500  0.39253153 -0.05413128  0.09200247
##  [7] -0.27272804  0.31059970 -0.26348253 -0.08734480
my_fun(vec2)
##  [1] -0.090708998 -0.445927683 -0.001188793  0.126374024  0.165388422
##  [6] -0.420217628  0.197534359  0.099567857  0.310437430  0.058741011
my_fun(vec3)
##  [1] -0.15537050  0.25271389  0.02985959 -0.10411656 -0.04848847 -0.05213546
##  [7] -0.13517389  0.21667716  0.05511704 -0.05908281
```

Il codice non è molto cambiato rispetto a prima in termini di numero di righe o complessità. Immaginate però di esservi resi conto di un errore o di voler cambiare o estendere le operazioni su`vec1, vec2 e vec3`. Nel primo caso dovreste andare linea per linea dello script e modificare il codice. Nel caso di una funzione, semplicemente cambiando le operazioni queste verranno applicate ogni volta che quella funzione è chiamata. Immaginiamo di voler anche *standardizzare* (sottrarre la media e dividere per la deviazione standard) i nostri vettori:


```r
my_fun <- function(x){
  res <- (x - mean(x)) / sd(x)
  return(res)
}

my_fun(vec1)
##  [1] -0.7778936 -0.4119777  0.6809644  1.7008686 -0.2345549  0.3986536
##  [7] -1.1817511  1.3458518 -1.1416896 -0.3784716
my_fun(vec2)
##  [1] -0.358638784 -1.763077157 -0.004700166  0.499648626  0.653900980
##  [6] -1.661426569  0.780997299  0.393664310  1.227385431  0.232246031
my_fun(vec3)
##  [1] -1.1093019  1.8043065  0.2131891 -0.7433632 -0.3461941 -0.3722326
##  [7] -0.9651038  1.5470143  0.3935202 -0.4218347
```

Ovviamente la combinazione di funzione e `apply` family permette di rendere il tutto ancora più compatto ed efficiente:


```r
my_list <- list(vec1, vec2, vec3)
lapply(my_list, my_fun)
## [[1]]
##  [1] -0.7778936 -0.4119777  0.6809644  1.7008686 -0.2345549  0.3986536
##  [7] -1.1817511  1.3458518 -1.1416896 -0.3784716
## 
## [[2]]
##  [1] -0.358638784 -1.763077157 -0.004700166  0.499648626  0.653900980
##  [6] -1.661426569  0.780997299  0.393664310  1.227385431  0.232246031
## 
## [[3]]
##  [1] -1.1093019  1.8043065  0.2131891 -0.7433632 -0.3461941 -0.3722326
##  [7] -0.9651038  1.5470143  0.3935202 -0.4218347
```

### Scegliere il nome

Questo potrebbe sembrare un argomento marginale tuttavia la scelta dei nomi sia per le variabili ma sopratutto per le funzioni è estremamente importante. Permette di:

- leggere chiaramente il nostro codice e renderlo comprensibile ad altri
- organizzare facilmente un gruppo di funzioni. Quando avete più funzioni, usare una giusta denominazione permette di sfruttare i suggerimenti di RStudio in modo più efficace. Il pacchetto [`stringr`](https://stringr.tidyverse.org/) and esempio che fornisce strumenti per lavorare con stringhe, utilizza tutte le funzioni denominate come `str_` permettendo di cercare facilmente quella desiderata.

E' utile utilizzare **verbi** per nominare le funzioni mentre **nomi** per nominare argomenti. Ad esempio un nome adatto alla nostra ultima funzione potrebbe essere `center_var()` mentre il nome del nuovo vettore `centered_vec` o `c_vec`. Se troviamo `center_var` all'interno di uno script è subito chiaro il compito di quella funzione, anche senza guardare il codice al suo interno.

### Semplificare la quantita di operazioni e output

Questo è un punto molto importante ma allo stesso tempo variegato. Ci sono diversi stili di programmazione e quindi non ci sono regole fisse oppure delle pratiche migliori di altre.
Abbiamo detto che una funzione è un modo per astrarre, riutilizzare e semplificare una serie di operazioni. Possiamo quindi scrivere funzioni molto complesse che ricevono diversi input, eseguono diverse operazioni e restituiscono diversi output. E' buona pratica però scrivere funzioni che:

- riducono il numero di operazioni interne
- forniscono un singolo (o limitati) output
- hanno un numero di input limitato

Se quindi abbiamo pensato ad una funzione che ha troppi output, è troppo complessa oppure ha troppi input magari possiamo valutare di scomporre la funzione in sotto-funzioni.

Facciamo un esempio con la nostra `center_vec()`. Possiamo pensare a diverse alternative ed estensioni di questa funzione. Ad esempio possiamo pensare di creare una funzione che centra oppure standardizza il vettore. Possiamo inoltre scegliere se centrare usando la media oppure la mediana. Quindi possiamo pensare a una macro funzione `trans_vec()` che in base agli argomenti trasforma il vettore:


```r
trans_vec <- function(x, what = c("center_mean", "center_median", "standardize")){
  if(match.arg(what) == "center_mean"){
    res <- x - mean(x)
  }else if(match.arg(what) == "center_median"){
    res <- x - median(x)
  }else if(match.arg(what) == "standardize"){
    res <- (x - mean(x))/sd(x)
  }
  return(res)
}

vec <- runif(10)
trans_vec(vec, "center_mean")
##  [1]  0.29192434  0.03748076 -0.35021979 -0.20604710 -0.13540409 -0.21750540
##  [7] -0.18796373  0.30731902  0.17952290  0.28089308
trans_vec(vec, "center_mean")
##  [1]  0.29192434  0.03748076 -0.35021979 -0.20604710 -0.13540409 -0.21750540
##  [7] -0.18796373  0.30731902  0.17952290  0.28089308
trans_vec(vec, "standardize")
##  [1]  1.1721007  0.1504884 -1.4061618 -0.8272964 -0.5436588 -0.8733024
##  [7] -0.7546901  1.2339116  0.7207995  1.1278093
```

La funzione è molto chiara ma comunque contiene dei margini di fragilità. L'utente deve inserire una per stringa eseguire l'operazione. Ci sono diversi `if` e lo scopo della funzione è forse troppo generico. Una migliore soluzione sarebbe quella di scrivere 3 funzioni più semplici, mirate e facili da mantenere e leggere:


```r
center_vec_mean <- function(x){
  return(x - mean(x))
}

center_vec_median <- function(x){
  return(x - median(x))
}

standardize_vec <- function(x){
  return((x - mean(x)) / sd(x))
}

vec <- runif(10)
center_vec_mean(vec)
##  [1]  0.2188385  0.2132307  0.4995843 -0.3162471 -0.3436599 -0.1974193
##  [7]  0.3132212 -0.3566487 -0.1797533  0.1488535
center_vec_median(vec)
##  [1]  0.2342884  0.2286806  0.5150341 -0.3007972 -0.3282100 -0.1819694
##  [7]  0.3286711 -0.3411988 -0.1643034  0.1643034
standardize_vec(vec)
##  [1]  0.6999253  0.6819897  1.5978527 -1.0114734 -1.0991497 -0.6314189
##  [7]  1.0017957 -1.1406926 -0.5749166  0.4760878
```

In questo modo il codice è molto più leggibile e chiaro sia dentro le funzioni che quando le funzioni vengono utilizzate. Un'ulteriore alternativa sarebbe quella di raggruppare le funzione di "centramento" specificando se utilizzare media o mediana e separare quella di standardizzazione.

### Commentare e documentare

La documentazione è forse la parte di più importante della scrittura del codice. Possiamo classificarla in documentazione *formale* e *informale* in base allo scopo. La documentazione *formale* è quella che troviamo facendo `help(funzione)` oppure `?funzione`. E' una documentazione standardizzata e necessaria quando si creano delle funzioni in un pacchetto che altri utenti devono utilizzare. La documentazione *informale* è quella che mettiamo nei nostri script e all'interno delle funzioni come `# commento`. Entrambe sono molto importati e permettono di descrivere lo scopo generale della funzione, i singoli argomenti e i passaggi eseguiti.

## Importare una funzione

Abbiamo già visto che il comando `library()` carica un certo pacchetto, rendendo le funzioni contenute disponibili all'utilizzo. Senza la necessità di creare un pacchetto, possiamo comunque organizzare le nostre funzioni in modo efficace. Abbiamo 2 opzioni:

- scrivere le funzioni nello stesso script dove esse vengono utilizzate
- scrivere uno script separato e importare tutte le funzioni contenute

Anche in questo caso è una questione di stile e comodità, in generale:

- Se abbiamo tante funzioni, è meglio scriverle in uno o più file separati e poi importarle all'inizio dello script principale
- Se abbiamo poche funzioni possiamo tenerle nello script principale, magari in una sezione apposita nella parte iniziale

Nel secondo caso è sufficiente quindi scrivere la funzione e questa sarà salvata come oggetto nell'ambiente principale. Riguardo il primo scenario si può utilizzare la funzione `source("percorso/script.R")`. La funzione `source()` accetta il percorso di uno script R che verrà poi eseguito in background. Quindi se la vostra directory è organizzata in questo modo:

```
- working directory/
|-- main_script.R
|-- functions/
    |-- my_functions.R
```
Dove lo script `my_functions.R` è uno script dove sono dichiarare tutte le funzioni:

```r
fun1 <- function(x){
  # do
}

fun2 <- function(x){
  # do
}

fun3 <- function(x){
  # do
}

...
```

Scrivendo all'inizio del nostro script principale `source("functions/my_functions.R")`, tutte le funzioni saranno caricate nel ambiente di lavoro.

<!-- TODO print vs cat (aspetto nel return) -->
