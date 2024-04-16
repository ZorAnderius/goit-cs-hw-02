sites=("https://www.google.com" "https://www.facebook.com" "https://www.twitter.com")

logfile="website_status.log"

> "$logfile"

for site in "${sites[@]}"
do  
    if curl -s -o /dev/null -L --head --request GET -w "%{http_code}\n" "$site" | grep "200" > /dev/null
    then
        echo "$site is UP" >> "$logfile"
    else
        echo "$site is DOWN" >> "$logfile"
    fi
done

echo "Results written to $logfile"