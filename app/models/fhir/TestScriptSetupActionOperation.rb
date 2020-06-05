module FHIR
  class TestScriptSetupActionOperation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptSetupActionOperation'
    embeds_one :type, class_name: 'Coding'
    embeds_one :resource, class_name: 'FHIRDefinedType'
    field :label, type:  # primitive
    embeds_one :_label, class_name: 'Extension'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_one :accept, class_name: 'MimeType'
    embeds_one :contentType, class_name: 'MimeType'
    field :destination, type:  # primitive
    embeds_one :_destination, class_name: 'Extension'
    field :encodeRequestUrl, type:  # primitive
    embeds_one :_encodeRequestUrl, class_name: 'Extension'
    embeds_one :method, class_name: 'TestScriptRequestMethodCode'
    field :origin, type:  # primitive
    embeds_one :_origin, class_name: 'Extension'
    field :params, type:  # primitive
    embeds_one :_params, class_name: 'Extension'
    embeds_many :requestHeader, class_name: 'TestScriptSetupActionOperationRequestHeader'
    field :requestId, type:  # primitive
    embeds_one :_requestId, class_name: 'Extension'
    field :responseId, type:  # primitive
    embeds_one :_responseId, class_name: 'Extension'
    field :sourceId, type:  # primitive
    embeds_one :_sourceId, class_name: 'Extension'
    field :targetId, type:  # primitive
    embeds_one :_targetId, class_name: 'Extension'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
  end
end
