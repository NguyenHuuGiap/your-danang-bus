class CreateAccessTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :access_tokens do |t|
      t.string :token, unique: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
