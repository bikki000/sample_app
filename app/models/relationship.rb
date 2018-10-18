class Relationship < ActiveRecord::Base
	belongs_to :follower, class_name: "User"
	# ':follower'=> rails will create a relation with 'Follower' Model [CONVEN]
	# also provides a handy method to retrive its supertable using name 'follower'
	# 'class_name "User'=> rails will now create relation with 'User' model [CONFIG]
	# also the handy methods will named after 'User'
	belongs_to :followed, class_name: "User"

	validates :follower_id, presence: true
	validates :followed_id, presence: true
end
