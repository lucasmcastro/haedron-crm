module ControllerMacros
  def login_admin
    before do
      build :admin # Using blueprints gem for fixtures data
      sign_in @admin
    end
  end
end