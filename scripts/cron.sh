function f_cron {

    sudo service cron restart

    # check permissons on cron files
    sudo chown root:root /etc/crontab
    sudo chmod og-rwx /etc/crontab

    sudo chown root:root /etc/cron.hourly
    sudo chmod og-rwx /etc/cron.hourly

    sudo chown root:root /etc/cron.daily
    sudo chmod og-rwx /etc/cron.daily

    sudo chown root:root /etc/cron.weekly
    sudo chmod og-rwx /etc/cron.weekly

    sudo chown root:root /etc/cron.monthly
    sudo chmod og-rwx /etc/cron.monthly

}