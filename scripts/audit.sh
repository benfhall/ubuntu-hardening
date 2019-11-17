function f_audit {

    sudo apt-get install auditd -y
    sudo auditctl -e 1

}