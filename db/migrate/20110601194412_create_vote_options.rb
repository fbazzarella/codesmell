class CreateVoteOptions < ActiveRecord::Migration
  def self.up
    create_table :vote_options do |t|
      t.string :option

      t.timestamps
    end
  end

  def self.down
    drop_table :vote_options
  end
end
