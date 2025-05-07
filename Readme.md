Fixing what Unifi doesn't want to fix

#https://community.ui.com/questions/Feature-Request-UDM-Pro-PPPoE-RFC4638-1500-MTU-MRU-for-PPP/b5c1fcf6-bee5-4fc7-ae00-c8ce2bf2e724

Extract this repo to /data/fix-mtu, set the interface in fix-mtu.sh and install/enable the service. Remember to disable MSS Clamping in the gateway interface.

(I should probably write a nice curl installer for this, patches welcome)