require 'csv'
class SalesController < ApplicationController

  def index
    @sales = Sale.all
  end

  def create
    filename = session[:tmp_filename]
    load_from_file('/public/uploads' + 'filename')
  end

  def upload
    uploaded_io = params[:file]
    @file = File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
      session[:tmp_filename] = uploaded_io.original_filename
    end
    filename = session[:tmp_filename]
    load_from_file("public/uploads/#{filename}")
  end

  private

  # POST /upload
  def load_from_file(file_path)
    Sale.delete_all
    CSV.foreach(file_path, :headers => true, :col_sep => "\t") do |row|
      Sale.create!({
        purchaser_name: row[0],
        item_description: row[1],
        item_price: row[2],
        purchase_count: row[3],
        merchant_address: row[4],
        merchant_name: row[5],
        })
    end
    session[:tmp_filename] = nil
    flash[:success] = "File Successfully Imported"
    redirect_to root_path
  end
end
