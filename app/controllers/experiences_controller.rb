class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :update, :edit, :destroy]
  before_action :sanitize_query, only: [:search]
  before_action :check_admin, only: [:edit, :destroy]

  def index
    @experiences = Experience.approved.paginate(page: params[:page])
  end

  def show; end

  def update
    if logged_in? && @experience.update(experience_params)
      redirect_to @experience, notice: t('experiences.show.admin.update_successful')
    else
      render action: 'edit'
    end
  end

  def new
    @experience = Experience.new
    @experience.cocktails.build
  end

  def create
    @experience = Experience.new(experience_params)

    if gotcha_valid? && @experience.save
      redirect_to experiences_path, notice: t('experiences.waiting_for_approval')
    else
      render :new
    end
  end

  def edit
    @experience.cocktails.build if @experience.cocktails.empty?
  end

  def destroy
    @experience.destroy

    redirect_to admin_path
  end

  private

  def set_experience
    @experience = Experience.friendly.approved.find(params[:id]) rescue Experience.none
  end

  def sanitize_query
    @query = params[:query].downcase.parameterize
  end

  def experience_params
    permitted_params = params.require(:experience).permit(experience_permitted_params)
    permitted_params.delete_if { |key, value| value.blank? }
  end

  def check_admin
    redirect_to experiences_path unless logged_in?
  end

  def experience_permitted_params
    experience_attributes = [:title, :pseudonym, :body, :set, :setting, :locale]
    experience_attributes << { cocktails_attributes: [:id, :substance, :dosage] }
  end
end
