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
