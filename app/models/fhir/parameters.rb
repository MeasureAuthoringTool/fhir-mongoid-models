module FHIR
  # fhir/parameters.rb
  class Parameters < Resource
    include Mongoid::Document
    embeds_many :parameter, class_name: 'FHIR::ParametersParameter'    
    
    def as_json(*args)
      result = super      
      unless self.parameter.nil?  || !self.parameter.any? 
        result['parameter'] = self.parameter.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Parameters.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['parameter'] = json_hash['parameter'].map { |var| ParametersParameter.transform_json(var) } unless json_hash['parameter'].nil?

      result
    end
  end
end
