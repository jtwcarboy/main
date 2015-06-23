echo "Number of times sshd_config was requested"
grep GET puppet_access_ssl.log|grep "/production/file_metadata/modules/ssh/sshd_config" |wc -l
grep GET puppet_access_ssl.log|grep "/production/file_metadata/modules/ssh/sshd_config" |awk -F" " '{print $9}' >/tmp/exitcodes
echo "Number of non 200s for sshd_config file"
grep -v "200" /tmp/exitcodes |wc -l
echo "number of non 200 for all"
awk -F" " '{print $9}' puppet_access_ssl.log > /tmp/allexit
grep -v "200" /tmp/allexit |wc -l
echo "Number of times any ip set put request for /dev/report "
grep PUT puppet_access_ssl.log|grep "/dev/report" |wc -l
echo "Count of hits by IP "
grep PUT puppet_access_ssl.log|grep "/dev/report" > puts



FILE=puts ;
for ip in `cat $FILE |cut -d ' ' -f 1 |sort |uniq`;
do { COUNT=`grep ^$ip $FILE |wc -l`;
 if [[ "$COUNT" -gt "0" ]]; then echo "$COUNT:   $ip";
fi }; done
