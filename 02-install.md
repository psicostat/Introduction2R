# Installare R e RStudio {#install}

R ed R-studio sono due software distinti. R è un linguaggio di programmazione usato in particolare in ambiti quali la statistica. R-studio invece è un'interfaccia *user-friendly* che permette di utilizzare R.
R può essere utilizzato autonomamente tuttavia è consigliato l'utilizzo attraverso R-studio. Entrambi vanno installati separatamente e la procedura varia a seconda del proprio sistema operativo (Windows, MacOS o Linux). Riportiamo le istruzioni solo per Windows e MacOS Linux (Ubuntu). Ovviamente R è disponibile per tutte le principali distribuzioni di Linux. Le istruzioni riportate per Ubuntu (la distribuzione più diffusa) sono valide anche per le distribuzioni derivate.

## Installare R {#install-r}


1. Accedere al sito https://www.r-project.org
2. Selezionare la voce **CRAN** (Comprehensive R Archive Network) dal menù di sinistra sotto **Download**

<center>
![](images/install_CRAN.png){ width=95% }
</center>
<br>

3. Selezionare il primo link https://cloud.r-project.org/

<center>
![](images/install_mirror.png){ width=95% }
</center>
<br>
    
4. Selezionare il proprio sistema operativo

<center>
![](images/install_OS.png){ width=95% }
</center>
<br>

### R Windows

1. Selezionare la voce **base**

<center>
![](images/install-Windows-base.png){ width=95% }
</center>
<br>
  
2. Selezionare la voce **Download** della versione più recente di R disponibile

<center>
![](images/install-Windows-version.png){ width=95% }
</center>
<br>

3. Al termine del download, eseguire il file e seguire le istruzioni fino al termine dell'installazione

### R MacOS

1. Selezionare della versione più recente di R disponibile 

<center>
![](images/install_Mac_version.png){ width=95% }
</center>
<br>

2. Al termine del download, eseguire il file e seguire le istruzioni fino al termine dell'installazione di R
3. Successivamente è necessario installare anche una componente aggiuntiva **XQuartz** premendo il link all'interno del riquadro arancione riportato nella figura precedente
4. Selezionare la voce Download

<center>
![](images/install_Mac_XQuartz.png){ width=95% }
</center>
<br>

5. Al termine del download, eseguire il file e seguire le istruzioni fino al termine dell'installazione

### R Linux

Nonostante la semplicità di installazione di pacchetti su Linux, R a volte potrebbe essere più complicato da installare per via delle diverse distribuzioni, repository e chiavi per riconoscere la repository come sicura.

Sul **CRAN** vi è la guida ufficiale con tutti i comandi `apt` da eseguire da terminale. Seguendo questi passaggi non dovrebbero esserci problemi.

1. Andate sul [CRAN](https://cran.r-project.org/)
2. Cliccate `Download R for Linux`
3. Selezionate la vostra distribuzione (Ubuntu in questo caso)
4. Seguite le istruzioni, principalmente eseguendo i comandi da terminale suggeriti

Per qualsiasi difficoltà o errore, sopratutto con il mondo Linux, una ricerca su online risolve sempre il problema.


<br>

:::{.design title="R Tools" data-latex="[R Tools]"}
Utilizzi avanzati di R richiedono l'insallazione di una serie ulteriore software definiti **R tools**.

#### Windows{-}

Seleziona la voce **Rtools** e segui le istruzioni per completare l'installazione.
<br>
<center>
![](images/install-Windows-tools.png){ width=95% }
</center>
<br>
Nota che sono richieste anche delle operazioni di configurazione affinchè tutto funzioni correttamente.

#### MacOS{-}

Seleziona la voce **tools** e segui le istruzioni riportate.

<br>
<center>
![](images/install_Mac_tools.png){ width=95% }
</center>
<br>
Nota in particolare che con R 4.0 le seguenti indicazioni sono riportate.

<br>
<center>
![](images/install_Mac_tools2.png){ width=95% }
</center>
:::

## Installare R Studio


1. Accedere al sito https://rstudio.com
2. Selezionare la voce **DOWNLOAD IT NOW**

<center>
![](images/install_rstudio1.png){ width=95% }
</center>
<br>

3. Selezionare la versione gratuita di RStudio Desktop

<center>
![](images/install_rstudio2.png){ width=95% }
</center>
<br>

4. Selezionare la versione corretta a seconda del proprio sistema operativo

<center>
![](images/install_rstudio3.png){ width=95% }
</center>
<br>

5. Al termine del download, eseguire il file e seguire le istruzioni fino al termine dell'installazione


### R Studio in Linux

In questo caso, come su Windows e MacOS l'installazione consiste nello scaricare ed eseguire il file corretto, in base alla distribuzione (ad esempio `.deb` per Ubuntu e derivate). Importante, nel caso di Ubuntu (ma dovrebbe valere anche per le altre distribuzioni) anche versioni successive a quella indicata (es. Ubuntu 16) sono perfettamente compatibili.
