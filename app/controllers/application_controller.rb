class ApplicationController < ActionController::Base
  include Pundit::Authorization
	before_action :authenticate_user!

  protect_from_forgery unless: -> { request.format.json? }
  # before_action :set_current_tenant

  # Pundit: rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # def authorize_admin
  #   redirect_to root_path, alert: 'Access Denied' unless current_user.has_role?('admin')
  # end

  protected

  def after_sign_in_path_for(resource)
    current_user.has_role?('admin') ? admin_root_path : root_path
  end

  # def set_tenant
  #   if current_user
  #     tenant = Tenant.find(current_user.tenant_id)
  #     Apartment::Tenant.switch!(tenant.name) if tenant
  #     @current_tenant = tenant
  #   end
  # end

  def set_current_tenant
    if current_user && current_user.tenant_id.present?
      tenant = Tenant.find(current_user.tenant_id)
      if tenant
        Apartment::Tenant.switch!(tenant.name)
        Rails.logger.info "Switched to tenant: #{tenant.name}"  # Log the tenant switch
        @current_tenant = tenant
      else
        redirect_to root_path, alert: "Tenant not found."
      end
    else
      Apartment::Tenant.switch!('public')  # default tenant or public schema
      @current_tenant = nil
    end
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def current_tenant
    @current_tenant
  end

  helper_method :current_tenant
end
