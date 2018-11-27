class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  # def home
  #   # @top_guns #coder le top 3 des guns
  # end
end
