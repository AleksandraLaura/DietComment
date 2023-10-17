# Here I explain how we made the Kaiju database, based on the description in Reynoso-García et al.

1. Get the full list of nr_euk taxa from Kaiju: https://github.com/bioinformatics-centre/kaiju/blob/master/util/kaiju-taxonlistEuk.tsv. 

2. Add the taxIDs for the genera of interest (it wasn't specified in the paper which taxon IDs from plant sequences from the NCBI nr database were also included, so we incuded the genera of the 9 "hit/target" species they report - 8 genera based on https://www.ncbi.nlm.nih.gov/taxonomy). \\ *The resulting [.tsv file](https://github.com/AleksandraLaura/CoproliteAnalysesCommentaryALP/blob/main/2.%20Kaiju/kaiju-taxonlistEuk.tsv) can be found in this repository.*
    
3. Based on https://github.com/bioinformatics-centre/kaiju/blob/master/util/kaiju-makedb:
   ```
   if [ "$DB" = "nr_euk" ]
   then
	mkdir -p $DB
	if [ $DL -eq 1 ]
	then
		echo Downloading nr.gz
		wget -c -nv $wgetProgress -P $DB https://ftp.ncbi.nih.gov/blast/db/FASTA/nr.gz
		echo Downloading prot.accession2taxid.gz
		wget -c -nv $wgetProgress -P $DB https://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid/prot.accession2taxid.gz
	fi
	[ -r $DB/nr.gz ] || { echo Missing file nr.gz; exit 1; }
	[ -r $DB/prot.accession2taxid.gz ] || { echo Missing file prot.accession2taxid.gz; exit 1; }
	if [ $index_only -eq 0 ]
	then
		echo Converting NR file to Kaiju database
		gunzip -c $DB/nr.gz | kaiju-convertNR -m merged.dmp -t nodes.dmp -g $DB/prot.accession2taxid.gz -e $SCRIPTDIR/kaiju-excluded-accessions.txt -a -o $DB/kaiju_db_$DB.faa -l $SCRIPTDIR/kaiju-taxonlistEuk.tsv
	fi
	[ -r $DB/kaiju_db_$DB.faa ] || { echo Missing file $DB/kaiju_db_$DB.faa; exit 1; }
	echo Creating BWT from Kaiju database
	kaiju-mkbwt -e $exponentSA_NR -n $threadsBWT -a ACDEFGHIKLMNPQRSTVWY -o $DB/kaiju_db_$DB $DB/kaiju_db_$DB.faa
	echo Creating FM-index
	kaiju-mkfmi $DB/kaiju_db_$DB
   fi

   #And delete everything but the names, nodes and .fmi files
   ```
4. Here is a bunch of other intermediate steps to make it all make sense: 
