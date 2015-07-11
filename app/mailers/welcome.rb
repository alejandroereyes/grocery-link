class Welcome < ApplicationMailer
  def send_keys_to(user)
    @user  = user
    @client_id = @user.client_id
    @secret_id = @user.secret_id

    mail to: user.email, subject: "Welcome to groceryLink :)"
  end
end
