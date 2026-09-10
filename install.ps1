# 超级模式预设安装脚本 (Windows PowerShell)
# Super Mode Preset Installation Script

#Requires -Version 5.1

[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'

# 颜色输出函数
function Write-Info {
    param([string]$Message)
    Write-Host "ℹ " -ForegroundColor Cyan -NoNewline
    Write-Host $Message
}

function Write-Success {
    param([string]$Message)
    Write-Host "✓ " -ForegroundColor Green -NoNewline
    Write-Host $Message
}

function Write-Warn {
    param([string]$Message)
    Write-Host "⚠ " -ForegroundColor Yellow -NoNewline
    Write-Host $Message
}

function Write-Error {
    param([string]$Message)
    Write-Host "✗ " -ForegroundColor Red -NoNewline
    Write-Host $Message
    exit 1
}

# 确定 DSH 主目录
function Get-DshHome {
    if ($env:DSH_HOME) {
        $dshDir = $env:DSH_HOME
    } else {
        $dshDir = Join-Path $env:USERPROFILE ".dsh"
    }
    
    if (-not (Test-Path $dshDir)) {
        Write-Warn "DSH 目录不存在: $dshDir"
        Write-Info "将创建该目录..."
        New-Item -ItemType Directory -Path $dshDir -Force | Out-Null
    }
    
    Write-Success "DSH 主目录: $dshDir"
    return $dshDir
}

# 确定预设目录
function Get-PresetDir {
    param([string]$DshHome)
    
    $presetDir = Join-Path $DshHome ".agent-presets\super-mode"
    Write-Success "预设安装目录: $presetDir"
    return $presetDir
}

# 检查是否已安装
function Test-ExistingInstall {
    param([string]$PresetDir)
    
    if (Test-Path $PresetDir) {
        Write-Warn "检测到已安装的超级模式预设"
        $response = Read-Host "是否覆盖安装? (y/N)"
        if ($response -notin @('y', 'Y', 'yes', 'Yes')) {
            Write-Info "安装已取消"
            exit 0
        }
    }
}

# 下载预设文件
function Download-Preset {
    $repoUrl = "https://github.com/YOUR_USERNAME/dsh-super-mode-preset"
    $downloadUrl = "$repoUrl/archive/refs/heads/main.zip"
    
    Write-Info "正在下载预设文件..."
    
    # 创建临时目录
    $tempDir = Join-Path $env:TEMP "dsh-super-mode-$(Get-Random)"
    New-Item -ItemType Directory -Path $tempDir -Force | Out-Null
    
    try {
        $zipPath = Join-Path $tempDir "preset.zip"
        
        # 下载文件
        if ($PSVersionTable.PSVersion.Major -ge 6) {
            # PowerShell Core
            Invoke-WebRequest -Uri $downloadUrl -OutFile $zipPath -UseBasicParsing
        } else {
            # Windows PowerShell
            [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
            (New-Object System.Net.WebClient).DownloadFile($downloadUrl, $zipPath)
        }
        
        # 解压
        Write-Info "正在解压文件..."
        Expand-Archive -Path $zipPath -DestinationPath $tempDir -Force
        
        # 找到解压后的目录
        $extractedDir = Get-ChildItem -Path $tempDir -Directory | Where-Object { $_.Name -like "dsh-super-mode-preset-*" } | Select-Object -First 1
        
        if (-not $extractedDir) {
            throw "解压失败"
        }
        
        Write-Success "下载完成"
        return $extractedDir.FullName
    }
    catch {
        # 清理临时目录
        if (Test-Path $tempDir) {
            Remove-Item -Path $tempDir -Recurse -Force
        }
        Write-Error "下载失败: $_"
    }
}

# 安装预设
function Install-Preset {
    param(
        [string]$SourceDir,
        [string]$PresetDir
    )
    
    # 创建预设目录
    New-Item -ItemType Directory -Path $PresetDir -Force | Out-Null
    
    # 复制文件
    Write-Info "正在安装预设文件..."
    $sourcePresetDir = Join-Path $SourceDir "super-mode"
    
    if (-not (Test-Path $sourcePresetDir)) {
        throw "源预设目录不存在: $sourcePresetDir"
    }
    
    Copy-Item -Path "$sourcePresetDir\*" -Destination $PresetDir -Recurse -Force
    
    Write-Success "预设文件安装完成"
}

# 显示安装后信息
function Show-PostInstall {
    param([string]$PresetDir)
    
    Write-Host ""
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Green
    Write-Host "  🎉 超级模式预设安装成功！" -ForegroundColor Green
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Green
    Write-Host ""
    Write-Host "📍 安装位置:" -ForegroundColor Cyan
    Write-Host "   $PresetDir"
    Write-Host ""
    Write-Host "📋 下一步操作:" -ForegroundColor Cyan
    Write-Host "   1. 重启 DSH Desktop"
    Write-Host "   2. 创建新会话时，在预设选择器中选择「超级模式」"
    Write-Host "   3. 享受更强大的 AI 编码体验！"
    Write-Host ""
    Write-Host "💡 提示:" -ForegroundColor Yellow
    Write-Host "   - 每轮请求约多消耗 2,000-5,000 tokens (~20-30%)"
    Write-Host "   - 适合复杂架构设计、大规模重构、深度调试等场景"
    Write-Host ""
    Write-Host "📖 更多信息:" -ForegroundColor Cyan
    Write-Host "   https://github.com/YOUR_USERNAME/dsh-super-mode-preset"
    Write-Host ""
}

# 主函数
function Main {
    Write-Host ""
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
    Write-Host "  🚀 超级模式预设安装程序" -ForegroundColor Cyan
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
    Write-Host ""
    
    $dshHome = Get-DshHome
    $presetDir = Get-PresetDir -DshHome $dshHome
    Test-ExistingInstall -PresetDir $presetDir
    
    $sourceDir = Download-Preset
    
    try {
        Install-Preset -SourceDir $sourceDir -PresetDir $presetDir
        Show-PostInstall -PresetDir $presetDir
    }
    finally {
        # 清理临时目录
        $tempParent = Split-Path $sourceDir -Parent
        if (Test-Path $tempParent) {
            Remove-Item -Path $tempParent -Recurse -Force -ErrorAction SilentlyContinue
        }
    }
}

# 运行主函数
Main
