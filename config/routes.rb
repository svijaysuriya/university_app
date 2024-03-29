Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to:'pages#about'
  resources :courses
  resources :users, except: [:destroy]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'course_enroll', to: 'student_courses#create'
  # get 'polling', to: 'pages#polling'
  # post 'polling', to: 'pages#post_polling'
  get 'course_questions', to: 'questions#course_questions'
  resources :questions
  resources :answers
  get 'question_vote', to: 'questions#question_vote'
  get 'answer_vote', to: 'questions#answer_vote'
end
