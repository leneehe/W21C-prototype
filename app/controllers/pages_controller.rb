class PagesController < ApplicationController
  layout 'main/layout-blank'

  def index
    @title = 'Home'
  end
  def plan
    @title = 'Plan'
  end
  def goal_centre
    @title = 'Goal Centre'
  end
  def track
    @title = 'Track'
  end
  def learn
    @title = 'Learn'
  end
  def resources
    @title = 'Resources'
  end
  def about
    @title = 'About'
  end
  def signup
    @title = 'Signup'
  end
  def login
    @title = 'Login'
  end
end
