---
output:
  html_document: default
  pdf_document: default
editor_options:
  chunk_output_type: console
---
# Primi Passi in R {#first-comands}



Ora che abbiamo iniziato a famigliarizzare con il nostro stumento di lavoro possiamo finalmente dare fuoco alle polveri e concentraci sulla scrittura di codici!

In questo capitolo muoveremo i primi passi in R. Inizialmente vedremo come utilizzare operatori matematici e logici per compiere semplici operazioni in R. Introdurremo successivamente l'uso delle variabili e delle funzioni.

Imparare R è un lungo percorso (scoop: questo percorso non termina mai dato che R è sempre in continuo sviiluppo). Soprattutto all'inizio può sembrare eccessivamente difficile poichè è si incontrano per la prima volta molti comandi e concetti di programmazione. Tuttavia, una volta famigliarizzato con gli apetti di base, la progressione diventa sempre più veloce (inarrestabile direi!).

In questo capitolo introdurremo per la prima volta molti elementi che saranno poi ripresi e approfonditi nei seguenti capitoli. Quindi non preoccuparti se non tutto ti sarà chiaro fin da subito. Imparare il tuo primo linguaggio di programmazione è difficile ma da qualche parte bisogna pure iniziare. Pronto per le tue prime linee di codice? Let's become a useR!

## Operatori Matematici

R è un'ottima calcolatrice. Vediamo quali sono i principali operatori matematici e funzioni usate.

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Funzione </th>
   <th style="text-align:left;"> Nome </th>
   <th style="text-align:left;"> Esempio </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> x + y </td>
   <td style="text-align:left;"> Addizione </td>
   <td style="text-align:left;"> &gt; 5 + 3 <br>[1] 8 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x - y </td>
   <td style="text-align:left;"> Sottrazione </td>
   <td style="text-align:left;"> &gt; 7 - 2 <br>[1] 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x * y </td>
   <td style="text-align:left;"> Moltiplicazione </td>
   <td style="text-align:left;"> &gt; 4 * 3 <br>[1] 12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x / y </td>
   <td style="text-align:left;"> Divisione </td>
   <td style="text-align:left;"> &gt; 8 / 3 <br>[1] 2.666667 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x %% y </td>
   <td style="text-align:left;"> Resto della divisione </td>
   <td style="text-align:left;"> &gt; 7 %% 5 <br>[1] 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x %/% y </td>
   <td style="text-align:left;"> Divisione intera </td>
   <td style="text-align:left;"> &gt; 7 %/% 5 <br>[1] 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x ^ y </td>
   <td style="text-align:left;"> Potenza </td>
   <td style="text-align:left;"> &gt; 3 ^ 3 <br>[1] 27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> abs(x) </td>
   <td style="text-align:left;"> Valore assoluto </td>
   <td style="text-align:left;"> &gt; abs(3-5^2) <br>[1] 22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> sign(x) </td>
   <td style="text-align:left;"> Segno di un'espressione </td>
   <td style="text-align:left;"> &gt; sign(-8) <br>[1] -1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> sqrt(x) </td>
   <td style="text-align:left;"> Radice quadrata </td>
   <td style="text-align:left;"> &gt; sqrt(25) <br>[1] 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> log(x) </td>
   <td style="text-align:left;"> Logaritmo naturale </td>
   <td style="text-align:left;"> &gt; log(10) <br>[1] 2.302585 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> exp(x) </td>
   <td style="text-align:left;"> Esponenziale </td>
   <td style="text-align:left;"> &gt; exp(1) <br>[1] 2.718282 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> sin(x)<br>cos(x)<br>tan(x)<br>asin(x)<br>acos(x)<br>atan(x) </td>
   <td style="text-align:left;"> Funzioni trigonometriche </td>
   <td style="text-align:left;"> &gt;sin(pi/2) <br>[1]1 <br>&gt;cos(pi/2) <br>[1]6.123234e-17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> factorial(x) </td>
   <td style="text-align:left;"> Fattoriale </td>
   <td style="text-align:left;"> &gt; factorial(6) <br>[1] 720 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> choose(n, k) </td>
   <td style="text-align:left;"> Coefficiente binomiale </td>
   <td style="text-align:left;"> &gt; choose(5,3) <br>[1] 10 </td>
  </tr>
</tbody>
</table>

:::{.tip title="Le prime funzioni" data-latex="[Le prime funzioni]"}
Nota come per svolgere operazioni come la radice quadrata o il valore assoluto vengono utlizzate delle specifiche funzioni. In R le funzioni sono richiamate digitando `<nome-funnzione>()` (e.g., `sqrt(25)`) indicando all'interno delle parentesi tonde gli argomenti della funzione. Approfondiremo le funzioni nella Sezione TODO. 
:::

### Ordine operazioni

Nello svolgere le operazioni, R segue lo stesso l'ordine usato nelle normali espressioni matematiche. Quindi l'ordine di precedenza degli operatori è:

1. `^` (potenza)
2. `%%` (resto della divisione) e `%/%` (divisione intera) 
3. `*` (moltiplicazione) e `/`(divisione)
4. `+` (addizione) e `-`(sotttrazione)

Nota che in presenza di funzioni (e.g., `abs()`, `sin()`), R per prima cosa sostituisca le funzioni con il loro risultato per poi procedere con l'esecuzione delle operazioni nell'ordine indicato precedentemente.

L'ordine di esecuzione delle operazioni può essere controllato attraverso l'uso delle **parentesi tondone** `()`. R eseguirà tutte le operazioni incluse nelle parentesi seguendo lo stesso ordine  inndicato sopra. Utilizzando più gruppi di parentesi possiamo ottenere i risultati desiderati.

:::{.warning title="Le parentesi" data-latex="[Le parentesi]"}
Nota che in R solo le **parentesi tonde** `()` sono utilizzate per gestire l'ordine con cui sono eseguite le oprazioni.

**Parentesi quadre** `[]` e **parentesi graffe** `{}` sono invece speciali operatori utilizzati in R per altre ragioni come la selezione di elemente e la definizione di blocchi di codici. Argomenti che approfondiremo rispettivamente nel Capitolo TODO e Capitolo TODO. 
:::

### Esercizi {-}

Calcola il risultato delle seguenti operazioni utilizzando R:

1. $\frac{(45+21)^3+\frac{3}{4}}{\sqrt{32-\frac{12}{17}}}$

2. $\frac{\sqrt{7-\pi}}{3\ (45-34)}$

3. $\sqrt[3]{12-e^2}+\ln(10\pi)$

4. $\frac{\sin(\frac{3}{4}\pi)^2+\cos(\frac{3}{2}\pi)}{\log_7{e^{\frac{3}{2}}}}$

5. $\frac{\sum_{n=1}^{10} n}{10}$

Note per la risoluzione degli esercizi:

- In R la radice quadrata si ottine con la funzione `sqrt()` mentre per radici di indici diversi si utilizza la notazione esponenziale ($\sqrt[3]{x}$ è dato da `x^(1/3)`).
- Il valore di $\pi$ si ottiene con `pi`.
- Il valore di $e$ si ottiene con `exp(1)`.
- In R per i logaritmi si usa la funzione `log(x, base=a)`, di base viene  considerato il logaritmo naturale.


## Operatori Logici

#### approfondimento operatore `%in%`

## Creazione di Variabili

concetto di variabile e assegnare i valori

#### approfondimento diversi modi di "assegnare un valore" (`<-`, `=`, `assign()`)

## Utilizzo di funzioni                                                             

###
