# mac生成.url文件
name=~/Desktop/$*.url
touch $name
echo "[InternetShortcut]
URL=" >$name
# URL=$(pbpaste)" >$name
echo "file $name created"
vim $name
# cat $name
