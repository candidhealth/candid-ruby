# frozen_string_literal: true

module Candid
  module EncounterAttachments
    module V1
      module Types
        class CreateAttachmentV2Request < Internal::Types::Model
          field :encounter_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
