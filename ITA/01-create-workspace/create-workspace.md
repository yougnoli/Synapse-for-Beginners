# Provisioning Azure Synapse Analytics
Per poter creare il servizio di Azure Synapse Analytics e' necessario avere un account [Azure](https://portal.azure.com/).
Per prima cosa bisogna creare un **Resource Group** che conterra' il servizio di Synapse e i relativi altri servizi che lavoreranno con esso.

![image](https://user-images.githubusercontent.com/77077281/205738587-5f9ee34a-23fd-4894-8d40-9d7bcd11087e.png)
![image](https://user-images.githubusercontent.com/77077281/205751320-60ce69f8-8798-4848-b24e-192b78b9a80a.png)

- Nome univoco per il resource group
- Regione dove sara' provisionata la risorsa

![image](https://user-images.githubusercontent.com/77077281/205739411-8e2baec0-52ca-467e-9590-8cdbd4d18dd7.png)

Una volta avvenuto il deployment del resource group e' possibile entrarci e creare (al suo interno) il servizio di Synapse Analytics.

![image](https://user-images.githubusercontent.com/77077281/205739813-8e459b9f-9389-482e-9871-e3bafa15bcd8.png)
![image](https://user-images.githubusercontent.com/77077281/205740007-1bf542de-eedd-44c6-957e-85895baebe98.png)

Per creare la risorsa vera e propria e' necessario:
- Assegnarla al resource group precedentemente creato
- Dare un nuome univoco al workspace
- Regione dove sara' provisionato il workspace
- Creare da *Create new* il datalake (storage account che conterra' i dati per la demo)
- Creare da *Create new* il file sysytem (container di default dello storage account)

![image](https://user-images.githubusercontent.com/77077281/205741410-aadf5944-e528-48bb-938a-b350fe1f9cb1.png)

Al prossimo dtep di creazione e' possibile definire i metodi di autenticazione.
Fornire una password per la SQL Server admin login.

![image](https://user-images.githubusercontent.com/77077281/205742344-3cce071d-92d2-4c16-b199-a4f8724b657c.png)

E' poi possibile passare direttamente al *Review + Create* e poi cliccare in basso a sinistra il bottone di *Create*.

Una volta che il deployment del servizio e' completo, all'interno del resource group avremo:
- Storage account
- Synapse workspace

![image](https://user-images.githubusercontent.com/77077281/205743722-63b845bc-2ec2-4895-aac4-0d6e0416d329.png)

# Create sample data in the DataLake
Cliccando sullo storage account sara' possibile creare un container che ospitera' i dati per la demo.
Sulla sinistra sotto *Data Storage* c'e' la sezione *Containers*.
Dopo di che e' possibile creare un nuovo container che chiamero' *container01*.

![image](https://user-images.githubusercontent.com/77077281/205744976-a037abaf-2917-4ee9-b968-add3fbfbc57a.png)

Ora e' possibile passare al workspace vero e proprio. Nel prossimo capitolo faro' un'overview generale di tutte le sezioni del workspace.
Tornando all'interno del resource group, e' possibile cliccare sul workspace di Synapse, dopo di che si dovra' cliccare su *Open* nel box sotto *Getting started*:

![image](https://user-images.githubusercontent.com/77077281/205745609-1f0f4f4f-d5ad-498d-8d82-1a896a376a8d.png)

Si aprira' una nuova scheda del browser che porta al *Synapse Analytics workspace*.
Nella sezione *Manage* sara' necessario creare un pool di **Apache Spark**, che ci permettera' di avere tutti i dati di esempio attraverso l'esecuzione di un [Notebook](https://github.com/yougnoli/Synapse-for-Beginners/blob/main/ITA/01-create-workspace/create-datalake-san-francisco-csv-parquet-delta.ipynb).

![image](https://user-images.githubusercontent.com/77077281/205746702-ad686504-71cd-408c-9601-249b59659b5e.png)

Ora sara' possibile creare il Pool di Spark vero e proprio (ulteriori informazioni su questo tipo di Pool piu' avanti), per ora ci basta sapere che e' un engine molto comune per l'analisi di big data e machine learning. Apache Spark lavora con un architettura di tipo master-slave ed e' spesso utilizzato dai Data Engineer per flussi ETL usando l'API di Python: PySpark.

![image](https://user-images.githubusercontent.com/77077281/205747381-1039afe8-fb4c-467f-996d-0addfcdf54fa.png)

E' necessario poi cliccare sul bottone di *Review + create* in basso a sinistra, poi *Create*.
Una volta completato il deployment, sara' necessario importare il [Notebook](https://github.com/yougnoli/Synapse-for-Beginners/blob/main/ITA/01-create-workspace/create-datalake-san-francisco-csv-parquet-delta.ipynb) per la creazione dei dati nel **container01** del datalake creato precedentemente (dldemoat).
Per fare questo nella sezione *Develop*, cliccare sul *+* e importare il [Notebook](https://github.com/yougnoli/Synapse-for-Beginners/blob/main/ITA/01-create-workspace/create-datalake-san-francisco-csv-parquet-delta.ipynb). 

Nota: nel [Notebook](https://github.com/yougnoli/Synapse-for-Beginners/blob/main/ITA/01-create-workspace/create-datalake-san-francisco-csv-parquet-delta.ipynb) sara' necessario cambiare le ultime tre celle di codice. Dove e' presente questa stringa (il percorso per salvare i dati nel *container01*) 'abfss://container01@dlsyntestmm.dfs.core.windows.net/sanfrancisco/csv' al posto di *dlsyntestmm* si dovra' mettere il nome del proprio datalake.

![image](https://user-images.githubusercontent.com/77077281/205749652-682139ee-315a-4c77-9234-9bed5d70f29a.png)

Importato il [Notebook](https://github.com/yougnoli/Synapse-for-Beginners/blob/main/ITA/01-create-workspace/create-datalake-san-francisco-csv-parquet-delta.ipynb), si dovra' assegnare il pool di Apache Spark (SparkPool01), prima di eseguirlo tutto.

![image](https://user-images.githubusercontent.com/77077281/205750376-edc054c2-24ec-41c3-b8e8-d95bc772ed33.png)

Una volta selezionato il pool (ed effettuato le modifiche alle ultime tre celle di codice) sara' possibile eseguire tutto il [Notebook](https://github.com/yougnoli/Synapse-for-Beginners/blob/main/ITA/01-create-workspace/create-datalake-san-francisco-csv-parquet-delta.ipynb) con il buttone *Run all* sulla sinistra.

Eseguito l'intero Notebook dentro al DataLake ci saranno i dati dei vigli del fuoco di San Francisco. Saranno divisi in 3 diverse formati:
- csv
- parquet
- delta
Tutti i dati di ogni tipo di formato sara' ugualmente partizionato per anno, per mese e per giorno.
