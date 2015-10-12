class Role < ActiveRecord::Base
	has_many :people_with_roles
	has_many :people, through: :people_with_roles

	validates :role, presence: true
end
