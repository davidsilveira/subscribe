require 'spec_helper'
require_relative '../../lib/sales_taxes/input_line'

RSpec.describe SalesTaxes::InputLine do
  describe '#initialize' do
    it 'sets the attributes correctly' do
      input_line = SalesTaxes::InputLine.new(name: 'product name', price: 10.99, quantity: 2)
      expect(input_line.name).to eq('product name')
      expect(input_line.price).to eq(10.99)
      expect(input_line.quantity).to eq(2)
      expect(input_line.imported?).to eq(false)
    end

    it 'sets the imported attribute correctly' do
      input_line = SalesTaxes::InputLine.new(name: 'imported product name', price: 10.99, quantity: 2)
      expect(input_line.imported?).to eq(true)
    end
  end
end
