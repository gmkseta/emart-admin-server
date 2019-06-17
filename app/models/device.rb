class Device< ActiveRecord::Base
    establish_connection(Rails.env.to_sym)   
    self.table_name = 'devices'
    before_save :generate_device_num, only: [:create]
    
    private

        def generate_device_num
            self.number = SecureRandom.hex(6).upcase if new_record?
        end

end
