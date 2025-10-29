# frozen_string_literal: true

module Candid
  module Exports
    module V3
      module Types
        class GetExportsResponse < Internal::Types::Model
          field :name, -> { String }, optional: false, nullable: false
          field :created_at, -> { String }, optional: false, nullable: false
          field :authenticated_download_url, -> { String }, optional: false, nullable: false
          field :authenticated_download_url_expiration, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
