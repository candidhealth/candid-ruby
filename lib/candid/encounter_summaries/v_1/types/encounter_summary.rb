# frozen_string_literal: true

module Candid
  module EncounterSummaries
    module V1
      module Types
        class EncounterSummary < Internal::Types::Model
          field :encounter_id, -> { String }, optional: false, nullable: false
          field :patient_control_number, -> { String }, optional: true, nullable: false
          field :claim_id, -> { String }, optional: false, nullable: false
          field :claim_status, -> { Candid::Claims::Types::ClaimStatus }, optional: false, nullable: false
          field :billing_provider_npi, -> { String }, optional: false, nullable: false
          field :billing_provider_name, -> { String }, optional: false, nullable: false
          field :billing_provider_tin, -> { String }, optional: true, nullable: false
          field :rendering_provider_npi, -> { String }, optional: false, nullable: false
          field :rendering_provider_name, -> { String }, optional: false, nullable: false
          field :rendering_provider_tin, -> { String }, optional: true, nullable: false
          field :optional_rendering_provider_npi, -> { String }, optional: true, nullable: false
          field :optional_rendering_provider_name, -> { String }, optional: true, nullable: false
          field :patient_first_name, -> { String }, optional: false, nullable: false
          field :patient_last_name, -> { String }, optional: false, nullable: false
          field :patient_external_id, -> { String }, optional: true, nullable: false
          field :patient_state, -> { Candid::Commons::Types::State }, optional: true, nullable: false
          field :primary_payer_id, -> { String }, optional: true, nullable: false
          field :primary_payer_name, -> { String }, optional: true, nullable: false
          field :primary_payer_plan_group_name, -> { String }, optional: true, nullable: false
          field :primary_payer_plan_name, -> { String }, optional: true, nullable: false
          field :primary_group_number, -> { String }, optional: true, nullable: false
          field :secondary_payer_id, -> { String }, optional: true, nullable: false
          field :secondary_payer_name, -> { String }, optional: true, nullable: false
          field :secondary_payer_plan_group_name, -> { String }, optional: true, nullable: false
          field :secondary_payer_plan_name, -> { String }, optional: true, nullable: false
          field :secondary_group_number, -> { String }, optional: true, nullable: false
          field :primary_member_id, -> { String }, optional: true, nullable: false
          field :sum_allowed_amount_cents, -> { Integer }, optional: false, nullable: false
          field :sum_charge_amount_cents, -> { Integer }, optional: false, nullable: false
          field :sum_paid_amount_cents, -> { Integer }, optional: false, nullable: false
          field :primary_plan_type, -> { Candid::Commons::Types::SourceOfPaymentCode }, optional: true, nullable: false
          field :secondary_plan_type, -> { Candid::Commons::Types::SourceOfPaymentCode }, optional: true, nullable: false
          field :primary_insurance_paid_cents, -> { Integer }, optional: true, nullable: false
          field :secondary_insurance_paid_cents, -> { Integer }, optional: true, nullable: false
          field :tertiary_insurance_paid_cents, -> { Integer }, optional: true, nullable: false
          field :sum_patient_responsibility_cents, -> { Integer }, optional: false, nullable: false
          field :sum_insurance_balance_amount_cents, -> { Integer }, optional: true, nullable: false
          field :sum_insurance_adjustment_amount_cents, -> { Integer }, optional: true, nullable: false
          field :sum_patient_paid_amount_cents, -> { Integer }, optional: true, nullable: false
          field :sum_patient_balance_amount_cents, -> { Integer }, optional: true, nullable: false
          field :sum_total_balance_amount_cents, -> { Integer }, optional: true, nullable: false
          field :sum_patient_write_off_amount_cents, -> { Integer }, optional: true, nullable: false
          field :sum_non_insurance_paid_cents, -> { Integer }, optional: true, nullable: false
          field :claim_balance_amount_cents, -> { Integer }, optional: true, nullable: false
          field :procedure_codes, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          field :procedure_modifiers, -> { Internal::Types::Array[Candid::Commons::Types::ProcedureModifier] }, optional: false, nullable: false
          field :carcs, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          field :rarcs, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          field :denial_reasons, -> { Internal::Types::Array[Candid::ServiceLines::V2::Types::DenialReasonContent] }, optional: true, nullable: false
          field :rejection_reason, -> { Candid::Commons::Types::RejectionReason }, optional: true, nullable: false
          field :tag_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          field :date_of_service, -> { String }, optional: false, nullable: false
          field :end_date_of_service, -> { String }, optional: true, nullable: false
          field :timely_filing_deadline, -> { String }, optional: true, nullable: false
          field :service_facility, -> { Candid::ServiceFacility::Types::EncounterServiceFacility }, optional: false, nullable: false
          field :place_of_service_code, -> { Candid::Commons::Types::FacilityTypeCode }, optional: true, nullable: false
          field :service_line_place_of_service_codes, -> { Internal::Types::Array[Candid::Commons::Types::FacilityTypeCode] }, optional: true, nullable: false
          field :service_line_total_quantity, -> { Integer }, optional: true, nullable: false
          field :diagnosis_codes, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          field :encounter_external_id, -> { String }, optional: true, nullable: false
          field :billable_status, -> { Candid::Encounters::V4::Types::BillableStatusType }, optional: false, nullable: false
          field :responsible_party, -> { Candid::Encounters::V4::Types::ResponsiblePartyType }, optional: false, nullable: false
          field :work_queue_id, -> { String }, optional: true, nullable: false
          field :work_queue_name, -> { String }, optional: true, nullable: false
          field :work_queue_membership_activated_at, -> { String }, optional: true, nullable: false
          field :owner_of_next_action, -> { Candid::Encounters::V4::Types::EncounterOwnerOfNextActionType }, optional: false, nullable: false
          field :has_active_job, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :task_category, -> { Candid::Tasks::Commons::Types::TaskCategory }, optional: true, nullable: false
          field :task_type, -> { Candid::Tasks::Commons::Types::TaskType }, optional: true, nullable: false
          field :active_snooze, -> { Candid::Commons::Types::EncounterWorkQueueSnooze }, optional: true, nullable: false
          field :days_since_unsnoozed, -> { Integer }, optional: true, nullable: false
          field :claim_updated_at, -> { String }, optional: false, nullable: false
          field :task_assignees, -> { Internal::Types::Array[String] }, optional: true, nullable: false
          field :task_assignees_by_name, -> { Internal::Types::Array[String] }, optional: true, nullable: false
          field :task_description, -> { String }, optional: true, nullable: false
          field :next_responsible_party, -> { Candid::Commons::Types::NextResponsibleParty }, optional: true, nullable: false
          field :non_insurance_payer_categories, -> { Internal::Types::Array[String] }, optional: true, nullable: false
          field :non_insurance_payer_names, -> { Internal::Types::Array[String] }, optional: true, nullable: false
          field :clinical_trial_phases, -> { Internal::Types::Array[Candid::ClinicalTrials::V1::Types::ClinicalTrialPhase] }, optional: true, nullable: false
          field :submission_expectation, -> { Candid::Encounters::V4::Types::EncounterSubmissionExpectation }, optional: true, nullable: false
          field :type_of_bill, -> { Candid::X12::V1::Types::TypeOfBillComposite }, optional: true, nullable: false
          field :attending_provider_npi, -> { String }, optional: true, nullable: false
          field :attending_provider_name, -> { String }, optional: true, nullable: false
          field :revenue_codes, -> { Internal::Types::Array[String] }, optional: true, nullable: false
          field :organization_id, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
