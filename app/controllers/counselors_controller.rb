# coding: utf-8
class CounselorsController < ApplicationController
  before_action :set_counselor, only: [:show, :edit, :update, :destroy]

  # GET /counselors
  # GET /counselors.json
  def index
    @self_counselors = current_user.counselors.order("id DESC")
    @counselors = Counselor.all.order("id DESC")
  end

  # GET /counselors/1
  # GET /counselors/1.json
  def show
  end

  # GET /counselors/new
  def new
    @counselor = Counselor.new
  end

  # GET /counselors/1/edit
  def edit
  end

  # POST /counselors
  # POST /counselors.json
  def create
    @counselor = Counselor.new(counselor_params)

    respond_to do |format|
      if @counselor.save
        format.html { redirect_to @counselor, notice: 'Counselor was successfully created.' }
        format.json { render :show, status: :created, location: @counselor }
      else
        format.html { render :new }
        format.json { render json: @counselor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /counselors/1
  # PATCH/PUT /counselors/1.json
  def update
    respond_to do |format|
      if @counselor.update(counselor_params)
        format.html { redirect_to @counselor, notice: 'Counselor was successfully updated.' }
        format.json { render :show, status: :ok, location: @counselor }
      else
        format.html { render :edit }
        format.json { render json: @counselor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /counselors/1
  # DELETE /counselors/1.json
  def destroy
    @counselor.destroy
    respond_to do |format|
      format.html { redirect_to counselors_url, notice: 'Counselor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET  users/search
  def search
    # params[:word]に入力された文字列が入っているので、whereで検索を行う。
    @self_counselors = current_user.counselors.where("name like '%" + params[:word] + "%'").order("id DESC")
    @counselors = Counselor.where("name like '%" + params[:word] + "%'").order("id DESC")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_counselor
      @counselor = Counselor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def counselor_params
      params.require(:counselor).permit(:name, :response, :avatar).merge(user_id: current_user.id)
    end
end
