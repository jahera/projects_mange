require 'rails_helper'

RSpec.describe Tenant, type: :model do
  describe 'after create callback' do
    it 'creates the tenant schema' do
      tenant_name = 'test_tenant'

      # Create the tenant
      tenant = Tenant.create!(name: tenant_name)

      # Check that the schema exists
      Apartment::Tenant.switch!(tenant_name)
      expect { ActiveRecord::Base.connection.schema_search_path }.to_not raise_error

      # Clean up by dropping the tenant
      Apartment::Tenant.drop(tenant_name)
    end
  end
end
