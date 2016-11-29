class AdminsController < ApplicationController
  layout 'admin'

  def index
    @admins = Admin.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(admin_params)
      redirect_to admins_path, notice: "Successfully update admin"
    else
      render action: "edit"
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy
    redirect_to destroy_admin_session_path, notice: "Successfully deleted admin"
  end

  private

  def admin_params
    params[:admin].permit(:first_name, :last_name, :city, :email, :mobile_number, :password, :password_confirmation)
  end
end
