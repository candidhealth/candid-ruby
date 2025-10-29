# frozen_string_literal: true

module Candid
  module Users
    module V2
      module Types
        class GoogleAppsMetadata < Internal::Types::Model
          field :google_apps_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
