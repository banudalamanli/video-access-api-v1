class Person < ActiveRecord::Base
	has_many :people_with_roles
	has_many :roles, through: :people_with_roles
	
	validates :name, presence: true
end
