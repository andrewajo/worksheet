class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :position
      t.float :tax_one
      t.float :tax_two
      t.float :gratuity_rate
      t.float :mark_up_amount

      t.timestamps
    end
  end
end
