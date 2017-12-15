#!/bin/sh

for i in /home/chris/mail/new/*
do
	if [ -f "$i" ]
	then
		email=`awk -F'<|>' '/^From:/{print $2}' "$i"`
		message=`awk -F': ' '/^Subject:/{print $2}' "$i"`
		startdate=`awk '/^Date:/{print $3 $4 $5}' "$i"`
		enddate=`awk -F'i |@' '/^To:/{print $2}' "$i"`
		jobfile="/home/chris/mail/jobs/job`date +%s`.txt"
		echo "Email: $email" > "$jobfile"
		echo "Message: $message" >> "$jobfile"
		echo "Start Date: $startdate" >> "$jobfile"
		echo "End Date: $enddate" >> "$jobfile"
	fi
done
