class UeserController < ApplicationController
before_action :correct_user, only: [:edit, :update]

  def update
  @user=User.find(params[:id])
  if @user.update(user_params)
  redirect_to user_path(@user.id)
  flash[:notice]= "You have updated user successfully."
  else
  render :edit
  end
  end

  def show
  @user=User.find(params[:id])
  @books=@user.books
  end

  def index
  @user=User.all
  end

  def edit
  @user=User.find(params[:id])
  end

  private
  def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
  @user = User.find(params[:id])
  unless @user == current_user
  redirect_to user_path(current_user)
  end
  end
end
