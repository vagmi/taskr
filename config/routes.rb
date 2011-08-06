Taskr::Application.routes.draw do

  #/buckets/1/tasks
  #/buckets/1/tasks/pending
  #/buckets/1/tasks/done
  #POST /tasks/1/complete to complete
  resources :buckets, :shallow=>true do 
    resources :tasks do
      collection do
        get 'done'
        get 'pending'
      end
      member do
        post 'complete'
      end
    end
  end
  resources :tasks, :only=>[:index]
end
