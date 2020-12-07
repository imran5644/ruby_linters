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
end
