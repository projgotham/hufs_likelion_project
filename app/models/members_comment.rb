class MembersComment < ActiveRecord::Base
    belongs_to :members_post
    belongs_to :user
end
