class CreateOpportunities < ActiveRecord::Migration[6.0]
  def change
    create_table :opportunities do |t|
      t.string :title
      t.text :requirements
      t.text :description
      t.text :tasks
      t.integer :company_id

      t.timestamps
    end
  end
end
