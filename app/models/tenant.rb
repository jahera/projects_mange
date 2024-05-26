class Tenant < ApplicationRecord
	validates :name, presence: true
	validates_uniqueness_of :name
	has_many :users

	after_create :create_tenant_schema

	private

  def create_tenant_schema
    Apartment::Tenant.create(self.name)
    ActiveRecord::Migrator.migrations_paths.each do |path|
      ActiveRecord::Base.connection.migration_context.migrate
    end
  rescue Apartment::TenantExists => e
    Rails.logger.error "Tenant schema #{name} already exists."
  end
end
