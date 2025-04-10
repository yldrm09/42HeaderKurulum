#!/bin/bash

read -p "Lütfen kullanıcı adınızı (USER) girin: " KULLANICI_ADI
read -p "Lütfen e-posta adresinizi (MAIL) girin: " EPOSTA

if [ -n "$ZSH_VERSION" ]; then
    SHELL_RC="$HOME/.zshrc"
else
    SHELL_RC="$HOME/.bashrc"
fi

{
    echo "export USER=\"$KULLANICI_ADI\""
    echo "export MAIL=\"$EPOSTA\""
} >> "$SHELL_RC"

echo "$SHELL_RC dosyasına USER ve MAIL değişkenleri eklendi."
echo "Değişikliklerin etkili olması için terminalinizi yeniden başlatın veya 'source $SHELL_RC' komutunu çalıştırın."

VIMRC="$HOME/.vimrc"

{
    echo "let g:user42 = '$KULLANICI_ADI'"
    echo "let g:mail42 = '$EPOSTA'"
} >> "$VIMRC"

echo "$VIMRC dosyasına g:user42 ve g:mail42 değişkenleri eklendi."

VIM_PLUGIN_DIR="$HOME/.vim/plugin"
mkdir -p "$VIM_PLUGIN_DIR"
curl -o "$VIM_PLUGIN_DIR/stdheader.vim" https://raw.githubusercontent.com/42paris/42header/master/plugin/stdheader.vim

echo "stdheader.vim eklentisi indirildi ve $VIM_PLUGIN_DIR dizinine yerleştirildi."

echo "Kurulum tamamlandı. Vim'i açarak ':Stdheader' komutunu çalıştırabilir veya 'F1' tuşuna basarak headeri ekleyebilirsiniz."
