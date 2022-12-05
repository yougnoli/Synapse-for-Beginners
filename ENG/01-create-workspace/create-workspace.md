# Provisioning Azure Synapse Analytics
In order to create the Azure Synapse Analytics service it is necessary to have an account [Azure](https://portal.azure.com/).
First you need to create a **Resource Group** which will contain the Synapse service and related other services that will work with it.

![image](https://user-images.githubusercontent.com/77077281/205738587-5f9ee34a-23fd-4894-8d40-9d7bcd11087e.png)
![image](https://user-images.githubusercontent.com/77077281/205751320-60ce69f8-8798-4848-b24e-192b78b9a80a.png)

- Unique name for the resource group
- Region where the resource will be provisioned

![image](https://user-images.githubusercontent.com/77077281/205739411-8e2baec0-52ca-467e-9590-8cdbd4d18dd7.png)

Once the resource group has been deployed, it is possible to enter it and create (within it) the Synapse Analytics service.

![image](https://user-images.githubusercontent.com/77077281/205739813-8e459b9f-9389-482e-9871-e3bafa15bcd8.png)
![image](https://user-images.githubusercontent.com/77077281/205740007-1bf542de-eedd-44c6-957e-85895baebe98.png)

To create the real resource it is necessary:
- Assign it to the previously created resource group
- Give a unique name to the workspace
- Region where the workspace will be provisioned
- Create from *Create new* the datalake (storage account that will contain the data for the demo)
- Create the sysytem file (default storage account container) from *Create new*

![image](https://user-images.githubusercontent.com/77077281/205741410-aadf5944-e528-48bb-938a-b350fe1f9cb1.png)

At the next creation step it is possible to define the authentication methods.
Provide a password for the SQL Server admin login.

![image](https://user-images.githubusercontent.com/77077281/205742344-3cce071d-92d2-4c16-b199-a4f8724b657c.png)

It is then possible to go directly to *Review + Create* and then click the *Create* button at the bottom left.

Once the deployment of the service is complete, within the resource group we will have:
- Storage accounts
- Synapse workspace

![image](https://user-images.githubusercontent.com/77077281/205755786-540303dc-fa67-447e-8fbc-b5bc35285527.png)

# Create sample data in the DataLake
By clicking on the storage account it will be possible to create a container that will host the data for the demo.
On the left under *Data Storage* there is the *Containers* section.
After that it is possible to create a new container which I will call *container01*.

![image](https://user-images.githubusercontent.com/77077281/205744976-a037abaf-2917-4ee9-b968-add3fbfbc57a.png)

Now it is possible to switch to the real workspace. In the next chapter I will give a general overview of all sections of the workspace.
Returning to the resource group, it is possible to click on the Synapse workspace, after which it will be necessary to click on *Open* in the box under *Getting started*:

![image](https://user-images.githubusercontent.com/77077281/205745609-1f0f4f4f-d5ad-498d-8d82-1a896a376a8d.png)

A new browser tab will open leading to the *Synapse Analytics workspace*.
In the *Manage* section it will be necessary to create a pool of **Apache Spark**, in order to run a [Notebook](https://github.com/yougnoli/Synapse-for-Beginners/blob/main/ITA/01-create-workspace/create-datalake-san-francisco-csv-parquet-delta.ipynb) which will create all the example data.

![image](https://user-images.githubusercontent.com/77077281/205746702-ad686504-71cd-408c-9601-249b59659b5e.png)

Now it will be possible to create the actual Spark Pool (more information on this type of Pool later), for now it is enough to know that it is a very common engine for big data analysis and machine learning. Apache Spark works with a master-slave architecture and is often used by Data Engineers for ETL flows using the Python API: PySpark.

![image](https://user-images.githubusercontent.com/77077281/205747381-1039afe8-fb4c-467f-996d-0addfcdf54fa.png)

It is then necessary to click on the *Review + create* button at the bottom left, then *Create*.
Once the deployment is complete, you will need to import the [Notebook](https://github.com/yougnoli/Synapse-for-Beginners/blob/main/ITA/01-create-workspace/create-datalake-san-francisco-csv-parquet-delta.ipynb) per la creazione dei dati nel **container01** del datalake creato precedentemente (dldemoat).
To do this in the *Develop* section, click on the *+* and import the [Notebook](https://github.com/yougnoli/Synapse-for-Beginners/blob/main/ITA/01-create-workspace/create-datalake-san-francisco-csv-parquet-delta.ipynb). 

Note: in the [Notebook](https://github.com/yougnoli/Synapse-for-Beginners/blob/main/ITA/01-create-workspace/create-datalake-san-francisco-csv-parquet-delta.ipynb) you will need to change the last three code cells. Where this string is present (the path to save data in *container01*) 'abfss://**container01**@<span>**dlsyntestmm**.dfs.core.windows.net/sanfrancisco/csv' instead of *dlsyntestmm* you will have to put the name of your datalake.

![image](https://user-images.githubusercontent.com/77077281/205749652-682139ee-315a-4c77-9234-9bed5d70f29a.png)

Imported the [Notebook](https://github.com/yougnoli/Synapse-for-Beginners/blob/main/ITA/01-create-workspace/create-datalake-san-francisco-csv-parquet-delta.ipynb), you will have to attach the Apache Spark pool (SparkPool01), before running it all.

![image](https://user-images.githubusercontent.com/77077281/205750376-edc054c2-24ec-41c3-b8e8-d95bc772ed33.png)

Once the pool has been selected (and the changes made to the last three code cells) it will be possible to run the whole [Notebook](https://github.com/yougnoli/Synapse-for-Beginners/blob/main/ITA/01-create-workspace/create-datalake-san-francisco-csv-parquet-delta.ipynb) with the *Run all* button on the left.

Executed the entire Notebook inside the DataLake there will be the data of the firefighters of San Francisco. They will be divided into 3 different formats:
- csv
- parquet
- delta
All data of any format type will be equally partitioned by year, by month and by day.
