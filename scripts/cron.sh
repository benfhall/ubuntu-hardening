function f_cron {

    service cron restart

    # check permissons on cron files
    chown root:root /etc/crontab
    chmod og-rwx /etc/crontab

    chown root:root /etc/cron.hourly
    chmod og-rwx /etc/cron.hourly

    chown root:root /etc/cron.daily
    chmod og-rwx /etc/cron.daily

    chown root:root /etc/cron.weekly
    chmod og-rwx /etc/cron.weekly

    chown root:root /etc/cron.monthly
    chmod og-rwx /etc/cron.monthly

}