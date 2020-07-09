module FHIR
  # fhir/substance_specification.rb
  class SubstanceSpecification < DomainResource
    include Mongoid::Document
    embeds_one :identifier, class_name: 'FHIR::Identifier'
    embeds_one :type, class_name: 'FHIR::CodeableConcept'
    embeds_one :status, class_name: 'FHIR::CodeableConcept'
    embeds_one :domain, class_name: 'FHIR::CodeableConcept'
    embeds_one :description, class_name: 'FHIR::PrimitiveString'
    embeds_many :source, class_name: 'FHIR::Reference'
    embeds_one :comment, class_name: 'FHIR::PrimitiveString'
    embeds_many :moiety, class_name: 'FHIR::SubstanceSpecificationMoiety'
    embeds_many :property, class_name: 'FHIR::SubstanceSpecificationProperty'
    embeds_one :referenceInformation, class_name: 'FHIR::Reference'
    embeds_one :structure, class_name: 'FHIR::SubstanceSpecificationStructure'
    embeds_many :code, class_name: 'FHIR::SubstanceSpecificationCode'
    embeds_many :name, class_name: 'FHIR::SubstanceSpecificationName'
    embeds_many :molecularWeight, class_name: 'FHIR::SubstanceSpecificationStructureIsotopeMolecularWeight'
    embeds_many :relationship, class_name: 'FHIR::SubstanceSpecificationRelationship'
    embeds_one :nucleicAcid, class_name: 'FHIR::Reference'
    embeds_one :polymer, class_name: 'FHIR::Reference'
    embeds_one :protein, class_name: 'FHIR::Reference'
    embeds_one :sourceMaterial, class_name: 'FHIR::Reference'

    def self.transform_json(json_hash, target = SubstanceSpecification.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['status'] = CodeableConcept.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['domain'] = CodeableConcept.transform_json(json_hash['domain']) unless json_hash['domain'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['source'] = json_hash['source'].map { |var| Reference.transform_json(var) } unless json_hash['source'].nil?
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?      
      result['moiety'] = json_hash['moiety'].map { |var| SubstanceSpecificationMoiety.transform_json(var) } unless json_hash['moiety'].nil?
      result['property'] = json_hash['property'].map { |var| SubstanceSpecificationProperty.transform_json(var) } unless json_hash['property'].nil?
      result['referenceInformation'] = Reference.transform_json(json_hash['referenceInformation']) unless json_hash['referenceInformation'].nil?      
      result['structure'] = SubstanceSpecificationStructure.transform_json(json_hash['structure']) unless json_hash['structure'].nil?      
      result['code'] = json_hash['code'].map { |var| SubstanceSpecificationCode.transform_json(var) } unless json_hash['code'].nil?
      result['name'] = json_hash['name'].map { |var| SubstanceSpecificationName.transform_json(var) } unless json_hash['name'].nil?
      result['molecularWeight'] = json_hash['molecularWeight'].map { |var| SubstanceSpecificationStructureIsotopeMolecularWeight.transform_json(var) } unless json_hash['molecularWeight'].nil?
      result['relationship'] = json_hash['relationship'].map { |var| SubstanceSpecificationRelationship.transform_json(var) } unless json_hash['relationship'].nil?
      result['nucleicAcid'] = Reference.transform_json(json_hash['nucleicAcid']) unless json_hash['nucleicAcid'].nil?      
      result['polymer'] = Reference.transform_json(json_hash['polymer']) unless json_hash['polymer'].nil?      
      result['protein'] = Reference.transform_json(json_hash['protein']) unless json_hash['protein'].nil?      
      result['sourceMaterial'] = Reference.transform_json(json_hash['sourceMaterial']) unless json_hash['sourceMaterial'].nil?      

      result
    end
  end
end
