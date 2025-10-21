
module Candid
  module NonInsurancePayers
    module V1
      module Types
        class GetMultiNonInsurancePayersRequest < Internal::Types::Model
          field :name, -> { String }, optional: true, nullable: false
          field :category, -> { String }, optional: true, nullable: false
          field :categories_exact, -> { String }, optional: true, nullable: false
          field :clinical_trial_ids, -> { String }, optional: true, nullable: false
          field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :sort, -> { Candid::NonInsurancePayers::V1::Types::NonInsurancePayerSortField }, optional: true, nullable: false
          field :sort_direction, -> { Candid::Commons::Types::SortDirection }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
          field :page_token, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
