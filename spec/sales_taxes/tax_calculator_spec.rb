require 'spec_helper'
require_relative '../../lib/sales_taxes/tax_calculator'

RSpec.describe SalesTaxes::TaxCalculator do
  describe '#tax_cents' do
    let(:tax_calculator) { described_class.new(name: 'product name', price: 1099, quantity: 2, imported: false) }

    it 'returns the tax in cents' do
      expect(tax_calculator.tax_cents).to eq(220)
    end

    context 'when the product is imported' do
      let(:tax_calculator) { described_class.new(name: 'imported bottle of perfume', price: 2799, quantity: 1, imported: true) }

      it 'returns the tax in cents' do
        expect(tax_calculator.tax_cents).to eq(420)
      end
    end

    context 'when the product is not imported and tax exempt' do
      let(:tax_calculator) { described_class.new(name: 'book', price: 1000, quantity: 1, imported: false) }

      it 'returns 0' do
        expect(tax_calculator.tax_cents).to eq(0)
      end
    end

    context 'when the product is imported and tax exempt' do
      let(:tax_calculator) { described_class.new(name: 'imported book', price: 1000, quantity: 1, imported: true) }

      it 'returns 555550' do
        expect(tax_calculator.tax_cents).to eq(50)
      end
    end

    describe '#round_up_to_five_cents' do
      context 'when the product is not imported' do
        let(:tax_calculator) { described_class.new(name: 'bottle of perfume', price: 1899, quantity: 1, imported: false) }

        it 'returns 190' do
          expect(tax_calculator.tax_cents).to eq(190)
        end
      end

      context 'when the product is tax exempt, but imported' do
        let(:tax_calculator) { described_class.new(name: 'imported boxes of chocolates', price: 1125, quantity: 3, imported: true) }

        it 'returns 180' do
          expect(tax_calculator.tax_cents).to eq(180)
        end
      end
    end
  end
end
