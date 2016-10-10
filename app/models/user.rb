# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
	private
	def app_params
		params.require(:email, :name)
	end
	has_secure_password
	before_save { |user| user.email = email.downcase }
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,format: { with: VALID_EMAIL_REGEX },
	uniqueness: true
	validates :password, presence: true, length: { minimum: 6 }
	validates :password_confirmation, presence: true
end
