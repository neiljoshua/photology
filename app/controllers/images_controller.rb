class ImagesController < ApplicationController

	def index
    @images = Image.all
  end
	def create
		@image = Image.find(params[:image_id])
		@comment = @article.comments.create(comment_params)
		redirect_to article_path(@image)
	end

	def destroy
		@image = Image.find(params[:image_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	private
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end
end
