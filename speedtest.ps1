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
  "$(Get-Date),$($speed.split(' ')[1])" >> $out
  Start-Sleep($freq)
}

