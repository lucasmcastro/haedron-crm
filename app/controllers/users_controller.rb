class UsersController < InheritedResources::Base
  def update
    super do |format|
      format.html { redirect_to users_url }
    end
  end

  def create
    super do |format|
      format.html { redirect_to users_url }
    end
  end
end
