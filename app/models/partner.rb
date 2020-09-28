class Partner < ApplicationRecord
    self.table_name = "res_partner"

    class << self
        def current_partner(phone_number) 
            Partner.where(phone: phone_number).first
        end
    end
end