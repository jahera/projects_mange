class Task < ApplicationRecord
  validates :title, presence: true
  validates :project_id, presence: true
  # validates :assigned_to_id, presence: true

  belongs_to :project
  belongs_to :assigned_to, class_name: 'User', optional: true
end
