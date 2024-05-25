class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    authorize :dashboard, :index?
  end

  def tenant_dashboard
    @tenants = Tenant.all
    authorize @tenants
  end
end
