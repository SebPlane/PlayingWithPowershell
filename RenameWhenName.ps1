# Load the System.Windows.Forms assembly
Add-Type -AssemblyName System.Windows.Forms
  
# Define the text to be typed
$textToType = "This is a test."
  
# Start Notepad
Start-Process notepad
  
# Wait for Notepad to open
Start-Sleep -Seconds 1
  
# Get the Notepad window
$notepadWindow = Get-Process | Where-Object {$_.MainWindowTitle -eq "Untitled - Notepad"} | Select-Object -First 1
  
if ($notepadWindow) {
    # Type the text into Notepad
    [System.Windows.Forms.SendKeys]::SendWait($textToType)
}
else {
    Write-Host "Notepad is not running or could not be found."
}