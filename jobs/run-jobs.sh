for i in *
do
	if [ -f "$i" ] && [ "$i" != "run-jobs.sh" ]
	then
		#awk the email for target email, subject, and body
		echo 'test works'
	fi
done
