
module Candid
  module Superbills
    module V1
      module Types
        class CreateSuperbillRequest < Internal::Types::Model
          field :patient_external_id, -> { String }, optional: false, nullable: false
          field :date_range_min, -> { String }, optional: false, nullable: false
          field :date_range_max, -> { String }, optional: false, nullable: false
          field :pay_to_address, -> { Candid::Commons::Types::StreetAddressShortZip }, optional: true, nullable: false

        end
      end
    end
  end
end
