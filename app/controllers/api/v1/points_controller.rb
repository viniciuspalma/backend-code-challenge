module Api::V1
  class PointsController < ApiController
    def create
      render nothing: true, status: :ok 
    end
  end
end
