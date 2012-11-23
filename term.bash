#!/bin/bash
#Скрипт находит каждые 5 сек все процессы, которые используют памяти больше заданной(задаётся первым параметром скрипта в килобайтах) и завершает их
if [ -z $(echo $1 | grep -P "^\d{1,}$") ]
then
echo "You enter incorrect number"
exit 1
fi
until [ ]
do
a=`ps -e -o pid,rss h k-rss`
l=1
for i in $a;
do
if [ "$l" -eq "1" ] 
then
 l=2
 pid=$i
elif
  [ "$l" -eq "2" ] 
then
 l=1
 ram=$i
 if [ "$ram" -gt "$1" ] 
 then 
echo "$pid $ram" 
str="$str$pid "
fi
fi
done
if [ -z $str ] 
then
echo "Nothing kill"
else
echo "Kill proccesses with PIDs: [$str]"
kill $str
fi
sleep 5
unset str
done

