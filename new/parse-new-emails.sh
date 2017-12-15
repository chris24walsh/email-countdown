for i in *
do
	if [ -f "$i" ] && [ "$i" != "parse-new-emails.sh" ]
	then
		#awk the email for target email address, subject(reminder), date received, and date of reminder
		email=`awk -F'<|>' '/From/{print $2}' "$i"`
		message=`awk -F': ' '/Subject/{print $2}' "$i"`
		startdate=`awk '/Date/{print $3 $4 $5}' "$i"`
		enddate=`awk -F'@' '/^To/{print $1}' "$i"`
		echo "Email: $email"
		echo "Message: $message"
		echo "Start Date: $startdate"
		echo "End Date: $enddate"
	fi
done
