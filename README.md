### Docker Vault ###

This is a repository which allows for the simple install of hashicorp vault within Docker on your local machine for testing purposes. 

#### Installation Steps ####

1. Execute ./create-cert.sh to generate self signed certificates.
2. Execute the ./run.sh command to create and run the vault docker container. 
3. Add the self-signed certificates to your list of trusted certificates on your machine.