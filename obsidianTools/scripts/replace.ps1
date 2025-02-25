# file to read and parse acronym table into separate files

$source = "Glossary/"
$fileSource = $source + "*.md"

$findStr = "alias"
$replaceStr = "acronym"

$files = Get-ChildItem -recurse $fileSource
Write-Output "length is" $files.Length

foreach ($file in $files) {
  #$file = $source + "ACI.md"
  (Get-Content $file).replace($findStr, $replaceStr) | Set-Content $file

}

