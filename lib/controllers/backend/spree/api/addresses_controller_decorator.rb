require 'spree/paste_addresses/parser'

Spree::Api::AddressesController.class_eval do

  skip_before_action :find_order, only: [:parse]

  def parse
    @parser = Spree::PasteAddresses::Parser.new(params[:text])
    respond_with(@parser.to_h)
  end
end
