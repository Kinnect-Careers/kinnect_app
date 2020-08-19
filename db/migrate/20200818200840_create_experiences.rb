class CreateExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|
      t.string :company
      t.datetime :started_at
      t.datetime :ended_at
      t.boolean :current
      t.text :roles
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :experiences, [:user_id, :created_at]
  end
end
