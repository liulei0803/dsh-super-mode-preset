#!/bin/bash

# 超级模式预设安装脚本 (macOS/Linux)
# Super Mode Preset Installation Script

set -e  # 遇到错误立即退出

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 打印带颜色的消息
info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

success() {
    echo -e "${GREEN}✓${NC} $1"
}

warn() {
    echo -e "${YELLOW}⚠${NC} $1"
}

error() {
    echo -e "${RED}✗${NC} $1"
    exit 1
}

# 检测操作系统
detect_os() {
    case "$(uname -s)" in
        Darwin*)    OS="macos";;
        Linux*)     OS="linux";;
        *)          error "不支持的操作系统: $(uname -s)"
    esac
    success "检测到操作系统: $OS"
}

# 确定 DSH 主目录
get_dsh_home() {
    if [ -n "$DSH_HOME" ]; then
        DSH_DIR="$DSH_HOME"
    else
        DSH_DIR="$HOME/.dsh"
    fi
    
    if [ ! -d "$DSH_DIR" ]; then
        warn "DSH 目录不存在: $DSH_DIR"
        info "将创建该目录..."
        mkdir -p "$DSH_DIR"
    fi
    
    success "DSH 主目录: $DSH_DIR"
}

# 确定预设目录
get_preset_dir() {
    PRESET_DIR="$DSH_DIR/.agent-presets/super-mode"
    success "预设安装目录: $PRESET_DIR"
}

# 检查是否已安装
check_existing() {
    if [ -d "$PRESET_DIR" ]; then
        warn "检测到已安装的超级模式预设"
        read -p "是否覆盖安装? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            info "安装已取消"
            exit 0
        fi
    fi
}

# 下载预设文件
download_preset() {
    info "正在下载预设文件..."
    
    # 创建临时目录
    TEMP_DIR=$(mktemp -d)
    trap 'rm -rf "$TEMP_DIR"' EXIT
    
    # 从 GitHub 下载
    REPO_URL="https://github.com/YOUR_USERNAME/dsh-super-mode-preset"
    
    if command -v curl &> /dev/null; then
        curl -fsSL "$REPO_URL/archive/refs/heads/main.tar.gz" -o "$TEMP_DIR/preset.tar.gz"
    elif command -v wget &> /dev/null; then
        wget -q "$REPO_URL/archive/refs/heads/main.tar.gz" -O "$TEMP_DIR/preset.tar.gz"
    else
        error "需要 curl 或 wget，但未找到"
    fi
    
    # 解压
    tar -xzf "$TEMP_DIR/preset.tar.gz" -C "$TEMP_DIR"
    
    # 找到解压后的目录
    EXTRACTED_DIR=$(find "$TEMP_DIR" -maxdepth 1 -type d -name "dsh-super-mode-preset-*" | head -n 1)
    
    if [ -z "$EXTRACTED_DIR" ]; then
        error "解压失败"
    fi
    
    success "下载完成"
    
    # 返回解压目录路径
    echo "$EXTRACTED_DIR"
}

# 安装预设
install_preset() {
    local source_dir="$1"
    
    # 创建预设目录
    mkdir -p "$PRESET_DIR"
    
    # 复制文件
    info "正在安装预设文件..."
    cp -r "$source_dir/super-mode/"* "$PRESET_DIR/"
    
    # 设置权限
    chmod 755 "$PRESET_DIR"
    chmod 644 "$PRESET_DIR"/*
    
    success "预设文件安装完成"
}

# 显示安装后信息
show_post_install() {
    echo
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN}  🎉 超级模式预设安装成功！${NC}"
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    echo -e "${BLUE}📍 安装位置:${NC}"
    echo "   $PRESET_DIR"
    echo
    echo -e "${BLUE}📋 下一步操作:${NC}"
    echo "   1. 重启 DSH Desktop"
    echo "   2. 创建新会话时，在预设选择器中选择「超级模式」"
    echo "   3. 享受更强大的 AI 编码体验！"
    echo
    echo -e "${YELLOW}💡 提示:${NC}"
    echo "   - 每轮请求约多消耗 2,000-5,000 tokens (~20-30%)"
    echo "   - 适合复杂架构设计、大规模重构、深度调试等场景"
    echo
    echo -e "${BLUE}📖 更多信息:${NC}"
    echo "   https://github.com/YOUR_USERNAME/dsh-super-mode-preset"
    echo
}

# 主函数
main() {
    echo
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}  🚀 超级模式预设安装程序${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    detect_os
    get_dsh_home
    get_preset_dir
    check_existing
    
    SOURCE_DIR=$(download_preset)
    install_preset "$SOURCE_DIR"
    show_post_install
}

# 运行主函数
main "$@"
