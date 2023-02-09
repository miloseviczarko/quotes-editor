class User < ApplicationRecord
  belongs_to :company

  devise :database_authenticatable, :validatable

  def name
    email.split('@').first.capitalize
  end
end
