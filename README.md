# rename_multiple_sequence_fasta_file
The script assumes that the fasta annotaion lines follow the NCBI convention to have species and strain names in square barckets
The annotation lines are rewritten to include a number followed by "_: followed by the species name. e.g., 
\>10_unclassified_Haloferax 
The leading number is necessary to create unique names.  
Following a " _", the original annototion line is continued. E.g., 
\>10_unclassified_Haloferax _WP_151111062.1 MULTISPECIES: AAA domain-containing protein [unclassified Haloferax]
The blank space makes most programs use only the number_name to be used as unique sequence designation. 
The long annotation lines are written to a file ending with "namesonly.seq". The screen output only includes the species_strain names, not numbers and the rest of the annotation line.  

If the species strain designation included whitepace ( or : or ), these are replaced by _, leading to unique species designations compatible with seaview and phyml.  
The sequences each are on a single line without interruptions by line breaks.   
