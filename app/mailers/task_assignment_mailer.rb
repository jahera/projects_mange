class TaskAssignmentMailer < ApplicationMailer

  default from: 'payelmlk4ux@gmail.com'

  def assignment_reminder(user, assignment)
    @user = user
    @assignment = assignment
    mail(to: 'jahera4ux@gmail.com', subject: 'Assignment Reminder: Last Day Today')
  end
end
