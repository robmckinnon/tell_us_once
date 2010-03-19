class CreateDeathNotifications < ActiveRecord::Migration
  def self.up
    create_table :death_notifications, :force => true do |t|
      t.integer :submitter_id
      t.string :relationship_to_deceased
      t.string :deceased_first_name
      t.string :deceased_family_name
      t.string :deceased_maiden_surname
      t.date :date_of_death
      t.date :date_of_birth
      t.string :place_of_birth
      t.string :national_insurance_number
      t.string :tax_reference_number
      t.string :nhs_number
      t.text :last_address
      t.string :last_postcode
      t.boolean :receiving_state_pension
      t.string :receiving_other_state_benefit

      t.timestamps
    end

    add_index :death_notifications, :submitter_id
  end

  def self.down
    drop_table :death_notifications
  end
end
