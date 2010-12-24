class Account < ActiveRecord::Base
  # Brazilian Rails
  usar_como_cnpj :legal_number
  
  # Validações
  validates_presence_of :display_name
  
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
end
