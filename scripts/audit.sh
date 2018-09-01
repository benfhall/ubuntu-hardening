function f_audit {
  echo "Configuring audits"

  sudo apt-get install auditd

  sudo sed -i 's/^action_mail_acct =.*/action_mail_acct = root/' /etc/audit/auditd.conf
  sudo sed -i 's/^admin_space_left_action = .*/admin_space_left_action = halt/' /etc/audit/auditd.conf
  sudo sed -i 's/^max_log_file_action =.*/max_log_file_action = keep_logs/' /etc/audit/auditd.conf
  sudo sed -i 's/^space_left_action =.*/space_left_action = email/' /etc/audit/auditd.conf
  sudo sed -i 's/^GRUB_CMDLINE_LINUX=.*/GRUB_CMDLINE_LINUX="audit=1 audit_backlog_limit=8192"/' /etc/default/grub
  sudo sed -i 's/max_log_file =.*//' /etc/audit/auditd.conf
  sudo echo "max_log_file = <MB>" > /etc/audit/auditd.conf
  sudo sed -i 's/GRUB_CMDLINE_LINUX=.*//' /etc/default/grub
  sudo echo "GRUM_CMDLINE_LINUX='audit=1'" >> /etc/default/grub

  if [ uname -m == 'x86_64' ]; then
    sudo echo "-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b64 -S clock_settime -k time-change" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change" >> /etc/audit/audit.rules
    sudo echo "-w /etc/localtime -p wa -k time-change" >> /etc/audit/audit.rules
    sudo echo "-a exit,always -F arch=b64 -S sethostname -S setdomainname -k system-locale" >> /etc/audit/audit.rules
    sudo echo "-a exit,always -F arch=b32 -S sethostname -S setdomainname -k system-locale" >> /etc/audit/audit.rules
    sudo echo "-w /etc/issue -p wa -k system-locale" >> /etc/audit/audit.rules
    sudo echo "-w /etc/issue.net -p wa -k system-locale" >> /etc/audit/audit.rules
    sudo echo "-w /etc/hosts -p wa -k system-locale" >> /etc/audit/audit.rules
    sudo echo "-w /etc/network -p wa -k system-locale" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b64 -S chmod -S fchmod -S fchmodat -F auid>=500 \ -F auid!=4294967295 -k perm_mod" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=500 \ -F auid!=4294967295 -k perm_mod" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b64 -S chown -S fchown -S fchownat -S lchown -F auid>=500 \ -F auid!=4294967295 -k perm_mod" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=500 \ -F auid!=4294967295 -k perm_mod" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b64 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S \ lremovexattr -S fremovexattr -F auid>=500 -F auid!=4294967295 -k perm_mod" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S \ lremovexattr -S fremovexattr -F auid>=500 -F auid!=4294967295 -k perm_mod" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate \ -F exit=-EACCES -F auid>=500 -F auid!=4294967295 -k access" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate \ -F exit=-EACCES -F auid>=500 -F auid!=4294967295 -k access" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate \ -F exit=-EPERM -F auid>=500 -F auid!=4294967295 -k access" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate \ -F exit=-EPERM -F auid>=500 -F auid!=4294967295 -k access" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b64 -S mount -F auid>=500 -F auid!=4294967295 -k mounts" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b32 -S mount -F auid>=500 -F auid!=4294967295 -k mounts" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=500 \ -F auid!=4294967295 -k delete" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=500 \ -F auid!=4294967295 -k delete" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b64 -S init_module -S delete_module -k modules" >> /etc/audit/audit.rules
  else
    sudo echo "-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b32 -S clock_settime -k time-change" >> /etc/audit/audit.rules
    sudo echo "-w /etc/localtime -p wa -k time-change" >> /etc/audit/audit.rules
    sudo echo "-a exit,always -F arch=b32 -S sethostname -S setdomainname -k system-locale" >> /etc/audit/audit.rules
    sudo echo "-w /etc/issue -p wa -k system-locale" >> /etc/audit/audit.rules
    sudo echo "-w /etc/issue.net -p wa -k system-locale" >> /etc/audit/audit.rules
    sudo echo "-w /etc/hosts -p wa -k system-locale" >> /etc/audit/audit.rules
    sudo echo "-w /etc/network -p wa -k system-locale" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=500 \ -F auid!=4294967295 -k perm_mod" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=500 \ -F auid!=4294967295 -k perm_mod" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S \ lremovexattr -S fremovexattr -F auid>=500 -F auid!=4294967295 -k perm_mod" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate \ -F exit=-EACCES -F auid>=500 -F auid!=4294967295 -k access" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate \ -F exit=-EPERM -F auid>=500 -F auid!=4294967295 -k access" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b32 -S mount -F auid>=500 -F auid!=4294967295 -k mounts" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=500 \ -F auid!=4294967295 -k delete" >> /etc/audit/audit.rules
    sudo echo "-a always,exit -F arch=b32 -S init_module -S delete_module -k modules" >> /etc/audit/audit.rules
  fi

  sudo echo "-w /etc/group -p wa -k identity" >> /etc/audit/audit.rules
  sudo echo "-w /etc/passwd -p wa -k identity" >> /etc/audit/audit.rules
  sudo echo "-w /etc/gshadow -p wa -k identity" >> /etc/audit/audit.rules
  sudo echo "-w /etc/shadow -p wa -k identity" >> /etc/audit/audit.rules
  sudo echo "-w /etc/security/opasswd -p wa -k identity" >> /etc/audit/audit.rules
  sudo echo "-w /etc/selinux/ -p wa -k MAC-policy" >> /etc/audit/audit.rules
  sudo echo "-w /var/log/faillog -p wa -k logins" >> /etc/audit/audit.rules
  sudo echo "-w /var/log/lastlog -p wa -k logins" >> /etc/audit/audit.rules
  sudo echo "-w /var/log/tallylog -p wa -k logins" >> /etc/audit/audit.rules
  sudo echo "-w /var/run/utmp -p wa -k session" >> /etc/audit/audit.rules
  sudo echo "-w /var/log/wtmp -p wa -k session" >> /etc/audit/audit.rules
  sudo echo "-w /var/log/btmp -p wa -k session " >> /etc/audit/audit.rules
  sudo echo "-w /etc/sudoers -p wa -k scope" >> /etc/audit/audit.rules
  sudo echo "-w /var/log/sudo.log -p wa -k actions" >> /etc/audit/audit.rules
  sudo echo "-w /sbin/insmod -p x -k modules" >> /etc/audit/audit.rules
  sudo echo "-w /sbin/rmmod -p x -k modules" >> /etc/audit/audit.rules
  sudo echo "-w /sbin/modprobe -p x -k modules" >> /etc/audit/audit.rules
  sudo echo "-e 2" >> /etc/audit/audit.rules

  sudo pkill -P 1-HUP auditd

  sudo cp "./misc/audit.header" /etc/audit/rules.d/hardening.rules
  for l in /etc/audit/rules.d/hardening.rules; do
    sudo cat "$l" >> /etc/audit/audit.rules
  done
  sudo cat "./misc/audit.footer" >> /etc/audit/rules.d/hardening.rules

  sudo sed -i "s/arch=b64/arch=$(uname -m)/g" /etc/audit/audit.rules
  sudo cp /etc/audit/audit.rules /etc/audit/rules.d/hardening.rules
  sudo update-grub 2> /dev/null

  sudo service enable auditd
  sudo service restart auditd
  sudo update-grub

}
