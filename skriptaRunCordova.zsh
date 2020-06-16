export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools

sudo pacman -S jdk8-openjdk

sudo archlinux-java set java-8-openjdk/jre
sudo archlinux-java fix

yay -S android-sdk-platform-tools

sudo pacman -S gradle

sudo archlinux-java set java-13-openjdk