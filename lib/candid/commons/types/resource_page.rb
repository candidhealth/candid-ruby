# frozen_string_literal: true

module Candid
  module Commons
    module Types
      class ResourcePage < Internal::Types::Model
        field :prev_page_token, -> { String }, optional: true, nullable: false
        field :next_page_token, -> { String }, optional: true, nullable: false

      end
    end
  end
end
