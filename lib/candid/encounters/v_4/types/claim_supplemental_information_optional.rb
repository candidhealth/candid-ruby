# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class ClaimSupplementalInformationOptional < Internal::Types::Model
          field :attachment_report_type_code, lambda {
            Candid::Commons::Types::ReportTypeCode
          }, optional: true, nullable: false
          field :attachment_transmission_code, lambda {
            Candid::Commons::Types::ReportTransmissionCode
          }, optional: true, nullable: false
          field :attachment_control_number, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
