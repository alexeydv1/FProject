#!/bin/bash
#Вывести список всех расширений файлов и количество файлов с таким расширением в указанном каталоге и всех подкаталогах. 
#Формат вывода построчный (<расширение> - <количество>)
##!!!неправиьно обрабатываются полные пути если  встречается конструкция типа [3] например "/home/alex/alex.exe[3].exe

#Функция из полного пути выделяет имя файла

basename()
{
  local name="${1##*/}"
  echo "${name%$2}"
}
#Функция из полного пути выделяет путь к файлу
dirname()
{
  local dir="${1%${1##*/}}"
  [ "${dir:=./}" != "/" ] && dir="${dir%?}"
  echo "$dir"
}
#функция для определения расширения имени файла
function ext
{
  local name=${1##*/}
  local name0="${name%.*}"
  local ext=${name0:+${name#$name0}}
  echo "${ext:-.}"
}

#функция для определения имени файла без расширения
function namename
{
  local name=${1##*/}
  local name0="${name%.*}"
  echo "${name0:-$name}"
}
a="/home/alex/alex.exe[3].exe"
echo "$a"
base=`basename "$a"`
dir=`dirname "$a"`
ex=`ext "$a"`
nmnm=`namename "$base"`
echo "base=$base dir=$dir ext=$ex nmnm=$nmnm"
for fil in `find ~ -type f` 
do 
tmp="/tmp/1"
echo `ext "$fil"` >> $tmp
done
sort $tmp | uniq -c |sort -k1n,2 |awk '{print $2,"- " $1}'
rm $tmp