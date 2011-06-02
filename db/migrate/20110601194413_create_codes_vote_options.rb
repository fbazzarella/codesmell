class CreateCodesVoteOptions < ActiveRecord::Migration
  def self.up
    create_table :codes_vote_options, :id => false do |t|
      t.references :code_id
      t.references :vote_option_id
    end
  end

  def self.down
    drop_table :codes_vote_options
  end
end
