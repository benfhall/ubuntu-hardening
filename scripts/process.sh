function f_process {

  sudo echo "* hard core 0" >> /etc/security/limits.conf
  sudo echo "fs.suid_dumpable = 0" >> /etc/sysctl.conf
  sudo echo "kernel.randomize_va_space = 2" >> /etc/sysctl.conf

}
