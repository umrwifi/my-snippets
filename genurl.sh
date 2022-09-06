# 生成url文件
name=~/Desktop/$*.url
touch $name
echo "[InternetShortcut]
URL=">$name
nvim $name -c "normal G$" 
