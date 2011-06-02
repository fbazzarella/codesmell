class CodesController < ApplicationController

  def show
    if params[:language_slug].nil? || (params[:language_slug] == 'all' && params[:code_id].nil?)
      path_to_redir = "/all/#{random_code(Code.all)}"
    else
      if params[:language_slug] == 'all'
        @code = Code.find(params[:code_id]) unless params[:code_id].nil?
      else
        language = Language.find_by_slug(params[:language_slug], :include => {:codes => [:language, :vote_options]})
        unless params[:code_id].nil?
          @code = language.codes.find(params[:code_id])
        else
          path_to_redir = "/#{language.slug}/#{random_code(language.codes)}"
        end
      end
    end
    redirect_to path_to_redir if path_to_redir
  end

  def new
    @code = Code.new
  end

  def create
    @code = Code.new(params[:code])
    if @code.save
      flash[:notice] = {:message => 'Código enviado.', :type => :success}
      redirect_to root_path
    else
      flash.now[:notice] = {:message => 'Dados inválidos. Verifique e tente novamente.', :type => :error}
      render :new
    end
  end

  def update
    @code = Code.find(params[:id])
    if params.include? 'denounce'
      denounce_this @code
      flash[:notice] = {:message => 'Ok! Analisaremos o código. Obrigado.', :type => :success}
    else
      vote_in_this @code
      flash[:notice] = {:message => 'Ok! Agora vote no próximo.', :type => :success}
    end
    redirect_to "/#{@code.language.slug}"
  end

  private

  def random_code(context)
    context[rand(context.size)].id unless context.nil?
  end

  def denounce_this(code)
    code.increment! :denounce
  end

  def vote_in_this(code)
    vote_option = nil
    params.keys.each {|p| vote_option = p.from(12).to_i if p.include?('vote_option')}
    code.vote_options << VoteOption.find(vote_option)
  end

end
