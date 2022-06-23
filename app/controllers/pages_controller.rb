class PagesController < ApplicationController
  skip_before_action :require_user, only: [:about,:home]
  def home
  end
  def about
  end
  def polling
  end
  def post_polling
    byebug
  end
end