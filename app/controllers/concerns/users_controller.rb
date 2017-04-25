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
    @user= current_user
    redirect_to user_path(current_user)
    flash[:notice] = "Avatar successfully saved!"
  else
    redirect_to user_path(current_user)
    flash[:error]= "What did you do?!"
  end
 end

end
