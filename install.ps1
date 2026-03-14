$repo = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "Installing dev configs..."

# -----------------
# VSCode
# -----------------
$vscode = "$env:APPDATA\Code\User"
New-Item -ItemType Directory -Force -Path $vscode | Out-Null

Copy-Item `
  "$repo\vscode\settings.json" `
  "$vscode\settings.json" `
  -Force
  
# -----------------
# Neovim
# -----------------
$nvim = "$env:LOCALAPPDATA\nvim"
New-Item -ItemType Directory -Force -Path $nvim | Out-Null

Copy-Item `
  "$repo\nvim\init.lua" `
  "$nvim\init.lua" `
  -Force

Copy-Item `
  "$repo\nvim\lua" `
  "$nvim\lua" `
  -Recurse `
  -Force

Write-Host "Done!"
