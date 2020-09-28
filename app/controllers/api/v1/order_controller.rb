class Api::V1::OrderController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def search_partner
        phone_number = params[:phone_number]
        current_partner = Partner.current_partner(phone_number)
        render json: current_partner.nil? ? nil : current_partner 
    end
end
