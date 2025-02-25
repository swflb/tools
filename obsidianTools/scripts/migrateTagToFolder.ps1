# file to read and parse acronym table into separate files

$source = "Glossary/"
$fileSource = $source + "*.md"
$destination = $source + "Network/"
$findStr = "network"


$files = Get-ChildItem -recurse $fileSource
Write-Output "length is" $files.Length

foreach ($file in $files) {
  #$file = $source + "ACI 2.md"
  #$line = Get-Content $file | Select-Object -Skip 1 -First 1
  #Write-Output $line
  $result = Select-String -Path $file -Pattern $findStr
  if ([string]::IsNullOrWhiteSpace($result))
  {
    Write-Output "file: $file"
  }
  else
  {
    Write-Output "result: $result"
    Move-Item -Path $file -Destination $destination
  }
}

