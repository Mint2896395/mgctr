class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    #@people = Person.all
    unless params[:section]
      redirect_to people_path(section: Section.first.name)
      return
    end
    @sections = Section.all
    section = Section.find_by(name: params[:section])
    @people = section.persons.order(:id)
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_back fallback_location: root_path, notice: 'Person was successfully created.' }
        a = Setting.find(1)  
        a.setting03 = @person.id
        a.save
        #format.html { redirect_to @person, notice: 'Person was successfully created.' }
        #format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Person was successfully destroyed.' }
      #format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
      a = Setting.find(1)  
      a.setting03 = ""
      a.save
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name, :BirthYear, :BirthMonth, :BirthDay, :BirthTime, :description, :section_id)
    end
end
