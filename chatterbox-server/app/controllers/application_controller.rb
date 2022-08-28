class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  
  get '/messages'do
    messages = Message.all.order(:created_at)
    messages.to_json
  end

  post '/messages' do
    comment = Message.create(body: params[:body], username: params[:username])
    comment.to_json
  end

  patch '/messages/:id' do
    updated_comment = Message.find(params[:id])
    updated_comment.update(body: params[:body])
    updated_comment.to_json
  end

  delete "/messages/:id" do
    bad_comment = Message.find(params[:id])
    bad_comment.destroy
    bad_comment.to_json
  end
end
