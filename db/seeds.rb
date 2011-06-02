# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

Language.create([
  {:name => 'HTML', :slug => 'html'},
  {:name => 'CSS', :slug => 'css'},
  {:name => 'JavaScript', :slug => 'javscript'},
])

VoteOption.create([
  {:option => 'Ruim'},
  {:option => 'Merda'},
  {:option => 'Muita Merda'},
])