class OrderMailer < ApplicationMailer
  def new_order_email
    mail(to: "aviedik.mltykhian@mail.ru", subject: "сделан заказ!")
  end
end
