namespace :haedron do
  desc 'setup haedron migrating db and creating a default user'
  task :setup => ['db:drop', 'db:create', 'db:migrate', 'environment'] do
    user = User.create! do |u|
      u.email = 'admin@example.com'
      u.password = 'administrator'
      u.password_confirmation = 'administrator'
    end
    puts 'Novo usuário criado!'
    puts 'Login   : ' << user.email
    puts 'Senha: ' << user.password
  end
end
