class ApiController < ApplicationController

   def verify_client(tokens)
    is_a_client = User.exists?(client_id: tokens['client_id'], secret_id: tokens['secret_id'])
    is_a_client
  end
end