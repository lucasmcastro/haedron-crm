class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :display_name
      t.string :legal_name
      t.integer :legal_number

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
