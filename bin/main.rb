#!/usr/bin/env ruby
require_relative '../lib/checker.rb'

check = CheckerError.new(ARGV.first)
check.check_empty_line_error
check.checking_white_spaces
check.tag_error
check.end_error

if check.errors.empty? && check.checker.error_msg.empty?
  puts 'No offernses'.colorize(:green) + ' found'
else
  check.errors.uniq.each do |error|
    puts"#{check.checker.file_path.colorize(:blue)}  : #{err.colorize(:red)}"
  end
end

puts check.checker.error_msg if check.checker.file_content.empty?
