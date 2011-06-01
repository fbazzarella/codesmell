class CreateCodes < ActiveRecord::Migration
  def self.up
    create_table :codes do |t|
      t.text :code
      t.references :language
      t.references :votes

      t.timestamps
    end
  end

  def self.down
    drop_table :codes
  end
end
