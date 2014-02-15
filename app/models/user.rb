require 'bcrypt'
class User
  include Mongoid::Document
  field :username, type: String
  field :hashed_password, type: String

  attr_accessor :password, :password_confirmation

  before_save :update_password

  validates :username, uniqueness: true
  validates :password, confirmation: true

  def authenticates_with_password?(pwd)
  	BCrypt::Password.new(hashed_password) == pwd
  end

  private

  def update_password
    if password.present?
      salt = BCrypt::Engine.generate_salt
      self.hashed_password = BCrypt::Engine.hash_secret password, salt
    end
  end
end
