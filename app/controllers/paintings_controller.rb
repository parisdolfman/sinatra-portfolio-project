class PaintingsController < ApplicationController

    get '/index' do #read 
      if logged_in?
        @paintings = Painting.all
        erb :'paintings/index'
      else
        redirect to '/login'
      end
    end
  
    get "/new" do  #create
      erb :'paintings/new'
    end
  
  
    post '/index' do
      if logged_in?
        if params[:painting_name] == ""
          redirect to "/new"
        else
          @painting = current_user.paintings.build(painting_name: params[:painting_name], year: params[:year])
          if @painting.save
            redirect to "/paintings/#{@painting.id}"
          else
            redirect to "/new"
          end
        end
      else
        redirect to '/login'
      end
    end
  
  
      get '/paintings/:id' do
        if logged_in?
          @painting = Painting.find_by_id(params[:id])
          erb :'paintings/show'
        else
          redirect to '/login'
        end
      end
  
  
  
      get "/paintings/:id/edit" do #update 
        if logged_in?
            @painting = Painting.find_by_id(params[:id])
          if @painting && @painting.user == current_user
            erb :'paintings/edit'
          else
          redirect to '/index'
          end
        else
          redirect to '/login'
        end
      end
  
  
      patch '/paintings/:id' do
        if logged_in?
          if params[:painting_name] == ""
            redirect to "/paintings/#{params[:id]}/edit"
          else
            @painting = Painting.find_by_id(params[:id])
            if @painting && @painting.user == current_user
              if @painting.update(painting_name: params[:painting_name], year: params[:year])
                redirect to "/paintings/#{@painting.id}"
              else
                redirect to "/paintings/#{@painting.id}/edit"
              end
            else
              redirect to '/index'
            end
          end
        else
          redirect to '/login'
        end
      end
  
      delete '/paintings/:id/delete' do #destroy
        if logged_in?
          @painting = Painting.find_by_id(params[:id])
          if @painting && @painting.user == current_user
            @painting.delete
          end
          redirect to '/index'
        else
          redirect to '/login'
        end
      end
  end
  