require 'spec_helper'
require_relative '../../lib/sales_taxes/receipt'

RSpec.describe SalesTaxes::Receipt do
  describe '#call' do
    context 'when the input is valid' do
      let(:expected_output) do
        <<~OUTPUT
          1 imported bottle of perfume: 27.99
          1 bottle of perfume: 18.99
          1 packet of headache pills: 9.75
          3 imported boxes of chocolates: 33.75
          Sales Taxes: 7.90
          Total: 98.38
        OUTPUT
      end

      let(:input) do
       SalesTaxes::InputParser.parse File.open("spec/fixtures/input3.txt").read
      end

      it 'returns the correct output' do
        expect(described_class.call(input)).to eq(expected_output)
      end
    end
  end
end
