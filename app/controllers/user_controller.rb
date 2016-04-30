class UserController < ApplicationController

  def all
    render json: User.all
  end

  def show
    id_users = params[:id]
        users = User.where(id: id_users)
          user = nil
        if (users.length > 0)
            user = users.first
        else
            raise "error"
        end
        render json: user
  end

  def new
    user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
        render json: user
      else
        render action: :new
end
  end

  def edit
    id_users = params[:id]
    user = nil
    users = User.where(id: id_users)
      @user = users.first
      render :edit
  end

  def update
    id_users = params[:id]
    users = User.where(id: id_users)
    user = users.first
        user.update(users_params)
        render json: user
  end

  def delete
    id_user = params[:id]
    users = User.where(id: id_user)
    user = users.first
    user.destroy
      redirect_to :users_all
  end

  private
  def user_params
        params.require(:user).permit(:nome,:email,:password)
    end
end
