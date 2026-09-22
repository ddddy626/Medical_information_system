# 一键初始化 MySQL 数据库（Windows）
# 用法（在项目根目录）:
#   powershell -ExecutionPolicy Bypass -File .\scripts\setup-db.ps1
#   powershell -ExecutionPolicy Bypass -File .\scripts\setup-db.ps1 -Password "你的密码"

param(
    [string]$HostName = "localhost",
    [int]$Port = 3306,
    [string]$User = "root",
    [string]$Password = "3911",
    [string]$Database = "hospital_db"
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$mysqlCandidates = @(
    "C:\Program Files\MySQL\MySQL Server 9.7\bin\mysql.exe",
    "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe",
    "C:\Program Files\MySQL\MySQL Server 8.4\bin\mysql.exe"
)

$mysql = $mysqlCandidates | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $mysql) {
    Write-Error "未找到 mysql.exe，请确认已安装 MySQL 8，或手动把 mysql 加入 PATH。"
}

$svc = Get-Service -Name "MySQL97","MySQL80" -ErrorAction SilentlyContinue | Where-Object { $_.Status -eq "Running" } | Select-Object -First 1
if (-not $svc) {
    $stopped = Get-Service -Name "MySQL97","MySQL80" -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($stopped) {
        Write-Host "$($stopped.Name) 服务未运行，正在尝试启动..."
        try {
            Start-Service $stopped.Name
            Start-Sleep -Seconds 4
        } catch {
            Write-Host ""
            Write-Host "无法自动启动 MySQL。请以管理员身份打开 PowerShell 执行:" -ForegroundColor Yellow
            Write-Host "  net start $($stopped.Name)" -ForegroundColor Cyan
            Write-Host "或在 services.msc 中手动启动后重新运行本脚本。" -ForegroundColor Yellow
            exit 1
        }
    }
}

function Invoke-MySqlFile {
    param([string]$FilePath)
    if (-not (Test-Path $FilePath)) {
        Write-Error "找不到 SQL 文件: $FilePath"
    }
    Write-Host ">> 执行: $FilePath"
    cmd /c "`"$mysql`" -h $HostName -P $Port -u $User -p$Password --default-character-set=utf8mb4 < `"$FilePath`""
    if ($LASTEXITCODE -ne 0) {
        throw "SQL 执行失败: $FilePath"
    }
}

Write-Host "连接 MySQL: ${User}@${HostName}:${Port}" -ForegroundColor Green
Write-Host "目标库: $Database" -ForegroundColor Green

Invoke-MySqlFile (Join-Path $root "sql\00-init-database.sql")
Invoke-MySqlFile (Join-Path $root "hospital_db.sql")
Invoke-MySqlFile (Join-Path $root "sql\01-supplement-tables.sql")

Write-Host ""
Write-Host "数据库初始化完成。" -ForegroundColor Green
Write-Host "测试账号:" -ForegroundColor Cyan
Write-Host "  管理员  admin / 123456"
Write-Host "  患者    patient1 / 123456"
Write-Host "  医生    doctor_001 / 123456"
Write-Host ""
Write-Host "请确认 application.properties 中密码与 MySQL root 密码一致。" -ForegroundColor Yellow
