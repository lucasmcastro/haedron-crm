class Account < ActiveRecord::Base
  # Brazilian Rails
  usar_como_cnpj :legal_number
  
  # Validações
  validates_presence_of :display_name
end
