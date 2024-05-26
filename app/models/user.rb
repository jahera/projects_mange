class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # belongs_to :user_role
  # belongs_to :tenant, optional: true

  self.table_name = "public.users"
  has_many :projects, foreign_key: :user_id, primary_key: :id, class_name: 'Project', dependent: :destroy

  belongs_to :user_role
  belongs_to :tenant, optional: true
  # has_many :projects, dependent: :destroy

  def has_role?(role_name)
    user_role.role_type == role_name.to_s
  end

  def tenant_admin?
    user_role.role_type == "admin"
  end 

  def create_tenant(org_name)
    tenant = Tenant.create!(name: org_name)
    self.tenant_id = tenant.id
    self.save!
  end

  # def has_role?(role)
  #   user_roles.exists?(role_type: role.to_s)
  # end
end
