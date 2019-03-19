class PlayersController < ApplicationController
  def index
    @players = Player.all.order(:name)

    respond_to do |format|
      format.html
      format.json do
        render(json: @players.to_json(
          only: [:name, :id, :position, :number, :club],
          include: {team: {only: :title}}
        ))
      end
    end
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def edit
    @player = Player.find(params[:id])
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to action: :index, notice: 'Spēlētājs veiksmīgi izveidots'
    else
      render :new
    end 
  end

  def update #PUT
    @player = Player.find(params[:id])
        
    if @player.update(player_params)
        redirect_to action: :index, notice: 'Komanda veiksmīgi labota'
    else
       render :edit
    end
end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    redirect_to action: :index
  end

  private
  def player_params
    params.require(:player).permit(:name, :number, :position, :club, :team_id)
  end

end
