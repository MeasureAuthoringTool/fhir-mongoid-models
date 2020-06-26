RSpec.describe FHIR::Library do
  it 'Should be able to construct a library from library resource' do
    library_json = File.open(File.join(File.dirname(__FILE__), '../fixture/library.json'))
    library_hash = JSON.load library_json
    library = FHIR::Library.transform_json library_hash
    expect do
      library.save!
    end.to_not raise_error
    expect(library._id).to be_present
    expect(library.name.value).to eq library_hash['name']
  end
end
