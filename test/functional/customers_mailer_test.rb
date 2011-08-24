require 'test_helper'

class CustomersMailerTest < ActionMailer::TestCase
  test "report_email" do
    mail = CustomersMailer.report_email
    assert_equal "Report email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
