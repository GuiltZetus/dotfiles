#
# ~/.bashrc
#
# export QT_IM_MODULE=fcitx
# export GTK_IM_MODULE=fcitx
# export XMODIFIERS=@im=fcitx # Still useful for XWayland fallback

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

eval "$(oh-my-posh init bash --config https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/amro.omp.json)" 
