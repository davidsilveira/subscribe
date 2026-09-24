require 'spec_helper'
require_relative '../../lib/sales_taxes/receipt'

RSpec.describe SalesTaxes::Receipt do
  describe '#call' do
    context 'when the input 1 is valid' do
      let(:expected_output) do
        <<~OUTPUT
          2 book: 24.98
          1 music CD: 16.49
          1 chocolate bar: 0.85
          Sales Taxes: 1.50
          Total: 42.32
        OUTPUT
      end

      it 'returns the correct output' do
        input = SalesTaxes::InputParser.parse File.open("spec/fixtures/input1.txt").read

        expect(described_class.call(input)).to eq(expected_output)
      end
    end

    context 'when the input 3 is valid' do
      let(:expected_output) do
        <<~OUTPUT
          1 imported bottle of perfume: 32.19
          1 bottle of perfume: 20.89
          1 packet of headache pills: 9.75
          3 imported boxes of chocolates: 35.55
          Sales Taxes: 7.90
          Total: 98.38
        OUTPUT
      end

      it 'returns the correct output' do
        input = SalesTaxes::InputParser.parse File.open("spec/fixtures/input3.txt").read

        expect(described_class.call(input)).to eq(expected_output)
      end
    end
  end
end
