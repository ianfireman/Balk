class UserMailer < ApplicationMailer
  
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Ativação da Conta Nobalk"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Recuperar Senha Nobalk"
  end
end
