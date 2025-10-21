# frozen_string_literal: true

module Candid
  module PreEncounter
    module Common
      module Types
        class BaseModel < Internal::Types::Model
          field :organization_id, -> { String }, optional: false, nullable: false
          field :deactivated, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :version, -> { Integer }, optional: false, nullable: false
          field :updated_at, -> { String }, optional: false, nullable: false
          field :updating_user_id, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
