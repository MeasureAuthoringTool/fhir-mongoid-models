module FHIR
  # fhir/vision_prescription_lens_specification.rb
  class VisionPrescriptionLensSpecification < BackboneElement
    include Mongoid::Document
    embeds_one :product, class_name: 'FHIR::CodeableConcept'    
    embeds_one :eye, class_name: 'FHIR::VisionEyes'    
    embeds_one :sphere, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :cylinder, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :axis, class_name: 'FHIR::PrimitiveInteger'    
    embeds_many :prism, class_name: 'FHIR::VisionPrescriptionLensSpecificationPrism'    
    embeds_one :add, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :power, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :backCurve, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :diameter, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :duration, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :color, class_name: 'FHIR::PrimitiveString'    
    embeds_one :brand, class_name: 'FHIR::PrimitiveString'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    
    def as_json(*args)
      result = super      
      unless self.product.nil? 
        result['product'] = self.product.as_json(*args)
      end
      unless self.eye.nil? 
        result['eye'] = self.eye.value
        serialized = Extension.serializePrimitiveExtension(self.eye)            
        result['_eye'] = serialized unless serialized.nil?
      end
      unless self.sphere.nil? 
        result['sphere'] = self.sphere.value
        serialized = Extension.serializePrimitiveExtension(self.sphere)            
        result['_sphere'] = serialized unless serialized.nil?
      end
      unless self.cylinder.nil? 
        result['cylinder'] = self.cylinder.value
        serialized = Extension.serializePrimitiveExtension(self.cylinder)            
        result['_cylinder'] = serialized unless serialized.nil?
      end
      unless self.axis.nil? 
        result['axis'] = self.axis.value
        serialized = Extension.serializePrimitiveExtension(self.axis)            
        result['_axis'] = serialized unless serialized.nil?
      end
      unless self.prism.nil?  || !self.prism.any? 
        result['prism'] = self.prism.map{ |x| x.as_json(*args) }
      end
      unless self.add.nil? 
        result['add'] = self.add.value
        serialized = Extension.serializePrimitiveExtension(self.add)            
        result['_add'] = serialized unless serialized.nil?
      end
      unless self.power.nil? 
        result['power'] = self.power.value
        serialized = Extension.serializePrimitiveExtension(self.power)            
        result['_power'] = serialized unless serialized.nil?
      end
      unless self.backCurve.nil? 
        result['backCurve'] = self.backCurve.value
        serialized = Extension.serializePrimitiveExtension(self.backCurve)            
        result['_backCurve'] = serialized unless serialized.nil?
      end
      unless self.diameter.nil? 
        result['diameter'] = self.diameter.value
        serialized = Extension.serializePrimitiveExtension(self.diameter)            
        result['_diameter'] = serialized unless serialized.nil?
      end
      unless self.duration.nil? 
        result['duration'] = self.duration.as_json(*args)
      end
      unless self.color.nil? 
        result['color'] = self.color.value
        serialized = Extension.serializePrimitiveExtension(self.color)            
        result['_color'] = serialized unless serialized.nil?
      end
      unless self.brand.nil? 
        result['brand'] = self.brand.value
        serialized = Extension.serializePrimitiveExtension(self.brand)            
        result['_brand'] = serialized unless serialized.nil?
      end
      unless self.note.nil?  || !self.note.any? 
        result['note'] = self.note.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = VisionPrescriptionLensSpecification.new)
      result = self.superclass.transform_json(json_hash, target)
      result['product'] = CodeableConcept.transform_json(json_hash['product']) unless json_hash['product'].nil?
      result['eye'] = VisionEyes.transform_json(json_hash['eye'], json_hash['_eye']) unless json_hash['eye'].nil?
      result['sphere'] = PrimitiveDecimal.transform_json(json_hash['sphere'], json_hash['_sphere']) unless json_hash['sphere'].nil?
      result['cylinder'] = PrimitiveDecimal.transform_json(json_hash['cylinder'], json_hash['_cylinder']) unless json_hash['cylinder'].nil?
      result['axis'] = PrimitiveInteger.transform_json(json_hash['axis'], json_hash['_axis']) unless json_hash['axis'].nil?
      result['prism'] = json_hash['prism'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          VisionPrescriptionLensSpecificationPrism.transform_json(var) 
        end
      } unless json_hash['prism'].nil?
      result['add'] = PrimitiveDecimal.transform_json(json_hash['add'], json_hash['_add']) unless json_hash['add'].nil?
      result['power'] = PrimitiveDecimal.transform_json(json_hash['power'], json_hash['_power']) unless json_hash['power'].nil?
      result['backCurve'] = PrimitiveDecimal.transform_json(json_hash['backCurve'], json_hash['_backCurve']) unless json_hash['backCurve'].nil?
      result['diameter'] = PrimitiveDecimal.transform_json(json_hash['diameter'], json_hash['_diameter']) unless json_hash['diameter'].nil?
      result['duration'] = SimpleQuantity.transform_json(json_hash['duration']) unless json_hash['duration'].nil?
      result['color'] = PrimitiveString.transform_json(json_hash['color'], json_hash['_color']) unless json_hash['color'].nil?
      result['brand'] = PrimitiveString.transform_json(json_hash['brand'], json_hash['_brand']) unless json_hash['brand'].nil?
      result['note'] = json_hash['note'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Annotation.transform_json(var) 
        end
      } unless json_hash['note'].nil?

      result
    end
  end
end
