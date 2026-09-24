module SalesTaxes
  class Receipt
    def self.call(items)
      new(items).call
    end

    def initialize(items)
      @items = items
    end

    def call
      to_s
    end

    private
    attr_reader :items

    def to_s
      lines = items.map { |item| item_line(item) }
      lines << format("Sales Taxes: %.2f", total_taxes_cents / 100.0)
      lines << format("Total: %.2f", total_cents / 100.0)
      "#{lines.join("\n")}\n"
    end

    def item_line(item)
      total = item.quantity * item.price + taxes_cents(item)
      format("%d %s: %.2f", item.quantity, item.name, total / 100.0)
    end

    def total_cents
      items.sum { |item| item.quantity * item.price } + total_taxes_cents
    end

    def total_taxes_cents
      items.sum do |item|
        taxes_cents(item)
      end
    end

    def taxes_cents(item)
      SalesTaxes::TaxCalculator.new(
        name: item.name,
        price: item.price,
        quantity: item.quantity,
        imported: item.imported?
      ).tax_cents
    end
  end
end
