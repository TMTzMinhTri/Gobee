class CustomerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, 
              :phone, 
              :gender, 
              :point, 
              :id,
              :vouchers
end
