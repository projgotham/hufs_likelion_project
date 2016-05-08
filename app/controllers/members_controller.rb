class MembersController < ApplicationController
  before_action :authenticate_user!, except: :home
  
  def home
    @membersposts = MembersPost.paginate(:page => params[:page])
  end
  
  def post_write
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
    mm.writer = params[:writer]
    mm.title = params[:title]
    mm.content = params[:content]
    mm.save
    redirect_to '/members/home'
  end
  
  def comment_write
    MembersComment.create(user_id: current_user.id, members_post_id: params[:members_post_id], comment_content: params[:comment_content])
    redirect_to '/members/home'
  end
end
