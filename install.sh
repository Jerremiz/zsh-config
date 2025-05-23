#!/usr/bin/env bash
set -euo pipefail

# 配置：可根据需要修改的变量
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
P10K_REPO="https://github.com/romkatv/powerlevel10k.git"
AUTOSUGGESTIONS_REPO="https://github.com/zsh-users/zsh-autosuggestions.git"
SYNTAX_HIGHLIGHTING_REPO="https://github.com/zsh-users/zsh-syntax-highlighting.git"
P10K_CONF_URL="https://raw.githubusercontent.com/Jerremiz/zsh-config/main/.p10k.zsh"
ZSHRC_URL="https://raw.githubusercontent.com/Jerremiz/zsh-config/main/.zshrc"

read -p "即将为用户 ${USER:-$(whoami)} 安装 ZSH 环境，将覆盖现有配置，确认继续？[Y/n] " ans
if [[ $ans != [Yy] ]]; then
  echo "已取消安装"
  exit 1
fi

echo ">>> 1. 更新 apt 源 & 安装 zsh、git、wget"
sudo apt update
sudo apt install -y zsh git wget

echo ">>> 2. 将默认 shell 切换为 zsh"
if ! grep -q "$(which zsh)" /etc/shells; then
  echo "$(which zsh)" | sudo tee -a /etc/shells
fi
sudo chsh -s "$(which zsh)" "$USER"

echo ">>> 3. 安装 Oh-My-ZSH"
export RUNZSH=no
export CHSH=no
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

echo ">>> 4. 安装 Powerlevel10k 主题"
git clone --depth=1 "$P10K_REPO" "$ZSH_CUSTOM/themes/powerlevel10k"

echo ">>> 5. 安装 zsh-autosuggestions 插件"
git clone "$AUTOSUGGESTIONS_REPO" "$ZSH_CUSTOM/plugins/zsh-autosuggestions"

echo ">>> 6. 安装 zsh-syntax-highlighting 插件"
git clone "$SYNTAX_HIGHLIGHTING_REPO" "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

echo ">>> 7. 下载 .p10k.zsh 和 .zshrc 配置"
wget -O "$HOME/.p10k.zsh" "$P10K_CONF_URL"
wget -O "$HOME/.zshrc" "$ZSHRC_URL"

echo ">>> 8. 应用配置文件"
# 如果当前 shell 是 bash，则用 exec zsh；如果已经在 zsh 下，source 即可
if [ -n "$BASH_VERSION" ]; then
  echo "Detected Bash: 切换到 zsh..."
  exec zsh -l
else
  echo "Detected Zsh: 重新加载配置..."
  source "$HOME/.zshrc"
fi

echo "=== ZSH + Powerlevel10k 安装完成！==="
