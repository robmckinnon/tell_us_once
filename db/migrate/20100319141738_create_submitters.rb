class CreateSubmitters < ActiveRecord::Migration
  def self.up
    create_table :submitters, :force => true do |t|
      t.string :first_name
      t.string :family_name
      t.text :address
      t.string :postcode
      t.string :email
      t.string :phone

      t.timestamps
    end
  end

  def self.down
    drop_table :submitters
  end
end
