cat > certs/$(pwd | rev | cut -f2 -d'/' - | rev).cnf <<-EOF
  [req]
  distinguished_name = req_distinguished_name
  x509_extensions = v3_req
  prompt = no
  [req_distinguished_name]
  CN = *.$(pwd | rev | cut -f2 -d'/' - | rev)
  [v3_req]
  keyUsage = keyEncipherment, dataEncipherment
  extendedKeyUsage = serverAuth
  subjectAltName = @alt_names
  [alt_names]
  DNS.1 = *.$(pwd | rev | cut -f2 -d'/' - | rev)
  DNS.2 = $(pwd | rev | cut -f2 -d'/' - | rev)
EOF

openssl req \
  -new \
  -newkey rsa:2048 \
  -sha1 \
  -days 3650 \
  -nodes \
  -x509 \
  -keyout certs/$(pwd | rev | cut -f2 -d'/' - | rev).key \
  -out certs/$(pwd | rev | cut -f2 -d'/' - | rev).crt \
  -config certs/$(pwd | rev | cut -f2 -d'/' - | rev).cnf

rm certs/$(pwd | rev | cut -f2 -d'/' - | rev).cnf
echo ""
echo "Certificado gerado para os domínios:"
echo "- $(pwd | rev | cut -f2 -d'/' - | rev)"
echo "- *.$(pwd | rev | cut -f2 -d'/' - | rev)"
echo ""
echo "Adicione o certificado $(pwd)/certs/$(pwd | rev | cut -f2 -d'/' - | rev).crt nas suas chaves válidas."
echo ""