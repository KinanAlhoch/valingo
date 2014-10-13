class PinsController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :set_pin, only: [:show, :edit, :update, :destroy]

  def index
    @pins = Pin.all
    respond_with(@pins)
  end

  def show
    respond_with(@pin)
  end

  def new
    @pin = Pin.new
    respond_with(@pin)
  end

  def edit
  end

  def create
    @pin = Pin.new(params[:pin])
    @pin.save
    respond_with(@pin)
  end

  def update
    @pin.update_attributes(params[:pin])
    respond_with(@pin)
  end

  def destroy
    @pin.destroy
    respond_with(@pin)
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end
end
