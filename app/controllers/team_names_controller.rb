class TeamNamesController < ApplicationController
  def index
    @team_names = TeamName.all
    render json: @team_names
  end

  def show
    @team_name = TeamName.find(params[:id])
    render json: @team_name
  end

  def create
    @team_name = TeamName.new(team_name_params)

    if @team_name.save
      render json: @team_name, status: :created, location: @team_name
    else
      render json: @team_name.errors, status: :unprocessable_entity
    end
  end

  def update
    @team_name = TeamName.find(params[:id])

    if @team_name.update(team_name_params)
      render json: @team_name
    else
      render json: @team_name.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @team_name = TeamName.find(params[:id])
    @team_name.destroy
    render json: { message: 'Team name deleted successfully' }
  end

  private
    def team_name_params
      params.require(:team_name).permit(:name)
    end
end
