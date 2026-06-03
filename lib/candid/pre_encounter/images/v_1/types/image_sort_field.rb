# frozen_string_literal: true

module Candid
  module PreEncounter
    module Images
      module V1
        module Types
          module ImageSortField
            extend Candid::Internal::Types::Enum

            UPDATED_AT = "updatedAt"
            FILE_NAME = "fileName"
            DISPLAY_NAME = "displayName"
            FILE_TYPE = "fileType"
            STATUS = "status"
          end
        end
      end
    end
  end
end
