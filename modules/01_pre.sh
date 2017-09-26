function f_pre {

  export TERM=linux
  export DEBIAN_FRONTEND=noninteractive

  if [[ $VERBOSE == "Y" ]]; then
    APTFLAGS='-y'
  else
    APTFLAGS='-qq -y'
  fi

  APT="apt-get $APTFLAGS"

  if [ $EUID -ne 0 ]; then
    echo "Root Access is required. Exiting."
    echo
    exit 1
  fi

  if ! lsb_release -i | grep 'Ubuntu'; then
    echo "Computer isn't running Ubuntu. Exiting."
    echo
    exit 1
  fi

  i="0"
}
