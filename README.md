# Repository for our study titled "Analyzing The Effects Of Gender, Education And profession On An Individual's Decision To Call Emergency Medical Services In Time Of Need In The Eastern Region Of Saudi Arabia"

## Overview
This repo provides R scripts, data files, records of LLM use as well as code for the investigation conducted on EMS in the Eastern region of Saudi Arabia.

## File Structure

The repo is structured as:

-   `data` contains the raw data as obtained from https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/BPVQET 
-   `model` contains the fitted logistic regression model.
-   `llm` contains all the LLM usage for this paper.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and test the data as well as code for building and saving the model used in the investigation.


## Statement on LLM usage
Aspects of both the code and paper were written using groq.com (Mixtral-8x7b-32768) and ChatGPT. A detailed account of this can be found inside ```llm/usage.txt.```.