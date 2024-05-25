class Project < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true

  # enum status: { new: "new", inprogress: "inprogress", complete: "complete" }, _prefix: :status
  
  has_many :tasks, dependent: :destroy
  belongs_to :user, class_name: 'User', foreign_key: :user_id
end
