#!/usr/bin/env bash

# Establish your private certificate authority (CA)
openssl req -x509 -nodes \
  -newkey RSA:4096       \
  -keyout root-ca.key    \
  -days 3650             \
  -out root-ca.crt       \
  -subj '/C=HU/L=Earth/O=SzegediFamily/CN=root_CA_szegedi_family';

# Create a private key and a certificate signing request (CSR) for your server
openssl req -nodes   \
  -newkey rsa:4096   \
  -keyout nessy.key \
  -out nessy.csr    \
  -subj '/C=HU/L=Earth/O=Dis/CN=nessy';

openssl req -nodes   \
  -newkey rsa:4096   \
  -keyout void.key \
  -out void.csr    \
  -subj '/C=HU/L=Earth/O=Dis/CN=void';

# Generate a certificate for your server
openssl x509 -req    \
  -CA root-ca.crt    \
  -CAkey root-ca.key \
  -in nessy.csr     \
  -out nessy.crt    \
  -days 3650          \
  -CAcreateserial    \
  -extfile <(printf "subjectAltName = DNS:nessy,DNS:*.nessy,IP:192.168.50.144\nauthorityKeyIdentifier = keyid,issuer\nbasicConstraints = CA:FALSE\nkeyUsage = digitalSignature, keyEncipherment\nextendedKeyUsage=serverAuth");

openssl x509 -req    \
  -CA root-ca.crt    \
  -CAkey root-ca.key \
  -in void.csr     \
  -out void.crt    \
  -days 3650          \
  -CAcreateserial    \
  -extfile <(printf "subjectAltName = DNS:void,DNS:*.void,IP:192.168.50.1\nauthorityKeyIdentifier = keyid,issuer\nbasicConstraints = CA:FALSE\nkeyUsage = digitalSignature, keyEncipherment\nextendedKeyUsage=serverAuth");

echo "Step 4. Add root-ca.crt to Firefox's trust store";
echo "Step 5. Configure your server"
echo "You'll need server.key and server.crt. The specific steps depend on the technology."
