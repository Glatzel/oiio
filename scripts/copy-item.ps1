Set-Location $PSScriptRoot
Set-Location ..

Remove-Item openimageio -Force -Recurse -ErrorAction SilentlyContinue

new-item openimageio -itemtype directory
copy-Item ./external/OpenImageIO/dist/bin/* ./openimageio
