# Provisioning Azure Synapse Analytics
Per poter creare il servizio di Azure Synapse Analytics e' necessario avere un account [Azure]([portal.](https://portal.azure.com/).
Per prima cosa bisogna creare un **Resource Group** che conterra' il servizio di Synapse e i relativi altri servizi che lavoreranno con esso.

![image](https://user-images.githubusercontent.com/77077281/205738587-5f9ee34a-23fd-4894-8d40-9d7bcd11087e.png)
![image](https://user-images.githubusercontent.com/77077281/205738923-9be1bc2e-8486-4e2d-9972-8579ea24f2ea.png)

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


# Create sample data in the DataLake
