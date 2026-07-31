# frozen_string_literal: true

module Candid
  module OrganizationProviders
    module V3
      module Types
        class DownloadProviderAttachmentRequest < Internal::Types::Model
          field :attachment_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
