# frozen_string_literal: true

module Candid
  module HealthCareCodeInformation
    module V1
      module Types
        class Rd8Date < Internal::Types::Model
          field :start, -> { String }, optional: false, nullable: false
          field :end_, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
