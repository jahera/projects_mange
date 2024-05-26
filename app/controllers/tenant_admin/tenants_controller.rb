class TenantAdmin::TenantsController < ApplicationController

  def index
    @tenants = Tenant.all
  end

  # GET /tenant/:id
  def show
  end

  # GET /tenants/new
  def new
    @tenant = Tenant.new()
    authorize @tenant
  end

  # POST /tenants
  def create
    @tenant = Tenant.create!(tenant_params)
    authorize @tenant
    if @tenant
      redirect_to tenant_admin_tenants_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  private

    def tenant_params
      params.require(:tenant).permit(:name)
    end
end
