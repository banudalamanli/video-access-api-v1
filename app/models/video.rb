class Video < ActiveRecord::Base
	validates :title, :desc, presence: true

	has_many :cast_and_crew_members
	has_many :people_with_roles, through: :cast_and_crew_members
	has_many :people, through: :people_with_roles
end
