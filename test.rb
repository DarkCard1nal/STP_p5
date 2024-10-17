# frozen_string_literal: true

require_relative 'weather_info'
require_relative 'file_manager'

puts('Start tests!')

# rubocop:disable Layout/SpaceInsideArrayLiteralBrackets, Layout/ArrayAlignment
ar1 = [	['London', 14],
		['	Kharkiv ', 14],
		['London, CA', 14],
		[nil, nil]]
# rubocop:enable Layout/SpaceInsideArrayLiteralBrackets, Layout/ArrayAlignment

completed = 0
ar1.each do |test|
	result = WeatherInfo.current_weather(test[0])
	completed += 1
	next if result == test[1]

	file_result = FileManager.export_csv(result, 'test_result.csv')
	next if result.size == test[1] && !file_result.nil?

	completed -= 1
	p test[0]
	puts('Result: false')
	p result
end

puts("\nPassed #{completed}/#{ar1.size} tests!!")
puts('Stop tests!')
