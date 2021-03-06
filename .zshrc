## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8

bindkey -e

## cdr
autoload -Uz is-at-least
if is-at-least 4.3.11; then
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':chpwd:*'      recent-dirs-max 1000
  zstyle ':chpwd:*'      recent-dirs-default yes
  zstyle ':completion:*' recent-dirs-insert both
fi

## Default shell configuration
#
# set prompt
#
autoload colors
colors
case ${UID} in
0)
PROMPT="%{${fg[green]}%}%/#%{${reset_color}%}%b "
PROMPT2="%{${fg[green]}%}%_#%{${reset_color}%}%b "
SPROMPT="%{${fg[green]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
;;
*)
PROMPT="%{${fg[magenta]}%}%/%%%{${reset_color}%} "
PROMPT2="%{${fg[magenta]}%}%_%%%{${reset_color}%} "
SPROMPT="%{${fg[magenta]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
;;
esac

## terminal configuration
#
unset LSCOLORS
case "${TERM}" in
xterm)
export TERM=xterm-color
;;
m)
export TERM=kterm-color

# set BackSpace control character
stty erase
;;
cons25)
unset LANG
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors \
'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
;;
esac

# set terminal title including current directory
case "${TERM}" in
kterm*|xterm*)
precmd() {
echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
}
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors \
'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
;;
esac

# select
bindkey "^[" set-mark-command

# copy
function copy-region() {
    zle copy-region-as-kill
    REGION_ACTIVE=0
}
zle -N copy-region
bindkey "^v" copy-region

# cut
function backward-kill-word-or-region() {
    if [ $REGION_ACTIVE -eq 0 ]; then
        zle backward-kill-word
    else
        zle kill-region
    fi
}
zle -N backward-kill-word-or-region
bindkey "^d" backward-kill-word-or-region

# peco
function peco-select-history() {
  local tac
  if which tac > /dev/null; then
      tac="tac"
  else
      tac="tail -r"
  fi
  BUFFER=$(\history -n 1 | \
    eval $tac | \
    peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

function peco-cdr () {
  local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-cdr
bindkey '^@' peco-cdr

# display current branch
function rprompt-git-current-branch {
local name st color

if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
  return
fi
name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
if [[ -z $name ]]; then
  return
fi
st=`git status 2> /dev/null`
if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
  color=${fg[green]}
elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
  color=${fg[yellow]}
elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
  color=${fg_bold[red]}
else
  color=${fg[red]}
fi

# %{...%} は囲まれた文字列がエスケープシーケンスであることを明示する
# これをしないとhプロンプトの位置がずれる
echo "%{$color%}$name%{$reset_color%}"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

RPROMPT='`rprompt-git-current-branch`'

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

## 補完機能の強化
autoload -U compinit
compinit

## lsに色とつける
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

alias ls="ls -GF"
alias gip="curl ifconfig.io"
alias vim="nvim"
alias ctags="`brew --prefix`/bin/ctags"

## コアダンプサイズを制限
limit coredumpsize 102400

## 出力の文字列末尾に改行コードが無い場合でも表示
unsetopt promptcr

## 色を使う
setopt prompt_subst

## ビープを鳴らさない
setopt nobeep

## 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt long_list_jobs

## 補完候補一覧でファイルの種別をマーク表示
setopt list_types

## サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt auto_resume

## 補完候補を一覧表示
setopt auto_list

## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

## ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

## スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space

## 古いコマンドと同じものは無視
setopt hist_save_no_dups

## historyコマンドは履歴に登録しない
setopt hist_no_store

## zsh の開始, 終了時刻をヒストリファイルに書き込む
setopt extended_history

## ヒストリを呼び出してから実行する間に一旦編集
setopt hist_verify

## ヒストリを共有
setopt share_history

## cd 時に自動で push
setopt autopushd

## 同じディレクトリを pushd しない
setopt pushd_ignore_dups

## TAB で順に補完候補を切り替える
setopt auto_menu

## =command を command のパス名に展開する
setopt equals

## --prefix=/usr などの = 以降も補完
setopt magic_equal_subst

## ファイル名の展開で辞書順ではなく数値的にソート
setopt numeric_glob_sort

## 出力時8ビットを通す
setopt print_eight_bit

## 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1

## 補完候補の色づけ
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

## ディレクトリ名だけで cd
setopt auto_cd

## カッコの対応などを自動的に補完
setopt auto_param_keys

## ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

## スペルチェック
setopt correct

export PATH=~/.rbenv/bin:$PATH
eval "$(rbenv init -)"

export PATH=~/.nodenv/bin:$PATH
eval "$(nodenv init -)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if [ -d "${PYENV_ROOT}" ]; then
  export PATH=${PYENV_ROOT}/bin:$PATH
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH=$PATH:~/.nodenv/versions/10.14.2/lib/node_modules/@vue/cli/bin
