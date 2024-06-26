class User < ApplicationRecord
    has_secure_password

    has_many :tasks, dependent: :destroy

    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, length: {minimum: 5}
end
