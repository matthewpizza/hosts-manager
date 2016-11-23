#!/usr/local/bin/fish

# Concept based on http://unix.stackexchange.com/a/60554

# Check if sudo
if [ (whoami) != "root" ]
    echo "This script must be run with sudo."
    exit 1
end

# Get latest list of malware hosts https://github.com/StevenBlack/hosts
cd /etc/hosts.d
rm 10-malware.conf
curl -O "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts.zip"
unzip hosts.zip; rm hosts.zip
mv hosts 10-malware.conf

# Backup current hosts file
cp /etc/hosts /etc/hosts.(date +"%Y%m%d").bak

# Empty the current file
cat /dev/null > /etc/hosts

# Loop through config files
for file in *.conf
    echo "Appending $file"
    cat $file >> /etc/hosts
    # Separate with a line for readability
    echo "" >> /etc/hosts
end
