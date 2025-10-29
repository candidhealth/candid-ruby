# frozen_string_literal: true

module Candid
  module ServiceLines
    module V2
      module Types
        class ServiceLineCreateBase < Internal::Types::Model
          field :procedure_code, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
