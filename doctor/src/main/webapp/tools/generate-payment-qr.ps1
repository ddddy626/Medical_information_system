# 使用 amazing-qr-master 生成缴费静态二维码到 webapp/images/qr-payment.png
$ErrorActionPreference = "Stop"
$root = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$amzDir = Join-Path $root "amazing-qr-master"
$outDir = Join-Path $root "images"

$feeId = Read-Host "feeId（必填，每笔订单一个）"
if ([string]::IsNullOrWhiteSpace($feeId)) { throw "feeId 不能为空" }
$userId = Read-Host "患者 userId（例如 14）"
$userName = Read-Host "患者姓名（例如 张钊）"
$hostBase = Read-Host "服务地址（默认 http://localhost:8081）"
if ([string]::IsNullOrWhiteSpace($hostBase)) { $hostBase = "http://localhost:8081" }

$encName = [uri]::EscapeDataString($userName)
$url = "$hostBase/doctor/patient-payment-detail.html?userId=$userId&userName=$encName&feeId=$feeId&scanPay=1"

Write-Host "生成 URL: $url"
Push-Location $amzDir
try {
    python amzqr.py $url -n qr-payment.png -d $outDir
    Write-Host "已输出: $outDir\qr-payment.png"
} finally {
    Pop-Location
}
