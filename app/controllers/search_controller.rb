class SearchController < ApplicationController
  def index
    @members = ServiceFacade.new.affiliation_members(params[:nation])
  end
end