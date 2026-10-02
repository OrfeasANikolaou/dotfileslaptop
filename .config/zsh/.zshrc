# THIS REQUIRES P10K ON ~/.config/zsh/plugins/
# DOTFILE REPO DOES NOT VENDOR IT
# REMINDER TO CLONE IT


tabs -2
export MANPAGER="nvim +Man!"
#
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# local sources
[ -f "$HOME/.config/zsh/zshalias.zsh" ] && source "$HOME/.config/zsh/zshalias.zsh"


#make autocompletion upper/lowercase agnostic
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

## Enable colors and change prompt:
#autoload -U colors && colors
## PS1="%B%{$fg[red]%}[%{$fg[green]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[blue]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
##PS1="%B%{$fg[red]%}[%{$fg[blue]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
#
#
## Basic auto/tab complete:
autoload -U compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)    # Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1
#
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
#
# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
#

zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
# Lines configured by zsh-newuser-install
HISTFILE="$XDG_STATE_HOME"/zsh/history
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase
setopt appendhistory
setopt sharehistory


# The following lines were added by compinstall

zstyle :compinstall filename '/home/orfeas/.config/zsh/.zshrc'

# End of lines added by compinstall

# Plugins
[ -f $HOME/.config/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme ] && source $HOME/.config/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# reverse search
bindkey "^R" history-incremental-search-backward
bindkey '^p' history-search-backward


# enable substring history search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search
bindkey '^n' history-search-forward
bindkey '^O' forward-word

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/zsh/custom_p10k.zsh ]] || source ~/.config/zsh/custom_p10k.zsh
