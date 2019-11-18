# ubuntu-hardening

A script to secure Ubuntu 14.04 and several services.
This is BUILT for CyberPatriots. If you use this on a CyberPatriots competition, it is against Scripting Rules! Use at your own risk!
NOTE: RUN WITH BASH, NOT SH (ex. bash ubuntu.sh)

RUN IN SU mode!!!

Requirements:
- Ubuntu 14.04 (Trusty Tahr)
- Upstart (not systemd)
- OpenSSH

Additional Resources:
- https://github.com/Forty-Bot/linux-checklist
- http://bookofzeus.com/harden-ubuntu/
- https://github.com/maldevel/blue-team/tree/master/hardening
- https://security.uri.edu/files/CIS_Ubuntu_14.04_LTS_Server_Benchmark_v1.0.0.pdf
- https://www.alibabacloud.com/help/faq-list/60787.htm

Simple Checklist:
- Remove unwanted software
- Set updates to daily, notify, and immediate
- Delete media files
- Look at open ports
