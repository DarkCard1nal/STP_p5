# frozen_string_literal: true

require 'net/http'
require 'json'
require_relative 'constants'

# class WeatherInfo that gets the current weather as the current_weather array
class WeatherInfo
	def initialize
		raise NotImplementedError
	end

	# return nil or array, gets the current weather in a location
	def self.current_weather(location)
		lat, lon = geocoder(location)
		if lat.nil?
			puts(lon)
			return nil
		end

		result = weather(lat, lon)

		return nil if result.nil?

		parse_weather(result)
	end

	# rubocop:disable all
	def self.parse_weather(data)
		symbol_values = {}
		symbol_values[:time] = data['dt'] || ''
		symbol_values[:city_id] = data['id'] || ''
		symbol_values[:city] = data['name'] || ''
		symbol_values[:country] = data['sys']['country'] || ''
		symbol_values[:weather] = data['weather'][0]['main'] || ''
		symbol_values[:description] = data['weather'][0]['description'] || ''
		symbol_values[:temp_c] = begin
			(data['main']['temp'] - 273.15).round(2)
		rescue StandardError
			''
		end
		symbol_values[:temp_min_c] = begin
			(data['main']['temp_min'] - 273.15).round(2)
		rescue StandardError
			''
		end
		symbol_values[:temp_max_c] = begin
			(data['main']['temp_max'] - 273.15).round(2)
		rescue StandardError
			''
		end
		symbol_values[:pressure_hPa] = data['main']['pressure'] || ''
		symbol_values[:humidity_per] = data['main']['humidity'] || ''
		symbol_values[:visibility_m] = data['visibility'] || ''
		symbol_values[:wind_speed_ms] = data['wind']['speed'] || ''
		symbol_values[:wind_deg] = data['wind']['deg'] || ''

		symbol_values
	end

	def self.weather(lat, lon)
		url = URI("https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&appid=#{Constants::API_KEY}")
		response = Net::HTTP.get(url)
		result = JSON.parse(response)
		if (response.nil? || response.empty? || result[0].nil?) && lat.nil?
			puts(Constants::NO_FOUND_WEATHER)
			return nil
		end

		result
	end
	# rubocop:enable all

	def self.geocoder(location)
		return [nil, Constants::NO_FOUND_LOCATION] if location.nil?

		url = URI("http://api.openweathermap.org/geo/1.0/direct?q=#{location.gsub(/\s+/,
                                                                            '')}&limit=1&appid=#{Constants::API_KEY}")
		response = Net::HTTP.get(url)
		result = JSON.parse(response)
		return [nil, Constants::NO_FOUND_LOCATION] if response.nil? || response.empty? || result[0].nil?

		[result[0]['lat'], result[0]['lon']]
	end

	private_class_method :geocoder
	private_class_method :weather
	private_class_method :parse_weather
end
