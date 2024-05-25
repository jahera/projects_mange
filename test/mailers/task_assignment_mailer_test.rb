require "test_helper"

class TaskAssignmentMailerTest < ActionMailer::TestCase
  test "task_assignment_reminder" do
    mail = TaskAssignmentMailer.task_assignment_reminder
    assert_equal "Task assignment reminder", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
