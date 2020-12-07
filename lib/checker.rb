require 'colorize'
require 'strscan'
require_relative 'file_read'

class CheckerError
  attr_reader :errors, :checker

  def initialize(filepath)
    @checker = Fileread.new(filepath)
    @errors = []
    @keywords = %w[begin case class def do if module unless]
  end

  def tag_error_checker
    check_tag_error(/\{/, /\}/, '{', '}', 'Curly Bracket')
    check_tag_error(/\(/, /\)/, '(', ')', 'Parenthesis')
    check_tag_error(/\[/, /\]/, '[', ']', 'Square Bracket')
  end

  def check_tag_error(*arg)
    @checker.file_content.each_with_index do |value, index|
      start_position = []
      last_position = []
      start_position << value.scan(arg[0])
      last_position << value.scan(arg[1])

      status_check = start_position.flatten.size <=> last_position.flatten.size

      log_error("line:#{index + 1} Lint/Syntax: Unexpected/Missing token '#{arg[2]}' #{arg[4]}") if status_check.eql?(1)
      if status_check.eql?(-1)
        log_error("line:#{index + 1} Lint/Syntax: Unexpected/Missing token '#{arg[3]}' #{arg[4]}")
      end
    end
  end

  def check_empty_line_errors
    @checker.file_content.each_with_index do |value, index|
      check_class_empty_line(value, index)
      check_def_empty_line(value, index)
      check_end_empty_line(value, index)
      check_do_empty_line(value, index)
    end
  end

  def check_class_empty_line(value, index)
    message = 'Extra Empty line detected at the beginning of the class body'
    return unless value.strip.split(' ').first.eql?('class')

    log_error("line:#{index + 2} #{message}") if @checker.file_content[index + 1].strip.empty?
  end

  def check_def_empty_line(value, index)
    message1 = 'Extra Empty line detetcted at the beginning of method body'
    message2 = 'Use empty lines between method definition'

    return unless value.strip.split(' ').first.eql?('def')

    log_error("line:#{index + 2} #{message1}") if @checker.file_content[index + 1].strip.empty?
    log_error("line:#{index + 1} #{message2}") if @checker.file_content[index - 1].strip.split(' ').first.eql?('end')
  end

  def check_end_empty_line(value, index)
    return unless value.strip.split(' ').first.eql?('end')

    if @checker.file_content[index - 1].strip.empty?
      log_error("line:#{index} Extra Empty line detected at block body end")
    end
  end

  def check_do_empty_line(value, index)
    message = 'Extra empty line detetced at block body beginning'
    return unless value.strip.split(' ').include?('do')

    log_error("line:#{index + 2} #{message}") if @checker.file_content[index + 1].strip.empty?
  end

  def log_error(error_msg)
    @errors << error_msg
  end

  def check_white_spaces
    @checker.file_content.each_with_index do |value, index|
      if value[-2] == ' ' && !value.strip.empty?
        @errors << "line:#{index + 1}:#{value.size - 1}: Error: whitespace detected"
        + " '#{value.gsub(/\s*$/, '_')}'"
      end
    end
  end

  def end_error
    start_position = 0
    last_position = 0
    @checker.file_content.each_with_index do |value, _index|
      start_position += 1 if @keywords.include?(value.split(' ').first) || value.split(' ').include?('do')
      last_position += 1 if value.strip == 'end'
    end

    status_check = start_position <=> last_position
    log_error("Lint/Syntax: Missing 'end'") if status_check.eql?(1)
    log_error("Lint/Syntax: Unexpected 'end'") if status_check.eql?(-1)
  end
end
