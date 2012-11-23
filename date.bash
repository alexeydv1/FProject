
#!/bin/bash

function data
{
if [ "`date -d "$1" +%s`" -gt "`date -d "$2" +%s`" ]; then
    #echo "$1 greater $2"
    return 1
    elif
    [ "`date -d "$1" +%s`" -lt "`date -d "$2" +%s`" ]; then
    
   #echo "$1 less $2"
    return 2
    else
   #echo "$1 equal $2"
    
    return 3
    
fi
}
IFS=$'\n'
DATE1="2012-12-12 12:12:12"
DATE2="2012-12-12 12:12:11"
data $DATE2 $DATE1
res=$?
echo "DATE1=$DATE1 $DATE2 $res"
start="$1 $2"
end="$3 $4"
data  $start $end
res=$?
if [ $res -eq  "1" ] 
then
echo "Error"
exit 1
else
 echo "OK res=$res"
fi
Save=$IFS

list=`awk '{print $2,$3}' alt.log`
b=0

for i in $list 
do
b=`expr $b + 1`
data $i $start
res3=$?
case $res3 in

1) #echo "fir13=$res3" 
data $i $end
res2=$? 
     case $res2 in
     1)echo "sec=$b" 
     break 3;;
     2|3) #
     
     nse=$b date2=$i;;
     #echo "ns=$ns b=$date1";;
     #*)break ;;
     esac
     ;;
2) continue;;
#echo "fir2=$res3"
3)
tmp="${nss:=$b} ${date1=$i}";;

#echo "3)$nss $date1";;
esac

#unset nse
#unset date2
done

IFS=$Save
tmp="${nse:=$b} ${date2=$i}"
if [ "$start" = "$end" ]; then
nse=`expr $nse - 1`
fi
echo "START:#$nss $date1"

echo "END:#$nse $date2"
col=`expr $nse - $nss`
e1="$nss,+$col""p"
echo $e1
sed -n -e '$e1' alt.log

