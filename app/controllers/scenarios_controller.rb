class ScenariosController < ApplicationController
  def index
    @scenario_form = ScenarioForm.new(scenario_form_params)
    @scenarios = @scenario_form.scenarios
  end

  def new
    @scenario = Scenario.new
  end

  def edit
    @scenario = Scenario.find(params[:id])
  end

  def create
    @scenario = Scenario.new(scenario_params)
    if @scenario.save
      redirect_to scenarios_path, notice: 'created'
    else
      render :new
    end
  end

  def update
    @scenario = Scenario.find(params[:id])
    if @scenario.update(scenario_params)
      redirect_to scenarios_path, notice: 'updated'
    else
      render :edit
    end
  end

  private

  def scenario_params
    params.require(:scenario).permit!
  end

  def scenario_form_params
    params.fetch(:scenario_form, {}).permit!
  end
end
