# frozen_string_literal: true

module Candid
  module EncounterAttachments
    module V1
      module Types
        class DeleteExternalAttachmentRequest < Internal::Types::Model
          field :charge_capture_external_id, -> { String }, optional: false, nullable: false
          field :attachment_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
