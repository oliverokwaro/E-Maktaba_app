class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  
  #list al users
  def index 
  @users = User.all
  end

  def show
  @user = User.find(params[:id])
  @books = Book.all
  end

  def new 
    @user = User.new
  end

  #creates a new user
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to E-Maktaba !"
    redirect_to @user
    else
      render 'new'
    end
  end


  def edit
  params.require(:user).permit(:name, :email, :position, :password_confirmation)
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
    flash[:success] = "Profile updated"
    redirect_to @user
    else
     render 'edit'
    end
  end

  private
  #defined User params
  def user_params 
    params.require(:user).permit(:name, :email, :position, :password, :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

end
