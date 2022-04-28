class Comments < ActiveRecord::Migration[7.0]
  
  def change
    create_table :comments do |t|
      t.string :comments
      t.timestamps
      t.references :user, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true

    end
  end
end
