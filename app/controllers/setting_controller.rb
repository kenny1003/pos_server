class SettingController < ApplicationController

  before_action :authenticate_user! #로그인 사용자만 이용할 수 있음.

  def index
    if current_user.store.category.all.present?
      #@menu = current_user.store.menu #db 추출 (유저에 연결된 메뉴 추출)

    end

  end

  def menusetting

    @category = current_user.store.category

    if params[:categoryid].present?
      puts params[:categoryid]
      @menu =  current_user.store.category.find(params[:categoryid].to_i).menu

      respond_to do |format|
        format.js { render :json => @menu }
      end

    end

  end

  #메뉴카테고리 입력하기
  def category_write
    @category = Category.new
    @category.name = params[:category]
    @category.store_id = current_user.store.id #Store.find(current_user.id).id #db 연결 (store <-> category)
    @category.save

    redirect_to :back
  end

  def category_destroy
    @category= Category.find(params[:categoryid])
    if @category.menu.present?


    else

      @category.destroy
    end
    redirect_to :back

  end





  def showmenu
    @category_entry = current_user.store.category
    @categoryid = params[:categoryid]
    @category = Store.find(current_user.id).category
    flash[:notice] = "Post successfully created"


    if params[:categoryid].present?
      @menu =  Category.find(params[:categoryid]).menu
    end

  end

  def menu_write
    @menu = Menu.new
    @menu.category_id = params[:category_id] #db 연결 (store <-> menu)
    @menu.name = params[:menu_name]
    @menu.price = params[:menu_price]
    @menu.save

    redirect_to :back
    # redirect_to "/setting/showmenu/"+params[:category_id]

  end

  def menu_change1
    @menu = Menu.find(params[:menu_id])

  end

  def menu_change2
    @menu = Menu.find(params[:menuid])
    #@menu.store_id 는 고칠필요없음
    @menu.name = params[:menu_name]
    @menu.price = params[:menu_price]
    @menu.save

    redirect_to "/setting/menusetting"

  end

  def menu_destroy
    @menu = Menu.find(params[:menu_id])
    @menu.destroy
    redirect_to :back
  end
end