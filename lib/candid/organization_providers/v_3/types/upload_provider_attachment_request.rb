# frozen_string_literal: true

module Candid
  module OrganizationProviders
    module V3
      module Types
        class UploadProviderAttachmentRequest < Internal::Types::Model
          field :organization_provider_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
