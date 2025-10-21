# frozen_string_literal: true

module Candid
  module InsuranceAdjudications
    module V1
      module Types
        class InsuranceAdjudication < Internal::Types::Model
          field :insurance_adjudication_id, -> { String }, optional: false, nullable: false
          field :payer_uuid, -> { String }, optional: false, nullable: false
          field :post_date, -> { String }, optional: true, nullable: false
          field :check_number, -> { String }, optional: true, nullable: false
          field :check_date, -> { String }, optional: false, nullable: false
          field :note, -> { String }, optional: true, nullable: false
          field :claims, -> { Internal::Types::Hash[String, Internal::Types::Array[Candid::InsuranceAdjudications::V1::Types::ClaimAdjudication]] }, optional: false, nullable: false

        end
      end
    end
  end
end
