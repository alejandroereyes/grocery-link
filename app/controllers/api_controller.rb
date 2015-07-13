class ApiController < ApplicationController

   def verify_client
    client_id = request.params['client_id']
    secret_id = request.params['secret_id']
    user = User.where(client_id: client_id, secret_id: secret_id).first if client_id && secret_id
    unless user
      render json: { error: "Client id and Secret id needed" }, status: 401
    return false
    end
  end

  def not_found(params)
    render json: { message: "Sorry, We could not find this record", received: params }, status: 404
  end
end
