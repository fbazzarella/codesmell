class CodesController < ApplicationController

  def index
    language = params[:language_slug] || 'all'
    next_code = Code.get_random(language)
    if next_code
      redirect_to "/#{language}/#{next_code.id}"
    else
      @language = Language.get_name_and_slug_of language
      @language.nil? ? redirect_to('/all') : render(:show)
    end
  end

  def show
    @vote_options = VoteOption.all
    @code = Code.find_by_id_and_language(params[:code_id], params[:language_slug])
    redirect_to root_path unless @code
  end

  def new
    language = params[:language_slug] == 'all' ? nil : Language.find_by_slug(params[:language_slug])
    @code = Code.new(:language => language)
  end

  def create
    @code = Code.new(params[:code])
    if verify_recaptcha(:model => @code, :message => "Ops, parece que o código do reCAPTCHA não está certo!") && @code.save      
      flash[:notice] = {:message => 'Beleza! Agora compartilhe com a galera!', :type => :success}
      redirect_to "/#{params[:language_slug]}/#{@code.id}"
    else
      flash.now[:notice] = {:message => 'Tu se esqueceu algo? Dê uma olhada!', :type => :error}
      render :new
    end
  end

  def update
    @code = Code.find(params[:id])
    if params.include? 'denounce'
      flash[:notice] = {:message => 'Ok! Vamos dar uma olhada em tua denúncia!', :type => :success} if @code.denounce!
    else
      flash[:notice] = {:message => 'Ok! Agora vote no próximo!', :type => :success} if @code.vote! params
    end
    redirect_to "/#{params[:language_slug]}"
  end

end
