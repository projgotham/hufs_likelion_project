class ResumesController < ApplicationController
   def index
      @resumes = Resume.all
   end
   
   def new
      @resume = Resume.new
   end
   
   def create
      @resume = Resume.new(resume_params)
      
      if @resume.save
         redirect_to resumes_path, notice: "지원서 \"#{@resume.name}\"(이)가 업로드되었습니다."
      else
         render "new"
      end
      
   end
   
   def destroy
      @resume = Resume.find(params[:id])
      @resume.destroy
      redirect_to resumes_path, notice:  "지원서 \" #{@resume.name}\"(이)가 삭제되었습니다."
   end
   
   private
   def resume_params
      params.require(:resume).permit(:name, :attachment)
   end
   
end
