# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[edit update destroy]
  NUMBER_OF_ITEMS = 5

  # GET /reports
  def index
    @reports = Report.all.page(params[:page]).per(NUMBER_OF_ITEMS)
  end

  # GET /reports/1
  def show
    @report = Report.find(params[:id])
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit; end

  # POST /reports
  def create
    @report = current_user.reports.new(report_params)
    if @report.save
      redirect_to @report, notice: t('Report was successfully created')
    else
      render :new
    end
  end

  # PATCH/PUT /reports/1
  def update
    if @report.update(report_params)
      redirect_to @report, notice: t('Report was successfully updated')
    else
      render :edit
    end
  end

  # DELETE /reports/1
  def destroy
    @report.destroy
    redirect_to reports_url, notice: t('Report was successfully destroyed')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = current_user.reports.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def report_params
    params.require(:report).permit(:title, :body, :user)
  end
end
