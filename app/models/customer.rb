class Customer < ApplicationRecord
    has_many :vouchers
    has_many :orders

    validates :phone, presence: true, uniqueness: true


    def update_point(total_price)
        self.update_columns(point:  self.point + total_price.to_f/10000)
    end
    

    class << self
        def current_partner(phone_number) 
            Customer.find_by(phone: phone_number)
        end
        
        def get_current_partner_or_create_new(customer_params)
            customer = Customer.find_by(phone: customer_params[:phone])
            customer = Customer.create(customer_params) if customer.nil?
            return customer
        end
    end
end