class Api::GroceriesController < ApplicationController
    def index 
        render json: Grocery.all 
    end 

    def create 
        grocery = Grocery.new(grocery_params)
        if grocery.save 
            render json: grocery 
        else 
            render json: { errors: grocery.errors }, status: unprocessable_entity 
        end 
    end 

    def update 
        grocery = Grocery.find(params[:id]) 
        grocery.update( purchased: !grocery.purchased)
        render json: grocery 
    end 

    def destroy
        Grocery.find(params[:id]).destroy
        render json: { message: 'Item deleted' }
    end 

    private 

        def item_params
            params.require(:item).permit(:name, :complete)
        end 
end
