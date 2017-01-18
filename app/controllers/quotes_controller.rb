class QuotesController < ApplicationController
  def new

  end
  def create
    quotes = Quote.new(params[:quote])
    quotes.request =request
    if quotes.deliver
      flash[:notice] = 'Thank you for your quote submition'
      redirect_to new_quote_path
    else
      flash[:errors] = quotes.errors.full_messages
      redirect_to :back
    end
  end
end
