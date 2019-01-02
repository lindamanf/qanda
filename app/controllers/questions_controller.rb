class QuestionsController < ApplicationController
  # onlyに指定した各メソッドを実行する前にbefore_actionに指定したメソッドを実行
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show
    # @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  # NewページでSaveが押された時(POSTされた時)に処理を実行
  def create  
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Save error!'
      render :new
    end
  end

  def edit
    # @question = Question.find(params[:id])
  end

  def update
    # @question = Question.find(params[:id])
    if @question.update(question_params)    
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Save error!'
      render :edit
    end
  end

  def destroy
    # @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path, notice: 'Success!'
  end
  
  # Strong Parameter
  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      # paramsにはフォームから送られたデータが入る
      # 特定のデータのみを登録する
      params.require(:question).permit(:name, :title, :content)
    end
end
