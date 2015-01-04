class TagsController < ApplicationController
  include TagsHelper

  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = Tag.all
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    flash.notice = "Tag '#{@tag.name}' Deleted!"

    redirect_to tags_path
  end

  def new
    @tag = Tag.new
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save

    flash.notice = "Tag '#{@tag.name}' Created!"

    redirect_to tag_path(@tag)
  end

  def update
    @tag = Tag.find(params[:id])

    flash.notice = "Tag '#{@tag.name}' Updated!"

    redirect_to tag_path(@tag)
  end
end
