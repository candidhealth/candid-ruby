# frozen_string_literal: true

module CandidApiClient
  class Commons
    class PatientRelationshipToInsuredCodeAll
      SPOUSE = "01"
      GRANDPARENT = "04"
      GRANDCHILD = "05"
      NIECE_NEPHEW = "07"
      FOSTER_CHILD = "10"
      WARD_OF_THE_COURT = "15"
      STEPCHILD = "17"
      SELF = "18"
      CHILD = "19"
      EMPLOYEE = "20"
      UNKNOWN = "21"
      HANDICAPPED_DEPENDENT = "22"
      SPONSORED_DEPENDENT = "23"
      DEPENDENT_OF_MINOR_DEPENDENT = "24"
      SIGNIFICANT_OTHER = "29"
      MOTHER = "32"
      FATHER = "33"
      EMANCIPATED_MINOR = "36"
      ORGAN_DONOR = "39"
      CADAVER_DONOR = "40"
      INJURED_PLAINTIFF = "41"
      CHILD_NO_FINANCIAL_RESPONSIBILITY = "43"
      LIFE_PARTNER = "53"
      OTHER_RELATIONSHIP = "G8"
    end
  end
end
