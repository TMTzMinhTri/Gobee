class OrderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :total_price,
              :quantity,
              :note,
              :customer
end
