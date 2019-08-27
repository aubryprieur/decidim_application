# frozen_string_literal: true

# Default CarrierWave setup.
#
# CarrierWave.configure do |config|
#   config.permissions = 0o666
#   config.directory_permissions = 0o777
#   config.storage = :file
#   config.enable_processing = !Rails.env.test?
# end

# Setup CarrierWave to use Amazon S3. Add `gem "fog-aws" to your Gemfile.
#
CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                                             # required
  config.fog_credentials = {
    provider:              'AWS',                                             # required
    aws_access_key_id:     ENV["BUCKETEER_AWS_ACCESS_KEY_ID"],     # required
    aws_secret_access_key: ENV["BUCKETEER_AWS_SECRET_ACCESS_KEY"], # required
    region:                'eu-west-1',                                       # optional, defaults to 'us-east-1'
    # host:                  's3.eu-west-1.amazonaws.com',                                  # optional, defaults to nil
    # endpoint:              'https://s3.example.com:8080'                      # optional, defaults to nil
  }
  config.fog_directory  = ENV["BUCKETEER_BUCKET_NAME"]                                # required
  config.fog_public     = true                                               # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
  config.storage = :fog
end



