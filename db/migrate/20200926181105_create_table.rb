class CreateTable < ActiveRecord::Migration[6.0]
  def change
    create_table :product_template do |t|
      t.string :name
      t.integer :price
      t.string :sku
      t.timestamps
    end

    create_table :pos_order do |t|
      t.integer :res_partner_id
      t.string :code
      t.integer :total_price
      t.integer :quantity
      t.string :note
      t.timestamps
    end

    create_table :res_partner do |t|
      t.string :name
      t.string :phone 
      t.boolean :gender
      t.float :point
      t.date :date_of_birth
      t.timestamps
    end

    create_join_table(:product_template, :pos_order, table_name: :pos_order_line) do |t|
      t.index :pos_order_id
      t.index :product_template_id
      t.integer :quantity
      t.integer :price
      t.integer :sub_total
    end

    create_table :voucher do |t|
      t.integer :res_partner_id
      t.string :code
      t.string :description 
      t.date :expired_date
      t.integer :pos_order_id
    end
  end
end
