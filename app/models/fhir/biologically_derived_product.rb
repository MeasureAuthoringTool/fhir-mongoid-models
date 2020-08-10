module FHIR
  # fhir/biologically_derived_product.rb
  class BiologicallyDerivedProduct < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :productCategory, class_name: 'FHIR::BiologicallyDerivedProductCategory'    
    embeds_one :productCode, class_name: 'FHIR::CodeableConcept'    
    embeds_one :status, class_name: 'FHIR::BiologicallyDerivedProductStatus'    
    embeds_many :request, class_name: 'FHIR::Reference'    
    embeds_one :quantity, class_name: 'FHIR::PrimitiveInteger'    
    embeds_many :parent, class_name: 'FHIR::Reference'    
    embeds_one :_collection, class_name: 'FHIR::BiologicallyDerivedProductCollection'    
    embeds_many :processing, class_name: 'FHIR::BiologicallyDerivedProductProcessing'    
    embeds_one :manipulation, class_name: 'FHIR::BiologicallyDerivedProductManipulation'    
    embeds_many :storage, class_name: 'FHIR::BiologicallyDerivedProductStorage'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.productCategory.nil? 
        result['productCategory'] = self.productCategory.value
        serialized = Extension.serializePrimitiveExtension(self.productCategory)            
        result['_productCategory'] = serialized unless serialized.nil?
      end
      unless self.productCode.nil? 
        result['productCode'] = self.productCode.as_json(*args)
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.request.nil?  || !self.request.any? 
        result['request'] = self.request.map{ |x| x.as_json(*args) }
      end
      unless self.quantity.nil? 
        result['quantity'] = self.quantity.value
        serialized = Extension.serializePrimitiveExtension(self.quantity)            
        result['_quantity'] = serialized unless serialized.nil?
      end
      unless self.parent.nil?  || !self.parent.any? 
        result['parent'] = self.parent.map{ |x| x.as_json(*args) }
      end
      unless self.collection.nil? 
        result['collection'] = self.collection.as_json(*args)
      end
        result['collection'] = result.delete('_collection')
      unless self.processing.nil?  || !self.processing.any? 
        result['processing'] = self.processing.map{ |x| x.as_json(*args) }
      end
      unless self.manipulation.nil? 
        result['manipulation'] = self.manipulation.as_json(*args)
      end
      unless self.storage.nil?  || !self.storage.any? 
        result['storage'] = self.storage.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = BiologicallyDerivedProduct.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['productCategory'] = BiologicallyDerivedProductCategory.transform_json(json_hash['productCategory'], json_hash['_productCategory']) unless json_hash['productCategory'].nil?
      result['productCode'] = CodeableConcept.transform_json(json_hash['productCode']) unless json_hash['productCode'].nil?
      result['status'] = BiologicallyDerivedProductStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['request'] = json_hash['request'].map { |var| Reference.transform_json(var) } unless json_hash['request'].nil?
      result['quantity'] = PrimitiveInteger.transform_json(json_hash['quantity'], json_hash['_quantity']) unless json_hash['quantity'].nil?
      result['parent'] = json_hash['parent'].map { |var| Reference.transform_json(var) } unless json_hash['parent'].nil?
      result['_collection'] = BiologicallyDerivedProductCollection.transform_json(json_hash['collection']) unless json_hash['collection'].nil?
      result['processing'] = json_hash['processing'].map { |var| BiologicallyDerivedProductProcessing.transform_json(var) } unless json_hash['processing'].nil?
      result['manipulation'] = BiologicallyDerivedProductManipulation.transform_json(json_hash['manipulation']) unless json_hash['manipulation'].nil?
      result['storage'] = json_hash['storage'].map { |var| BiologicallyDerivedProductStorage.transform_json(var) } unless json_hash['storage'].nil?

      result
    end
  end
end
