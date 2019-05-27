class UserAuth < ActiveRecord::Base
    establish_connection(Rails.env.to_sym)   
    self.table_name = 'user_auths'
    belongs_to :user
    mount_uploader :id_card, S3Uploader
    mount_uploader :face_image, S3Uploader
end