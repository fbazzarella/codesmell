# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

Language.create([
  {:name => 'HTML', :slug => 'html'},
  {:name => 'RUBY', :slug => 'ruby'},
  {:name => 'PHYTON', :slug => 'phyton'},
  {:name => 'PHP', :slug => 'php'},
  {:name => 'ASP.NET', :slug => 'asp.net'},
  {:name => 'C#', :slug => 'c-sharp'},
  {:name => 'CSS', :slug => 'css'},
  {:name => 'JAVA', :slug => 'java'},
  {:name => 'JAVASCRIPT', :slug => 'javascript'},
])

VoteOption.create([
  {:label => 'Nem é gambiarra!'},
  {:label => 'Putz! Que gambiarra!!'},
])