# Data Script Details

1. Each script should start from a data source that is referencable. If your data isn't stored publicly online, create a space with the data that users of the Org can reference.
    - You can access the [Google Drive](https://drive.google.com/drive/u/0/folders/0AMnavGO2D6yoUk9PVA) by permission only for data too large for Github. See the Google Drive section below.
    - We should include a public link with the description if the data can be publicly posted.
2. The final object in the script should be the dataset object that you would like stored.
    - Generally, we would always have a version that is `.parquet` and then create another _pin_ that is in `.json` or `.csv`
3. Include a commented section at the end of the file with a data descrition and a data dictionary.
    - Description: 2-5 sentences that provides a background on the dataset
    - Data Dictionary: Bulleted list with column names and descriptions.
