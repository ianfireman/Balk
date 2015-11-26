require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  
  test "account_activation" do
    user = users(:carlos)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "Ativação da Conta Nobalk", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match user.name,               mail.body.encoded
    assert_match user.activation_token,   mail.body.encoded
    assert_match CGI::escape(user.email), mail.body.encoded
  end

  test "password_reset" do
    user = users(:carlos)
    user.reset_token = User.new_token
    mail = UserMailer.password_reset(user)
    assert_equal "Recuperar Senha Nobalk", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match user.reset_token,        mail.body.encoded
    assert_match CGI::escape(user.email), mail.body.encoded
  end
  
end
