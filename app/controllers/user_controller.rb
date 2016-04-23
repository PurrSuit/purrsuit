class UserController < ApplicationController

  def all
    render json: User.all
  end

  def show
    users = User.where(params[:id])
      user = nil
        if (users.length > 0)
            user = users.first
        else
            raise "error mano"
        end
        render json: user
  end

  def new
    user = User.new
  end

  def create
    user = User.new(get_params)
    if @user.save
        render json: user
      else
        render action: :new
end

  end

  def edit

  end

  def update

  end

  def delete

  end

  private
  def get_params
        params.require(:user).permit(:nome,:email,:password)
    end
end
