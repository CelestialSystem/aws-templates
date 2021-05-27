$path = "$(System.DefaultWorkingDirectory)/_Build Image Release Artefacts/aws-w12r2d-15-0/w12r2d-15-0.txt"
if (Test-Path $path) {
  $amiID = Get-Content -Path $path 
  Write-Host $amiID | Out-Default | Write-Verbose
  $imageName = (Get-EC2Image -ImageId $amiID).Name
  $imageID=Copy-EC2Image -SourceRegion ap-southeast-2 -SourceImageId $amiID -Region us-east-1 -Name $imageName
Write-Host " Image Copy takes a few minutes"
#Start-Sleep -Seconds 550
Write-Host "##vso[task.setvariable variable=name;isOutput=true]$imageName" | Out-Default | Write-Verbose
Write-Host "##vso[task.setvariable variable=id;isOutput=true]$imageID" | Out-Default | Write-Verbose

}
