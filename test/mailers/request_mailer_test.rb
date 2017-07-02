require 'test_helper'

class RequestMailerTest < ActionMailer::TestCase
  test "newreq" do
    mail = RequestMailer.newreq
    assert_equal "Newreq", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "approved" do
    mail = RequestMailer.approved
    assert_equal "Approved", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "rejected" do
    mail = RequestMailer.rejected
    assert_equal "Rejected", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "reschedule" do
    mail = RequestMailer.reschedule
    assert_equal "Reschedule", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "reminder" do
    mail = RequestMailer.reminder
    assert_equal "Reminder", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
