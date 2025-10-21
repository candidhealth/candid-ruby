# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          class Guarantor < Internal::Types::Model
            field :name, -> { Candid::PreEncounter::Common::Types::HumanName }, optional: false, nullable: false
            field :telecom, -> { Candid::PreEncounter::Common::Types::ContactPoint }, optional: true, nullable: false
            field :email, -> { String }, optional: true, nullable: false
            field :birth_date, -> { String }, optional: true, nullable: false
            field :address, -> { Candid::PreEncounter::Common::Types::Address }, optional: false, nullable: false

          end
        end
      end
    end
  end
end
