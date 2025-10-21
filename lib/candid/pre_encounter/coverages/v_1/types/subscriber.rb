# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class Subscriber < Internal::Types::Model
            field :name, -> { Candid::PreEncounter::Common::Types::HumanName }, optional: false, nullable: false
            field :date_of_birth, -> { String }, optional: true, nullable: false
            field :biological_sex, -> { Candid::PreEncounter::Common::Types::Sex }, optional: false, nullable: false
            field :address, -> { Candid::PreEncounter::Common::Types::Address }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
