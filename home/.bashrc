# Initialize bash.
#
# This sourced automatically for interactive, non-login shells. It must be
# called explicitly for login shells, so it's customary to source it directly
# from .bash_profile.
#

export EDITOR=vi
#export JAVA_HOME=$(/usr/libexec/java_home)
#export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_75.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_40.jdk/Contents/Home

# default values used by dspace dev scripts unless overridden per-project
export M2_COMMAND="-Denv=local clean package"
export M2_HOME=/opt/apache-maven-3.3.3
export MAVEN_OPTS="-Xmx1024m -Djava.security.egd=file:/dev/./urandom"
export TOMCAT_OPTS="-Xmx2048m -Xms128m -XX:PermSize=256m -XX:MaxPermSize=256m -Dfile.encoding=UTF-8"
export ANT_HOME=/usr/local/Cellar/ant/1.9.4/libexec
export DSPACE_USER=user
export DSPACE_CLEAN_BACKUPS_ON_DEPLOY=true
export DSPACE_REMOVE_LOGS_AT_STARTUP=true
export DSPACE_REMOVE_WEBAPP_CACHE=true
export DSPACE_REMOVE_WEBAPPS="jspui oai rdf rest sword swordv2"
export DSPACE_ROOT_WEBAPP=xmlui
export GIT_AUTOMIRROR=false
export JPDA_ADDRESS=5005

#export M2_HOME=/opt/apache-maven-2.2.1
#export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=512m"
export ANDROID_HOME=/opt/android-sdk-macosx
export XML_CATALOG_FILES=/usr/local/etc/xml/catalog

export GROOVY_HOME=/usr/local/opt/groovy/libexec

export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$M2_HOME/bin:/usr/local/bin:$PATH:/usr/texbin
export PATH=$M2_HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/Work/dev-scripts:$PATH

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# timestamps for bash history. www.debian-administration.org/users/rossen/weblog/1
# saved for later analysis
HISTTIMEFORMAT='%F %T '
export HISTTIMEFORMAT

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
alias ls="ls -G"

alias 6="export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home"
alias 7="export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_75.jdk/Contents/Home"
alias 8="export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_40.jdk/Contents/Home"

alias m2="export M2_HOME=/opt/apache-maven-2.2.1 && export PATH=/opt/apache-maven-2.2.1/bin:$PATH"
alias m3="export M2_HOME=/opt/apache-maven-3.3.3 && export PATH=/opt/apache-maven-3.3.3/bin:$PATH"

alias idea="open -b com.jetbrains.intellij"

dswhich() {
  if [ -n "$DSNAME" ]; then
    echo " {$DSNAME}"
  fi
}

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
#PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " \[\033[01;36m\](%s)\[\033[00m\]")\$ '
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[01;35m\]$(dswhich)\[\033[00m\]$(__git_ps1 " \[\033[01;36m\](%s)\[\033[00m\]")\$ '

# Append to history instead of overwriting it
shopt -s histappend

alias rmdsstore="find . -name .DS_Store -exec rm {} \;"

# Source nvm.sh lazily; it's stupid slow
export PATH="$PATH:$HOME/.nvm/v0.10.40/bin"
nvm() {
  . "$HOME/.nvm/nvm.sh"
  nvm $@
}

# Source rvm right away; it's fast
export PATH="$PATH:$HOME/.rvm/bin"
. "$HOME/.rvm/scripts/rvm"

if [[ -z $TMUX ]]; then
  launchctl setenv PATH $PATH
  launchctl setenv GEM_HOME $GEM_HOME
  launchctl setenv GEM_PATH $GEM_PATH
fi

export DSPACE_LOCAL_SETTINGS=unspecified
. $HOME/.aliases

# Support ls src/**/*.java like zsh has
shopt -s globstar

# Support path replacement ala zsh
function cd() { if [ $# -eq 2 ]; then builtin cd ${PWD/$1/$2}; else builtin cd $1; fi }

source ~/.homesick/repos/homeshick/homeshick.sh
source ~/.homesick/repos/homeshick/completions/homeshick-completion.bash
