# frozen_string_literal: true

class Api::BaseController < ActionController::Base
  include JsonErrorHandler
  include JsonSuccessHandler

  respond_to :json
  before_action :set_default_response_format

  # Enable CSRF protection for API
  protect_from_forgery with: :null_session

  rescue_from 'ActionController::ParameterMissing' do |exception|
    render_missing_required_params(exception)
  end

  rescue_from 'ActionController::UnpermittedParameters' do |_exception|
    render_param_error( I18n.t("api.failure.unpermitted_parameters") )
  end

  rescue_from 'ActiveRecord::RecordNotFound' do |_exception|
    render_endpoint_error
  end

  rescue_from 'ArgumentError' do |_exception|
    render_param_error(_exception.try(:message))
  end


  protected
    def set_default_response_format
      request.format = :json
    end

    def require_params(param_name, param_list=nil)
      if param_list.nil? && params[param_name].nil?
        raise ActionController::ParameterMissing.new(param_name)
      end

      if param_list.present? && (params[param_list].nil? || !params[param_list][param_name].present?)
        raise ActionController::ParameterMissing.new(param_name)
      end
    end

    def validate_date(param_name)
      begin
        params[param_name].try(:to_date)
      rescue ArgumentError => e
        message = I18n.t('api.failure.invalid_param_value') % { param_name: param_names }
        raise ArgumentError, message
      end
    end

    def render_404
      assign_fail("URL not found!", 404, "NOT_FOUND")
    end

    def render_500(error_messages)
      assign_fail(error_messages, 500, "INTERNAL_ERROR")
    end

    def render_200(data = {})
      assign_success(data)
    end
end
