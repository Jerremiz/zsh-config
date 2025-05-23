<!--suppress HtmlDeprecatedAttribute -->
<div align="center">
<h1>🚀 ZSH Configuration</h1>
</div>

个人 ZSH 配置，用于优化和增强命令行体验。包含 Oh-My-ZSH 框架、Powerlevel10k 主题及常用插件。

## 🖼️ 预览
![Powerlevel10k 预览](/assets//preview.gif)

## 📥 安装步骤

### 🚀 一键安装（推荐）

使用提供的一键安装脚本，可以自动完成所有配置步骤：

```shell
bash -c "$(wget https://raw.githubusercontent.com/Jerremiz/zsh-config/main/install.sh -O -)"
```

### 手动安装

如果您希望手动安装和配置，可以按照以下步骤操作：

#### 1. 安装 ZSH、Git 和 Wget

```shell
sudo apt update
sudo apt install zsh git wget -y
sudo chsh -s /bin/zsh
```

#### 2. 安装 Oh-My-ZSH

Oh-My-ZSH 是一个功能强大的 ZSH 配置管理框架：

```shell
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

#### 3. 安装 Powerlevel10k 主题

Powerlevel10k 是一个美观的 ZSH 主题：

```shell
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

#### 4. 安装推荐插件

```shell
# 自动补全插件
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# 语法高亮插件
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

#### 5. 应用配置文件

将本仓库中的配置文件复制到用户主目录：

```shell
# 复制 .zshrc 到主目录
wget -O ~/.zshrc https://raw.githubusercontent.com/Jerremiz/zsh-config/main/.zshrc

# 复制 Powerlevel10k 配置文件到主目录
wget -O ~/.p10k.zsh https://raw.githubusercontent.com/Jerremiz/zsh-config/main/.p10k.zsh

# 使配置生效
source ~/.zshrc
```

## 🎨 字体安装

本仓库提供了支持 Powerlevel10k 主题的 Nerd Fonts 字体：

- **Hack Nerd Font Mono**：专为代码编辑优化的等宽字体
- **MesloLGS NF**：Powerlevel10k 主题官方推荐字体

> 将 `fonts` 文件夹中的字体文件复制到系统字体目录，或在终端模拟器设置中选择对应字体。

## ⚙️ 自定义配置

执行以下命令可重新配置 Powerlevel10k 主题：

```shell
p10k configure
```

## 💡 使用技巧

- 使用 `TAB` 键可以自动补全命令和路径
- 方向键 `↑` 可以显示历史命令
- 键入部分命令后，会出现灰色的自动补全提示，按 `→` 接受建议