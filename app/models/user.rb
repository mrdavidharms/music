class User < ActiveRecord::Base
  has_many :albums
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         validates :username, presence: true
         validates :email, presence: true
end
