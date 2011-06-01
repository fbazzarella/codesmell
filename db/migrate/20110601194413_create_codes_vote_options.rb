class CreateCodesVoteOptions < ActiveRecord::Migration
  def self.up
    create_table :codes_vote_options, :id => false do |t|
      t.integer :code_id
      t.integer :vote_option_id
    end
  end

  def self.down
    drop_table :vote_options
  end
end
