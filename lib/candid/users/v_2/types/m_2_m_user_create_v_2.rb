# frozen_string_literal: true

module Candid
  module Users
    module V2
      module Types
        class M2MUserCreateV2 < Internal::Types::Model
          field :name, -> { String }, optional: false, nullable: false
          field :organization_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
