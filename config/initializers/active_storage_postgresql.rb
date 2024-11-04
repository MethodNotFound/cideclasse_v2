# MONEKY PATHCING
Rails.configuration.to_prepare do
    ActiveStorage::PostgresqlController.class_eval do

        private
     
          def decode_verified_key
            key = ActiveStorage.verifier.verified(params[:encoded_key], purpose: :blob_key)
            if key.is_a?(Hash)
                key = key.with_indifferent_access
            end
            key
          end
      
      
          def decode_verified_token
            token = ActiveStorage.verifier.verified(params[:encoded_token], purpose: :blob_token)
            if token.is_a?(Hash)
                token = token.with_indifferent_access
            end
            token
          end
      
    end
end
