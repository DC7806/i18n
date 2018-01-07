class Admin::PostsController < AdminController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @admin_posts = Admin::Post.all
  end

  def show
  end

  def new
    @admin_post = Admin::Post.new
  end

  def edit
  end

  def create
    @admin_post = Admin::Post.new(post_params)
    if @admin_post.save
      redirect_to admin_posts_path
    else
      render :new
    end
  end

  def update
    if @admin_post.update(post_params)
      redirect_to admin_posts_path
    else
      render :eidt
    end
  end

  def destroy
    @admin_post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @admin_post = Admin::Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:admin_post).permit(:title, :body, :title_en, :body_en, :"title_zh_tw", :"body_zh_tw")
    end
end