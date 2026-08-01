# frozen_string_literal: true

module Candid
  module Users
    module V2
      module Types
        class M2MUserResponse < Internal::Types::Model
          field :client_id, -> { String }, optional: false, nullable: false
          field :client_secret, -> { String }, optional: false, nullable: false
          field :created_at, -> { String }, optional: false, nullable: false
          field :created_by, -> { String }, optional: false, nullable: false
          field :auth_0_user_id, -> { String }, optional: false, nullable: false, api_name: "auth0_user_id"
        end
      end
    end
  end
end
