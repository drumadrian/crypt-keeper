# crypt-keeper
a simple command-line system for encrypting and decrypting files using Public and Private keys for a group


![crypt-keeper-image](https://cloud.githubusercontent.com/assets/6573380/22278001/e1012d24-e274-11e6-9fc6-bb96e3c0f538.jpeg)


##Usage

Usage summary..... *in progress*



##Files

###README.md

-what you are reading right now

###crypt-keeper-image.jpeg
-can you see it above?  

###crypt-keeper.html			
-this is the webpage for the crypt-kepper GUI

###generate-my-private-and-public-keys.sh
-this is the primary script to create your public and private keys

```Usage:   bash generate-my-private-and-public-keys.sh name```

###encrypt.sh
-this script is used to encrypt a file

```Usage:   bash encrypt.sh plainfile.txt recipientpublickeyfile```

###decrypt.sh
-this script is used to decrypt a file sent to you

```Usage:   bash decrypt.sh plainfile.txt.enc myprivatekeyfile encrypted_random_key```


-

##Folders:

	javascript
-folder with javascript files for webpage Interfase (*not yet developed*)
	
-
	my-private-key-folder 
-this folder has your private key

-
	public-keys-folder
-this has the public keys for you and your team of people transferring files

-
	decrypted-output-folder
-this has output of the decrypt.sh script.  These are the safely decrypted files

-
	encrypted-output-folder
-this has output of the encrypt.sh script.  These are the safely encrypted files

-
	temporary-files
-this folder exists to hold the random key files. These files are the original binary randomly generated symytric keys and the encrypted binary randomly generated symytric keys.  This folder's contents may be deleted after decryption is successful. 



##Original References 
 
[http://www.czeskis.com/random/openssl-encrypt-file.html](http://www.czeskis.com/random/openssl-encrypt-file.html)


[https://rietta.com/blog/2012/01/27/openssl-generating-rsa-key-from-command/](https://rietta.com/blog/2012/01/27/openssl-generating-rsa-key-from-command/)