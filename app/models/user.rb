class User < ApplicationRecord
  include Clearance::User

  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
end
