# frozen_string_literal: true

module Candid
  module PreEncounter
    module Common
      module Types
        # An external identifier for a patient
        class ExternalIdentifier < Internal::Types::Model
          field :value, -> { String }, optional: false, nullable: false
          field :system, -> { String }, optional: false, nullable: false
          field :period, -> { Candid::PreEncounter::Common::Types::Period }, optional: true, nullable: false
        end
      end
    end
  end
end
