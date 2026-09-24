module SalesTaxes
  class InputLine
    attr_reader :name, :price, :quantity

    def initialize(name:, price:, quantity:)
      @name = name
      @price = price
      @quantity = quantity
    end

    def imported?
      @name.include?('imported')
    end
  end
end
