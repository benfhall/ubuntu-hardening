function f_audit {
  echo "[$i] Confuring audit settings"

  sudo apt-get install auditd -Y
  sudo auditctl -e 1
  sudo auditctl -D
  sudo auditctl -a exit,always -F path=/etc/passwd -F perm=wa
  sudo auditctl -a exit,always -F arch=x86_64 -S open -F auid=80
  sed -i 's/^action_mail_acct =.*/action_mail_acct = root/' "$AUDITDCONF"
  sed -i 's/^admin_space_left_action = .*/admin_space_left_action = halt/' "$AUDITDCONF"
  sed -i 's/^max_log_file_action =.*/max_log_file_action = keep_logs/' "$AUDITDCONF"
  sed -i 's/^space_left_action =.*/space_left_action = email/' "$AUDITDCONF"
  sed -i 's/^GRUB_CMDLINE_LINUX=.*/GRUB_CMDLINE_LINUX="audit=1"/' "$DEFAULTGRUB"
  cp "$AUDITD_RULES" /etc/audit/audit.rules
  sed -i "s/arch=b64/arch=$(uname -m)/g" /etc/audit/audit.rules
  cp /etc/audit/audit.rules "$AUDITRULES"
  update-grub 2> /dev/null

  service enable autitd
  service restart auditd

}
