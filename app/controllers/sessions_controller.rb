class SessionsController < ApplicationController
	def new
		redirect_to(root_path) if session[:admin]
	end

	def create
		session[:admin] = true if params[:password] == ENV['IUT_PASSWORD']
		session[:admin] ? redirect_to(root_path) : redirect_to(new_session_path)
	end
end