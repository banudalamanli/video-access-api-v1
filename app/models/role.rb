class Role < ActiveRecord::Base
	has_many :people_with_roles, dependent: :destroy
	has_many :people, through: :people_with_roles

	validates :role, presence: true, uniqueness: true
end
