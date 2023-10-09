# gpg
GNU Privacy Guard (GPG) utility in Docker

```
docker run --rm -it --entrypoint sh ghcr.io/t7tran/gpg:2.4.3

# generate key pair
gpg --full-gen-key

# export private key
gpg --output secmain.asc --export-secret-keys --armor KEY
gpg --output secsub.asc --export-secret-subkeys --armor KEY

# import
gpg --import secmain.asc
gpg --import secsub.asc

# export public key
gpg --output public.gpg --armor --export KEY

# one-liner (scripting) ECC key generation for sign and encrypt
gpg --batch --generate-key <<-EOF
%echo Generating a new OpenPGP key
Key-Type: EDDSA
Key-Length: 3072
Key-Curve: ed25519
Key-Usage: sign
Subkey-Type: ECDH
Subkey-Length: 3072
Subkey-Curve: cv25519
Subkey-Usage: encrypt
Name-Real: Your Name
Name-Comment: Some description
Name-Email: your@email.com
Expire-Date: 0
Passphrase: YourPassphrase
%commit
%echo done
EOF
```