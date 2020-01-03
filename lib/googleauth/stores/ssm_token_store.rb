require 'aws-sdk-ssm'
require 'googleauth/token_store'

module Google
  module Auth
    module Stores
      class SSMTokenStore < ::Google::Auth::TokenStore
        def initialize(options = {})
          @path = options.delete(:path)
          if !@path || @path.empty?
            fail ArgumentError, ':path is required'
          end
          @client = create_client(options)
        end

        def load(id)
          @client.get_parameter(name: parameter_name_for(id), with_decryption: true).parameter.value
        rescue Aws::SSM::Errors::ParameterNotFound
          nil
        end

        def store(id, token)
          @client.put_parameter(name: parameter_name_for(id), value: token, type: 'SecureString', overwrite: true)
        end

        def delete(id)
          @client.delete_parameter(name: parameter_name_for(id))
        end

        private
        def create_client(options)
          Aws::SSM::Client.new(options)
        end

        def parameter_name_for(id)
          "#{@path}/#{id}".freeze
        end
      end
    end
  end
end
