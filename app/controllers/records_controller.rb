class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item, only: [:index, :create]

  def index
    if user_signed_in? && current_user.id != @item.user_id  && @item.record == nil
      @record_address = RecordAddress.new
    else
      redirect_to root_path
    end
  end

  def create
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
      pay_item
      @record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def record_params
    params.require(:record_address).permit(
      :postal_code,
      :prefecture_id,
      :city,
      :house_number,
      :building_name,
      :phone_number,
    ).merge(
      token: params[:token],
      item_id: params[:item_id],
      user_id: current_user.id
    )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: record_params[:token],
        currency: 'jpy'
      )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end
end
