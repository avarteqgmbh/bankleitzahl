module Bankleitzahl
  class Parser

    attr_reader :content_lines

    def initialize(content_lines)
      @content_lines = content_lines
    end

    def all_banks
      @banks ||= read_all_banks
    end

    private

    def read_all_banks
      banks = []

      content_lines.each_line do |line|
        banks << Bank.new(line[0..7], line[9..66].chomp, line[107..133], line[67..71], line[72..106].chomp, line[139..149].chomp)
      end

      banks
    end
  end
end
