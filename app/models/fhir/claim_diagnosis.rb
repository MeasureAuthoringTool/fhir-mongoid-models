module FHIR
  # fhir/claim_diagnosis.rb
  class ClaimDiagnosis < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ClaimDiagnosis'
    embeds_one :sequence, class_name: 'PrimitivePositiveInt'
    embeds_one :diagnosisCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :diagnosisReference, class_name: 'Reference'
    embeds_many :type, class_name: 'CodeableConcept'
    embeds_one :onAdmission, class_name: 'CodeableConcept'
    embeds_one :packageCode, class_name: 'CodeableConcept'

    def self.transform_json(json_hash, target=ClaimDiagnosis.new)
      result = self.superclass.transform_json(json_hash, target)
      result['sequence'] = PrimitivePositiveInt.transform_json(json_hash['sequence'], json_hash['_sequence']) unless json_hash['sequence'].nil?      
      result['diagnosisCodeableConcept'] = CodeableConcept.transform_json(json_hash['diagnosisCodeableConcept']) unless json_hash['diagnosisCodeableConcept'].nil?      
      result['diagnosisReference'] = Reference.transform_json(json_hash['diagnosisReference']) unless json_hash['diagnosisReference'].nil?      
      result['type'] = json_hash['type'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['type'].nil?
      result['onAdmission'] = CodeableConcept.transform_json(json_hash['onAdmission']) unless json_hash['onAdmission'].nil?      
      result['packageCode'] = CodeableConcept.transform_json(json_hash['packageCode']) unless json_hash['packageCode'].nil?      

      result
    end
  end
end
