module ExceptionHandler
  extend ActiveSupport::Concern

  def self.included(base)
    base.class_eval do
      rescue_from ActiveRecord::RecordInvalid do
        render json: { error: 'Record Invalid' }, status: :unprocessable_entity
      end

      rescue_from ActiveRecord::RecordNotFound do
        render json: { error: 'Record Not Found' }, status: :not_found
      end

      rescue_from ActiveRecord::RecordNotUnique do
        render json: { error: 'Record Not Unique' }, status: :conflict
      end
    end
  end
end
