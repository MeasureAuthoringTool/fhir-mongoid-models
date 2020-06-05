module FHIR
  class TestScriptSetupActionAssert < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptSetupActionAssert'
    field :label, type:  # primitive
    embeds_one :_label, class_name: 'Extension'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_one :direction, class_name: 'AssertionDirectionType'
    field :compareToSourceId, type:  # primitive
    embeds_one :_compareToSourceId, class_name: 'Extension'
    field :compareToSourceExpression, type:  # primitive
    embeds_one :_compareToSourceExpression, class_name: 'Extension'
    field :compareToSourcePath, type:  # primitive
    embeds_one :_compareToSourcePath, class_name: 'Extension'
    embeds_one :contentType, class_name: 'MimeType'
    field :expression, type:  # primitive
    embeds_one :_expression, class_name: 'Extension'
    field :headerField, type:  # primitive
    embeds_one :_headerField, class_name: 'Extension'
    field :minimumId, type:  # primitive
    embeds_one :_minimumId, class_name: 'Extension'
    field :navigationLinks, type:  # primitive
    embeds_one :_navigationLinks, class_name: 'Extension'
    embeds_one :operator, class_name: 'AssertionOperatorType'
    field :path, type:  # primitive
    embeds_one :_path, class_name: 'Extension'
    embeds_one :requestMethod, class_name: 'TestScriptRequestMethodCode'
    field :requestURL, type:  # primitive
    embeds_one :_requestURL, class_name: 'Extension'
    embeds_one :resource, class_name: 'FHIRDefinedType'
    embeds_one :response, class_name: 'AssertionResponseTypes'
    field :responseCode, type:  # primitive
    embeds_one :_responseCode, class_name: 'Extension'
    field :sourceId, type:  # primitive
    embeds_one :_sourceId, class_name: 'Extension'
    field :validateProfileId, type:  # primitive
    embeds_one :_validateProfileId, class_name: 'Extension'
    field :value, type:  # primitive
    embeds_one :_value, class_name: 'Extension'
    field :warningOnly, type:  # primitive
    embeds_one :_warningOnly, class_name: 'Extension'
  end
end
