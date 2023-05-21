# 指定文件夹路径
folder_path="/Volumes/smbnas/Library/Bangumi"

# 创建保存alias的文件夹在桌面
alias_folder="$HOME/Desktop/Aliases"
mkdir -p "$alias_folder"

# 创建alias并保存到桌面
find "$folder_path" -mindepth 1 -maxdepth 1 -exec sh -c 'echo "file://$(realpath "{}")" > "$0/$(basename "{}").webloc"' "$alias_folder" \;

