# frozen_string_literal: true

module Candid
  module Users
    module V2
      module Types
        class M2MUserLimitReachedError < Internal::Types::Model
          field :message, -> { String }, optional: false, nullable: false
          field :limit, -> { Integer }, optional: false, nullable: false
        end
      end
    end
  end
end
