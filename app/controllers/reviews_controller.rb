class ReviewsController < ApplicationController

def index
  #this is our list page for our reviews

@number = rand(100)


@reviews = Review.all

end

def new
# the form for adding a new review
  @review = Review.new

end

def create
#take info from the form and add it to the database
@review = Review.new(form_params)


#we wat to check if the model can be saved
#if it is, we're going to the homepage again
#if it isn't, show the new form

if @review.save
  redirect_to root_path
else
  #show the view for new.html.erb
  render "new"
end

end



def show
#indvidual review page

@review = Review.find(params[:id])

end

def destroy
  #find the indvidiaul review
  @review = Review.find(params[:id])

#destroy
@review.destroy

#redirect to the home page
redirect_to root_path

end

def edit
  #find the indvidual review (to edit)
  @review = Review.find(params[:id])

end



def update
  #find the indvidaul review
  @review = Review.find(params[:id])

  #Update with the new info form the form
  if @review.update(form_params)

      #redirect somewhere new
      redirect_to review_path(@review)
else

render "edit"

end


end



def form_params
  params.require(:review).permit(:title, :restaurant, :body, :score, :ambiance)

end

#Test to see if the git hub save works
end
