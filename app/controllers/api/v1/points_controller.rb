module Api::V1
  class PointsController < ApiController
    def create
      if unregistered?
        render json: { errors: point_register[1] }, status: :unprocessable_entity
      else
        render json: { point: point_register[1] }, status: :ok
      end
    end

    private

    def point_register
      @point_register ||= PointRegister.(data: point_params)
    end


    def unregistered?
      point_register[0] == :unregistered
    end

    def point_params
      params.require(:point).permit(
        :vehicle_uuid,
        :vehicle_type,
        :latitude,
        :longitude,
        :timestamp,
        :current_heading
      )
    end
  end
end
