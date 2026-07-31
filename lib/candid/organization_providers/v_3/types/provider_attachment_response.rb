# frozen_string_literal: true

module Candid
  module OrganizationProviders
    module V3
      module Types
        class ProviderAttachmentResponse < Internal::Types::Model
          field :signed_download_url, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
