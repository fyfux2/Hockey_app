class ScoresController < ApplicationController
  
  def index
    @scores = Score.all
  end

  def show
    @score = Score.find(params[:id])
  end

  def new
    @score = Score.new
  end

  def edit
    @score = Score.find(params[:id])
  end

  def create
    @score = Score.new(score_params)

    if @score.save
      redirect_to action: :index, notice: 'Rezultāta ieraksts ir veiksmīgi izveidots'
    else
      render :new
    end 
  end

  def update #PUT
    @score = Score.find(params[:id])
        
    if @score.update(score_params)
        redirect_to action: :index, notice: 'Rezultāta ieraksts veiksmīgi labots'
    else
       render :edit
    end
end

  def destroy
    @score = Score.find(params[:id])
    @score.destroy

    redirect_to action: :index
  end

  private
  def score_params
    params.require(:score).permit(:home_team_id, :guest_team_id, :home_goals, :guest_goals, :extra_time)
  end
end