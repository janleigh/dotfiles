#!/usr/bin/env python

import json
import urllib
import urllib.parse
import urllib.request
import os


def main():
    city = "College Station"
    api_key = "da1f3c25743ea88ae4cfa4b006e3eee0"

    try:
        data = urllib.parse.urlencode({'q': city, 'appid': api_key, 'units': 'imperial'})
        weather = json.loads(urllib.request.urlopen(
            'http://api.openweathermap.org/data/2.5/weather?' + data)
            .read())
        desc = weather['weather'][0]['description'].capitalize()
        temp = int(float(weather['main']['temp']))
        #return '{}, {}°C'.format(desc, temp)
        return '{}°F'.format(temp)
    except:
        return ''


if __name__ == "__main__":
	print(main())
