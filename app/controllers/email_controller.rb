class EmailController < ApplicationController
	def index
		@Emails = Email.all
		
      end  

	def show
		puts "*"*90
	   puts @e = Email.find(params[:id])
	   @e.update(read: true)
		respond_to do |format|
	       format.html{redirect_to root_path}    
	       format.js {}
       	flash[:notice] = "body afficher"
       end
	end

	def create
		@e = Email.new(object: Faker::Book.title,body: Faker::Book.title, read:false)
	 if @e.save
	   respond_to do |format|
	       format.html{redirect_to root_path}    
	       format.js {}
       	flash[:notice] = "email creer"
       end
	 else
	 	flash[:notice] = "echec de la creation"
	 end
	end
	def destroy
		@e =Email.find(params[:id])
		@e.destroy
		
		respond_to do |format|
			format.html{redirect_to root_path}
			format.js{}
			flash[:notice]=" email deleted"
		end 
	end
	
	def update
		puts params[:read]
		@e =Email.find(params[:id])
		if (@e.read == true)
			@e.update(read: false)
		else
			@e.update(read: true)
		end
		respond_to do |format|
	       format.html{redirect_to root_path}    
	       format.js {}
       	end	
	end

end
 