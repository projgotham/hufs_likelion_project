class AttachmentUploader < CarrierWave::Uploader::Base
   storage :file
   
   def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
   end
   
   def extension_white_list
      %w(pdf doc htm html docx png jpeg hwp mp3) 
      # png jpeg hwp mp3 확장자 추가 160508
   end
end