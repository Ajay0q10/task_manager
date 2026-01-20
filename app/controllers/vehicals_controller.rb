class VehicalsController < ApplicationController


    def index
        vehicals = Vehical.all
        render json: vehicals
    end

    def show
        vehical = Vehical.find(params[:id])
        render json: vehical
    end


    # def create 
    #     vehical = Vehical.new(vehical_params)
    #     if vehical.save
    #         render json:{
    #             message: "vehical created sucessfyll",
    #             vehical: vehical
    #         }
    #     else
    #         render json:{
    #             message: "vehical not created",
    #             errors: vehical.errors.full_messages
    #         }
    #     end
    # end

def create 
    vehical = Vehical.new(vehical_params)
    if vehical.save
        render json: vehical, status: :created
    else
        render json: { errors: vehical.error}, status: :unprocessable_entity
    end
end

    def update
        vehical = Vehical.find_by(id: params[:id])
        if vehical && vehical.update(vehical_params)
            render json:{
                message: "vehical updated sucessfully",
                vehical: vehical
            }
        else
            render json:{
                message: "vehical not updated",
                errors: vehical.errors.full_messages
        }
    end
end

def destroy
vehical = Vehical.find_by(id: params[:id])
if vehical && vehical.destroy
    render json:{
        message: "vehical deleted sucessfully",
        vehical: vehical
    }
else
    render json:{
        message: "vehical not deleted",
        errors: vehical.errors.full_messages
    }
end
end


    private
   

    def vehical_params
        params.require(:vehical).permit(:company, :model, :price, :color)
    end



end



# // still error failed to fetch from postman  getting 422 unprocessible content






