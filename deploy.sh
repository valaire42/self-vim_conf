#!/bin/bash

# 目标目录
VIM_RUNTIME_DIR="$HOME/.vim_runtime"

# 检查目标目录是否存在，不存在则创建
if [ ! -d "$VIM_RUNTIME_DIR" ]; then
    echo "$VIM_RUNTIME_DIR 不存在，正在创建..."
    mkdir -p "$VIM_RUNTIME_DIR"
fi

# 复制配置文件到 ~/.vim_runtime 进行覆盖
echo "正在复制配置文件到 $VIM_RUNTIME_DIR ..."
cp -r my_configs.vim my_plugins templates "$VIM_RUNTIME_DIR"

echo "配置文件已成功复制到 $VIM_RUNTIME_DIR."

# 删除仓库文件夹 self-vim_conf
echo "删除仓库文件夹 self-vim_conf ..."
cd ~
rm -rf self-vim_conf

echo "自定义 Vim 配置已部署完成，仓库文件夹已删除。"
