module FHIR
  # fhir/explanation_of_benefit_insurance.rb
  class ExplanationOfBenefitInsurance < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExplanationOfBenefitInsurance'
    embeds_one :focal, class_name: 'PrimitiveBoolean'
    embeds_one :coverage, class_name: 'Reference'
    embeds_many :preAuthRef, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target=ExplanationOfBenefitInsurance.new)
      result = self.superclass.transform_json(json_hash, target)
      result['focal'] = PrimitiveBoolean.transform_json(json_hash['focal'], json_hash['_focal']) unless json_hash['focal'].nil?      
      result['coverage'] = Reference.transform_json(json_hash['coverage']) unless json_hash['coverage'].nil?      
      result['preAuthRef'] = json_hash['preAuthRef'].each_with_index.map do |var, i|
        extension_hash = json_hash['_preAuthRef'] && json_hash['_preAuthRef'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['preAuthRef'].nil?

      result
    end
  end
end
