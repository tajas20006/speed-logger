Param (
  [Parameter(Mandatory)]
  [string]$token,

  [Parameter()]
  [string]$out,

  [Parameter()]
  [int]$freq = 15
)

if (-Not $out) {
  mkdir result -Force
  $now = Get-Date -Format 'yyyyMMdd_hhmmss'
  $out = "./result/$now.csv"
}
Write-Host Writing result to $out

while (1) {
  $speed = fast-speedtest $token
  Write-Host $speed
  $now = Get-Date -Format 'yyyy/MM/dd hh:mm:ss'
  "$now,$($speed.split(' ')[1])" >> $out
  Start-Sleep($freq)
}

