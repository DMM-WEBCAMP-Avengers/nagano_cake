module Admin::OrdersHelper

  def amount(order_products)
    order_products.map{ |op| op.subtotal }.sum
  end
  
end
