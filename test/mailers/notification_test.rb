require 'test_helper'

class NotificationTest < ActionMailer::TestCase
  test "notify_completed" do
    mail = Notification.notify_completed
    assert_equal "Notify completed", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
