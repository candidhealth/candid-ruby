# frozen_string_literal: true

module Candid
  module EncounterSupplementalInformation
    module V1
      module Types
        class UpdateSupplementalInformationRequest < Internal::Types::Model
          field :attachment_id, -> { String }, optional: true, nullable: false
          field :attachment_report_type_code, lambda {
            Candid::Commons::Types::ReportTypeCode
          }, optional: true, nullable: false
          field :attachment_transmission_code, lambda {
            Candid::Commons::Types::ReportTransmissionCode
          }, optional: true, nullable: false
          field :attachment_control_number, -> { String }, optional: true, nullable: false
          field :attachment_inclusion, lambda {
            Candid::EncounterSupplementalInformation::V1::Types::AttachmentInclusion
          }, optional: true, nullable: false
        end
      end
    end
  end
end
