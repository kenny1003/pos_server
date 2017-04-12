Rails.application.routes.draw do
  get 'setting/index'

  get 'report/index'

  get 'bill/index'

  get 'sale/index'


  devise_for :users, :controllers => { registrations: 'registrations' }

  #처음시작페이지
  get 'home/index'
  get 'home/nav'
  get 'home/start'
  post 'home/makestore' => 'home#makestore'
  post 'home/choosestore' => 'home#choosestore'

  get 'home/storestart'
  get 'home/storefinish'
  get 'home/setting'
  get 'home/setting_store' #상점 수정 페이지
  post 'home/setting_store_update' => 'home#setting_store_update'
  post 'home/storestart' => 'home#storestart'

  #판매
  get 'sale/index'

  get 'sale/index_test' #test페이지
  post 'sale/billwrite_test' => 'sale#billwrite_test'

  post 'sale/billpreview' => 'sale#billpreview'
  post 'sale/billfinish' => 'sale#billfinish'
  post 'sale/showmenu' => 'sale#showmenu'
  get 'sale/showcategory/:category_id' => 'sale#showcategory'
  post 'sale/billreset' => 'sale#billreset'
  post 'sale/bill_cancle' => 'sale#bill_cancle'
  get 'sale/go_settingmenu' => 'sale#go_settingmenu'

  get 'sale/qty_minus/:qty'=>'sale#qty_minus'
  get 'sale/qty_plus/:qty' => 'sale#qty_plus'

  post 'sale/qty_plus' => 'sale#qty_plus'
  post 'sale/qty_minus' => 'sale#qty_minus'


  #계산서
  get 'bill/index'
  get 'bill/today'
  get 'bill/workperiod'
  get 'bill/workperiod_show/:workperiod_id' => 'bill#workperiod_show'
  post 'bill/bill_destroy' => 'bill#bill_destroy'
  post 'bill/qty_plus' => 'bill#qty_plus'
  post 'bill/qty_minus' => 'bill#qty_minus'


  #리포트
  get 'report/index'
  get 'report/index/:value' => 'report#index'
  get 'report/sales_rate' => 'report#sales_rate'
  get 'report/sales_rate/:value' => 'report#sales_rate'

  #세팅
  get 'setting/index'
  get 'setting/category_index'
  get 'setting/menusetting'
  post 'setting/menusetting'=> 'setting#menusetting'
  post 'setting/category_write'=>'setting#category_write'
  post 'setting/showmenu' => 'setting#showmenu'
  get 'setting/showmenu/:category_id' => 'setting#showmenu'
  get 'setting/showmenu'

  post 'setting/menu_write'=>'setting#menu_write'


  #get 'test/index'

  get 'setting/menu_change1/:menu_id'=>'setting#menu_change1'
  post 'setting/menu_change2' =>'setting#menu_change2'
  get 'setting/menu_destroy/:menu_id'=>'setting#menu_destroy'

  #admin 관리자페이지
  get 'admin/index'
  get 'admin/pincode'
  post 'admin/pincode_write'=>'admin#pincode_write'
  get 'admin/pincode_destroy/:pincode_id'=>'admin#pincode_destory'
  get 'admin/store'

  post 'admin/store_detail'=>'admin#store_detail'


  root 'home#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
