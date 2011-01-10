class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable, :confirmable, :recoverable, :registerable and :activatable
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  
  # avoid last user deletion
  before_destroy { |record| return false if User.count < 2  }
  
  def main_attribute
    :email
  end
  
  def form_attributes
    [:email, :password]  
  end

  def collection_attributes
    [ ]
  end
  
  def show_hintable_attributes
    [ ]
  end  
  
  def excluded_attributes
    [
      'encrypted_password',
      'password_salt',
      'reset_password_token',
      'remember_token',
      'remember_created_at',
      'sign_in_count',
      'current_sign_in_at',
      'last_sign_in_at',
      'current_sign_in_ip',
      'last_sign_in_ip',
    ]
  end
  
  def is_simple_object?
    true
  end
  
end
