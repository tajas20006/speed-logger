Param (
  [Parameter(Mandatory)]
  [string]$token,

  [Parameter()]
  [string]$out = "speed.csv",

  [Parameter()]
  [int]$freq = 5
)

while (1) {
  $speed = fast-speedtest $token
  Write-Host $speed
  $now = Get-Date -Format 'yyyy/MM/dd hh:mm:ss'
  "$now,$($speed.split(' ')[1])" >> $out
  Start-Sleep($freq)
}

