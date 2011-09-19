class ContactsController < Spree::BaseController
  before_filter :load_topics
  
  def new
    @contact = Contact.new
  end
  
  def edit
    redirect_to new_contact_path
  end
  
  def create
    @contact = Contact.new(params[:contact] || {})
    if @contact.valid? &&  @contact.save
      #ContactMailer.message_email(@contact).deliver
      redirect_to(root_path, :notice => t("message_sended")) 
    else
      render :action => "new"
    end
    
  end
  
  private
  def load_topics
    @topics = Topic.all
  end
end
