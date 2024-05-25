FactoryBot.define do
  factory :project do
    title { "Project Name" }
    description { "Project Description" }
    status { "new" }
    start_date { Time.zone.today }
    end_date { Time.zone.today + 2.weeks }
    tenant
  end
end