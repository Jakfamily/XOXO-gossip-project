class GossipsController < ApplicationController
  before_action :set_gossip, only: %i[show edit update destroy]
  before_action :require_login, only: %i[new create edit update destroy]
  before_action :authorize_user, only: %i[edit update destroy]

  def index
    @gossips = Gossip.all
    @comments = Comment.all
    @likes = Like.all
  end

  def show
    
    @gossip = Gossip.find_by_id(params[:id])
    if @gossip
      @comment = Comment.new
      @comments = @gossip.comments
    else
      redirect_to gossips_path, alert: "Le potin que vous essayez d'afficher n'existe pas."
    end
  end

  def new
    @gossip = Gossip.new
    @user_id = current_user.id
  end

  def create
    @gossip = current_user.gossips.build(gossip_params)
    if @gossip.save
      flash[:success] = "Gossip created"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      redirect_to gossips_path
    else
      render 'edit'
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end

  def user_gossips
    @user = User.find(params[:user_id])
    @gossips = @user.gossips
  end

  def like
    @gossip = Gossip.find(params[:id])
    @like = Like.new(gossip: @gossip, user: current_user)
    if @like.save
      flash[:success] = "Gossip liked"
    else
      flash[:danger] = "Failed to like gossip"
    end
    redirect_to gossip_path(@gossip)
  end

  def dislike
    @gossip = Gossip.find(params[:id])
    @like = Like.find_by(gossip: @gossip, user: current_user)
    if @like.destroy
      flash[:success] = "Gossip disliked"
    else
      flash[:danger] = "Failed to dislike gossip"
    end
    redirect_to gossip_path(@gossip)
  end

  private

  def set_gossip
    @gossip = Gossip.find(params[:id])
  end

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end

  def require_login
    unless logged_in?
      flash[:danger] = "Please log in"
      redirect_to root_path
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def authorize_user
    @gossip = Gossip.find(params[:id])
    unless @gossip.user == current_user
      flash[:danger] = "You are not authorized to perform this action"
      redirect_to root_path
    end
  end
end
