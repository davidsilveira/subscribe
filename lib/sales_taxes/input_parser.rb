require 'bigdecimal'

module SalesTaxes
  class InputParser
    LINE_PATTERN = /\A(?<quantity>\d+)\s+(?<name>.+)\s+at\s+(?<price>\d+\.\d{2})\z/

    def self.parse(input)
      new.parse(input)
    end

    def parse(input)
      input.lines.filter_map do |line|
        normalized_line = line.strip

        next if normalized_line.empty?

       parse_line normalized_line
      end
    end

    private

    def parse_line(line)
      match = LINE_PATTERN.match(line)

      input_line = InputLine.new(
        name: match[:name],
        price: price_in_cents(match[:price]),
        quantity: Integer(match[:quantity])
      )
    end

    def price_in_cents(price)
      (BigDecimal(price) * 100).to_i
    end
  end
end
