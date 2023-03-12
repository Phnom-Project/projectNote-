## Debian
> install gui
```shell
root@dlp:~# apt -y install task-mate-desktop
root@dlp:~# reboot
```
> install ssh (login as root)
```shell
root@dlp:~# apt -y install openssh-server
root@dlp:~# vi /etc/ssh/sshd_config
# line 34 : uncomment and change to [no]
PermitRootLogin no
root@dlp:~# systemctl restart ssh
```
> ### install noVNC
```shell
root@dlp:~# apt -y install novnc python3-websockify

root@dlp:~# apt -y install tigervnc-standalone-server
# set VNC password
debian@dlp:~$ vncpasswd
Password:
Verify:
Would you like to enter a view-only password (y/n)? n

# start VNC server with MATE desktop, diplay number [1], screen resolution [800x600]
debian@dlp:~$ tigervncserver -xstartup /usr/bin/mate-session -geometry 800x600 -localhost no :1

New Xtigervnc server 'dlp.srv.world:1 (debian)' on port 5901 for display :1.
Use xtigervncviewer -SecurityTypes VncAuth,TLSVnc -passwd /home/debian/.vnc/passwd dlp.srv.world:1 to connect to the VNC server.

# if stop VNC, run like follows
debian@dlp:~$ tigervncserver -kill :1
Killing Xtigervnc process ID 4303... success!

debian@dlp:~$ openssl req -x509 -nodes -newkey rsa:3072 -keyout novnc.pem -out novnc.pem -days 3650
Generating a RSA private key
..............++++
..++++
writing new private key to 'novnc.pem'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:JP                            # country code
State or Province Name (full name) [Some-State]:Hiroshima       # state
Locality Name (eg, city) []:Hiroshima                           # city
Organization Name (eg, company) [Internet Widgits Pty Ltd]:GTS  # company
Organizational Unit Name (eg, section) []:Server World          # department
Common Name (e.g. server FQDN or YOUR name) []:dlp.srv.world    # server's FQDN
Email Address []:debian@srv.world                               # admin email

debian@dlp:~$ websockify -D --web=/usr/share/novnc/ --cert=/home/debian/novnc.pem 6080 localhost:5901
WebSocket server settings:
  - Listen on :6080
  - Web server. Web root: /usr/share/novnc
  - SSL/TLS support
  - Backgrounding (daemon)
```
