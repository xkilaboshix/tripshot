FactoryBot.define do
  
  factory :post do
    image_id { Rack::Test::UploadedFile.new( File.join( Rails.root, 'spec/fixtures/image.jpg' ) ) }
    body { "カメです。" }
  end
end