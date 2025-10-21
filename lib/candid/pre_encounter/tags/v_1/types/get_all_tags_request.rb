
module Candid
  module PreEncounter
    module Tags
      module V1
        module Types
          class GetAllTagsRequest < Internal::Types::Model
            field :limit, -> { Integer }, optional: true, nullable: false
            field :page_token, -> { String }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
