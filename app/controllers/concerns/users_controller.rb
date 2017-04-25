class UsersController < ApplicationController

 def show
   if current_user.present?
     @user = current_user
    #  @users_burgers = @user.burgers
   else
     redirect_to new_user_session_path
   end
 end

 def update
  if params[:user][:avatar].present?
    @user = current_user
    @user.avatar = params[:user][:avatar]
    @user.save!
    flash[:notice] = "Avatar successfully saved!"
    redirect_to user_path(current_user)
  else
    flash[:error] = "What did you do?!"
    redirect_to user_path(current_user)
  end
 end

end
