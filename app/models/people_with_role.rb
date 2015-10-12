class PeopleWithRole < ActiveRecord::Base
  belongs_to :person
  belongs_to :role
  has_many :cast_and_crew_members
  has_many :videos, through: :cast_and_crew_members
end
