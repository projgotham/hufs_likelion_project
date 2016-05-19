require 'mailgun'


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
         
            mg_client = Mailgun::Client.new("key-890f288afa025bd29cd0c0b0113c11bf")
        
              # ruby form문에서 params하는 방법
              @name = params[:resume][:name]
              @email = params[:resume][:email]
           
              message_params =  {
                                 from:    'the7mincheol@gmail.com',
                                 to:      @email,
                                 subject: @name + "님, 멋쟁이사자처럼 외대(서울) 5기 지원이 완료되었습니다.",
                                 text:    @content,
                                 html:    '<html>
                                              <body>
                                                  <img src="https://goo.gl/B0okrn">
                                                  <h6 style="color: grey">이미지가 나오지 않을 경우, 이미지 버튼을 클릭하세요.</h6>
                                              </body>
                                          </html>'
                                }
              
              result = mg_client.send_message('sandboxc94a0cc35c5e48e395995f0d8673b63e.mailgun.org', message_params).to_h!
              
              message_id = result['id']
              message = result['message']
              
            redirect_to "/resumes/index", notice: "지원서 \"#{@resume.name}\"(이)가 업로드되었습니다.\r\n" + "지원 완료 메일을 확인해주세요."
      else
         render "/resumes/new"
      end
      
      # if @resume.save
      #    redirect_to resumes_path, notice: "지원서 \"#{@resume.name}\"(이)가 업로드되었습니다."
      # else
      #    render "new"
      # end
      
   end
   
   def destroy
      @resume = Resume.find(params[:id])
      @resume.destroy
      redirect_to "/resumes/index", notice:  "지원서 \" #{@resume.name}\"(이)가 삭제되었습니다."
   end
   
   private
   def resume_params
      params.require(:resume).permit(:name, :attachment, :email)
   end
   
end
