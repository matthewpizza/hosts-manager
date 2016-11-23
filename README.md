# Host Manager

A very simple [Fish](https://fishshell.com) script to manage `/etc/hosts`. It combines multiple “config” files into one hosts file. The setup script also downloads and includes a list of adware/malware to block from [StevenBlack/hosts](https://github.com/StevenBlack/hosts).

Why? Well, the hosts file is very simple and doesn’t have the concept of includes. [This question](https://unix.stackexchange.com/a/60554) inspired this implementation. 

## Usage

Create a directory of config files at `/etc/hosts.d`:

(Files must use the `.conf` extension.)

```
sudo mkdir /etc/hosts.d
```

Example config `/etc/hosts.d/cool-dev-site.conf`:

```
192.168.69.69 cool-site.dev
```

Then run the script:

```
sudo fish setup.fish
```

## Notes

- This was only tested on macOS. 
- Use filenames to enforce order.

## Something broke!

Sorry! 😳 The script makes a backup of the old hosts file at `/etc/hosts.yyyymmdd.bak`. Maybe try to recover from that?

If that doesn’t help, here is the contents of the default macOS hosts file:

```
##
# Host Database
#
# localhost is used to configure the loopback interface
# when the system is booting.  Do not change this entry.
##
127.0.0.1       localhost
255.255.255.255 localhost
::1             localhost
```
