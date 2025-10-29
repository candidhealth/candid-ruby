# frozen_string_literal: true

module Candid
  module PreEncounter
    module Lists
      module V1
        module Types
          class AppointmentsGetListRequest < Internal::Types::Model
            field :sort_field, -> { String }, optional: true, nullable: false
            field :sort_direction, lambda {
              Candid::PreEncounter::Common::Types::SortDirection
            }, optional: true, nullable: false
            field :limit, -> { Integer }, optional: true, nullable: false
            field :page_token, -> { String }, optional: true, nullable: false
            field :filters, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
