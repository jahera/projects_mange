class Admin::UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :authorize_admin, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    role = UserRole.find(params[:user][:user_role_id])
    random_code = "%09d" % rand(1..999999999)
    @user.email = "#{role.role_type}#{random_code}@gmail.com" 
    @user.password = '123456'

    if @user.save
      redirect_to admin_root_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :user_role_id, :first_name, :last_name, :tenant_id)
  end

  def authorize_admin
    unless current_user.has_role?('admin')|| current_user.has_role?('tenant_admin')
      flash[:notice] = 'You are not authorized to perform this action.'
      redirect_to root_path
    end
  end
end
