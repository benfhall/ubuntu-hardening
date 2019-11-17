function f_audit {

    apt-get install auditd -y

    grep -q '^action_mail_acct' /etc/audit/auditd.conf && sed -i 's/^action_mail_acct.*/action_mail_acct=root/' /etc/audit/auditd.conf || echo 'action_mail_acct=root' >> /etc/audit/auditd.conf
    grep -q '^admin_space_left_action' /etc/audit/auditd.conf && sed -i 's/^admin_space_left_action.*/admin_space_left_action=halt/' /etc/audit/auditd.conf || echo 'admin_space_left_action=halt' >> /etc/audit/auditd.conf
    grep -q '^max_log_file' /etc/audit/auditd.conf && sed -i 's/^max_log_file.*/max_log_file=10/' /etc/audit/auditd.conf || echo 'max_log_file=10' >> /etc/audit/auditd.conf
    grep -q '^max_log_file_action' /etc/audit/auditd.conf && sed -i 's/^max_log_file_action.*/max_log_file_action=keep_logs/' /etc/audit/auditd.conf || echo 'max_log_file_action=keep_logs' >> /etc/audit/auditd.conf
    grep -q '^space_left_action' /etc/audit/auditd.conf && sed -i 's/^space_left_action.*/space_left_action=email/' /etc/audit/auditd.conf || echo 'space_left_action=email' >> /etc/audit/auditd.conf
    
    grep -q '^GRUB_CMDLINE_LINUX' /etc/default/grub && sed -i 's/^GRUB_CMDLINE_LINUX.*/GRUB_CMDLINE_LINUX="audit=1"/' /etc/default/grub|| echo 'GRUB_CMDLINE_LINUX="audit=1"' >> /etc/default/grub
    update-grub

    #32-bit changes
    echo "-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change" >> /etc/audit/audit.rules
    echo "-a always,exit -F arch=b32 -S clock_settime -k time-change" >> /etc/audit/audit.rules
    echo "-w /etc/localtime -p wa -k time-change" >> /etc/audit/audit.rules

    echo "-w /etc/group -p wa -k identity" >> /etc/audit/audit.rules
    echo "-w /etc/passwd -p wa -k identity" >> /etc/audit/audit.rules
    echo "-w /etc/gshadow -p wa -k identity" >> /etc/audit/audit.rules
    echo "-w /etc/shadow -p wa -k identity" >> /etc/audit/audit.rules
    echo "-w /etc/security/opasswd -p wa -k identity" >> /etc/audit/audit.rules

    echo "-a exit,always -F arch=b32 -S sethostname -S setdomainname -k system-locale"  >> /etc/audit/audit.rules
    echo "-w /etc/issue -p wa -k system-locale" >> /etc/audit/audit.rules
    echo "-w /etc/issue.net -p wa -k system-locale" >> /etc/audit/audit.rules
    echo "-w /etc/hosts -p wa -k system-locale" >> /etc/audit/audit.rules
    echo "-w /etc/network -p wa -k system-locale" >> /etc/audit/audit.rules

    echo "-w /etc/selinux/ -p wa -k MAC-policy" >> /etc/audit/audit.rules
    
    echo "-w /var/log/faillog -p wa -k logins" >> /etc/audit/audit.rules
    echo "-w /var/log/lastlog -p wa -k logins" >> /etc/audit/audit.rules
    echo "-w /var/log/tallylog -p wa -k logins" >> /etc/audit/audit.rules

    echo "-w /var/run/utmp -p wa -k session" >> /etc/audit/audit.rules
    echo "-w /var/log/wtmp -p wa -k session" >> /etc/audit/audit.rules
    echo "-w /var/log/btmp -p wa -k session " >> /etc/audit/audit.rules

    echo '-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=500 \' >> /etc/audit/audit.rules
    echo '-F auid!=4294967295 -k perm_mod' >> /etc/audit/audit.rules
    echo '-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=500 \' >> /etc/audit/audit.rules
    echo '-F auid!=4294967295 -k perm_mod' >> /etc/audit/audit.rules
    echo '-a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S \' >> /etc/audit/audit.rules
    echo 'lremovexattr -S fremovexattr -F auid>=500 -F auid!=4294967295 -k perm_mod' >> /etc/audit/audit.rules

    echo '-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate \'  >> /etc/audit/audit.rules
    echo '-F exit=-EACCES -F auid>=500 -F auid!=4294967295 -k access'  >> /etc/audit/audit.rules
    echo '-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate \'  >> /etc/audit/audit.rules
    echo '-F exit=-EPERM -F auid>=500 -F auid!=4294967295 -k access'  >> /etc/audit/audit.rules
    echo '-a always,exit -F arch=b32 -S mount -F auid>=500 -F auid!=4294967295 -k mounts'  >> /etc/audit/audit.rules
    echo '-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=500 \'  >> /etc/audit/audit.rules
    echo '-F auid!=4294967295 -k delete'  >> /etc/audit/audit.rules
    echo '-w /etc/sudoers -p wa -k scope'  >> /etc/audit/audit.rules
    
    echo "-w /etc/sudoers -p wa -k scope" >> /etc/audit/audit.rules
    echo "-w /var/log/sudo.log -p wa -k actions" >> /etc/audit/audit.rules
    echo "-w /sbin/insmod -p x -k modules" >> /etc/audit/audit.rules
    echo "-w /sbin/rmmod -p x -k modules" >> /etc/audit/audit.rules
    echo "-w /sbin/modprobe -p x -k modules" >> /etc/audit/audit.rules

    echo "-e 2" >> /etc/audit/audit.rules

    if [[ $(lscpu) =~ .*64-bit.* ]]
    then
        #64-bit
        echo "-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change" >> /etc/audit/audit.rules
        echo "-a always,exit -F arch=b64 -S clock_settime -k time-change"  >> /etc/audit/audit.rules

        echo '-a exit,always -F arch=b64 -S sethostname -S setdomainname -k system-locale' >> /etc/audit/audit.rules

        echo '-a always,exit -F arch=b64 -S chmod -S fchmod -S fchmodat -F auid>=500 \'  >> /etc/audit/audit.rules
        echo '-F auid!=4294967295 -k perm_mod'  >> /etc/audit/audit.rules
        echo '-a always,exit -F arch=b64 -S chown -S fchown -S fchownat -S lchown -F auid>=500 \'  >> /etc/audit/audit.rules
        echo '-F auid!=4294967295 -k perm_mod'  >> /etc/audit/audit.rules
        echo '-a always,exit -F arch=b64 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S \'  >> /etc/audit/audit.rules
        echo 'lremovexattr -S fremovexattr -F auid>=500 -F auid!=4294967295 -k perm_mod'  >> /etc/audit/audit.rules

        echo '-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate \'  >> /etc/audit/audit.rules
        echo '-F exit=-EACCES -F auid>=500 -F auid!=4294967295 -k access'  >> /etc/audit/audit.rules
        echo '-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate \'  >> /etc/audit/audit.rules
        echo '-F exit=-EPERM -F auid>=500 -F auid!=4294967295 -k access'  >> /etc/audit/audit.rules

        echo '-a always,exit -F arch=b64 -S mount -F auid>=500 -F auid!=4294967295 -k mounts'  >> /etc/audit/audit.rules

        echo '-a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=500 \'  >> /etc/audit/audit.rules
        echo '-F auid!=4294967295 -k delete'  >> /etc/audit/audit.rules

        echo '-a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=500 \'  >> /etc/audit/audit.rules
        echo '-F auid!=4294967295 -k delete'  >> /etc/audit/audit.rules
        
        echo '-a always,exit -F arch=b64 -S init_module -S delete_module -k modules'  >> /etc/audit/audit.rules
    else
        echo '-a always,exit -F arch=b32 -S init_module -S delete_module -k modules'  >> /etc/audit/audit.rules
    fi

    auditctl -e 1

}