module FHIR
  # fhir/prod_characteristic.rb
  class ProdCharacteristic < BackboneElement
    include Mongoid::Document
    embeds_one :height, class_name: 'FHIR::Quantity'    
    embeds_one :width, class_name: 'FHIR::Quantity'    
    embeds_one :depth, class_name: 'FHIR::Quantity'    
    embeds_one :weight, class_name: 'FHIR::Quantity'    
    embeds_one :nominalVolume, class_name: 'FHIR::Quantity'    
    embeds_one :externalDiameter, class_name: 'FHIR::Quantity'    
    embeds_one :shape, class_name: 'FHIR::PrimitiveString'    
    embeds_many :color, class_name: 'FHIR::PrimitiveString'    
    embeds_many :imprint, class_name: 'FHIR::PrimitiveString'    
    embeds_many :image, class_name: 'FHIR::Attachment'    
    embeds_one :scoring, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.height.nil? 
        result['height'] = self.height.as_json(*args)
      end
      unless self.width.nil? 
        result['width'] = self.width.as_json(*args)
      end
      unless self.depth.nil? 
        result['depth'] = self.depth.as_json(*args)
      end
      unless self.weight.nil? 
        result['weight'] = self.weight.as_json(*args)
      end
      unless self.nominalVolume.nil? 
        result['nominalVolume'] = self.nominalVolume.as_json(*args)
      end
      unless self.externalDiameter.nil? 
        result['externalDiameter'] = self.externalDiameter.as_json(*args)
      end
      unless self.shape.nil? 
        result['shape'] = self.shape.value
        serialized = Extension.serializePrimitiveExtension(self.shape)            
        result['_shape'] = serialized unless serialized.nil?
      end
      unless self.color.nil?  || !self.color.any? 
        result['color'] = self.color.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.color)                              
        result['_color'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.imprint.nil?  || !self.imprint.any? 
        result['imprint'] = self.imprint.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.imprint)                              
        result['_imprint'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.image.nil?  || !self.image.any? 
        result['image'] = self.image.map{ |x| x.as_json(*args) }
      end
      unless self.scoring.nil? 
        result['scoring'] = self.scoring.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ProdCharacteristic.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['height'] = Quantity.transform_json(json_hash['height']) unless json_hash['height'].nil?
      result['width'] = Quantity.transform_json(json_hash['width']) unless json_hash['width'].nil?
      result['depth'] = Quantity.transform_json(json_hash['depth']) unless json_hash['depth'].nil?
      result['weight'] = Quantity.transform_json(json_hash['weight']) unless json_hash['weight'].nil?
      result['nominalVolume'] = Quantity.transform_json(json_hash['nominalVolume']) unless json_hash['nominalVolume'].nil?
      result['externalDiameter'] = Quantity.transform_json(json_hash['externalDiameter']) unless json_hash['externalDiameter'].nil?
      result['shape'] = PrimitiveString.transform_json(json_hash['shape'], json_hash['_shape']) unless json_hash['shape'].nil?
      result['color'] = json_hash['color'].each_with_index.map do |var, i|
        extension_hash = json_hash['_color'] && json_hash['_color'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['color'].nil?
      result['imprint'] = json_hash['imprint'].each_with_index.map do |var, i|
        extension_hash = json_hash['_imprint'] && json_hash['_imprint'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['imprint'].nil?
      result['image'] = json_hash['image'].map { |var| Attachment.transform_json(var) } unless json_hash['image'].nil?
      result['scoring'] = CodeableConcept.transform_json(json_hash['scoring']) unless json_hash['scoring'].nil?

      result
    end
  end
end
