class Tenant < ApplicationRecord
	validates :name, presence: true
	has_many :users

	# after_create :create_tenant_schema

	private

  # def create_tenant_schema
  #   Apartment::Tenant.create(name)
  # rescue Apartment::TenantExists => e
  #   Rails.logger.error "Tenant schema #{name} already exists."
  # end
end
