!/data/data/com.termux/files/usr/bin/bash
#just a simple script for setup my termux settings

echo "Setting up storage by giving storage permission"
sleep 3s
if [[ -d ~/storage ]]
then
    termux-setup-storage
fi
mkdir ~/.termux 2>/dev/null
if [[ -r ~/Set-up-my-termux/termux.properties ]]
then
    cp ~/Set-up-my-termux/termux.properties ~/.termux/termux.properties
    termux-reload-settings
else
    echo "can't find properties file"
fi
echo "All Done"
exit 0



