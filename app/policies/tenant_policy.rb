class TenantPolicy < ApplicationPolicy
  def index?
    user.has_role?('tenant_admin')
  end

  def new?
    user.has_role?('tenant_admin')
  end

  def create?
    user.has_role?('tenant_admin')
  end

  def show?
    user.has_role?('tenant_admin')
  end

  def destroy?
    user.has_role?('tenant_admin')
  end

  def tenant_dashboard?
    user.has_role?('tenant_admin')
  end

  def users_list?
   user.has_role?('tenant_admin')
  end

  def projects_list?
    user.has_role?('tenant_admin')
  end

  def task_list?
    user.has_role?('tenant_admin')
  end
end
