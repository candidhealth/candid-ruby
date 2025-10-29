# frozen_string_literal: true

module Candid
  module PreEncounter
    module Common
      module Types
        class ResourcePage < Internal::Types::Model
          field :next_page_token, -> { String }, optional: true, nullable: false
          field :prev_page_token, -> { String }, optional: true, nullable: false
          field :total, -> { Integer }, optional: false, nullable: false
        end
      end
    end
  end
end
