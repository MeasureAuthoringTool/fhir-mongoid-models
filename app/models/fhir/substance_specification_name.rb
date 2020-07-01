module FHIR
  # fhir/substance_specification_name.rb
  class SubstanceSpecificationName < BackboneElement
    include Mongoid::Document
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :status, class_name: 'CodeableConcept'
    embeds_one :preferred, class_name: 'PrimitiveBoolean'
    embeds_many :language, class_name: 'CodeableConcept'
    embeds_many :domain, class_name: 'CodeableConcept'
    embeds_many :jurisdiction, class_name: 'CodeableConcept'
    embeds_many :synonym, class_name: 'SubstanceSpecificationName'
    embeds_many :translation, class_name: 'SubstanceSpecificationName'
    embeds_many :official, class_name: 'SubstanceSpecificationNameOfficial'
    embeds_many :source, class_name: 'Reference'

    def self.transform_json(json_hash, target = SubstanceSpecificationName.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['status'] = CodeableConcept.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['preferred'] = PrimitiveBoolean.transform_json(json_hash['preferred'], json_hash['_preferred']) unless json_hash['preferred'].nil?      
      result['language'] = json_hash['language'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['language'].nil?
      result['domain'] = json_hash['domain'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['domain'].nil?
      result['jurisdiction'] = json_hash['jurisdiction'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['jurisdiction'].nil?
      result['synonym'] = json_hash['synonym'].map { |var| SubstanceSpecificationName.transform_json(var) } unless json_hash['synonym'].nil?
      result['translation'] = json_hash['translation'].map { |var| SubstanceSpecificationName.transform_json(var) } unless json_hash['translation'].nil?
      result['official'] = json_hash['official'].map { |var| SubstanceSpecificationNameOfficial.transform_json(var) } unless json_hash['official'].nil?
      result['source'] = json_hash['source'].map { |var| Reference.transform_json(var) } unless json_hash['source'].nil?

      result
    end
  end
end
