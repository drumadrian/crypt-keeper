
# Global variables
temporary_files_folder=temporary-files
encrypted_output_folder=encrypted-output-folder

#Check input to be sure you have a name to identify the user keys
if [ -z $1 ] || [ -z $2 ] 
	then 
	printf "\n  Usage:   bash encrypt.sh plainfile.txt recipientpublickeyfile \n\n";
	exit
fi


#Assign input parameters 
plainfile=$1
recipientpublickeyfile=$2
debug=$3


#Prompt with helpful information 
if [ -z $plainfile ]
	then 
	printf "\nyour 'plainfile' is unset"; 
	printf "\n  Usage:   bash encrypt.sh plainfile.txt recipientpublickeyfile \n\n";
	exit
fi


#Prompt with helpful information
if [ -z $recipientpublickeyfile ] 
	then 
	printf "\nyour 'recipientpublickeyfile' is unset"; 
	printf "\n  Usage:   bash encrypt.sh plainfile.txt recipientpublickeyfile \n\n";
	exit
fi


#debug
if [ -z $debug ]
	then
	printf "\n recipientpublickeyfile= $recipientpublickeyfile \n"; 
	printf "\n plainfile= $plainfile \n"; 
fi






#Assign variables 
random_key=$temporary_files_folder/$plainfile-key.bin
encrypted_random_key=$temporary_files_folder/$plainfile-key.bin.enc
plainfile_encrypted=$encrypted_output_folder/$plainfile.enc


#Step 1) Generate a 256 bit (32 byte) random key
openssl rand -base64 32 > $random_key

#debug
if [ -z $debug ]
	then
	printf "\n random_key= $random_key \n"
	printf "\n temporary_files_folder= $temporary_files_folder \n\n"
	printf "\n encrypted_random_key= $encrypted_random_key \n\n"
	printf "\n plainfile_encrypted= $plainfile_encrypted \n\n"
	printf "\n encrypted_output_folder= $encrypted_output_folder \n\n"	
fi


printf "\n ....Starting key encryption\n\n"

#Step 2) Encrypt the key
# openssl rsautl -encrypt -inkey id_rsa.pub.pem -pubin -in key.bin -out key.bin.enc
openssl rsautl -encrypt -inkey $recipientpublickeyfile -pubin -in $random_key -out $encrypted_random_key


printf "\n ....Starting plainfile encryption\n\n"

#Step 3) Actually Encrypt our large file
# openssl enc -aes-256-cbc -salt -in SECRET_FILE -out SECRET_FILE.enc -pass file:./key.bin
openssl enc -aes-256-cbc -salt -in $plainfile -out $plainfile_encrypted -pass file:$random_key

printf "\n ************************* Encryption Complete ************************* "
printf "\n - Input file was: $plainfile - "
printf "\n - Output encrypted file is: $plainfile_encrypted - "
printf "\n ************************* Encryption Complete ************************* \n\n"













# #Test to see if 'name' is already in use
# ls public-keys-folder | grep $name
# greprc=$?
# if [[ $greprc -eq 0 ]] ; then
#     echo "The name $name is already in use....it was found in public-keys-folder"
#     exit
# else
#     if [[ $greprc -eq 1 ]] ; then
#         echo "The name $name is available....it was NOT found in public-keys-folder"
#     else
#         echo "Some sort of error occurred!"
#         exit
#     fi
# fi






