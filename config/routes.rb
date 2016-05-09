Rails.application.routes.draw do
  get 'users/all' => 'user#all', format: :json
  get 'users/new' => 'user#new'
  post 'users/create' => 'user#create', format: :json
  get 'users/:id' => 'user#show', format: :json
  get 'users/:id/update' => 'user#update', format: :json, as: :users_update
  delete 'users/:id' => 'user#delete', as: :users_delete

  get 'deputies/all' => 'deputy#all', format: :json
  get 'deputies/:id' => 'deputy#show', format: :json
  delete 'deputies/:id' => 'deputy#delete', as: :deputies_delete



	get 'gamifications/all' => 'gamification#all', format: :json

	get 'achievements/all' => 'achievement#all', format: :json
	get 'achievements/new' => 'achievement#new', format: :json, as: :achievements_new
	post 'achievements/create' => 'achievement#create', as: :achievements
	get 'achievements/:id' => 'achievement#show', format: :json
  get 'achievements/:edit' => 'achievement#edit', format: :json
  patch 'achievements/:update' => 'achievement#update'

	get 'quests/all' => 'quest#all', format: :json
	get 'quests/new' => 'quest#new', format: :json, as: :quests_new
	post 'quests/create' => 'quest#create', as: :quests
	get 'quests/:id' => 'quest#show', format: :json
	put 'quests/:id/update' => 'quest#update', format: :json, as: :quests_update
	get 'quests/:id/edit' => 'quest#edit', format: :json, as: :quests_edit
	delete 'quests/:id' => 'quest#delete'

	get 'ufs/all' => 'uf#all', format: :json
	get 'ufs/new' => 'uf#new'
  post 'ufs/create' => 'uf#create', as: :ufs
	get 'ufs/:id' => 'uf#show', format: :json
	patch 'ufs/:id/update' => 'uf#update', format: :json, as: :uf
	get 'ufs/:id/edit' => 'uf#edit'
	delete 'ufs/:id' => 'uf#delete', as: :ufs_delete

	get 'parties/all' => 'party#all', format: :json
	get 'parties/new' => 'party#new'
	post 'parties/create' => 'party#create', as: :parties
	get 'parties/:id' => 'party#show', format: :json
	patch 'parties/:id/update' => 'party#update', format: :json, as: :party
	get 'parties/:id/edit' => 'party#edit'
	delete 'parties/:id' => 'party#delete', as: :parties_delete

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
end
