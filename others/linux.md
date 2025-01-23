# Collection of commands and utilities in Linux

## Commands

### cat
- `cat file.txt` - display the contents of a file
- `cat file1.txt file2.txt` - display the contents of multiple files
- `cat file1.txt file2.txt > file3.txt` - concatenate the contents of file1 and file2 into file3
- `cat file1.txt file2.txt >> file3.txt` - append the contents of file1 and file2 into file3

### apt-get
- `apt-get update -y` - update all packages inside linux
- `apt-get install package -y` - install the package and accept any question asked

## Utilities
- `cat /etc/issue` - display the Linux distribution
- `pwd` - displays the present working directory
- `uname -a` - display the kernel version
- `hostname` - display the hostname
- `hostname -I` - display the IP address
- `ifconfig` - display the network configuration
- `ip addr` - display the IP address
- `netstat -tuln` - display the listening ports
- `ps aux` - display the running processes
- `htop` - display the running processes
- `free -m` - display the memory usage
- `df -h` - display the disk usage
- `du -sh` - display the disk usage of the current directory
- `uptime` - display the uptime
- `date` - display the current date and time
- `cal` - display the calendar
- `who` - display the users logged in
- `w` - display the users logged in
- `last` - display the last logged in users
- `history` - display the command history
- `man command` - display the manual page of a command
- `ldd /path/to/executable` - display the shared libraries required by an executable (can be used to make jailed containers)
- `chroot /path/to/root /path/to/executable` - run an executable in a jailed environment
- `mkdir /path/to/create{,64}` - creates 2 folders called inside `/path/to/` called `create` and `create64`  
- `cd /sys/fs/cgroup` - 

## Create an unshared environment (namespace)
- `apt-get install debootstrap -y`
- `debootstrap --variant=minbase jammy /better-root` - install minbase variant of debian into `/better-root` folder
- `unshare --mount --uts --ipc --net --pid --fork --user --map-root-user chroot /better-root bash`  - create a new namespace and get into it.
- `mount -t proc none /proc`
- `mount -t sysfs none /sys`
- `mount -t tmpfs none /tmp`
