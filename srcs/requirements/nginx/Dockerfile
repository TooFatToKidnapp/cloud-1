#nginx configration

FROM debian:buster

RUN apt-get --assume-yes update  && apt-get --assume-yes upgrade

#install nginx and openssl
RUN apt-get install --assume-yes nginx openssl && rm -fr /var/lib/apt/lists/*

# Create the SSL certificates and key
# openssl req: generates a certificate signing request for SSL/TLS
# -newkey: used to specify the type and size of the key to be generated in this case the key is RSA 4096 bit size key
# -x509: tells open ssl to create a self-signed certificate insted if generating a certificate signing request
# -sha256: specifies the cryptographic hash algorithm used to sign the certificate
# -days 365: specifies the number of days for which the certificate will be valid
# -nodes: tells openssl not to encrypt the private key
# -out: specifies the file name to which the certificate will be written
# -keyout: specifies the file name to witch the private key will be written
# -subj: specifies the subject of the certificate , CN = commen name (the domain name)
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out \
/etc/ssl/aabdou.42.fr.pem -keyout /etc/ssl/aabdou.42.fr.key  -subj \
"/C=MA/ST=Béni Mellal-Khénifra/L=Khouribga/O=1337 School/OU=aabdou/CN=aabdou.42.fr"
RUN mkdir -p /var/www/http/wp
# Copy the nginx config file
COPY config/nginx.conf /etc/nginx/nginx.conf

# the command tat will run at container startup , daemon off so that nginx wont be running in the backround
CMD ["nginx", "-g", "daemon off;"]

