namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    BrazilianState.create!(description: 'CE')
    BrazilianState.create!(description: 'SP')
    
    show_spinner("Criando o Administrador padrão...") { %x(rails dev:add_default_admin) }
    show_spinner("Criando o Usuário padrão...") { %x(rails dev:add_default_user) }
    if Rails.env.development?
      # show_spinner("Apagando BD...") { %x(rails db:drop) }
      # show_spinner("Criando BD...") { %x(rails db:create) }
      # show_spinner("Migrando BD...") { %x(rails db:migrate) }
    
    
  
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end
  
  
  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    Lawyer.create!(
      email: 'ce@admin.com',
      password: 123456,
      password_confirmation: 123456,
      brazilian_state_id: 1
    )
    Lawyer.create!(
      email: 'sp@admin.com',
      password: 123456,
      password_confirmation: 123456,
      brazilian_state_id: 2
    )
  end

  desc "Adiciona o usuário padrão"
  task add_default_user: :environment do
    User.create!(
      email: 'ce@user.com',
      password: 123456,
      password_confirmation: 123456,
      brazilian_state_id: 1
    )
    User.create!(
      email: 'sp@user.com',
      password: 123456,
      password_confirmation: 123456,
      brazilian_state_id: 2
    )
  end
end

private
  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end