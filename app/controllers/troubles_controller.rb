class TroublesController < ApplicationController
  before_action :set_trouble, only: [:show, :edit, :update, :destroy, :download_file]

  # GET /troubles
  # GET /troubles.json
  def index
    @troubles = Trouble.all
  end

  # GET /troubles/1
  # GET /troubles/1.json
  def show
  end

  # GET /troubles/new
  def new
    @trouble = Trouble.new
    # @counselors = Counselor.all
  end

  # GET /troubles/1/edit
  def edit
    @counselors = Counselor.all
  end

  # POST /troubles
  # POST /troubles.json
  def create
    @trouble = Trouble.new(trouble_params)

    respond_to do |format|
      if @trouble.save
        format.html { redirect_to edit_trouble_path(@trouble), notice: 'Trouble was successfully created.' }
        format.json { render :show, status: :created, location: @trouble }
      else
        format.html { render :new }
        format.json { render json: @trouble.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /troubles/1
  # PATCH/PUT /troubles/1.json
  def update
    respond_to do |format|
      if @trouble.update(trouble_params)
        format.html { redirect_to edit_trouble_path(@trouble), notice: 'Trouble was successfully updated.' }
        format.json { render :show, status: :ok, location: @trouble }
      else
        format.html { render :edit }
        format.json { render json: @trouble.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /troubles/1
  # DELETE /troubles/1.json
  def destroy
    @trouble.destroy
    respond_to do |format|
      format.html { redirect_to troubles_url, notice: 'Trouble was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # line talk jpeg 
  def download_file
    load Rails.root.join('./app/controllers/','mklinetalk_module.rb')
    # require Rails.root.join('./app/controllers/','mklinetalk_module')
    linetalk = MkLineTalk.mkimage(@trouble)
    # filepath = Rails.root.join('app/assets/images/others', 'gakki.jpg')
    # stat = File::stat(filepath)
    # send_file filepath, :filename => 'gakki.jpg', :length => stat.size, :disposition => 'attachment', type: 'image/jpeg'
    send_data linetalk, :filename => 'linetalk.jpg', :disposition => 'attachment', type: 'image/jpeg'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trouble
      @trouble = Trouble.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trouble_params
      params.require(:trouble).permit(:counselor_id, :content).merge(user_id: current_user.id)
    end
end
