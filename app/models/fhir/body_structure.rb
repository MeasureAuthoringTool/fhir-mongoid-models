module FHIR
  # fhir/body_structure.rb
  class BodyStructure < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'BodyStructure'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :active, class_name: 'PrimitiveBoolean'
    embeds_one :morphology, class_name: 'CodeableConcept'
    embeds_one :location, class_name: 'CodeableConcept'
    embeds_many :locationQualifier, class_name: 'CodeableConcept'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_many :image, class_name: 'Attachment'
    embeds_one :patient, class_name: 'Reference'

    def self.transform_json(json_hash, target=BodyStructure.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['active'] = PrimitiveBoolean.transform_json(json_hash['active'], json_hash['_active']) unless json_hash['active'].nil?      
      result['morphology'] = CodeableConcept.transform_json(json_hash['morphology']) unless json_hash['morphology'].nil?      
      result['location'] = CodeableConcept.transform_json(json_hash['location']) unless json_hash['location'].nil?      
      result['locationQualifier'] = json_hash['locationQualifier'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['locationQualifier'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['image'] = json_hash['image'].map { |var| Attachment.transform_json(var) } unless json_hash['image'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?      

      result
    end
  end
end
