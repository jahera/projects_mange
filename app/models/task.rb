class Task < ApplicationRecord
  validates :title, presence: true
  validates :project_id, presence: true
  # validates :assigned_to_id, presence: true

  scope :completed, -> { where(status: 'completed') }
  scope :inprogress, -> { where(status: 'inprogress') }

  belongs_to :project
  belongs_to :assigned_to, class_name: 'User', optional: true

  def duration
    (end_date - start_date).to_i if start_date && end_date
  end
end
