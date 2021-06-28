class Api::StudiesController < ApiController
  def index
    @trials = Trial.all
  end

  def show
    @trial = Trial.find_by(system_id: params[:id])
  end

  def update
    @trial = Trial.find_by(system_id: params[:id])

    @trial.transaction do
      @trial.update_keywords!(params[:keywords])
      @trial.update_conditions!(params[:conditions])
      @trial.update_locations!(params[:locations])
      @trial.update!(trial_params)
    end

    if @trial.errors.none?
      head 200
    else
      render json: { error: @trial.errors }, status: 400
    end
  end

  def create
    @trial = Trial.new(trial_params)

    if @trial.save
      @trial.transaction do
        @trial.update_keywords!(params[:keywords])
        @trial.update_conditions!(params[:conditions])
        @trial.update_locations!(params[:locations])
      end

      head 201
    else
      render json: { error: @trial.errors }, status: 400
    end
  end

  private

  def trial_params
    params.permit(
      :brief_title,
      :contact_override,
      :contact_override_first_name,
      :contact_override_last_name,
      :irb_number,
      :overall_status,
      :pi_id,
      :pi_name,
      :recruiting,
      :simple_description,
      :system_id,
      :visible
    )
  end
end
