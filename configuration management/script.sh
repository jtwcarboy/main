rm /tmp/fails
for x in `cat /tmp/systems`
do
ssh $x " var1=`facter -p widget` && echo "widget_type $var1" > template.file  " ;
rc=$?; if [[ $rc != 0 ]]; then echo $x >> /tmp/fails; fi
rc=$?; if [[ $rc == 0 ]]; then echo $x >> /tmp/good; fi
done

echo "Here is the count of failures"
wc -l /tmp/fails
echo "here is the count of success"
wc -l /tmp/good
