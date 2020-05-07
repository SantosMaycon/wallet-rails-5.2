namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts %x(rails db:drop:_unsafe)
    puts %x(db:create)
    puts %x(db:migrate)
    puts %x(db:seed)
  end
end
