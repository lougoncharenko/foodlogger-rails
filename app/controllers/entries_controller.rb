class EntriesController < ApplicationController
    before_action :set_entry, only: [:show, :edit, :update, :destory]

    def index
        @entries = Entry.all
    end

    def show
    end

    def new
        @entry = Entry.new
    end

    def edit
    end

    def create
        @entry = Entry.new(entry_params)

        respond_to do |format|
            if entry.save
                format.html {redirect_to @entry, notice: 'Entry was created successfully'}
                format.json {render json: @entry.errors, status: unprocessable_entity}
            end
        end
    end

    def destroy 
        @entry.destroy
        respond_to do |format|
            format.html {redirect_to entries_url, notice: 'Entry was deleted successfully'}
            format.json {head :no_content}
        end
    end

    private 
        def set_entry
            @entry = Entry.find(params[:id])
        end
        
        def entry_params
            params.require(:entry).permit(:meal_type, :calories, :proteins, :carbohydrates, :fats)
        end

end
