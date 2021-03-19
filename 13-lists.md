# Liste {#list}




Working in progress.

## Creazione di Liste

Le liste sono degli speciali oggi in R che permettono di contenere al loro interno altri oggetti indipendentemente dalla loro tipologia. Possiamo quindi avere nella stessa lista sia vettori, sia matrici sia DataFrames.

In R per definire una lista si utilizza il comando:

<nome-Lista> <- list(nome_oggetto_1 = oggetto_1, ..., nome_oggetto_n = oggetto_n)

All'interno si possono riportare vari oggettiche  si vogliono inserire con i relativi nomi, separati da virgole.

### Esercizi {-}

1. Crea la lista `esperimento_1` contenente:
    - DataFrame `data_wide`
    - la matrice `A`
    - il vettore `x`
    - la variabile `info = "Prima raccolta dati"`
2. Crea la lista `esperimento_2` contenente:
    - DataFrame `data_long`
    - la matrice `C`
    - il vettore `y`
    - la variabile `info = "Seconda raccolta dati"`

## Selezione di Elementi di una Lista

In R per selezioneare gli elementi di una lista si possono usare le doppie parentesi quadre indicando l'indice della posizione dell'oggetto che si vuole selezionare:

`nome_lista[[indice_posizione]]`
In alternativa, se i nomi degli oggetti sono stati specificati, è possibile utilizzare l'operatore "$" e il nome dell'oggetto da selezionare all'interno della lista:

`nome_lista$nome_oggetto`
In seguito per accedere a specifici elementi all'interno degli oggetti si utilizzano le stesse norme precedentemente presentate a seconda del tipo di oggetto.

**Esempio:** 
- `esperimento_1[[2]][,2]`
- `esperimento_1$data_wide$age`

**Nota:** per definire o cambiare i nomi degli oggetti contenuti in una lista è possibile utilizzare la funzione: `names(nome_lista) <- c(nome_oggetto_1, ..., nome_oggetto_n)`

### Esercizi {-}

1. Utilizzando gli **indici numerici** di posizione selziona i dati dei soggetti `subj_1` e `subj_4` riguardanti le variabili `age`,`sex` e `gruppo` dal DataFrame `data_wide` contenuto nella lista `esperimento_1`.
2. Compi la stessa selezione dell'esercizio precedente usando però questa volta il nome dell'oggetto per selezionare il DateFrame dalla lista.
3. Considerando la lista `esperimento_2` seleziona gli oggetti `data_long`, `y` e `info`
4. Cambia i nomi degli oggetti contenuti nella lista `esperimento_2` rispettivamente in `"dati_esperimento"`, `"matrice_VCV"`, `"codici_Id"` e `"note"`





