# frozen_string_literal: true

module Candid
  module EncounterAttachments
    module V1
      module Types
        class EncounterAttachment < Internal::Types::Model
          field :encounter_id, -> { String }, optional: false, nullable: false
          field :attachment_type, -> { Candid::EncounterAttachments::V1::Types::EncounterAttachmentType }, optional: false, nullable: false

        end
      end
    end
  end
end
