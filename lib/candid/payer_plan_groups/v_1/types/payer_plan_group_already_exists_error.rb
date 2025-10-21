# frozen_string_literal: true

module Candid
  module PayerPlanGroups
    module V1
      module Types
        class PayerPlanGroupAlreadyExistsError < Internal::Types::Model
          field :message, -> { String }, optional: false, nullable: false
          field :id, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
