class TeamsController < ApplicationController
    
    def index #GET
        @teams = Team.all
    end

    def show #GET
        @team = Team.find(params[:id])
    end

    def new #GET
        @team = Team.new
    end

    def edit #GET
        @team = Team.find(params[:id]) 
    end

    def create #POST
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