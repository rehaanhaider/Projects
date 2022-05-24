class Follow < ActiveRecord::Base

    belongs_to :follower, -> { distinct }, foreign_key: :follower_id, class_name: "User"
    belongs_to :followed_user, -> { distinct }, foreign_key: :followed_user_id, class_name: "User"

end
