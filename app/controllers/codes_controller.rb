class CodesController < ApplicationController

  def index
    if Code.get_random
      params[:language_slug] ||= 'all'
      next_code = Code.get_random(params[:language_slug])
      redirect_to next_code ? "/#{params[:language_slug]}/#{next_code.id}" : root_path
    else
      @code = nil
      render :show
    end
  end

  def show
    @vote_options = VoteOption.all
    @code = Code.find_by_id_and_language(params[:code_id], params[:language_slug])
    redirect_to root_path unless @code
  end

  def new
    if params[:language_slug] == 'all'
      language = nil
    else
      language = Language.find_by_slug(params[:language_slug])
    end
    @code = Code.new(:language => language)
  end

  def create
    @code = Code.new(params[:code])
    if @code.save
      flash[:notice] = {:message => 'Código enviado.', :type => :success}
      redirect_to "/#{params[:language_slug]}/#{@code.id}"
    else
      flash.now[:notice] = {:message => 'Dados inválidos. Verifique e tente novamente.', :type => :error}
      render :new
    end
  end

  def update
    @code = Code.find(params[:id])
    if params.include? 'denounce'
      flash[:notice] = {:message => 'Ok! Analisaremos o código. Obrigado.', :type => :success} if @code.denounce!
    else
      flash[:notice] = {:message => 'Ok! Agora vote no próximo.', :type => :success} if @code.vote! params
    end
    redirect_to "/#{params[:language_slug]}"
  end

end
