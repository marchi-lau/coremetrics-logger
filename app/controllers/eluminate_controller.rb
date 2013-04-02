class EluminateController < ApplicationController
  def log
    Tag.create(:parameters => params.to_hash, :tid => params[:tid])
    render :nothing => true
  end
end
