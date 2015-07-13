class ApiController < ApplicationController

   def verify_client(tokens)
    is_a_client = User.exists?(client_id: tokens['client_id'], secret_id: tokens['secret_id'])
    is_a_client
  end

  def need_ids_error
    render json: { error: "Client id and  Secret id needed" }, status: 407
  end

  def not_found(params)
    render json: { message: "Sorry, We could not find this record", received: params }, status: 404
  end
end
