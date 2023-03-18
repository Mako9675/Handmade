class ChangeHowToMakesToPostMakes < ActiveRecord::Migration[6.1]
  def change
    rename_table :how_to_makes, :post_makes
  end
end
