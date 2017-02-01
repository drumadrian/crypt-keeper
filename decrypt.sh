
# Global variables
temporary_files_folder=temporary-files
decrypted_output_folder=decrypted-output-folder

#Check input to be sure you have a name to identify the user keys
if [ -z $1 ] || [ -z $2 ] 
	then 
	printf "\n  Usage:   bash decrypt.sh plainfile.txt.enc myprivatekeyfile encrypted_random_key \n\n";
	exit
fi


#Assign input parameters 
encrypted_file=$1
myprivatekeyfile=$2
encrypted_random_key=$3
debug=$4
encrypted_file_name=$(basename $encrypted_file)
# encrypted_file_name=encrypted_file
decrypted_random_key=$temporary_files_folder/decryption-plainfile-key.bin
decrypted_plainfile=$decrypted_output_folder/${encrypted_file_name%.enc}


#Prompt with helpful information 
if [ -z $encrypted_file ]
	then 
	printf "\nyour 'encrypted_file' is unset"; 
	printf "\n  Usage:   bash decrypt.sh plainfile.txt.enc myprivatekeyfile encrypted_random_key \n\n";
	exit
fi


#Prompt with helpful information
if [ -z $myprivatekeyfile ] 
	then 
	printf "\nyour 'myprivatekeyfile' is unset"; 
	printf "\n  Usage:   bash decrypt.sh plainfile.txt.enc myprivatekeyfile encrypted_random_key \n\n";
	exit
fi


#Prompt with helpful information
if [ -z $encrypted_random_key ] 
	then 
	printf "\nyour 'encrypted_random_key' is unset"; 
	printf "\n  Usage:   bash decrypt.sh plainfile.txt.enc myprivatekeyfile encrypted_random_key \n\n";
	exit
fi



#debug
if [ $debug ]
	then
	printf "\n encrypted_file= $encrypted_file \n"
	printf "\n encrypted_file_name= $encrypted_file_name \n"
	printf "\n myprivatekeyfile= $myprivatekeyfile \n"
	printf "\n encrypted_random_key= $encrypted_random_key \n"
	printf "\n decrypted_random_key= $decrypted_random_key \n"
	printf "\n decrypted_plainfile= $decrypted_plainfile \n\n"
fi




printf "\n ....Starting key decryption\n\n"

# Step 4) Send/Decrypt the files
#openssl enc -d -aes-256-cbc -in SECRET_FILE.enc -out SECRET_FILE -pass file:./key.bin
openssl rsautl -decrypt -inkey $myprivatekeyfile -in $encrypted_random_key -out $decrypted_random_key 


printf "\n ....Starting plainfile decryption\n\n"


# Step 4) Send/Decrypt the files
#openssl enc -d -aes-256-cbc -in SECRET_FILE.enc -out SECRET_FILE -pass file:./key.bin
openssl enc -d -aes-256-cbc -in $encrypted_file -out $decrypted_plainfile -pass file:$decrypted_random_key






printf "\n ************************* Decryption Complete ************************* "
printf "\n - Input file was: $encrypted_file - "
printf "\n - Output encrypted file is: $decrypted_plainfile - "
printf "\n ************************* Decryption Complete ************************* \n\n"





