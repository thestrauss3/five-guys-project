class UsersController < ApplicationController
  def show
    if current_user.present?
      @user = current_user
      #  @users_burgers = @user.burgers
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      UserMailer.signup_confirmation(@user).deliver
      redirect_to @user, notice: "Signed up successfully."
    else
      render :new
    end
  end

  def update
    if !params[:user].nil?
      @user = current_user
      @user.avatar = params[:user][:avatar]
      @user.save!
      flash[:notice] = "Avatar successfully saved!"
      redirect_to user_path(current_user)
    else
      flash[:error] = "No photo was selected!"
      redirect_to edit_user_avatar_path(current_user)
    end
  end
end
