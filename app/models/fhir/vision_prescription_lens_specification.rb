module FHIR
  # fhir/vision_prescription_lens_specification.rb
  class VisionPrescriptionLensSpecification < BackboneElement
    include Mongoid::Document
    embeds_one :product, class_name: 'CodeableConcept'
    embeds_one :eye, class_name: 'VisionEyes'
    embeds_one :sphere, class_name: 'PrimitiveDecimal'
    embeds_one :cylinder, class_name: 'PrimitiveDecimal'
    embeds_one :axis, class_name: 'PrimitiveInteger'
    embeds_many :prism, class_name: 'VisionPrescriptionLensSpecificationPrism'
    embeds_one :add, class_name: 'PrimitiveDecimal'
    embeds_one :power, class_name: 'PrimitiveDecimal'
    embeds_one :backCurve, class_name: 'PrimitiveDecimal'
    embeds_one :diameter, class_name: 'PrimitiveDecimal'
    embeds_one :duration, class_name: 'SimpleQuantity'
    embeds_one :color, class_name: 'PrimitiveString'
    embeds_one :brand, class_name: 'PrimitiveString'
    embeds_many :note, class_name: 'Annotation'

    def self.transform_json(json_hash, target = VisionPrescriptionLensSpecification.new)
      result = self.superclass.transform_json(json_hash, target)
      result['product'] = CodeableConcept.transform_json(json_hash['product']) unless json_hash['product'].nil?      
      result['eye'] = VisionEyes.transform_json(json_hash['eye']) unless json_hash['eye'].nil?      
      result['sphere'] = PrimitiveDecimal.transform_json(json_hash['sphere'], json_hash['_sphere']) unless json_hash['sphere'].nil?      
      result['cylinder'] = PrimitiveDecimal.transform_json(json_hash['cylinder'], json_hash['_cylinder']) unless json_hash['cylinder'].nil?      
      result['axis'] = PrimitiveInteger.transform_json(json_hash['axis'], json_hash['_axis']) unless json_hash['axis'].nil?      
      result['prism'] = json_hash['prism'].map { |var| VisionPrescriptionLensSpecificationPrism.transform_json(var) } unless json_hash['prism'].nil?
      result['add'] = PrimitiveDecimal.transform_json(json_hash['add'], json_hash['_add']) unless json_hash['add'].nil?      
      result['power'] = PrimitiveDecimal.transform_json(json_hash['power'], json_hash['_power']) unless json_hash['power'].nil?      
      result['backCurve'] = PrimitiveDecimal.transform_json(json_hash['backCurve'], json_hash['_backCurve']) unless json_hash['backCurve'].nil?      
      result['diameter'] = PrimitiveDecimal.transform_json(json_hash['diameter'], json_hash['_diameter']) unless json_hash['diameter'].nil?      
      result['duration'] = SimpleQuantity.transform_json(json_hash['duration']) unless json_hash['duration'].nil?      
      result['color'] = PrimitiveString.transform_json(json_hash['color'], json_hash['_color']) unless json_hash['color'].nil?      
      result['brand'] = PrimitiveString.transform_json(json_hash['brand'], json_hash['_brand']) unless json_hash['brand'].nil?      
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?

      result
    end
  end
end
