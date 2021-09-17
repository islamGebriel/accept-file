class FilesController < ApplicationController
  def new
  end

  def index
    @pe_files = PortableExecutable.includes(:file_attachment).all.order('updated_at DESC')
  end

  def create
    pe = Pe.new(params[:pe_file].tempfile)
    if pe.pe? 
      uploaded = PortableExecutable.already_uploaded? pe.information
      if uploaded
        uploaded.recieved_again
        flash[:notice] = 'file has been uploaded before'
        return redirect_to action: :index
      end
      uploaded = PortableExecutable.create(pe.information)
      uploaded.file.attach params[:pe_file]
      flash[:success] = 'file has been uploaded successfully'
      return redirect_to action: :index
    end
    flash[:error] = 'not a PE file'
    return redirect_to action: :index
  end

  private


end
