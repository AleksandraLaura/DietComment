# Here I explain how we made the Kaiju database, based on the description in Reynoso-García et al.

1. Get the full list of nr_euk taxa from Kaiju: https://github.com/bioinformatics-centre/kaiju/blob/master/util/kaiju-taxonlistEuk.tsv. 

2. Add the taxIDs for the genera of interest (it wasn't specified in the paper which taxon IDs from plant sequences from the NCBI nr database were also included, so we incuded the genera of the 9 "hit/target" species they report - 8 genera based on https://www.ncbi.nlm.nih.gov/taxonomy). \\ *The resulting .tsv file can be found in this repository.*
    
3. Make download the fasta sequence and sequence ID's like do:
   ```
   The code to download the raw sequences
   ```
4. Here is a bunch of other intermediate steps to make it all make sense: 
