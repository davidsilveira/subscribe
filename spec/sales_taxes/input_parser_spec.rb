require 'spec_helper'
require_relative '../../lib/sales_taxes/input_parser'

RSpec.describe SalesTaxes::InputParser do
  describe '#parse' do
    context 'when the input is valid' do
      let(:input) do
        File.open("spec/fixtures/input1.txt").read
      end

      it 'returns an array of products' do
        expect(described_class.parse(input)).to be_a(Array)
      end

      context 'when there is imported product' do
        let(:input) do
          File.open("spec/fixtures/input3.txt").read
        end

        it 'returns the correct products data' do
          parsed = described_class.parse(input).first

          expect(parsed.name).to eq('imported bottle of perfume')
          expect(parsed.quantity).to eq(1)
          expect(parsed.price).to eq(2799)
          expect(parsed.imported?).to eq(true)
        end
      end
    end
  end
end
