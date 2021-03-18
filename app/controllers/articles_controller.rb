class ArticlesController < ApplicationController

  #Auntenticacion basica con http_basic_authenticate_with
   http_basic_authenticate_with name: "abraham", password: "1234", except: [:index, :show]





  def index
    #Muestra la lista completa de articulos
    @articles = Article.all 
  end


  def show
    #REcuperar el valor del id que se mande en la url
    @article = Article.find(params[:id])
  end


  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end



  def create
    #El siguiente codigo, pinta aparentemente un json con los datos
    #render plain: params[:article].inspect
    


    @article = Article.new(article_params)
    #Creo un atributo del modelo "article.rb", cada objeto del modelo en este caso "Article" puede ser inicializado con sus respectivos atributos

    if @article.save #Uso el metodo save para guardar los datos en la bd y retorna un bolean si ralizo o no el registro exitosamente
    redirect_to @article #redirecciona al usuario a la vista de show que aun no se crea, donde me imagino que imprimira todos los campos del modelo

    else 
      render 'new' #Manda a llamar a la funcion new, podria ser un redirect_to, pero para mantener la informacion del formulario mandamos a llamar new, que ya tiene precargados los datos por instanciar el objeto @article
    end
  end



  def update
    @article = Article.find(params[:id])
 
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end



  def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
  end


  private
  def article_params
    params.require(:article).permit(:title, :text)
  end


end
