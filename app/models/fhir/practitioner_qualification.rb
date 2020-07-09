module FHIR
  # fhir/practitioner_qualification.rb
  class PractitionerQualification < BackboneElement
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_one :code, class_name: 'FHIR::CodeableConcept'
    embeds_one :period, class_name: 'FHIR::Period'
    embeds_one :issuer, class_name: 'FHIR::Reference'

    def self.transform_json(json_hash, target = PractitionerQualification.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      
      result['issuer'] = Reference.transform_json(json_hash['issuer']) unless json_hash['issuer'].nil?      

      result
    end
  end
end
