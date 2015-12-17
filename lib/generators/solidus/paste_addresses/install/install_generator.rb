module Solidus
  module PasteAddresses
    module Generators
      class InstallGenerator < Rails::Generators::Base

        def add_javascripts
          append_file 'vendor/assets/javascripts/spree/backend/all.js', "//= require spree/backend/solidus_paste_addresses\n"
        end

        def add_stylesheets
          inject_into_file 'vendor/assets/stylesheets/spree/backend/all.css', " *= require spree/backend/solidus_paste_addresses\n", before: /\*\//, verbose: true
        end

      end
    end
  end
end