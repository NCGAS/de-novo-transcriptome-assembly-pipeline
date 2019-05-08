## List of the programs required for the pipeline

- ### Trinity v2.8.4 ###
  - wget https://github.com/trinityrnaseq/trinityrnaseq/archive/Trinity-v2.8.4.tar.gz
  - tar -xvzf Trinity-v2.8.4.tar.gz
  - cd tritnity
  - make

- ### Bowtie2
  - Download binaries from https://sourceforge.net/projects/bowtie-bio/?source=typ_redirect
  - unzip 
  
- ### Samtools 1.9 ###
  - wget https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2
  - tar -xvf samtools-1.9.tar.bz2
  - ./configure --prefix=`pwd`
  - make
  - make install
  - cd htslib 
  - ./configure --prefix=`pwd`
  - make 
  - make install 

- ### jellyfish v2.2.9 ###
  - wget https://github.com/gmarcais/Jellyfish/releases/download/v2.2.9/jellyfish-2.2.9.tar.gz
  - tar -xvzf jellyfish-2.2.9.tar.gz
  - ./configure --prefix=`pwd`
  - make
  - make install

- ### salmon v.0.11.0 ###
  - wget https://github.com/COMBINE-lab/salmon/releases/download/v0.11.0/salmon-0.11.0-linux_x86_64.tar.gz
  - tar -xvzf 
  
- ### kallisto v0.45.0
  - wget https://github.com/pachterlab/kallisto/releases/download/v0.45.0/kallisto_linux-v0.45.0.tar.gz
  - tar -xvzf 

- ### Rsem 1.3.0 ###
  - https://deweylab.github.io/RSEM/
  - tar xvzf 
  - make

- ### SOAPdenovo2 ###
  - wget https://github.com/aquaskyline/SOAPdenovo2/archive/r241.tar.gz
  - tar -xvzf 
  - make 

- ### Abyss v2.0.2 ###
  - wget https://github.com/bcgsc/abyss/releases/download/2.0.2/abyss-2.0.2.tar.gz
  - tar -xvzf 
  - #Installing pre requisites 
  - wget https://github.com/sparsehash/sparsehash/archive/sparsehash-2.0.3.tar.gz
  - tar -xvzf
  - cd sparseharsh
  - ./configure --prefix=`pwd`
  - make 
  - cd ..
  - cd abyss-2.0.2
  - ./configure --prefix=/N/soft/rhel7/abyss/gnu/2.0.2 --with-sparsehash=/N/soft/rhel7/abyss/gnu/sparsehash-2.0.3 --with-mpi=/N/soft/rhel7/openmpi/gnu/2.1.2/lib  --with-boost=/N/soft/rhel7/abyss/gnu/boost_1_62_0
  - make AM_CXXFLAGS=-Wall
  - make install

- ### TransAbyss ###
  - Downlaod http://www.bcgsc.ca/platform/bioinfo/software/trans-abyss
  - tar -xvzf 

- ### blat (http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/blat/)
  - wget http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/blat/blat
  - chmod +x blat

- ### igraph/python/0.7.1 ###
  - pip install python-igraph 
  or download source code/ save to a venev  instead 

- ### velvet v.1.2.10 ###
  - wget https://www.ebi.ac.uk/~zerbino/velvet/velvet_1.2.10.tgz
  - tar -zvxf 
  - make MAXKMERLENGTH=192

- ### oases v.0.2.9 ###
  - wget https://github.com/dzerbino/oases/archive/0.2.09.tar.gz 
  - tar -xvzf 0.2.09.tar.gz 
  - cd <into dir>
  - rm -r velvet
  - ln -s <symlinked the installed version of velvet here from rhel7 > 
  - make MAXKMERLENGTH=192

-  ### BLAST### 
    - wget https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.9.0+-x64-linux.tar.gz
    - tar -xvzf 

- ### Evigene ###


- ### Busco ###
  - wget https://gitlab.com/ezlab/busco/-/archive/3.0.2/busco-3.0.2.tar.gz
  - tar -xvzf 
  - python setup.py install
  - Download the busco-lineages from the website 

