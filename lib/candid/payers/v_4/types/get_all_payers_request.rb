
module Candid
  module Payers
    module V4
      module Types
        class GetAllPayersRequest < Internal::Types::Model
          field :limit, -> { Integer }, optional: true, nullable: false
          field :search_term, -> { String }, optional: true, nullable: false
          field :page_token, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
