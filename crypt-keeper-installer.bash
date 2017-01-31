
DIRECTORY='crypt-keeper-virtual-environment'

if [ -d "$DIRECTORY" ]; then
    # Will enter here if $DIRECTORY exists, even if it contains spaces
    echo ' "$DIRECTORY" exists, ..........skipping virtual environment creation '
else
	#create python 2 virtual environment
    echo ' "$DIRECTORY" DOES NOT exist, ..........creatign virtual environment '
    virtualenv crypt-keeper-virtual-environment
fi


#start python 2 virtual environment for crypt-keeper
source crypt-keeper-virtual-environment/bin/activate

#install python dependancies 
pip install -r requirements.txt


#prompt to try opening crypt-keeper (not implemented)


#exit python 2 virtual environment for crypt-keeper
deactivate 