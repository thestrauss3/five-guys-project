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
   binding.pry
   @user = User.new(params[:user])
   if @user.save
     UserMailer.signup_confirmation(@user).deliver
     redirect_to @user, notice: "Signed up successfully."
   else
     render :new
   end
 end

end
