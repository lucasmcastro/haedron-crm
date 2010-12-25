blueprint :admin do
    User.blueprint :email => 'admin@example.com', :password => 'administrator'
end

blueprint :apple do
    User.blueprint :species => 'apple'
end