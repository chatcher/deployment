#!/usr/bin/env bash

echo >&2
echo -e "Email address (probably should use <username>@users.noreply.github.com)" >&2
echo -en "> " >&2
read -t 0 -r EMAIL_ADDRESS && echo || read -r EMAIL_ADDRESS

if [ -z "${EMAIL_ADDRESS}" ]; fi
    echo "Okay, forget it." >&2
    exit 1
fi

git config --global user.email "${EMAIL_ADDRESS}"

cd "${HOME}"
rm -rf .gnupg
mkdir -m 0700 .gnupg
touch .gnupg/gpg.conf
chmod 600 .gnupg/gpg.conf

cd .gnupg

cat >keydetails <<EOF
    %echo Generating a basic OpenPGP key
    Key-Type: RSA
    Key-Length: 4096
    Subkey-Type: RSA
    Subkey-Length: 4096
    Name-Email: ${EMAIL_ADDRESS}
    Expire-Date: 0
    %no-ask-passphrase
    %no-protection
    %pubring pubring.kbx
    %secring trustdb.gpg
    %commit
    %echo done
EOF

echo -e "${S_CS} gen-key ${N_CS}" >&2
gpg --verbose --batch --gen-key keydetails

echo -e "${S_CS} set trust ${N_CS}" >&2
# Set trust to 5 for the key so we can encrypt without prompt.
echo -e "5\ny\n" |  gpg --command-fd 0 --expert --edit-key "${EMAIL_ADDRESS}" trust;

echo -e "${S_CS} updated keys (should be populated) ${N_CS}" >&2
# Test that the key was created and the permission the trust was set.
gpg --list-keys

echo -e "${S_CS} not sure what this does ${N_CS}" >&2
# Test the key can encrypt and decrypt.
gpg -e -a -r "${EMAIL_ADDRESS}" keydetails

echo -e "${S_CS} cleaning up settings file ${N_CS}" >&2
# Delete the options and decrypt the original to stdout.
rm keydetails
echo -e "${S_CS} whatever -d does ${N_CS}" >&2
gpg -d keydetails.asc
echo -e "${S_CS} cleaning up asc file ${N_CS}" >&2
rm keydetails.asc


echo
echo
SECURE_ID="$(gpg --list-secret-keys --keyid-format=long | head -n 3 | tail -n 1 | sed -e 's|.*/||' -e 's| .*||')"
git config --global user.signingkey "${SECURE_ID}"
git config --global commit.gpgsign true
gpg --armor --export "${SECURE_ID}"

echo >&2
echo -e "If that worked, then paste that into github or whatever." >&2
