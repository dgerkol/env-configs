$extensionFileDir = $args[0]


try {
			$extensionList = cat $extensionFileDir
} catch {
			Write-Host "Unable to read extension list file!"
			$_
			Exit(1)
}
	

$extensionList | ForEach-Object {
		try {
				Write-Host "Installing extension $_"
				Invoke-Expression "& '$vsCodeExec' --install-extension $_ --force"
				Write-Host # New-Line
		} catch {
				Write-Host "An error occurred when trying to install extension:"
				$_
				Exit(1)
		}
}

Exit(0)
