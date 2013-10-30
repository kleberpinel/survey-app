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
    @identifier = Time.new.try(:strftime,'%Y%m%d%H%M%S%L') + @survey_form.id.to_s
  end

  def delivery
    respond_to do |format|
      if @survey_form.update(survey_form_params)
        SurveyForm.increment_counter :responses , @survey_form.id
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
          :label_answer, :value_answer, :survey_field_id, :identifier, :user_id
        ])
    end

    def set_survey_form
      @survey_form = SurveyForm.find(survey_form_params[:id])
    end
end 