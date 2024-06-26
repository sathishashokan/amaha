class UsersController < ApplicationController
  before_action :authenticate_user, except: [:create, :new, :index]

  def index
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
        session[:user_id] = user.id
        flash[:notice] = "User was successfully created!"
        redirect_to user_profile_path
    else
      flash[:alert] = "#{user.errors.full_messages}"
      redirect_to new_path
    end
  end

  def show
    user = User.find_by(id: params[:id])
    render json: {user: user}, status: 200
  end

  def login
  end

  def profile
    @user = current_user
    @tasks = @user.tasks
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end
end
