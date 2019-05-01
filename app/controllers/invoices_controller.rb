class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.all
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show

    #to_s(@invoice)

    #@invoice = Invoice.find(params[:id]) #(params[:id])

    @client = Client.where(company: "#{@invoice.client}").take

    #find_by_sql("SELECT * FROM clients WHERE company = 'plow'")

    respond_to do |format|
        format.html
        format.pdf do
            render pdf: "#{@invoice.client}-invoice-#{@invoice.invoice_number}",
            page_size: 'A4',
            template: "invoices/show.html.erb",
            layout: "pdf.html",
            orientation: "Portrait",
            lowquality: true,
            zoom: 1,
            dpi: 75
        end
    end

  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    @in = Invoice.all.maximum("invoice_number")
    
    if @in.to_s.empty?
      @invoice.invoice_number = 1
    else 
      @invoice.invoice_number = @in.to_i + 1
    end

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to edit_invoice_path(@invoice), notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update

    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to edit_invoice_path(@invoice), notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])

      @clients = Client.find_by_sql("SELECT * FROM clients")
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:invoice_number, :project_title, :client, :issue_date, :due_date, :description, :status, :notes, :terms, :item_description, :item_qty, :item_rate, :item_amount, :subtotal, :tax_total, :items_total, :invoice_items => [:description, :qty, :rate, :total])
    end
end
