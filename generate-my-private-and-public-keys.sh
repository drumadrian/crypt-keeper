
#Reference:      https://rietta.com/blog/2012/01/27/openssl-generating-rsa-key-from-command/

#Check input to be sure you have a name to identify the user keys
if [ -z $1 ]; 
	then 
	printf "\n  Usage:   bash generate-my-private-and-public-keys.sh name \n\n"
	exit
fi


#Assign input parameter to name variable
name=$1

if [ -z $name ]; 
	then 
	printf "\nyour 'name' is unset"; 
	printf "\n  Usage:   bash generate-my-private-and-public-keys.sh name \n\n"
	exit
else 
	printf "\n 'name' is set to '$name' \n\n"; 
fi



#Test to see if 'name' is already in use
ls public-keys-folder | grep $name
greprc=$?
if [[ $greprc -eq 0 ]] ; then
    echo "The name $name is already in use....it was found in public-keys-folder"
    exit
else
    if [[ $greprc -eq 1 ]] ; then
        echo "The name $name is available....it was NOT found in public-keys-folder"
    else
        echo "Some sort of error occurred!"
        exit
    fi
fi




#Private key name
privatekeyname=$name-private.pem

#Public key name
publickeyname=$name-public.pem


#Generate a 2048 bit RSA (Private) Key
openssl genrsa -des3 -out $privatekeyname 2048


#Export the RSA Public Key to a File
openssl rsa -in $privatekeyname -outform PEM -pubout -out $publickeyname


#Move new key files to folders in repo 
mv $privatekeyname my-private-key-folder/$privatekeyname
mv $publickeyname public-keys-folder/$publickeyname


#Promt and Complete
printf "\n\nCompleted key generation and placement....pushing your key back to origin is recommended\n\n"


