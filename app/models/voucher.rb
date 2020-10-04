class Voucher < ApplicationRecord

    # belongs_to :res_partner, foreign_key: 'partner_id', class_name: "Partner"
    has_many :customer
    
end
