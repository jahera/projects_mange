class TenantAdmin::DashboardController < ApplicationController
    before_action :authenticate_user!
    # before_action :authorize_tenant_admin
    before_action :set_tenant
    before_action :switch_tenant

    def index
      @tenants = Tenant.all
      authorize @tenants
    end

    def users_list
      @users = @tenant.users
    end

    def projects_list
      @projects = Project.where(user_id: @tenant&.users)
    end

    def task_list
      @tasks = Task.where(assigned_to_id: @tenant&.users)
    end

  private

    def authorize_tenant_admin
      redirect_to root_path, alert: 'Access Denied' unless current_user.tenant_admin?
    end

    def set_tenant
      @tenant = Tenant.find(params[:id])
      authorize @tenant
    end

    def switch_tenant
      Apartment::Tenant.switch!(@tenant.name) if @tenant
    end
end
