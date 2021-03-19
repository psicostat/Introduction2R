# Data Type {#data-type}


Working in progress.

Tipi di vettori

In R ci sono 4 tipi differenti di vettori: numerici, logici, caratteri e fattori.

## Vettori Numerici

I vettori numerici sono utilizzati per compiere operazioni aritmetiche, in R sono indicati come `num`. In R ci sono è possibil e specificare se i numeri contenuti nel vettore sono numeri interi, avremmo quindi un vettore di valori interi (indicato in R come `int`). Per fare ciò è possibile aggiungere `L` ad ogni valore numerico nel definire il vettore oppure usare la funzione `as.integer()` per trasformare un vettore numerico in un vettore intero.

**Esempio:**


```r
x <- c(4L, 6L, 12L, 34L, 8L)

x <- as.integer(c(4, 6, 12, 34, 8))
```

**Nota**: per trasformare un vettore intero in un vettore numerico è possibile usare la funzione `as.numeric()`.

## Vettori logici

I vettori logici sono formati dai volori `TRUE` e `FALSE`, che possono essere  abbreviati rispettivamente in `T` e `F`. In R i vettori logici sono indicati come `logi`. In genere, i vettori logici sono il risultato delle operazioni in cui viene chiesto ad R di valutare la condizione logica di una proposizione.

```r
x>10
## [1] FALSE FALSE  TRUE  TRUE FALSE
```

**Nota:** in R, come in molti altri software di programmazione, `TRUE` assume il valore numerico `1` e `FALSE` assume il valore `0`. 

```r
sum(x>10)
## [1] 2
```
E' possibile trasformare un vettore numerico in un vettor logico attraverso la funzione `as.logical()`, gli `0` assumeranno il valore `FALSE` mentre qualsiasi altro numero assumerà il valore `TRUE`.

```r
as.logical(c(1,0,.034,-1,0,8))
## [1]  TRUE FALSE  TRUE  TRUE FALSE  TRUE
```

## Vettori di caratteri

I vettori di caratteri contengono stringhe di caratteri e sono indicati in R con `chr}. Non è possibile eseguire operazioni aritmetiche con vettori di caratteri ma solo valutare se due stringhe sono uguali o differenti.


```r
j<-c("Hello","World","hello","world")
j=="hello"
## [1] FALSE FALSE  TRUE FALSE
```
Per trasformare un vettore qualsiasi in una vettore di caratteri e possibile usare la funzione `as.character()`.

```r
as.character(x)
## [1] "4"  "6"  "12" "34" "8"
as.character(x>10)
## [1] "FALSE" "FALSE" "TRUE"  "TRUE"  "FALSE"
```
