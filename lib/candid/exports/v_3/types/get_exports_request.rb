# frozen_string_literal: true

module Candid
  module Exports
    module V3
      module Types
        class GetExportsRequest < Internal::Types::Model
          field :start_date, -> { String }, optional: false, nullable: false
          field :end_date, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
