# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class ClaimSupplementalInformation < Internal::Types::Model
          field :attachment_report_type_code, -> { Candid::Encounters::V4::Types::ReportTypeCode }, optional: false, nullable: false
          field :attachment_transmission_code, -> { Candid::Encounters::V4::Types::ReportTransmissionCode }, optional: false, nullable: false
          field :attachment_control_number, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
