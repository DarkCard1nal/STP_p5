# frozen_string_literal: true

require 'csv'
require 'fileutils'
require_relative 'constants'

# class WeatherInfo
class FileManager
	def initialize
		raise NotImplementedError
	end

	# rubocop:disable Metrics/MethodLength
	def self.export_csv(data, file_path = Constants::FILE_PATH)
		if File.exist?(file_path)
			return nil unless File.writable?(file_path)

			CSV.open(file_path, 'a+', col_sep: ', ') do |csv|
				csv << data.values
			end
		else
			CSV.open(file_path, 'wb', col_sep: ', ') do |csv|
				csv << data.keys
				csv << data.values
			end
		end

		file_path
	end
	# rubocop:enable Metrics/MethodLength
end
