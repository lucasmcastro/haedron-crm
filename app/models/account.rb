class Account < ActiveRecord::Base
  # Brazilian Rails
  usar_como_cnpj :legal_number
  
  # Validações
  validates_presence_of :display_name
  validates_length_of :display_name, :in => 4..45, :unless => :display_name_is_blank?
  validates_length_of :legal_name, :in => 4..60
  
  # Manager stub for future sake
  def manager
    "Lucas Castro"
  end

  # Creator stub for future sake
  def creator
    "Lucas Castro"
  end
  
  # My own set of Inherited Resources Views rules
  def form_attributes
    [:display_name, :legal_name, :legal_number]  
  end
    
  def main_attribute
    :display_name
  end
  
  def collection_attributes
    [ :legal_number, :manager]
  end
  
  def show_hintable_attributes
    [
      [:created_at, 'Criado em'],
      [:creator, 'Criado por'],
      [:manager, 'Gerenciado por'],
    ]
  end
  
  def show_upper_attributes
    [:legal_name, :legal_number]
  end  
  
  protected
  
  def legal_name_is_blank?
    self.legal_name.blank?
  end

  def display_name_is_blank?
    self.display_name.blank?
  end
end
