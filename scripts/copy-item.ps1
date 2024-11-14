Set-Location $PSScriptRoot
Set-Location ..

Remove-Item openimageio -Force -Recurse -ErrorAction SilentlyContinue

new-item openimageio -itemtype directory
copy-Item ./oiio_dep/vcpkg_installed/x64-windows/bin/*.dll ./openimageio
copy-Item ./external/OpenImageIO/dist/bin/* ./openimageio
