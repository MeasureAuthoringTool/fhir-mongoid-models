module FHIR
  # fhir/identifier.rb
  class Identifier < Element
    include Mongoid::Document
    embeds_one :use, class_name: 'FHIR::IdentifierUse'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :system, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :value, class_name: 'FHIR::PrimitiveString'    
    embeds_one :period, class_name: 'FHIR::Period'    
    embeds_one :assigner, class_name: 'FHIR::Reference'    

    def self.transform_json(json_hash, target = Identifier.new)
      result = self.superclass.transform_json(json_hash, target)
      result['use'] = IdentifierUse.transform_json(json_hash['use']) unless json_hash['use'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['system'] = PrimitiveUri.transform_json(json_hash['system'], json_hash['_system']) unless json_hash['system'].nil?
      result['value'] = PrimitiveString.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?
      result['assigner'] = Reference.transform_json(json_hash['assigner']) unless json_hash['assigner'].nil?

      result
    end
  end
end
