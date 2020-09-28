class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :price
end
