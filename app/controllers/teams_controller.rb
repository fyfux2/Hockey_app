
class TeamsController < ApplicationController
  # GET
  def index
    @teams = Team.all.order(:title)
    respond_to do |format|
        format.html
        format.json do
            render(json: @teams.to_json(
              only: [:title, :code, :id],
          ))
          end
      end
  end

  # GET
  def show
    @team = Team.find(params[:id])
  end

  # GET
  def new
    @team = Team.new
  end

  # GET
  def edit
    @team = Team.find(params[:id])
  end

  # POST
  def create
    @team = Team.new(team_params)

        if @team.save
            redirect_to action: :index, notice: 'Komanda veiksmīgi izveidota'
        else
            render :new
        end 
    end

  def update #PUT
    @team = Team.find(params[:id])

        if @team.update(team_params)
            redirect_to action: :index, notice: 'Komanda veiksmīgi labota'
        else
           render :edit
        end
    end
      
    def destroy
        @team = Team.find(params[:id])
        @team.destroy
    
        redirect_to action: :index
    end

    private
    def team_params
        params.require(:team).permit(:title, :code)   
    end

end