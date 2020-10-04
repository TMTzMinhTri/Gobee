class Api::V1::ProductController < Api::BaseController
    def index
        product =  Product.all
        success ProductSerializer.new(product)
    end
end
