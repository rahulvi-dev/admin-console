class Admin::DashboardController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  def home

  end

  def tables

  end

end