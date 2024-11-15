Set-Location $PSScriptRoot
Set-Location ..

$pkg = Resolve-Path ./oiio_dep/vcpkg_installed/x64-windows
$pkg = "$pkg" -replace "\\", "/"

Write-Output "::group::Make oiio"
Set-Location ./external/OpenImageIO
# remove makecache
Remove-Item */CMakeCache.txt -ErrorAction SilentlyContinue
# make
cmake -S . -B build -DVERBOSE=ON -DCMAKE_BUILD_TYPE=Release `
  -DCMAKE_CXX_FLAGS="/utf-8" -DCMAKE_C_FLAGS="/utf-8" `
  -DBZip2_ROOT="$pkg" `
  -DFFmpeg_ROOT="$pkg" `
  -Dfmt_ROOT="$pkg" `
  -DFreetype_ROOT="$pkg" `
  -DGIF_ROOT="$pkg" `
  -DImath_ROOT="$pkg" `
  -DJXL_ROOT="$pkg" `
  -DLibheif_ROOT="$pkg" `
  -Dlibjpeg-turbo_ROOT="$pkg" `
  -DLibRaw_ROOT="$pkg" `
  -DOpenColorIO_ROOT="$pkg" `
  -DOpenEXR_ROOT="$pkg" `
  -DOpenJPEG_ROOT="$pkg" `
  -DPNG_ROOT="$pkg" `
  -DRobinmap_ROOT="$pkg" `
  -DTBB_ROOT="$pkg" `
  -DTIFF_ROOT="$pkg" `
  -DWebP_ROOT="$pkg" `
  -DZLIB_ROOT="$pkg" `
  -DENABLE_DCMTK=0 `
  -DENABLE_Nuke=0 `
  -DENABLE_OpenCV=0 `
  -DENABLE_OpenVDB=0 `
  -DENABLE_Ptex=0 `
  -DENABLE_Python3=0 `
  -DBUILD_DOCS=0 `
  -DINSTALL_DOCS=0 `
  -DENABLE_INSTALL_testtex=0 `
  -DUSE_PYTHON=0 `
  -DUSE_QT=0 `
  -DBUILD_SHARED_LIBS=1 `
  -DLINKSTATIC=0 `
  -DOIIO_BUILD_TESTS=0 `
  -DUSE_SIMD="sse4.2,avx2"
Write-Output "::endgroup::"

Write-Output "::group::build oiio"
cmake --build build --config Release --target install
Write-Output "::endgroup::"
