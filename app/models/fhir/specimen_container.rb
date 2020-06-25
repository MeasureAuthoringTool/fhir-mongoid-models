module FHIR
  # fhir/specimen_container.rb
  class SpecimenContainer < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SpecimenContainer'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :capacity, class_name: 'SimpleQuantity'
    embeds_one :specimenQuantity, class_name: 'SimpleQuantity'
    embeds_one :additiveCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :additiveReference, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = SpecimenContainer.new
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['capacity'] = SimpleQuantity.transform_json(json_hash['capacity']) unless json_hash['capacity'].nil?      
      result['specimenQuantity'] = SimpleQuantity.transform_json(json_hash['specimenQuantity']) unless json_hash['specimenQuantity'].nil?      
      result['additiveCodeableConcept'] = CodeableConcept.transform_json(json_hash['additiveCodeableConcept']) unless json_hash['additiveCodeableConcept'].nil?      
      result['additiveReference'] = Reference.transform_json(json_hash['additiveReference']) unless json_hash['additiveReference'].nil?      

      result
    end
  end
end
