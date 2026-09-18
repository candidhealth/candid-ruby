# frozen_string_literal: true

module Candid
  module EncounterSummaries
    module V1
      module Types
        # Structured filter for searching encounter summaries. Each field accepts an operator-tagged
        # filter object. Omit a field to not filter on it. All specified filters are combined with AND.
        class EncounterFilter < Internal::Types::Model
          field :organization_ids, -> { Candid::EncounterSummaries::V1::Types::UuidSetFilter }, optional: true, nullable: false
          field :search_term, -> { String }, optional: true, nullable: false
          field :primary_payer_name, -> { Candid::EncounterSummaries::V1::Types::StringFilter }, optional: true, nullable: false
          field :primary_payer_plan_name, -> { Candid::EncounterSummaries::V1::Types::StringFilter }, optional: true, nullable: false
          field :primary_payer_id, -> { Candid::EncounterSummaries::V1::Types::StringFilter }, optional: true, nullable: false
          field :primary_member_id, -> { Candid::EncounterSummaries::V1::Types::StringFilter }, optional: true, nullable: false
          field :primary_group_number, -> { Candid::EncounterSummaries::V1::Types::StringFilter }, optional: true, nullable: false
          field :primary_plan_type, -> { Candid::EncounterSummaries::V1::Types::SetFilter }, optional: true, nullable: false
          field :primary_payer_plan_group_id, -> { Candid::EncounterSummaries::V1::Types::UuidSetFilter }, optional: true, nullable: false
          field :primary_payer_group_name, -> { Candid::EncounterSummaries::V1::Types::StringFilter }, optional: true, nullable: false
          field :secondary_payer_name, -> { Candid::EncounterSummaries::V1::Types::StringFilter }, optional: true, nullable: false
          field :secondary_payer_plan_name, -> { Candid::EncounterSummaries::V1::Types::StringFilter }, optional: true, nullable: false
          field :secondary_payer_id, -> { Candid::EncounterSummaries::V1::Types::StringFilter }, optional: true, nullable: false
          field :secondary_member_id, -> { Candid::EncounterSummaries::V1::Types::StringFilter }, optional: true, nullable: false
          field :secondary_group_number, -> { Candid::EncounterSummaries::V1::Types::StringFilter }, optional: true, nullable: false
          field :secondary_plan_type, -> { Candid::EncounterSummaries::V1::Types::SetFilter }, optional: true, nullable: false
          field :secondary_payer_plan_group_id, -> { Candid::EncounterSummaries::V1::Types::UuidSetFilter }, optional: true, nullable: false
          field :secondary_payer_group_name, -> { Candid::EncounterSummaries::V1::Types::StringFilter }, optional: true, nullable: false
          field :service_facility_name, -> { Candid::EncounterSummaries::V1::Types::StringFilter }, optional: true, nullable: false
          field :service_facility_state, -> { Candid::EncounterSummaries::V1::Types::SetFilter }, optional: true, nullable: false
          field :procedure_codes, -> { Candid::EncounterSummaries::V1::Types::RangeableStringFilter }, optional: true, nullable: false
          field :procedure_code_range, -> { Candid::EncounterSummaries::V1::Types::StringRangeFilter }, optional: true, nullable: false
          field :revenue_codes, -> { Candid::EncounterSummaries::V1::Types::SetFilter }, optional: true, nullable: false
          field :carcs, -> { Candid::EncounterSummaries::V1::Types::PrefixableSetFilter }, optional: true, nullable: false
          field :rarcs, -> { Candid::EncounterSummaries::V1::Types::PrefixableSetFilter }, optional: true, nullable: false
          field :denial_reasons, -> { Candid::EncounterSummaries::V1::Types::SetFilter }, optional: true, nullable: false
          field :rejection_reasons, -> { Candid::EncounterSummaries::V1::Types::SetFilter }, optional: true, nullable: false
          field :procedure_modifiers, -> { Candid::EncounterSummaries::V1::Types::SetFilter }, optional: true, nullable: false
          field :billing_provider_npi, -> { Candid::EncounterSummaries::V1::Types::StringFilter }, optional: true, nullable: false
          field :billing_provider_tin, -> { Candid::EncounterSummaries::V1::Types::StringFilter }, optional: true, nullable: false
          field :rendering_provider_npi, -> { Candid::EncounterSummaries::V1::Types::StringFilter }, optional: true, nullable: false
          field :rendering_provider_name, -> { Candid::EncounterSummaries::V1::Types::StringFilter }, optional: true, nullable: false
          field :attending_provider_npi, -> { Candid::EncounterSummaries::V1::Types::StringFilter }, optional: true, nullable: false
          field :attending_provider_name, -> { Candid::EncounterSummaries::V1::Types::StringFilter }, optional: true, nullable: false
          field :claim_status, -> { Candid::EncounterSummaries::V1::Types::SetFilter }, optional: true, nullable: false
          field :external_id, -> { Candid::EncounterSummaries::V1::Types::StringFilter }, optional: true, nullable: false
          field :claim_id, -> { Candid::EncounterSummaries::V1::Types::UuidSetFilter }, optional: true, nullable: false
          field :patient_external_id, -> { Candid::EncounterSummaries::V1::Types::StringFilter }, optional: true, nullable: false
          field :patient_state, -> { Candid::EncounterSummaries::V1::Types::SetFilter }, optional: true, nullable: false
          field :billable_status, -> { Candid::EncounterSummaries::V1::Types::SetFilter }, optional: true, nullable: false
          field :responsible_party, -> { Candid::EncounterSummaries::V1::Types::SetFilter }, optional: true, nullable: false
          field :next_responsible_party, -> { Candid::EncounterSummaries::V1::Types::SetFilter }, optional: true, nullable: false
          field :owner_of_next_action, -> { Candid::EncounterSummaries::V1::Types::SetFilter }, optional: true, nullable: false
          field :submission_expectation, -> { Candid::EncounterSummaries::V1::Types::SetFilter }, optional: true, nullable: false
          field :work_queue_id, -> { Candid::EncounterSummaries::V1::Types::SetFilter }, optional: true, nullable: false
          field :days_in_queue, -> { Candid::EncounterSummaries::V1::Types::IntRangeFilter }, optional: true, nullable: false
          field :tag_ids, -> { Candid::EncounterSummaries::V1::Types::SetFilter }, optional: true, nullable: false
          field :static_view_id, -> { String }, optional: true, nullable: false
          field :task_type, -> { Candid::EncounterSummaries::V1::Types::SetFilter }, optional: true, nullable: false
          field :task_category, -> { Candid::EncounterSummaries::V1::Types::SetFilter }, optional: true, nullable: false
          field :task_assignee, -> { Candid::EncounterSummaries::V1::Types::UuidSetFilter }, optional: true, nullable: false
          field :task_description, -> { Candid::EncounterSummaries::V1::Types::StringFilter }, optional: true, nullable: false
          field :date_of_service, -> { Candid::EncounterSummaries::V1::Types::DateRangeFilter }, optional: true, nullable: false
          field :timely_filing_deadline, -> { Candid::EncounterSummaries::V1::Types::DateRangeFilter }, optional: true, nullable: false
          field :claim_updated_at, -> { Candid::EncounterSummaries::V1::Types::DatetimeRangeFilter }, optional: true, nullable: false
          field :sum_charge_amount_cents, -> { Candid::EncounterSummaries::V1::Types::IntRangeFilter }, optional: true, nullable: false
          field :sum_allowed_amount_cents, -> { Candid::EncounterSummaries::V1::Types::IntRangeFilter }, optional: true, nullable: false
          field :sum_paid_amount_cents, -> { Candid::EncounterSummaries::V1::Types::IntRangeFilter }, optional: true, nullable: false
          field :sum_patient_responsibility_cents, -> { Candid::EncounterSummaries::V1::Types::IntRangeFilter }, optional: true, nullable: false
          field :claim_balance, -> { Candid::EncounterSummaries::V1::Types::IntRangeFilter }, optional: true, nullable: false
          field :diagnosis_codes, -> { Candid::EncounterSummaries::V1::Types::StringFilter }, optional: true, nullable: false
          field :has_secondary_insurance, -> { Candid::EncounterSummaries::V1::Types::BooleanFilter }, optional: true, nullable: false
          field :has_unassigned_tasks, -> { Candid::EncounterSummaries::V1::Types::BooleanFilter }, optional: true, nullable: false
          field :is_snoozed, -> { Candid::EncounterSummaries::V1::Types::BooleanFilter }, optional: true, nullable: false
          field :has_been_submitted, -> { Candid::EncounterSummaries::V1::Types::BooleanFilter }, optional: true, nullable: false
          field :in_work_queue, -> { Candid::EncounterSummaries::V1::Types::BooleanFilter }, optional: true, nullable: false
          field :non_insurance_payer_category, -> { Candid::EncounterSummaries::V1::Types::StringFilter }, optional: true, nullable: false
          field :non_insurance_payer_name, -> { Candid::EncounterSummaries::V1::Types::StringFilter }, optional: true, nullable: false
          field :type_of_bill, -> { Candid::EncounterSummaries::V1::Types::SetFilter }, optional: true, nullable: false
          field :place_of_service_code, -> { Candid::EncounterSummaries::V1::Types::SetFilter }, optional: true, nullable: false
          field :service_line_place_of_service_code, -> { Candid::EncounterSummaries::V1::Types::SetFilter }, optional: true, nullable: false
        end
      end
    end
  end
end
