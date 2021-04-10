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
  1. Definisci una funzione che permetta di fare gli auguri di buon natale e buona pasqua ad una persona.
  2. Definisci una funzione che, dato un vettore di valori numerici, calcoli il numero di elementi e la loro media.
  3. Definisci una funzione itnterattiva che calcoli il prodotto di due valori. Gli input devono essere ottenuti conlla funzione `readline()`.


## Lavorare con le Funzioni

Working in progress

- gestione errori
- ambiente di una funzione


```r

my_value <- 10

# Caso 1
my_function <- function(my_value){
  my_value <- my_value + 2
  
  return(my_value)
}

my_function(my_value = my_value)
## [1] 12
my_value
## [1] 10

# Caso 2
my_function <- function(){
  my_value <- my_value + 2
  
  return(my_value)
}

my_function()
## [1] 12
my_value
## [1] 10
```

- print vs cat (aspetto nel return)
- DRY
- source

