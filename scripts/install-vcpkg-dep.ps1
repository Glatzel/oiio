Set-Location $PSScriptRoot
Set-Location ..
$triplet=Resolve-Path ./triplet

Set-Location ./oiio_dep
Write-Output "::group::install OpenImageIO vcpkg"
vcpkg install --overlay-triplets=$triplet
Set-Location ..
Write-Output "::endgroup::"

Write-Output "::group::install OpenColorIO vcpkg"
Set-Location ./ocio_dep
vcpkg install --overlay-triplets=$triplet
Set-Location ..
Write-Output "::endgroup::"
