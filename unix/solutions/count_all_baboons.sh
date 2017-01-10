# to store the results of a command into a variable
# that you can use, surround the command with backticks `
myIDS=`tail -n +2 ../data/Gesquiere2011_data.csv | cut -f 1 | sort -n | uniq`
for id in $myIDS
do
    mycounts=`bash count_baboons.sh ../data/Gesquiere2011_data.csv $id`
    echo "ID:" $id "counts:" $mycounts
done
