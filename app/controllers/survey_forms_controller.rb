class SurveyFormsController < ApplicationController
  before_action :set_survey_form, only: [:show, :edit, :update, :destroy, :report]

  before_filter :authenticate_user!

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Pesquisa interativa", :survey_forms_path 

  # GET /survey_forms
  # GET /survey_forms.json
  def index
    @survey_forms = SurveyForm.all
  end

  # GET /survey_forms
  # GET /survey_forms.json
  def open
    @survey_forms = SurveyForm.where(restrict: false)
  end

  # GET /survey_forms/1
  # GET /survey_forms/1.json
  def show
  end

  # GET /survey_forms/new
  def new
    @survey_form = SurveyForm.new
  end

  # GET /survey_forms/1/edit
  def edit
  end

  def report
  end

  # POST /survey_forms
  # POST /survey_forms.json
  def create
    @survey_form = SurveyForm.new(survey_form_params)
    @survey_form.responses = 0
    @survey_form.user = current_user

    respond_to do |format|
      if @survey_form.save
        format.html { redirect_to @survey_form, notice: 'Pesquisa interativa criada com sucesso.' }
        format.json { render action: 'show', status: :created, location: @survey_form }
      else
        format.html { render action: 'new' }
        format.json { render json: @survey_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey_forms/1
  # PATCH/PUT /survey_forms/1.json
  def update
    respond_to do |format|
      if @survey_form.update(survey_form_params)
        format.html { redirect_to @survey_form, notice: 'Pesquisa interativa atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @survey_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_forms/1
  # DELETE /survey_forms/1.json
  def destroy
    @survey_form.destroy
    respond_to do |format|
      format.html { redirect_to survey_forms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_form
      @survey_form = SurveyForm.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_form_params
      params.require(:survey_form).permit(:title, :requestor, :description, :restrict,
        survey_fields_attributes: 
          [:title, :survey_type_id, :id, :_destroy, survey_field_options_attributes: 
            [:label, :value, :id]]
          )
    end
end
