class UserRole < ApplicationRecord
	has_many :users

  validates :role_type, presence: true, uniqueness: true

  scope :is_admin, -> { where(role_type: 'admin').first }

	def to_s
    role_type.humanize
  end
end
