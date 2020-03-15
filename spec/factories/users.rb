FactoryBot.define do

  factory :user do
    is_enabled { "true" }
    achievement { "旅見習い" }
    sequence( :name, "user1" )
    profile_image_id { Rack::Test::UploadedFile.new( File.join( Rails.root, 'spec/fixtures/image.jpg' ) ) }
    background_image_id { Rack::Test::UploadedFile.new( File.join( Rails.root, 'spec/fixtures/image.jpg' ) ) }
    introduction { "よろしく" }
    sequence( :email, "test@test.test" )
    password { 111111 }
    password_confirmation { 111111 }
  end
end