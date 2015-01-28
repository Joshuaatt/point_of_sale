class CreatePurchases < ActiveRecord::Migration
  def change
    create_table(:purchases) do |t|
      t.column(:product_id, :integer)
      t.column(:datetime, :datetime)

      t.timestamps
    end
  end
end
