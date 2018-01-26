## .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
          . /etc/bashrc
fi

# User specific aliases and functions

### PCI-DSS enforce connection timeout
export TMOUT=900

# TB
alias ll='ls -alFh'
