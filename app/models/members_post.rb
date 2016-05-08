class MembersPost < ActiveRecord::Base
    has_many :members_comments
    belongs_to :user
    self.per_page = 2
end
