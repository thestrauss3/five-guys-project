class AvatarsController < ApplicationController
def edit
  @user = current_user
end
end
