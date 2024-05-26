class ProjectPolicy < ApplicationPolicy
  def index?
    user.has_role?('admin') || user.has_role?('project_manager')
  end

  def show?
    user.has_role?('admin') || user.has_role?('project_manager') || user.has_role?('team_member')
  end

  def edit?
    user.has_role?('admin') || user.has_role?('tenant_admin')
  end

  def new?
    user.has_role?('admin') || user.has_role?('tenant_admin')
  end

  def create?
    user.has_role?('admin') || user.has_role?('tenant_admin')
  end

  def update?
    user.has_role?('admin') || user.has_role?('tenant_admin')
  end

  def destroy?
    user.has_role?('tenant_admin')
  end

  class Scope < Scope
    def resolve
      if user.has_role?('admin') || user.has_role?('tenant_admin')
        scope.all
      else
        scope.where(tenant: user.tenant)
      end
    end
  end
end
