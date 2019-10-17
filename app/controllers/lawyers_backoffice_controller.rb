class LawyersBackofficeController < ApplicationController
  before_action :authenticate_lawyer!
  layout 'lawyers_backoffice'
end
