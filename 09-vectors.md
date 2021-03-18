# Vettori {#vector}




Working in progress


## Creazione di Vettori

In R per definire un vettore si utilizza il comando `<nome-vettore> <- c(<oggetti>)`. Ricorda che gli elementi devono essere separati da una virgola.


<!-- specificare diversi tipi di assign -->
<!-- specificare l'uso di c() -->
<!-- specificare l'uso di 1:10 -->
<!-- specificare l'uso di seq() le due differenti versioni -->
<!-- specificare l'uso di rep() le due differenti versioni -->


### Esercizi {-}

1. Crea il vettore `x` contenente i numeri 4, 6, 12, 34, 8
2. Crea il vettore `y` contenente tutti i numeri pari compresi tra 1 e 25 (`?seq()`)
3. Crea il vettore `z` contenente tutti i primi 10 multipli di 7 partendo da 13 (`?seq()`)
4. Crea il vettore `s` in cui le lettere `"A"`,`"B"` e `"C"` vengono ripetute nel medesimo ordine 4 volte (`?rep()`).
5. Crea il vettore `t` in cui le letter `"A"`,`"B"` e `"C"` vengono ripetute ognuna 4 volte (`?rep()`).

## Selezione Elementi di un Vettore

In R per selezioneare gli elementi di un vettore si deve indicare all'interno delle parentesi quadre la **posizione degli elementi** da selezionare, non il valore dell'elemento stesso:

`<nome-vettore>[<indice-posizione>]`\\
<!-- % esempio selezione con valori e non indici porta errore -->
<!-- % specificare selezione c() oppure senza c() che da errore dimensioni -->
In alternativa si puù definire la condizione logica che gli elementi che si vogliono selezionare devono rispettare.

Per *\textbf{**eliminare degli elementi** da un vettore si utilizza all'interno delle parentesi quadre l'operatore “-” insieme agli indici di posizione degli elementi da eliminare (esempio: `x[c(-2,-4)]` oppure `x[-c(2,4)]`).

<!-- % Maggiore descrizione eliminare -->
<!-- % funzione ?which() -->


### Esercizi {-}

1. Del vettore `x` seleziona il 2°, 3° e 5° elemento
2. Del vettore `y` seleziona tutti i valori minori di 13 o maggiori di 19
3. Del vettore `z` seleziona tutti i valori compresi tra 24 e 50
4. Elimina dal vettore `z` i valori 28 e 42
5. Del vettore `s` seleziona tutti gli elementi uguali ad  “A”
6. Del vettore `t` seleziona tutti gli elementi diversi da  “B”.

## Funzioni ed Operazioni tra Vettori

Per compiere operazioni tra vettori è necessario che essi abbiano identica lunghezza.

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:table-vector-operators)Operazioni con vettori</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Operazione </th>
   <th style="text-align:left;"> Nome </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> &lt;nuovo-vettore&gt; &lt;- c(&lt;vettore1&gt;, &lt;vettore2&gt;) </td>
   <td style="text-align:left;"> Per unire più vettori in un unico vettore </td>
  </tr>
  <tr>
   <td style="text-align:left;"> length(&lt;nome-vettore&gt;) </td>
   <td style="text-align:left;"> Per valutare il numero di elementi contenuti in un vettore </td>
  </tr>
  <tr>
   <td style="text-align:left;"> vettore1 + vettore2 </td>
   <td style="text-align:left;"> Somma di due vettori </td>
  </tr>
  <tr>
   <td style="text-align:left;"> vettore1 - vettore2 </td>
   <td style="text-align:left;"> Differenza tra due vettori </td>
  </tr>
  <tr>
   <td style="text-align:left;"> vettore1 * vettore2 </td>
   <td style="text-align:left;"> Prodotto tra due vettori </td>
  </tr>
  <tr>
   <td style="text-align:left;"> vettore1 / vettore2 </td>
   <td style="text-align:left;"> Rapporto tra due vettori </td>
  </tr>
</tbody>
</table>


**Nota:** In R il prodotto e rapporto tra vettori sono eseguiti  elemento per elemento (al contrario di molti altri software).

### Esercizi {-}

1. Crea il vettore `j` unendo i vettori `x` ed `z`.
2. Elimina gli ultimi tre elementi del vettore `j` e controlla che i vettori `j` e `y` abbiano la stessa lunghezza.
3. Calcola la somma tra i vettori `j` e `y`.
4. Moltiplica il vettore z per una costante `k=3`.
5. Calcola il prodotto tra i primi 10 elementi del vettore `y` ed il vettore `z`.









