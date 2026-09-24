module SalesTaxes
  class TaxCalculator
    BASIC_TAX = 10
    IMPORT_TAX = 5
    EXEMPT_PRODUCTS = %w[book chocolate pills].freeze
    ROUNDING_INCREMENT_CENTS = 5

    def initialize(name:, price:, quantity:, imported: false)
      @name = name
      @price = price
      @quantity = quantity
      @imported = imported
    end

    def tax_cents
      rate = (tax_exempt? ? 0 : BASIC_TAX) + (imported ? IMPORT_TAX : 0)

      round_up_to_five_cents(price, rate) * quantity
    end

    private

    attr_reader :name, :price, :quantity, :imported

    def tax_exempt?
      EXEMPT_PRODUCTS.any? { |product| name.include?(product) }
    end

    private

    def round_up_to_five_cents(price_cents, rate_percent)
      numerator = price_cents * rate_percent
      denominator = 100 * ROUNDING_INCREMENT_CENTS

      increments =
        (numerator + denominator - 1) / denominator

      increments * ROUNDING_INCREMENT_CENTS
    end
  end
end
