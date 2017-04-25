require "rails_helper"
require 'carrierwave/test/matchers'

describe AvatarUploader do
  include CarrierWave::Test::Matchers

  let(:user) { FactoryGirl.create(:user) }

  let(:uploader) { AvatarUploader.new(user, :avatar) }

  before do
    AvatarUploader.enable_processing = true
    File.open("app/assets/images/fallback/default.jpg") { |f| uploader.store!(f) }
  end

  after do
    AvatarUploader.enable_processing = false
    uploader.remove!
  end

  it "has the correct format" do
    expect(uploader.filename).to eq("default.jpg")
    expect(uploader.content_type).to eq("image/jpeg")
  end
end
