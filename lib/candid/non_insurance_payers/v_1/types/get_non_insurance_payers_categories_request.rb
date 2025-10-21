
module Candid
  module NonInsurancePayers
    module V1
      module Types
        class GetNonInsurancePayersCategoriesRequest < Internal::Types::Model
          field :search_term, -> { String }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
          field :page_token, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
