class UsersController < InheritedResources::Base
  # def update
  #   super do |format|
  #     format.html { redirect_to users_url }
  #   end
  # end

  def update
    @resource = User.find_by_id(params[:id])
    @resource.update_attributes(params[:user])
    update! do |success, failure|
      success.html { redirect_to users_path }
    end
  end
end
