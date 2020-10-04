class Api::V1::OrderController < Api::BaseController
    skip_before_action :verify_authenticity_token

    def search_partner
        phone_number = params[:phone_number]
        current_partner = Customer.current_partner(phone_number)
        success current_partner.nil? ? nil : CustomerSerializer.new(current_partner)
    end

    def create_order
        order = Order.create_order(customer_params, products_params)
        product = params[:products].map{|a| {:product_id => a[:id], :quantity => a[:quantity], :sub_total => a[:price] * a[:quantity] }}
        order.orders_products.create(product)
        assign_success true
    end

    private
    def customer_params
        params.require(:customer).permit(
            :phone,
            :name,
            :gender
        )
    end

    def products_params
        params.require(:products)
    end
end
