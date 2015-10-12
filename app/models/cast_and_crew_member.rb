class CastAndCrewMember < ActiveRecord::Base
  belongs_to :video
  belongs_to :people_with_roles
end
