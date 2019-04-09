class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.valid?
      ContactsMailer.guest_message(contact_params).deliver_now

      redirect_to root_path, notice: 'Mail was send'
    else
      # binding.pry
      redirect_to contact_path, alert: 'Mail was not send'

    end
  end

  private

    def contact_params
        params.require(:contact).permit(:name, :email, :subject, :message)
    end

end
