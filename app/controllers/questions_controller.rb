# Display a list of all questions
get '/questions' do
	@questions = Question.all
	erb :'/questions/index'
end

# QUESTIONS NEW
get '/questions/new' do
  p "*" * 50
  p @user = current_user
  p @question = Question.new
  erb :'questions/new'
end

# QUESTIONS CREATE
post '/questions' do
  p "*" * 50
  p params
  @question = Question.new(params[:question])
  if @question.save
    redirect '/questions'
  else
    @errors = @question.errors.full_messages
    erb :'questions/new'
  end
end

# QUESTIONS SHOW
get '/questions/:id' do
  # Get stuff to show the user
   
  # Get stuff to show the question
  @question = Question.find(params[:id])
  @answers_for_question = Answer.all.where(question_id: params[:id])
  p "*" * 50
  erb :'questions/show'
end

# QUESTIONS EDIT
# get '/questions/:id/edit' do
#   @question = Question.find(params[:id])
#   erb :'questions/edit'
# end


# QUESTIONS UPDATE
# put '/questions/:id' do
#   @question = Question.find(params[:id])
#   @question.update(params[:question])
#   redirect "/questions/#{@question.id}"
# end


# QUESTIONS DESTROY
# delete '/questions/:id' do
#   @question = Question.find(params[:id])
#   @question.destroy
#   redirect "/questions"
# end

