class VoucherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :code, 
            :description, 
            :expired_date
end
