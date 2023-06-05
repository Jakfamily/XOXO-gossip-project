module Admin
  class DashboardController < ApplicationController
    def index
      @total_users = User.count
      @total_gossips = Gossip.count
    end
  end
end
