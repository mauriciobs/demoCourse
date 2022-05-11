class User < ApplicationRecord
	belongs_to :role
    has_many :user_has_course

end