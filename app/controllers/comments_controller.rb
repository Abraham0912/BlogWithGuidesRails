class CommentsController < ApplicationController

  def create
    #Se recupera el id de article:
    #@article = Article.find(params[:id])
    #Podria ser de la forma anterior, pero como no estamos en el controlador article, hay que ser mas especificos, quedadno de la siguiente manera:
    @article = Article.find(params[:article_id])

    #Al relacionar tablas, automaticamente se crea un arreglo dentreo de Article que seria comments que donde mandaremos a llamar la funcion create y poasarle los parametros que estan hasta abajao como private:
    @comment = @article.comments.create(comment_params)

    #Para terminar redireccionaremos al mismo articulo para ver el comentario, pero como no estamos en el controller Article hay que ser mas especificos
    redirect_to article_path(@article)
  end




  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

end
