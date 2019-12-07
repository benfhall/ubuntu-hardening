function f_postfix {

    sudo chmod 755 /etc/postfix
    sudo chmod 644 /etc/postfix/*.cf
    sudo chmod 755 /etc/postfix/postfix-script*
    sudo chmod 755 /var/spool/postfix
    sudo chown root:root /var/log/mail*
    sudo chmod 600 /var/log/mail*

    grep -q '^inet_interfaces' /etc/postfix/main.cf && sed -i 's/^inet_interfaces.*/inet_interfaces = localhost/' /etc/postfix/main.cf || echo 'inet_interfaces = localhost' >> /etc/postfix/main.cf
    grep -q '^default_process_limit' /etc/postfix/main.cf && sed -i 's/^default_process_limit.*/default_process_limit = 100/' /etc/postfix/main.cf || echo 'default_process_limit = 100' >> /etc/postfix/main.cf
    grep -q '^smtpd_client_connection_count_limit' /etc/postfix/main.cf && sed -i 's/^smtpd_client_connection_count_limit.*/smtpd_client_connection_count_limit = 10/' /etc/postfix/main.cf || echo 'smtpd_client_connection_count_limit = 10' >> /etc/postfix/main.cf
    grep -q '^smtpd_client_connection_rate_limit' /etc/postfix/main.cf && sed -i 's/^smtpd_client_connection_rate_limit.*/smtpd_client_connection_rate_limit = 30/' /etc/postfix/main.cf || echo 'smtpd_client_connection_rate_limit = 30' >> /etc/postfix/main.cf
    grep -q '^queue_minfree' /etc/postfix/main.cf && sed -i 's/^.queue_minfree*/queue_minfree = 20971520/' /etc/postfix/main.cf || echo 'queue_minfree = 20971520' >> /etc/postfix/main.cf
    grep -q '^header_size_limit' /etc/postfix/main.cf && sed -i 's/^header_size_limit.*/header_size_limit = 51200/' /etc/postfix/main.cf || echo 'header_size_limit = 51200' >> /etc/postfix/main.cf
    grep -q '^message_size_limit' /etc/postfix/main.cf && sed -i 's/^message_size_limit.*/message_size_limit = 10485760/' /etc/postfix/main.cf || echo 'message_size_limit = 10485760' >> /etc/postfix/main.cf
    grep -q '^smtpd_recipient_limit' /etc/postfix/main.cf && sed -i 's/^smtpd_recipient_limit.*/smtpd_recipient_limit = 100/' /etc/postfix/main.cf || echo 'smtpd_recipient_limit = 100' >> /etc/postfix/main.cf
    grep -q '^disable_vrfy_command' /etc/postfix/main.cf && sed -i 's/^disable_vrfy_command.*/disable_vrfy_command = yes/' /etc/postfix/main.cf || echo 'disable_vrfy_command = yes' >> /etc/postfix/main.cf
    grep -q '^smtpd_delay_reject' /etc/postfix/main.cf && sed -i 's/^smtpd_delay_reject.*/smtpd_delay_reject = yes/' /etc/postfix/main.cf || echo 'smtpd_delay_reject = yes' >> /etc/postfix/main.cf
    grep -q '^smtpd_helo_required' /etc/postfix/main.cf && sed -i 's/^smtpd_helo_required.*/smtpd_helo_required = yes/' /etc/postfix/main.cf || echo 'smtpd_helo_required = yes' >> /etc/postfix/main.cf
    grep -q '^' /etc/postfix/main.cf && sed -i 's/^.*//' /etc/postfix/main.cf || echo '' >> /etc/postfix/main.cf
    grep -q '^' /etc/postfix/main.cf && sed -i 's/^.*//' /etc/postfix/main.cf || echo '' >> /etc/postfix/main.cf
    grep -q '^' /etc/postfix/main.cf && sed -i 's/^.*//' /etc/postfix/main.cf || echo '' >> /etc/postfix/main.cf
    grep -q '^' /etc/postfix/main.cf && sed -i 's/^.*//' /etc/postfix/main.cf || echo '' >> /etc/postfix/main.cf

}