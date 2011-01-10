class UsersController < InheritedResources::Base
  def update
    update! do |success, failure|
      success.html { redirect_to users_url }
    end
  end

  def create
    create! do |success, failure|
      success.html { redirect_to users_url }
    end
  end
end
