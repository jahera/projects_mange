class TaskAssignmentMailer < ApplicationMailer

  default from: 'notifications@example.com'

  def assignment_reminder(user, assignment)
    @user = user
    @assignment = assignment
    mail(to: 'jahera4ux@gmail.com', subject: 'Assignment Reminder: Last Day Today')
  end
end
