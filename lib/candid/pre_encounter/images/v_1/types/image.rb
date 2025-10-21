# frozen_string_literal: true

module Candid
  module PreEncounter
    module Images
      module V1
        module Types
          # An Image object with immutable server-owned properties.
          class Image < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false
            field :signed_url, -> { String }, optional: false, nullable: false

          end
        end
      end
    end
  end
end
