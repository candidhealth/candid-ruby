# frozen_string_literal: true

module Candid
  module OrganizationProviders
    module V2
      module Types
        class OrganizationProvider < Internal::Types::Model
          field :organization_provider_id, -> { String }, optional: false, nullable: false
          field :employment_status, -> { Candid::OrganizationProviders::V2::Types::EmploymentStatus }, optional: false, nullable: false
          field :employment_start_date, -> { String }, optional: true, nullable: false
          field :employment_termination_date, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
