#!/data/data/com.termux/files/usr/bin/bash
#just a simple script for setup my termux settings

echo "Setting up storage by giving storage permission"
sleep 3s
if [[ -d ~/storage ]]
then
    termux-setup-storage
fi
mkdir ~/.termux 2>/dev/null
if [[ -r termux.properties ]]
then
    cp termux.properties ~/.termux/termux.properties
    termux-reload-settings
else
    echo "can't find properties file"
fi

echo "Installing ZSH and its required packages"
pkg update
pkg install zsh
mkdir ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions.git ~/.zsh/zsh-completions
git clone https://github.com/zsh-users/zsh-history-substring-search ~/.zsh/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

#zsh-completions
echo "fpath=(~/.zsh/zsh-completions/src $fpath)" > ~/.zshrc

#copy zshrc to .zshrc file
cat zshrc >> ~/.zshrc

#zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

#zsh-history-substring-search
echo 'source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh' >> ~/.zshrc

#zsh-syntax-highlighting
echo "source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

#changing shell for user
chsh -s zsh
touch ~/.zsh/aliasrc
touch ~/.zsh/history
echo "All Done"
exit 0



