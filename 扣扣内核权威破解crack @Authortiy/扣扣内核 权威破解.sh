#!/bin/bash

folder="/data/TotoroZY"

if [ -d "$folder" ]; then
  echo "\033[31m文件夹已存在，检测到已经使用过，不再创建文件夹\033[0m"
else
  echo "\033[31m检测到初次使用，自动创建文件夹\033[0m"
  mkdir -p "$folder"
fi

echo -e "\033[36m开始检测当前路径......\033[0m"
current_path=$(pwd)
echo -e "\033[31m当前路径为:$current_path......\033[0m"

echo -e '\033[36m删除残留二进制文件中...二进制文件目录:/data/TotoroZY/\033[0m'

cd /data/TotoroZY
find . -maxdepth 1 -type f -name '????????' -exec rm -f {} \;
echo -e '\033[31m删除完毕\033[0m'

DIR="$current_path/Tor"
DATA_DIR="/data/TotoroZY"
BINARY_PATH="/path/to/binary"

cd "$DIR"
for filename in *; do
    if [[ -f $filename ]]; then
        echo -e '\033[36m开始为二进制生成随机名......\033[0m'
        newname=$(cat /dev/urandom | tr -dc 'a-zA-Z' | head -c 8)
        echo -e "\033[31m随机名结果为:$newname\033[0m"
        echo -e '\033[36m开始替换二进制为随机名......\033[0m'
        mv "$filename" "$newname"
        echo -e "\033[31m替换结果为:$filename -> $newname\033[0m"
        echo -e '\033[36m开始复制二进制文件......\033[0m'
        cp "$newname" "$DATA_DIR"
        echo -e "\033[31m复制结果为:$DIR/$newname -> $DATA_DIR\033[0m"
        echo -e '\033[36m开始授予777权限......\033[0m'
        chmod 777 "$DATA_DIR"/"$newname"
        echo -e "\033[31m授予完成\033[0m"
        #echo -e "$newname"
        echo -e '\033[32m开始运行二进制......\033[0m'
        echo -e "\033[32m成功运行二进制！！！！！！\033[0m"
        /data/TotoroZY/"$newname"
    fi
done