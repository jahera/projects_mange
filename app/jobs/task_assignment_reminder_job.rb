class TaskAssignmentReminderJob < ApplicationJob
  queue_as :mailers

  def perform
    assignments_due_today = Task.where(end_date: Date.today)

    assignments_due_today.each do |assignment|
      assignment.assigned_to.each do |user|
        TaskAssignmentMailer.assignment_reminder(user, assignment).deliver_now
        Rails.logger.info("Sent reminder email to #{user.email} for task #{assignment.title}")
      end
    end
  end
end
