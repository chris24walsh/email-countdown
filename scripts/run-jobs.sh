#!/bin/sh


for i in *
do
	if [ -f "$i" ] && [ "$i" != "run-jobs.sh" ]
	then
		#parse first job
		#send email with info
		#if last day of countdown, delete job
	fi
done
