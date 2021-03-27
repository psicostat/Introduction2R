# Fattori {#factors}





Working in progress.

- attributes
- named vectors
- factors, ordered factors


I fattori sono utilizzati per definire delle variabili categoriali, sono indicati in R con `Factor`. Per creare una variabile categoriale in R si utilizza la funzione:

`nome_variabile<-factor(c(..., data, ...), levels=c(...))`

L'opzione `levels=c(...)` è usata per specificare quali sono i possibili livelli della variabile categoriale. E' possibile modificare o aggiungere nuovi livelli della variabile anche in un secondo momento utilizzando la funzione:

`levels(nome_fattore)<- c(..., nuovi_livelli, ...)`

**Nota**: nel creare un fattore R associa ad ogni livello un valore in ordine crescente e assegna agli elementi del vettore il loro volore numerico a seconda del proprio livello. Pertanto se un fattore è trasformato in un vettore numerico vengono restituiti tali valori numerici e non i livelli anche nel caso fossero dei numeri. Prendiamo per esempio la variabile `anni_istruzione`:


```r
anni_istruzione<-factor(c(11,8,4,8,11,4,11,8))
anni_istruzione
## [1] 11 8  4  8  11 4  11 8 
## Levels: 4 8 11
as.numeric(anni_istruzione)
## [1] 3 2 1 2 3 1 3 2
```

Per riottenere gli estti valori numerici è necessario eseguire:


```r
as.numeric(as.character(anni_istruzione))
## [1] 11  8  4  8 11  4 11  8
```

### Esercizi {-}

1. Crea la variabile categoriale `sex` così definita:

```
## [1] M F M F M F F F M
## Levels: F M
```
2. Rinomina i livelli della variabile `sex` rispettivamente in `"donne"` e `"uomini"`.
3. Crea la variabile categoriale `intervento` così definita:

```
## [1] CBT         Psicanalisi CBT         Psicanalisi CBT         Psicanalisi
## [7] Controllo   Controllo   CBT        
## Levels: CBT Controllo Psicanalisi
```
4. Correggi nella variabile `intervento` la 7° e 8° osservazione con la voce `Farmaci`.
5. Aggiungi alla variabile `intervento` le seguenti nuove osservazioni:

```
## [1] "Farmaci"   "Controllo" "Farmaci"
```
    










