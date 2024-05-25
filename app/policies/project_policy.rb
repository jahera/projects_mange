class ProjectPolicy < ApplicationPolicy
  def index?
    user.has_role?('admin') || user.has_role?('project_manager')
  end

  def show?
    user.has_role?('admin') || user.has_role?('project_manager') || user.has_role?('team_member')
  end

  def create?
    user.has_role?('admin') || user.has_role?('project_manager')
  end

  def update?
    user.has_role?('admin') || user.has_role?('project_manager')
  end

  def destroy?
    user.has_role?('admin') || user.has_role?('project_manager')
  end

  class Scope < Scope
    def resolve
      if user.has_role?('admin')
        scope.all
      else
        scope.where(tenant: user.tenant)
      end
    end
  end
end
