Param (
  [Parameter(Mandatory)]
  [string]$token,

  [Parameter()]
  [string]$out,

  [Parameter()]
  [int]$freq = 15
)

while (1) {
  if ($out) {
    $outfile = $out
  }
  else {
    $date = Get-Date -Format 'yyyyMMdd'
    $outfile = "./result/$date.csv"
  }

  $speed = fast-speedtest $token
  Write-Host $speed
  $now = Get-Date -Format 'yyyy/MM/dd hh:mm:ss'
  "$now,$($speed.split(' ')[1])" >> $outfile
  Start-Sleep($freq)
}

