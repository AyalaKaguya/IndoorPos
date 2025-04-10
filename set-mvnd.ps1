# 获取脚本所在目录的绝对路径
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path

# 设置MAVEN_HOME环境变量
$env:MAVEN_HOME = Join-Path $scriptPath "maven-mvnd-1.0.2-windows-amd64\mvn"

# 设置M2_HOME环境变量
$env:M2_HOME = $env:MAVEN_HOME

# 设置MVND_HOME环境变量
$env:MVND_HOME = Join-Path $scriptPath "maven-mvnd-1.0.2-windows-amd64"

# 将Maven和MVND的bin目录添加到PATH
$env:PATH = "$env:MAVEN_HOME\bin;$env:MVND_HOME\bin;$env:PATH"

# 显示设置的环境变量
Write-Host "MAVEN_HOME = $env:MAVEN_HOME"
Write-Host "M2_HOME = $env:M2_HOME"
Write-Host "MVND_HOME = $env:MVND_HOME"