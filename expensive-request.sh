#!/bin/bash

#SCRIPT: Print the "request line" from the log file which took most time in execution

# GET REQUEST LINE FROM LOG - $1 is first command line argument
REQUESTS=`cat $1 | grep ':Completed'`

#GET TIME TAKEN BY THE EACH REQUEST
TIME_TAKEN=`echo "$REQUESTS" | awk '{ print $5 }' | grep -o '[0-9].*[^ms]'`

echo; echo -e "\033[31mMost Expensinve request in log:\033[0m"; echo;

#RESULT : FIND WITHOUT AWK
echo "$REQUESTS" |  grep `echo "$TIME_TAKEN" | sort -rn | head -n 1`"ms"; echo;

#RESULT : FIND WITH AWK
#COMPARE EACH TIME TAKEN, AND RETURN MAX TIME

# echo "$REQUESTS" | grep `echo "$TIME_TAKEN" | awk  '
# 	BEGIN { max=0 } 
# 	{    
# 		if($1 > max){
# 			max = $1
# 		}
# 	} 
# 	END { print max }'
# `"ms"
# echo;