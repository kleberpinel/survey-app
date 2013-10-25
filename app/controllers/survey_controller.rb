class SurveyController < ApplicationController

  before_action :set_survey_form, only: [:delivery]
  before_filter :authenticate_user!, only: [:edit, :update, :destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Pesquisa interativa", :survey_forms_path 

  # GET /survey_forms
  # GET /survey_forms.json
  def open
    @survey_forms = SurveyForm.where(restrict: false)
  end

  def show
    @survey_form = SurveyForm.find(params[:id])
  end

  def delivery
    @survey_form.update(survey_form_params)
    respond_to do |format|
      if @survey_form.update(survey_form_params)
        format.html { flash[:notice] = 'Pesquisa respondida com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'show' }
        format.json { render json: @survey_form.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def survey_form_params
      params.require(:survey_form).permit(:id, answers_attributes: [
          :label_answer, :value_answer, :survey_field_id
        ])
    end

    def set_survey_form
      @survey_form = SurveyForm.find(survey_form_params[:id])
    end
end 