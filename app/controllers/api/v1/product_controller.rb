class Api::V1::ProductController < ApplicationController
    def index
        product =  Product.all
        render json: ProductSerializer.new(product).serializable_hash[:data]
    end
end
