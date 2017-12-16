#!/bin/sh

for i in /home/email/mail/jobs/*
do
	if [ -f "$i" ]
	then
		#parse first job

		email=`awk -F': ' '/^Email:/{print $2}' "$i"`
                message=`awk -F': ' '/^Message:/{print $2}' "$i"`
                startdate=`awk -F': ' '/^Start Date:/{print $2}' "$i"`
                enddate=`awk -F': ' '/^End Date:/{print $2}' "$i"`
		
		#send email with info
		
		sd=`date -d $startdate +%s`
		ed=`date -d $enddate +%s`
		diffSeconds=$(($ed-$sd))
		diffDays=$(($diffSeconds/86400))

		/sbin/sendmail "$email" << EOF
Subject: $message
You have $diffDays days left
EOF
		
		#if last day of countdown, delete job

		if [ "$startdate" == "$enddate" ]
		then
			rm -f "$i"
		fi
	fi
done
