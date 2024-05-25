class Project < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  
  has_many :tasks, dependent: :destroy
  belongs_to :user, class_name: 'User', foreign_key: :user_id
end
