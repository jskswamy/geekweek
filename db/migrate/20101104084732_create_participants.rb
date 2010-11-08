class CreateParticipants < ActiveRecord::Migration
  def self.up
    create_table :participants do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :organization
      t.string :designation

      t.timestamps
    end
  end

  def self.down
    drop_table :participants
  end
end
