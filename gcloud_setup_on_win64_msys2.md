1) download GoogleCloudSDKInstaller.exe from google

2) In the folder containing the installer EXE, copy the path

3) In MSYS2, paste the path of the installer EXE into the command line and run the installer.

4) In MSYS2, run cloud init

> cd "/C/Users/Mark/AppData/Local/Google/Cloud SDK/google-cloud-sdk/bin"
> gcloud init

5) Gcloud will open a browser and take you to an auth flow, authorize gcloud

6) Back in MSYS, gcloud init will ask what project to use, pick[2] "game-development-workflow".

7) gcloud should be all set up. Confirm with:

> ./gcloud -v

8) You might want to make an alias. Add this line in ./dotfiles/.bashrc:

alias gcloud='echo " ------------------ NOTICE: this usage of gcloud is an alias in .bashrc -------------------"; "/C/Users/Mark/AppData/Local/Google/Cloud SDK/google-cloud-sdk/bin/gcloud"'

