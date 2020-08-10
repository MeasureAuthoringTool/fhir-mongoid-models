RSpec.describe FHIR::Bundle do
  it 'Should be able to construct a bundle from a bunle file' do
    ActiveSupport.escape_html_entities_in_json = false
    ActiveSupport.to_time_preserves_timezone = true
    bundle_json = File.open(File.join(File.dirname(__FILE__), '../fixture/EXM104-9.1.000-bundle.json'))
    bundle_hash = JSON.load bundle_json
    bundle = FHIR::Bundle.transform_json bundle_hash
    updated_bundle_json = bundle.to_json
    updated_bundle_hash =  JSON.load updated_bundle_json
    updated_bundle = FHIR::Bundle.transform_json updated_bundle_hash
    expect(updated_bundle).to be_present
      # TODO - Uncomment when:
      #  Timezones are preserved or datetime fields are expressed as strings
      # expect(updated_bundle_hash).to eq bundle_hash
  end
end
