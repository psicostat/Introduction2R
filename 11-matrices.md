# Matrici {#matrix}





Working in progress.


## Creazione di Matrici


`<nome-matrice> <- matrix(data, nrow=n, ncol=s, byrow=FALSE)`

**Nota**: Di default R riempie la matrice per colonne, impostando `byrow = TRUE` si riempie per righe.


### Esercizi {-}

1. Crea la matrice `A` così definita: 

$$\begin{matrix}
2 & 34 & 12 & 7\\
46 & 93 & 27 & 99\\
23  & 38 & 7 & 04
\end{matrix}
$$

2. Crea la matrice `B` contenente tutti i primi 12 numeri dispari disposti su 4 righe e 3 colonne.
3. Crea la matrice `C` contenente i primi 12 multipli di 9 disposti su 3 righe e 4 colonne.
4. Crea la matrice `D`  formata da 3 colonne in cui le lettere `"A"`,`"B"` e `"C"` vengano ripetute 4 volte ciascuna rispettivamente nella prima, seconda e terza colonna.
5. Crea la matrice `E`  formata da 3 righe in cui le lettere `"A"`,`"B"` e `"C"` vengano ripetute 4 volte ciascuna rispettivamente nella prima, seconda e terza riga.

## Selezione di Elementi di una Matrice

In R per selezioneare gli elementi di matrice si deve indicare all'interno delle parentesi quadre l'indice di riga e l'indice di colonna (**separati da virgola**) degli elementi da selezionare oppure la condizione logica che devono rispettare.

`<nome-matrice>[<indice-riga>, <indice-colonna>]`

**Nota:** per selezionare tutti gli elementi di una data riga o di una data colonna basta lasciare vuoto rispettivamente l'indice di riga o l'indice di colonna.

### Esercizi {-}

1. Utilizzando gli indici di riga e di colonna selziona il numero 27 della matrice `A`
2. Selziona gli elementi compresi tra la seconda e quarta riga, seconda e terza colonna della matrice `B`
3. Seleziona solo gli elementi pari della matrice `A` (Nota: utilizza l'operazione resto `%%`)
4. Elimina dalla matrice `C` la terza riga e la terza colonna
5. Seleziona tutti gli elementi della seconda e terza riga della matrice `B`
6. Seleziona tutti gli elementi diversi da  “B” appartenenti alla matrice `D`

## Funzioni ed Operazioni tra Matrici


<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:table-matrix-operators)Operazioni con matrici</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Operazione </th>
   <th style="text-align:left;"> Nome </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> &lt;nuova-matrice&gt; &lt;- cbind(&lt;matrice1&gt;, &lt;matrice2&gt;) </td>
   <td style="text-align:left;"> Per unire due matrici creando nuove colonne (le matrici devono avere lo stesso numero di righe) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> &lt;nuova-matrice&gt; &lt;- rbind(&lt;matrice1&gt;, &lt;matrice2&gt;) </td>
   <td style="text-align:left;"> Per unire due matrici creando nuove righe (le matrici devono avere lo stesso numero di colonne) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nrow(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Per valutare il numero di righe della matrice </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ncol(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Per valutare il numero di colonne della matrice </td>
  </tr>
  <tr>
   <td style="text-align:left;"> dim(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Per valutare la dimensione della matrice (righe e colonne) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> t(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Per ottenere la trasposta della matrice </td>
  </tr>
  <tr>
   <td style="text-align:left;"> diag(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Ottenere un vettore con gli elementi della diagonale della matrice </td>
  </tr>
  <tr>
   <td style="text-align:left;"> det(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Ottenere il determinante della matrice (la matrice deve essere quadrata) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> solve(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Ottenere l'inversa della matrice </td>
  </tr>
  <tr>
   <td style="text-align:left;"> colnames(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Nomi delle colonne della matrice </td>
  </tr>
  <tr>
   <td style="text-align:left;"> rownames(&lt;nome-matrice&gt;) </td>
   <td style="text-align:left;"> Nomi delle righe della matrice </td>
  </tr>
  <tr>
   <td style="text-align:left;"> matrice1 + matrice2 </td>
   <td style="text-align:left;"> Somma elemento per elemento di due matrici </td>
  </tr>
  <tr>
   <td style="text-align:left;"> matrice1 - matrice2 </td>
   <td style="text-align:left;"> Differenza elemento per elemento tra due matrici </td>
  </tr>
  <tr>
   <td style="text-align:left;"> matrice1 * matrice2 </td>
   <td style="text-align:left;"> Prodotto elemento per elemento tra due matrici </td>
  </tr>
  <tr>
   <td style="text-align:left;"> matrice1 / matrice2 </td>
   <td style="text-align:left;"> Rapporto elemento per elemento tra due matrici </td>
  </tr>
  <tr>
   <td style="text-align:left;"> matrice1 %*% matrice2 </td>
   <td style="text-align:left;"> Prodotto matriciale </td>
  </tr>
</tbody>
</table>

**Note:**

- Per il significato di determinante di una matrice considera: <https://it.wikipedia.org/wiki/Determinante>
- Per il significato di matrice inversa considera: <https://it.wikipedia.org/wiki/Matrice_invertibile>
- Per  compiere operazioni elemento per elemento tra due matrici, esse devono avere la stessa dimensione
- Per compiere il prodotto matriciale il numero di colonne della prima matrice deve essere uguale al numero di righe della seconda matrice (vedi <https://it.wikipedia.org/wiki/Moltiplicazione_di_matrici>). 
- E' possibile assegnare nomi alle colonne e righe di una matrice rispettivamente atttraverso i comandi:

```r
colnames(<nome-matrice>)<-c("nome-1",...,"nome-s")}

rownames(<nome-matrice>)<-c("nome-1",...,"nome-n")}
```

### Esercizi {-}

1. Crea la matrice `G` unendo alla matrice `A` le prime due colonne della matrice `C`
2. Crea la matrice `H` unendo alla matrice `C` le prime due righe della matrice trasposta di `B`
3. Ridefinisci la matrice `A` eliminando la seconda colonna. Ridefinisci la matrice `B` eliminando la prima riga. Verifica che le  matrici così ottenute abbiano la stessa dimensione.
4. Commenta i differenti risultati che otteniamo nelle operazioni `A*B`, `B*A`, `A%*%B` e `B%*%A`.
5. Assegna i seguenti nomi alle colonne e alle righe della matrice `C`: `"col\_1", "col\_2", "col\_3", "col\_4", "row\_1", "row\_2", "row\_3"`.






