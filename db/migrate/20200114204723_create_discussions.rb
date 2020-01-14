class CreateDiscussions < ActiveRecord::Migration[6.0]
  def change
    create_table :discussions do |t|
      t.string :author, default: 'Anonymous'
      t.string :title
      t.text :message
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
