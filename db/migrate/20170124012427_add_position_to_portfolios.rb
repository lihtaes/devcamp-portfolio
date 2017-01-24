class AddPositionToPortfolios < ActiveRecord::Migration[5.0]
  def change
    add_column :portfolios, :position, :string
  end
end
