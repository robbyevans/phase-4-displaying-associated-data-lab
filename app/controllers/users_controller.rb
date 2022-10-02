class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

def show
  users=User.find_by(id:params[:id])
  render json: users,include: :items
end

def render_not_found_response
  render json: { error: "User not found" }, status: :not_found
end
end
