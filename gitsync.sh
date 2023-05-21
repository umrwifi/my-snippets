# git工作流
let comment="comment after pull"
# cd $1
if [[ $2 ]]; then
  comment=$2
fi
git add .
git commit -m "$comment"
git pull
git push
