class Person < ActiveRecord::Base
	has_many :people_with_roles, dependent: :destroy
	has_many :roles, through: :people_with_roles
	has_many :cast_and_crew_members, through: :people_with_roles
	has_many :videos, through: :cast_and_crew_members
	
	# scope :actors,    -> { includes(:roles).where(roles: { role: 'actor' } ) }
	# scope :directors, -> { includes(:roles).where(roles: { role: 'director' } ) }
	scope :role, 			-> (role) { includes(:roles).where(roles: { role: role } ) }
	scope :actors, 		-> { role('actor') }
	scope :directors, -> { role('director') }
	

	def self.create_with_role(role, *person)
		Role.find_or_create_by(role: role).people.create(person)
	end

	def self.create_actors(people)
		people.each do |name|
			create_with_role('actor', name: name)
		end
	end

	# # instead of writing a scope method for each role,
	# we can dynamically (expensive!) find people with a role based on any method name

	@roles = [] # memoize roles in a class instance variable

	def self.method_missing(meth, *args)
		meth = meth.to_s.singularize # normalize

		return role(meth) if @roles.include? meth # memoized validation

		@roles << meth # memoization

		return role(meth) if Role.find_by(role: meth)
		
		super
	end


	validates :name, presence: true
end
