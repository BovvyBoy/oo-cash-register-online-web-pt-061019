require 'pry'

class CashRegister
  attr_accessor :discount, :purchases, :total, :transaction

  def initialize(discount=nil)
    @total = 0
    @discount = discount if discount != nil
    @purchases = []
    @transaction = []
  end

  def add_item(name, price, quantity=1)
    @transaction << [name, price, quantity]
    quantity.times do
      @purchases.push @transaction.last[0]
      @total += @transaction.last[1]
    end
  end

  def apply_discount
    if discount
      @total = @total - @total * @discount / 100
      result = "After the discount, the total comes to $#{@total}."
    else
      result = "There is no discount to apply."
    end
    return result
  end

  def items
    return @purchases
  end

  def void_last_transaction
    last_transaction = @transaction.pop
    quantity = last_transaction[2]
    quantity.times do
      @purchases.pop
      @total -= last_transaction[1]
    end
  end

end

new = CashRegister.new
new.add_item("crisps", 0.50, 2)
new.add_item("candy", 0.25, 3)
puts new.total
puts new.items
new.void_last_transaction
puts new.total
puts new.items
new.void_last_transaction
puts new.total
puts new.items
