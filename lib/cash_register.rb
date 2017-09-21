class CashRegister
  attr_accessor :total, :discount, :items, :prev_total

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    self.prev_total = total
    self.total += price*quantity
    quantity.times do
      items << title
    end
  end

  def apply_discount
    if discount != 0
      self.total -= self.total*discount/100
      "After the discount, the total comes to $#{total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    items.pop
    prev = prev_total
    self.prev_total = self.total
    self.total = prev
  end

end
