class UserRole < ApplicationRecord
	has_many :users

  validates :role_type, presence: true, uniqueness: true

	def to_s
    role_type.humanize
  end
end
