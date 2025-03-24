# frozen_string_literal: true

require "json"
require_relative "patient_write_off"
require_relative "insurance_write_off"
require_relative "non_insurance_payer_write_off"

module CandidApiClient
  module WriteOffs
    module V1
      module Types
        class WriteOff
          # @return [Object]
          attr_reader :member
          # @return [String]
          attr_reader :discriminant

          private_class_method :new
          alias kind_of? is_a?

          # @param member [Object]
          # @param discriminant [String]
          # @return [CandidApiClient::WriteOffs::V1::Types::WriteOff]
          def initialize(member:, discriminant:)
            @member = member
            @discriminant = discriminant
          end

          # Deserialize a JSON object to an instance of WriteOff
          #
          # @param json_object [String]
          # @return [CandidApiClient::WriteOffs::V1::Types::WriteOff]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            member = case struct.type
                     when "patient"
                       CandidApiClient::WriteOffs::V1::Types::PatientWriteOff.from_json(json_object: json_object)
                     when "insurance"
                       CandidApiClient::WriteOffs::V1::Types::InsuranceWriteOff.from_json(json_object: json_object)
                     when "non_insurance_payer"
                       CandidApiClient::WriteOffs::V1::Types::NonInsurancePayerWriteOff.from_json(json_object: json_object)
                     else
                       CandidApiClient::WriteOffs::V1::Types::PatientWriteOff.from_json(json_object: json_object)
                     end
            new(member: member, discriminant: struct.type)
          end

          # For Union Types, to_json functionality is delegated to the wrapped member.
          #
          # @return [String]
          def to_json(*_args)
            case @discriminant
            when "patient"
              { **@member.to_json, type: @discriminant }.to_json
            when "insurance"
              { **@member.to_json, type: @discriminant }.to_json
            when "non_insurance_payer"
              { **@member.to_json, type: @discriminant }.to_json
            else
              { "type": @discriminant, value: @member }.to_json
            end
            @member.to_json
          end

          # Leveraged for Union-type generation, validate_raw attempts to parse the given
          #  hash and check each fields type against the current object's property
          #  definitions.
          #
          # @param obj [Object]
          # @return [Void]
          def self.validate_raw(obj:)
            case obj.type
            when "patient"
              CandidApiClient::WriteOffs::V1::Types::PatientWriteOff.validate_raw(obj: obj)
            when "insurance"
              CandidApiClient::WriteOffs::V1::Types::InsuranceWriteOff.validate_raw(obj: obj)
            when "non_insurance_payer"
              CandidApiClient::WriteOffs::V1::Types::NonInsurancePayerWriteOff.validate_raw(obj: obj)
            else
              raise("Passed value matched no type within the union, validation failed.")
            end
          end

          # For Union Types, is_a? functionality is delegated to the wrapped member.
          #
          # @param obj [Object]
          # @return [Boolean]
          def is_a?(obj)
            @member.is_a?(obj)
          end

          # @param member [CandidApiClient::WriteOffs::V1::Types::PatientWriteOff]
          # @return [CandidApiClient::WriteOffs::V1::Types::WriteOff]
          def self.patient(member:)
            new(member: member, discriminant: "patient")
          end

          # @param member [CandidApiClient::WriteOffs::V1::Types::InsuranceWriteOff]
          # @return [CandidApiClient::WriteOffs::V1::Types::WriteOff]
          def self.insurance(member:)
            new(member: member, discriminant: "insurance")
          end

          # @param member [CandidApiClient::WriteOffs::V1::Types::NonInsurancePayerWriteOff]
          # @return [CandidApiClient::WriteOffs::V1::Types::WriteOff]
          def self.non_insurance_payer(member:)
            new(member: member, discriminant: "non_insurance_payer")
          end
        end
      end
    end
  end
end
