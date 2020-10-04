class Order < ApplicationRecord
  belongs_to :customer
  has_many :orders_products
  has_many :products, through: :orders_products

  before_save  :genarate_so_code
  after_commit  :update_user_point, on: :create

  class << self
    def create_order(customer_params, products_params)
        customer = Customer.get_current_partner_or_create_new(customer_params)
        order = nil
        if products_params.present?
            order =  customer.orders.build
            order.total_price = products_params.reduce(0){|a, i| a + (i[:price] * i[:quantity])}
            order.quantity = products_params.length
            order.save
        end
        order
    end
  end

  private

  def is_new_day(last_code_date, current_time)
    current_time.to_i != last_code_date
  end
  

  def genarate_so_code
    current_time = Time.now.strftime("%y%m%d")
    last_order = Order.last
    last_order_code =  last_order.present? ? last_order.code : "SO#{current_time}_#{'%03d' % 1}"
    last_order_date = last_order_code[2..7].to_i
    old_count = last_order_code[9..11].to_i
    count = is_new_day(last_order_date, current_time) ? 1 : old_count + 1
    self.code = "SO#{current_time}_#{'%03d' % count}"
  end

  def update_user_point
    # if customer.point + total_price.to_f/10000 == 10 
    #   # customer.vourchers.create()
    # end
    self.customer.update_columns(point:  self.customer.point + self.total_price.to_f/10000)
  end
end