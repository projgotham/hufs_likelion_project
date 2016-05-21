class MembersController < ApplicationController
  before_action :authenticate_user!, except: :home

  def home
    @membersposts = MembersPost.paginate(:page => params[:page]).order('id DESC')
    if params[:page].nil? 
      @page = 1
    else
      @page = params[:page].to_i
    end
    
    
  end
  
  def post_read
    @posts = MembersPost.find(params[:id])
  end
  
  def post_write
  end
  
  def post_write_process
    m = MembersPost.new
    m.user_id = current_user.id
    m.title = params[:title]
    m.content = params[:content]
    m.save
    redirect_to '/members/home'
  end
  
  def post_destroy
    mm = MembersPost.find(params[:id])
    mm.destroy
    redirect_to '/members/home'
  end
  
  def post_edit
    @memberspost = MembersPost.find(params[:id])
  end
  
  def post_update
    mm = MembersPost.find(params[:id])
    mm.title = params[:title]
    mm.content = params[:content]
    mm.save
    redirect_to '/members/home'
  end
  
  def comment_write
    MembersComment.create(user_id: current_user.id, members_post_id: params[:id], comment_content: params[:comment_content])
    redirect_to :back
  end
end