- ### Hmmer ###
  - wget http://eddylab.org/software/hmmer/hmmer.tar.gz
  - tar -xvzf hmmer.tar.gz
  - ./configure --prefix=`pwd`
  - make 
  - make install

- ### Augustus ###
  - wget http://augustus.gobics.de/binaries/augustus.2.5.5.tar.gz
  - tar -xvzf 

- ### R v3.31 ###
  - sudo apt install r-base # this installion command is from a VM, not for the cluster 

- ### bamtools ### 
  - git clone git://github.com/pezmaster31/bamtools.git
  - mkdir build  
  - cd build  
  - cmake -DCMAKE_INSTALL_PREFIX=/my/install/dir ..
  - make
  - make install 

- ### quast v.5.0.0 ###
  - wget http://cab.spbu.ru/software/quast-lg/
  - tar -xvzf 
  - ./setup.py install --prefix=`pwd`
  - export PYTHONPATH=/N/soft/rhel7/quast/5.0.0/lib/python2.7/site-packages:$PYTHONPATH
  - ./setup.py install --prefix=`pwd`

- ### Transdecoder v.5.50 ###
  - wget https://github.com/TransDecoder/TransDecoder/archive/TransDecoder-v5.5.0.tar.gz
  - tar -xvzf 

- ### Trinotate v3.1.1 ### 
  - wget https://github.com/Trinotate/Trinotate/archive/Trinotate-v3.1.1.tar.gz
  - tar -xvzf 
    - Optional dependencies 
      - #### SignalP ####
      - Submit request at http://www.cbs.dtu.dk/cgi-bin/sw_ship.cgi, to get a link to install 
      - wget http://www.cbs.dtu.dk/download/EACB3908-31EC-11E8-A1EB-A986465A7DCF/signalp-4.1f.Linux.tar.gz
      - tar -xvzf 
      - cd <into dir>
      - export PERL5LIB=/N/soft/rhel7/trinotate/signalp-4.1/lib:$PERL5LIB
      - ./signalp -h #test to check if this works 
      
      - #### tmhmm ####
      - Submit request at http://www.cbs.dtu.dk/cgi-bin/sw_ship.cgi to get a link to install
      - wget http://www.cbs.dtu.dk/download/25FA847A-31ED-11E8-B531-4E89465A7DCF/tmhmm-2.0c.Linux.tar.gz
      - tar -xvzf 

      - #### RNAmmer ####
      - Submit request at http://www.cbs.dtu.dk/cgi-bin/sw_ship.cgi to get a link to install
        this software requires a previous copy of hmmer v2, so will not be supporting this tool
      - wget http://eddylab.org/software/hmmer/2.3/hmmer-2.3.tar.gz
    - tar -xvzf 
    - ./configure --prefix=/N/soft/rhel7/trinotate/hmmer-2.3/
    - make 
    - export PATH=/N/soft/rhel7/trinotate/hmmer-2.3/src:$PATH
    - wget http://www.cbs.dtu.dk/download/610C03F4-31ED-11E8-95B1-528D465A7DCF/rnammer-1.2.src.tar.Z
    - cat rnammer-1.2.src.tar.Z | gunzip | tar xvf -
    - export PATH=/N/soft/rhel7/trinotate/3.1.1:/N/soft/rhel7/trinotate/hmmer-2.3/src:/N/soft/rhel7/trinotate/rnammer-1.2:/N/soft/rhel7/trinotate/signalp-4.1/bin:/N/soft/rhel7/trinotate/tmhmm-2.0c/bin:$PATH
    - export PERL5LIB=/N/soft/rhel7/trinotate/3.1.1/PerlLib:/N/soft/rhel7/trinotate/signalp-4.1/lib:$PERL5LIB
    - /N/soft/rhel7/trinotate/Trinotate-Trinotate-v3.1.1/admin/Build_Trinotate_Boilerplate_SQLite_db.pl  Trinotate #download the databases 
    - gzip -d *.gz
      Formatting the database : 
      - makeblastdb -in uniprot_sprot.pep -dbtype prot
      - hmmpress Pfam-A.hmm







