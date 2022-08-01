#!/bin/sh

encode_to_url_format() {
    echo "$1" | sed 's/ /%20/g'
}

KEY=""
CITY=""
CITY=$(encode_to_url_format "$CITY")

weather=$(curl -sf "api.openweathermap.org/data/2.5/weather?q=$CITY&appid=$KEY&units=metric")
weather_desc=$(echo $weather | jq -r ".weather[0].main")
weather_temp=$(echo $weather | jq ".main.temp" | cut -d "." -f 1)
weather_icon_code=$(echo "$weather" | jq -r ".weather[].icon" | head -1)
feels_like=$(echo $weather | jq ".main.feels_like" | cut -d "." -f 1)
humidity=$(echo $weather | jq ".main.humidity" | cut -d "." -f 1)
weather_icon=""
weather_hex=""

check_if_empty() {
	[[ -z "$1" ]] && echo "0" || echo "$1"
}

# YandereDev moment.
if [[ "$weather_icon_code" == "50d" ]]; then
	weather_icon=" "
	weather_hex="#84afdb"
elif [[ "$weather_icon_code" == "50n" ]]; then
	weather_icon=" "
	weather_hex="#84afdb"
elif [[ "$weather_icon_code" == "01d" ]]; then
	weather_icon=" "
	weather_hex="#ffd86b"
elif [[ "$weather_icon_code" == "01n" ]]; then
	weather_icon=" "
	weather_hex="#fcdcf6"
elif [[ "$weather_icon_code" == "02d" ]]; then
	weather_icon=" "
	weather_hex="#adadff"
elif [[ "$weather_icon_code" == "02n" ]]; then
	weather_icon=" "
	weather_hex="#adadff"
elif [[ "$weather_icon_code" == "03d" ]]; then
	weather_icon=" "
	weather_hex="#adadff"
elif [[ "$weather_icon_code" == "03n" ]]; then
	weather_icon=" "
	weather_hex="#adadff"
elif [[ "$weather_icon_code" == "04d" ]]; then
	weather_icon=" "
	weather_hex="#adadff"
elif [[ "$weather_icon_code" == "04n" ]]; then
	weather_icon=" "
	weather_hex="#adadff"
elif [[ "$weather_icon_code" == "09d" ]]; then
	weather_icon=""
	weather_hex="#6b95ff"
elif [[ "$weather_icon_code" == "09n" ]]; then
	weather_icon=""
	weather_hex="#6b95ff"
elif [[ "$weather_icon_code" == "10d" ]]; then
	weather_icon=""
	weather_hex="#6b95ff"
elif [[ "$weather_icon_code" == "10n" ]]; then
	weather_icon=""
	weather_hex="#6b95ff"
elif [[ "$weather_icon_code" == "11d" ]]; then
	weather_icon=""
	weather_hex="#ffeb57"
elif [[ "$weather_icon_code" == "11n" ]]; then
	weather_icon=""
	weather_hex="#ffeb57"
elif [[ "$weather_icon_code" == "13d" ]]; then
	weather_icon=" "
	weather_hex="#e3e6fc"
elif [[ "$weather_icon_code" == "13n" ]]; then
	weather_icon=" "
	weather_hex="#e3e6fc"
elif [[ "$weather_icon_code" == "40d" ]]; then
	weather_icon=" "
	weather_hex="#84afdb"
elif [[ "$weather_icon_code" == "40n" ]]; then
	weather_icon=" "
	weather_hex="#84afdb"
else 
	weather_icon=" "
	weather_hex="#adadff"
fi

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
	humidity)
		check_if_empty $humidity
		;;
	weather_desc)
		[[ -z $weather_desc ]] && echo "Not Available." || echo "$weather_desc"
		;;
	icon)
		echo $weather_icon
		;;
	hex)
		echo $weather_hex
		;;
	full)
		echo $weather
		;;
esac
