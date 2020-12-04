require 'colorize'
require 'strscan'
require_relative 'file_read.rb'

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
    @checker.file_content.each_with_index do | value, index|
      start_position = []
      last_position = []
      start_position << value.scan(arg[0])
      last_position << value.scan(arg[1])

      status_check = start_position.flatten.size <=> last_position.flatten.size

      log_error("line:#{index + 1} Lint/Syntax: Unexpected/Missing token '#{args[2]}' #{args[4]}") if status_check.eql?(1)
      log_error("line:#{index + 1} Lint/Syntax: Unexpected/Missing token '#{args[3]}' #{args[4]}") if status_check.eql?(-1)
    end
  end