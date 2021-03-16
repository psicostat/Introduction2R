--- 
title: "<span style='font-size: 2.5em'>Introduzione a R</span>"
subtitle: "Corso per imparare le basi di **R**"
author: "[Psicostat](https://psicostat.dpss.psy.unipd.it/)"
date: "16-03-2021"
site: bookdown::bookdown_site
documentclass: book
bibliography: [book.bib, packages.bib]
csl: apa.csl
link-citations: yes
github-repo: psicostat/Introduction2R
description: "Questo è un libro intorduttivo ad R prodotto da [Psicostat](https://psicostat.dpss.psy.unipd.it/), gruppo di ricerca interdisciplinare che unisce la passione per la statistica e la psicologia."
cover-image: "images/logo_psicostat.png"
header-includes: 
  - \usepackage{titlepic}
  - \titlepic{\includegraphics[width=\textwidth]{images/logo_psicostat.pdf}}
url: 'https\://psicostat.github.io/Introduction2R/'
---

# Presentazione {-}




In questo libro impareremo le basi di *R*, uno dei migliori software per la visualizzazione e l'analisi statistica dei dati. Partiremo da zero intorducendo gli aspetti fondamentili di R e i concetti alla base di ogni linguaggio di programmazione che ti pemetteranno in seguito di approfondire e sviluppare le tue abilità in questo bellissimo mondo.

## Perchè R {-}

Ci sono molte ragioni per cui scegliere R rispetto ad altri programmi usati per condurre le analisi statistiche. Innanzitutto è un linguaggio di programmazione (come ad esempio Python, Java, C++, o Julia) e non semplicemente un'interfaccia punta e clicca (come ad esempio SPSS o JASP). Questo comporta si maggiori difficoltà iniziali ma ti ricompenserà in futuro poichè avari imparato ad utilizza uno strumennto molto potente.

Inoltre, R è:

- nato per la statistica
- open-source
- ricco di pacchetti
- supportato da una grande community
- gratis

## Struttura del libro {-}

Il libro è suddiviso in quattro sezioni principali:

- **Get started**. Una volta installato R ed RStudio, famiglierizzeremo con l'ambiente di lavoro introducendo alcuni aspetti generali e le funzioni principali. Verranno inoltre descritte alcune buone regole per iniziare una sessione di lavoro in R.
- **Struttura dei dati**. Impareremo gli oggetti principali che R utilizza al suo interno. Variabili, vettori, matrici, dataframe e liste non avranno più segreti e capiremo come manipolarli e utlizzarli a seconda delle varie necessità.
- **Algoritmi**. Non farti spaventare da questo nome. Ne avrai spesso sentito parlarne come qualcosa di molto complicato, ma in realtà gli algoritmi sono semplicemente una serie di istruzioni che il computer segue quando deve eseguire un determinato compito. In questa sezione vedremo i principali comandi di R usati per definire degli algoritmi. Questo è il vantaggio di conoscere un linguaggio di programmazione, ci permette di creare nuovi programmi che il computer eseguirà per noi.
- **Case study**. Eseguiremo passo per passo un analisi che ci permetterà di imparare come importare i dati, codificare le variabili, manipolare e preprare i dati perle analisi, condurre delle analisi descrittive e creare dei grafici.

Alla fine di questo libro probabilmente non sarete assunti da Google, ma speriamo almeno che R non vi faccia più così paura e che magari a qualcuno sia nato l'interesse di approfondire questo fantastico mondo fatto di linee di codice.

## Risorse Utili {-}

Segnaliamo qui per il lettore interessato del materiale online (in inglese) per approfondire le conoscenze sull'uso di R.

Materiale introduttivo:

- *R for Psychological Science* di Danielle Navarro https://psyr.djnavarro.net/index.html 
- *Hands-On Programming with R* di Garrett Grolemund https://rstudio-education.github.io/hopr/

Materiale intermedio:

- *R for Data Science* di Hadley Wickham e Garrett Grolemund https://r4ds.had.co.nz/

Materiale avanzato:

- *R Packages* di Hadley Wickham e Jennifer Bryan https://r-pkgs.org/
- *Advanced R* di Hadley Wickham https://adv-r.hadley.nz/

## Psicostat {-}

Questo libro è stato prodotto da **Psicostat**, un gruppo di ricerca interdisciplinare dell'universita di Padova che unisce la passione per la statistica e la psicologia. Se vuoi conoscere di più riguardo le nostre attività visita il nosto sito https://psicostat.dpss.psy.unipd.it/ o aggiungiti alla nostra mailing list https://lists.dpss.psy.unipd.it/postorius/lists/psicostat.lists.dpss.psy.unipd.it/.

## Collaborazione {-}

Se vuoi collaborare alla revione e scrittura di questo libro (ovviamente è tutto in R) visita la nostra repository di Github https://github.com/psicostat/Introduction2R.


## Riconoscimenti {-}

Il template di questo libro è basato su [Rstudio Bookdown-demo](https://github.com/rstudio/bookdown-demo) rilasciato con licenza [CC0-1.0](https://creativecommons.org/publicdomain/zero/1.0/) e [rstudio4edu-book](https://rstudio4edu.github.io/rstudio4edu-book/) rilasciato con licenza [CC BY](https://creativecommons.org/licenses/by/2.0/). Nota che le illustrazioni utilizzate nelle vignette appartengono sempre a [rstudio4edu-book](https://rstudio4edu.github.io/rstudio4edu-book/) e sono rilasciate con licenza [CC BY-NC](https://creativecommons.org/licenses/by-nc/2.0/).


## Licenza {-}

Questo libro è rilasciato sotto la Creative Commons Attribution-ShareAlike 4.0 International Public License ([CC BY-SA](https://creativecommons.org/licenses/by-sa/4.0/legalcode)).
Le illustrazioni utilizzate nelle vignette appartengono a [rstudio4edu-book](https://rstudio4edu.github.io/rstudio4edu-book/) e sono rilasciate con licenza [CC BY-NC](https://creativecommons.org/licenses/by-nc/2.0/).

