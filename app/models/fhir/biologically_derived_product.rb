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
      res = super
      res['collection'] = res.delete('_collection')
      res
    end

    def self.transform_json(json_hash, target = BiologicallyDerivedProduct.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['productCategory'] = BiologicallyDerivedProductCategory.transform_json(json_hash['productCategory']) unless json_hash['productCategory'].nil?      
      result['productCode'] = CodeableConcept.transform_json(json_hash['productCode']) unless json_hash['productCode'].nil?      
      result['status'] = BiologicallyDerivedProductStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
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
