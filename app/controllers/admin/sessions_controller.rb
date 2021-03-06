module Admin
  class SessionsController < ApplicationController
    # GET /sessions/new
    def new
      @course = Course.find(params[:course_id])
      @session = @course.sessions.build
    end

    # GET /sessions/1/edit
    def edit
      @session = Session.find(params[:id])
    end

    # POST /sessions
    # POST /sessions.json
    def create
      @session = Session.new(session_params)
      @course = @session.course

      respond_to do |format|
        if @session.save
          format.html { redirect_to @session.course, notice: 'Session was successfully created.' }
          format.json { render :show, status: :created, location: @session }
        else
          format.html { render :new }
          format.json { render json: @session.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /sessions/1
    # PATCH/PUT /sessions/1.json
    def update
      respond_to do |format|
        @session = Session.find(params[:id])

        if @session.update(session_params)
          format.html { redirect_to @session.course, notice: 'Session was successfully updated.' }
          format.json { render :show, status: :ok, location: @session }
        else
          format.html { render :edit }
          format.json { render json: @session.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /sessions/1
    # DELETE /sessions/1.json
    def destroy
      @course = @session.course
      @session.destroy
      respond_to do |format|
        format.html { redirect_to course_path(@course), notice: 'Session was successfully deleted.' }
        format.json { head :no_content }
      end
    end

    private

      # Never trust parameters from the scary internet, only allow the white list through.
      def session_params
        params.require(:session).permit(:course_id, :session_date, :notes)
      end
  end
end
