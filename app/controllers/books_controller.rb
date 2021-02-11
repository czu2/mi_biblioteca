class BooksController < ApplicationController
  def index
    if params[:q]
      @books = Book.where('estado LIKE ?', "%#{params[:q]}%")
    else
      @books = Book.all.order(created_at: :desc)
    end
  end

  def create
    @books = book_params()
    @books.save
    redirect_to root_path, notice: '¡Préstamo Registrado!'
  end

  def new
    @book = Book.new
  end

  private
  # Oculta los atributos del modelo y evita su modificación (Strong Params)
  def book_params
    Book.new(title: params[:title], author: params[:author], status: params[:status], borrowed_at: params[:borrowed_at], returned_at: params[:returned_at])
  end

end
