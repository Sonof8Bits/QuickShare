# QuickShare
A quick and easy way to share files with friends. For example in chat rooms,
or social media.


#### Requirements:
- You enjoy using the command line.
- A computer running Mac OSX.
- A computer running Linux with xclip installed.
- In .profile make an alias for QuickShare:
  alias quickshare=~/script/QuickShare.sh
  (Or don't, but typing the path to a script makes QuickShare a little
  less 'Quick' no?)
A Linux/Unix server:
- A VPS, a Mac or Raspberry Pi at home with ports 80/443 open to the internet,
  dynamic DNS, doesn't matter what you use and how.
- Needs a working web-server installation:
  Apache, nginx, lighttp or whatever you crazy kids use these days!
- You might need sudo rights for your /www/ folder, check your privilege!
  An easy way to solve this is to add your user to the www-data group
  (Apache, Debian)
- Make a folder named quickshare in /var/www/ (or wherever you have your
  public web-server files).
- Configure your ssh keys. (Or don't, but typing a password makes QuickShare 
  a little less 'Quick' no?)

#### Usage:
##### 1 In your command line prompt:
  quickshare /some/where/file-to.share
  
  For example:
  
  quickshare /home/me/pictures/funny-neko-nyan.jpg
  
  On Mac OSX you can also run this as a service. Open up Automator, select "Service", select  "Run Shell Script" from the variables, copy the QuickShare script and don't forget to set "Service receives selected" to "files or folders" and "in" to "Finder.app". Lastly, set "Pass input" to "as arguments". All done! Hit save to install the service. In System Preferences you can even make a shortcut for QuickShare! Since nothing was using ctrl+q I decided to use that.
  
##### 2 Done! The link is now copied to your clipboard.
  For example:
  
  https://example.com/quickshare/funny-neko-nyan.jpg
  
##### New in 0.3:
  Also works for sharing a folder.
