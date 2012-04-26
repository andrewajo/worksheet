class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :pax
      t.integer :units
      t.float :unit_cost
      t.float :tax_one
      t.float :tax_two
      t.float :gratuity_rate
      t.float :mark_up_amount
      t.integer :category_id
      t.integer :position

      t.timestamps
    end
  end
end
