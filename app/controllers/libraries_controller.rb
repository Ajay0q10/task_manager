class LibrariesController < ApplicationController

  def index
    libraries = Library.all
    render json: libraries
  end

  def show
    library = Library.find_by(id: params[:id])

    if library
      render json: library
    else
      render json: { message: "library not found" }
    end
  end

  def create
    library = Library.new(library_params)

    if library.save
      render json: {
        message: "library added successfully",
        library: library
      }
    else
      render json: {
        message: "library not added",
        errors: library.errors.full_messages
      }
    end
  end

  def update
    library = Library.find_by(id: params[:id])

    if library && library.update(library_params)
      render json: {
        message: "library updated successfully",
        library: library
      }
    else
      render json: {
        message: "library not updated",
        errors: library ? library.errors.full_messages : ["library not found"]
      }
    end
  end

  def destroy
    library = Library.find_by(id: params[:id])

    if library && library.destroy
      render json: { message: "library deleted successfully" }
    else
      render json: {
        message: "library not deleted",
        errors: library ? library.errors.full_messages : ["library not found"]
      }
    end
  end

  private

  def library_params
    params.require(:library).permit(:name, :author, :price)
  end
end
