class CreateTable < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :sku
      t.timestamps
    end

    create_table :orders do |t|
      t.integer :customer_id
      t.string :code
      t.integer :total_price
      t.integer :quantity
      t.string :note
      t.timestamps
    end

    create_table :customers do |t|
      t.string :name
      t.string :phone 
      t.boolean :gender
      t.float :point, default: 0.0
      t.date :date_of_birth
      t.timestamps
    end

    create_table :orders_products do |t|
      t.belongs_to :order
      t.belongs_to :product
      t.integer :quantity
      t.integer :price
      t.integer :sub_total
    end

    create_table :vouchers do |t|
      t.integer :customer_id
      t.string :code
      t.string :description 
      t.date :expired_date
      t.integer :order_id
    end
  end
end
