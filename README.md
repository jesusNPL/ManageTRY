# ManageTRY
Functions and scripts to manage information from TRY database

In this dropbox folder you can find the several files (please don't delete any file), but the most important are:

1. TRYdata.RData - this file contains all TRY database
2. ExtractTRYdata.R - R script with a step by step to extract data from the TRYdata
3. AuxiliaryFunctions - this is a folder that contains some auxiliary R functions to help us to extract data from TRY and calculate for example the mean and sample variance for each trait by species.
4. You can also find some compressed files, these compressed files contains the original TRY database, and are very heavy if you unzip them (~14 GB).

To use the TRY database and to extract the TRIAT data for your species, please follow the next steps.

1. In your computer open the R script "ExtractTRYdata.R" and run the two main steps, which are, load the TRYdata and call the auxiliary functions. Remember, the complete TRY database is heavy and is necessary to be patience while the database completely load into your computer.

2. Once with the information required, you just need to inform a vector with the scientific names of your species. Here is important that you have in hand all posible synonyms for your species. 

Another important aspect before you extract the information from the TRY database, is to delimit your spatial extent first, for example, if you are interested in extract trait information only for species that co-occur in Cedar Creek, is necessary select only locations that are located in the States neighbors of the State of Minnesota or only locations in North America.

To identify the locations that are neighbors of your study area you can visit the TRY portal following the next link: https://www.try-db.org/de/Datasets.php

3. Once with the information in your R environment you just need follow the instructions in the "ExtractTRYdata.R" script.

Hope these instructions help you to extract your required species trait information from TRY database.

If need some help, please do not hesitate in contact me, I will be happy in helping you.
