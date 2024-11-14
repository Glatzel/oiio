param($version="v3.0.0.3")
Set-Location $PSScriptRoot
Set-Location ..
$patch_libraw= Resolve-Path ./patch/fix_libraw.patch
Remove-Item external -Force -Recurse -ErrorAction SilentlyContinue
New-Item external -ItemType Directory
Set-Location external

Write-Output "::group::clone OpenImageIO"
git clone https://github.com/AcademySoftwareFoundation/OpenImageIO.git
Set-Location OpenImageIO
git checkout tags/"$version"
# apply patch
git apply $patch_libraw
Set-Location ..
Write-Output "::endgroup::"

Write-Output "::group::clone OpenColorIO"
git clone https://github.com/AcademySoftwareFoundation/OpenColorIO.git
Set-Location OpenColorIO
git checkout tags/v2.3.2
Set-Location ..
Write-Output "::endgroup::"
