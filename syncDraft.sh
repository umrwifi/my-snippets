journal=/Users/admin/Documents/zettle/journals/$(date +"%Y_%m_%d").md
echo $journal
# b=Journal-$(date +"%Y-%m").txt
cd /Users/admin/Library/Mobile\ Documents/iCloud\~com\~agiletortoise\~Drafts5/Documents
# if [ -e $b ]; then
#   cat $b >> $journal
#   rm $b
# fi

for file in *.txt
do
    if [ -s $file ]
    then
        echo "- NOW $(cat $file)" >> $journal
        # rm $file
        mv $file /Users/admin/Library/Mobile\ Documents/iCloud\~com\~agiletortoise\~Drafts5/Documents/Backups/
    fi
done
