class AddPasswordDigestToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :password_digest, :string
  end
end
