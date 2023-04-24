$extensionFileDir = $1

if ! extensionList=$(cat $extensionFileDir); then
	echo "Unable to read extension list file!"
	exit 1
fi

for extension in $extensionList; do
	echo "Installing extension $extension"
	if ! code --install-extension $extension --force; then
		Write-Host "An error occurred when trying to install extension"
		exit 1
	fi
done

exit 0
