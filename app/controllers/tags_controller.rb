class TagsController < ApplicationController
  TAGGABLE_TYPES = %w(
    operation
    scenario
  )

  def index
    tags = if params[:q].blank?
             taggable.all_tags
           else
             taggable.
               tagged_with(params[:q], wild: true, any: true)
           end
    render json: tags.pluck(:name)
  end

  private

  def taggable
    TAGGABLE_TYPES.detect { |x| x == params[:type] }.classify.constantize
  end
end
