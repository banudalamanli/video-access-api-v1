class Video < ActiveRecord::Base
	has_many :cast_and_crew_members, dependent: :destroy
	has_many :people_with_roles, through: :cast_and_crew_members
	has_many :people, through: :people_with_roles
	
	validates :title, :desc, presence: true
	# http://www.informit.com/articles/printerfriendly/2220311jw

	# def to_json
	# 	{
	# 		video: {
	# 			id: id,
	# 			title: title,
	# 			desc: desc,
	# 			actors: people.actors.map(&:name),
	# 			directors: people.directors.map(&:name)
	# 		},
	# 		success: true
	# 	}.to_json
	# end

end
