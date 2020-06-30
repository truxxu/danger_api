class AddDescriptionToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :description, :string
  end
end
