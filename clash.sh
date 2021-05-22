name=my
if [[ $1  ]]
then 
  name=$1
fi

curl -v -X PUT -H "Content-Type:application/json" -d '{ "path" :"/Users/admin/.config/clash/'${name}'.yaml"}' http://127.0.0.1:9090/configs?force=true
