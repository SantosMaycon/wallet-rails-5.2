namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando DB...") { %x(rails db:drop:_unsafe) }
      show_spinner("Criadando BD...") { %x(db:create) }
      show_spinner("Migrando BD...") { %x(db:migrate) }
      show_spinner("Populando BD...") { %x(db:seed) }
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end
  
  private
  
  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
