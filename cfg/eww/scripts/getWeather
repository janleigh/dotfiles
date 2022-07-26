#!/bin/sh

encode_to_url_format() {
    echo "$1" | sed 's/ /%20/g'
}

KEY=""
CITY=""
CITY=$(encode_to_url_format "$CITY")

weather=$(curl --connect-timeout 4 -sf "api.openweathermap.org/data/2.5/weather?q=$CITY&appid=$KEY&units=metric")
weather_desc=$(echo $weather | jq -r ".weather[0].main")
weather_temp=$(echo $weather | jq ".main.temp" | cut -d "." -f 1)
feels_like=$(echo $weather | jq ".main.feels_like" | cut -d "." -f 1)

check_if_empty() {
	[[ -z "$1" ]] && echo "0" || echo "$1"
}

case $1 in
	current_temp)
		check_if_empty $weather_temp
		;;
	current_temp_fahrenheit)
		weather_temp=$((($weather_temp * 9 / 5) + 32))
		check_if_empty $weather_temp
		;;
	feels_like)
		check_if_empty $feels_like
		;;
	weather_desc)
		[[ -z $weather_desc ]] && echo "Not Available." || echo "$weather_desc"
		;;
esac
