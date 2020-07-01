module FHIR
  # fhir/data_requirement.rb
  class DataRequirement < Element
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIRAllTypes'
    embeds_many :profile, class_name: 'PrimitiveCanonical'
    embeds_one :subjectCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :subjectReference, class_name: 'Reference'
    embeds_many :mustSupport, class_name: 'PrimitiveString'
    embeds_many :codeFilter, class_name: 'DataRequirementCodeFilter'
    embeds_many :dateFilter, class_name: 'DataRequirementDateFilter'
    embeds_one :limit, class_name: 'PrimitivePositiveInt'
    embeds_many :sort, class_name: 'DataRequirementSort'

    def self.transform_json(json_hash, target = DataRequirement.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = FHIRAllTypes.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['profile'] = json_hash['profile'].each_with_index.map do |var, i|
        extension_hash = json_hash['_profile'] && json_hash['_profile'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['profile'].nil?
      result['subjectCodeableConcept'] = CodeableConcept.transform_json(json_hash['subjectCodeableConcept']) unless json_hash['subjectCodeableConcept'].nil?      
      result['subjectReference'] = Reference.transform_json(json_hash['subjectReference']) unless json_hash['subjectReference'].nil?      
      result['mustSupport'] = json_hash['mustSupport'].each_with_index.map do |var, i|
        extension_hash = json_hash['_mustSupport'] && json_hash['_mustSupport'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['mustSupport'].nil?
      result['codeFilter'] = json_hash['codeFilter'].map { |var| DataRequirementCodeFilter.transform_json(var) } unless json_hash['codeFilter'].nil?
      result['dateFilter'] = json_hash['dateFilter'].map { |var| DataRequirementDateFilter.transform_json(var) } unless json_hash['dateFilter'].nil?
      result['limit'] = PrimitivePositiveInt.transform_json(json_hash['limit'], json_hash['_limit']) unless json_hash['limit'].nil?      
      result['sort'] = json_hash['sort'].map { |var| DataRequirementSort.transform_json(var) } unless json_hash['sort'].nil?

      result
    end
  end
end
