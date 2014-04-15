require 'sinatra'
require 'mandrill'

post '/contact' do
  #MANDILL_APIKEY env var must be set
  m = Mandrill::API.new
  message = {
    :subject => 'Streamkeys contact form',
    :from_name => 'Streamkeys',
    :text => "Url: #{params[:url]}\nMessage: #{params[:message]}",
    :to => [
      {
        :email => 'minilogo@gmail.com',
        :name => 'Alex'
      }
    ],
    :from_email => 'alex@aegabriel.com'
  }
  sending = m.messages.send message
  halt 200
end