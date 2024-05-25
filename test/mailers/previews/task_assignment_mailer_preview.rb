# Preview all emails at http://localhost:3000/rails/mailers/task_assignment_mailer
class TaskAssignmentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/task_assignment_mailer/task_assignment_reminder
  def task_assignment_reminder
    TaskAssignmentMailer.task_assignment_reminder
  end

end
