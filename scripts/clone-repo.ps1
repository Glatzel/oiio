param($version = gh release view -R AcademySoftwareFoundation/OpenImageIO --json tagName -q .tagName)
Set-Location $PSScriptRoot
Set-Location ..
$patch_libraw = Resolve-Path ./patch/fix_libraw.patch

Remove-Item external -Force -Recurse -ErrorAction SilentlyContinue
New-Item external -ItemType Directory
Set-Location external

Write-Output "::group::clone OpenImageIO"
git clone https://github.com/AcademySoftwareFoundation/OpenImageIO.git
Set-Location OpenImageIO
git checkout tags/"$version" -b "$version-branch"
# apply patch
git apply -v $patch_libraw
Set-Location ..
Write-Output "::endgroup::"

Write-Output "::group::clone OpenColorIO"
git clone https://github.com/AcademySoftwareFoundation/OpenColorIO.git
Set-Location OpenColorIO
git checkout tags/v2.3.2 -b v2.3.2-branch
Set-Location ..
Write-Output "::endgroup::"
