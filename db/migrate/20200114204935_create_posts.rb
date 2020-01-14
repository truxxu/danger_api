class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :author, default: 'Anonymous'
      t.text :message
      t.references :discussion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
