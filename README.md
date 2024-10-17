# STP_p4

_Created for the course "Stack of programming technologies" V. N. Karazin Kharkiv National University_

Ruby 3.3.5 "WeatherInfo".

---

The main executable file `program.rb`.

The program receives data from [api openweathermap.org 2.5](https://api.openweathermap.org/data/2.5) about the curent weather in the city, which is defined through [api openweathermap.org geo](api.openweathermap.org/geo/1.0), the data is stored in the csv file `weather_info.csv` in the format:

- `time` - Last update time (in UNIX timestamp format)
- `city_id` - City id
- `city` - City
- `country` - Country
- `weather` - Basic condition
- `description` - Description
- `temp_c` - Temperatures (Celsius)
- `temp_min_c` - Minimum temperature (Celsius)
- `temp_max_c` - Maximum temperature (Celsius)
- `pressure_hPa` - Pressure (hectopascals)
- `humidity_per` - Humidity %
- `visibility_m` - Visibility (m)
- `wind_speed_ms` - Wind speed (m/s)
- `wind_deg` - Wind direction (deg)

The program supports input by using command line arguments.

# Examples

```ruby
> ruby program.rb 'London, CA'
The result of the call will be written to the fileweather_info.csv

> ruby program.rb
"WeatherInfo" by Shkilnyi V. CS31
Enter the name of the city (for example, London, CA):
> London
The result of the call will be written to the fileweather_info.csv

> ruby program.rb
"WeatherInfo" by Shkilnyi V. CS31
Enter the name of the city (for example, London, CA):

No coordinates found for this location.
Error! Check the input!

> ruby program.rb 'Kharkiv'
The result of the call will be written to the fileweather_info.csv

# fileweather_info.csv
time, city_id, city, country, weather, description, temp_c, temp_min_c, temp_max_c, pressure_hPa, humidity_per, visibility_m, wind_speed_ms, wind_deg
1729152669, 6058560, London, CA, Clouds, "broken clouds", 0.36, 0.14, 3.18, 1027, 93, 10000, 1.33, 358
1729152660, 2643743, London, GB, Clouds, "broken clouds", 14.33, 12.87, 15.58, 1009, 90, 10000, 1.34, 272
1729152668, 706483, Kharkiv, UA, Clouds, "overcast clouds", 7.55, 7.55, 7.55, 1028, 69, 10000, 5.04, 7
```
