Set-Location $PSScriptRoot
Set-Location ..

Remove-Item openimageio -Force -Recurse -ErrorAction SilentlyContinue

new-item openimageio -itemtype directory
copy-Item ./external/OpenImageIO/dist/bin/* ./openimageio
copy-Item ./.pixi/envs/oiio/Library/bin/*.dll ./openimageio

new-item temp -itemtype directory -ErrorAction SilentlyContinue
foreach ($dep in Get-ChildItem ./openimageio/*.dll) {
    Write-Output "::group::$dep"
    copy-Item $dep ./temp
    Remove-Item $dep
    ./openimageio/oiiotool.exe --help
    if ($LASTEXITCODE -ne 0) {
        $name = $dep.Name
        copy-Item "./temp/$name" ./openimageio
    }
    Write-Output "::endgroup::"
}
