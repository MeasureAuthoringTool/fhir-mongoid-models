module FHIR
  # fhir/specimen.rb
  class Specimen < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :accessionIdentifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::SpecimenStatus'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :receivedTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_many :parent, class_name: 'FHIR::Reference'    
    embeds_many :request, class_name: 'FHIR::Reference'    
    embeds_one :_collection, class_name: 'FHIR::SpecimenCollection'    
    embeds_many :processing, class_name: 'FHIR::SpecimenProcessing'    
    embeds_many :container, class_name: 'FHIR::SpecimenContainer'    
    embeds_many :condition, class_name: 'FHIR::CodeableConcept'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    
    def as_json(*args)
      res = super
      res['collection'] = res.delete('_collection')
      res
    end

    def self.transform_json(json_hash, target = Specimen.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['accessionIdentifier'] = Identifier.transform_json(json_hash['accessionIdentifier']) unless json_hash['accessionIdentifier'].nil?
      result['status'] = SpecimenStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['receivedTime'] = PrimitiveDateTime.transform_json(json_hash['receivedTime'], json_hash['_receivedTime']) unless json_hash['receivedTime'].nil?
      result['parent'] = json_hash['parent'].map { |var| Reference.transform_json(var) } unless json_hash['parent'].nil?
      result['request'] = json_hash['request'].map { |var| Reference.transform_json(var) } unless json_hash['request'].nil?
      result['_collection'] = SpecimenCollection.transform_json(json_hash['collection']) unless json_hash['collection'].nil?
      result['processing'] = json_hash['processing'].map { |var| SpecimenProcessing.transform_json(var) } unless json_hash['processing'].nil?
      result['container'] = json_hash['container'].map { |var| SpecimenContainer.transform_json(var) } unless json_hash['container'].nil?
      result['condition'] = json_hash['condition'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['condition'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?

      result
    end
  end
end
