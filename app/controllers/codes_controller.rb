class CodesController < ApplicationController

  def index
      codes = Code.all
      @code = codes[rand(codes.size)]
      render :show
  end
  
  def show
      @code = Code.find(params[:id], :include => [:language, :vote_options])
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

  def update
    @code = Code.find(params[:id])
    if params.include? 'denounce'
      denounce @code
      flash[:notice] = {:message => 'Ok! Analisaremos o código. Obrigado.', :type => :success}
    else
      vote @code
      flash[:notice] = {:message => 'Ok! Agora vote no próximo.', :type => :success}
    end
    redirect_to codes_path
  end

  private

  def vote(code)
    vote_option = nil
    params.keys.each {|p| vote_option = p.from(12).to_i if p.include?('vote_option')}
    code.vote_options << VoteOption.find(vote_option)
  end

  def denounce(code)
    code.increment! :denounce
  end

end
