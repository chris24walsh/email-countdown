#!/bin/sh

for i in /home/email/mail/new/*
do
	if [ -f "$i" ]
	then
		email=`awk -F'<|>' '/^From:/{print $2}' "$i"`
		message=`awk -F': ' '/^Subject:/{print $2}' "$i"`
		startdate=`awk '/^Date:/{print $3 $4 $5}' "$i"`
		enddate=`awk -F' |@' '/^To:/{print $2}' "$i"`
		jobfile="/home/email/mail/jobs/job`date +%s.%N`.txt"
		echo "Email: $email" > "$jobfile"
		echo "Message: $message" >> "$jobfile"
		echo "Start Date: $startdate" >> "$jobfile"
		echo "End Date: $enddate" >> "$jobfile"
		rm -f "$i"
		/sbin/sendmail "$email" << EOF
Subject: Reminder set: $message
You will be reminded each day at 8am, until $enddate.
Thanks for using email-countdown!
EOF
	fi
done
