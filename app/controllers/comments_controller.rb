class CommentsController < ApplicationController
    def create
        comment = current_user.comments.create(comment_params)
        redirect_to article_path(id: comment_params[:article_id])
    end

    def destroy
        comment = Comment.find(params[:id])
        article = comment.article
        comment.destroy
        flash[:alert]="Se a borrado exitosamente"
        redirect_to article_path(id: article.id), status: :see_other
    end

    private
    def comment_params
        params.require(:comment).permit(:comments, :article_id)
    end
end
