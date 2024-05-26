class Project < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true

  has_many :tasks, dependent: :destroy
  belongs_to :user, class_name: 'User', foreign_key: :user_id

  scope :completed, -> { where(status: 'completed') }
  scope :inprogress, -> { where(status: 'inprogress') }

  def average_task_completion_time
    # self.tasks.completed.average('end_date - start_date')
    tasks = Task.where(project_id: self.id)
    tasks.completed.average('end_date - start_date')
  end

  def total_story_points
    # self.tasks.sum(:story_point)
    tasks = Task.where(project_id: self.id)
    tasks.sum(:story_point)
  end

  # enum status: { new: "new", inprogress: "inprogress", complete: "complete" }, _prefix: :status
  
end
