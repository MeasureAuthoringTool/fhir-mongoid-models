module FHIR
  # fhir/prod_characteristic.rb
  class ProdCharacteristic < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ProdCharacteristic'
    embeds_one :height, class_name: 'Quantity'
    embeds_one :width, class_name: 'Quantity'
    embeds_one :depth, class_name: 'Quantity'
    embeds_one :weight, class_name: 'Quantity'
    embeds_one :nominalVolume, class_name: 'Quantity'
    embeds_one :externalDiameter, class_name: 'Quantity'
    embeds_one :shape, class_name: 'PrimitiveString'
    embeds_many :color, class_name: 'PrimitiveString'
    embeds_many :imprint, class_name: 'PrimitiveString'
    embeds_many :image, class_name: 'Attachment'
    embeds_one :scoring, class_name: 'CodeableConcept'

    def self.transform_json(json_hash)
      result = ProdCharacteristic.new
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
