# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Create user roles for the current tenant
# Apartment::Tenant.switch('test_org10') do




	user_roles = [
	  { role_type: 'admin' },
	  { role_type: 'project_manager' },
	  { role_type: 'team_member' },
	  { role_type: 'tenant_admin' }
	]

	# Create user roles associated with the current tenant
	user_roles.each do |role_attrs|
		user_role = UserRole.find_or_initialize_by_field(role_attrs)
	  user_role.save
	end

User.create!(user_role_id: UserRole.last.id, email: "jaherasuper@gmail.com", first_name: "Super", last_name: "Admin", password: "123456")
