# frozen_string_literal: true

require_relative 'weather_info'
require_relative 'file_manager'
require_relative 'constants'

if ARGV.empty?
	puts(Constants::AUTHOR)
	puts(Constants::ENTER_INPUT)
	input = gets.chomp
else
	input = ARGV[0]
end

weather = WeatherInfo.current_weather(input)
if weather.nil?
	puts(Constants::INVALID_INPUT)
	return
end

puts(Constants::RESULT + FileManager.export_csv(weather))
