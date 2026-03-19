# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          class PatientsSearchRequestPaginated < Internal::Types::Model
            field :limit, -> { Integer }, optional: true, nullable: false
            field :mrn, -> { String }, optional: true, nullable: false
            field :page_token, -> { String }, optional: true, nullable: false
            field :sort_field, -> { String }, optional: true, nullable: false
            field :sort_direction, -> { Candid::PreEncounter::Common::Types::SortDirection }, optional: true, nullable: false
            field :redirect_to_primary, -> { Internal::Types::Boolean }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
