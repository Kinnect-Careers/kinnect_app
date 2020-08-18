class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.string :title
      t.text :descriptor
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :skills, [:user_id, :created_at]
  end
end
