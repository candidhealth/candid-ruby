# frozen_string_literal: true

module Candid
  module Users
    module V2
      module Types
        class M2MUserFailedToCreateError < Internal::Types::Model
          field :message, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
