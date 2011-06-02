class CodesController < ApplicationController

  def index
      codes = Code.all
      @code = codes[rand(codes.size)]
      render :show
  end
  
  def show
      @code = Code.find(params[:code], :include => [:languages, :vote_options])
  end

  def new
    @code = Code.new
  end

  def create
    @code = Code.new(params[:code])
    if @code.save
      flash[:notice] = {:message => 'Código enviado.', :type => :success}
      redirect_to codes_path
    else
      flash.now[:notice] = {:message => 'Dados inválidos. Verifique e tente novamente.', :type => :error}
      render :new
    end
  end

  def update # Vote
    @code = Code.find(params[:code])
    if params[:vote] == 0
      denounce @code
      flash[:notice] = {:message => 'Ok! Analisaremos o código. Obrigado.', :type => :success}
    else
      vote @code, params[:code][:vote_option_id]
      flash[:notice] = {:message => 'Ok! Agora vote no próximo.', :type => :success}
    end

    redirect_to codes_path
  end

  private

  def vote(code, option)
    code.vote_options << VoteOption.find(option)
  end

  def denounce(code)
    code.increment! :denounce
  end

end
