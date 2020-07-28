module FHIR
  # fhir/basic.rb
  class Basic < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :created, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :author, class_name: 'FHIR::Reference'    

    def self.transform_json(json_hash, target = Basic.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['created'] = PrimitiveDate.transform_json(json_hash['created'], json_hash['_created']) unless json_hash['created'].nil?
      result['author'] = Reference.transform_json(json_hash['author']) unless json_hash['author'].nil?

      result
    end
  end
end
