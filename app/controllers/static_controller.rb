class StaticController < ApplicationController
    skip_before_action :go_home, only: [:home]

    def home
    end
end