# frozen_string_literal: true

module Candid
  module EncounterAttachments
    module V1
      module Types
        class BaseAttachment < Internal::Types::Model
          field :attachment_id, -> { String }, optional: false, nullable: false
          field :file_name, -> { String }, optional: false, nullable: false
          field :description, -> { String }, optional: false, nullable: false
          field :content_type, -> { String }, optional: false, nullable: false
          field :authed_url, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
