
module Candid
  module EncounterAttachments
    module V1
      module Types
        class DeleteAttachmentRequest < Internal::Types::Model
          field :encounter_id, -> { String }, optional: false, nullable: false
          field :attachment_id, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
