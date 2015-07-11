class Api::LookupController < ApplicationController

  def categories
    if verify_client(tokens)
      @all_categories = Category.all
      render json: @all_categories
    else
      error
    end
  end

  private
  def tokens
    params.permit(:client_id, :secret_id)
  end

  def error
    render json: { error: "Client id and  Secret id needed" }
  end
end
