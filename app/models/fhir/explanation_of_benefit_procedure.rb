module FHIR
  # fhir/explanation_of_benefit_procedure.rb
  class ExplanationOfBenefitProcedure < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExplanationOfBenefitProcedure'
    embeds_one :sequence, class_name: 'PrimitivePositiveInt'
    embeds_many :type, class_name: 'CodeableConcept'
    embeds_one :date, class_name: 'PrimitiveDateTime'
    embeds_one :procedureCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :procedureReference, class_name: 'Reference'
    embeds_many :udi, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = ExplanationOfBenefitProcedure.new
      result['sequence'] = PrimitivePositiveInt.transform_json(json_hash['sequence'], json_hash['_sequence']) unless json_hash['sequence'].nil?      
      result['type'] = json_hash['type'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['type'].nil?
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['procedureCodeableConcept'] = CodeableConcept.transform_json(json_hash['procedureCodeableConcept']) unless json_hash['procedureCodeableConcept'].nil?      
      result['procedureReference'] = Reference.transform_json(json_hash['procedureReference']) unless json_hash['procedureReference'].nil?      
      result['udi'] = json_hash['udi'].map { |var| Reference.transform_json(var) } unless json_hash['udi'].nil?

      result
    end
  end
end
