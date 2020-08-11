module FHIR
  # fhir/charge_item_definition_property_group.rb
  class ChargeItemDefinitionPropertyGroup < BackboneElement
    include Mongoid::Document
    embeds_many :applicability, class_name: 'FHIR::ChargeItemDefinitionApplicability'    
    embeds_many :priceComponent, class_name: 'FHIR::ChargeItemDefinitionPropertyGroupPriceComponent'    
    
    def as_json(*args)
      result = super      
      unless self.applicability.nil?  || !self.applicability.any? 
        result['applicability'] = self.applicability.map{ |x| x.as_json(*args) }
      end
      unless self.priceComponent.nil?  || !self.priceComponent.any? 
        result['priceComponent'] = self.priceComponent.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ChargeItemDefinitionPropertyGroup.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['applicability'] = json_hash['applicability'].map { |var| ChargeItemDefinitionApplicability.transform_json(var) } unless json_hash['applicability'].nil?
      result['priceComponent'] = json_hash['priceComponent'].map { |var| ChargeItemDefinitionPropertyGroupPriceComponent.transform_json(var) } unless json_hash['priceComponent'].nil?

      result
    end
  end
end
