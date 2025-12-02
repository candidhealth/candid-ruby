# frozen_string_literal: true

module Candid
  module Events
    module V1
      module Types
        class EventScanPage < Internal::Types::Model
          field :next_page_token, -> { String }, optional: true, nullable: false
          field :items, lambda {
            Internal::Types::Array[Candid::Events::V1::Types::Event]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
