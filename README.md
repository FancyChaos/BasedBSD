# BasedBSD
This repo contains configurations and install scripts to customize a fresh installed OpenBSD to my liking.

## Installation
 1. Setup doas for root priviliges. Its a lot more convenient when adding the 'nopass' option to your */etc/doas.conf* configuration for the installation process. Remove the option afterwards or replace it with 'persist' for example.
 2. Install git
	 > doas pkg_add git
 3. Clone this repository and *cd* into it
	 > git clone https://github.com/FancyChaos/BasedBSD.git && cd BasedBSD
 5. Execute the *run.sh* script
	 > chmod +x run.sh && ./run.sh
6. The script will exit normally when everything is done. Now restore your */etc/doas.conf* configuration if previously changed and reboot the system
	> doas shutdown -r now

## Thanks
Big thanks to anyone I stole scripts, wallpapers or code snippets from.
My configurations were influenced by setups and dotfiles from alot of people.
