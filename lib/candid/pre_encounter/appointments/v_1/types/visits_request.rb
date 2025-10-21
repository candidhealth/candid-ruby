
module Candid
  module PreEncounter
    module Appointments
      module V1
        module Types
          class VisitsRequest < Internal::Types::Model
            field :page_token, -> { String }, optional: true, nullable: false
            field :limit, -> { Integer }, optional: true, nullable: false
            field :sort_field, -> { String }, optional: true, nullable: false
            field :sort_direction, -> { Candid::PreEncounter::Common::Types::SortDirection }, optional: true, nullable: false
            field :filters, -> { String }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
