﻿$ErrorActionPreference = 'Stop';

$version        = ${ENV:ChocolateyPackageVersion}.Split('.')
$major          = ${version}[0]
$minor          = ${version}[1]
$packageName    = "${ENV:ChocolateyPackageName}"
$packageTitle   = "${ENV:ChocolateyPackageTitle}"
$url64          = "https://gstreamer.freedesktop.org/data/pkg/windows/${ENV:ChocolateyPackageVersion}/gstreamer-1.0-msvc-x86_64-${ENV:ChocolateyPackageVersion}.msi"
$silentArgs     = "/qn /norestart /l*v `"$(${ENV:TEMP})\$(${packageName}).$(${ENV:chocolateyPackageVersion}).MsiInstall.log`""

$packageArgs = @{
  packageName     = "${packageName}"
  softwareName    = "${packageTitle}"
  url64           = "${url64}"
  fileType        = "msi"
  silentArgs      = "${silentArgs}"
  validExitCodes  = @(0)
  checksum64      = "4730BC05B21525DFB33FE870465FDA0A1C04A2B69FBE72358C982ED079F920CD"
  checksumType64  = "sha256"
}

Install-ChocolateyPackage @packageArgs

Write-Output ""
Install-ChocolateyPath -PathToInstall "%GSTREAMER_1_0_ROOT_X86_64%\bin" -PathType "User"
$ENV:Path = "${ENV:PATH};%GSTREAMER_1_0_ROOT_X86_64%\bin"
