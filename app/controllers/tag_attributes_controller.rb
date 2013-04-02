class TagAttributesController < ApplicationController
  # GET /tag_attributes
  # GET /tag_attributes.json
  def index
    @tag_attributes = TagAttribute.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tag_attributes }
    end
  end

  # GET /tag_attributes/1
  # GET /tag_attributes/1.json
  def show
    @tag_attribute = TagAttribute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tag_attribute }
    end
  end

  # GET /tag_attributes/new
  # GET /tag_attributes/new.json
  def new
    @tag_attribute = TagAttribute.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tag_attribute }
    end
  end

  # GET /tag_attributes/1/edit
  def edit
    @tag_attribute = TagAttribute.find(params[:id])
  end

  # POST /tag_attributes
  # POST /tag_attributes.json
  def create
    @tag_attribute = TagAttribute.new(params[:tag_attribute])

    respond_to do |format|
      if @tag_attribute.save
        format.html { redirect_to @tag_attribute, notice: 'Tag attribute was successfully created.' }
        format.json { render json: @tag_attribute, status: :created, location: @tag_attribute }
      else
        format.html { render action: "new" }
        format.json { render json: @tag_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tag_attributes/1
  # PUT /tag_attributes/1.json
  def update
    @tag_attribute = TagAttribute.find(params[:id])

    respond_to do |format|
      if @tag_attribute.update_attributes(params[:tag_attribute])
        format.html { redirect_to @tag_attribute, notice: 'Tag attribute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tag_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_attributes/1
  # DELETE /tag_attributes/1.json
  def destroy
    @tag_attribute = TagAttribute.find(params[:id])
    @tag_attribute.destroy

    respond_to do |format|
      format.html { redirect_to tag_attributes_url }
      format.json { head :no_content }
    end
  end
end
