# Programmazione Condizionale {#coditionals}





Working in progress.

## Strutture condizionali

### if

<div class="figure" style="text-align: center">
<img src="images/if_chart.png" alt="Rappresentazione if" width="65%" />
<p class="caption">(\#fig:plot-if-chart)Rappresentazione if</p>
</div>

#### Struttura if {-}


```r
  ...
  
  if (<test>) {
    <codice-da-eseguire>
  }
  ...
```

#### Esempio {-}

- Singolo if

```r
my_function <- function(value){
  
  if(value > 0){
    cat("Il valore è maggiore di 0\n")
  }
  
  cat("Fine funzione\n")
}

my_function(5)
## Il valore è maggiore di 0
## Fine funzione

my_function(-5)
## Fine funzione
```

- Multipli if

```r
my_function <- function(value){
  
  if(value > 0){
    cat("Il valore è maggiore di 0\n")
  }
  
  if(value > 10){
    cat("Il valore è maggiore di 10\n")
  }
  
  cat("Fine funzione\n")
}

my_function(5)
## Il valore è maggiore di 0
## Fine funzione

my_function(15)
## Il valore è maggiore di 0
## Il valore è maggiore di 10
## Fine funzione

my_function(-5)
## Fine funzione
```


### if...else

<div class="figure" style="text-align: center">
<img src="images/ifelse_chart.png" alt="Rappresentazione if...else" width="65%" />
<p class="caption">(\#fig:plot-ifelse-chart)Rappresentazione if...else</p>
</div>

#### Struttura if {-}


```r
  ...
  
  if (<test>) {
    <codice-da-eseguire>
  } else {
    <codice-da-eseguire>
  }
  ...
```

#### Esempio {-}

- Singolo if...else

```r
my_function <- function(value){
  
  if(value >= 0){
    cat("Il valore è maggiore di 0\n")
  } else {
    cat("Il valore non è maggiore di 0\n")
  }
  
  cat("Fine funzione\n")
}

my_function(5)
## Il valore è maggiore di 0
## Fine funzione

my_function(-5)
## Il valore non è maggiore di 0
## Fine funzione
```

- Multipli if

```r
my_function <- function(value){
  
  if(value > 0){
    cat("Il valore è maggiore di 0\n")
  } else if (value > 10){
    cat("Il valore è maggiore di 10\n")
  } else {
    cat("Il valore non è maggiore di 0\n")
  }
  
  cat("Fine funzione\n")
}

my_function(5)
## Il valore è maggiore di 0
## Fine funzione

my_function(15)
## Il valore è maggiore di 0
## Fine funzione

my_function(-5)
## Il valore non è maggiore di 0
## Fine funzione
```

### Nested

<div class="figure" style="text-align: center">
<img src="images/ifnested.png" alt="Rappresentazione if nested" width="65%" />
<p class="caption">(\#fig:plot-ifnested)Rappresentazione if nested</p>
</div>

#### Struttura if {-}


```r
  ...
  
  if (<test>) {
    
    if(<test>) {
      <codice-da-eseguire>
    } else {
      <codice-da-eseguire>
    }
  }
  ...
```

#### Esempio {-}


```r
my_function <- function(value){
  
  if(value > 0){
    
    if(value > 10) {
      cat("Il valore è maggiore di 10\n")
    } else {
      cat("Il valore è maggiore di 0\n")
    }
    
  } else {
    cat("Il valore non è maggiore di 0\n")
  }
  
  cat("Fine funzione\n")
}

my_function(5)
## Il valore è maggiore di 0
## Fine funzione

my_function(15)
## Il valore è maggiore di 10
## Fine funzione

my_function(-5)
## Il valore non è maggiore di 0
## Fine funzione
```

### Esercizi {-}

Esegui i seguenti esercizi:
  
  1. Definisci una funzione per assegnare un voto in base alla percentuale di rispote corrette (*score*) segui le seguenti indicazioni: 
  
    - score < .55 insufficiente
    - .55 <= score < .65 - sufficiente
    - .65 <= score < .75 - buono
    - .75 <= score < .85 - distinto
    - .85 <= score - ottimo
    
  2. Definisci una funzione che determini se un numero è pari o dispari.
  3. Definisci una funzione che determini se un numero è un multiplo di 3, 4, o 5.
  4. Definisci una funzione che calcoli lo stipendio mensile considerando gli straordinari che sono retribuiti 1.5 della paga oraria normale. Utilizza come parametrile ore svolte nel mese, la paga oraria ed il tetto ore lavorative, oltre cui si contano gli straordinari.
  

## Altri Operatori Condizinali

### switch

#### Struttura switch {-}


```r

switch(my_value,
       case1 = action1,
       case2 = action2,
       ... )
```

#### Esempio {-}


```r
my_colors <- function(color){
  
  new_color <- switch(color,
       "rosso" = "red",
       "blu" = "blue",
       "verde" = ,
       "verde acqua" = "green",
       "Not Found")
  
  return(new_color)
}

my_colors("blu")
## [1] "blue"

my_colors("verde")
## [1] "green"

my_colors("arancione")
## [1] "Not Found"
```

### ifelse 

#### Struttura ifelse {-}


```r
ifelse(test = , no = , yes = )
```

#### Esempio {-}


```r
ifelse(test = {12 > 10}, no = "Non superore a 10", yes = "Superiore a 10")
## [1] "Superiore a 10"
```

