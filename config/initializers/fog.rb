CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'                        # required
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     Rails.application.credentials[:s3][:aws_access_key_id],                        # required
      aws_secret_access_key: Rails.application.credentials[:s3][:aws_secret_access_key],                        # required
      region:                'ap-northeast-2',             # optional, defaults to 'us-east-1'
    }
    config.fog_directory  = 'emart-auth-storage'            # required
  end