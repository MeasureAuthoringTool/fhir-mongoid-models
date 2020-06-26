module FHIR
  # fhir/operation_outcome_issue.rb
  class OperationOutcomeIssue < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'OperationOutcomeIssue'
    embeds_one :severity, class_name: 'IssueSeverity'
    embeds_one :code, class_name: 'IssueType'
    embeds_one :details, class_name: 'CodeableConcept'
    embeds_one :diagnostics, class_name: 'PrimitiveString'
    embeds_many :location, class_name: 'PrimitiveString'
    embeds_many :expression, class_name: 'PrimitiveString'

    def self.transform_json(json_hash)
      result = OperationOutcomeIssue.new
      result['severity'] = IssueSeverity.transform_json(json_hash['severity']) unless json_hash['severity'].nil?      
      result['code'] = IssueType.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['details'] = CodeableConcept.transform_json(json_hash['details']) unless json_hash['details'].nil?      
      result['diagnostics'] = PrimitiveString.transform_json(json_hash['diagnostics'], json_hash['_diagnostics']) unless json_hash['diagnostics'].nil?      
      result['location'] = json_hash['location'].each_with_index.map do |var, i|
        extension_hash = json_hash['_location'] && json_hash['_location'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['location'].nil?
      result['expression'] = json_hash['expression'].each_with_index.map do |var, i|
        extension_hash = json_hash['_expression'] && json_hash['_expression'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['expression'].nil?

      result
    end
  end
end
