#!/bin/bash
##
## http://sonof8bits.com/
##
## QuickShare 0.2 for Linux
## A quick and easy way to share files with friends. For example in chat rooms,
## or social media.
##
## Requirements:
## - You enjoy using the command line.
## - A computer running Linux with xclip installed.
## - In .profile make an alias for QuickShare:
##   alias quickshare=~/script/QuickShare.sh
##   (Or don't, but typing the path to a script makes QuickShare a little
##   less 'Quick' no?)
## A Linux/Unix server:
## - A VPS, a Mac or Raspberry Pi at home with ports 80/443 open to the internet,
##   dynamic DNS, doesn't matter what you use and how.
## - Needs a working web-server installation:
##   Apache, nginx, lighttp or whatever you crazy kids use these days!
## - You might need sudo rights for your /www/ folder, check your privilege!
##   An easy way to solve this is to add your user to the www-data group
##   (Apache, Debian)
## - Make a folder named quickshare in /var/www/ (or wherever you have your
##   public web-server files).
## - Configure your ssh keys. (Or don't, but typing a password makes QuickShare 
##   a little less 'Quick' no?)
##
## Usage:
## 1 In your command line prompt:
##   quickshare /some/where/file-to.share
##   For example:
##   quickshare /home/me/pictures/funny-neko-nyan.jpg
## 2 Done! The link is now copied to your clipboard.
##   For example:
##   https://example.com/quickshare/funny-neko-nyan.jpg


## Fill in your SSH portnumber here:
port=22

## Fill in your server address here:
## Can also be an IP address.
server=ssh.example.com

## Fill in your server's full address here:
## So the url comes out right in the clipboard, don't forget http:// or https://,
## no trailing slash. Can also be an IP address, but you do need http or https.
address=https://example.com

## Fill in your web-server's folder path here:
root=/var/www/quickshare/


## Script:
##
## Copy the file over to the server, the file being variable $1.
scp -P $port "$1" $server:$root

## Set the permission, else it won't work and the people opening your link will be
## greeted with a 403 error.
## I've splitt the command up so it won't cause any errors; command
## sets correct permissions for the quickshare/ folder, bye quits the SSH session.
command="chmod -R 755 $root"
bye="&& exit"
ssh -p $port $server "$command*" $bye

## When done copying, put the url in your clipboard.
echo $address/quickshare/`basename $1` | sed 's/\ /%20/g' | tr -d '\n' | xsel --clipboard --input

## FIN
exit
