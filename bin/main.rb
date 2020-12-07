#!/usr/bin/env ruby
require_relative '../lib/checker'

check = CheckerError.new(ARGV.first)
check.check_empty_line_errors
check.check_white_spaces
check.check_tag_error
check.end_error

if check.errors.empty? && check.checker.error_msg.empty?
  puts "#{'No offernses'.colorize(:green)} found"
else
  check.errors.uniq.each do |_error|
    puts "#{check.checker.file_path.colorize(:blue)}  : #{error.colorize(:red)}"
  end
end

puts check.checker.error_msg if check.checker.file_content.empty?
