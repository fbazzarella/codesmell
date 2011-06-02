class CreateCodes < ActiveRecord::Migration
  def self.up
    create_table :codes do |t|
      t.text :smell
      t.references :language
      t.integer :denounce, :default => 0
      t.text :comment
      
      t.timestamps
    end
  end

  def self.down
    drop_table :codes
  end
end
