#! /bin/bash/


	conf=$(zenity --list --checklist \
	--title="$helper $versnum" \
	--text="Select your video conferancing software" \
	--column="Selected" --column="Software" \
	"" "Skype" \
	"" "Teams" \
	"" "VIPole" \
	"" "Zoom")

SKYPE=$(echo $conf | grep -c "Skype")
ZOOM=$(echo $conf | grep -c "Zoom")
TEAMS=$(echo $conf | grep -c "Teams")
VIPOLE=$(echo $conf | grep -c "VIPole")

	if [ $ZOOM -gt '0' ]; then
	flatpak --system install flathub us.zoom.Zoom -yy
	fi

	if [ $TEAMS -gt '0' ]; then
	flatpak --system install flathub com.microsoft.Teams -yy
	fi

	if [ $SKYPE -gt '0' ]; then
	flatpak --system install flathub com.skype.Client -yy
	fi

	if [ $VIPOLE -gt '0' ]; then
	wget https://www.vipole.com/download/vipole.x86_64.run
	chmod u+x vipole.x86_64.run
	./vipole.x86_64.run
	rm ./vipole.x86_64.run
	fi
