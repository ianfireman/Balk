module AccountActivationsHelper
  
  def right_url(user)
    urlStr = edit_account_activation_url(user.activation_token, email: user.email)
    urlStr = urlStr[24..-1]
    urlStr = "https://floating-plains-2613" + urlStr
  end
end
