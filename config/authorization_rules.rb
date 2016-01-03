authorization do
  role :guest do
    has_permission_on :store, :to => [:index, :show, :search_products, :delivery, :about, :contact]
  end
  
  role :admin do
    has_permission_on :store, :to => [:index, :show, :cart, :search_products, :delivery, :about, :contact]
    has_permission_on [:products, :categories, :products_orders, :orders], :to => :manage
    
    has_permission_on :admins, :to => :index
  end

  role :user do
    has_permission_on :store, :to => [:index, :show, :cart, :search_products, :delivery, :about, :contact]

    has_permission_on :orders, :to => [:show, :create, :update, :delete] do
      if_attribute :user_id => is {user.id}
    end

    has_permission_on :products_orders, :to => [:show, :create, :update, :delete] do
      if_attribute :order => { :user_id => is { user.id } }
    end
  end
end

privileges do
  # default privilege hierarchies to facilitate RESTful Rails apps
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end