# frozen_string_literal: true

module Candid
  module Tasks
    module V3
      module Types
        class Task < Internal::Types::Model
          field :task_id, -> { String }, optional: false, nullable: false
          field :encounter_id, -> { String }, optional: false, nullable: false
          field :task_type, -> { Candid::Tasks::Commons::Types::TaskType }, optional: false, nullable: false
          field :description, -> { String }, optional: false, nullable: false
          field :blocks_claim_submission, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :external_id, -> { String }, optional: false, nullable: false
          field :patient_name, -> { String }, optional: false, nullable: false
          field :patient_external_id, -> { String }, optional: false, nullable: false
          field :payer_name, -> { String }, optional: true, nullable: false
          field :payer_id, -> { String }, optional: true, nullable: false
          field :status, -> { Candid::Tasks::Commons::Types::TaskStatus }, optional: false, nullable: false
          field :notes, lambda {
            Internal::Types::Array[Candid::Tasks::V3::Types::TaskNote]
          }, optional: false, nullable: false
          field :created_at, -> { String }, optional: false, nullable: false
          field :updated_at, -> { String }, optional: false, nullable: false
          field :agg_updated_at, -> { String }, optional: false, nullable: false
          field :date_of_service, -> { String }, optional: false, nullable: false
          field :assignments, lambda {
            Internal::Types::Array[Candid::Tasks::V3::Types::TaskAssignment]
          }, optional: false, nullable: false
          field :category, -> { Candid::Tasks::Commons::Types::TaskCategory }, optional: true, nullable: false
          field :configurable_rule_id, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
