require 'colorize'

class Fileread
  attr_reader :error_messages, :file_content, :fileline_count, :filepath

  def initialize(filepath)
    @error_messages = ''
    @filepath = filepath
    begin
      @file_content = File.readlines(@filepath)
      @fileline_count = file_content.size
    rescue StandardError => e
      @file_content = []
      @error_messages = "No such file or path found\n".colorize(:light_red) + e.to_s.colorize(:red)
    end
  end
end
