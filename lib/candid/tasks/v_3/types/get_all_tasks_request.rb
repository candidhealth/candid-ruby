
module Candid
  module Tasks
    module V3
      module Types
        class GetAllTasksRequest < Internal::Types::Model
          field :limit, -> { Integer }, optional: true, nullable: false
          field :page_token, -> { String }, optional: true, nullable: false
          field :status, -> { Candid::Tasks::Commons::Types::TaskStatus }, optional: true, nullable: false
          field :task_type, -> { Candid::Tasks::Commons::Types::TaskType }, optional: true, nullable: false
          field :categories, -> { String }, optional: true, nullable: false
          field :updated_since, -> { String }, optional: true, nullable: false
          field :encounter_id, -> { String }, optional: true, nullable: false
          field :search_term, -> { String }, optional: true, nullable: false
          field :assigned_to_id, -> { String }, optional: true, nullable: false
          field :date_of_service_min, -> { String }, optional: true, nullable: false
          field :date_of_service_max, -> { String }, optional: true, nullable: false
          field :billing_provider_npi, -> { String }, optional: true, nullable: false
          field :sort, -> { Candid::Tasks::V3::Types::TaskSortOptions }, optional: true, nullable: false

        end
      end
    end
  end
end
