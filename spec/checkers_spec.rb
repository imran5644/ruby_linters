require_relative '../lib/checker'

describe CheckerError do
  let(:checker) { CheckerError.new('test.rb') }

  describe '#tag_error_checker' do
    it "it will returns missing/unexpected tags example  '{ }','( )', '[ ]', " do
      checker.tag_error_checker
      expect(checker.errors[0]).to eql("line:4 Lint/Syntax: Unexpected/Missing token '}' Curly Bracket")
    end
  end

  describe '#check_white_spaces' do
    it 'it return white space error on line 2' do
      checker.check_white_spaces
      expect(checker.errors[0]).to eql('line:2:31: Error: whitespace detected')
    end
  end

  describe '#check_empty_line_errors' do
    it 'it return empty line error on line 11' do
      checker.check_empty_line_errors
      expect(checker.errors[0]).to eql('line: 11 Extra Empty line detected at block body end')
    end
  end

  describe '#end_error' do
    it 'will return end error ' do
      checker.end_error
      expect(checker.errors[0]).to eql("Lint/Syntax: Missing 'end'")
    end
  end
end
