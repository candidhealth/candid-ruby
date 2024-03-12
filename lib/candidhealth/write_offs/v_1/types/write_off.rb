# frozen_string_literal: true

require "json"
require_relative "patient_write_off"
require_relative "insurance_write_off"

module CandidApiClient
  module WriteOffs
    module V1
      class WriteOff
        attr_reader :member, :discriminant

        private_class_method :new
        alias kind_of? is_a?
        # @param member [Object]
        # @param discriminant [String]
        # @return [WriteOffs::V1::WriteOff]
        def initialize(member:, discriminant:)
          # @type [Object]
          @member = member
          # @type [String]
          @discriminant = discriminant
        end

        # Deserialize a JSON object to an instance of WriteOff
        #
        # @param json_object [JSON]
        # @return [WriteOffs::V1::WriteOff]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          member = case struct.type
                   when "patient"
                     WriteOffs::V1::PatientWriteOff.from_json(json_object: json_object)
                   when "insurance"
                     WriteOffs::V1::InsuranceWriteOff.from_json(json_object: json_object)
                   else
                     WriteOffs::V1::PatientWriteOff.from_json(json_object: json_object)
                   end
          new(member: member, discriminant: struct.type)
        end

        # For Union Types, to_json functionality is delegated to the wrapped member.
        #
        # @return [JSON]
        def to_json(*_args)
          case @discriminant
          when "patient"
            { **@member.to_json, type: @discriminant }.to_json
          when "insurance"
            { **@member.to_json, type: @discriminant }.to_json
          else
            { "type": @discriminant, value: @member }.to_json
          end
          @member.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          case obj.type
          when "patient"
            WriteOffs::V1::PatientWriteOff.validate_raw(obj: obj)
          when "insurance"
            WriteOffs::V1::InsuranceWriteOff.validate_raw(obj: obj)
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

        # @param member [WriteOffs::V1::PatientWriteOff]
        # @return [WriteOffs::V1::WriteOff]
        def self.patient(member:)
          new(member: member, discriminant: "patient")
        end

        # @param member [WriteOffs::V1::InsuranceWriteOff]
        # @return [WriteOffs::V1::WriteOff]
        def self.insurance(member:)
          new(member: member, discriminant: "insurance")
        end
      end
    end
  end
end
