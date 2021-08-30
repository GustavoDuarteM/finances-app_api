# frozen_string_literal: true

namespace :dev do
  desc 'Configure the development environment '
  task setup: :environment do
    return if Rails.env.development?

    show_spinner('Deleting Databases...') { `rails db:drop` }
    show_spinner('Creating Database...') { `rails db:create` }
    show_spinner('Migrating Database...') { `rails db:migrate` }
    show_spinner('Add users...') { `rails dev:add_user` }
    show_spinner('Add monthly operation...') { `rails dev:add_monthly_operations` }
  end

  desc 'Inserting User'
  task add_user: :environment do
    FactoryBot.create(:user, email: 'user@email.com', password: '123456')
  end

  desc 'Inserting monthly operation '
  task add_monthly_operations: :environment do
    user = User.last
    FactoryBot.create_list(:monthly_operation, rand(1...200), user: user)
  end

  private

  def show_spinner(msg_start, msg_end = 'finished')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}..")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end}!)")
  end
end
