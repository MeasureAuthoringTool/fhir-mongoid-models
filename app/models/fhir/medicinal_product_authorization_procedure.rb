module FHIR
  # fhir/medicinal_product_authorization_procedure.rb
  class MedicinalProductAuthorizationProcedure < BackboneElement
    include Mongoid::Document
    embeds_one :identifier, class_name: 'FHIR::Identifier'
    embeds_one :type, class_name: 'FHIR::CodeableConcept'
    embeds_one :datePeriod, class_name: 'FHIR::Period'
    embeds_one :dateDateTime, class_name: 'FHIR::PrimitiveDateTime'
    embeds_many :application, class_name: 'FHIR::MedicinalProductAuthorizationProcedure'

    def self.transform_json(json_hash, target = MedicinalProductAuthorizationProcedure.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['datePeriod'] = Period.transform_json(json_hash['datePeriod']) unless json_hash['datePeriod'].nil?      
      result['dateDateTime'] = PrimitiveDateTime.transform_json(json_hash['dateDateTime'], json_hash['_dateDateTime']) unless json_hash['dateDateTime'].nil?      
      result['application'] = json_hash['application'].map { |var| MedicinalProductAuthorizationProcedure.transform_json(var) } unless json_hash['application'].nil?

      result
    end
  end
end
