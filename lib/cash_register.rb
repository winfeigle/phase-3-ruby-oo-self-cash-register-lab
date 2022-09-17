require 'pry'

class CashRegister
    attr_accessor :discount, :total, :items, :last_transaction

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
    end
    
    def add_item(title, price, quantity = 1)
        self.last_transaction = price * quantity
        self.total += price * quantity
        quantity.times { self.items << title }
    end

    def apply_discount
        if self.discount != 0
            discount_percent = (100 - self.discount.to_f)/100
            self.total = (self.total * discount_percent).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= last_transaction
    end
end





