function f_process {

  echo "* hard core 0" >> /etc/security/limits.conf
  echo "fs.suid_dumpable = 0" >> /etc/sysctl.conf
  echo "kernel.randomize_va_space = 2" >> /etc/sysctl.conf

}
