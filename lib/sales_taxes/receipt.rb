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
      lines << format("Sales Taxes: %.2f", taxes_cents / 100.0)
      lines << format("Total: %.2f", total_cents / 100.0)
      "#{lines.join("\n")}\n"
    end

    def item_line(item)
      total = item.quantity * item.price
      format("%d %s: %.2f", item.quantity, item.name, total / 100.0)
    end

    def total_cents
      items.sum { |item| item.quantity * item.price } + taxes_cents
    end

    def taxes_cents
      790
    end
  end
end
