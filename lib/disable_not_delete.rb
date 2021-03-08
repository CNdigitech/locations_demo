module DisableNotDelete
    def destroy
        # unless self.respond_to? :deleted
        #     raise MissingMigrationException
        # end
        if self.active_status
            self.active_status = false
            self.save(validate: false)
           
        else
            self.active_status = true
            self.save(validate: false)
           
        end

        run_callbacks(:destroy) do
            self.update_attribute :active_status, false
        end
    end



    def delete
        self.destroy
    end



    # def self.included(base)
    #     base.class_eval do
    #         default_scope where( :del_status => false )
    #     end
    # end
end
