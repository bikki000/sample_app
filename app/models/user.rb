class User < ActiveRecord::Base
	has_many :microposts, dependent: :destroy
	# 'has_many :microposts' => rails will look for 'Micropost' model [CONVEN]

	# also rails will look for 'user_id' column in 'microposts' table [CONVEN]

	# 'dependent: :destroy' => rails will delete all microposts of this user
	# when this user is deleted [CONVEN]

	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
	# ':relationships'=> rails will look for 'Relationship' model [CONVEN]

	# also rails will look for 'user_id' column in 'relationships' table [CONVEN]

	# 'foreing_key: "follower_id"'=> rails will now look 'follower_id' column
	# for reference not 'user_id' [CONFIG]
	has_many :followed_users, through: :relationships, source: :followed
	# ':followed_users'=> rails will look for 'FollowedUser' Model [CONVEN]

	# also rails will look for 'user_id' column in 'followed_users' table [CONVEN]

	# 'through: :relationships'=> rails will now look for 'Relationship' model [CONFIG]

	# also rails will now look for 'followed_user_id' in relationships table [CONVEN]

	# also provides handy methods named no 'followed_users'

	# 'source: :followed' => rails will now look for followed_id in relationships
	# table [CONFIG]

	# senario=> we could use the following
	# 	has_many :followeds, through: :relationships
	# here will user 'Relationship' table and 'followed_id' foreign key
	# but this butcher English Grammer when we'll use User.first.followeds

	has_many :reverse_relationships, foreign_key: "followed_id",
																	 class_name: "Relationship",
																	 dependent: :destroy
	# ':reverse_relationships'=> rails will look for 'ReverseRelationship' model [CONVEN]

	# also rails will look for 'user_id' column in 'reverse_relationships' table [CONVEN]

	# 'foreign_key: "followed_id'=> rails will now look for 'followed_id' column
	# in 'reverse_relationships' table [CONFIG]

	# 'class_name: "Relationship'=> rails now look for 'Relationship' model
	# not 'ReveseRelationship' model and [CONFIG]

	# also rails will look for 'relationships' table not 'reverse_relationships' table
	# because now model is 'Relationship' [CONFIG]
	has_many :followers, through: :reverse_relationships, source: :follower
	# ':followers'=> rails will look for 'Followew' model [CONVEN]

	# also rails will look for 'user_id' column in 'followers' table [CONVEN]

	# 'through: :reverse_relationships'=> rails now look for 'Relationship' model
	# (why not 'ReveseRelationships' model) [CONVEN][CONFIG]

	# also rails will look for 'follower_id' column in 'relationships' table
	# (why not 'reverse_relationships' table) [CONFIG][CONFIG]

	# 'source: :follower'=> this configuration is actually same as convention

	before_save {self.email = email.downcase}
	before_create :create_remember_token

	validates :name, presence: true, length: {maximum: 50}
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, 
									 uniqueness: {case_sensitive: false}
	
	has_secure_password
	validates :password, length: {minimum: 6}

	validate :minimum_age 

	def self.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def self.digest(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def feed
		Micropost.from_users_followed_by(self)
	end

	def following?(other_user)
		# I am not using 'followed_user_id' because 'relationships' table doesn't have it
		relationships.find_by(followed_id: other_user.id)
	end

	def follow!(other_user)
		# even though 'relationships' table require follower_id
		# we are not providing it as rails will do it for us
		# include 'self' id largly a matter of taste
		self.relationships.create!(followed_id: other_user.id)
	end

	def unfollow!(other_user)
		relationships.find_by(followed_id: other_user).destroy
	end

	private
	def create_remember_token
		self.remember_token = User.digest(User.new_remember_token)
	end

	def minimum_age
		unless date_of_birth.present?
			errors.add(:date_of_birth, "must be present")
		end
		if date_of_birth > Date.today - 18.year
			errors.add(:date_of_birth, "must be 18 years in past")
		end
	end
	
end
