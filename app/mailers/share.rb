class Share < ActionMailer::Base
  default :from => "railspundit.dcmanor@gmail.com"

  def by_email(bucket,name, to)
    @bucket = bucket
    @name = name
    mail(:to=>to, :subject=>"A new todo list has been shared with you")
  end
end
