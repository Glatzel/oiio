Set-Location $PSScriptRoot
Set-Location ..

git submodule update --init --recursive
./vcpkg/bootstrap-vcpkg.bat
