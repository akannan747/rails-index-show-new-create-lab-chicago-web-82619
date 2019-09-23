class CouponsController < ApplicationController
  def index
    @coupons = Coupon.all
  end

  def show
    @coupon = find_coupon
  end

  def new
  end

  def create
    code = params[:coupon][:coupon_code]
    store = params[:coupon][:store]
    @coupon = Coupon.create(coupon_code: code, store: store)
    redirect_to coupon_path(@coupon)
  end

  private
    def find_coupon
      Coupon.find_by(params[:id])
    end
end