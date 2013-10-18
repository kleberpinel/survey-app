require 'test_helper'

class SurveyFormsControllerTest < ActionController::TestCase
  setup do
    @survey_form = survey_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:survey_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create survey_form" do
    assert_difference('SurveyForm.count') do
      post :create, survey_form: { requestor: @survey_form.requestor, responses: @survey_form.responses, title: @survey_form.title }
    end

    assert_redirected_to survey_form_path(assigns(:survey_form))
  end

  test "should show survey_form" do
    get :show, id: @survey_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @survey_form
    assert_response :success
  end

  test "should update survey_form" do
    patch :update, id: @survey_form, survey_form: { requestor: @survey_form.requestor, responses: @survey_form.responses, title: @survey_form.title }
    assert_redirected_to survey_form_path(assigns(:survey_form))
  end

  test "should destroy survey_form" do
    assert_difference('SurveyForm.count', -1) do
      delete :destroy, id: @survey_form
    end

    assert_redirected_to survey_forms_path
  end
end
