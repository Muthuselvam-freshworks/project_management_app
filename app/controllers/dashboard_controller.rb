class DashboardController < ApplicationController
    before_action :authenticate_user!
    def index
        @projects_created_by_user = current_user.projects
    @projects_joined_by_user = current_user.joined_projects
    @all_projects = (@projects_created_by_user + @projects_joined_by_user).uniq
      end
end
