# frozen_string_literal: true

module Candid
  module OrganizationProviders
    module V3
      module Types
        class ProviderAttachment < Internal::Types::Model
          field :provider_attachment_id, -> { String }, optional: false, nullable: false
          field :organization_provider_id, -> { String }, optional: false, nullable: false
          field :file_name, -> { String }, optional: false, nullable: false
          field :file_type, -> { Candid::OrganizationProviders::V3::Types::ProviderAttachmentFileType }, optional: false, nullable: false
        end
      end
    end
  end
end
